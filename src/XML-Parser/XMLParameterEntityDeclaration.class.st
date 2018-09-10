"
This is a class for parameter <!ENTITY> declarations.
"
Class {
	#name : #XMLParameterEntityDeclaration,
	#superclass : #XMLEntityDeclaration,
	#category : #'XML-Parser-DOM'
}

{ #category : #testing }
XMLParameterEntityDeclaration >> isParameter [
	^ true
]

{ #category : #printing }
XMLParameterEntityDeclaration >> writeXMLOn: aWriter [
	aWriter entityDeclaration
		name: self name;
		isParameter: true;
		replacement: self replacement;
		publicID: self publicID;
		systemID: self systemID;
		write
]
