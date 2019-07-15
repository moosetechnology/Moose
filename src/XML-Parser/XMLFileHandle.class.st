"
This is an abstract class for file handles to read/write/delete files. Subclasses need to implement the abstract methods, and then instances of the correct concrete class for this platform can be created by sending #asXMLFileHandle to a string.

The #readStream/#writeStream messages return file streams that do decoding/encoding, while the #rawReadStream/#rawWriteStream streams don't.

These classes implement the #get/#getUpToLimit:decoding: and #streamGet/#streamGetUpToLimit:decoding: interface of XMLURI.
"
Class {
	#name : #XMLFileHandle,
	#superclass : #XMLAbstractFactory,
	#instVars : [
		'path'
	],
	#classVars : [
		'XMLDocumentFileExtensions'
	],
	#category : #'XML-Parser-Files'
}

{ #category : #basic }
XMLFileHandle class >> basicCurrentWorkingDirectory [
	self subclassResponsibility
]

{ #category : #testing }
XMLFileHandle class >> canBeImplemented [
	^ true
]

{ #category : #accessing }
XMLFileHandle class >> currentWorkingDirectory [
	"returns a path string for the current working directory"

	^ self implementation basicCurrentWorkingDirectory
]

{ #category : #finding }
XMLFileHandle class >> noSupportedImplementationFound [
	XMLFileException signal: 'File IO unsupported'
]

{ #category : #'instance creation' }
XMLFileHandle class >> path: aPathString [
	^ self new setPath: aPathString
]

{ #category : #defaults }
XMLFileHandle class >> preferredImplementation [
	^ XMLFileSystemFileHandle
]

{ #category : #accessing }
XMLFileHandle class >> xmlDocumentFileExtensions [
	"a class variable so it's shared by all subclasses, but lazy initialized
	so it isn't initialized unless needed"
	^ XMLDocumentFileExtensions
		ifNil: [
			XMLDocumentFileExtensions :=
				#('atom' "Atom Syndication Format"
					'dbk' "DocBook XML"
					'docm' "Office Open XML Document"
					'docx' "Office Open XML Document"
					'pptm' "Office Open XML Presentation"
					'pptx' "Office Open XML Presentation"
					'rdf' "Resource Description Framework"
					'rss' "Rich Site Summary"
					'svg' "Scalable Vector Graphics"
					'xbel' "XML Bookmark Exchange Language"
					'xfd' "Extensible Forms Description Language"
					'xfdl' "Extensible Forms Description Language"
					'xhtml'
					'xlsm' "Office Open XML Workbook"
					'xlsx' "Office Open XML Workbook"
					'xml'
					'xsd' "XML Schema Definition"
					'xspf' "XML Shareable Playlist Format"
					'xul' "XML User Interface Language"
				) asSet]
]

{ #category : #accessing }
XMLFileHandle class >> xmlDocumentFileExtensions: aCollectionOrNil [
	XMLDocumentFileExtensions :=
		aCollectionOrNil
			ifNotNil: [aCollectionOrNil asSet]
]

{ #category : #converting }
XMLFileHandle >> asXMLFileHandle [
	^ self
]

{ #category : #basic }
XMLFileHandle >> basicDelete [
	self subclassResponsibility
]

{ #category : #basic }
XMLFileHandle >> basicFileSize [
	"This is named #basicFileSize instead of #basicSize to avoid conflicting
	with the Object>>#basicSize primitive"

	self subclassResponsibility
]

{ #category : #accessing }
XMLFileHandle >> contents [
	^ self readStreamDo: [:readStream | readStream upToEnd]
]

{ #category : #deleting }
XMLFileHandle >> delete [
	self exists
		ifFalse: [self errorFileDoesNotExist].

	[self basicDelete]
		on: Error
		do: [:error | XMLFileException signalMessageFrom: error].
]

{ #category : #private }
XMLFileHandle >> errorFileDoesNotExist [
	XMLFileException
		formatSignal: 'File does does not exist: {1}'
		with: self path
]

{ #category : #private }
XMLFileHandle >> errorFileExceedsMaxSize: aMaxSize [
	XMLLimitException
		formatSignal: 'File exceeds max size of {1} bytes: {2}'
		with: aMaxSize
		with: self path
]

{ #category : #private }
XMLFileHandle >> errorNotAFile [
	XMLFileException
		formatSignal: 'Not a file: {1}'
		with: self path
]

{ #category : #testing }
XMLFileHandle >> exists [
	"returns true if the file exists"

	self subclassResponsibility
]

{ #category : #accessing }
XMLFileHandle >> extension [
	"Returns the file extension, everything after the first '.' of the
	last path segment:
		'one.two/three.txt' asXMLFileHandle extension = 'txt'.
		'one.two/three.tar.gz' asXMLFileHandle extension = 'tar.gz'.
		'one.two/three.four/' asXMLFileHandle extension = ''.
	"
	| i |

	^ ((i := self path lastIndexOf: $/) > 0
		ifTrue: [self path copyFrom: i + 1 to: self path size]
		ifFalse: [self path]) copyAfter: $.
]

{ #category : #resolving }
XMLFileHandle >> get [
	^ self
		getUpToLimit: nil
		decoding: true
]

{ #category : #resolving }
XMLFileHandle >> getUpToLimit: aMaxSize decoding: aBoolean [
	| stream contents |

	"can be safely implemented using streamGetUpToLimit:decoding: rather
	than the other way around like XMLHTTPRequest requires, because files
	are local and can be safely read incrementally, unlike an HTTP response
	which must be read immediately and stored entirely in memory"
	stream :=
		self
			streamGetUpToLimit: aMaxSize
			decoding: aBoolean.
	contents := stream upToEnd.
	stream close.

	^ contents.
]

{ #category : #testing }
XMLFileHandle >> isFile [
	"returns true if the file exists and is a file (not a directory)"

	self subclassResponsibility
]

{ #category : #testing }
XMLFileHandle >> isXMLDocumentFile [
	"Returns true if the file has a known extension of an XML document format
	such as .xml, .xhtml, .xul, but not .dtd, .ent, or other XML-related
	formats that aren't proper XML documents."

	^ self class xmlDocumentFileExtensions includes: self extension asLowercase
]

{ #category : #'instance creation' }
XMLFileHandle >> newFileReadStreamOnPath [
	^ XMLFileReadStreamFactory onPath: self path
]

{ #category : #'instance creation' }
XMLFileHandle >> newFileWriteStreamOnPath [
	^ XMLFileWriteStreamFactory onPath: self path
]

{ #category : #accessing }
XMLFileHandle >> path [
	^ path ifNil: [path := '']
]

{ #category : #printing }
XMLFileHandle >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self path;
		nextPut: $).
]

{ #category : #reading }
XMLFileHandle >> rawReadStream [
	"returns a raw file read stream with no decoding"

	self exists
		ifFalse: [self errorFileDoesNotExist].
	self isFile
		ifFalse: [self errorNotAFile].
	
	^ [self newFileReadStreamOnPath]
		on: Error
		do: [:error | XMLFileException signalMessageFrom: error].
]

{ #category : #writing }
XMLFileHandle >> rawWriteStream [
	"returns a raw file write stream with no encoding; truncates existing files"

	^ [self newFileWriteStreamOnPath]
		on: Error
		do: [:error | XMLFileException signalMessageFrom: error]
]

{ #category : #reading }
XMLFileHandle >> readStream [
	"returns a file read stream with decoding"

	^ (XMLDecodingReadStreamAdapter nonDecodingOn: self rawReadStream)
		detectEncoding
]

{ #category : #reading }
XMLFileHandle >> readStreamDo: aBlock [
	"evaluates aBlock with a file read stream with decoding and automatically
	closes it after"

	| readStream |

	readStream := self readStream.
	^ [aBlock value: readStream]
		ensure: [readStream close].
]

{ #category : #initialization }
XMLFileHandle >> setPath: aPathString [
	path := aPathString
]

{ #category : #accessing }
XMLFileHandle >> size [
	self exists
		ifFalse: [self errorFileDoesNotExist].

	^ self basicFileSize.
]

{ #category : #resolving }
XMLFileHandle >> streamGet [
	^ self
		streamGetUpToLimit: nil
		decoding: true
]

{ #category : #resolving }
XMLFileHandle >> streamGetUpToLimit: aMaxSize decoding: aBoolean [
	(aMaxSize notNil
		and: [self size > aMaxSize])
		ifTrue: [self errorFileExceedsMaxSize: aMaxSize].

	^ aBoolean
		ifTrue: [self readStream]
		ifFalse: [self rawReadStream].
]

{ #category : #writing }
XMLFileHandle >> writeStream [
	"returns a file write stream with encoding; truncates existing files"

	^ XMLEncodingWriteStreamAdapter on: self rawWriteStream
]

{ #category : #writing }
XMLFileHandle >> writeStreamDo: aBlock [
	"evaluates aBlock with a file write stream with encoding and
	automatically closes it after; truncates existing files"

	| writeStream |

	writeStream := self writeStream.
	^ [aBlock value: writeStream]
		ensure: [writeStream close].
]
