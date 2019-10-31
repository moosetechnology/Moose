"
This is an exception that is explicitly handled by a method. For example, in Java it is an exception that appears in a catch statement.
"
Trait {
	#name : #FamixTCaughtException,
	#instVars : [
		'#definingEntity => FMOne type: #FamixTWithCaughtExceptions opposite: #caughtExceptions'
	],
	#category : #'Famix-Traits-CaughtException'
}

{ #category : #meta }
FamixTCaughtException classSide >> annotation [

	<FMClass: #TCaughtException super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTCaughtException >> definingEntity [
	"Relation named: #definingEntity type: #FamixTWithCaughtExceptions opposite: #caughtExceptions"

	<generated>
	^ definingEntity
]

{ #category : #accessing }
FamixTCaughtException >> definingEntity: anObject [

	<generated>
	definingEntity := anObject
]
