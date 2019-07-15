"
I provide locations for external files.

- The ==#baseDirectory== is the place where Magritte puts its file-database. Keep this value to nil to make it default to a subdirectory next to the Smalltalk image.
- The ==#baseUrl== is a nice optimization to allow Apache (or any other Web Server) to directly serve the files. ==#baseUrl== is an absolute URL-prefix that is used to generate the path to the file. If you have specified one the file data does not go trough the image anymore, but instead is directly served trough the properly configured Web Server.

The files are currently stored using the following scheme:

=/files/9d/bsy8kyp45g0q7blphknk48zujap2wd/earthmap1k.jpg
=1     2   3                            						  4

1. is the #baseDirectory as specified in the settings.
2. Are 256 directories named '00' to 'ff' to avoid having thousands of files in the same directory. Unfortunately this leads to problems with the Squeak file primitives and some filesystems don't handle that well. This part is generated at random.
3. This is a secure ID, similar to the Seaside session key. It is generated at random and provides a security system that even works through Apache (you have to disable directory listings of course): if you don't know the filename you can not access the file.
4. This is the original filename. Subclasses might want to store other cached versions of the same file there, for example resized images, etc.
"
Class {
	#name : #MAFileDatabase,
	#superclass : #Object,
	#classInstVars : [
		'baseDirectory',
		'baseUrl'
	],
	#category : #'Magritte-Pharo3-Model'
}

{ #category : #accessing }
MAFileDatabase class >> baseDirectory [
	^ baseDirectory ifNil: [ FileLocator imageDirectory / 'files' ].
]

{ #category : #accessing }
MAFileDatabase class >> baseDirectory: aStringOrDirectory [
	"Defines where the files are stored. If this value is set to nil, it defaults to a subdirectory of of the current image-location."

	baseDirectory := aStringOrDirectory asFileReference.
]

{ #category : #accessing }
MAFileDatabase class >> baseUrl [
	^ baseUrl
]

{ #category : #accessing }
MAFileDatabase class >> baseUrl: aString [
	"Defines the base-URL where the files are served from, when using an external web server. This setting is left to nil by default, causing the files to be served trough the image."

	baseUrl := aString isNil ifFalse: [
		aString last = $/
			ifFalse: [ aString ]
			ifTrue: [ aString copyUpToLast: $/ ] ]
]

{ #category : #public }
MAFileDatabase class >> garbageCollect [
	"Remove obsolete files from the file-system that are not referenced from the image anymore. This method has to be called manually and is not intended to be portable."
	
	| mark sweep |
	mark := self allInstances
		collect: [ :each | each directory ].
	sweep := Array with: self baseDirectory.
	self locationDefinition do: [ :definition |
		sweep := sweep gather: [ :directory |
			directory hasChildren ifFalse: [ directory delete ].
			FileLocator imageDirectory directories select: [ :e | e basename size = definition first ] ] ].
	sweep do: [ :directory |
		(mark includes: directory) ifFalse: [ directory recursiveDelete ] ]
]

{ #category : #public }
MAFileDatabase class >> locationDefinition [
	^ #( ( 2 '63450af8d9c2e17b' ) ( 30 'iaojv41bw67e0tud5m9rgplqfy8x3cs2kznh' ) )
]

{ #category : #accessing }
MAFileDatabase >> baseDirectory [

	^ self class baseDirectory.
]

{ #category : #accessing }
MAFileDatabase >> baseUrl [

	^ self class baseUrl.
]

{ #category : #private }
MAFileDatabase >> randomIdentifierName [

	| digits idLength allowedCharacters |
	digits := $0 to: $9.
	allowedCharacters := digits, Character alphabet.
	idLength := 30.
	^ String streamContents: [ :str |
		idLength timesRepeat: [ str nextPut: allowedCharacters atRandom ] ].
]

{ #category : #private }
MAFileDatabase >> randomPartitionFolderName [
	"Returns a string between '00' to 'FF'"

	| twoCharacterHexString |
	twoCharacterHexString := 16rFF atRandom printStringBase: 16 length: 2 padded: true.
	^ twoCharacterHexString asLowercase.
]

{ #category : #public }
MAFileDatabase >> uniqueLocation [
	"Finds an unique path to be used and create the necessary sub directories."

	| partition id result |
	[
		partition := self randomPartitionFolderName.
		id := self randomIdentifierName.
		result := self baseDirectory ensureCreateDirectory / partition / id.
	] doWhileTrue: [ result exists ].
	
	^ result ensureCreateDirectory.
]
