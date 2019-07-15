Class {
	#name : #FamixJavaFolder,
	#superclass : #FamixJavaAbstractFile,
	#traits : 'FamixTFolder',
	#classTraits : 'FamixTFolder classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaFolder class >> annotation [

	<MSEClass: #Folder super: #FamixJavaAbstractFile>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaFolder class >> generatedSlotNames [
	<generated>
	'FamixJavaFolder class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaFolder class >> generatedTraitNames [
	<generated>
	^ #(FamixTFolder)
]

{ #category : #meta }
FamixJavaFolder class >> requirements [

	<generated>
	^ {  }
]
