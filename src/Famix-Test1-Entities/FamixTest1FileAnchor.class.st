Class {
	#name : #FamixTest1FileAnchor,
	#superclass : #FamixTest1SourceAnchor,
	#traits : 'FamixTFileAnchor + FamixTFileNavigation',
	#classTraits : 'FamixTFileAnchor classTrait + FamixTFileNavigation classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1FileAnchor class >> annotation [

	<FMClass: #FileAnchor super: #FamixTest1SourceAnchor>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]
