



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
		
		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	od;
	do
	:: true -> 
for20:
	od;
	do
	:: true -> 
for30:
	od;
	do
	:: true -> 
for40:
	od;
	goto stop_process
stop_process:}

