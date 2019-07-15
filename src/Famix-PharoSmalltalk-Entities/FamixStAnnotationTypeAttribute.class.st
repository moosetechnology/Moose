Class {
	#name : #FamixStAnnotationTypeAttribute,
	#superclass : #FamixStAttribute,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationTypeAttribute class >> annotation [

	<MSEClass: #AnnotationTypeAttribute super: #FamixStAttribute>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStAnnotationTypeAttribute class >> generatedSlotNames [
	<generated>
	'FamixStAnnotationTypeAttribute class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStAnnotationTypeAttribute class >> generatedTraitNames [
	<generated>
	^ #(FamixTAnnotationTypeAttribute FamixTTypedAnnotationInstanceAttribute)
]

{ #category : #meta }
FamixStAnnotationTypeAttribute class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixStAnnotationTypeAttribute >> parentAnnotationType [
	<MSEProperty: #parentAnnotationType type: #FamixStAnnotationType> <derived> 
	<MSEComment: 'This is an alias pointing to the AnnotationType that defines this attribute'>

	^ self parentType
]

{ #category : #accessing }
FamixStAnnotationTypeAttribute >> parentAnnotationType: anAnnotationType [
	self parentType: anAnnotationType
]
