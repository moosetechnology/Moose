Extension { #name : #FamixTestComposed2CustomEntity4 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel2-Entities' }
FamixTestComposed2CustomEntity4 >> c4s [

	<generated>
	<MSEProperty: #c4s type: #Object>
	"m-m" ^ self privateState attributeAt: #c4s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #c24s ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel2-Entities' }
FamixTestComposed2CustomEntity4 >> c4s: anObject [

	<generated>
	self c4s value: anObject
]
