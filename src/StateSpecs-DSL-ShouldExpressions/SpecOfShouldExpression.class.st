"
I implement all kinds of ""should DSL"" expressions to perform object validation.
You can get instance of me from any object by 
	1 should 
And then you can call my validation methods:
	1 should equal: 2
	1 should not equal: 2

Now I implement validation DSL by explicit messages. But before I was based on pragma approach which now extracted to separate package.
To support both approaches I provide class variable CurrentExpressionsClass which is me by default. 
But if you load package with pragma based expressions then SpecOfPragmaBasedShouldExpression become current (look at it comment for detailes).
To activate concrete expressions call 
	SpecOfShouldExpression beCurrent 

All DSL methods are in expressions category.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	receiver:		<Object>
	withNegation:		<Boolean>
"
Class {
	#name : #SpecOfShouldExpression,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'withNegation',
		'receiverOwner'
	],
	#classVars : [
		'CurrentExpressionsClass'
	],
	#category : 'StateSpecs-DSL-ShouldExpressions'
}

{ #category : #accessing }
SpecOfShouldExpression class >> beCurrent [
	^CurrentExpressionsClass := self
]

{ #category : #accessing }
SpecOfShouldExpression class >> currentExpressionsClass [
	^CurrentExpressionsClass ifNil: [ CurrentExpressionsClass := SpecOfShouldExpression ]
]

{ #category : #'instance creation' }
SpecOfShouldExpression class >> startingAt: anObject [
	^self currentExpressionsClass new 
		receiver: anObject
]

{ #category : #expressions }
SpecOfShouldExpression >> be [
	^SpecOfBooleanPropertyValidator for: receiver withNegation: withNegation
]

{ #category : #expressions }
SpecOfShouldExpression >> be: anObject [ 
	^self verify: (SpecOfIdentity requiredValue: anObject)
]

{ #category : #expressions }
SpecOfShouldExpression >> be: anObject description: failureDescription [
	| spec |
	spec := (SpecOfIdentity requiredValue: anObject).
	spec failureDescription: failureDescription.
	
	^self verify: spec
]

{ #category : #expressions }
SpecOfShouldExpression >> beGreaterOrEqualThan: anObject [
	^self verify: (SpecOfGreaterMagnitude than: anObject strong: false)
]

{ #category : #expressions }
SpecOfShouldExpression >> beGreaterThan: anObject [
	^self verify: (SpecOfGreaterMagnitude than: anObject strong: true)
]

{ #category : #expressions }
SpecOfShouldExpression >> beInstanceOf: aClass [ 
	^self verify: (SpecOfObjectClass requiredClass: aClass)
]

{ #category : #expressions }
SpecOfShouldExpression >> beKindOf: aClass [ 
	^self verify: (SpecOfObjectSuperclass requiredClass: aClass)
]

{ #category : #expressions }
SpecOfShouldExpression >> beLessOrEqualThan: anObject [
	^self verify: (SpecOfLesserMagnitude than: anObject strong: false)
]

{ #category : #expressions }
SpecOfShouldExpression >> beLessThan: anObject [
	^self verify: (SpecOfLesserMagnitude than: anObject strong: true)
]

{ #category : #expressions }
SpecOfShouldExpression >> beOrderedEqualTo: aCollection [ 
	self
		deprecated: 'Please use #equalInOrder:  instead'
		transformWith: '`@receiver beOrderedEqualTo: `@statements1' 
						-> '`@receiver equalInOrder: `@statements1'.
	
	^self equalInOrder: aCollection
]

{ #category : #expressions }
SpecOfShouldExpression >> beginWith: aString [
	^ self verify: (SpecOfStringBeginning requiredValue: aString)
]

{ #category : #expressions }
SpecOfShouldExpression >> beginWith: aString caseSensitive: aBool [
	^ self verify: (SpecOfStringBeginning requiredValue: aString caseSensitive: aBool)
]

{ #category : #expressions }
SpecOfShouldExpression >> endWith: aString [
	^ self verify: (SpecOfStringEnding requiredValue: aString)
]

{ #category : #expressions }
SpecOfShouldExpression >> endWith: aString caseSensitive: aBool [
	^ self verify: (SpecOfStringEnding requiredValue: aString caseSensitive: aBool)
]

{ #category : #expressions }
SpecOfShouldExpression >> equal: anObject [ 
	^self verify: (SpecOfEquality requiredValue: anObject)
]

{ #category : #expressions }
SpecOfShouldExpression >> equal: anObject description: failureDescription [
	| spec |
	spec := (SpecOfEquality requiredValue: anObject) .
	spec failureDescription: failureDescription.
	
	^self verify: spec
]

{ #category : #expressions }
SpecOfShouldExpression >> equal: aNumber within: accuracyNumber [ 
	^self verify: (SpecOfApproxEquality to: aNumber within: accuracyNumber)
]

{ #category : #expressions }
SpecOfShouldExpression >> equalInOrder: anObject [ 
	^self verify: (SpecOfCollectionOrderedEquality requiredValue: anObject)
]

{ #category : #expressions }
SpecOfShouldExpression >> fail [
	^self raise: (SpecOfObjectSuperclass requiredClass: Error)
]

{ #category : #expressions }
SpecOfShouldExpression >> haveSize: aNumber [ 
	^self verify: (SpecOfCollectionSize requiredSize: aNumber)
]

{ #category : #expressions }
SpecOfShouldExpression >> include: anObjectOrSpec [
	^ self verify: (SpecOfCollectionContents requiredItem: anObjectOrSpec)
]

{ #category : #expressions }
SpecOfShouldExpression >> include: itemObject at: keyObject [
	^self verify: (SpecOfCollectionItem at: keyObject requiredItem: itemObject)
]

{ #category : #expressions }
SpecOfShouldExpression >> includeKey: anObject [ 
	^self verify: (SpecOfDictionaryKeys requiredKey: anObject)
]

{ #category : #expressions }
SpecOfShouldExpression >> includeSubstring: aString [
	^ self verify: (SpecOfSubstring requiredValue: aString)
]

{ #category : #expressions }
SpecOfShouldExpression >> includeSubstring: aString caseSensitive: aBool [
	^ self verify: (SpecOfSubstring requiredValue: aString caseSensitive: aBool)
]

{ #category : #initialization }
SpecOfShouldExpression >> initialize [
	super initialize.
	withNegation := false
]

{ #category : #expressions }
SpecOfShouldExpression >> matchRegex: aRegexString [
	^ self verify: (SpecOfStringRegex requiredValue: aRegexString)
]

{ #category : #expressions }
SpecOfShouldExpression >> matchRegex: aRegexString caseSensitive: aBool [
	^ self verify: (SpecOfStringRegex requiredValue: aRegexString caseSensitive: aBool)
]

{ #category : #expressions }
SpecOfShouldExpression >> not [
	withNegation := withNegation not
]

{ #category : #expressions }
SpecOfShouldExpression >> raise: aClass [ 
	^self verify: (SpecOfBlockFailure requiredFailure: aClass)
]

{ #category : #accessing }
SpecOfShouldExpression >> receiver [
	^ receiver
]

{ #category : #accessing }
SpecOfShouldExpression >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
SpecOfShouldExpression >> receiverOwner [
	^ receiverOwner
]

{ #category : #accessing }
SpecOfShouldExpression >> receiverOwner: anObject [
	receiverOwner := anObject
]

{ #category : #expressions }
SpecOfShouldExpression >> respondTo: aSelector [ 
	^self verify: (SpecOfObjectResponsibility for: aSelector)
]

{ #category : #expressions }
SpecOfShouldExpression >> satisfy: aBlock [
	^self verify: (SpecOfObjectStateByPredicate from: aBlock)
]

{ #category : #verification }
SpecOfShouldExpression >> verify: aSpecOfObjectState [

	| result |
	aSpecOfObjectState denial: withNegation.
	result := aSpecOfObjectState validate: receiver.
	result isFailure ifTrue: [ result subjectOwner: receiverOwner ].
	result raise 
]

{ #category : #accessing }
SpecOfShouldExpression >> withNegation [
	^ withNegation
]

{ #category : #accessing }
SpecOfShouldExpression >> withNegation: anObject [
	withNegation := anObject
]
