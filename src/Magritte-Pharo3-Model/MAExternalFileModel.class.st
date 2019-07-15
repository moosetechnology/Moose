"
I manage the file-data I represent on the file-system. From the programmer this looks the same as if the file would be in memory (==*MAMemoryFileModel*==), as it is transparently loaded and written out as necessary.

I delegate my actual location on disk to MAFileDatabase (see class comment).
"
Class {
	#name : #MAExternalFileModel,
	#superclass : #MAFileModel,
	#instVars : [
		'location',
		'directory'
	],
	#category : #'Magritte-Pharo3-Model'
}

{ #category : #accessing }
MAExternalFileModel class >> baseDirectoryPath [
	" deprecated: use MAFileDatabase baseDirectoryPath instead "
	^MAFileDatabase baseDirectory fullName
]

{ #category : #accessing }
MAExternalFileModel class >> baseDirectoryPath: aString [ 
	" deprecated, but still used by pier "
	MAFileDatabase baseDirectory: aString
]

{ #category : #accessing }
MAExternalFileModel class >> baseUrl [
	" deprecated: use MAFileDatabase baseDirectoryPath instead "
	^ MAFileDatabase baseUrl
]

{ #category : #accessing }
MAExternalFileModel class >> baseUrl: aString [
	" deprecated: use MAFileDatabase baseUrl instead "
	^ MAFileDatabase baseUrl: aString
]

{ #category : #comparing }
MAExternalFileModel >> = anObject [
    ^ super = anObject and: [ self directory = anObject directory ]
]

{ #category : #configuration }
MAExternalFileModel >> baseUrl [
	^ self database baseUrl
]

{ #category : #accessing }
MAExternalFileModel >> contents [
	| stream |
	^ self file exists
		ifFalse: [ ByteArray new ]
		ifTrue: [
			stream := self readStream.
			[ stream contents ]
				ensure: [ stream close ] ]
]

{ #category : #accessing }
MAExternalFileModel >> contents: aByteArray [
	| stream |
	stream := self writeStream.
	[ stream nextPutAll: aByteArray asByteArray ]
		ensure: [ stream close ].
	super contents: aByteArray
]

{ #category : #private }
MAExternalFileModel >> database [

	^ MAFileDatabase new.
]

{ #category : #'accessing-dynamic' }
MAExternalFileModel >> directory [

	^ directory ifNil: [ directory := self database uniqueLocation ].
]

{ #category : #'accessing-dynamic' }
MAExternalFileModel >> file [
	^(self directory / self filename) asFileReference
]

{ #category : #finalization }
MAExternalFileModel >> finalize [
	|  dir |
	dir := self directory.
	dir exists
		ifTrue: [ dir deleteAll ].
	[ (dir := dir parent) hasChildren ]
		whileFalse: [ dir ensureDelete ].
	super finalize.
	location := nil
]

{ #category : #comparing }
MAExternalFileModel >> hash [
	^ super hash bitXor: self directory hash
]

{ #category : #copying }
MAExternalFileModel >> postCopy [
	| previous |
	super postCopy.
	previous := self contents.
	location := nil.
	self contents: previous
]

{ #category : #'accessing-dynamic' }
MAExternalFileModel >> readStream [
	^ self file readStream binary.
]

{ #category : #'accessing-dynamic' }
MAExternalFileModel >> writeStream [
	^ self file writeStream binary
]
