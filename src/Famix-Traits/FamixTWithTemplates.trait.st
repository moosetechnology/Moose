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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithTemplates >> addTemplate: anObject [
	templates add: anObject

]

{ #category : #accessing }
FamixTWithTemplates >> templates [
	"Relation named: #templates type: #FamixTTemplate opposite: #templateOwner"

	<generated>
	^ templates
]

{ #category : #accessing }
FamixTWithTemplates >> templates: anObject [

	<generated>
	templates value: anObject

]
