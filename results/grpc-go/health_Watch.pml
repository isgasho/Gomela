#define lb_for92_0  -1
#define ub_for92_1  -1

typedef Chandef {
	chan in = [0] of {int};
	chan sending = [0] of {int};
	chan closing = [0] of {bool};
	chan is_closed = [0] of {bool};
}



init { 
	chan _ch0_in = [1] of {int};
	bool state = false;
	int i;
	Chandef _ch0;
	_ch0.in = _ch0_in;
	
	if
	:: true -> 
		_ch0.in!0
	:: true -> 
		_ch0.in!0
	fi;
	do
	:: true -> 
for10:		do
		:: _ch0.in?0 -> 
			
			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			break
		:: true -> 
			goto stop_process
		od
	od;
for10_exit:
stop_process:}
