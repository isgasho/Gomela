#define lb_for874_0  -1
#define ub_for874_1  -1
#define lb_for877_2  -1
#define ub_for877_3  -1




init { 
	bool state = false;
	int i;
	
	if
	:: lb_for874_0 != -1 && ub_for874_1 != -1 -> 
				for(i : lb_for874_0.. ub_for874_1) {
for10:			
			if
			:: lb_for877_2 != -1 && ub_for877_3 != -1 -> 
								for(i : lb_for877_2.. ub_for877_3) {
for11:					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi;
					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi;
					
					if
					:: true -> 
						break
					:: true;
					fi
				}
			:: else -> 
				do
				:: true -> 
for11:					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi;
					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi;
					
					if
					:: true -> 
						break
					:: true;
					fi
				:: true -> 
					break
				od
			fi;
for11_exit:			
			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			
			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			

			if
			:: true -> 
				
				if
				:: true -> 
					goto stop_process
				:: true;
				fi;
				
				if
				:: true -> 
					goto stop_process
				:: true;
				fi;
				
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
			fi
		}
	:: else -> 
		do
		:: true -> 
for10:			
			if
			:: lb_for877_2 != -1 && ub_for877_3 != -1 -> 
								for(i : lb_for877_2.. ub_for877_3) {
for11:					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi;
					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi;
					
					if
					:: true -> 
						break
					:: true;
					fi
				}
			:: else -> 
				do
				:: true -> 
for11:					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi;
					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi;
					
					if
					:: true -> 
						break
					:: true;
					fi
				:: true -> 
					break
				od
			fi;
for11_exit:			
			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			
			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			

			if
			:: true -> 
				
				if
				:: true -> 
					goto stop_process
				:: true;
				fi;
				
				if
				:: true -> 
					goto stop_process
				:: true;
				fi;
				
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
			fi
		:: true -> 
			break
		od
	fi;
for10_exit:	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:}

