"
Return the current column in the input
"
Class {
	#name : #PPColumnParser,
	#superclass : #PPParser,
	#category : #'PetitIndent-Offside-rule'
}

{ #category : #analysis }
PPColumnParser >> acceptsEpsilon [
	^ true
]

{ #category : #parsing }
PPColumnParser >> parseOn: context [
	^ context column
]
