Trait {
	#name : #FamixTWithExceptions,
	#instVars : [
		'#exceptions => FMMany type: #FamixTException opposite: #exceptionClass'
	],
	#category : #'Famix-Traits-Exception'
}

{ #category : #meta }
FamixTWithExceptions classSide >> annotation [

	<MSEClass: #TWithExceptions super: #Trait>
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
	<MSEComment: 'Exceptions which class is myself.'>
	^ exceptions
]

{ #category : #accessing }
FamixTWithExceptions >> exceptions: anObject [

	<generated>
	exceptions value: anObject

]
