#define lb_for729_0  -1
#define ub_for729_1  -1




init { 
	bool state = false;
	int i;
	
	if
	:: lb_for729_0 != -1 && ub_for729_1 != -1 -> 
				for(i : lb_for729_0.. ub_for729_1) {
for10:			
			if
			:: true -> 
				break
			:: true;
			fi;
			do
			:: true -> 
for11:
			od;
			
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
				break
			:: true;
			fi;
			do
			:: true -> 
for11:
			od;
			
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

