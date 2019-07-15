Trait {
	#name : #FamixTDefinedInModule,
	#instVars : [
		'#parentModule => FMOne type: #FamixTModule opposite: #moduleEntities'
	],
	#category : #'Famix-Traits-Module'
}

{ #category : #meta }
FamixTDefinedInModule classSide >> annotation [

	<MSEClass: #TDefinedInModule super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTDefinedInModule classSide >> generatedSlotNames [
	<generated>
	'FamixTDefinedInModule class>>#generatedSlotNames'.
	^ #(parentModule)
]

{ #category : #generator }
FamixTDefinedInModule classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTDefinedInModule >> parentModule [

	<generated>
	<MSEComment: 'Module that contains the definition of this entity'>
	^ parentModule
]

{ #category : #accessing }
FamixTDefinedInModule >> parentModule: anObject [

	<generated>
	parentModule := anObject

]
