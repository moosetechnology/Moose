Class {
	#name : #FamixTest5Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test5-Entities-Entities'
}

{ #category : #meta }
FamixTest5Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test5-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest5Entity class >> metamodel [

	<generated>
	^ FamixTest5Model metamodel
]
