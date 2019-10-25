Class {
	#name : #FamixCSharpAnnotationInstance,
	#superclass : #FamixCSharpSourcedEntity,
	#traits : 'FamixTAnnotationInstance + FamixTTypedAnnotationInstance + FamixTWithAnnotationInstanceAttributes',
	#classTraits : 'FamixTAnnotationInstance classTrait + FamixTTypedAnnotationInstance classTrait + FamixTWithAnnotationInstanceAttributes classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpAnnotationInstance class >> annotation [

	<MSEClass: #AnnotationInstance super: #FamixCSharpSourcedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpAnnotationInstance class >> requirements [

	<generated>
	^ { FamixCSharpNamedEntity }
]

{ #category : #accessing }
FamixCSharpAnnotationInstance >> belongsTo [

	<generated>
	^ self annotatedEntity

]

{ #category : #accessing }
FamixCSharpAnnotationInstance >> belongsTo: anObject [

	<generated>
	self annotatedEntity: anObject

]
