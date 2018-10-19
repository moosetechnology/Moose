Extension { #name : #FamixTestComposed2CustomEntity3 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel2-Entities' }
FamixTestComposed2CustomEntity3 >> c3s [

	<generated>
	<MSEProperty: #c3s type: #Object>
	"o-m" ^ self privateState attributeAt: #c3s ifAbsentPut: [ FMMultivalueLink on: self opposite: #c23: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel2-Entities' }
FamixTestComposed2CustomEntity3 >> c3s: anObject [

	<generated>
	"o-m" self c3s value: anObject
]
