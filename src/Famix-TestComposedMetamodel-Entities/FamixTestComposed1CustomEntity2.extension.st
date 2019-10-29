Extension { #name : #FamixTestComposed1CustomEntity2 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity2 >> c22s [
	"Relation named: #c22s type: #FamixTestComposed2CustomEntity2 opposite: #c12"

	<generated>
	<derived>
	<FMProperty: #c22s type: #FamixTestComposed2CustomEntity2 opposite: #c12>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c22s ifAbsentPut: [ FMMultivalueLink on: self opposite: #c12: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity2 >> c22s: anObject [

	<generated>
	self c22s value: anObject
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity2 >> customEntity2 [
	"Relation named: #customEntity2 type: #FamixTestComposedCustomEntity2 opposite: #customEntities2"

	<generated>
	<FMProperty: #customEntity2 type: #FamixTestComposedCustomEntity2 opposite: #customEntities2>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #customEntity2 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity2 >> customEntity2: anObject [

	<generated>
	self privateState attributeAt: #customEntity2 put: (FMMultivalueLink on: self update: #customEntities2 from: self customEntity2 to: anObject).
]
