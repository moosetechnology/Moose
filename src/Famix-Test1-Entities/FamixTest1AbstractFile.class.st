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

{ #category : #generator }
FamixTest1AbstractFile class >> generatedSlotNames [
	<generated>
	'FamixTest1AbstractFile class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1AbstractFile class >> generatedTraitNames [
	<generated>
	^ #(FamixTFileSystemEntity)
]

{ #category : #meta }
FamixTest1AbstractFile class >> requirements [

	<generated>
	^ {  }
]
