"
FAMIXModule represents a that basically provides a simple scoping abstraction for a .C/.CPP/.H files.

"
Trait {
	#name : #FamixTModule,
	#instVars : [
		'#moduleEntities => FMMany type: #FamixTDefinedInModule opposite: #parentModule'
	],
	#category : #'Famix-Traits-Module'
}

{ #category : #meta }
FamixTModule classSide >> annotation [

	<FMClass: #TModule super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTModule >> addModuleEntity: anObject [

	moduleEntities add: anObject

]

{ #category : #accessing }
FamixTModule >> moduleEntities [
	"Relation named: #moduleEntities type: #FamixTDefinedInModule opposite: #parentModule"

	<generated>
	<derived>
	^ moduleEntities
]

{ #category : #accessing }
FamixTModule >> moduleEntities: anObject [

	<generated>
	moduleEntities value: anObject
]
