Class {
	#name : #FamixJavaEnumValue,
	#superclass : #FamixJavaNamedEntity,
	#traits : '(FamixTEnumValue + FamixTStructuralEntity withPrecedenceOf: FamixTEnumValue)',
	#classTraits : '(FamixTEnumValue classTrait + FamixTStructuralEntity classTrait withPrecedenceOf: FamixTEnumValue classTrait)',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnumValue class >> annotation [

	<FMClass: #EnumValue super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]
