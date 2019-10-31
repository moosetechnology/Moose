Trait {
	#name : #FamixTInvocable,
	#instVars : [
		'#incomingInvocations => FMMany type: #FamixTInvocation opposite: #candidates'
	],
	#category : #'Famix-Traits-Invocation'
}

{ #category : #meta }
FamixTInvocable classSide >> annotation [

	<FMClass: #TInvocable super: #Object>
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
	<FMComment: 'Incoming invocations from other behaviours computed by the candidate operator.'>
	<derived>
	^ incomingInvocations
]

{ #category : #accessing }
FamixTInvocable >> incomingInvocations: anObject [

	<generated>
	incomingInvocations value: anObject
]
