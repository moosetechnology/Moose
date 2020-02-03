Class {
	#name : #FamixTest5AnnotationType2,
	#superclass : #MooseEntity,
	#traits : 'FamixTAnnotationType',
	#classTraits : 'FamixTAnnotationType classTrait',
	#category : #'Famix-Test5-Entities-Entities'
}

{ #category : #meta }
FamixTest5AnnotationType2 class >> annotation [

	<FMClass: #AnnotationType2 super: #MooseEntity>
	<package: #'Famix-Test5-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest5AnnotationType2 class >> metamodel [

	<generated>
	^ FamixTest5Model metamodel
]
