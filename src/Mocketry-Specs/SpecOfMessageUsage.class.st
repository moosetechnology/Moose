"
I represent restriction on how many times message can be sent.
I am part of SpecOfExpectedMessage.

Public API and Key Messages

- allowMessageSends: anInteger
- allowMessageSends: anInteger withNegatedLogic: aBoolean
- minCount: anInteger
- maxCount: anInteger
- exactCount: anInteger

Internal Representation and Key Implementation Points.

    Instance Variables
	maxCount:		<SmallInteger>
	minCount:		<SmallInteger>
"
Class {
	#name : #SpecOfMessageUsage,
	#superclass : #Object,
	#instVars : [
		'minCount',
		'maxCount'
	],
	#category : 'Mocketry-Specs'
}

{ #category : #testing }
SpecOfMessageUsage >> allowMessageSends: messagesCount [ 

	^self allowMessageSends: messagesCount withNegatedLogic: false
]

{ #category : #testing }
SpecOfMessageUsage >> allowMessageSends: messagesCount withNegatedLogic: denial [

	(messagesCount = 0 & (minCount = 0) & denial) ifTrue: [ ^true ].
	
	^(messagesCount between: minCount and: maxCount) ~= denial
]

{ #category : #accessing }
SpecOfMessageUsage >> beStrict [

	maxCount := minCount
]

{ #category : #accessing }
SpecOfMessageUsage >> beUnlimited [
	maxCount := Float infinity 
]

{ #category : #accessing }
SpecOfMessageUsage >> exactCount: anInteger [ 
	minCount := anInteger.
	maxCount := anInteger
]

{ #category : #testing }
SpecOfMessageUsage >> hasMeaningfulRestrictions [
	^self isMinCountSpecified or: [ self isMaxCountSpecified ]
]

{ #category : #initialization }
SpecOfMessageUsage >> initialize [
	super initialize.
	minCount := 1.
	self beUnlimited 
]

{ #category : #testing }
SpecOfMessageUsage >> isMaxCountSpecified [
	^maxCount ~= Float infinity
]

{ #category : #testing }
SpecOfMessageUsage >> isMinCountSpecified [
	^minCount > 1
]

{ #category : #testing }
SpecOfMessageUsage >> isUnlimited [
	^self isMaxCountSpecified not
]

{ #category : #accessing }
SpecOfMessageUsage >> maxCount [
	^ maxCount
]

{ #category : #accessing }
SpecOfMessageUsage >> maxCount: anObject [
	maxCount := anObject
]

{ #category : #accessing }
SpecOfMessageUsage >> minCount [
	^ minCount
]

{ #category : #accessing }
SpecOfMessageUsage >> minCount: anObject [
	minCount := anObject
]

{ #category : #printing }
SpecOfMessageUsage >> printOn: aStream [
	super printOn: aStream.
	
	aStream << $( << self printRestrictions << $)
]

{ #category : #printing }
SpecOfMessageUsage >> printRestrictions [

	| result |
	minCount = maxCount ifTrue: [ ^minCount asString, ' times' ].
	
	(self isMinCountSpecified not and: [ self isMaxCountSpecified not ])
		ifTrue: [ ^'at least ', minCount asString , ' times' ].
		
	result := ''.
	self isMinCountSpecified ifTrue: [ 
		result :=  result , 'at least ', minCount asString , ' times'].
	self isMaxCountSpecified ifTrue: [ 
		result ifNotEmpty: [ result := result , ' ' ].
		result := result , 'at most ', maxCount asString, ' times' ].
	^result
]
