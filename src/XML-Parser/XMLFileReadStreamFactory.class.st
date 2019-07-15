"
An abstract factory for file read streams used by XMLFileHandles.

Subclasses should create read streams that return raw byte characters and not characters decoded from some encoding (like UTF-8), so that XMLParser can do its own decoding later looking at byte-order marks and the <?xml ...?> encoding attribute.
"
Class {
	#name : #XMLFileReadStreamFactory,
	#superclass : #XMLAbstractFactory,
	#category : #'XML-Parser-Files'
}

{ #category : #basic }
XMLFileReadStreamFactory class >> basicOnPath: aPathString [
	self subclassResponsibility
]

{ #category : #testing }
XMLFileReadStreamFactory class >> canBeImplemented [
	^ true
]

{ #category : #finding }
XMLFileReadStreamFactory class >> noSupportedImplementationFound [
	XMLFileException signal: 'File reading unsupported'
]

{ #category : #'instance creation' }
XMLFileReadStreamFactory class >> onPath: aPathString [
	^ self implementation basicOnPath: aPathString
]

{ #category : #defaults }
XMLFileReadStreamFactory class >> preferredImplementation [
	^ XMLStandardFileStreamReadStreamFactory
]
