#define lb_for60_0  -1
#define ub_for60_1  -1

typedef Chandef {
	chan in = [0] of {int};
	chan sending = [0] of {int};
	chan closing = [0] of {bool};
	chan is_closed = [0] of {bool};
}



init { 
	chan _ch0_in = [0] of {int};
	bool state = false;
	int i;
	Chandef _ch0;
	_ch0.in = _ch0_in;
	run Anonymous0(_ch0);
	_ch0.in!0;
	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:}

proctype Anonymous0(Chandef _ch0) {
	bool closed; 
	int i;
	
	if
	:: lb_for60_0 != -1 && ub_for60_1 != -1 -> 
				for(i : lb_for60_0.. ub_for60_1) {
for10:			do
			:: _ch0.in?0 -> 
				break
			:: true -> 
				break
			od
		}
	:: else -> 
		do
		:: true -> 
for10:			do
			:: _ch0.in?0 -> 
				break
			:: true -> 
				break
			od
		:: true -> 
			break
		od
	fi;
for10_exit:stop_process:
}
