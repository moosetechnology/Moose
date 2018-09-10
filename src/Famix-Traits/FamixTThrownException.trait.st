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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTThrownException classSide >> generatedSlotNames [
	<generated>
	'FamixTThrownException class>>#generatedSlotNames'.
	^ #(definingEntity)
]

{ #category : #generator }
FamixTThrownException classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTThrownException >> definingEntity [

	<generated>
	^ definingEntity
]

{ #category : #accessing }
FamixTThrownException >> definingEntity: anObject [

	<generated>
	definingEntity := anObject

]
