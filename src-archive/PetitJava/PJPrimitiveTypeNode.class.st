Class {
	#name : #PJPrimitiveTypeNode,
	#superclass : #PJTypeNode,
	#category : #'PetitJava-AST'
}

{ #category : #'as yet unclassified' }
PJPrimitiveTypeNode >> acceptVisitor: aVisitor [
	^ aVisitor visitPrimitiveTypeNode: self
]
