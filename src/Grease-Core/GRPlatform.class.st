"
The abstract platform implementation. Each platform should provide a subclass implementing any abstract methods and overriding any other methods as necessary.

Default implementations should be provided here when possible/useful but default implementations MUST be valid on ALL PLATFORMS so it is rarely practical. VA Smalltalk flags sends of uknown messages so even these must be known to exist on all platforms.

Common cases where default implementations *are* appropriate are where there is a standard implementation that is valid on all platforms but one or more platforms have an additional, optimized implementation that should be used instead.

All classes and methods used by methods of this class should be either:
  + included in the Seaside-Platform package;
  + defined by the ANSI Smalltalk standard; or
  + (not ideal) referenced via 'Smalltalk at: #ClassName'.
"
Class {
	#name : #GRPlatform,
	#superclass : #GRObject,
	#classVars : [
		'Current'
	],
	#category : #'Grease-Core'
}

{ #category : #registration }
GRPlatform class >> current [

	^ Current
]

{ #category : #registration }
GRPlatform class >> current: aPlatform [
	Current := aPlatform
]

{ #category : #registration }
GRPlatform class >> select [
	GRPlatform current: self new
]

{ #category : #registration }
GRPlatform class >> unselect [
	GRPlatform current class = self ifTrue: [ GRPlatform current: nil ]
]

{ #category : #startup }
GRPlatform >> addToShutDownList: anObject [
	"Add anObject to the shutdown-list of the system. On shutdown the message #shutDown will be sent to anObject."
	self subclassResponsibility
]

{ #category : #startup }
GRPlatform >> addToStartUpList: anObject [
	"Add anObject to the startup-list of the system. On startup the message #startUp will be sent to anObject."
	self subclassResponsibility
]

{ #category : #'file library' }
GRPlatform >> asMethodReturningByteArray: aByteArrayOrString named: aSymbol [
	"Generates the source of a method named aSymbol that returns aByteArrayOrString as a ByteArray"
	self subclassResponsibility
]

{ #category : #encoding }
GRPlatform >> base64Decode: aString [
	"Base64 decode the given String and answer the result as a String."
	self subclassResponsibility
]

{ #category : #bindings }
GRPlatform >> bindingOf: aClass [
	"Answer the binding of aClass.
	The binding is the literal that get compiled into the method.
	We need the binding to be updated when the class is changed.
	The binding has to respond to #value.
	
	This is mostly an issue on GemStone/S because when we hold on
	to a class directly we will end up holding on to an old class version.
	
	Dialects with namespaces will need to override this.
	
	On VisualWorks this should like this
	^ aClass fullyQualifiedReference"
	^ Smalltalk associationAt: aClass name
]

{ #category : #'file library' }
GRPlatform >> compile: aString into: aClass classified: aSymbol [
	"The trick here is to be as silently a possible so that the package is not marked dirty when running WAFileLibrary test.
	This also makes running tests much faster."
	self subclassResponsibility
]

{ #category : #'file library' }
GRPlatform >> contentsOfFile: aString binary: aBoolean [
	self subclassResponsibility
]

{ #category : #'file library' }
GRPlatform >> convertToSmalltalkNewlines: aString [
	"Convert any line endings (CR, CRLF, LF) to the default platform newline."
	
	aString isNil 
		ifTrue: [ ^ nil ].
	^ String streamContents: [ :writeStream |
		| readStream |
		readStream := aString readStream.
		[ readStream atEnd ] whileFalse: [
			| next |
			next := readStream next.
			next = Character cr
				ifTrue: [
					readStream peek = Character lf
						ifTrue: [ readStream skip: 1 ].
					writeStream nextPutAll: self newline ]
				ifFalse: [
					next = Character lf
						ifTrue: [ writeStream nextPutAll: self newline ]
						ifFalse: [ writeStream nextPut: next ] ] ] ]
]

{ #category : #exceptions }
GRPlatform >> deprecationExceptionSet [
	"Answer the exception set that should considered besides WADeprecation."
	^ ExceptionSet new
]

{ #category : #'file library' }
GRPlatform >> directoriesIn: aPathString [
	"Answer a collection of absolute paths for all the directories (no files) in the directory given by aPathString
	must not include directory names that start with ."
	self subclassResponsibility
]

{ #category : #transactions }
GRPlatform >> doTransaction: aBlock [
	"for Gemstone/S compatibility
	http://gemstonesoup.wordpress.com/2007/05/10/porting-application-specific-seaside-threads-to-gemstone/
	use when modifying an object from an outside thread"

	^ aBlock value
]

{ #category : #'file library' }
GRPlatform >> ensureExistenceOfFolder: aString [
	"Create a folder named aString in the image directory."
	self subclassResponsibility
]

{ #category : #'file library' }
GRPlatform >> fileExists: aString [
	self subclassResponsibility 
]

{ #category : #'file library' }
GRPlatform >> fileStreamOn: aString do: aBlock binary: aBoolean [
	self subclassResponsibility 
]

{ #category : #'file library' }
GRPlatform >> filesIn: aPathString [
	"Answer a collection of absolute paths for all the files (no directories) in the directory given by aPathString
	must not include file names that start with ."
	self subclassResponsibility
]

{ #category : #processes }
GRPlatform >> isProcessTerminated: aProcess [
	"Return a boolean indicating whether aProcess has been terminated."
	
	self subclassResponsibility
]

{ #category : #'version info' }
GRPlatform >> label [
	"Answer a descriptive label string for the platform implementation"
	
	self subclassResponsibility
]

{ #category : #'file library' }
GRPlatform >> localNameOf: aFilename [
	"Answer the local name of a file identified by an absolute file path.
	
	Eg.
	If the platform is Windwos and aFilename is 'C:\Windows\win32.dll' then it would answer 'win32.dll'.
	If the platform is Unix and aFilename is '/usr/bin/vim' then it would answer 'vim'."
	self subclassResponsibility
]

{ #category : #factory }
GRPlatform >> newRandom [
	"Answers the random number generator to be used to create session and continuation keys. Make sure it is seeded. They only methods that will be sent to it are:
	  #nextInt: - should answer a random integer in the interval [1, anInteger]
	  #randomFrom: - should answer a random element from the given collection
	
	Make sure that both methods are safe under heavy concurrent load.
	
	Used by Gemstone/S traditional Randoms which cannot be persisted.
	Used by Squeak to use a secure random when avaiable."
	self subclassResponsibility
]

{ #category : #'file library' }
GRPlatform >> newline [
	"Answer a String with the default newline character of this platform."
	
	self subclassResponsibility
]

{ #category : #exceptions }
GRPlatform >> openDebuggerOn: anError [
	self subclassResponsibility
]

{ #category : #'file library' }
GRPlatform >> pathSeparator [
	"Answer the path separator as a String, eg. '/' on Unix and '\' on Windows."
	self subclassResponsibility
]

{ #category : #factory }
GRPlatform >> readWriteByteStream [
	"Return a ReadWriteStream on a ByteArray that stores integers 0..255
		^ReadWriteStream on: ByteArray new
	"

	^ self subclassResponsibility
]

{ #category : #factory }
GRPlatform >> readWriteCharacterStream [
	"Return a ReadWriteStream on a String that stores characters
		^ReadWriteStream on: String new
	"

	^ self subclassResponsibility
]

{ #category : #factory }
GRPlatform >> reducedConflictDictionary [
	"used by Gemstone/S reduced conflict classes that can be used to avoid transaction conflicts"
	^ Dictionary
]

{ #category : #startup }
GRPlatform >> removeFromShutDownList: anObject [
	"Remove anObject from the shutdown list in the system."
	self subclassResponsibility
]

{ #category : #startup }
GRPlatform >> removeFromStartUpList: anObject [
	"Remove anObject from the startup list in the system."
	self subclassResponsibility
]

{ #category : #'file library' }
GRPlatform >> removeSelector: aSymbol from: aClass [
	self subclassResponsibility
]

{ #category : #cryptography }
GRPlatform >> secureHashFor: aString [
	self subclassResponsibility
]

{ #category : #factory }
GRPlatform >> semaphoreClass [
	"used by Gemstone/S traditional Semaphores which cannot be persisted"
	self subclassResponsibility
]

{ #category : #exceptions }
GRPlatform >> stackDepth [
	self subclassResponsibility
]

{ #category : #processes }
GRPlatform >> terminateProcess: aProcess [
	"Permanently terminate the process, unwinding first to execute #ensure: and #ifCurtailed: blocks."
	
	self subclassResponsibility
]

{ #category : #'version info' }
GRPlatform >> version [
	"Answer the Grease version"

	^ (GRVersion major: 1 minor: 1 revision: 10)
		yourself
]

{ #category : #'version info' }
GRPlatform >> versionString [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: (self version greaseString);
			nextPutAll: ' (';
			nextPutAll: (self label);
			nextPut: $) ]
]

{ #category : #factory }
GRPlatform >> weakDictionaryOfSize: aNumber [
	self subclassResponsibility
]

{ #category : #'file library' }
GRPlatform >> write: aStringOrByteArray toFile: aFileNameString inFolder: aFolderString [
	"Write aStringOrByteArray to a file named aFileNameString in the folder aFolderString."
	self subclassResponsibility
]

{ #category : #factory }
GRPlatform >> writeCharacterStreamOn: aString [
	"String based write stream"

	^ WriteStream on: aString
]
