Class {
	#name : #FamixJavaAnnotationInstanceAttribute,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTAnnotationInstanceAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationInstanceAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationInstanceAttribute class >> annotation [

	<FMClass: #AnnotationInstanceAttribute super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaAnnotationInstanceAttribute >> name [
	^ self annotationTypeAttribute ifNotNil: #name
]
