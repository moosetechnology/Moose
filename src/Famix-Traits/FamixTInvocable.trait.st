Trait {
	#name : #FamixTInvocable,
	#instVars : [
		'#incomingInvocations => FMMany type: #FamixTInvocation opposite: #candidates'
	],
	#category : #'Famix-Traits-Invocation'
}

{ #category : #meta }
FamixTInvocable classSide >> annotation [

	<MSEClass: #TInvocable super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTInvocable classSide >> generatedSlotNames [
	<generated>
	'FamixTInvocable class>>#generatedSlotNames'.
	^ #(incomingInvocations)
]

{ #category : #generator }
FamixTInvocable classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #adding }
FamixTInvocable >> addIncomingInvocation: anInvocation [
	incomingInvocations add: anInvocation
]

{ #category : #accessing }
FamixTInvocable >> incomingInvocations [

	<generated>
	<MSEComment: 'Incoming invocations from other behaviours computed by the candidate operator.'>
	^ incomingInvocations
]

{ #category : #accessing }
FamixTInvocable >> incomingInvocations: anObject [

	<generated>
	incomingInvocations value: anObject

]
