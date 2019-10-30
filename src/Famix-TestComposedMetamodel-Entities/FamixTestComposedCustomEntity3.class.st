Class {
	#name : #FamixTestComposedCustomEntity3,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedCustomEntity3 class >> annotation [

	<FMClass: #CustomEntity3 super: #MooseEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposedCustomEntity3 class >> metamodel [

	<generated>
	^ FamixTestComposedModel metamodel
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> c23 [
	"Relation named: #c23 type: #FamixTestComposed2CustomEntity3 opposite: #c3s"

	<generated>
	<FMProperty: #c23 type: #FamixTestComposed2CustomEntity3 opposite: #c3s>
	^ self privateState attributeAt: #c23 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> c23: anObject [

	<generated>
	self privateState attributeAt: #c23 put: (FMMultivalueLink on: self update: #c3s from: self c23 to: anObject).
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> customEntity3 [
	"Relation named: #customEntity3 type: #FamixTestComposed1CustomEntity3 opposite: #customEntities3"

	<generated>
	<FMProperty: #customEntity3 type: #FamixTestComposed1CustomEntity3 opposite: #customEntities3>
	^ self privateState attributeAt: #customEntity3 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedCustomEntity3 >> customEntity3: anObject [

	<generated>
	self privateState attributeAt: #customEntity3 put: (FMMultivalueLink on: self update: #customEntities3 from: self customEntity3 to: anObject).
]
