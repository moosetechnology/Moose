"
A class for unparsed entities. These should never be directly referenced in content with the &name; syntax, but can be named in values of ENTITY and ENTITIES attributes.
"
Class {
	#name : #DTDUnparsedEntity,
	#superclass : #DTDEntity,
	#instVars : [
		'ndata',
		'publicID',
		'systemID'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDUnparsedEntity class >> name: aName publicID: aPublicID systemID: aSystemID ndata: aNotationName [
	^ self new
		setName: aName
		publicID: aPublicID
		systemID: aSystemID
		ndata: aNotationName
]

{ #category : #testing }
DTDUnparsedEntity >> isUnparsed [
	^ true
]

{ #category : #accessing }
DTDUnparsedEntity >> ndata [
	^ ndata ifNil: [ndata := '']
]

{ #category : #accessing }
DTDUnparsedEntity >> ndata: aNotationName [
	ndata := aNotationName
]

{ #category : #accessing }
DTDUnparsedEntity >> publicID [
	^ publicID ifNil: [publicID := '']
]

{ #category : #accessing }
DTDUnparsedEntity >> publicID: aPublicID [
	publicID := aPublicID
]

{ #category : #initialization }
DTDUnparsedEntity >> setName: aName publicID: aPublicID systemID: aSystemID ndata: aNotationName [
	name := aName.
	publicID := aPublicID.
	systemID := aSystemID.
	ndata := aNotationName.
]

{ #category : #accessing }
DTDUnparsedEntity >> systemID [
	^ systemID ifNil: [systemID := '']
]

{ #category : #accessing }
DTDUnparsedEntity >> systemID: aSystemID [
	systemID := aSystemID
]
