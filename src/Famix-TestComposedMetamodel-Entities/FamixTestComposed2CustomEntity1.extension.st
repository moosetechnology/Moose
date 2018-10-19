Extension { #name : #FamixTestComposed2CustomEntity1 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel2-Entities' }
FamixTestComposed2CustomEntity1 >> c1 [

	<generated>
	<MSEProperty: #c1 type: #Object>
	^ self privateState attributeAt: #c1 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel2-Entities' }
FamixTestComposed2CustomEntity1 >> c1: anObject [

	<generated>
	"o-o" (self privateState attributeAt: #c1 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #c1 put: anObject.
	anObject c21: self
]
