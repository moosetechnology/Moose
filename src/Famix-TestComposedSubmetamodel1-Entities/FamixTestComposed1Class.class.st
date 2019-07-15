Class {
	#name : #FamixTestComposed1Class,
	#superclass : #FamixTestComposed1NamedEntity,
	#traits : 'FamixTClass + FamixTLCOMMetrics + FamixTWithMethods',
	#classTraits : 'FamixTClass classTrait + FamixTLCOMMetrics classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Class class >> annotation [

	<MSEClass: #Class super: #FamixTestComposed1NamedEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1Class class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1Class class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1Class class >> generatedTraitNames [
	<generated>
	^ #(FamixTClass FamixTLCOMMetrics FamixTWithMethods)
]

{ #category : #meta }
FamixTestComposed1Class class >> requirements [

	<generated>
	^ {  }
]
