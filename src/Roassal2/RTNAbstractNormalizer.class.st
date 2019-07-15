"
A RONAbstractNormalizer is xxxxxxxxx.

Instance Variables
	command:		<Object>

command
	- xxxxx

"
Class {
	#name : #RTNAbstractNormalizer,
	#superclass : #RTObject,
	#instVars : [
		'command'
	],
	#category : #'Roassal2-ColorNormalizerOBSOLETE'
}

{ #category : #accessing }
RTNAbstractNormalizer >> command [
	
	^command
]

{ #category : #accessing }
RTNAbstractNormalizer >> command: aBlock [
	
	command := aBlock
]

{ #category : #accessing }
RTNAbstractNormalizer >> rtValue: anEntity [
	
	self subclassResponsibility
]
