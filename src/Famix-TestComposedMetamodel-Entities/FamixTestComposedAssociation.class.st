Class {
	#name : #FamixTestComposedAssociation,
	#superclass : #FamixTestComposedEntity,
	#traits : 'TAssociationMetaLevelDependency',
	#classTraits : 'TAssociationMetaLevelDependency classTrait',
	#category : #'Famix-TestComposedMetamodel-Entities-Entities'
}

{ #category : #meta }
FamixTestComposedAssociation class >> annotation [

	<MSEClass: #Association super: #FamixTestComposedEntity>
	<package: #'Famix-TestComposedMetamodel-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposedAssociation class >> generatedSlotNames [
	<generated>
	'FamixTestComposedAssociation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposedAssociation class >> generatedTraitNames [
	<generated>
	^ #(TAssociationMetaLevelDependency)
]

{ #category : #meta }
FamixTestComposedAssociation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FamixTestComposedAssociation >> c15 [

	<generated>
	<target>

	<MSEProperty: #c15 type: #Object>
	^ self privateState attributeAt: #c15 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedAssociation >> c15: anObject [

	<generated>
	self privateState attributeAt: #c15 put: (FMMultivalueLink on: self update: #associations from: self c15 to: anObject).
]

{ #category : #accessing }
FamixTestComposedAssociation >> c25 [

	<generated>
	<source>

	<MSEProperty: #c25 type: #Object>
	^ self privateState attributeAt: #c25 ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixTestComposedAssociation >> c25: anObject [

	<generated>
	self privateState attributeAt: #c25 put: (FMMultivalueLink on: self update: #associations from: self c25 to: anObject).
]

{ #category : #accessing }
FamixTestComposedAssociation >> from [

	^ self c25
]

{ #category : #accessing }
FamixTestComposedAssociation >> from: anObject [

	^ self c25: anObject
]

{ #category : #accessing }
FamixTestComposedAssociation >> to [

	^ self c15
]

{ #category : #accessing }
FamixTestComposedAssociation >> to: anObject [

	^ self c15: anObject
]
