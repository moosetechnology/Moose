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

	<MSEClass: #TModule super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTModule classSide >> generatedSlotNames [
	<generated>
	'FamixTModule class>>#generatedSlotNames'.
	^ #(moduleEntities)
]

{ #category : #generator }
FamixTModule classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTModule >> moduleEntities [

	<generated>
	^ moduleEntities
]

{ #category : #accessing }
FamixTModule >> moduleEntities: anObject [

	<generated>
	moduleEntities value: anObject

]
