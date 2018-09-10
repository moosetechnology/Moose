Trait {
	#name : #FamixTTemplateUser,
	#instVars : [
		'#template => FMOne type: #FamixTTemplate opposite: #templateUsers'
	],
	#category : #'Famix-Traits-Template'
}

{ #category : #meta }
FamixTTemplateUser classSide >> annotation [

	<MSEClass: #TTemplateUser super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTTemplateUser classSide >> generatedSlotNames [
	<generated>
	'FamixTTemplateUser class>>#generatedSlotNames'.
	^ #(template)
]

{ #category : #generator }
FamixTTemplateUser classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTTemplateUser >> template [

	<generated>
	^ template
]

{ #category : #accessing }
FamixTTemplateUser >> template: anObject [

	<generated>
	template := anObject

]
