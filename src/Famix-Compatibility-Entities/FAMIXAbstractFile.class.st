Class {
	#name : #FAMIXAbstractFile,
	#superclass : #FAMIXNamedEntity,
	#traits : 'FamixTFileSystemEntity',
	#classTraits : 'FamixTFileSystemEntity classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAbstractFile class >> annotation [

	<MSEClass: #AbstractFile super: #FAMIXNamedEntity>
	<package: #FAMIX>
	<generated>
	^self
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

{ #category : #properties }
FAMIXAbstractFile >> totalNumberOfLinesOfText [
	^ self subclassResponsibility
]
