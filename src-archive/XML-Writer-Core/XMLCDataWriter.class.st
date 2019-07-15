"
This class writes <![CDATA[...]]> sections. If canonical XML is enabled, it writes its contents as a regular XML-escaped string instead.
"
Class {
	#name : #XMLCDataWriter,
	#superclass : #XMLMarkupWriter,
	#instVars : [
		'string'
	],
	#category : #'XML-Writer-Core'
}

{ #category : #accessing }
XMLCDataWriter >> string [
	^ string ifNil: [string := '']
]

{ #category : #accessing }
XMLCDataWriter >> string: aString [
	string := aString
]

{ #category : #private }
XMLCDataWriter >> writeBody [
	self writer isCanonical
		ifTrue: [
			self parent
				ifNotNil: [:parent | parent newStringMarkupBeingWritten].
			self writer writeEscapedContent: self string]
		ifFalse: [self writer nextPutAll: self string]
]

{ #category : #private }
XMLCDataWriter >> writeEpilogue [
	self isCanonical
		ifFalse: [
			self writer
				nextPutAll: ']]>';
				formatAfterCData: self]
]

{ #category : #private }
XMLCDataWriter >> writePrologue [
	self isCanonical
		ifFalse: [
			self writer
				formatBeforeCData: self;
				nextPutAll: '<![CDATA[']
]
