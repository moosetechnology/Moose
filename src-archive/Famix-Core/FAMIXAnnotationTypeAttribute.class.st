"
This models the attribute defined in a Java AnnotationType. In Java, annotation type attributes have specific syntax and use.

For example, in Java the following AnnotationType has four AnnotationTypeAttributes (id, synopsis, engineer and date are attributes).

public @interface MyAnno {
    int    id();
    String synopsis(); 
    String engineer() default ""[unassigned]""; 
    String date()    default ""[unimplemented]"";
}

When using an annotation, an annotation instance is created that points back to the annotation type. The annotation instance has attributes that are annontation instance attributes and point back to their annotation type attributes.

Instance Variables:
	parentAnnotationType	<FAMIXAnnotationType>
	annotationAttributeInstances	<(FMMultivalueLink of: FAMIXAnnotationInstanceAttribute)>
"
Class {
	#name : #FAMIXAnnotationTypeAttribute,
	#superclass : #FAMIXAttribute,
	#instVars : [
		'annotationAttributeInstances'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXAnnotationTypeAttribute class >> annotation [
	<MSEClass: #AnnotationTypeAttribute super: #FAMIXAttribute>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXAnnotationTypeAttribute >> annotationAttributeInstances [
	<MSEProperty: #annotationAttributeInstances type: #FAMIXAnnotationInstanceAttribute opposite: #annotationTypeAttribute> <multivalued> <derived> 
	<MSEComment: 'A collection of AnnotationInstanceAttribute which hold the usages of this attribute in actual AnnotationInstances'>
	^ annotationAttributeInstances
]

{ #category : #accessing }
FAMIXAnnotationTypeAttribute >> annotationAttributeInstances: anObject [
	annotationAttributeInstances value: anObject
]

{ #category : #'initialize-release' }
FAMIXAnnotationTypeAttribute >> initialize [
	super initialize.
	annotationAttributeInstances := FMNullMultivalueLink on: self opposite: #annotationTypeAttribute: selector: #annotationAttributeInstances
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
