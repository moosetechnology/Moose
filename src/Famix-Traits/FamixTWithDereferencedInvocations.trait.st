Trait {
	#name : #FamixTWithDereferencedInvocations,
	#instVars : [
		'#dereferencedInvocations => FMMany type: #FamixTDereferencedInvocation opposite: #referencer'
	],
	#category : #'Famix-Traits-DereferencedInvocation'
}

{ #category : #meta }
FamixTWithDereferencedInvocations classSide >> annotation [

	<MSEClass: #TWithDereferencedInvocations super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithDereferencedInvocations classSide >> generatedSlotNames [
	<generated>
	'FamixTWithDereferencedInvocations class>>#generatedSlotNames'.
	^ #(dereferencedInvocations)
]

{ #category : #generator }
FamixTWithDereferencedInvocations classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithDereferencedInvocations >> dereferencedInvocations [

	<generated>
	<MSEComment: 'List of invocations performed on BehaviouralEntities referenced by this entity'>
	^ dereferencedInvocations
]

{ #category : #accessing }
FamixTWithDereferencedInvocations >> dereferencedInvocations: anObject [

	<generated>
	dereferencedInvocations value: anObject

]
