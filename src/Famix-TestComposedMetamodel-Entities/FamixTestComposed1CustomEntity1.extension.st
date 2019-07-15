Extension { #name : #FamixTestComposed1CustomEntity1 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity1 >> c21 [

	<generated>
	<MSEProperty: #c21 type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c21 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity1 >> c21: anObject [

	<generated>
	(self privateState attributeAt: #c21 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #c21 put: anObject.
	anObject c11: self
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity1 >> customEntity1 [

	<generated>
	<MSEProperty: #customEntity1 type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #customEntity1 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity1 >> customEntity1: anObject [

	<generated>
	(self privateState attributeAt: #customEntity1 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #customEntity1 put: anObject.
	anObject customEntity1: self
]
