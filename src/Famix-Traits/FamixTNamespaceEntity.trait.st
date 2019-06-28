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
