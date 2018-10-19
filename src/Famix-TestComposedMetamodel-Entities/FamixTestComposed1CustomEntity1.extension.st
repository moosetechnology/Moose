Extension { #name : #FamixTestComposed1CustomEntity1 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity1 >> customEntity1 [

	<generated>
	<MSEProperty: #customEntity1 type: #Object>
	^ self privateState attributeAt: #customEntity1 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-*Famix-TestComposedSubmetamodel1-Entities' }
FamixTestComposed1CustomEntity1 >> customEntity1: anObject [

	<generated>
	"o-o" (self privateState attributeAt: #customEntity1 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #customEntity1 put: anObject.
	anObject customEntity1: self
]
