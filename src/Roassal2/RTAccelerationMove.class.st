Class {
	#name : #RTAccelerationMove,
	#superclass : #RTLinearMove,
	#category : #'Roassal2-Animation'
}

{ #category : #public }
RTAccelerationMove >> to: anEndPoint during: seconds on: anElement [
	| position |
	element := anElement.
	
	position := anElement position.
	animatedValue := TRVIAnimatedValue new
							evaluator: [ :t | position interpolateTo: anEndPoint at: (t sqrt) ];
							timer: (TRVITimer new cycleLength: seconds);
							yourself.
	
]
