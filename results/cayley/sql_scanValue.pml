



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
	od;
	
	if
	:: true -> 
		do
		:: true -> 
for30:			
			if
			:: true -> 
				goto stop_process
			:: true;
			fi
		od;
		goto stop_process
	:: true;
	fi;
	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:}

