#define lb_for77_0  -1
#define ub_for77_1  -1




init { 
	bool state = false;
	int i;
	do
	:: true -> 
for10:		
		if
		:: lb_for77_0 != -1 && ub_for77_1 != -1 -> 
						for(i : lb_for77_0.. ub_for77_1) {
for11:
			}
		:: else -> 
			do
			:: true -> 
for11:
			:: true -> 
				break
			od
		fi;
for11_exit:
	od;
	goto stop_process
stop_process:}

