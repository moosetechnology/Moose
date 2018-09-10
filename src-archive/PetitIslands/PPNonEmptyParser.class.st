"
I return failure, if the delegate parser did not consumed any input.
"
Class {
	#name : #PPNonEmptyParser,
	#superclass : #PPDelegateParser,
	#category : #'PetitIslands-Parsers'
}

{ #category : #'*petitislands' }
PPNonEmptyParser >> acceptsEpsilon [
	^ false
]

{ #category : #analysis }
PPNonEmptyParser >> isNullable [
	^ false
]

{ #category : #parsing }
PPNonEmptyParser >> nonEmpty [
	^ self
]

{ #category : #parsing }
PPNonEmptyParser >> parseOn: aPPContext [
	| memento result |
	memento := aPPContext remember.
	result := parser parseOn: aPPContext.
	

	((memento position == aPPContext position) and: [ result isPetitFailure not ]) ifTrue: [ 
		aPPContext restore: memento.
		^ PPFailure message: 'Epsilon parse not allowed' context: aPPContext
	].
	^ result
]
