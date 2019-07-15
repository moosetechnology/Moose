"
A RONAbstractNormalizer is xxxxxxxxx.

Instance Variables
	command:		<Object>

command
	- xxxxx

"
Class {
	#name : #RTAbstractNormalizer,
	#superclass : #RTObject,
	#instVars : [
		'command'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #accessing }
RTAbstractNormalizer >> command [
	
	^ command
]

{ #category : #accessing }
RTAbstractNormalizer >> command: aValueOrASymbolOrABlock [
	"The argument will be evaluated for each elements found in the scope, typically all the elements of the view. The argument takes a model as argument"
	command := aValueOrASymbolOrABlock
]

{ #category : #accessing }
RTAbstractNormalizer >> rtValue: anEntity [
	
	self subclassResponsibility
]
