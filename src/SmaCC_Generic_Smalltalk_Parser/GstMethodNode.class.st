Class {
	#name : #GstMethodNode,
	#superclass : #GstProgramNode,
	#instVars : [
		'selectorParts',
		'variables',
		'body'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstMethodNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMethod: self
]

{ #category : #generated }
GstMethodNode >> body [
	^ body
]

{ #category : #generated }
GstMethodNode >> body: aGstSequenceNode [
	self body notNil
		ifTrue: [ self body parent: nil ].
	body := aGstSequenceNode.
	self body notNil
		ifTrue: [ self body parent: self ]
]

{ #category : #generated }
GstMethodNode >> compositeNodeVariables [
	^ #(#variables)
]

{ #category : #generated }
GstMethodNode >> compositeTokenVariables [
	^ #(#selectorParts)
]

{ #category : #'generated-initialize-release' }
GstMethodNode >> initialize [
	super initialize.
	selectorParts := OrderedCollection new: 2.
	variables := OrderedCollection new: 2.
]

{ #category : #generated }
GstMethodNode >> nodeVariables [
	^ #(#body)
]

{ #category : #generated }
GstMethodNode >> selectorParts [
	^ selectorParts
]

{ #category : #generated }
GstMethodNode >> selectorParts: anOrderedCollection [
	selectorParts := anOrderedCollection
]

{ #category : #generated }
GstMethodNode >> variables [
	^ variables
]

{ #category : #generated }
GstMethodNode >> variables: anOrderedCollection [
	self setParents: self variables to: nil.
	variables := anOrderedCollection.
	self setParents: self variables to: self
]
