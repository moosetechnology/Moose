Class {
	#name : #GstMessageNode,
	#superclass : #GstProgramNode,
	#category : #'SmaCC_Generic_Smalltalk_Parser'
}

{ #category : #generated }
GstMessageNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitMessage: self
]

{ #category : #testing }
GstMessageNode >> isUsed [
	^ (parent isKindOf: GstMessageSendNode)
		or: [ parent messages last == self and: [ parent isUsed ] ]
]
