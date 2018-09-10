"
A base class for write stream adapters for basic streams that support #nextPut:, #nextPutAll:, #contents, #position, #position:, and #reset. It adds support for writing characters like tabs, spaces, and line endings.
"
Class {
	#name : #XMLWriteStreamAdapter,
	#superclass : #XMLStreamAdapter,
	#classVars : [
		'CRCharacter',
		'LFCharacter',
		'SpaceCharacter',
		'TabCharacter'
	],
	#category : #'XML-Parser-Streams'
}

{ #category : #'class initialization' }
XMLWriteStreamAdapter class >> initialize [
	"self initialize"

	"stored in class vars for faster access"
	SpaceCharacter := Character space.
	TabCharacter := Character tab.
	CRCharacter := Character cr.
	LFCharacter := Character lf.
]

{ #category : #basic }
XMLWriteStreamAdapter >> basicNextPut: anObject [ 
	^ self nextPut: anObject
]

{ #category : #accessing }
XMLWriteStreamAdapter >> contents [
	^ stream contents
]

{ #category : #'character writing' }
XMLWriteStreamAdapter >> cr [
	^ self nextPut: CRCharacter
]

{ #category : #'character writing' }
XMLWriteStreamAdapter >> lf [
	^ self nextPut: LFCharacter
]

{ #category : #accessing }
XMLWriteStreamAdapter >> nextPut: anObject [
	stream nextPut: anObject.
	^ anObject.
]

{ #category : #accessing }
XMLWriteStreamAdapter >> nextPutAll: aCollection [
	stream nextPutAll: aCollection.
	^ aCollection.
]

{ #category : #positioning }
XMLWriteStreamAdapter >> position [
	^ stream position
]

{ #category : #positioning }
XMLWriteStreamAdapter >> position: anInteger [
	stream position: anInteger
]

{ #category : #positioning }
XMLWriteStreamAdapter >> reset [
	stream reset
]

{ #category : #'character writing' }
XMLWriteStreamAdapter >> space [
	^ self nextPut: SpaceCharacter
]

{ #category : #'character writing' }
XMLWriteStreamAdapter >> tab [
	^ self nextPut: TabCharacter
]
