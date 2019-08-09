Class {
	#name : #FamixJavaEnumValue,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTStructuralEntity - {#mooseNameOn:} + FamixTEnumValue',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTEnumValue classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnumValue class >> annotation [

	<MSEClass: #EnumValue super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaEnumValue class >> requirements [

	<generated>
	^ { FamixJavaEnum }
]

{ #category : #accessing }
FamixJavaEnumValue >> belongsTo [

	<generated>
	^ self parentEnum

]

{ #category : #accessing }
FamixJavaEnumValue >> belongsTo: anObject [

	<generated>
	self parentEnum: anObject

]
