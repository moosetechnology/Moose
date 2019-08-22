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

{ #category : #meta }
FamixTestComposedCustomEntity1 class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedGenerator) metamodel
]

{ #category : #accessing }
FamixTestComposedCustomEntity1 >> c21 [
	"Relation named: #c21 type: #FamixTestComposedCustomEntity1 opposite: #c1"

	<generated>
	<MSEProperty: #c21 type: #Object>
	^ self privateState attributeAt: #c21 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity1 >> c21: anObject [

	<generated>
	(self privateState attributeAt: #c21 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self c21.
		self privateState attributeAt: #c21 put: anObject.
		otherSide c1: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #c21 put: anObject.
		anObject c1: self ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity1 >> customEntity1 [
	"Relation named: #customEntity1 type: #FamixTestComposedCustomEntity1 opposite: #customEntity1"

	<generated>
	<MSEProperty: #customEntity1 type: #Object>
	^ self privateState attributeAt: #customEntity1 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity1 >> customEntity1: anObject [

	<generated>
	(self privateState attributeAt: #customEntity1 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self customEntity1.
		self privateState attributeAt: #customEntity1 put: anObject.
		otherSide customEntity1: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #customEntity1 put: anObject.
		anObject customEntity1: self ]
]

{ #category : #navigation }
FamixTestComposedCustomEntity1 >> customEntity1Group [
	<generated>
	<navigation: 'CustomEntity1'>
	^ MooseGroup with: self customEntity1
]
