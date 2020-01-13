Trait {
	#name : #FamixTWithExceptions,
	#instVars : [
		'#exceptions => FMMany type: #FamixTException opposite: #exceptionClass'
	],
	#category : #'Famix-Traits-Exception'
}

{ #category : #meta }
FamixTWithExceptions classSide >> annotation [

	<FMClass: #TWithExceptions super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithExceptions >> addException: anObject [
	exceptions add: anObject

]

{ #category : #accessing }
FamixTWithExceptions >> exceptions [
	"Relation named: #exceptions type: #FamixTException opposite: #exceptionClass"

	<generated>
	<FMComment: 'Exceptions which class is myself.'>
	<derived>
	^ exceptions
]

{ #category : #accessing }
FamixTWithExceptions >> exceptions: anObject [

	<generated>
	exceptions value: anObject
]
