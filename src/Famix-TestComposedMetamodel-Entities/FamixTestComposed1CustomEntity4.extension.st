Extension { #name : #FamixTestComposed1CustomEntity4 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity4 >> customEntity4s [

	<generated>
	<MSEProperty: #customEntity4s type: #Object>
	"m-m" ^ self privateState attributeAt: #customEntity4s ifAbsentPut: [ FMMultiMultivalueLink on: self opposite: #customEntity4s ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity4 >> customEntity4s: anObject [

	<generated>
	self customEntity4s value: anObject
]
