Trait {
	#name : #FamixTWithCaughtExceptions,
	#instVars : [
		'#caughtExceptions => FMMany type: #FamixTCaughtException opposite: #definingEntity'
	],
	#category : #'Famix-Traits-CaughtException'
}

{ #category : #meta }
FamixTWithCaughtExceptions classSide >> annotation [

	<MSEClass: #TWithCaughtExceptions super: #Trait>
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
	<MSEComment: 'The exceptions caught by the method'>
	^ caughtExceptions
]

{ #category : #accessing }
FamixTWithCaughtExceptions >> caughtExceptions: anObject [

	<generated>
	caughtExceptions value: anObject

]
