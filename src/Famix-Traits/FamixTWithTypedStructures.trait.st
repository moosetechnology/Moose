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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithTypedStructures classSide >> generatedSlotNames [
	<generated>
	'FamixTWithTypedStructures class>>#generatedSlotNames'.
	^ #(structuresWithDeclaredType)
]

{ #category : #generator }
FamixTWithTypedStructures classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #deprecated }
FamixTWithTypedStructures >> addBehaviourWithDeclaredType: aBehaviour [
	self structuresWithDeclaredType add: aBehaviour
]

{ #category : #adding }
FamixTWithTypedStructures >> addStructureWithDeclaredType: aStructuralEntity [
	structuresWithDeclaredType add: aStructuralEntity
]

{ #category : #deprecated }
FamixTWithTypedStructures >> behavioursWithDeclaredType [

	^ self structuresWithDeclaredType
]

{ #category : #deprecated }
FamixTWithTypedStructures >> behavioursWithDeclaredType: anObject [

	^ self structuresWithDeclaredType: anObject
]

{ #category : #accessing }
FamixTWithTypedStructures >> structuresWithDeclaredType [

	<generated>
	<MSEComment: 'Structural entities that have this type as declaredType'>
	^ structuresWithDeclaredType
]

{ #category : #accessing }
FamixTWithTypedStructures >> structuresWithDeclaredType: anObject [

	<generated>
	structuresWithDeclaredType value: anObject

]
