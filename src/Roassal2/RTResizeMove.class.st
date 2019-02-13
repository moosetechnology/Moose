Class {
	#name : #RTResizeMove,
	#superclass : #RTAnimation,
	#instVars : [
		'originalExtent',
		'animatedValue'
	],
	#category : #'Roassal2-Animation'
}

{ #category : #actions }
RTResizeMove >> addedIn: trachelCanvas [
	"We make sure that there is no existing resize animation in the animation queue."
	| conflictingAnimations |
	conflictingAnimations := trachelCanvas animations 
					select: [ :anim | (anim class == self class 
										and: [ anim element == element ])
										and: [ self ~~ anim ] ].
	trachelCanvas animationsRemoveAll: conflictingAnimations. 

]

{ #category : #accessing }
RTResizeMove >> after: aBlock [
	animatedValue finishCallback: aBlock
]

{ #category : #testing }
RTResizeMove >> hasCompleted [
	^ animatedValue hasCompleted
]

{ #category : #refreshing }
RTResizeMove >> refresh [
	| t |
	t := animatedValue value.
	element extent: t.
	element signalUpdate.
]

{ #category : #actions }
RTResizeMove >> start [
	animatedValue start
]

{ #category : #public }
RTResizeMove >> toExtent: toExtent during: numberOfSeconds on: anElement [
	element := anElement.
	originalExtent := anElement extent.
	
	animatedValue := TRVIAnimatedValue new
									evaluator: [ :t | originalExtent interpolateTo: toExtent at: t ];
									timer: (TRVITimer new cycleLength: numberOfSeconds);
									yourself.
	
]

{ #category : #public }
RTResizeMove >> toExtent: toExtent on: anElement [
	^ self toExtent: toExtent during: 1 on: anElement
]
