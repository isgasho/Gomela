



init { 
	bool state = false;
	int i;
	do
	:: true -> 
for10:
	od;
	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	do
	:: true -> 
for20:		
		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	od;
	goto stop_process
stop_process:}

