Trait {
	#name : #FamixTWithTemplates,
	#instVars : [
		'#templates => FMMany type: #FamixTTemplate opposite: #templateOwner'
	],
	#category : #'Famix-Traits-Template'
}

{ #category : #meta }
FamixTWithTemplates classSide >> annotation [

	<MSEClass: #TWithTemplates super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithTemplates classSide >> generatedSlotNames [
	<generated>
	'FamixTWithTemplates class>>#generatedSlotNames'.
	^ #(templates)
]

{ #category : #generator }
FamixTWithTemplates classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithTemplates >> templates [

	<generated>
	^ templates
]

{ #category : #accessing }
FamixTWithTemplates >> templates: anObject [

	<generated>
	templates value: anObject

]
