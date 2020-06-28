
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
	run chanMonitor(_ch0);
	run Anonymous0(_ch0);
	goto stop_process
stop_process:}

proctype suffixtreewalkTrans4(Chandef ch;chan child) {
	bool closed; 
	int i;
	
	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	do
	:: true -> 
for10:		chan child_suffixtreewalkTrans40 = [0] of {int};
		run suffixtreewalkTrans4(child_suffixtreewalkTrans40);
		child_suffixtreewalkTrans40?0
	od;
	
	if
	:: true -> 
		ch.in!0;
		ch.sending?state
	:: true;
	fi;
	goto stop_process;
	child!0;
stop_process:
}
proctype Anonymous0(Chandef _ch0) {
	bool closed; 
	int i;
	chan child_suffixtreewalkTrans41 = [0] of {int};
	run suffixtreewalkTrans4(_ch0,child_suffixtreewalkTrans41);
	child_suffixtreewalkTrans41?0;
	_ch0.closing!true;
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