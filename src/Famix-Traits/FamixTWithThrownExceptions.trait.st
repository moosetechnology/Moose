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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithThrownExceptions classSide >> generatedSlotNames [
	<generated>
	'FamixTWithThrownExceptions class>>#generatedSlotNames'.
	^ #(thrownExceptions)
]

{ #category : #accessing }
FamixTWithThrownExceptions >> addThrownException: anObject [
	thrownExceptions add: anObject
]

{ #category : #accessing }
FamixTWithThrownExceptions >> thrownExceptions [

	<generated>
	<MSEComment: 'The exceptions thrown by the method'>
	^ thrownExceptions
]

{ #category : #accessing }
FamixTWithThrownExceptions >> thrownExceptions: anObject [

	<generated>
	thrownExceptions value: anObject

]
