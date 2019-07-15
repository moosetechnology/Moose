"
A VIAnimatedValue is A representation of some property value animated in certain kind of time.

The main idea is you can change some property in some time.
in evaluator, recibe a block to handle as f(t).


"
Class {
	#name : #TRVIAnimatedValue,
	#superclass : #TRObject,
	#instVars : [
		'evaluator',
		'timer',
		'finishCallback'
	],
	#category : #'Trachel-Viva'
}

{ #category : #grouping }
TRVIAnimatedValue >> + aValue [

	^ [ self value + aValue value ]

"	self error: 'Not supported yet'"

"	^VIAnimatedGroup new 
		add:self;
		add:aVIAnimatedValue."
]

{ #category : #sequence }
TRVIAnimatedValue >> , aVIAnimatedValue [ 
	self error: 'Not yet supported'
"	^VIAnimatedSecuence new
		add:self;
		add:aVIAnimatedValue.
	"
]

{ #category : #grouping }
TRVIAnimatedValue >> - aValue [

	^ [ self value - aValue value ]

]

{ #category : #converting }
TRVIAnimatedValue >> @ anotherValue [
	^ TRVIAnimatedPoint new x: self; y: anotherValue; yourself
]

{ #category : #converting }
TRVIAnimatedValue >> adaptToNumber: rcvr andSend: selector [
	^ self value perform: selector with: rcvr
]

{ #category : #actions }
TRVIAnimatedValue >> animatedPoint: aPoints [
	| pnts |
	pnts := aPoints asSortedCollection.
	self evaluator: [ :t |
		| inicial fin |
		inicial := nil.
		fin := nil.
		
		pnts do:[ :e | 
	 	    e key <= t 
			ifTrue: [ inicial:= e ] 
			ifFalse:[fin isNil ifTrue:[fin:= e] ]
	 	].
		inicial value interpolateTo: fin value at: t.
	 ].
]

{ #category : #actions }
TRVIAnimatedValue >> animatedValue: values [
	| val fraction currentValue |
	fraction := 1.0 / (values size -1).
	currentValue:= 0.
	self animatedPoint: 
		(values collect: [ :e | val := currentValue -> e. currentValue:= currentValue + fraction. val]).
]

{ #category : #accessing }
TRVIAnimatedValue >> animationDidFinish [
	timer value = 1.0
		ifTrue: [ finishCallback value ].
]

{ #category : #converting }
TRVIAnimatedValue >> asFloat [
	^ self value asFloat
]

{ #category : #accessing }
TRVIAnimatedValue >> evaluator [
	
	^ evaluator
]

{ #category : #accessing }
TRVIAnimatedValue >> evaluator: anObject [
	evaluator := anObject
]

{ #category : #accessing }
TRVIAnimatedValue >> finishCallback: anObject [
	finishCallback := anObject
]

{ #category : #testing }
TRVIAnimatedValue >> hasCompleted [
	^ timer value = 1.0
]

{ #category : #initialization }
TRVIAnimatedValue >> initialize [
	super initialize.
	timer := TRVITimer new.
	evaluator := [ :time | time ]
]

{ #category : #actions }
TRVIAnimatedValue >> reset [
	timer reset
]

{ #category : #actions }
TRVIAnimatedValue >> start [
	timer start
]

{ #category : #actions }
TRVIAnimatedValue >> stop [
	timer stop
]

{ #category : #accessing }
TRVIAnimatedValue >> timer [
	^ timer
]

{ #category : #accessing }
TRVIAnimatedValue >> timer: anObject [
	timer := anObject
]

{ #category : #accessing }
TRVIAnimatedValue >> value [
	" evaluate the value of receiver at current time "
	self animationDidFinish.
	^ evaluator value: timer value
]
