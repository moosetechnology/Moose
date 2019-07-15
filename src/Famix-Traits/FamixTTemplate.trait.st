Trait {
	#name : #FamixTTemplate,
	#instVars : [
		'#templateOwner => FMOne type: #FamixTWithTemplates opposite: #templates',
		'#templateUsers => FMMany type: #FamixTTemplateUser opposite: #template'
	],
	#category : #'Famix-Traits-Template'
}

{ #category : #meta }
FamixTTemplate classSide >> annotation [

	<MSEClass: #TTemplate super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTTemplate classSide >> generatedSlotNames [
	<generated>
	'FamixTTemplate class>>#generatedSlotNames'.
	^ #(templateOwner templateUsers)
]

{ #category : #generator }
FamixTTemplate classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTTemplate >> templateOwner [

	<generated>
	^ templateOwner
]

{ #category : #accessing }
FamixTTemplate >> templateOwner: anObject [

	<generated>
	templateOwner := anObject

]

{ #category : #accessing }
FamixTTemplate >> templateUsers [

	<generated>
	^ templateUsers
]

{ #category : #accessing }
FamixTTemplate >> templateUsers: anObject [

	<generated>
	templateUsers value: anObject

]
