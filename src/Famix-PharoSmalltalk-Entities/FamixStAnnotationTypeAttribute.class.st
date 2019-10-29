Class {
	#name : #FamixStAnnotationTypeAttribute,
	#superclass : #FamixStAttribute,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationTypeAttribute class >> annotation [

	<FMClass: #AnnotationTypeAttribute super: #FamixStAttribute>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixStAnnotationTypeAttribute >> parentAnnotationType [
	<FMProperty: #parentAnnotationType type: #FamixStAnnotationType> <derived> 
	<FMComment: 'This is an alias pointing to the AnnotationType that defines this attribute'>

	^ self parentType
]

{ #category : #accessing }
FamixStAnnotationTypeAttribute >> parentAnnotationType: anAnnotationType [
	self parentType: anAnnotationType
]
