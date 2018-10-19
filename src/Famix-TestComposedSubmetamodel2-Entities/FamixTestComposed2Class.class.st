Class {
	#name : #FamixTestComposed2Class,
	#superclass : #FamixTestComposed2NamedEntity,
	#traits : 'FamixTClass + FamixTLCOMMetrics + FamixTWithMethods',
	#classTraits : 'FamixTClass classTrait + FamixTLCOMMetrics classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2Class class >> annotation [

	<MSEClass: #Class super: #FamixTestComposed2NamedEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2Class class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2Class class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2Class class >> generatedTraitNames [
	<generated>
	^ #(FamixTClass FamixTLCOMMetrics FamixTWithMethods)
]

{ #category : #meta }
FamixTestComposed2Class class >> requirements [

	<generated>
	^ {  }
]
