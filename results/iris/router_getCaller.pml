#define lb_for333_0  -1
#define ub_for333_1  -1




init { 
	bool state = false;
	int i;
	
	if
	:: lb_for333_0 != -1 && ub_for333_1 != -1 -> 
				for(i : lb_for333_0.. ub_for333_1) {
for10:			
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
for10:			
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
for10_exit:	goto stop_process
stop_process:}

