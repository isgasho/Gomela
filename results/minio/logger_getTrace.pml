#define lb_for241_0  -1
#define ub_for241_1  -1




init { 
	bool state = false;
	int i;
	
	if
	:: lb_for241_0 != -1 && ub_for241_1 != -1 -> 
				for(i : lb_for241_0.. ub_for241_1) {
for10:			
			if
			:: true -> 
				do
				:: true -> 
for11:					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi
				od
			:: true;
			fi
		}
	:: else -> 
		do
		:: true -> 
for10:			
			if
			:: true -> 
				do
				:: true -> 
for11:					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi
				od
			:: true;
			fi
		:: true -> 
			break
		od
	fi;
for10_exit:	goto stop_process
stop_process:}

