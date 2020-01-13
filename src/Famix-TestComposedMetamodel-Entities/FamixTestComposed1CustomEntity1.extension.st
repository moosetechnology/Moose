Extension { #name : #FamixTestComposed1CustomEntity1 }

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity1 >> c21 [
	"Relation named: #c21 type: #FamixTestComposed2CustomEntity1 opposite: #c11"

	<generated>
	<FMProperty: #c21 type: #FamixTestComposed2CustomEntity1 opposite: #c11>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #c21 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity1 >> c21: anObject [

	<generated>
	(self privateState attributeAt: #c21 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self c21.
		self privateState attributeAt: #c21 put: anObject.
		otherSide c11: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #c21 put: anObject.
		anObject c11: self ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity1 >> customEntity1 [
	"Relation named: #customEntity1 type: #FamixTestComposedCustomEntity1 opposite: #customEntity1"

	<generated>
	<container>
	<derived>
	<FMProperty: #customEntity1 type: #FamixTestComposedCustomEntity1 opposite: #customEntity1>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	^ self privateState attributeAt: #customEntity1 ifAbsent: [ nil ]
]

{ #category : #'*Famix-TestComposedMetamodel-Entities-accessing' }
FamixTestComposed1CustomEntity1 >> customEntity1: anObject [

	<generated>
	(self privateState attributeAt: #customEntity1 ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self customEntity1.
		self privateState attributeAt: #customEntity1 put: anObject.
		otherSide customEntity1: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #customEntity1 put: anObject.
		anObject customEntity1: self ]
]
