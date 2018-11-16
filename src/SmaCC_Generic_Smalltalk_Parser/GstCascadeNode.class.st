Class {
	#name : #GstCascadeNode,
	#superclass : #GstValueNode,
	#instVars : [
		'receiver',
		'messages',
		'semicolons'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstCascadeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCascade: self
]

{ #category : #generated }
GstCascadeNode >> compositeNodeVariables [
	^ #(#messages)
]

{ #category : #generated }
GstCascadeNode >> ignoredCompositeTokenVariables [
	^ #(#semicolons #leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
GstCascadeNode >> initialize [
	super initialize.
	messages := OrderedCollection new: 2.
	semicolons := OrderedCollection new: 2.
]

{ #category : #generated }
GstCascadeNode >> messages [
	^ messages
]

{ #category : #generated }
GstCascadeNode >> messages: anOrderedCollection [
	self setParents: self messages to: nil.
	messages := anOrderedCollection.
	self setParents: self messages to: self
]

{ #category : #generated }
GstCascadeNode >> nodeVariables [
	^ #(#receiver)
]

{ #category : #generated }
GstCascadeNode >> receiver [
	^ receiver
]

{ #category : #generated }
GstCascadeNode >> receiver: aGstValueNode [
	self receiver notNil
		ifTrue: [ self receiver parent: nil ].
	receiver := aGstValueNode.
	self receiver notNil
		ifTrue: [ self receiver parent: self ]
]

{ #category : #generated }
GstCascadeNode >> semicolons [
	^ semicolons
]

{ #category : #generated }
GstCascadeNode >> semicolons: anOrderedCollection [
	semicolons := anOrderedCollection
]
