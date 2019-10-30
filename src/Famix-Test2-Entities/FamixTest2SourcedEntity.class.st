Class {
	#name : #FamixTest2SourcedEntity,
	#superclass : #FamixTest2Entity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixTest2Entity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]
