Class {
	#name : #FamixTest1AbstractFile,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTFileSystemEntity',
	#classTraits : 'FamixTFileSystemEntity classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1AbstractFile class >> annotation [

	<MSEClass: #AbstractFile super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest1AbstractFile class >> requirements [

	<generated>
	^ { FamixTest1Folder }
]

{ #category : #accessing }
FamixTest1AbstractFile >> belongsTo [

	<generated>
	^ self parentFolder

]

{ #category : #accessing }
FamixTest1AbstractFile >> belongsTo: anObject [

	<generated>
	self parentFolder: anObject

]
