Trait {
	#name : #FamixTNamespaceEntity,
	#instVars : [
		'#parentNamespace => FMOne type: #FamixTNamespace opposite: #namespaceEntities'
	],
	#category : #'Famix-Traits-Namespaces'
}

{ #category : #meta }
FamixTNamespaceEntity classSide >> annotation [

	<MSEClass: #TNamespaceEntity super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTNamespaceEntity classSide >> generatedSlotNames [
	<generated>
	'FamixTNamespaceEntity class>>#generatedSlotNames'.
	^ #(parentNamespace)
]

{ #category : #generator }
FamixTNamespaceEntity classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTNamespaceEntity >> parentNamespace [

	<generated>
	^ parentNamespace
]

{ #category : #accessing }
FamixTNamespaceEntity >> parentNamespace: anObject [

	<generated>
	parentNamespace := anObject

]
