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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTNamespaceEntity >> parentNamespace [
	"Relation named: #parentNamespace type: #FamixTNamespace opposite: #namespaceEntities"

	<generated>
	^ parentNamespace
]

{ #category : #accessing }
FamixTNamespaceEntity >> parentNamespace: anObject [

	<generated>
	parentNamespace := anObject

]
