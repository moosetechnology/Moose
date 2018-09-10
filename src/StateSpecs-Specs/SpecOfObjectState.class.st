"
I am root of hierarchy of object state specifications.

I provide two methods to check objects. One is #matches: which returns true or false. And other is #validate: which returns object validation result with detailed information about failure (if object not satisfies spec).

My subclasses should define at least #basicMatches: method to check if given object satisfied specification or not.

I has denial variable which used to mark me as opposite specification to my original purpose. Method #matches: take it into account. And implementors of basicMatches: should not think about it. 

Also subclasses can override #validate: method to retrive more specific  information about given objects. 

Public API and Key Messages

- matches: anObject 
it checks if anObject matches specification or not.   It returns true or false.

- validate: anObject 
it checks if anObject matches specification or not.   It returns SpecOfValidationResult instance which can be success or failure.

-not
It creates my copy with negation behaviour

-&
It creates SpecOfAndConjunction instance with me and my argument

-| 
It cretes SpecOfOrDisjunction instance with me and my argument

-title:
It sets special name of me. There is defaultTitle by default

-failureDescription:
It sets special description for validation failure


   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	denial:		<Boolean>
	title:		<String>
	failureDescription:		<String>

"
Class {
	#name : #SpecOfObjectState,
	#superclass : #Object,
	#instVars : [
		'denial',
		'title',
		'failureDescription'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'specs composition' }
SpecOfObjectState >> & aStateSpec [ 
	^SpecOfAndConjunction of: self and: aStateSpec
]

{ #category : #converting }
SpecOfObjectState >> asStateSpec [
	^self
]

{ #category : #testing }
SpecOfObjectState >> basicMatches: anObject [ 
	self subclassResponsibility
]

{ #category : #debugging }
SpecOfObjectState >> debugValidationFailingOver: aSpecFailed [
	UnhandledError signalForException: aSpecFailed
]

{ #category : #printing }
SpecOfObjectState >> defaultTitle [
	^'satisfy for ' , self class name
]

{ #category : #accessing }
SpecOfObjectState >> denial [
	^denial
]

{ #category : #accessing }
SpecOfObjectState >> denial: aBoolean [ 
	denial == aBoolean ifTrue: [ ^self ].
	self invert
]

{ #category : #printing }
SpecOfObjectState >> description [
	^self shouldPrefixPhrase , ' ' , self title
]

{ #category : #accessing }
SpecOfObjectState >> failureDescription [
	^ failureDescription
]

{ #category : #accessing }
SpecOfObjectState >> failureDescription: anObject [
	failureDescription := anObject
]

{ #category : #'initialize-release' }
SpecOfObjectState >> initialize [
	denial := false
]

{ #category : #accessing }
SpecOfObjectState >> invert [
	denial := denial not.
	self invertChildren
]

{ #category : #accessing }
SpecOfObjectState >> invertChildren [
]

{ #category : #testing }
SpecOfObjectState >> isSimpleValue [
	^false
]

{ #category : #testing }
SpecOfObjectState >> isStateSpec [
	^true
]

{ #category : #testing }
SpecOfObjectState >> matches: anObject [ 
	^(self basicMatches: anObject) ~= denial
]

{ #category : #'specs composition' }
SpecOfObjectState >> not [
	^self copy invert; yourself
]

{ #category : #printing }
SpecOfObjectState >> printOn: aStream [
	super printOn: aStream.
	aStream << $( << self description << $)
]

{ #category : #printing }
SpecOfObjectState >> printSimpleValue [

	^self isSimpleValue 
			ifTrue: [ self asSimpleValue stringForSpecTitle ]
			ifFalse: [ '(', self title , ')' ]
]

{ #category : #printing }
SpecOfObjectState >> shouldPrefixPhrase [
	^'should' , (denial ifTrue: [' not'] ifFalse: [''])
]

{ #category : #accessing }
SpecOfObjectState >> title [
	^title ifNil: [title := self defaultTitle]
]

{ #category : #accessing }
SpecOfObjectState >> title: aString [ 
	title := aString
]

{ #category : #validation }
SpecOfObjectState >> validate: anObject [ 
	(self matches: anObject) ifTrue: [^SpecOfValidationResult success].
	^self validationFailureFor: anObject
]

{ #category : #validation }
SpecOfObjectState >> validationFailureFor: anObject [

	^SpecOfValidationResult failed: self for: anObject 
]

{ #category : #'specs composition' }
SpecOfObjectState >> | aStateSpec [ 
	^SpecOfOrDisjunction of: self and: aStateSpec
]
