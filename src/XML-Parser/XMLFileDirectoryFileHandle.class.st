"
This class uses FileDirectory/DirectoryEntry to implement file IO. This is used on Squeak and Gemstone, which don't support the Pharo FileSystem API.
"
Class {
	#name : #XMLFileDirectoryFileHandle,
	#superclass : #XMLFileHandle,
	#instVars : [
		'fileDirectory'
	],
	#category : #'XML-Parser-Files'
}

{ #category : #basic }
XMLFileDirectoryFileHandle class >> basicCurrentWorkingDirectory [
	^ (XMLClassFinder classNamed: #FileDirectory) default pathName
]

{ #category : #testing }
XMLFileDirectoryFileHandle class >> isSupportedImplementation [
	^ XMLClassFinder hasClassNamed: #FileDirectory
]

{ #category : #basic }
XMLFileDirectoryFileHandle >> basicDelete [
	"FileDirectory's deleteFileNamed: is used because DirectoryEntry
	doesn't understand #delete on GS"
	self fileDirectory deleteFileNamed: self path
]

{ #category : #basic }
XMLFileDirectoryFileHandle >> basicFileSize [
	^ self directoryEntry fileSize
]

{ #category : #accessing }
XMLFileDirectoryFileHandle >> directoryEntry [
	"a bug on Squeak (but not GS) with the handling of dot relative paths
	like './file.xml' requires fully qualifying the path before creating
	the DirectoryEntry"
	^ self fileDirectory directoryEntryFor:
		(self fileDirectory fullPathFor: self path)
]

{ #category : #testing }
XMLFileDirectoryFileHandle >> exists [
	^ self directoryEntry notNil
]

{ #category : #accessing }
XMLFileDirectoryFileHandle >> fileDirectory [
	^ fileDirectory
		ifNil: [fileDirectory := (XMLClassFinder classNamed: #FileDirectory) default]
]

{ #category : #testing }
XMLFileDirectoryFileHandle >> isFile [
	^ self exists
		and: [self directoryEntry isDirectory not]
]
