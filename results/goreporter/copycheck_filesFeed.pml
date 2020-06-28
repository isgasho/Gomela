#define lb_for80_0  -1
#define ub_for80_1  -1

typedef Chandef {
	chan in = [0] of {int};
	chan sending = [0] of {int};
	chan closing = [0] of {bool};
	chan is_closed = [0] of {bool};
}



init { 
	bool state = false;
	int i;
	
	if
	:: true -> 
		Chandef _ch0;
		chan _ch0_in = [0] of {int};
		_ch0.in = _ch0_in;
		run chanMonitor(_ch0);
		run Anonymous0(_ch0);
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:}

proctype Anonymous0(Chandef _ch0) {
	bool closed; 
	int i;
	
	if
	:: lb_for80_0 != -1 && ub_for80_1 != -1 -> 
				for(i : lb_for80_0.. ub_for80_1) {
for10:			_ch0.in!0;
			_ch0.sending?state
		}
	:: else -> 
		do
		:: true -> 
for10:			_ch0.in!0;
			_ch0.sending?state
		:: true -> 
			break
		od
	fi;
for10_exit:	_ch0.closing!true;
stop_process:
}
proctype chanMonitor(Chandef ch) {
	bool closed; 
	int i;
	state = false;
	do
	:: true -> 
		if
		:: state -> 
end:			if
			:: ch.sending!state -> 
				assert(false)
			:: ch.closing?true -> 
				assert(false)
			:: ch.in!0;
			:: ch.is_closed!state;
			fi
		:: else -> 
end1:			if
			:: ch.sending!state;
			:: ch.closing?true -> 
				state = true
			:: ch.is_closed!state;
			fi
		fi
	od;
stop_process:
}