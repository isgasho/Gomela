#define lb_for123_0  -1
#define ub_for123_1  -1

typedef Chandef {
	chan in = [0] of {int};
	chan sending = [0] of {int};
	chan closing = [0] of {bool};
	chan is_closed = [0] of {bool};
}



init { 
	chan _ch0_in = [len(c.clients)] of {int};
	bool state = false;
	int i;
	Chandef _ch0;
	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	_ch0.in = _ch0_in;
	do
	:: true -> 
for10:		run Anonymous0(_ch0)
	od;
	
	if
	:: lb_for123_0 != -1 && ub_for123_1 != -1 -> 
				for(i : lb_for123_0.. ub_for123_1) {
for20:			
			if
			:: true -> 
				break
			:: true;
			fi;
			do
			:: _ch0.in?0 -> 
				break
			:: true -> 
				goto stop_process
			od
		}
	:: else -> 
		do
		:: true -> 
for20:			
			if
			:: true -> 
				break
			:: true;
			fi;
			do
			:: _ch0.in?0 -> 
				break
			:: true -> 
				goto stop_process
			od
		:: true -> 
			break
		od
	fi;
for20_exit:	goto stop_process
stop_process:}

proctype Anonymous0(Chandef _ch0) {
	bool closed; 
	int i;
	_ch0.in!0;
stop_process:
}
