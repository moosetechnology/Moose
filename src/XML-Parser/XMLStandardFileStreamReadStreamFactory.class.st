"
A StandardFileStream read stream factory. This stream is preferred for Squeak/Pharo because it does no decoding and returns byte characters so XMLParser can do its own decoding.
"
Class {
	#name : #XMLStandardFileStreamReadStreamFactory,
	#superclass : #XMLFileReadStreamFactory,
	#category : #'XML-Parser-Files'
}

{ #category : #basic }
XMLStandardFileStreamReadStreamFactory class >> basicOnPath: aPathString [
	^ ((XMLClassFinder classNamed: #StandardFileStream)
		readOnlyFileNamed: aPathString)
			binary;
			yourself
]

{ #category : #testing }
XMLStandardFileStreamReadStreamFactory class >> isSupportedImplementation [
	^ XMLClassFinder hasClassNamed: #StandardFileStream
]
