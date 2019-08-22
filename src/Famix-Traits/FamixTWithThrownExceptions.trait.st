Trait {
	#name : #FamixTWithThrownExceptions,
	#instVars : [
		'#thrownExceptions => FMMany type: #FamixTThrownException opposite: #definingEntity'
	],
	#category : #'Famix-Traits-ThrownException'
}

{ #category : #meta }
FamixTWithThrownExceptions classSide >> annotation [

	<MSEClass: #TWithThrownExceptions super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithThrownExceptions >> addThrownException: anObject [
	thrownExceptions add: anObject
]

{ #category : #accessing }
FamixTWithThrownExceptions >> thrownExceptions [
	"Relation named: #thrownExceptions type: #FamixTThrownException opposite: #definingEntity"

	<generated>
	<MSEComment: 'The exceptions thrown by the method'>
	^ thrownExceptions
]

{ #category : #accessing }
FamixTWithThrownExceptions >> thrownExceptions: anObject [

	<generated>
	thrownExceptions value: anObject

]
