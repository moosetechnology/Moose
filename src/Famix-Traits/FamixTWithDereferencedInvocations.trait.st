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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithDereferencedInvocations >> addDereferencedInvocation: aDeferencedInvocation [
	dereferencedInvocations add: aDeferencedInvocation 
]

{ #category : #accessing }
FamixTWithDereferencedInvocations >> dereferencedInvocations [
	"Relation named: #dereferencedInvocations type: #FamixTDereferencedInvocation opposite: #referencer"

	<generated>
	<MSEComment: 'List of invocations performed on BehaviouralEntities referenced by this entity'>
	^ dereferencedInvocations
]

{ #category : #accessing }
FamixTWithDereferencedInvocations >> dereferencedInvocations: anObject [

	<generated>
	dereferencedInvocations value: anObject

]
