Class {
	#name : #RTActiveAnimation,
	#superclass : #RTAnimation,
	#instVars : [
		'blockToExecute',
		'view',
		'intervalInMilliseconds',
		'lastRefresh'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #accessing }
RTActiveAnimation >> blockToExecute [
	^ blockToExecute
]

{ #category : #accessing }
RTActiveAnimation >> blockToExecute: anObject [
	blockToExecute := anObject
]

{ #category : #testing }
RTActiveAnimation >> hasCompleted [
	^ false
]

{ #category : #public }
RTActiveAnimation >> inView: aView [
	view := aView.
	super inView: aView
]

{ #category : #initialization }
RTActiveAnimation >> initialize [
	super initialize.
	blockToExecute := [  ].
	intervalInMilliseconds := 5.
	lastRefresh := Time now
]

{ #category : #accessing }
RTActiveAnimation >> intervalInMilliseconds [
	^ intervalInMilliseconds
]

{ #category : #accessing }
RTActiveAnimation >> intervalInMilliseconds: numberOfMillisecondsToWaitBeforeRefresh [
	"Set the number of milliseconds to wait for a refresh"
	intervalInMilliseconds := numberOfMillisecondsToWaitBeforeRefresh
]

{ #category : #refreshing }
RTActiveAnimation >> refresh [ 
	(Time now asMilliSeconds - lastRefresh asMilliSeconds) > intervalInMilliseconds
		ifTrue: [ blockToExecute value. lastRefresh := Time now. ].
	view ifNotNil: [ view canvas signalUpdate ].
]

{ #category : #actions }
RTActiveAnimation >> start [
	view ifNil: [ ^ self ].
	view canvas signalUpdate
]
