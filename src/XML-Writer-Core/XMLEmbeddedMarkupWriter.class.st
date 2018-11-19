"
This is an abstract class for markup writers that support embedding markup using #with:.
"
Class {
	#name : #XMLEmbeddedMarkupWriter,
	#superclass : #XMLMarkupWriter,
	#instVars : [
		'hasEmbeddedStringMarkup',
		'hasEmbeddedMarkupWriters'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #testing }
XMLEmbeddedMarkupWriter >> hasEmbeddedMarkup [
	^ hasEmbeddedStringMarkup | hasEmbeddedMarkupWriters
]

{ #category : #testing }
XMLEmbeddedMarkupWriter >> hasEmbeddedMarkupWriters [
	^ hasEmbeddedMarkupWriters
]

{ #category : #testing }
XMLEmbeddedMarkupWriter >> hasEmbeddedStringMarkup [
	^ hasEmbeddedStringMarkup
]

{ #category : #initialization }
XMLEmbeddedMarkupWriter >> initialize [
	super initialize.

	hasEmbeddedStringMarkup := false.
	hasEmbeddedMarkupWriters := false.
]

{ #category : #private }
XMLEmbeddedMarkupWriter >> newMarkupWriterBeingPushed [
	self hasStartedWriting
		ifTrue: [
			self hasEmbeddedMarkup
				ifFalse: [self writeEmbeddedMarkupPrologue].
			hasEmbeddedMarkupWriters := true]
		ifFalse: [self write]
]

{ #category : #private }
XMLEmbeddedMarkupWriter >> newStringMarkupBeingWritten [
	self hasStartedWriting
		ifTrue: [
			self hasEmbeddedMarkup
				ifFalse: [self writeEmbeddedMarkupPrologue].
			hasEmbeddedStringMarkup := true]
		ifFalse: [self write]
]

{ #category : #writing }
XMLEmbeddedMarkupWriter >> with: aStringOrCollectionOrBlock [
	self hasStartedWriting
		ifFalse: [
			self
				startWriting;
				writeBody: aStringOrCollectionOrBlock;
				finishWriting]
]

{ #category : #private }
XMLEmbeddedMarkupWriter >> writeBody [
	self writeBody: nil
]

{ #category : #private }
XMLEmbeddedMarkupWriter >> writeBody: aStringOrCollectionOrBlock [
	aStringOrCollectionOrBlock embedInXMLMarkupWriter: self
]

{ #category : #private }
XMLEmbeddedMarkupWriter >> writeEmbeddedMarkupPrologue [
]
