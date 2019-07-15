"
A RONLinearNormalizer is xxxxxxxxx.

Instance Variables
	context:		<Object>
	maximumValue:		<Object>
	minimumValue:		<Object>

context
	- xxxxx

maximumValue
	- xxxxx

minimumValue
	- xxxxx

"
Class {
	#name : #RTNLinearNormalizer,
	#superclass : #RTNAbstractNormalizer,
	#instVars : [
		'maximumValue',
		'context',
		'minimumValue'
	],
	#category : #'Roassal2-ColorNormalizerOBSOLETE'
}

{ #category : #'instance creation' }
RTNLinearNormalizer class >> inContext: aCollection [
	
	^self inContext: aCollection withCommand: #yourself
]

{ #category : #'instance creation' }
RTNLinearNormalizer class >> inContext: aCollection withCommand: aBlock [
	
	^(self new)
		context: aCollection;
		command: aBlock;
		yourself
]

{ #category : #accessing }
RTNLinearNormalizer >> command: aBlock [
	
	super command: aBlock.
	self flushCache
]

{ #category : #accessing }
RTNLinearNormalizer >> context [
	
	^context
]

{ #category : #accessing }
RTNLinearNormalizer >> context: aContext [
	
	context := aContext.
	self flushCache
]

{ #category : #accessing }
RTNLinearNormalizer >> flushCache [
	
	maximumValue := nil
]

{ #category : #'initialize-release' }
RTNLinearNormalizer >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	maximumValue := nil
]

{ #category : #private }
RTNLinearNormalizer >> maximumValue: anEntity [
	"Returns the largest value that the color metric provides"
	
	maximumValue isNil
		ifTrue:
			[maximumValue := (self context rtValue: anEntity)
				inject: 1
				into:
					[:maximum :entity | maximum max: (self command rtValue: entity)]].
	^maximumValue
]

{ #category : #private }
RTNLinearNormalizer >> minimumValue: anEntity [
	"Returns the smallest value that the color metric provides"
	
	minimumValue isNil
		ifTrue:
			[minimumValue := (self context rtValue: anEntity)
				inject: 100000000000 
				into:
					[:minimum :entity | minimum min: (self command rtValue: entity)]].
	^minimumValue
]
