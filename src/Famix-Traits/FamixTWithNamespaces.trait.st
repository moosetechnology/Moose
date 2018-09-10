Trait {
	#name : #FamixTWithNamespaces,
	#instVars : [
		'#namespaces => FMMany type: #FamixTNamespace opposite: #namespaceOwner'
	],
	#category : #'Famix-Traits-Namespaces'
}

{ #category : #meta }
FamixTWithNamespaces classSide >> annotation [

	<MSEClass: #TWithNamespaces super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithNamespaces classSide >> generatedSlotNames [
	<generated>
	'FamixTWithNamespaces class>>#generatedSlotNames'.
	^ #(namespaces)
]

{ #category : #generator }
FamixTWithNamespaces classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithNamespaces >> namespaces [

	<generated>
	^ namespaces
]

{ #category : #accessing }
FamixTWithNamespaces >> namespaces: anObject [

	<generated>
	namespaces value: anObject

]
