Trait {
	#name : #FamixTTypedStructure,
	#instVars : [
		'#declaredType => FMOne type: #FamixTWithTypedStructures opposite: #structuresWithDeclaredType'
	],
	#category : #'Famix-Traits-TypedStructure'
}

{ #category : #meta }
FamixTTypedStructure classSide >> annotation [

	<MSEClass: #TTypedStructure super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTTypedStructure classSide >> generatedSlotNames [
	<generated>
	'FamixTTypedStructure class>>#generatedSlotNames'.
	^ #(declaredType)
]

{ #category : #generator }
FamixTTypedStructure classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTTypedStructure >> declaredType [

	<generated>
	<MSEComment: 'Type of the behavioral entity, if any'>
	^ declaredType
]

{ #category : #accessing }
FamixTTypedStructure >> declaredType: anObject [

	<generated>
	declaredType := anObject

]
