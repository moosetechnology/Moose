"
I implement special hook to validate internal object properties by should expressions. I am created for property validation:
	
	(1@0) where x should equal: 1

should here returns me.

I override few methods to push property information to given objects  	

Internal Representation and Key Implementation Points.

    Instance Variables
	receiver:		<SpecOfObjectProperty>
"
Class {
	#name : #SpecOfObjectPropertyShouldExpression,
	#superclass : #SpecOfShouldExpression,
	#category : 'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #expressions }
SpecOfObjectPropertyShouldExpression >> be [
	^SpecOfBooleanSubPropertyValidator for: receiver withNegation: withNegation
]

{ #category : #verification }
SpecOfObjectPropertyShouldExpression >> verify: aSpecOfObjectState [

	| result |
	aSpecOfObjectState denial: withNegation.
	result := aSpecOfObjectState validate: receiver value.
	result isFailure ifTrue: [ result subjectOwner: receiver ].
	result raise 
]
