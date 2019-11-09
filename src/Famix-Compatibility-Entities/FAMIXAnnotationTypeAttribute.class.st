Class {
	#name : #FAMIXAnnotationTypeAttribute,
	#superclass : #FAMIXAttribute,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAnnotationTypeAttribute class >> annotation [

	<FMClass: #AnnotationTypeAttribute super: #FAMIXAttribute>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXAnnotationTypeAttribute >> parentAnnotationType [
	<FMProperty: #parentAnnotationType type: #FAMIXAnnotationType> <derived> 
	<FMComment: 'This is an alias pointing to the AnnotationType that defines this attribute'>

	^ self parentType
]

{ #category : #accessing }
FAMIXAnnotationTypeAttribute >> parentAnnotationType: anAnnotationType [
	self parentType: anAnnotationType
]
