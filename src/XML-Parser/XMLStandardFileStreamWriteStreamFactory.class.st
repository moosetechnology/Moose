"
A StandardFileStream write stream factory. This stream is preferred for Pharo/Squeak because it does no encoding and accepts byte characters so XMLParser can do its own encoding.
"
Class {
	#name : #XMLStandardFileStreamWriteStreamFactory,
	#superclass : #XMLFileWriteStreamFactory,
	#category : #'XML-Parser-Files'
}

{ #category : #basic }
XMLStandardFileStreamWriteStreamFactory class >> basicOnPath: aPathString [
	"use forceNewFileNamed: to ensure truncation of existing files before writing"
	^ ((XMLClassFinder classNamed: #StandardFileStream)
		forceNewFileNamed: aPathString)
			binary;
			yourself
]

{ #category : #testing }
XMLStandardFileStreamWriteStreamFactory class >> isSupportedImplementation [
	^ XMLClassFinder hasClassNamed: #StandardFileStream
]
