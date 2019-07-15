"
A class for notation declarations.
"
Class {
	#name : #DTDNotation,
	#superclass : #Object,
	#instVars : [
		'name',
		'publicID',
		'systemID'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDNotation class >> name: aName publicID: aPublicID [
	^ self
		name: aName
		publicID: aPublicID
		systemID: ''
]

{ #category : #'instance creation' }
DTDNotation class >> name: aName publicID: aPublicID systemID: aSystemID [
	^ self new
		setName: aName
		publicID: aPublicID
		systemID: aSystemID
]

{ #category : #accessing }
DTDNotation >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
DTDNotation >> name: aName [
	name := aName
]

{ #category : #accessing }
DTDNotation >> publicID [
	^ publicID ifNil: [publicID := '']
]

{ #category : #accessing }
DTDNotation >> publicID: aPublicID [
	publicID := aPublicID
]

{ #category : #initialization }
DTDNotation >> setName: aName publicID: aPublicID systemID: aSystemID [
	name := aName.
	publicID := aPublicID.
	systemID := aSystemID.
]

{ #category : #accessing }
DTDNotation >> systemID [
	^ systemID ifNil: [systemID := '']
]

{ #category : #accessing }
DTDNotation >> systemID: aSystemID [
	systemID := aSystemID
]
