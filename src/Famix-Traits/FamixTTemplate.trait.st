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
