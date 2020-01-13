Trait {
	#name : #FamixTWithCaughtExceptions,
	#instVars : [
		'#caughtExceptions => FMMany type: #FamixTCaughtException opposite: #definingEntity'
	],
	#category : #'Famix-Traits-CaughtException'
}

{ #category : #meta }
FamixTWithCaughtExceptions classSide >> annotation [

	<FMClass: #TWithCaughtExceptions super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithCaughtExceptions >> addCaughtException: aCaughtException [
	caughtExceptions add: aCaughtException 

]

{ #category : #accessing }
FamixTWithCaughtExceptions >> caughtExceptions [
	"Relation named: #caughtExceptions type: #FamixTCaughtException opposite: #definingEntity"

	<generated>
	<FMComment: 'The exceptions caught by the method'>
	<derived>
	^ caughtExceptions
]

{ #category : #accessing }
FamixTWithCaughtExceptions >> caughtExceptions: anObject [

	<generated>
	caughtExceptions value: anObject
]
