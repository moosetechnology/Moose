Class {
	#name : #PPXmlName,
	#superclass : #Object,
	#instVars : [
		'prefix',
		'local',
		'uri'
	],
	#category : #'PetitXml-Nodes'
}

{ #category : #'instance creation' }
PPXmlName class >> name: aString [
	^ self name: aString uri: nil
]

{ #category : #'instance creation' }
PPXmlName class >> name: aString uri: anUrl [
	^ self basicNew initializeName: aString uri: anUrl
]

{ #category : #comparing }
PPXmlName >> = anXmlName [
	self == anXmlName
		ifTrue: [ ^ true ].
	self class = anXmlName class
		ifFalse: [ ^ false ].
	^ self namespacePrefix = anXmlName namespacePrefix 
		and: [ self localName = anXmlName localName ]
]

{ #category : #comparing }
PPXmlName >> hash [
	^ self namespacePrefix hash bitXor: self localName hash
]

{ #category : #initialization }
PPXmlName >> initializeName: aString uri: anUrl [
	| index |
	(index := aString indexOf: $:) = 0
		ifTrue: [ 
			prefix := nil.
			local := aString ]
		ifFalse: [
			prefix := aString copyFrom: 1 to: index - 1.
			local := aString copyFrom: index + 1 to: aString size ].
	uri := anUrl
]

{ #category : #accessing }
PPXmlName >> localName [
	"Answer the local name fo the receiver."
	
	^ local
]

{ #category : #accessing }
PPXmlName >> namespacePrefix [
	"Answer the prefix of the receiver or nil."
	
	^ prefix
]

{ #category : #printing }
PPXmlName >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' ('.
	self printXmlOn: aStream.
	aStream nextPut: $)
]

{ #category : #printing }
PPXmlName >> printXmlOn: aStream [
	prefix isNil
		ifFalse: [ aStream nextPutAll: prefix; nextPut: $: ].
	aStream nextPutAll: local
]

{ #category : #accessing }
PPXmlName >> qualifiedName [
	"Answer the qualified name fo the receiver."
	
	| stream |
	stream := WriteStream on: (String new: 20).
	self printXmlOn: stream.
	^ stream contents
]

{ #category : #accessing }
PPXmlName >> uri [
	^ uri
]
