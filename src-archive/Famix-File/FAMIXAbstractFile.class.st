"
The abstract file system class. It is subclassed by File and Folder.

Defines an attribute parent folder to point to its container.
"
Class {
	#name : #FAMIXAbstractFile,
	#superclass : #FAMIXNamedEntity,
	#category : #'Famix-File'
}

{ #category : #meta }
FAMIXAbstractFile class >> annotation [
	<MSEClass: #AbstractFile super: #FAMIXEntity>
	<package: #FILE>
]

{ #category : #constants }
FAMIXAbstractFile class >> famixFolderSeparatorString [
	^'/'
]

{ #category : #'instance creation' }
FAMIXAbstractFile class >> named: aName filedIn: aFolder [

	^self basicNew
				initialize;
				name: (aName copyReplaceAll: self systemFolderSeparatorString with: self famixFolderSeparatorString) asSymbol;
				parentFolder: aFolder;
				yourself.
]

{ #category : #constants }
FAMIXAbstractFile class >> systemFolderSeparatorString [
	^ DiskStore delimiter asString 
]

{ #category : #accessing }
FAMIXAbstractFile >> belongsTo [
	<navigation: 'parent folder'>
	^ self parentFolder
]

{ #category : #accessing }
FAMIXAbstractFile >> fileReference [ 
	^ (FileSystem disk referenceTo: (self mooseName copyReplaceAll: self class famixFolderSeparatorString with: FileSystem disk delimiter asString))
]

{ #category : #accessing }
FAMIXAbstractFile >> fullName [
	^ self mooseName
]

{ #category : #testing }
FAMIXAbstractFile >> ifFolder: aBlock [
	^ self isFolder ifTrue: [ aBlock value ]
]

{ #category : #testing }
FAMIXAbstractFile >> ifFolder: aBlock1 ifNotFolder: aBlock2 [
	^ self isFolder ifTrue: [ aBlock1 value ] ifFalse: [ aBlock2 value ]
]

{ #category : #testing }
FAMIXAbstractFile >> ifNotFolder: aBlock [
	^ self isFolder ifFalse: [ aBlock value ]
]

{ #category : #testing }
FAMIXAbstractFile >> ifNotFolder: aBlock1 ifFolder: aBlock2 [
	^ self isFolder ifFalse: [ aBlock1 value ] ifTrue: [ aBlock2 value ]
]

{ #category : #testing }
FAMIXAbstractFile >> isFolder [
	self subclassResponsibility
]

{ #category : #testing }
FAMIXAbstractFile >> isRoot [
	^ self belongsTo isNil
]

{ #category : #printing }
FAMIXAbstractFile >> mooseNameOn: aStream [
	self belongsTo
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream nextPutAll: self class famixFolderSeparatorString ].
	self name ifNotNil: [ aStream nextPutAll: self name ]
]

{ #category : #accessing }
FAMIXAbstractFile >> name [
	<MSEProperty: #name type: #String>
	<MSEComment: 'Basic name of the entity, not full reference.'>
	
	^name
]

{ #category : #accessing }
FAMIXAbstractFile >> name: anObject [
	name := anObject
]

{ #category : #properties }
FAMIXAbstractFile >> numberOfEmptyLinesOfText [
	^ self subclassResponsibility
]

{ #category : #properties }
FAMIXAbstractFile >> numberOfLinesOfText [
	<MSEProperty: #numberOfLinesOfText type: #Number>
	<MSEComment: 'Number of lines of text which are not empty in a file'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfLinesOfText computedAs: [ self totalNumberOfLinesOfText - self numberOfEmptyLinesOfText ]
]

{ #category : #accessing }
FAMIXAbstractFile >> parentFolder [
	"lazy initialization to reduce memory foot print if possible"

	<MSEProperty: #parentFolder type: #FAMIXFolder opposite: #childrenFileSystemEntities>
	<MSEComment: 'folder containing a file'>
	<container>
	^ self privateState attributeAt: #parentFolder ifAbsent: [ nil ]
]

{ #category : #accessing }
FAMIXAbstractFile >> parentFolder: aFolder [
	self privateState
		attributeAt: #parentFolder
		put:
			(FMMultivalueLink
				on: self
				update: #childrenFileSystemEntities
				from: self parentFolder
				to: aFolder).
	self resetMooseName
]

{ #category : #properties }
FAMIXAbstractFile >> totalNumberOfLinesOfText [
	^ self subclassResponsibility
]
