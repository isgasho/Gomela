



init { 
	bool state = false;
	int i;
	
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
		fi
	:: true -> 
		
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
			fi
		:: true -> 
			
			if
			:: true -> 
				goto stop_process
			:: true -> 
				
				if
				:: true -> 
					
					if
					:: true -> 
						goto stop_process
					:: true;
					fi
				:: true -> 
					
					if
					:: true -> 
						
						if
						:: true -> 
							goto stop_process
						:: true;
						fi
					:: true;
					fi
				fi
			fi
		fi
	fi;
	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:}

