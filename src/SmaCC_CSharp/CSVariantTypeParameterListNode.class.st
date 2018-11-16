Class {
	#name : #CSVariantTypeParameterListNode,
	#superclass : #CSTypeParameterListNode,
	#instVars : [
		'annotations'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #generated }
CSVariantTypeParameterListNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariantTypeParameterList: self
]

{ #category : #generated }
CSVariantTypeParameterListNode >> annotations [
	^ annotations
]

{ #category : #generated }
CSVariantTypeParameterListNode >> annotations: anOrderedCollection [
	annotations := anOrderedCollection
]

{ #category : #generated }
CSVariantTypeParameterListNode >> compositeTokenVariables [
	^ #(#annotations)
]

{ #category : #'generated-initialize-release' }
CSVariantTypeParameterListNode >> initialize [
	super initialize.
	annotations := OrderedCollection new: 2.
]
