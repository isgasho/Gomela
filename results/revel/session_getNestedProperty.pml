#define keys  -1




init { 
	bool state = false;
	int i;
	
	if
	:: 1 != -1 && len(keys)-1 != -1 -> 
				for(i : 1.. len(keys)-1) {
for10:			
			if
			:: true -> 
				goto stop_process
			:: true;
			fi
		}
	:: else -> 
		do
		:: true -> 
for10:			
			if
			:: true -> 
				goto stop_process
			:: true;
			fi
		:: true -> 
			break
		od
	fi;
for10_exit:	goto stop_process
stop_process:}

