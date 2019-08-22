Trait {
	#name : #FamixTInvocationsReceiver,
	#instVars : [
		'#receivingInvocations => FMMany type: #FamixTInvocation opposite: #receiver'
	],
	#category : #'Famix-Traits-Invocation'
}

{ #category : #meta }
FamixTInvocationsReceiver classSide >> annotation [

	<MSEClass: #TInvocationsReceiver super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTInvocationsReceiver >> addReceivingInvocation: anInvocation [
	receivingInvocations add: anInvocation
]

{ #category : #accessing }
FamixTInvocationsReceiver >> receivingInvocations [
	"Relation named: #receivingInvocations type: #FamixTInvocation opposite: #receiver"

	<generated>
	<MSEComment: 'List of invocations performed on this entity (considered as the receiver)'>
	^ receivingInvocations
]

{ #category : #accessing }
FamixTInvocationsReceiver >> receivingInvocations: anObject [

	<generated>
	receivingInvocations value: anObject

]
