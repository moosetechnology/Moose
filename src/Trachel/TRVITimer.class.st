"
I am using system time to implement a timer.

[ [ [ 		 
	| v timer t e |
	v := RTView new.

	timer := VITimer new cycleLength: 2.
	t := VIAnimatedValue new.
	t evaluator: [ :time | 0 interpolateTo: 100 at: time ].
	t timer: timer.
	timer start.
	timer repeat.

	e := (RTEllipse new size: 30) element.

	v add: e.
	e translateTo: t @ t.

	v addMenu: 'refresh' callback: [ v signalUpdate ].
	v
] ] ]
"
Class {
	#name : #TRVITimer,
	#superclass : #TRVIBasicTimer,
	#instVars : [
		'active',
		'cycleLength',
		'repeat',
		'startTime',
		'elapsedCycles'
	],
	#category : #'Trachel-Viva'
}

{ #category : #private }
TRVITimer >> currentTime [
	^ Time millisecondClockValue 
]

{ #category : #accessing }
TRVITimer >> cycleLength [
	^ cycleLength
]

{ #category : #accessing }
TRVITimer >> cycleLength: anObject [
	cycleLength := anObject
]

{ #category : #private }
TRVITimer >> cycleLengthScale [
	"cycle length are given in seconds,
	while internally we using milliseconds to calculate time difference, hence scale is equal to 1000"
	
	^ 1000.0
]

{ #category : #accessing }
TRVITimer >> elapsedCycles [

	"Answer the total number of cycles passed during which timer was active since its first activation.
	For example, if timer's cycle length is 2 seconds, and its total active time is 3.5 seconds,
	a total number of elapsed cycles will be 3.5 / 2 = 1.75.
	
	Suspending timer (stopping then starting after a while) does not contributes to elapsedCycles, e.g.:
	for fresh timer with 4 seconds cycle, we start timer, run for 0.5 seconds, then stop it,
	wait for arbitrary amound of time, then start it again and run for extra 0.5 seconds,
	the measures elapsedCycles value will be equal to 1/4 .
	
	As you may guess, for non-repeating timer, the elapsed cycles value can never be
	greater than 1 (timer always stops at 1 and never advanced since then).
	
	Resetting timer sets elapsed cycles to zero.
	" 
	
	| cycles |
	active ifFalse: [  ^ elapsedCycles  ].

	cycles := elapsedCycles + (self elapsedTime / cycleLength).

	(repeat value not and: [ cycles  >= 1.0 ]) ifTrue: [ 
		active := false.
		^ elapsedCycles := 1.0
	].	
	^ cycles
]

{ #category : #private }
TRVITimer >> elapsedTime [
	^  (self currentTime - startTime) / self cycleLengthScale

]

{ #category : #'initialize-release' }
TRVITimer >> initialize [
	"defaults"
	repeat := false.
	cycleLength := 1.0.
	
	self reset.
]

{ #category : #testing }
TRVITimer >> isActive [
	self value. "making sure it will stop if cycle time elapsed for non-repeating timer"
	
	^ active
]

{ #category : #testing }
TRVITimer >> isRepeating [
	^ repeat 
]

{ #category : #accessing }
TRVITimer >> noRepeat [
	"make receiver to be non-repeating timer (stops once first cycle elapses)"
	repeat := false 
]

{ #category : #accessing }
TRVITimer >> repeat [
	"make receiver to be a repeating timer"
	repeat := true 
]

{ #category : #accessing }
TRVITimer >> repeat: veces [
	"make receiver to be a repeating timer"
	repeat := [elapsedCycles < veces ]
]

{ #category : #actions }
TRVITimer >> reset [
	"Reset the timer: stopping it, if it was active,
	and setting its internal elapsed cycles counter to Zero "
	
	active := false.
	elapsedCycles := 0.0.

]

{ #category : #actions }
TRVITimer >> start [
	"Activate (start or resume) the timer.
	Ignored if timer is already active"
	
	active ifFalse: [
		startTime := self currentTime.
		active := true.
	].

]

{ #category : #accessing }
TRVITimer >> startTime [
	^ startTime
]

{ #category : #actions }
TRVITimer >> stop [
	"Stop/pausing the timer "
	
	active ifTrue: [
		elapsedCycles := self elapsedCycles.
		active := false.
	].

]

{ #category : #accessing }
TRVITimer >> value [
	"Answer the current timer value.
	The value is normalized in range between 0 and 1
	relative to cycle length and elapsed time since timer started, e.g.
	if cycle length is 0:01:00
	and elapsed time is 0:00:30,
	the value will be 0.5 (half of a minute).
	For repeating timer the value goes from 0 to 1, then repeats over.
	For non-repeating timer, when value reaching 1, timer stops.
	If timer is inactive, answer the phase of cycle where it was stopped.
	"
	| cycles |

	active ifFalse: [ 
		^ repeat 
			ifTrue: [ elapsedCycles fractionPart ]
			ifFalse: [ elapsedCycles min: 1.0 ]
	].

	cycles := self elapsedCycles.
	active ifFalse: [
		 "non-repeating timer was stopped" 
		^ 1.0
	].	
	 
	^  cycles fractionPart.

]
