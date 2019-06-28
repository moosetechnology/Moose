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
