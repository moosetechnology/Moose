Extension { #name : #FamixTestComposed1CustomEntity3 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity3 >> customEntity3s [

	<generated>
	<MSEProperty: #customEntity3s type: #Object>
	"o-m" ^ self privateState attributeAt: #customEntity3s ifAbsentPut: [ FMMultivalueLink on: self opposite: #customEntity3: ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity3 >> customEntity3s: anObject [

	<generated>
	"o-m" self customEntity3s value: anObject
]
