Trait {
	#name : #FamixTWithParameters,
	#instVars : [
		'#parameters => FMMany type: #FamixTParameter opposite: #parentBehaviouralEntity'
	],
	#category : #'Famix-Traits-Parameter'
}

{ #category : #meta }
FamixTWithParameters classSide >> annotation [

	<MSEClass: #TWithParameters super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithParameters classSide >> generatedSlotNames [
	<generated>
	'FamixTWithParameters class>>#generatedSlotNames'.
	^ #(parameters)
]

{ #category : #generator }
FamixTWithParameters classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #adding }
FamixTWithParameters >> addParameter: aParameter [ 
	parameters add: aParameter
]

{ #category : #accessing }
FamixTWithParameters >> numberOfParameters [
	<MSEProperty: #numberOfParameters type: #Number>
	<MSEComment: 'The number of parameters in a method'>
	<derived>
	^ self lookUpPropertyNamed: #numberOfParameters computedAs: [ self parameters size ]
]

{ #category : #accessing }
FamixTWithParameters >> numberOfParameters: aNumber [

	self privateState propertyAt: #numberOfParameters put: aNumber
]

{ #category : #accessing }
FamixTWithParameters >> parameters [

	<generated>
	<MSEComment: 'List of formal parameters declared by this behaviour.'>
	^ parameters
]

{ #category : #accessing }
FamixTWithParameters >> parameters: anObject [

	<generated>
	parameters value: anObject

]
