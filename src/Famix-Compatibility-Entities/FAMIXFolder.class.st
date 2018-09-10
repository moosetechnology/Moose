Class {
	#name : #FAMIXFolder,
	#superclass : #FAMIXAbstractFile,
	#traits : 'FamixTFolder',
	#classTraits : 'FamixTFolder classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXFolder class >> annotation [

	<MSEClass: #Folder super: #FAMIXAbstractFile>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXFolder class >> generatedSlotNames [
	<generated>
	'FAMIXFolder class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXFolder class >> generatedTraitNames [
	<generated>
	^ #(FamixTFolder)
]

{ #category : #meta }
FAMIXFolder class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FAMIXFolder >> isFolder [
	^ true
]
