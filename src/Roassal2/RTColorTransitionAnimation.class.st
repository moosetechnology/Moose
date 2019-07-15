Class {
	#name : #RTColorTransitionAnimation,
	#superclass : #RTAnimation,
	#instVars : [
		'animatedValue',
		'colorNormalizer'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #testing }
RTColorTransitionAnimation >> hasCompleted [
	^ animatedValue hasCompleted
]

{ #category : #refreshing }
RTColorTransitionAnimation >> refresh [
	| color |
	color := animatedValue value.
	element trachelShape color: color.
	"element trachelShape resetPath."
	element trachelShape canvas signalUpdate.
]

{ #category : #actions }
RTColorTransitionAnimation >> start [
	animatedValue start
]

{ #category : #public }
RTColorTransitionAnimation >> toColor: finalColor during: numberOfSeconds on: anElement [
	
	element := anElement.
	colorNormalizer := RTNColorLinearNormalizer
		inContext: ((0 to: 1 by: 1/(30 * numberOfSeconds)) collect: #yourself)
		lowColor: anElement trachelShape color
		highColor: finalColor.
		
	animatedValue := TRVIAnimatedValue new
							evaluator: [ :t | colorNormalizer rtValue: t ];
							timer: (TRVITimer new cycleLength: numberOfSeconds);
							yourself.
]
