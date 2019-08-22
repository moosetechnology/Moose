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
	^ namespaces
]

{ #category : #accessing }
FamixTWithNamespaces >> namespaces: anObject [

	<generated>
	namespaces value: anObject

]
