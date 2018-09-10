Class {
	#name : #FamixStAssociation,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTAssociation + TAssociationMetaLevelDependency',
	#classTraits : 'FamixTAssociation classTrait + TAssociationMetaLevelDependency classTrait',
	#classInstVars : [
		'#targetTypes',
		'#sourceTypes'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAssociation class >> annotation [

	<MSEClass: #Association super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStAssociation class >> generatedSlotNames [
	<generated>
	'FamixStAssociation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStAssociation class >> generatedTraitNames [
	<generated>
	^ #(FamixTAssociation TAssociationMetaLevelDependency)
]

{ #category : #meta }
FamixStAssociation class >> requirements [

	<generated>
	^ {  }
]
