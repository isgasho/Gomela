
typedef Chandef {
	chan in = [0] of {int};
	chan sending = [0] of {int};
	chan closing = [0] of {bool};
	chan is_closed = [0] of {bool};
}



init { 
	bool state = false;
	chan child_copycheckprintDupls10 = [0] of {int};
	chan _ch0_in = [0] of {int};
	int i;
	Chandef _ch0;
	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	_ch0.in = _ch0_in;
	run chanMonitor(_ch0);
	run Anonymous0(_ch0);
	run copycheckprintDupls1(_ch0,child_copycheckprintDupls10);
	child_copycheckprintDupls10?0;
	goto stop_process
stop_process:}

proctype Anonymous0(Chandef _ch0) {
	bool closed; 
	int i;
	do
	:: true -> 
for10:		
		if
		:: true -> 
			_ch0.in!0;
			_ch0.sending?state
		:: true;
		fi
	od;
	_ch0.closing!true;
stop_process:
}
proctype copycheckprintDupls1(Chandef duplChan;chan child) {
	bool closed; 
	int i;
	do
	:: true -> 
for20:
	od;
	do
	:: true -> 
for30:
	od;
	do
	:: true -> 
for40:
	od;
	goto stop_process;
	child!0;
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