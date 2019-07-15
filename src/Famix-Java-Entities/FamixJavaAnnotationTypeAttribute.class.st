Class {
	#name : #FamixJavaAnnotationTypeAttribute,
	#superclass : #FamixJavaAttribute,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAnnotationTypeAttribute class >> annotation [

	<MSEClass: #AnnotationTypeAttribute super: #FamixJavaAttribute>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaAnnotationTypeAttribute class >> generatedSlotNames [
	<generated>
	'FamixJavaAnnotationTypeAttribute class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaAnnotationTypeAttribute class >> generatedTraitNames [
	<generated>
	^ #(FamixTAnnotationTypeAttribute FamixTTypedAnnotationInstanceAttribute)
]

{ #category : #meta }
FamixJavaAnnotationTypeAttribute class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationTypeAttribute >> parentAnnotationType [
	<MSEProperty: #parentAnnotationType type: #FamixJavaAnnotationType> 
	<derived> 
	<MSEComment: 'This is an alias pointing to the AnnotationType that defines this attribute'>

	^ self parentType
]

{ #category : #'as yet unclassified' }
FamixJavaAnnotationTypeAttribute >> parentAnnotationType: anAnnotationType [
	self parentType: anAnnotationType
]
