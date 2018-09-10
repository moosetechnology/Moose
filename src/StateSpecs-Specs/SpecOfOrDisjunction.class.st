"
I implement disjunction of specifications.

I can be created by | message to spec:
	
	(Instance of: String) | (Instance of: Integer)
"
Class {
	#name : #SpecOfOrDisjunction,
	#superclass : #SpecOfComplexState,
	#category : 'StateSpecs-Specs'
}

{ #category : #testing }
SpecOfOrDisjunction >> basicMatches: anObject [

	^specs anySatisfy: [ :each | 
		each matches: anObject ]
]

{ #category : #printing }
SpecOfOrDisjunction >> operatorName [
	^'or'
]

{ #category : #validation }
SpecOfOrDisjunction >> validate: anObject [ 
	| result |
	
	specs do: [:eachSpec | 
		result := eachSpec validate: anObject.
		result isSuccess ifTrue: [^result]].
	
	^SpecOfValidationResult failed: self for: anObject
]
