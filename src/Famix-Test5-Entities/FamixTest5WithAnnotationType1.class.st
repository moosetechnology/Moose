Class {
	#name : #FamixTest5WithAnnotationType1,
	#superclass : #MooseEntity,
	#traits : 'FamixTWithAnnotationTypes',
	#classTraits : 'FamixTWithAnnotationTypes classTrait',
	#category : #'Famix-Test5-Entities-Entities'
}

{ #category : #meta }
FamixTest5WithAnnotationType1 class >> annotation [

	<FMClass: #WithAnnotationType1 super: #MooseEntity>
	<package: #'Famix-Test5-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest5WithAnnotationType1 class >> metamodel [

	<generated>
	^ FamixTest5Model metamodel
]
