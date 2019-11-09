Trait {
	#name : #FamixTWithTypedStructures,
	#instVars : [
		'#structuresWithDeclaredType => FMMany type: #FamixTTypedStructure opposite: #declaredType'
	],
	#category : #'Famix-Traits-TypedStructure'
}

{ #category : #meta }
FamixTWithTypedStructures classSide >> annotation [

	<FMClass: #TWithTypedStructures super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTWithTypedStructures >> addBehaviourWithDeclaredType: aBehaviour [
	self structuresWithDeclaredType add: aBehaviour
]

{ #category : #adding }
FamixTWithTypedStructures >> addStructureWithDeclaredType: aStructuralEntity [
	structuresWithDeclaredType add: aStructuralEntity
]

{ #category : #adding }
FamixTWithTypedStructures >> addStructuresWithDeclaredType: anObject [
	<generated>
	^ self structuresWithDeclaredType add: anObject
]

{ #category : #testing }
FamixTWithTypedStructures >> entityHasIncomingTypeDeclarations [
	^ self structuresWithDeclaredType isNotEmpty
]

{ #category : #accessing }
FamixTWithTypedStructures >> incomingTypeDeclarations [
	^ self structuresWithDeclaredType collect: [ :var | MooseQueryTypeDeclarationAssociation newFrom: var to: self ]
]

{ #category : #accessing }
FamixTWithTypedStructures >> structuresWithDeclaredType [
	"Relation named: #structuresWithDeclaredType type: #FamixTTypedStructure opposite: #declaredType"

	<generated>
	<FMComment: 'Structural entities that have this type as declaredType'>
	<derived>
	^ structuresWithDeclaredType
]

{ #category : #accessing }
FamixTWithTypedStructures >> structuresWithDeclaredType: anObject [

	<generated>
	structuresWithDeclaredType value: anObject
]
