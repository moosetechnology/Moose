Class {
	#name : #GstKeywordMessageNode,
	#superclass : #GstMessageNode,
	#instVars : [
		'selectorParts',
		'values'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstKeywordMessageNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitKeywordMessage: self
]

{ #category : #generated }
GstKeywordMessageNode >> compositeNodeVariables [
	^ #(#values)
]

{ #category : #generated }
GstKeywordMessageNode >> compositeTokenVariables [
	^ #(#selectorParts)
]

{ #category : #'generated-initialize-release' }
GstKeywordMessageNode >> initialize [
	super initialize.
	selectorParts := OrderedCollection new: 2.
	values := OrderedCollection new: 2.
]

{ #category : #generated }
GstKeywordMessageNode >> selectorParts [
	^ selectorParts
]

{ #category : #generated }
GstKeywordMessageNode >> selectorParts: anOrderedCollection [
	selectorParts := anOrderedCollection
]

{ #category : #accessing }
GstKeywordMessageNode >> symbol [
	^ (selectorParts inject: '' into: [ :sum :each | sum , each value ])
		asSymbol
]

{ #category : #generated }
GstKeywordMessageNode >> values [
	^ values
]

{ #category : #generated }
GstKeywordMessageNode >> values: anOrderedCollection [
	self setParents: self values to: nil.
	values := anOrderedCollection.
	self setParents: self values to: self
]
