"
This is an exception explicitly thrown by a method.
"
Trait {
	#name : #FamixTThrownException,
	#instVars : [
		'#definingEntity => FMOne type: #FamixTWithThrownExceptions opposite: #thrownExceptions'
	],
	#category : #'Famix-Traits-ThrownException'
}

{ #category : #meta }
FamixTThrownException classSide >> annotation [

	<MSEClass: #TThrownException super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTThrownException >> definingEntity [

	<generated>
	"Relation named: #definingEntity type: #FamixTWithThrownExceptions opposite: #thrownExceptions"

	^ definingEntity
]

{ #category : #accessing }
FamixTThrownException >> definingEntity: anObject [

	<generated>
	definingEntity := anObject

]
