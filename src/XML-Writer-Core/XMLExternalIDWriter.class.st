"
This class writes the external IDs for doctype declarations and markup declarations, either as ""PUBLIC "" followed by the public and system ID literals separated by spaces or ""SYSTEM "" followed by the system ID literal.
"
Class {
	#name : #XMLExternalIDWriter,
	#superclass : #Object,
	#instVars : [
		'publicID',
		'systemID'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #testing }
XMLExternalIDWriter >> hasPublicID [
	^ self publicID notEmpty
]

{ #category : #testing }
XMLExternalIDWriter >> hasSystemID [
	^ self systemID notEmpty
]

{ #category : #testing }
XMLExternalIDWriter >> isOmittable [
	^ self hasPublicID not
		and: [self hasSystemID not]
]

{ #category : #accessing }
XMLExternalIDWriter >> publicID [
	^ publicID ifNil: [publicID := '']
]

{ #category : #accessing }
XMLExternalIDWriter >> publicID: aPublicID [
	publicID := aPublicID
]

{ #category : #accessing }
XMLExternalIDWriter >> systemID [
	^ systemID ifNil: [systemID := '']
]

{ #category : #accessing }
XMLExternalIDWriter >> systemID: aSystemID [
	systemID := aSystemID
]

{ #category : #writing }
XMLExternalIDWriter >> writeOn: aWriter [
	self hasPublicID
		ifTrue: [self writePublicExternalIDOn: aWriter]
		ifFalse: [
			self hasSystemID
				ifTrue: [self writeSystemExternalIDOn: aWriter]]
]

{ #category : #writing }
XMLExternalIDWriter >> writePublicExternalIDOn: aWriter [
	aWriter
		nextPutAll: 'PUBLIC';
		space;
		writeUnescapedString: self publicID;
		space;
		writeUnescapedString: self systemID
]

{ #category : #writing }
XMLExternalIDWriter >> writeSystemExternalIDOn: aWriter [
	aWriter
		nextPutAll: 'SYSTEM';
		space;
		writeUnescapedString: self systemID
]
