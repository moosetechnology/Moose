Class {
	#name : #FamixTest2Class,
	#superclass : #FamixTest2NamedEntity,
	#traits : 'FamixTClass',
	#classTraits : 'FamixTClass classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Class class >> annotation [

	<MSEClass: #Class super: #FamixTest2NamedEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest2Class class >> generatedSlotNames [
	<generated>
	'FamixTest2Class class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest2Class class >> generatedTraitNames [
	<generated>
	^ #(FamixTClass FamixTWithSubInheritances FamixTWithSuperInheritances)
]

{ #category : #meta }
FamixTest2Class class >> requirements [

	<generated>
	^ {  }
]
