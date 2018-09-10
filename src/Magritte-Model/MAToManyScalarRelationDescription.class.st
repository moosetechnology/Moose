"
Like MAToManyRelationDescription but for scalar values.
"
Class {
	#name : #MAToManyScalarRelationDescription,
	#superclass : #MAToManyRelationDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #accessing }
MAToManyScalarRelationDescription class >> label [
	^ '1:m scalar Relation'
]

{ #category : #visiting }
MAToManyScalarRelationDescription >> acceptMagritte: aVisitor [
	aVisitor visitToManyScalarRelationDescription: self
]
