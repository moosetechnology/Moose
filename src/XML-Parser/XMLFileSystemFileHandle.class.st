"
This class uses the Pharo FileSystem API to implement file IO. The preferred implementation.
"
Class {
	#name : #XMLFileSystemFileHandle,
	#superclass : #XMLFileHandle,
	#instVars : [
		'fileReference'
	],
	#category : #'XML-Parser-Files'
}

{ #category : #basic }
XMLFileSystemFileHandle class >> basicCurrentWorkingDirectory [
	"avoid the class #workingDirectory message for Pharo1x compatibility"
	^ (XMLClassFinder classNamed: #FileSystem) disk workingDirectory pathString
]

{ #category : #'instance creation' }
XMLFileSystemFileHandle class >> fileReference: aFileReference [
	^ self new setFileReference: aFileReference
]

{ #category : #testing }
XMLFileSystemFileHandle class >> isSupportedImplementation [
	^ XMLClassFinder hasClassNamed: #FileSystem
]

{ #category : #basic }
XMLFileSystemFileHandle >> basicDelete [
	self fileReference delete
]

{ #category : #basic }
XMLFileSystemFileHandle >> basicFileSize [
	^ self fileReference size
]

{ #category : #testing }
XMLFileSystemFileHandle >> exists [
	^ self fileReference exists
]

{ #category : #accessing }
XMLFileSystemFileHandle >> fileReference [
	^ fileReference ifNil: [fileReference := self path asFileReference]
]

{ #category : #testing }
XMLFileSystemFileHandle >> isFile [
	^ self fileReference isFile
]

{ #category : #'instance creation' }
XMLFileSystemFileHandle >> newFileReadStreamOnPath [
	"memory file references need special handling"
	self usesMemoryStore
		ifTrue: [^ self fileReference readStream].
	^ super newFileReadStreamOnPath.
]

{ #category : #'instance creation' }
XMLFileSystemFileHandle >> newFileWriteStreamOnPath [
	"memory file references need special handling"
	self usesMemoryStore
		ifTrue: [^ self fileReference writeStream].
	^ super newFileWriteStreamOnPath.
]

{ #category : #initialization }
XMLFileSystemFileHandle >> setFileReference: aFileReference [
	fileReference := aFileReference.
	self setPath: aFileReference fullName.
]

{ #category : #testing }
XMLFileSystemFileHandle >> usesMemoryStore [
	"Pharo 3.0 has memory stores but lacks #isMemoryFileSystem, so
	this test is used instead for backwards compatibility"
	^ self fileReference fileSystem store class ==
		(XMLClassFinder classNamed: #MemoryStore)
]
