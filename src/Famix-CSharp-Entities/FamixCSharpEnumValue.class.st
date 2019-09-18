Class {
	#name : #FamixCSharpEnumValue,
	#superclass : #FamixCSharpNamedEntity,
	#traits : 'FamixCSharpTStructuralEntity - {#mooseNameOn:} + FamixTEnumValue',
	#classTraits : 'FamixCSharpTStructuralEntity classTrait + FamixTEnumValue classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpEnumValue class >> annotation [

	<MSEClass: #EnumValue super: #FamixCSharpNamedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpEnumValue class >> requirements [

	<generated>
	^ { FamixCSharpEnum }
]

{ #category : #accessing }
FamixCSharpEnumValue >> belongsTo [

	<generated>
	^ self parentEnum

]

{ #category : #accessing }
FamixCSharpEnumValue >> belongsTo: anObject [

	<generated>
	self parentEnum: anObject

]
