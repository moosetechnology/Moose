Trait {
	#name : #FamixTFileSystemEntity,
	#instVars : [
		'#parentFolder => FMOne type: #FamixTFolder opposite: #childrenFileSystemEntities'
	],
	#category : #'Famix-Traits-File'
}

{ #category : #meta }
FamixTFileSystemEntity classSide >> annotation [

	<FMClass: #TFileSystemEntity super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #constants }
FamixTFileSystemEntity classSide >> famixFolderSeparatorString [
	^ '/'
]

{ #category : #constants }
FamixTFileSystemEntity classSide >> named: aName filedIn: aFolder [
	^ self new
		name: (aName copyReplaceAll: self systemFolderSeparatorString with: self famixFolderSeparatorString) asSymbol;
		parentFolder: aFolder;
		yourself
]

{ #category : #constants }
FamixTFileSystemEntity classSide >> systemFolderSeparatorString [
	^ DiskStore delimiter asString 
]

{ #category : #accessing }
FamixTFileSystemEntity >> fileReference [
	^ FileSystem disk referenceTo: (self mooseName copyReplaceAll: self class famixFolderSeparatorString with: FileSystem disk delimiter asString)
]

{ #category : #accessing }
FamixTFileSystemEntity >> fullName [
	^ self mooseName
]

{ #category : #testing }
FamixTFileSystemEntity >> ifFolder: aBlock [
	^ self isFolder ifTrue: [ aBlock value ]
]

{ #category : #testing }
FamixTFileSystemEntity >> ifFolder: aBlock1 ifNotFolder: aBlock2 [
	^ self isFolder ifTrue: [ aBlock1 value ] ifFalse: [ aBlock2 value ]
]

{ #category : #testing }
FamixTFileSystemEntity >> ifNotFolder: aBlock [
	^ self isFolder ifFalse: [ aBlock value ]
]

{ #category : #testing }
FamixTFileSystemEntity >> ifNotFolder: aBlock1 ifFolder: aBlock2 [
	^ self isFolder ifFalse: [ aBlock1 value ] ifTrue: [ aBlock2 value ]
]

{ #category : #testing }
FamixTFileSystemEntity >> isFolder [
	^ false
]

{ #category : #testing }
FamixTFileSystemEntity >> isRoot [
	^ self parentFolder isNil
]

{ #category : #printing }
FamixTFileSystemEntity >> mooseNameOn: aStream [
	self parentFolder
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream nextPutAll: self class famixFolderSeparatorString ].
	self name ifNotNil: [ :aName | aStream nextPutAll: aName ]
]

{ #category : #accessing }
FamixTFileSystemEntity >> numberOfEmptyLinesOfText [
	^ self explicitRequirement
]

{ #category : #accessing }
FamixTFileSystemEntity >> numberOfLinesOfText [
	<FMProperty: #numberOfLinesOfText type: #Number>
	<FMComment: 'Number of lines of text which are not empty in a file'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfLinesOfText computedAs: [ self totalNumberOfLinesOfText - self numberOfEmptyLinesOfText ]
]

{ #category : #accessing }
FamixTFileSystemEntity >> parentFolder [
	"Relation named: #parentFolder type: #FamixTFolder opposite: #childrenFileSystemEntities"

	<generated>
	<FMComment: 'Folder entity containing this file.'>
	<container>
	^ parentFolder
]

{ #category : #accessing }
FamixTFileSystemEntity >> parentFolder: anObject [
	parentFolder := anObject.
	self resetMooseName
]

{ #category : #navigation }
FamixTFileSystemEntity >> parentFolderGroup [
	<generated>
	<navigation: 'ParentFolder'>
	^ MooseGroup with: self parentFolder
]

{ #category : #accessing }
FamixTFileSystemEntity >> totalNumberOfLinesOfText [
	^ self explicitRequirement
]
