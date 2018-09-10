"
I implement negation of specifications.

I can be created by:
	
	SpecOfNegation of: (Instance of: String) and: (Instance of: Integer)
"
Class {
	#name : #SpecOfNegation,
	#superclass : #SpecOfComplexState,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfNegation >> basicMatches: anObject [

	^specs allSatisfy: [ :each | 
		each denial: denial not.
		each matches: anObject ]
]

{ #category : #printing }
SpecOfNegation >> operatorName [
	^'or'
]

{ #category : #validation }
SpecOfNegation >> validate: anObject [ 
	| result |
	specs do: [:spec | 
			result := spec denial: denial not; validate: anObject.
			result isFailure ifTrue: [^result]].
	^SpecOfValidationResult success
]
