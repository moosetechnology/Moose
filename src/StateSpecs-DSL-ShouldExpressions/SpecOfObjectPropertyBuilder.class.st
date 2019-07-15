"
I am used to create internal property instance of given object which then can be validated:

	(10@3) which x should equal: 10
	
which here returns me. 

Internal Representation and Key Implementation Points.

    Instance Variables
	property:		<SpecOfObjectProperty>

"
Class {
	#name : #SpecOfObjectPropertyBuilder,
	#superclass : #Object,
	#instVars : [
		'property'
	],
	#category : 'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfObjectPropertyBuilder class >> for: anObject [

	^self new 
		property: (SpecOfObjectItselfProperty of: anObject)
]

{ #category : #dispatching }
SpecOfObjectPropertyBuilder >> doesNotUnderstand: aMessage [

	(property value respondsTo: aMessage selector) ifFalse: [ ^aMessage sendTo: property value ].
	
	property := property subPropertyAt: aMessage
]

{ #category : #printing }
SpecOfObjectPropertyBuilder >> printOn: aStream [

	aStream << 'Got '.
	property printOn: aStream
]

{ #category : #accessing }
SpecOfObjectPropertyBuilder >> property [
	^ property
]

{ #category : #accessing }
SpecOfObjectPropertyBuilder >> property: anObject [
	property := anObject
]

{ #category : #accessing }
SpecOfObjectPropertyBuilder >> should [

	^SpecOfObjectPropertyShouldExpression new 
		receiver: property
]

{ #category : #accessing }
SpecOfObjectPropertyBuilder >> value [
	^self doesNotUnderstand: (Message selector: #value)
]
