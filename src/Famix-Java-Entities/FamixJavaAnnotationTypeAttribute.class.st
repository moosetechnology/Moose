Class {
	#name : #FamixJavaAnnotationTypeAttribute,
	#superclass : #FamixJavaAttribute,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationTypeAttribute class >> annotation [

	<FMClass: #AnnotationTypeAttribute super: #FamixJavaAttribute>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationTypeAttribute >> parentAnnotationType [
	<FMProperty: #parentAnnotationType type: #FamixJavaAnnotationType> 
	<derived> 
	<FMComment: 'This is an alias pointing to the AnnotationType that defines this attribute'>

	^ self parentType
]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationTypeAttribute >> parentAnnotationType: anAnnotationType [
	self parentType: anAnnotationType
]
