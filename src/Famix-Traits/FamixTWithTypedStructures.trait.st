Trait {
	#name : #FamixTWithTypedStructures,
	#instVars : [
		'#structuresWithDeclaredType => FMMany type: #FamixTTypedStructure opposite: #declaredType'
	],
	#category : #'Famix-Traits-TypedStructure'
}

{ #category : #meta }
FamixTWithTypedStructures classSide >> annotation [

	<MSEClass: #TWithTypedStructures super: #Trait>
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
	<MSEComment: 'Structural entities that have this type as declaredType'>
	^ structuresWithDeclaredType
]

{ #category : #accessing }
FamixTWithTypedStructures >> structuresWithDeclaredType: anObject [

	<generated>
	structuresWithDeclaredType value: anObject

]
