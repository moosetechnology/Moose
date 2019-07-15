"
A state for parsing prolog tokens after <!DOCTYPE ...> declarations.
"
Class {
	#name : #XMLPostDoctypeDeclarationState,
	#superclass : #XMLPrologState,
	#category : #'XML-Parser-Drivers'
}

{ #category : #testing }
XMLPostDoctypeDeclarationState >> isPostDoctypeDeclarationState [
	^ true
]
