#define lb_for59_0  -1
#define ub_for59_1  -1




init { 
	bool state = false;
	int i;
	
	if
	:: lb_for59_0 != -1 && ub_for59_1 != -1 -> 
				for(i : lb_for59_0.. ub_for59_1) {
for10:			do
			:: true -> 
				goto stop_process
			:: true -> 
				break
			od;
			do
			:: true -> 
for11:
			od
		}
	:: else -> 
		do
		:: true -> 
for10:			do
			:: true -> 
				goto stop_process
			:: true -> 
				break
			od;
			do
			:: true -> 
for11:
			od
		:: true -> 
			break
		od
	fi;
for10_exit:
stop_process:}

