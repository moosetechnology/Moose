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

	<FMClass: #TThrownException super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTThrownException >> definingEntity [
	"Relation named: #definingEntity type: #FamixTWithThrownExceptions opposite: #thrownExceptions"

	<generated>
	^ definingEntity
]

{ #category : #accessing }
FamixTThrownException >> definingEntity: anObject [

	<generated>
	definingEntity := anObject
]
