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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTDefinedInModule >> parentModule [
	"Relation named: #parentModule type: #FamixTModule opposite: #moduleEntities"

	<generated>
	<MSEComment: 'Module that contains the definition of this entity'>
	^ parentModule
]

{ #category : #accessing }
FamixTDefinedInModule >> parentModule: anObject [

	<generated>
	parentModule := anObject

]
