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

{ #category : #meta }
FamixTestComposedCustomEntity4 class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedGenerator) metamodel
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> c24s [
	"Relation named: #c24s type: #FamixTestComposedCustomEntity4 opposite: #c4s"

	<generated>
	<MSEProperty: #c24s type: #Object>
	^ self privateState attributeAt: #c24s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c4s ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> c24s: anObject [

	<generated>
	self c24s value: anObject
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> customEntities4 [
	"Relation named: #customEntities4 type: #FamixTestComposedCustomEntity4 opposite: #customEntities4"

	<generated>
	<MSEProperty: #customEntities4 type: #Object>
	^ self privateState attributeAt: #customEntities4 ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #customEntities4 ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity4 >> customEntities4: anObject [

	<generated>
	self customEntities4 value: anObject
]
