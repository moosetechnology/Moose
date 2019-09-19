Class {
	#name : #FamixCSharpAttribute,
	#superclass : #FamixCSharpNamedEntity,
	#traits : 'FamixCSharpTStructuralEntity + FamixTAttribute + FamixTWithClassScope',
	#classTraits : 'FamixCSharpTStructuralEntity classTrait + FamixTAttribute classTrait + FamixTWithClassScope classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpAttribute class >> annotation [

	<MSEClass: #Attribute super: #FamixCSharpNamedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpAttribute class >> requirements [

	<generated>
	^ { FamixCSharpAnnotationTypeAttribute. FamixCSharpClass. FamixCSharpType }
]

{ #category : #accessing }
FamixCSharpAttribute >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixCSharpAttribute >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]
