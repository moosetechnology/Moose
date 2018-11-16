Class {
	#name : #SwiftFileNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'statements'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftFileNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitFile: self
]

{ #category : #generated }
SwiftFileNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #'generated-initialize-release' }
SwiftFileNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
SwiftFileNode >> statements [
	^ statements
]

{ #category : #generated }
SwiftFileNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
