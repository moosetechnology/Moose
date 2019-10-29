Class {
	#name : #FamixTest2Comment,
	#superclass : #FamixTest2SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Comment class >> annotation [

	<FMClass: #Comment super: #FamixTest2SourcedEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]
