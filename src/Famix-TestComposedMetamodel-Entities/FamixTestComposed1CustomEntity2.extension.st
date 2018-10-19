Extension { #name : #FamixTestComposed1CustomEntity2 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity2 >> customEntity2 [

	<generated>
	<MSEProperty: #customEntity2 type: #Object>
	"m-o" ^ self privateState attributeAt: #customEntity2 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity2 >> customEntity2: anObject [

	<generated>
	"m-o" self privateState attributeAt: #customEntity2 put: (FMMultivalueLink on: self update: #customEntity2s from: self customEntity2 to: anObject).
]
