



init { 
	bool state = false;
	int i;
	do
	:: true -> 
for10:		
		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		do
		:: true -> 
for11:
		od
	od;
	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:}

