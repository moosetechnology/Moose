Trait {
	#name : #FamixTWithNamespaces,
	#instVars : [
		'#namespaces => FMMany type: #FamixTNamespace opposite: #namespaceOwner'
	],
	#category : #'Famix-Traits-Namespaces'
}

{ #category : #meta }
FamixTWithNamespaces classSide >> annotation [

	<FMClass: #TWithNamespaces super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithNamespaces >> addNamespace: anObject [
	namespaces add: anObject

]

{ #category : #accessing }
FamixTWithNamespaces >> namespaces [
	"Relation named: #namespaces type: #FamixTNamespace opposite: #namespaceOwner"

	<generated>
	<derived>
	^ namespaces
]

{ #category : #accessing }
FamixTWithNamespaces >> namespaces: anObject [

	<generated>
	namespaces value: anObject
]
