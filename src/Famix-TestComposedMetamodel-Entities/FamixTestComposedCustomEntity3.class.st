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
FamixTestComposedCustomEntity3 >> c23 [

	<generated>
	<MSEProperty: #c23 type: #Object>
	^ self privateState attributeAt: #c23 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> c23: anObject [

	<generated>
	self privateState attributeAt: #c23 put: (FMMultivalueLink on: self update: #c3s from: self c23 to: anObject).
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> customEntity3 [

	<generated>
	<MSEProperty: #customEntity3 type: #Object>
	^ self privateState attributeAt: #customEntity3 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> customEntity3: anObject [

	<generated>
	self privateState attributeAt: #customEntity3 put: (FMMultivalueLink on: self update: #customEntities3 from: self customEntity3 to: anObject).
]
