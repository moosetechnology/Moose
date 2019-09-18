Class {
	#name : #FamixCSharpAnnotationTypeAttribute,
	#superclass : #FamixCSharpAttribute,
	#traits : 'FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpAnnotationTypeAttribute class >> annotation [

	<MSEClass: #AnnotationTypeAttribute super: #FamixCSharpAttribute>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
