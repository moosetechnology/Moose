Trait {
	#name : #FamixTWithExceptions,
	#instVars : [
		'#exceptions => FMMany type: #FamixTException opposite: #exceptionClass'
	],
	#category : #'Famix-Traits-Exception'
}

{ #category : #meta }
FamixTWithExceptions classSide >> annotation [

	<MSEClass: #TWithExceptions super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithExceptions classSide >> generatedSlotNames [
	<generated>
	'FamixTWithExceptions class>>#generatedSlotNames'.
	^ #(exceptions)
]

{ #category : #generator }
FamixTWithExceptions classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithExceptions >> exceptions [

	<generated>
	<MSEComment: 'Exceptions which class is myself.'>
	^ exceptions
]

{ #category : #accessing }
FamixTWithExceptions >> exceptions: anObject [

	<generated>
	exceptions value: anObject

]
