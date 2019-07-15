Class {
	#name : #JSModuleNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'items'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSModuleNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitModule: self
]

{ #category : #generated }
JSModuleNode >> compositeNodeVariables [
	^ #(#items)
]

{ #category : #'generated-initialize-release' }
JSModuleNode >> initialize [
	super initialize.
	items := OrderedCollection new: 2.
]

{ #category : #generated }
JSModuleNode >> items [
	^ items
]

{ #category : #generated }
JSModuleNode >> items: anOrderedCollection [
	self setParents: self items to: nil.
	items := anOrderedCollection.
	self setParents: self items to: self
]
