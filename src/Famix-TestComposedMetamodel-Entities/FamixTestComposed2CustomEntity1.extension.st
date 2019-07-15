Extension { #name : #FamixTestComposed2CustomEntity1 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity1 >> c1 [

	<generated>
	<MSEProperty: #c1 type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c1 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity1 >> c11 [

	<generated>
	<MSEProperty: #c11 type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c11 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity1 >> c11: anObject [

	<generated>
	(self privateState attributeAt: #c11 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #c11 put: anObject.
	anObject c21: self
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity1 >> c1: anObject [

	<generated>
	(self privateState attributeAt: #c1 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #c1 put: anObject.
	anObject c21: self
]
