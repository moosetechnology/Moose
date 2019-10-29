Extension { #name : #FamixTestComposed2CustomEntity4 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity4 >> c14s [
	"Relation named: #c14s type: #FamixTestComposed1CustomEntity4 opposite: #c24s"

	<generated>
	<FMProperty: #c14s type: #FamixTestComposed1CustomEntity4 opposite: #c24s>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c14s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c24s ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity4 >> c14s: anObject [

	<generated>
	self c14s value: anObject
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity4 >> c4s [
	"Relation named: #c4s type: #FamixTestComposedCustomEntity4 opposite: #c24s"

	<generated>
	<FMProperty: #c4s type: #FamixTestComposedCustomEntity4 opposite: #c24s>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c4s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c24s ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity4 >> c4s: anObject [

	<generated>
	self c4s value: anObject
]
