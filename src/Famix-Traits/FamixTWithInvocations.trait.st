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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithInvocations classSide >> generatedSlotNames [
	<generated>
	'FamixTWithInvocations class>>#generatedSlotNames'.
	^ #(outgoingInvocations)
]

{ #category : #generator }
FamixTWithInvocations classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #adding }
FamixTWithInvocations >> addOutgoingInvocation: anInvocation [
	outgoingInvocations add: anInvocation
]

{ #category : #accessing }
FamixTWithInvocations >> outgoingInvocations [

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
