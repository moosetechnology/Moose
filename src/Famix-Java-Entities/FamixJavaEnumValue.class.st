Class {
	#name : #FamixJavaEnumValue,
	#superclass : #FamixJavaStructuralEntity,
	#traits : 'FamixTEnumValue',
	#classTraits : 'FamixTEnumValue classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaEnumValue class >> annotation [

	<MSEClass: #EnumValue super: #FamixJavaStructuralEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaEnumValue class >> generatedSlotNames [
	<generated>
	'FamixJavaEnumValue class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaEnumValue class >> generatedTraitNames [
	<generated>
	^ #(FamixTEnumValue)
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
