Class {
	#name : #FamixCSharpAnnotationType,
	#superclass : #FamixCSharpType,
	#traits : 'FamixTAnnotationType + FamixTWithMethods',
	#classTraits : 'FamixTAnnotationType classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpAnnotationType class >> annotation [

	<MSEClass: #AnnotationType super: #FamixCSharpType>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpAnnotationType class >> requirements [

	<generated>
	^ { FamixCSharpContainerEntity }
]

{ #category : #accessing }
FamixCSharpAnnotationType >> belongsTo [

	<generated>
	^ self annotationTypesContainer

]

{ #category : #accessing }
FamixCSharpAnnotationType >> belongsTo: anObject [

	<generated>
	self annotationTypesContainer: anObject

]
