"
I implement validation of internal boolean properties of particular object. I am returned from property should expression
	
	(1 @ 2) which x should be

And then for any message I perform validation. Only different from my superclass is that I wil push original property information to validation process. It make description of failure more informative.
	
	(1 @ 2) which x should be even
	 (1 @ 2) which x should not be even
"
Class {
	#name : #SpecOfBooleanSubPropertyValidator,
	#superclass : #SpecOfBooleanPropertyValidator,
	#category : 'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #validation }
SpecOfBooleanSubPropertyValidator >> validatePropertyBy: aSpecOfBooleanProperty [

	| result |
	result := aSpecOfBooleanProperty validate: subject value.
	result isFailure ifTrue: [ result subjectOwner: subject ].
	
	result raise
]
