"
This class is an end tag writer used to close an element started by an XMLUnsafeStartTagWriter.
"
Class {
	#name : #XMLUnsafeEndTagWriter,
	#superclass : #XMLUnsafeTagWriter,
	#category : #'XML-Writer-Core'
}

{ #category : #private }
XMLUnsafeEndTagWriter >> writeBody [
	self writer writeName: self name
]

{ #category : #private }
XMLUnsafeEndTagWriter >> writeEpilogue [
	self writer
		nextPut: $>;
		formatAfterEndTag: self
]

{ #category : #private }
XMLUnsafeEndTagWriter >> writePrologue [
	self writer
		formatBeforeEndTag: self;
		nextPut: $<;
		nextPut: $/
]
