#define lb_for609_0  -1
#define ub_for609_1  -1




init { 
	bool state = false;
	int i;
	
	if
	:: lb_for609_0 != -1 && ub_for609_1 != -1 -> 
				for(i : lb_for609_0.. ub_for609_1) {
for10:			
			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			do
			:: true -> 
for11:
			od
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
			do
			:: true -> 
for11:
			od
		:: true -> 
			break
		od
	fi;
for10_exit:	goto stop_process
stop_process:}

