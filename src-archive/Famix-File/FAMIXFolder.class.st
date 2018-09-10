"
It represents a folder in the file system. It can contain other files or folders.
"
Class {
	#name : #FAMIXFolder,
	#superclass : #FAMIXAbstractFile,
	#category : #'Famix-File'
}

{ #category : #meta }
FAMIXFolder class >> annotation [
	<MSEClass: #Folder super: #FAMIXAbstractFile>
	<package: #FILE>
]

{ #category : #'add/remove' }
FAMIXFolder >> addChildFileSystemEntity: aFileOrFolder [
	self childrenFileSystemEntities add: aFileOrFolder
]

{ #category : #'computed accessing' }
FAMIXFolder >> allRecursiveFiles [
	| result |
	result := MooseGroup withAll: self files withDescription: 'All recursive files in ', self mooseName.
	self folders do: [:each | result := result addAll: each allRecursiveFiles].
	^result.
]

{ #category : #'computed accessing' }
FAMIXFolder >> allRecursiveFolders [
	| result |
	result := MooseGroup withAll: self folders withDescription: 'All recursive folders in ', self mooseName.
	self folders do: [:each | result := result addAll: each allRecursiveFolders].
	^result.
]

{ #category : #accessing }
FAMIXFolder >> childrenFileSystemEntities [
	<MSEProperty: #childrenFileSystemEntities type: #FAMIXAbstractFile opposite: #parentFolder>
	<multivalued>
	<derived>
	<MSEComment: 'List of entities contained in this package.'>
	^ self privateState
		attributeAt: #childrenFileSystemEntities
		ifAbsentPut: [ FMMultivalueLink on: self opposite: #parentFolder: ]
]

{ #category : #accessing }
FAMIXFolder >> childrenFileSystemEntities: aFAMIXAbstractFile [
	self childrenFileSystemEntities value: aFAMIXAbstractFile
]

{ #category : #accessing }
FAMIXFolder >> files [
	^ self childrenFileSystemEntities reject: #isFolder
]

{ #category : #accessing }
FAMIXFolder >> filesGroup [
	<navigation: 'Files'>
	^FAMIXFileGroup withAll: self files withDescription: 'Files'
]

{ #category : #accessing }
FAMIXFolder >> folders [
	^ self childrenFileSystemEntities select: #isFolder
]

{ #category : #accessing }
FAMIXFolder >> foldersGroup [
	<navigation: 'Folders'>
	^FAMIXFolderGroup withAll: self folders withDescription: 'Folders'
]

{ #category : #testing }
FAMIXFolder >> isFolder [
	^ true
]

{ #category : #properties }
FAMIXFolder >> numberOfEmptyLinesOfText [
	<MSEProperty: #numberOfEmptyLinesOfText type: #Number>
	<MSEComment: 'Number of empty lines of text'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfEmptyLinesOfText computedAs: [ 
		self files, self folders sumNumbers: #numberOfEmptyLinesOfText
	]
]

{ #category : #properties }
FAMIXFolder >> numberOfFiles [
	<MSEProperty: #numberOfFiles type: #Number>
	<MSEComment: 'The number of files in a folder'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfFiles
		computedAs: [self files size]
]

{ #category : #properties }
FAMIXFolder >> numberOfFolders [
	<MSEProperty: #numberOfFolders type: #Number>
	<MSEComment: 'The number of folders in a folder'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfFolders
		computedAs: [self folders size]
]

{ #category : #properties }
FAMIXFolder >> totalNumberOfLinesOfText [
	<MSEProperty: #totalNumberOfLinesOfText type: #Number>
	<MSEComment: 'Number of lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #totalNumberOfLinesOfText
		computedAs: [ self files , self folders sumNumbers: #totalNumberOfLinesOfText ]
]

{ #category : #'computed accessing' }
FAMIXFolder >> withAllRecursiveFolders [
	| result |
	result := MooseGroup with: self withDescription: 'All recursive folders in ', self mooseName.
	result addAll: self folders.
	self folders do: [:each | result := result addAll: each allRecursiveFolders].
	^result.
]
