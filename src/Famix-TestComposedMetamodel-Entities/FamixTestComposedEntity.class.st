Class {
	#name : #FamixTestComposedEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposedEntity class >> metamodel [

	<generated>
	^ FamixTestComposedModel metamodel
]

{ #category : #accessing }
FamixTestComposedEntity >> method [
	"Relation named: #method type: #FamixTestComposed1Method opposite: #entity"

	<generated>
	<FMProperty: #method type: #FamixTestComposed1Method opposite: #entity>
	^ self privateState attributeAt: #method ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedEntity >> method: anObject [

	<generated>
	(self privateState attributeAt: #method ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self method.
		self privateState attributeAt: #method put: anObject.
		otherSide entity: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #method put: anObject.
		anObject entity: self ]
]
