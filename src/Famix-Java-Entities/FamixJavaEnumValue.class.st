Class {
	#name : #FamixJavaEnumValue,
	#superclass : #FamixJavaNamedEntity,
	#traits : '(FamixTEnumValue + FamixTStructuralEntity withPrecedenceOf: FamixTStructuralEntity)',
	#classTraits : '(FamixTEnumValue classTrait + FamixTStructuralEntity classTrait withPrecedenceOf: FamixTStructuralEntity classTrait)',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnumValue class >> annotation [

	<FMClass: #EnumValue super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]
