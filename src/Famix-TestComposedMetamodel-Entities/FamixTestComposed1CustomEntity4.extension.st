Extension { #name : #FamixTestComposed1CustomEntity4 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity4 >> c24s [
	"Relation named: #c24s type: #FamixTestComposed2CustomEntity4 opposite: #c14s"

	<generated>
	<derived>
	<FMProperty: #c24s type: #FamixTestComposed2CustomEntity4 opposite: #c14s>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c24s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c14s ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity4 >> c24s: anObject [

	<generated>
	self c24s value: anObject
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity4 >> customEntities4 [
	"Relation named: #customEntities4 type: #FamixTestComposedCustomEntity4 opposite: #customEntities4"

	<generated>
	<FMProperty: #customEntities4 type: #FamixTestComposedCustomEntity4 opposite: #customEntities4>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #customEntities4 ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #customEntities4 ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity4 >> customEntities4: anObject [

	<generated>
	self customEntities4 value: anObject
]
