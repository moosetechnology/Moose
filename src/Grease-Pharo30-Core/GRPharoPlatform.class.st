"
A WASqueakPlatform is the Squeak implementation of SeasidePlatformSupport, the Seaside class that provides functionality that can not be implemented in a platform independent way.

"
Class {
	#name : #GRPharoPlatform,
	#superclass : #GRPlatform,
	#classVars : [
		'UrlTable',
		'XmlTable'
	],
	#category : #'Grease-Pharo30-Core'
}

{ #category : #'class initialization' }
GRPharoPlatform class >> initialize [
	self initializeXmlTable.
	self initializeUrlTable.
	self select
]

{ #category : #'class initialization' }
GRPharoPlatform class >> initializeUrlTable [
	UrlTable := ByteArray new: 256.
	1 to: 256 do: [ :index |
		('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~' includes: (Character codePoint: index - 1))
			ifTrue: [ UrlTable at: index put: 0 ]
			ifFalse: [ UrlTable at: index put: 1 ] ]
]

{ #category : #'class initialization' }
GRPharoPlatform class >> initializeXmlTable [
	XmlTable := ByteArray new: 256.
	1 to: 256 do: [ :index |
		('"<&>' includes: (Character codePoint: index - 1))
			ifTrue: [ XmlTable at: index put: 1 ]
			ifFalse: [ XmlTable at: index put: 0 ] ]
]

{ #category : #'class initialization' }
GRPharoPlatform class >> unload [
	self unselect
]

{ #category : #startup }
GRPharoPlatform >> addToShutDownList: anObject [
	"Add anObject to the shutdown-list of the system. On shutdown the message #shutDown will be sent to anObject."

	Smalltalk addToShutDownList: anObject
]

{ #category : #startup }
GRPharoPlatform >> addToStartUpList: anObject [
	"Add anObject to the startup-list of the system. On startup the message #startUp will be sent to anObject."

	Smalltalk addToStartUpList: anObject
]

{ #category : #'file library' }
GRPharoPlatform >> asMethodReturningByteArray: aByteArrayOrString named: aSymbol [
	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a ByteArray"
	^ self useByteArrayLiterals
		ifTrue: [ self asMethodReturningByteArrayLiteral: aByteArrayOrString named: aSymbol ]
		ifFalse: [ self asMethodReturningByteArrayWithCache: aByteArrayOrString named: aSymbol ]
]

{ #category : #'private-file library' }
GRPharoPlatform >> asMethodReturningByteArrayLiteral: aByteArrayOrString named: aSymbol [
	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a byte array using VW/NewCompiler byte array literal syntax."
	^ String streamContents: [ :stream |
		stream nextPutAll: aSymbol; nextPut: Character cr.
		stream tab; nextPutAll: '^ #['.
		aByteArrayOrString asByteArray
			do: [ :each | each printOn: stream ]
			separatedBy: [ stream space ].
		stream nextPutAll: ']' ]
]

{ #category : #'private-file library' }
GRPharoPlatform >> asMethodReturningByteArrayWithCache: aByteArrayOrString named: aSymbol [
	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a byte array and caching this array in a literal array of size 1."
	^ String streamContents: [ :stream |
		stream nextPutAll: aSymbol; nextPut: Character cr.
		stream tab; nextPutAll: '^ #('.
		aByteArrayOrString asByteArray
			do: [ :each | each printOn: stream ]
			separatedBy: [ stream space ].
		stream nextPutAll: ') asByteArray' ]
]

{ #category : #encoding }
GRPharoPlatform >> base64Decode: aString [
	^ (Base64MimeConverter mimeDecodeToChars: aString readStream) contents
]

{ #category : #bindings }
GRPharoPlatform >> bindingOf: aClass [
	
	^ Smalltalk globals associationAt: aClass name
]

{ #category : #'file library' }
GRPharoPlatform >> compile: aString into: aClass classified: aSymbol [ 
	aClass compile: aString classified: aSymbol
]

{ #category : #'file library' }
GRPharoPlatform >> contentsOfFile: aString binary: aBoolean [
	^ self fileStreamOn: aString do: [ :stream | stream contents ] binary: aBoolean
]

{ #category : #'file library' }
GRPharoPlatform >> directoriesIn: aPathString [
	"Answer a collection of absolute paths for all the directories (no files) in the directory given by aPathString
	must not include directory names that start with ."
	^ Array streamContents: [ :stream | 
		FileSystem disk directoriesAt: aPathString do: [ :each |
			each basename first = $. ifFalse: [
				stream nextPut: each asFileReference fullName  ] ] ]
]

{ #category : #private }
GRPharoPlatform >> doSilently: aBlock [
	^ SystemAnnouncer uniqueInstance suspendAllWhile:  aBlock
]

{ #category : #'file library' }
GRPharoPlatform >> ensureExistenceOfFolder: aString [
	"creates a folder named aString in the image directory"
	FileSystem disk ensureCreateDirectory: aString
]

{ #category : #'file library' }
GRPharoPlatform >> fileExists: aString [
	^ aString asFileReference exists 
]

{ #category : #'file library' }
GRPharoPlatform >> fileStreamOn: aString do: aBlock binary: aBoolean [
	^ aBoolean
		ifTrue: [
			FileStream fileNamed: aString do: [ :stream |
				stream binary.
				aBlock value: stream ] ]
		ifFalse: [
			MultiByteFileStream fileNamed: aString do: [ :stream |
				stream
					ascii;
					wantsLineEndConversion: true.
					aBlock value: stream ] ]
]

{ #category : #'file library' }
GRPharoPlatform >> filesIn: aPathString [
	"Return a collection of absolute paths for all the files (no directories) in the directory given by aPathString
	must not include file names that start with ."
	^ Array streamContents: [ :stream | 
		FileSystem disk filesAt: aPathString do: [ :each |
			each basename first = $. ifFalse: [
				stream nextPut: each asFileReference fullName  ] ] ]
]

{ #category : #processes }
GRPharoPlatform >> isProcessTerminated: aProcess [
	"Return a boolean indicating whether aProcess has been terminated."
	^ aProcess isTerminated
]

{ #category : #'version info' }
GRPharoPlatform >> label [
	^ 'Pharo'
]

{ #category : #'file library' }
GRPharoPlatform >> localNameOf: aFilename [
	^ (FileSystem disk resolveString: aFilename) basename
]

{ #category : #factory }
GRPharoPlatform >> newRandom [
	"Answers the random number generator to be used to create session and continuation keys. Make sure it is seeded. They only methods that will be sent to it are:
	  #nextInt: - should answer a random integer in the interval [1, anInteger]
	  #randomFrom: - should answer a random element from the given collection
	
	Make sure that both methods are safe under heavy concurrent load.
	
	Used by Gemstone/S traditional Randoms which cannot be persisted.."
	^ GRPharoRandomProvider
]

{ #category : #'file library' }
GRPharoPlatform >> newline [
	^ String cr
]

{ #category : #exceptions }
GRPharoPlatform >> openDebuggerOn: anError [
	| process |
	process := Processor activeProcess.
	"If we are running in the UI process, we don't want to suspend the active process. The
	error was presumably triggered while stepping in the Debugger. If we simply immediately
	signal an UnhandledError, the debugger will catch this and display the signaling context.
	It isn't perfect or pretty but it works."
	(ProcessBrowser isUIProcess: process)
		ifTrue: [
			UnhandledError signalForException: anError ]
		ifFalse: [
			WorldState addDeferredUIMessage: [
				process
					debug: anError signalerContext
					title: anError description
					full: true ].
			process suspend ]
]

{ #category : #'file library' }
GRPharoPlatform >> pathSeparator [
	^ String with: FileSystem disk delimiter
]

{ #category : #factory }
GRPharoPlatform >> readWriteByteStream [
	"ByteArray based read write stream"
	
	^ RWBinaryOrTextStream on: (ByteArray new: 4096)
]

{ #category : #factory }
GRPharoPlatform >> readWriteCharacterStream [
	"String based read write stream"

	^ ReadWriteStream on: (String new: 4096)
]

{ #category : #startup }
GRPharoPlatform >> removeFromShutDownList: anObject [
	"Remove anObject from the shutdown list in the system."

	Smalltalk removeFromShutDownList: anObject
]

{ #category : #startup }
GRPharoPlatform >> removeFromStartUpList: anObject [
	"Remove anObject from the startup list in the system."

	Smalltalk removeFromStartUpList: anObject
]

{ #category : #'file library' }
GRPharoPlatform >> removeSelector: aSymbol from: aClass [
	aClass removeSelector: aSymbol
]

{ #category : #cryptography }
GRPharoPlatform >> secureHashFor: aString [
	^ SHA1 new hashMessage: aString
]

{ #category : #factory }
GRPharoPlatform >> semaphoreClass [
	"used by Gemstone/S traditional Semaphores which cannot be persisted"
	^ Semaphore
]

{ #category : #exceptions }
GRPharoPlatform >> stackDepth [

	| depth current |
	depth := 0.
	current := thisContext.
	[ current isNil ] whileFalse: [
		current := current sender.
		depth := depth + 1 ].
	^ depth - 1
]

{ #category : #processes }
GRPharoPlatform >> terminateProcess: aProcess [
	"Permanently terminate the process, unwinding first to execute #ensure: and #ifCurtailed: blocks."
	aProcess terminate
]

{ #category : #'private-file library' }
GRPharoPlatform >> useByteArrayLiterals [
	"whether ByteArray literals can/should be used"
	^ true
]

{ #category : #factory }
GRPharoPlatform >> weakDictionaryOfSize: aNumber [
	^ IdentityDictionary new: aNumber
]

{ #category : #'file library' }
GRPharoPlatform >> write: aStringOrByteArray toFile: aFileNameString inFolder: aFolderString [
	"writes aStringOrByteArray to a file named aFilenameString in the folder aFolderString"
	| folder stream fullFilePath |
	folder := FileSystem disk resolveString: aFolderString.
	fullFilePath := (folder / aFileNameString) asFileReference.
	stream := aStringOrByteArray isString
		ifTrue: [
			(MultiByteFileStream forceNewFileNamed: fullFilePath fullName)
				ascii;
				wantsLineEndConversion: true;
				yourself ]
		ifFalse: [ (FileStream forceNewFileNamed: fullFilePath fullName) binary ].
	[ stream nextPutAll: aStringOrByteArray ]
		ensure: [ stream close ]
]

{ #category : #factory }
GRPharoPlatform >> writeCharacterStreamOn: aString [

	^ GRWorkingWriteStream on: aString
]
