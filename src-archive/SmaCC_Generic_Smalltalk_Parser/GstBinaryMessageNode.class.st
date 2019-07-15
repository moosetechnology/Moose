Class {
	#name : #GstBinaryMessageNode,
	#superclass : #GstMessageNode,
	#instVars : [
		'selectorPart',
		'value'
	],
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstBinaryMessageNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBinaryMessage: self
]

{ #category : #generated }
GstBinaryMessageNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
GstBinaryMessageNode >> selectorPart [
	^ selectorPart
]

{ #category : #generated }
GstBinaryMessageNode >> selectorPart: aSmaCCToken [
	selectorPart := aSmaCCToken
]

{ #category : #accessing }
GstBinaryMessageNode >> symbol [
	^ selectorPart value asSymbol
]

{ #category : #generated }
GstBinaryMessageNode >> tokenVariables [
	^ #(#selectorPart)
]

{ #category : #generated }
GstBinaryMessageNode >> value [
	^ value
]

{ #category : #generated }
GstBinaryMessageNode >> value: aGstValueNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aGstValueNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]
