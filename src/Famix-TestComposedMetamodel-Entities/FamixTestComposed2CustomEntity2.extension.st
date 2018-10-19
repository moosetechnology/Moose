Extension { #name : #FamixTestComposed2CustomEntity2 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel2-Entities' }
FamixTestComposed2CustomEntity2 >> c2 [

	<generated>
	<MSEProperty: #c2 type: #Object>
	"m-o" ^ self privateState attributeAt: #c2 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel2-Entities' }
FamixTestComposed2CustomEntity2 >> c2: anObject [

	<generated>
	"m-o" self privateState attributeAt: #c2 put: (FMMultivalueLink on: self update: #c22s from: self c2 to: anObject).
]
