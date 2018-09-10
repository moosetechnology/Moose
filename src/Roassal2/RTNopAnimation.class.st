"
A RTNopAnimation simply wait. This is useful to temporize
"
Class {
	#name : #RTNopAnimation,
	#superclass : #RTAnimation,
	#instVars : [
		'animatedValue',
		'trachelCanvas',
		'blockToExecute'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #actions }
RTNopAnimation >> addedIn: aTrachelCanvas [
	trachelCanvas := aTrachelCanvas
]

{ #category : #accessing }
RTNopAnimation >> blockToExecute [
	^ blockToExecute
]

{ #category : #accessing }
RTNopAnimation >> blockToExecute: aZeroArgBlock [
	blockToExecute := aZeroArgBlock
]

{ #category : #testing }
RTNopAnimation >> hasCompleted [
	^ animatedValue hasCompleted
]

{ #category : #initialization }
RTNopAnimation >> initialize [
	super initialize.
	blockToExecute := [  ]
]

{ #category : #actions }
RTNopAnimation >> refresh [
	animatedValue value.
	trachelCanvas signalUpdate
]

{ #category : #actions }
RTNopAnimation >> repeat [
	animatedValue timer repeat.
]

{ #category : #'waiting-specific' }
RTNopAnimation >> start [
	animatedValue start.
	trachelCanvas signalUpdate
]

{ #category : #'waiting-specific' }
RTNopAnimation >> waitFor: seconds [
	animatedValue := TRVIAnimatedValue new
							evaluator: [ :t | blockToExecute value ];
							timer: (TRVITimer new cycleLength: seconds);
							yourself.
	
]

{ #category : #'waiting-specific' }
RTNopAnimation >> waitFor: seconds after: aBlock [
	animatedValue := TRVIAnimatedValue new
							evaluator: [ :t | ];
							finishCallback: aBlock;
							timer: (TRVITimer new cycleLength: seconds);
							yourself.
	
]
