Class {
	#name : #CSTypeParameterListNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'lessThan',
		'_attributes',
		'parameters',
		'commaTokens',
		'greaterThan'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSTypeParameterListNode >> _attributes [
	^ _attributes
]

{ #category : #generated }
CSTypeParameterListNode >> _attributes: anOrderedCollection [
	self setParents: self _attributes to: nil.
	_attributes := anOrderedCollection.
	self setParents: self _attributes to: self
]

{ #category : #generated }
CSTypeParameterListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitTypeParameterList: self
]

{ #category : #generated }
CSTypeParameterListNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CSTypeParameterListNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CSTypeParameterListNode >> compositeNodeVariables [
	^ #(#_attributes #parameters)
]

{ #category : #generated }
CSTypeParameterListNode >> greaterThan [
	^ greaterThan
]

{ #category : #generated }
CSTypeParameterListNode >> greaterThan: aSmaCCToken [
	greaterThan := aSmaCCToken
]

{ #category : #generated }
CSTypeParameterListNode >> ignoredCompositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CSTypeParameterListNode >> initialize [
	super initialize.
	_attributes := OrderedCollection new: 2.
	parameters := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSTypeParameterListNode >> lessThan [
	^ lessThan
]

{ #category : #generated }
CSTypeParameterListNode >> lessThan: aSmaCCToken [
	lessThan := aSmaCCToken
]

{ #category : #generated }
CSTypeParameterListNode >> parameters [
	^ parameters
]

{ #category : #generated }
CSTypeParameterListNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
CSTypeParameterListNode >> tokenVariables [
	^ #(#lessThan #greaterThan)
]
