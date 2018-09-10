"
I implement validation of boolean properties of particular object. I am returned from expression 
	2 should be 
And then any message to me will produce SpecOfBooleanProperty which I will use to validate my subject:
	2 should be even.
	2 should not be even.
	1 should be even

Internal Representation and Key Implementation Points.

    Instance Variables
	subject:		<Object>
	withNegation:		<Boolean>
"
Class {
	#name : #SpecOfBooleanPropertyValidator,
	#superclass : #Object,
	#instVars : [
		'subject',
		'withNegation'
	],
	#category : 'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #'instance creation' }
SpecOfBooleanPropertyValidator class >> for: anObject withNegation: aBoolean [
	^self new 
		subject: anObject;
		withNegation: aBoolean
]

{ #category : #dispatching }
SpecOfBooleanPropertyValidator >> doesNotUnderstand: aMessage [

	| spec |
	spec := SpecOfBooleanProperty fromMessage: aMessage.
	spec denial: withNegation.

	self validatePropertyBy: spec
]

{ #category : #initialization }
SpecOfBooleanPropertyValidator >> initialize [
	super initialize.
	
	withNegation := false
]

{ #category : #accessing }
SpecOfBooleanPropertyValidator >> subject [
	^ subject
]

{ #category : #accessing }
SpecOfBooleanPropertyValidator >> subject: anObject [
	subject := anObject
]

{ #category : #validation }
SpecOfBooleanPropertyValidator >> validatePropertyBy: aSpecOfBooleanProperty [

	(aSpecOfBooleanProperty validate: subject) raise
]

{ #category : #accessing }
SpecOfBooleanPropertyValidator >> withNegation [
	^ withNegation
]

{ #category : #accessing }
SpecOfBooleanPropertyValidator >> withNegation: anObject [
	withNegation := anObject
]
