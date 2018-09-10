"
This class validates elements that can contain any content.
"
Class {
	#name : #XMLAnyElementValidator,
	#superclass : #XMLElementValidator,
	#category : #'XML-Parser-Validation'
}

{ #category : #testing }
XMLAnyElementValidator >> atEnd [
	^ true
]

{ #category : #testing }
XMLAnyElementValidator >> isAny [
	^ true
]

{ #category : #defaults }
XMLAnyElementValidator >> typeName [
	^ 'ANY'
]
