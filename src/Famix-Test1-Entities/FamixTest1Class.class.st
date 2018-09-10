Class {
	#name : #FamixTest1Class,
	#superclass : #FamixTest1NamedEntity,
	#traits : 'FamixTClass + FamixTLCOMMetrics + FamixTWithMethods',
	#classTraits : 'FamixTClass classTrait + FamixTLCOMMetrics classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Test1-Entities-Entities'
}

{ #category : #meta }
FamixTest1Class class >> annotation [

	<MSEClass: #Class super: #FamixTest1NamedEntity>
	<package: #'Famix-Test1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest1Class class >> generatedSlotNames [
	<generated>
	'FamixTest1Class class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1Class class >> generatedTraitNames [
	<generated>
	^ #(FamixTClass FamixTLCOMMetrics FamixTWithMethods)
]

{ #category : #meta }
FamixTest1Class class >> requirements [

	<generated>
	^ {  }
]
