Class {
	#name : #FamixTestComposedCustomEntity4,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedCustomEntity4 class >> annotation [

	<MSEClass: #CustomEntity4 super: #MooseEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposedCustomEntity4 class >> generatedSlotNames [
	<generated>
	'FamixTestComposedCustomEntity4 class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposedCustomEntity4 class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposedCustomEntity4 class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedGenerator) metamodel
]

{ #category : #meta }
FamixTestComposedCustomEntity4 class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> customEntity4s [

	<generated>
	<MSEProperty: #customEntity4s type: #Object>
	"m-m" ^ self privateState attributeAt: #customEntity4s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #customEntity4s ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> customEntity4s: anObject [

	<generated>
	self customEntity4s value: anObject
]
