#define lb_for143_0  -1
#define ub_for143_1  -1




init { 
	bool state = false;
	int i;
	
	if
	:: lb_for143_0 != -1 && ub_for143_1 != -1 -> 
				for(i : lb_for143_0.. ub_for143_1) {
for10:			
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
			fi
		:: true -> 
			break
		od
	fi;
for10_exit:
stop_process:}

