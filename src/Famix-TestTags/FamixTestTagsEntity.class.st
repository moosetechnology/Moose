Class {
	#name : #FamixTestTagsEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTWithTags',
	#classTraits : 'FamixTWithTags classTrait',
	#category : #'Famix-TestTags-Entities'
}

{ #category : #meta }
FamixTestTagsEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestTags'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestTagsEntity class >> metamodel [

	<generated>
	^ FamixTestTagsModel metamodel
]
