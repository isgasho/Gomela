#define lb_for80_0  -1
#define ub_for80_1  -1




init { 
	bool state = false;
	int i;
	
	if
	:: true -> 
		
		if
		:: lb_for80_0 != -1 && ub_for80_1 != -1 -> 
						for(i : lb_for80_0.. ub_for80_1) {
for10:
			}
		:: else -> 
			do
			:: true -> 
for10:
			:: true -> 
				break
			od
		fi;
for10_exit:
	fi;
	goto stop_process
stop_process:}

