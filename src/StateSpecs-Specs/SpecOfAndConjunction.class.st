"
I implement conjunction of specifications.

I can be created by & message to spec:
	
	(Instance of: String) & (Satisfying for: [:o | true])
"
Class {
	#name : #SpecOfAndConjunction,
	#superclass : #SpecOfComplexState,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfAndConjunction >> basicMatches: anObject [

	^specs allSatisfy: [ :each | 
		each matches: anObject ]
]

{ #category : #printing }
SpecOfAndConjunction >> operatorName [
	^'and'
]

{ #category : #validation }
SpecOfAndConjunction >> validate: anObject [ 
	| result |
	specs do: [:eachSpec |
		result := eachSpec validate: anObject.
		result isFailure ifTrue: [^result]].
	
	^SpecOfValidationResult success
]
