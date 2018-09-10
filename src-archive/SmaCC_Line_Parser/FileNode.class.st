Class {
	#name : #FileNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'lines'
	],
	#category : #'SmaCC_Line_Parser'
}

{ #category : #generated }
FileNode >> acceptVisitor: aFileNodeVisitor [
	^ aFileNodeVisitor visitFileNode: self
]

{ #category : #generated }
FileNode >> compositeTokenVariables [
	^ #(#lines)
]

{ #category : #'generated-initialize-release' }
FileNode >> initialize [
	super initialize.
	lines := OrderedCollection new: 2.
]

{ #category : #generated }
FileNode >> lines [
	^ lines
]

{ #category : #generated }
FileNode >> lines: anOrderedCollection [
	lines := anOrderedCollection
]
