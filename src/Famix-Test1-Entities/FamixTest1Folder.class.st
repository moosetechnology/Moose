Class {
	#name : #FamixTest1Folder,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTFolder',
	#classTraits : 'FamixTFolder classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Folder class >> annotation [

	<FMClass: #Folder super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]
