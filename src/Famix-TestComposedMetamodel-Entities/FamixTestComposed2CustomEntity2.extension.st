Extension { #name : #FamixTestComposed2CustomEntity2 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity2 >> c12 [

	<generated>
	<MSEProperty: #c12 type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c12 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity2 >> c12: anObject [

	<generated>
	self privateState attributeAt: #c12 put: (FMMultivalueLink on: self update: #c22s from: self c12 to: anObject).
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity2 >> c2 [

	<generated>
	<MSEProperty: #c2 type: #Object>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c2 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed2CustomEntity2 >> c2: anObject [

	<generated>
	self privateState attributeAt: #c2 put: (FMMultivalueLink on: self update: #c22s from: self c2 to: anObject).
]
