Trait {
	#name : #FamixTWithInvocations,
	#instVars : [
		'#outgoingInvocations => FMMany type: #FamixTInvocation opposite: #sender'
	],
	#category : #'Famix-Traits-Invocation'
}

{ #category : #meta }
FamixTWithInvocations classSide >> annotation [

	<MSEClass: #TWithInvocations super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTWithInvocations >> addOutgoingInvocation: anInvocation [
	outgoingInvocations add: anInvocation
]

{ #category : #accessing }
FamixTWithInvocations >> outgoingInvocations [
	"Relation named: #outgoingInvocations type: #FamixTInvocation opposite: #sender"

	<generated>
	<MSEComment: 'Outgoing invocations sent by this behaviour.'>
	^ outgoingInvocations
]

{ #category : #accessing }
FamixTWithInvocations >> outgoingInvocations: anObject [

	<generated>
	outgoingInvocations value: anObject

]

{ #category : #adding }
FamixTWithInvocations >> outgoingInvocationsGroup [
	<navigation: 'Outgoing invocations'>
	^ self privateState cacheAt:
		#outgoingInvocationsGroup
		ifAbsentPut:
			[MooseGroup
				withAll: self outgoingInvocations
				withDescription: 'Outgoing invocations from ' , self mooseName]
]
