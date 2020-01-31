Class {
	#name : #FamixTest5AnnotationType1,
	#superclass : #MooseEntity,
	#traits : 'FamixTAnnotationType',
	#classTraits : 'FamixTAnnotationType classTrait',
	#category : #'Famix-Test5-Entities-Entities'
}

{ #category : #meta }
FamixTest5AnnotationType1 class >> annotation [

	<FMClass: #AnnotationType1 super: #MooseEntity>
	<package: #'Famix-Test5-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest5AnnotationType1 class >> metamodel [

	<generated>
	^ FamixTest5Model metamodel
]
