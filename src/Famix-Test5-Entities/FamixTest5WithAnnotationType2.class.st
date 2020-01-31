Class {
	#name : #FamixTest5WithAnnotationType2,
	#superclass : #MooseEntity,
	#traits : 'FamixTWithAnnotationTypes',
	#classTraits : 'FamixTWithAnnotationTypes classTrait',
	#category : #'Famix-Test5-Entities-Entities'
}

{ #category : #meta }
FamixTest5WithAnnotationType2 class >> annotation [

	<FMClass: #WithAnnotationType2 super: #MooseEntity>
	<package: #'Famix-Test5-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest5WithAnnotationType2 class >> metamodel [

	<generated>
	^ FamixTest5Model metamodel
]
