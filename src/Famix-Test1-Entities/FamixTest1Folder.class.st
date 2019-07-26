Class {
	#name : #FamixTest1Folder,
	#superclass : #FamixTest1AbstractFile,
	#traits : 'FamixTFolder',
	#classTraits : 'FamixTFolder classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Folder class >> annotation [

	<MSEClass: #Folder super: #FamixTest1AbstractFile>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]
