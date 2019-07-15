Class {
	#name : #XMLFileHandleTest,
	#superclass : #XMLSkippableTest,
	#instVars : [
		'tempFileManager',
		'currentWorkingDirectoryFileHandle'
	],
	#category : #'XML-Tests-Parser-Files'
}

{ #category : #testing }
XMLFileHandleTest class >> isAbstract [
	^ false
]

{ #category : #testing }
XMLFileHandleTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
XMLFileHandleTest class >> skippableTests [
	^ #(#testContents #testDelete
		#testExists #testExtension
		#testGet #testGetUpToLimitDecoding
		#testIsFile #testIsXMLDocumentFile
		#testRawReadStream #testRawWriteStream
		#testReadStream #testReadStreamDo
		#testSize #testStreamGet
		#testStreamGetUpToLimitDecoding
		#testWriteStream #testWriteStreamDo)
]

{ #category : #asserting }
XMLFileHandleTest >> assertIsDecodedFileContents: aCollection [
	self
		assert: aCollection isString;
		assert: aCollection = self decodedFileContents
]

{ #category : #asserting }
XMLFileHandleTest >> assertIsEncodedFileContentsWithBOM: aCollection [
	^ self assert:
		aCollection asByteArray =
			self encodedFileContentsWithByteOrderMark asByteArray
]

{ #category : #accessing }
XMLFileHandleTest >> currentWorkingDirectoryFileHandle [
	^ currentWorkingDirectoryFileHandle
		ifNil: [
			currentWorkingDirectoryFileHandle :=
				XMLFileHandle currentWorkingDirectory asXMLFileHandle]
]

{ #category : #accessing }
XMLFileHandleTest >> decodedFileContents [
	^ 'test'
]

{ #category : #accessing }
XMLFileHandleTest >> encodedFileContents [
	^ XMLStreamAdapterTest binaryFrom: 'test'
]

{ #category : #accessing }
XMLFileHandleTest >> encodedFileContentsWithByteOrderMark [
	^ (self streamConverterClass byteOrderMarkBytes, self encodedFileContents)
		asByteArray
]

{ #category : #accessing }
XMLFileHandleTest >> streamConverterClass [
	^ XMLNullStreamConverter
]

{ #category : #accessing }
XMLFileHandleTest >> tempFileManager [
	^ tempFileManager
		ifNil: [
			tempFileManager :=
				XMLTempFileManager
					streamConverter: self streamConverterClass new
					fileContents: self decodedFileContents
					fileSuffix: '.txt']
]

{ #category : #tests }
XMLFileHandleTest >> testAsXMLFileHandle [
	XMLFileHandle hasSupportedImplementation
		ifTrue: [| fileHandle |
			fileHandle := '' asXMLFileHandle.
			self
				assert: fileHandle class == XMLFileHandle implementation;
				assert: fileHandle asXMLFileHandle == fileHandle]
]

{ #category : #tests }
XMLFileHandleTest >> testContents [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testContents.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self
			should: [fileHandle contents]
			raise: XMLFileException.
		self
			should: [self currentWorkingDirectoryFileHandle contents]
			raise: XMLFileException.

		self tempFileManager createFileWithContentsForHandle: fileHandle.
		self assertIsDecodedFileContents: fileHandle contents].
]

{ #category : #tests }
XMLFileHandleTest >> testDelete [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testDelete.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self
			should: [fileHandle delete]
			raise: XMLFileException.

		self tempFileManager createFileForHandle: fileHandle.
		self
			assert: fileHandle delete == fileHandle;
			deny: fileHandle exists.

		self
			should: [fileHandle delete]
			raise: XMLFileException].
]

{ #category : #tests }
XMLFileHandleTest >> testExists [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testExists.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self
			deny: fileHandle exists;
			assert: self currentWorkingDirectoryFileHandle exists.

		self tempFileManager createFileForHandle: fileHandle.
		self assert: fileHandle exists].
]

{ #category : #tests }
XMLFileHandleTest >> testExtension [
	XMLFileHandle hasSupportedImplementation
		ifFalse: [^ self].

	self
		assert: '' asXMLFileHandle extension = '';
		assert: 'one' asXMLFileHandle extension = '';
		assert: 'one.two' asXMLFileHandle extension = 'two';
		assert: 'one.two.three' asXMLFileHandle extension = 'two.three';
		assert: '/' asXMLFileHandle extension = '';
		assert: '/one' asXMLFileHandle extension = '';
		assert: '/one.two' asXMLFileHandle extension = 'two';
		assert: '/one.two.three' asXMLFileHandle extension = 'two.three';
		assert: 'one/' asXMLFileHandle extension = '';
		assert: 'one/two' asXMLFileHandle extension = '';
		assert: 'one/two.three' asXMLFileHandle extension = 'three';
		assert: 'one/two.three.four' asXMLFileHandle extension = 'three.four';
		assert: 'one/two/' asXMLFileHandle extension = '';
		assert: 'one/two.three/' asXMLFileHandle extension = '';
		assert: 'one/two.three.four/' asXMLFileHandle extension = ''.
]

{ #category : #tests }
XMLFileHandleTest >> testGet [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testGet.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self
			should: [fileHandle get]
			raise: XMLFileException.

		self tempFileManager createFileWithContentsForHandle: fileHandle.
		self assertIsDecodedFileContents: fileHandle get].
]

{ #category : #tests }
XMLFileHandleTest >> testGetUpToLimitDecoding [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testGetUpToLimitDecoding.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self
			should: [
				fileHandle
					getUpToLimit: nil
					decoding: true]
			raise: XMLFileException.

		self tempFileManager createFileWithContentsForHandle: fileHandle.

		self assertIsDecodedFileContents:
			(fileHandle
				getUpToLimit: nil
				decoding: true).
		self assertIsEncodedFileContentsWithBOM:
			(fileHandle
				getUpToLimit: nil
				decoding: false).

		self assertIsDecodedFileContents:
			(fileHandle
				getUpToLimit: self encodedFileContentsWithByteOrderMark size
				decoding: true).
		self assertIsEncodedFileContentsWithBOM:
			(fileHandle
				getUpToLimit: self encodedFileContentsWithByteOrderMark size
				decoding: false).

		self
			should: [
				fileHandle
					getUpToLimit: self encodedFileContentsWithByteOrderMark size - 1
					decoding: true]
			raise: XMLLimitException.
		self
			should: [
				fileHandle
					getUpToLimit: self encodedFileContentsWithByteOrderMark size - 1
					decoding: false]
			raise: XMLLimitException].
]

{ #category : #tests }
XMLFileHandleTest >> testIsFile [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testIsFile.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self
			deny: fileHandle isFile;
			deny: self currentWorkingDirectoryFileHandle isFile.

		self tempFileManager createFileForHandle: fileHandle.
		self assert: fileHandle isFile].
]

{ #category : #tests }
XMLFileHandleTest >> testIsXMLDocumentFile [
	XMLFileHandle hasSupportedImplementation
		ifFalse: [^ self].

	#('atom' 'dbk' 'docm' 'docx' 'pptm' 'pptx' 'rdf' 'rss' 'svg' 'xbel'
		'xfd' 'xfdl' 'xhtml' 'xlsm' 'xlsx' 'xml' 'xsd' 'xspf' 'xul')
		do: [:each | | file |
			file := 'test.', each.
			self
				assert: file asXMLFileHandle isXMLDocumentFile;
				assert: file asUppercase asXMLFileHandle isXMLDocumentFile].

	#('txt' 'html' 'jpeg' 'jpg' 'gif' 'dtd' 'ent')
		do: [:each | | file |
			file := 'test.', each.
			self
				deny: file asXMLFileHandle isXMLDocumentFile;
				deny: file asUppercase asXMLFileHandle isXMLDocumentFile].
]

{ #category : #tests }
XMLFileHandleTest >> testPath [
	XMLFileHandle hasSupportedImplementation
		ifTrue: [| fileHandle |
			fileHandle := XMLFileHandle implementation path: 'test'.
			self
				assert: fileHandle class == XMLFileHandle implementation;
				assert: fileHandle path = 'test']
]

{ #category : #tests }
XMLFileHandleTest >> testRawReadStream [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testRawReadStream.

	self tempFileManager newFileHandleDo: [:fileHandle | | readStream |
		self
			should: [fileHandle rawReadStream]
			raise: XMLFileException.

		self tempFileManager createFileWithContentsForHandle: fileHandle.
		readStream := fileHandle rawReadStream.
		self
			deny: readStream isXMLConvertingStreamAdapter;
			assertIsEncodedFileContentsWithBOM: readStream upToEnd.
		readStream close].
]

{ #category : #tests }
XMLFileHandleTest >> testRawWriteStream [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testRawWriteStream.

	self tempFileManager newFileHandleDo: [:fileHandle |
		"evaluate twice to ensure it truncates existing contents when opening"
		2 timesRepeat: [| writeStream |
			writeStream := fileHandle rawWriteStream.
			self deny: writeStream isXMLConvertingStreamAdapter.

			writeStream
				nextPutAll: self encodedFileContentsWithByteOrderMark;
				close.
			self assertIsDecodedFileContents: fileHandle contents]].
]

{ #category : #tests }
XMLFileHandleTest >> testReadStream [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testReadStream.

	self tempFileManager newFileHandleDo: [:fileHandle | | readStream |
		self
			should: [fileHandle readStream]
			raise: XMLFileException.

		self tempFileManager createFileWithContentsForHandle: fileHandle.
		readStream := fileHandle readStream.
		self
			assert: readStream isXMLConvertingStreamAdapter;
			assertIsDecodedFileContents: readStream upToEnd.
		readStream close].
]

{ #category : #tests }
XMLFileHandleTest >> testReadStreamDo [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testReadStreamDo.

	self tempFileManager newFileHandleDo: [:fileHandle | | contents |
		self
			should: [fileHandle readStreamDo: [:readStream | ]]
			raise: XMLFileException.

		self tempFileManager createFileWithContentsForHandle: fileHandle.
		fileHandle readStreamDo: [:readStream |
			self assert: readStream isXMLConvertingStreamAdapter.
			"saved to a temp to ensure the block was evaluated"
			contents := readStream upToEnd].
		self assertIsDecodedFileContents: contents].
]

{ #category : #tests }
XMLFileHandleTest >> testSize [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testSize.

	self tempFileManager newFileHandleDo: [:fileHandle |
		self
			should: [fileHandle size]
			raise: XMLFileException.

		self tempFileManager createFileWithContentsForHandle: fileHandle.
		self assert:
			fileHandle size >=
				self encodedFileContentsWithByteOrderMark size].
]

{ #category : #tests }
XMLFileHandleTest >> testStreamGet [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testStreamGet.

	self tempFileManager newFileHandleDo: [:fileHandle | | readStream |
		self
			should: [fileHandle streamGet]
			raise: XMLFileException.

		self tempFileManager createFileWithContentsForHandle: fileHandle.
		readStream := fileHandle streamGet.
		self
			assert: readStream isXMLConvertingStreamAdapter;
			assertIsDecodedFileContents: readStream upToEnd.
		readStream close].
]

{ #category : #tests }
XMLFileHandleTest >> testStreamGetUpToLimitDecoding [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testStreamGetUpToLimitDecoding.

	self tempFileManager newFileHandleDo: [:fileHandle | | readStream |
		self
			should: [
				fileHandle
					streamGetUpToLimit: nil
					decoding: true]
			raise: XMLFileException.

		self tempFileManager createFileWithContentsForHandle: fileHandle.

		readStream :=
			fileHandle
				streamGetUpToLimit: nil
				decoding: true.
		self
			assert: readStream isXMLConvertingStreamAdapter;
			assertIsDecodedFileContents: readStream upToEnd.
		readStream close.
		readStream :=
			fileHandle
				streamGetUpToLimit: nil
				decoding: false.
		self
			deny: readStream isXMLConvertingStreamAdapter;
			assertIsEncodedFileContentsWithBOM: readStream upToEnd.
		readStream close.

		readStream :=
			fileHandle
				streamGetUpToLimit: self encodedFileContentsWithByteOrderMark size
				decoding: true.
		self
			assert: readStream isXMLConvertingStreamAdapter;
			assertIsDecodedFileContents: readStream upToEnd.
		readStream close.
		readStream :=
			fileHandle
				streamGetUpToLimit: self encodedFileContentsWithByteOrderMark size
				decoding: false.
		self
			deny: readStream isXMLConvertingStreamAdapter;
			assertIsEncodedFileContentsWithBOM: readStream upToEnd.
		readStream close.

		self
			should: [
				fileHandle
					streamGetUpToLimit:
						self encodedFileContentsWithByteOrderMark size - 1
					decoding: true]
			raise: XMLLimitException.
		self
			should: [
				fileHandle
					streamGetUpToLimit:
						self encodedFileContentsWithByteOrderMark size - 1
					decoding: false]
			raise: XMLLimitException].
]

{ #category : #tests }
XMLFileHandleTest >> testWriteStream [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testWriteStream.

	self tempFileManager newFileHandleDo: [:fileHandle |
		"evaluate twice to ensure it truncates existing contents when opening"
		2 timesRepeat: [| writeStream |
			writeStream := fileHandle writeStream.
			self
				assert: writeStream isXMLConvertingStreamAdapter;
				assert: writeStream hasDefaultStreamConverter.

			writeStream
				streamConverter: self streamConverterClass new;
				nextPutByteOrderMark;
				nextPutAll: self decodedFileContents;
				close.
			self assertIsDecodedFileContents: fileHandle contents]].
]

{ #category : #tests }
XMLFileHandleTest >> testWriteStreamDo [
	self
		skipOrReturnWith: [^ self]
		ifSkippable: #testWriteStreamDo.

	self tempFileManager newFileHandleDo: [:fileHandle |
		"evaluate twice to ensure it truncates existing contents when opening"
		2 timesRepeat: [
			fileHandle writeStreamDo: [:writeStream |
				self
					assert: writeStream isXMLConvertingStreamAdapter;
					assert: writeStream hasDefaultStreamConverter.

				writeStream
					streamConverter: self streamConverterClass new;
					nextPutByteOrderMark;
					nextPutAll: self decodedFileContents].
			self assertIsDecodedFileContents: fileHandle contents]].
]
