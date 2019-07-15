Class {
	#name : #PPPreviousParser,
	#superclass : #PPDelegateParser,
	#category : #'PetitIslands-Extras'
}

{ #category : #parsing }
PPPreviousParser >> parseOn: aPPContext [
	| result position |
	(aPPContext position > 0) ifTrue: [  
		position := aPPContext position.
		aPPContext back.
		result := parser parseOn: aPPContext.
		aPPContext position: position.
		^ result
	].
	^ PPFailure message: 'At the beginning of a stream' at: 0
	
]
