package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/fatih/color"
)

const (
	SOURCE_FOLDER  = "./source"  // The folder containing the projects to verify
	RESULTS_FOLDER = "./results" // The folder where the models of the projects in /source are placed
)

type ProjectResult struct {
	Name             string            // the name of the project
	Num_states       int               // The overall number of states needed to verify the whole program
	Infer_timing     int               // time in milli to infer the promela model
	Models           []VerificationRun // Verification run for all Models
	Safety_error     bool              // is there any safety errors
	Global_deadlock  bool              // is there any global deadlock
	Spin_timing      int               // time in milli to verify the program with spin
	Godel_timing     int               // time in milli to verify the program with godel
	Migoinfer_timing int               // time in milli to model the program with migoinfer
}

type VerificationRun struct {
	Spin_timing      int  // time in milli to verify the program
	Safety_error     bool // is there any safety errors
	Global_deadlock  bool // is there any global deadlock
	Partial_deadlock bool // is there any partial deadlock
	Num_states       int  // the number of states in the model
}

func main() {

	if len(os.Args) > 1 {
		path, _ := filepath.Abs("./tests")

		packages := []string{path}

		f, ast_map := GenerateAst(packages)
		ParseAst(f, "test", ast_map)

		return
	}

	os.RemoveAll(RESULTS_FOLDER)
	os.Mkdir(RESULTS_FOLDER, os.ModePerm)
	files, e := ioutil.ReadDir(SOURCE_FOLDER)

	if e != nil {
		fmt.Printf("Could not open folder /source %q: %v\n", os.Args[1], e)
		return
	}

	for _, dir := range files {
		if dir.IsDir() {
			fmt.Println("Infering : " + dir.Name())

			path, _ := filepath.Abs(SOURCE_FOLDER + "/" + dir.Name())

			packages := []string{}
			filepath.Walk(path, func(path string, file os.FileInfo, err error) error {
				if file.IsDir() {
					if file.Name() != "vendor" && file.Name() != "tests" {
						packages = append(packages, path)
					} else {
						return filepath.SkipDir
					}
				}
				return nil
			})
			inferProject(path, dir.Name(), packages)
		}
	}

	return
}

func inferProject(path string, dir_name string, packages []string) {

	// Partition program
	f, ast_map := GenerateAst(packages)
	ParseAst(f, dir_name, ast_map)

	models, err := ioutil.ReadDir(RESULTS_FOLDER + "/" + dir_name)
	if err != nil {
		fmt.Println("Could not read folder :", RESULTS_FOLDER+"/"+dir_name)
	}

	// verify each model
	for _, model := range models {
		if strings.HasSuffix(model.Name(), ".pml") { // make sure its a .pml file
			fmt.Println("Verifying model : " + model.Name())
			ver := VerificationRun{Safety_error: true, Partial_deadlock: true, Global_deadlock: true}
			path, _ := filepath.Abs(RESULTS_FOLDER + "/" + dir_name + "/" + model.Name())
			var output bytes.Buffer

			// Verify with SPIN
			command := exec.Command("spin", "-run", "-m1000000", "-w26", path, "-f")
			command.Stdout = &output
			command.Run()

			parseResults(output.String(), &ver)

			fmt.Println("-------------------------------")
			fmt.Println("Result for " + model.Name())
			fmt.Println("Number of states : ", ver.Num_states)
			fmt.Println("Time to verify model : ", ver.Spin_timing, " ms")
			fmt.Printf("Channel safety error : %s.\n", colorise(ver.Safety_error))
			fmt.Printf("Global deadlock : %s.\n", colorise(ver.Global_deadlock))
			fmt.Println("-------------------------------")
		}
	}

}

func colorise(flag bool) string {

	green := color.New(color.FgGreen).SprintFunc()
	red := color.New(color.FgRed).SprintFunc()

	if flag {
		return red("true")
	}

	return green("false")
}

func parseResults(result string, ver *VerificationRun) {

	if !strings.Contains(result, "assertion violated") {
		ver.Safety_error = false
	}
	if strings.Contains(result, "errors: 0") {
		ver.Global_deadlock = false
	}

	// Calculates the number of states

	splitted := strings.Split(result, "\n")
	for _, line := range splitted {
		if strings.Contains(line, "states, stored") {

			lines := strings.Split(line, "states, stored")
			r := strings.Replace(lines[0], " ", "", -1)

			states, err := strconv.Atoi(r)
			if err != nil {
				fmt.Println("There was an error in parsing the number of states : ", r)
			}

			ver.Num_states = states
		}
	}
}

func tickIt(tick bool) string {
	if !tick {
		return "\\cmark"
	} else {
		return "\\xmark"
	}
}
