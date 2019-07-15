Class {
	#name : #CSVLineNode,
	#superclass : #CSVParseNode,
	#instVars : [
		'values',
		'commas'
	],
	#category : #'SmaCC_CSV_Parser'
}

{ #category : #generated }
CSVLineNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitLine: self
]

{ #category : #generated }
CSVLineNode >> commas [
	^ commas
]

{ #category : #generated }
CSVLineNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
CSVLineNode >> compositeTokenVariables [
	^ #(#values #commas)
]

{ #category : #'generated-initialize-release' }
CSVLineNode >> initialize [
	super initialize.
	values := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
CSVLineNode >> values [
	^ values
]

{ #category : #generated }
CSVLineNode >> values: anOrderedCollection [
	values := anOrderedCollection
]
