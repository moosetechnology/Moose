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

	<FMClass: #TTemplate super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTTemplate >> addTemplateUser: anObject [

	templateUsers add: anObject

]

{ #category : #accessing }
FamixTTemplate >> templateOwner [
	"Relation named: #templateOwner type: #FamixTWithTemplates opposite: #templates"

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
	"Relation named: #templateUsers type: #FamixTTemplateUser opposite: #template"

	<generated>
	<derived>
	^ templateUsers
]

{ #category : #accessing }
FamixTTemplate >> templateUsers: anObject [

	<generated>
	templateUsers value: anObject
]
