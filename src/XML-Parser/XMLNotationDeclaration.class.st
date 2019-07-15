"
This is class for <!NOTATION> declarations.

"
Class {
	#name : #XMLNotationDeclaration,
	#superclass : #XMLDeclarationNode,
	#instVars : [
		'name',
		'publicID',
		'systemID'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLNotationDeclaration class >> name: aName publicID: aPublicID systemID: aSystemID [
	^ self new
		name: aName;
		publicID: aPublicID;
		systemID: aSystemID
]

{ #category : #accessing }
XMLNotationDeclaration >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XMLNotationDeclaration >> name: aName [
	name := aName
]

{ #category : #accessing }
XMLNotationDeclaration >> publicID [
	^ publicID ifNil: [publicID := '']
]

{ #category : #accessing }
XMLNotationDeclaration >> publicID: aPublicID [
	publicID := aPublicID
]

{ #category : #accessing }
XMLNotationDeclaration >> systemID [
	^ systemID ifNil: [systemID := '']
]

{ #category : #accessing }
XMLNotationDeclaration >> systemID: aSystemID [
	systemID := aSystemID
]

{ #category : #printing }
XMLNotationDeclaration >> writeXMLOn: aWriter [
	aWriter notationDeclaration
		name: self name;
		publicID: self publicID;
		systemID: self systemID;
		write
]
