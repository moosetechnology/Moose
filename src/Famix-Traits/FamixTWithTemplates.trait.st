Trait {
	#name : #FamixTWithTemplates,
	#instVars : [
		'#templates => FMMany type: #FamixTTemplate opposite: #templateOwner'
	],
	#category : #'Famix-Traits-Template'
}

{ #category : #meta }
FamixTWithTemplates classSide >> annotation [

	<FMClass: #TWithTemplates super: #Object>
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
	<derived>
	^ templates
]

{ #category : #accessing }
FamixTWithTemplates >> templates: anObject [

	<generated>
	templates value: anObject
]
