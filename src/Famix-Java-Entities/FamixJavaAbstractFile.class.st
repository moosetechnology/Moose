Class {
	#name : #FamixJavaAbstractFile,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTFileSystemEntity',
	#classTraits : 'FamixTFileSystemEntity classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAbstractFile class >> annotation [

	<MSEClass: #AbstractFile super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> belongsTo [
	<navigation: 'parent folder'>
	^ self parentFolder
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> fileReference [ 
	^ (FileSystem disk referenceTo: (self mooseName copyReplaceAll: self class famixFolderSeparatorString with: FileSystem disk delimiter asString))
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> fullName [
	^ self mooseName
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> ifFolder: aBlock [
	^ self isFolder ifTrue: [ aBlock value ]
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> ifFolder: aBlock1 ifNotFolder: aBlock2 [
	^ self isFolder ifTrue: [ aBlock1 value ] ifFalse: [ aBlock2 value ]
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> ifNotFolder: aBlock [
	^ self isFolder ifFalse: [ aBlock value ]
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> ifNotFolder: aBlock1 ifFolder: aBlock2 [
	^ self isFolder ifFalse: [ aBlock1 value ] ifTrue: [ aBlock2 value ]
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> isRoot [
	^ self belongsTo isNil
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> mooseNameOn: aStream [
	self belongsTo
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream nextPutAll: self class famixFolderSeparatorString ].
	self name ifNotNil: [ aStream nextPutAll: self name ]
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> numberOfEmptyLinesOfText [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> numberOfLinesOfText [
	<MSEProperty: #numberOfLinesOfText type: #Number>
	<MSEComment: 'Number of lines of text which are not empty in a file'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfLinesOfText computedAs: [ self totalNumberOfLinesOfText - self numberOfEmptyLinesOfText ]
]

{ #category : #'as yet unclassified' }
FamixJavaAbstractFile >> totalNumberOfLinesOfText [
	^ self subclassResponsibility
]
