



init { 
	bool state = false;
	int i;
	
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
	:: 0 != -1 && len(req.Attributes)-1 != -1 -> 
				for(i : 0.. len(req.Attributes)-1) {
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
for10_exit:	do
	:: true -> 
for20:		

		if
		:: true -> 
			
			if
			:: true -> 
				
				if
				:: true -> 
					break
				:: true;
				fi
			fi
		:: true;
		fi;
		

		if
		:: true;
		:: true;
		fi
	od;
	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:}

