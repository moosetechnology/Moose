Class {
	#name : #FamixTestComposedCustomEntity1,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedCustomEntity1 class >> annotation [

	<MSEClass: #CustomEntity1 super: #MooseEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposedCustomEntity1 class >> generatedSlotNames [
	<generated>
	'FamixTestComposedCustomEntity1 class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposedCustomEntity1 class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposedCustomEntity1 class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedGenerator) metamodel
]

{ #category : #meta }
FamixTestComposedCustomEntity1 class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixTestComposedCustomEntity1 >> c21 [

	<generated>
	<MSEProperty: #c21 type: #Object>
	^ self privateState attributeAt: #c21 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity1 >> c21: anObject [

	<generated>
	(self privateState attributeAt: #c21 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #c21 put: anObject.
	anObject c1: self
]

{ #category : #accessing }
FamixTestComposedCustomEntity1 >> customEntity1 [

	<generated>
	<MSEProperty: #customEntity1 type: #Object>
	^ self privateState attributeAt: #customEntity1 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity1 >> customEntity1: anObject [

	<generated>
	(self privateState attributeAt: #customEntity1 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #customEntity1 put: anObject.
	anObject customEntity1: self
]
