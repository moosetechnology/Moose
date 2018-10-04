"
FAMIXFunction represents a behavioural entity in a procedural language.
"
Trait {
	#name : #FamixTFunction,
	#instVars : [
		'#functionOwner => FMOne type: #FamixTWithFunctions opposite: #functions'
	],
	#category : #'Famix-Traits-Function'
}

{ #category : #meta }
FamixTFunction classSide >> annotation [

	<MSEClass: #TFunction super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTFunction classSide >> generatedSlotNames [
	<generated>
	'FamixTFunction class>>#generatedSlotNames'.
	^ #(functionOwner)
]

{ #category : #generator }
FamixTFunction classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTFunction >> functionOwner [

	<generated>
	<MSEComment: 'The container defining the function. The function is placed in a container, because certain languages can nest functions in functions.'>
	<container>

	^ functionOwner
]

{ #category : #accessing }
FamixTFunction >> functionOwner: anObject [

	functionOwner := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTFunction >> functionOwnerGroup [

	<generated>
	<navigation: 'FunctionOwner'>
	^ MooseGroup
			with: (self functionOwner)
]

{ #category : #testing }
FamixTFunction >> isFunction [

	<generated>
	^ true
]
