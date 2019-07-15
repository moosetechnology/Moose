"
This is an abstract class for general and parameter <!ENTITY> declarations.
"
Class {
	#name : #XMLEntityDeclaration,
	#superclass : #XMLDeclarationNode,
	#instVars : [
		'name',
		'replacement',
		'publicID',
		'systemID'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLEntityDeclaration class >> name: aName publicID: aPublicID systemID: aSystemID [
	^ self new
		name: aName;
		publicID: aPublicID;
		systemID: aSystemID
]

{ #category : #'instance creation' }
XMLEntityDeclaration class >> name: aName replacement: aReplacement [
	^ self new
		name: aName;
		replacement: aReplacement
]

{ #category : #testing }
XMLEntityDeclaration >> isExternal [
	^ self systemID notEmpty
		or: [self publicID notEmpty]
]

{ #category : #testing }
XMLEntityDeclaration >> isParameter [
	^ false
]

{ #category : #testing }
XMLEntityDeclaration >> isUnparsed [
	^ false
]

{ #category : #accessing }
XMLEntityDeclaration >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
XMLEntityDeclaration >> name: aName [
	name := aName
]

{ #category : #accessing }
XMLEntityDeclaration >> publicID [
	^ publicID ifNil: [publicID := '']
]

{ #category : #accessing }
XMLEntityDeclaration >> publicID: aPublicID [
	publicID := aPublicID
]

{ #category : #accessing }
XMLEntityDeclaration >> replacement [
	^ replacement ifNil: [replacement := '']
]

{ #category : #accessing }
XMLEntityDeclaration >> replacement: aReplacement [
	replacement := aReplacement
]

{ #category : #accessing }
XMLEntityDeclaration >> systemID [
	^ systemID ifNil: [systemID := '']
]

{ #category : #accessing }
XMLEntityDeclaration >> systemID: aSystemID [
	systemID := aSystemID
]
