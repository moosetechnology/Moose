Extension { #name : #FamixTestComposed2CustomEntity3 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity3 >> c13s [
	"Relation named: #c13s type: #FamixTestComposed1CustomEntity3 opposite: #c23"

	<generated>
	<derived>
	<FMProperty: #c13s type: #FamixTestComposed1CustomEntity3 opposite: #c23>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c13s ifAbsentPut: [ FMMultivalueLink on: self opposite: #c23: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity3 >> c13s: anObject [

	<generated>
	self c13s value: anObject
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity3 >> c3s [
	"Relation named: #c3s type: #FamixTestComposedCustomEntity3 opposite: #c23"

	<generated>
	<derived>
	<FMProperty: #c3s type: #FamixTestComposedCustomEntity3 opposite: #c23>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c3s ifAbsentPut: [ FMMultivalueLink on: self opposite: #c23: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity3 >> c3s: anObject [

	<generated>
	self c3s value: anObject
]
