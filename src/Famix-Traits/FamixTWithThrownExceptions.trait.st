Trait {
	#name : #FamixTWithThrownExceptions,
	#instVars : [
		'#thrownExceptions => FMMany type: #FamixTThrownException opposite: #definingEntity'
	],
	#category : #'Famix-Traits-ThrownException'
}

{ #category : #meta }
FamixTWithThrownExceptions classSide >> annotation [

	<FMClass: #TWithThrownExceptions super: #Object>
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
	<FMComment: 'The exceptions thrown by the method'>
	<derived>
	^ thrownExceptions
]

{ #category : #accessing }
FamixTWithThrownExceptions >> thrownExceptions: anObject [

	<generated>
	thrownExceptions value: anObject
]
