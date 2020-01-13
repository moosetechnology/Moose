Extension { #name : #FamixTestComposed1CustomEntity3 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity3 >> c23 [
	"Relation named: #c23 type: #FamixTestComposed2CustomEntity3 opposite: #c13s"

	<generated>
	<FMProperty: #c23 type: #FamixTestComposed2CustomEntity3 opposite: #c13s>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c23 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity3 >> c23: anObject [

	<generated>
	self privateState attributeAt: #c23 put: (FMMultivalueLink on: self update: #c13s from: self c23 to: anObject).
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity3 >> customEntities3 [
	"Relation named: #customEntities3 type: #FamixTestComposedCustomEntity3 opposite: #customEntity3"

	<generated>
	<derived>
	<FMProperty: #customEntities3 type: #FamixTestComposedCustomEntity3 opposite: #customEntity3>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #customEntities3 ifAbsentPut: [ FMMultivalueLink on: self opposite: #customEntity3: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity3 >> customEntities3: anObject [

	<generated>
	self customEntities3 value: anObject
]
