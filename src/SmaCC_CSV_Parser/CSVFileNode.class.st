Class {
	#name : #CSVFileNode,
	#superclass : #CSVParseNode,
	#instVars : [
		'lines',
		'eols'
	],
	#category : #'SmaCC_CSV_Parser'
}

{ #category : #generated }
CSVFileNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitFile: self
]

{ #category : #generated }
CSVFileNode >> compositeNodeVariables [
	^ #(#lines)
]

{ #category : #generated }
CSVFileNode >> compositeTokenVariables [
	^ #(#eols)
]

{ #category : #generated }
CSVFileNode >> eols [
	^ eols
]

{ #category : #generated }
CSVFileNode >> eols: anOrderedCollection [
	eols := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
CSVFileNode >> initialize [
	super initialize.
	lines := OrderedCollection new: 2.
	eols := OrderedCollection new: 2.
]

{ #category : #generated }
CSVFileNode >> lines [
	^ lines
]

{ #category : #generated }
CSVFileNode >> lines: anOrderedCollection [
	self setParents: self lines to: nil.
	lines := anOrderedCollection.
	self setParents: self lines to: self
]
