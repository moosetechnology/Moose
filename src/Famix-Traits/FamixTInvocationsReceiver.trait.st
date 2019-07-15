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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTInvocationsReceiver classSide >> generatedSlotNames [
	<generated>
	'FamixTInvocationsReceiver class>>#generatedSlotNames'.
	^ #(receivingInvocations)
]

{ #category : #generator }
FamixTInvocationsReceiver classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #adding }
FamixTInvocationsReceiver >> addReceivingInvocation: anInvocation [
	receivingInvocations add: anInvocation
]

{ #category : #accessing }
FamixTInvocationsReceiver >> receivingInvocations [

	<generated>
	<MSEComment: 'List of invocations performed on this entity (considered as the receiver)'>
	^ receivingInvocations
]

{ #category : #accessing }
FamixTInvocationsReceiver >> receivingInvocations: anObject [

	<generated>
	receivingInvocations value: anObject

]
