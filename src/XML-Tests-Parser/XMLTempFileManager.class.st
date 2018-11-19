"
A class for managing temp files using XMLFileHandles. This has race conditions in it and could leak temp files, so it is only to be used for testing in tests that are normally skipped.
"
Class {
	#name : #XMLTempFileManager,
	#superclass : #Object,
	#instVars : [
		'uniqueFileNames',
		'streamConverter',
		'fileContents',
		'fileSuffix'
	],
	#category : #'XML-Tests-Parser'
}

{ #category : #'instance creation' }
XMLTempFileManager class >> streamConverter: aStreamConverter fileContents: aString fileSuffix: aSuffix [
	^ self new
		setStreamConverter: aStreamConverter
		fileContents: aString
		fileSuffix: aSuffix
]

{ #category : #'file creation' }
XMLTempFileManager >> createFileForHandle: aFileHandle [
	self
		createFileWithContents: ''
		forHandle: aFileHandle
]

{ #category : #'file creation' }
XMLTempFileManager >> createFileWithContents: aString forHandle: aFileHandle [
	aFileHandle writeStream
		streamConverter: self streamConverter;
		nextPutByteOrderMark;
		nextPutAll: aString;
		close
]

{ #category : #'file creation' }
XMLTempFileManager >> createFileWithContentsForHandle: aFileHandle [
	self
		createFileWithContents: self fileContents
		forHandle: aFileHandle
]

{ #category : #accessing }
XMLTempFileManager >> fileContents [
	^ fileContents ifNil: [fileContents := '']
]

{ #category : #accessing }
XMLTempFileManager >> fileSuffix [
	^ fileSuffix ifNil: [fileSuffix := '.temp']
]

{ #category : #'instance creation' }
XMLTempFileManager >> newFileHandle [
	^ self newFileHandleWithSuffix: self fileSuffix
]

{ #category : #'instance creation' }
XMLTempFileManager >> newFileHandleDo: aBlock [
	^ self
		newFileHandleWithSuffix: self fileSuffix
		do: aBlock
]

{ #category : #'instance creation' }
XMLTempFileManager >> newFileHandleWithSuffix: aSuffix [
	| fileHandle |

	"This is an obvious race condition and may also leak temp files,
	but it's good enough for tests that are skipped by default.
	(must avoid doWhileTrue: for GS compatibility)"
	[fileHandle isNil
		or: [fileHandle exists]]
		whileTrue: [
			fileHandle :=
				(self newUniqueFileNameWithSuffix: aSuffix) asXMLFileHandle].
	^ fileHandle.
]

{ #category : #'instance creation' }
XMLTempFileManager >> newFileHandleWithSuffix: aSuffix do: aBlock [
	| fileHandle |

	"This is an obvious race condition and may also leak temp files,
	but it's good enough for tests that are skipped by default."
	fileHandle := self newFileHandleWithSuffix: aSuffix.
	[aBlock value: fileHandle]
		ensure: [
			fileHandle exists
				ifTrue: [fileHandle delete]]
]

{ #category : #'instance creation' }
XMLTempFileManager >> newUniqueFileName [
	^ self newUniqueFileNameWithSuffix: self fileSuffix
]

{ #category : #'instance creation' }
XMLTempFileManager >> newUniqueFileNameWithSuffix: aSuffix [
	| uniqueFileName oldSize |

	"Try to come up with a unique file name.
	This is good enough for tests that are skipped by default.
	(must avoid doWhileTrue: for GS compatibility)"
	[uniqueFileName isNil
		or: [
			oldSize := self uniqueFileNames size.
			(self uniqueFileNames
				add: uniqueFileName;
				size) = oldSize]]
		whileTrue: [
			uniqueFileName :=
				'XMLTempFile{1}-{2}{3}' format:
					(Array
						with: self identityHash asString
						with: (0 to: 100000) atRandom asString
						with: aSuffix)].
	^ uniqueFileName.
]

{ #category : #initialization }
XMLTempFileManager >> setStreamConverter: aStreamConverter fileContents: aString fileSuffix: aSuffix [
	streamConverter := aStreamConverter.
	fileContents := aString.
	fileSuffix := aSuffix.
]

{ #category : #accessing }
XMLTempFileManager >> streamConverter [
	^ streamConverter ifNil: [streamConverter := XMLStreamConverter default]
]

{ #category : #private }
XMLTempFileManager >> uniqueFileNames [
	^ uniqueFileNames ifNil: [uniqueFileNames := Set new]
]
