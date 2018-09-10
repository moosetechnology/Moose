Trait {
	#name : #FamixTContainingWithInvocationsGlue,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTContainingWithInvocationsGlue classSide >> annotation [

	<MSEClass: #TContainingWithInvocationsGlue super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTContainingWithInvocationsGlue classSide >> generatedSlotNames [
	<generated>
	'FamixTContainingWithInvocationsGlue class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTContainingWithInvocationsGlue classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #metrics }
FamixTContainingWithInvocationsGlue >> incomingInvocations [

	| withInvocations |
	withInvocations :=  self children select: [ :child | child usesTrait: FamixTWithInvocations].
	^ withInvocations flatCollect: [ :each | each incomingInvocations ]
]

{ #category : #metrics }
FamixTContainingWithInvocationsGlue >> incomingInvocationsGroup [
	<navigation: 'Incoming invocations'>
	^ self privateState cacheAt:
		#incomingInvocationsGroup
		ifAbsentPut:
			[MooseGroup
				withAll: self incomingInvocations
				withDescription: 'Incoming invocations from ' , self mooseName]
]

{ #category : #metrics }
FamixTContainingWithInvocationsGlue >> outgoingInvocations [

	| withInvocations |
	withInvocations :=  self children select: [ :child | child usesTrait: FamixTWithInvocations].
	^ withInvocations flatCollect: [ :each | each outgoingInvocations ]
]

{ #category : #metrics }
FamixTContainingWithInvocationsGlue >> outgoingInvocationsGroup [
	<navigation: 'Outgoing invocations'>
	^ self privateState cacheAt:
		#outgoingInvocationsGroup
		ifAbsentPut:
			[MooseGroup
				withAll: self outgoingInvocations
				withDescription: 'Outgoing invocations from ' , self mooseName]
]
