"
This class allows an attribute to be absent (the #IMPLIED constraint).
"
Class {
	#name : #XMLAttributeImpliedDefaultValidator,
	#superclass : #XMLAttributeDefaultValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #testing }
XMLAttributeImpliedDefaultValidator >> isImplied [
	^ true
]
