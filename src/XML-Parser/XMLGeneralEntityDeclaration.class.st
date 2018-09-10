"
This is a class for general <!ENTITY> declarations.
"
Class {
	#name : #XMLGeneralEntityDeclaration,
	#superclass : #XMLEntityDeclaration,
	#instVars : [
		'ndata'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLGeneralEntityDeclaration class >> name: aName publicID: aPublicID systemID: aSystemID ndata: aNotationName [
	^ self new
		name: aName;
		publicID: aPublicID;
		systemID: aSystemID;
		ndata: aNotationName
]

{ #category : #testing }
XMLGeneralEntityDeclaration >> isUnparsed [
	^ self ndata notEmpty
]

{ #category : #accessing }
XMLGeneralEntityDeclaration >> ndata [
	^ ndata ifNil: [ndata := '']
]

{ #category : #accessing }
XMLGeneralEntityDeclaration >> ndata: aNotationName [
	ndata := aNotationName
]

{ #category : #printing }
XMLGeneralEntityDeclaration >> writeXMLOn: aWriter [
	aWriter entityDeclaration
		name: self name;
		isParameter: false;
		replacement: self replacement;
		publicID: self publicID;
		systemID: self systemID;
		ndata: self ndata;
		write
]
