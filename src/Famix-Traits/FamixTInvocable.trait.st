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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTInvocable >> addIncomingInvocation: anInvocation [
	incomingInvocations add: anInvocation
]

{ #category : #accessing }
FamixTInvocable >> incomingInvocations [
	"Relation named: #incomingInvocations type: #FamixTInvocation opposite: #candidates"

	<generated>
	<MSEComment: 'Incoming invocations from other behaviours computed by the candidate operator.'>
	^ incomingInvocations
]

{ #category : #accessing }
FamixTInvocable >> incomingInvocations: anObject [

	<generated>
	incomingInvocations value: anObject

]
