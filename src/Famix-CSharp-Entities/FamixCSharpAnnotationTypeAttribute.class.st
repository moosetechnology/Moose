Class {
	#name : #FamixCSharpAnnotationTypeAttribute,
	#superclass : #FamixCSharpAttribute,
	#traits : 'FamixTWithAttributes + FamixTAnnotationTypeAttribute + FamixTTypedAnnotationInstanceAttribute',
	#classTraits : 'FamixTWithAttributes classTrait + FamixTAnnotationTypeAttribute classTrait + FamixTTypedAnnotationInstanceAttribute classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpAnnotationTypeAttribute class >> annotation [

	<MSEClass: #AnnotationTypeAttribute super: #FamixCSharpAttribute>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]
