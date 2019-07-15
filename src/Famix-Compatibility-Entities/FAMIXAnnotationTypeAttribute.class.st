Class {
	#name : #FAMIXAnnotationTypeAttribute,
	#superclass : #FAMIXAttribute,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAnnotationTypeAttribute class >> annotation [

	<MSEClass: #AnnotationTypeAttribute super: #FAMIXAttribute>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXAnnotationTypeAttribute class >> generatedSlotNames [
	<generated>
	'FAMIXAnnotationTypeAttribute class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXAnnotationTypeAttribute class >> generatedTraitNames [
	<generated>
	^ #(FamixTAnnotationTypeAttribute FamixTTypedAnnotationInstanceAttribute)
]

{ #category : #meta }
FAMIXAnnotationTypeAttribute class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FAMIXAnnotationTypeAttribute >> parentAnnotationType [
	<MSEProperty: #parentAnnotationType type: #FAMIXAnnotationType> <derived> 
	<MSEComment: 'This is an alias pointing to the AnnotationType that defines this attribute'>

	^ self parentType
]

{ #category : #accessing }
FAMIXAnnotationTypeAttribute >> parentAnnotationType: anAnnotationType [
	self parentType: anAnnotationType
]
