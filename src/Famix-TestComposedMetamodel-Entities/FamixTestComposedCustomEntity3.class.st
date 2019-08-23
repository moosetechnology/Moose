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

{ #category : #meta }
FamixTestComposedCustomEntity3 class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedGenerator) metamodel
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> c23 [
	"Relation named: #c23 type: #FamixTestComposedCustomEntity3 opposite: #c3s"

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
	"Relation named: #customEntity3 type: #FamixTestComposedCustomEntity3 opposite: #customEntities3"

	<generated>
	<MSEProperty: #customEntity3 type: #Object>
	^ self privateState attributeAt: #customEntity3 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> customEntity3: anObject [

	<generated>
	self privateState attributeAt: #customEntity3 put: (FMMultivalueLink on: self update: #customEntities3 from: self customEntity3 to: anObject).
]
