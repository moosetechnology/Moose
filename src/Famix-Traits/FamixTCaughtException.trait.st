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

	<MSEClass: #TCaughtException super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTCaughtException classSide >> generatedSlotNames [
	<generated>
	'FamixTCaughtException class>>#generatedSlotNames'.
	^ #(definingEntity)
]

{ #category : #generator }
FamixTCaughtException classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTCaughtException >> definingEntity [

	<generated>
	^ definingEntity
]

{ #category : #accessing }
FamixTCaughtException >> definingEntity: anObject [

	<generated>
	definingEntity := anObject

]
