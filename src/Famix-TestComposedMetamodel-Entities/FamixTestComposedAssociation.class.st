Class {
	#name : #FamixTestComposedAssociation,
	#superclass : #FamixTestComposedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedAssociation class >> annotation [

	<FMClass: #Association super: #FamixTestComposedEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTestComposedAssociation >> c15 [
	"Relation named: #c15 type: #FamixTestComposed1CustomEntity5 opposite: #associations"

	<generated>
	<target>
	<FMProperty: #c15 type: #FamixTestComposed1CustomEntity5 opposite: #associations>
	^ self privateState attributeAt: #c15 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedAssociation >> c15: anObject [

	<generated>
	self privateState attributeAt: #c15 put: (FMMultivalueLink on: self update: #associations from: self c15 to: anObject).
]

{ #category : #accessing }
FamixTestComposedAssociation >> c25 [
	"Relation named: #c25 type: #FamixTestComposed2CustomEntity5 opposite: #associations"

	<generated>
	<source>
	<FMProperty: #c25 type: #FamixTestComposed2CustomEntity5 opposite: #associations>
	^ self privateState attributeAt: #c25 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedAssociation >> c25: anObject [

	<generated>
	self privateState attributeAt: #c25 put: (FMMultivalueLink on: self update: #associations from: self c25 to: anObject).
]

{ #category : #accessing }
FamixTestComposedAssociation >> source [
	^ self c25
]

{ #category : #accessing }
FamixTestComposedAssociation >> source: aSource [
	^ self c25: aSource
]

{ #category : #accessing }
FamixTestComposedAssociation >> target [
	^ self c15
]

{ #category : #accessing }
FamixTestComposedAssociation >> target: aTarget [
	^ self c15: aTarget
]
