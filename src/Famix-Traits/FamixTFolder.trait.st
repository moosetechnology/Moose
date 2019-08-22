"
It represents a folder in the file system. It can contain other files or folders.
"
Trait {
	#name : #FamixTFolder,
	#instVars : [
		'#childrenFileSystemEntities => FMMany type: #FamixTFileSystemEntity opposite: #parentFolder'
	],
	#category : #'Famix-Traits-File'
}

{ #category : #meta }
FamixTFolder classSide >> annotation [

	<MSEClass: #TFolder super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTFolder classSide >> famixTFolderRelatedGroup [

	<mooseGroup>
	
	^ FAMIXFolderGroup
]

{ #category : #adding }
FamixTFolder >> addChildFileSystemEntity: aFileOrFolder [
	self childrenFileSystemEntities add: aFileOrFolder
]

{ #category : #properties }
FamixTFolder >> allRecursiveFiles [
	| result |
	result := MooseGroup withAll: self files withDescription: 'All recursive files in ', self mooseName.
	self folders do: [:each | result := result addAll: each allRecursiveFiles].
	^result.
]

{ #category : #properties }
FamixTFolder >> allRecursiveFolders [
	| result |
	result := MooseGroup withAll: self folders withDescription: 'All recursive folders in ', self mooseName.
	self folders do: [:each | result := result addAll: each allRecursiveFolders].
	^result.
]

{ #category : #accessing }
FamixTFolder >> childrenFileSystemEntities [
	"Relation named: #childrenFileSystemEntities type: #FamixTFileSystemEntity opposite: #parentFolder"

	<generated>
	<MSEComment: 'List of entities contained in this folder.'>
	^ childrenFileSystemEntities
]

{ #category : #accessing }
FamixTFolder >> childrenFileSystemEntities: anObject [

	<generated>
	childrenFileSystemEntities value: anObject

]

{ #category : #adding }
FamixTFolder >> files [
	^ self childrenFileSystemEntities reject: #isFolder
]

{ #category : #adding }
FamixTFolder >> filesGroup [
	<navigation: 'Files'>
	^FAMIXFileGroup withAll: self files withDescription: 'Files'
]

{ #category : #adding }
FamixTFolder >> folders [
	^ self childrenFileSystemEntities select: #isFolder
]

{ #category : #adding }
FamixTFolder >> foldersGroup [
	<navigation: 'Folders'>
	^FAMIXFolderGroup withAll: self folders withDescription: 'Folders'
]

{ #category : #properties }
FamixTFolder >> numberOfEmptyLinesOfText [
	<MSEProperty: #numberOfEmptyLinesOfText type: #Number>
	<MSEComment: 'Number of empty lines of text'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfEmptyLinesOfText computedAs: [ 
		self files, self folders sumNumbers: #numberOfEmptyLinesOfText
	]
]

{ #category : #properties }
FamixTFolder >> numberOfFiles [
	<MSEProperty: #numberOfFiles type: #Number>
	<MSEComment: 'The number of files in a folder'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfFiles
		computedAs: [self files size]
]

{ #category : #properties }
FamixTFolder >> numberOfFolders [
	<MSEProperty: #numberOfFolders type: #Number>
	<MSEComment: 'The number of folders in a folder'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfFolders
		computedAs: [self folders size]
]

{ #category : #properties }
FamixTFolder >> totalNumberOfLinesOfText [
	<MSEProperty: #totalNumberOfLinesOfText type: #Number>
	<MSEComment: 'Number of lines of text'>
	<derived>
	^ self
		lookUpPropertyNamed: #totalNumberOfLinesOfText
		computedAs: [ self files , self folders sumNumbers: #totalNumberOfLinesOfText ]
]

{ #category : #properties }
FamixTFolder >> withAllRecursiveFolders [
	| result |
	result := MooseGroup with: self withDescription: 'All recursive folders in ', self mooseName.
	result addAll: self folders.
	self folders do: [:each | result := result addAll: each allRecursiveFolders].
	^result.
]
