Class {
	#name : #FamixTestComposedCustomEntity3,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedCustomEntity3 class >> annotation [

	<MSEClass: #CustomEntity3 super: #MooseEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposedCustomEntity3 class >> generatedSlotNames [
	<generated>
	'FamixTestComposedCustomEntity3 class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposedCustomEntity3 class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposedCustomEntity3 class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedGenerator) metamodel
]

{ #category : #meta }
FamixTestComposedCustomEntity3 class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> customEntity3 [

	<generated>
	<MSEProperty: #customEntity3 type: #Object>
	"m-o" ^ self privateState attributeAt: #customEntity3 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> customEntity3: anObject [

	<generated>
	"m-o" self privateState attributeAt: #customEntity3 put: (FMMultivalueLink on: self update: #customEntity3s from: self customEntity3 to: anObject).
]
