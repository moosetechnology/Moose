"
An abstract factory for file write streams used by XMLFileHandles.

Subclasses should create write streams that do no automatic encoding and accept raw byte characters, so XMLParser can do its own encoding.
"
Class {
	#name : #XMLFileWriteStreamFactory,
	#superclass : #XMLAbstractFactory,
	#category : #'XML-Parser-Files'
}

{ #category : #basic }
XMLFileWriteStreamFactory class >> basicOnPath: aPathString [
	self subclassResponsibility
]

{ #category : #testing }
XMLFileWriteStreamFactory class >> canBeImplemented [
	^ true
]

{ #category : #finding }
XMLFileWriteStreamFactory class >> noSupportedImplementationFound [
	XMLFileException signal: 'File writing unsupported'
]

{ #category : #'instance creation' }
XMLFileWriteStreamFactory class >> onPath: aPathString [
	^ self implementation basicOnPath: aPathString
]

{ #category : #defaults }
XMLFileWriteStreamFactory class >> preferredImplementation [
	^ XMLStandardFileStreamWriteStreamFactory
]
