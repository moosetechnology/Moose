"
A state for <!DOCTYPE ...> and internal subset tokens.
"
Class {
	#name : #XMLDoctypeDeclarationState,
	#superclass : #XMLPrologState,
	#category : #'XML-Parser-Drivers'
}

{ #category : #testing }
XMLDoctypeDeclarationState >> isDoctypeDeclarationState [
	^ true
]
