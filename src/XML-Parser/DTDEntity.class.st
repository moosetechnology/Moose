"
This is an abstract base class for internal and external parsed entities with replacements that can be inserted into an XML document.
"
Class {
	#name : #DTDEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'uri'
	],
	#category : #'XML-Parser-DTD'
}

{ #category : #'instance creation' }
DTDEntity class >> name: aName [
	^ self named: aName
]

{ #category : #'instance creation' }
DTDEntity class >> named: aName [
	^ self new name: aName
]

{ #category : #converting }
DTDEntity >> asReference [
	^ String streamContents: [:stream | self printReferenceOn: stream]
]

{ #category : #testing }
DTDEntity >> isExternal [
	^ false
]

{ #category : #testing }
DTDEntity >> isParameter [
	^ false
]

{ #category : #testing }
DTDEntity >> isStandaloneExternal [
	^ false
]

{ #category : #testing }
DTDEntity >> isUnparsed [
	^ false
]

{ #category : #accessing }
DTDEntity >> name [
	^ name ifNil: [name := '']
]

{ #category : #accessing }
DTDEntity >> name: aName [
	name := aName
]

{ #category : #printing }
DTDEntity >> printNameOn: aStream [
	aStream nextPutAll: self name
]

{ #category : #printing }
DTDEntity >> printOn: aStream [
	super printOn: aStream.

	aStream nextPut: $(.
	self printNameOn: aStream.
	aStream nextPut: $).
]

{ #category : #printing }
DTDEntity >> printReferenceOn: aStream [
	aStream
		nextPut: self referencePrefix;
		nextPutAll: self name;
		nextPut: $;
]

{ #category : #'private ' }
DTDEntity >> referencePrefix [
	^ self isParameter
		ifTrue: [$%]
		ifFalse: [$&]
]

{ #category : #accessing }
DTDEntity >> uri [
	^ uri ifNil: [uri := '']
]

{ #category : #accessing }
DTDEntity >> uri: aURIString [
	uri := aURIString
]
