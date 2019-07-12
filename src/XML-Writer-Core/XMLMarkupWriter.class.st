"
This is a base class for markup writers. Subclasses override messages like #writePrologue and #writeEpilogue to write markup using the supplied XMLWriter object.
"
Class {
	#name : #XMLMarkupWriter,
	#superclass : #Object,
	#instVars : [
		'writer',
		'hasStartedWriting'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #'instance creation' }
XMLMarkupWriter class >> writer: aWriter [
	^ self new writer: aWriter
]

{ #category : #enumerating }
XMLMarkupWriter >> ancestorsDo: aBlock [
	self writer
		ancestorsOfMarkupWriter: self
		do: aBlock
]

{ #category : #converting }
XMLMarkupWriter >> asString [
	^ self writer asString
]

{ #category : #closing }
XMLMarkupWriter >> close [
	self writer close
]

{ #category : #accessing }
XMLMarkupWriter >> contents [
	^ self writer contents
]

{ #category : #writing }
XMLMarkupWriter >> finishWriting [
	self hasEmbeddedMarkupWriters
		ifTrue: [self writer writeUnwrittenMarkupWritersEmbeddedIn: self].
	self writeEpilogue.

	self writer popActiveMarkupWriter.
]

{ #category : #testing }
XMLMarkupWriter >> hasEmbeddedMarkup [
	^ false
]

{ #category : #testing }
XMLMarkupWriter >> hasEmbeddedMarkupWriters [
	^ false
]

{ #category : #testing }
XMLMarkupWriter >> hasEmbeddedStringMarkup [
	^ false
]

{ #category : #testing }
XMLMarkupWriter >> hasStartedWriting [
	^ hasStartedWriting
]

{ #category : #initialization }
XMLMarkupWriter >> initialize [
	super initialize.

	hasStartedWriting := false.
]

{ #category : #testing }
XMLMarkupWriter >> isCanonical [
	^ self writer isCanonical
]

{ #category : #testing }
XMLMarkupWriter >> isDoctypeDeclarationWriter [
	^ false
]

{ #category : #testing }
XMLMarkupWriter >> isEmbedded [
	^ self parent notNil
]

{ #category : #testing }
XMLMarkupWriter >> isEmbeddedInDoctypeDeclaration [
	self parent
		ifNil: [^ false]
		ifNotNil: [:parent | ^ parent isDoctypeDeclarationWriter]
]

{ #category : #testing }
XMLMarkupWriter >> isEmbeddedInTagWriter [
	self parent
		ifNil: [^ false]
		ifNotNil: [:parent | ^ parent isTagWriter]
]

{ #category : #testing }
XMLMarkupWriter >> isEmbeddedWithStringMarkup [
	self parent
		ifNil: [^ false]
		ifNotNil: [:parent | ^ parent hasEmbeddedStringMarkup]
]

{ #category : #testing }
XMLMarkupWriter >> isTagWriter [
	^ false
]

{ #category : #testing }
XMLMarkupWriter >> isUnsafeTagWriter [
	^ false
]

{ #category : #private }
XMLMarkupWriter >> newMarkupWriterBeingPushed [
	self write
]

{ #category : #private }
XMLMarkupWriter >> newStringMarkupBeingWritten [
	self write
]

{ #category : #accessing }
XMLMarkupWriter >> parent [
	^ self writer parentOfMarkupWriter: self
]

{ #category : #printing }
XMLMarkupWriter >> printOn: aStream [
	self writer printOn: aStream
]

{ #category : #writing }
XMLMarkupWriter >> startWriting [
	hasStartedWriting := true.
	self writePrologue.
]

{ #category : #enumerating }
XMLMarkupWriter >> withAncestorsDo: aBlock [
	aBlock value: self.
	self ancestorsDo: aBlock.
]

{ #category : #writing }
XMLMarkupWriter >> write [
	self hasStartedWriting
		ifFalse: [
			self
				startWriting;
				writeBody;
				finishWriting]
]

{ #category : #private }
XMLMarkupWriter >> writeBody [
]

{ #category : #private }
XMLMarkupWriter >> writeEpilogue [
]

{ #category : #private }
XMLMarkupWriter >> writePrologue [
]

{ #category : #accessing }
XMLMarkupWriter >> writer [
	^ writer
]

{ #category : #accessing }
XMLMarkupWriter >> writer: aWriter [
	writer := aWriter
]
