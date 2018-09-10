"
Represents an invocation which function is contained in a pointer.

The function itself is typically unknown (referenced by the pointer).

It has a referencer which is the pointer variable
"
Trait {
	#name : #FamixTDereferencedInvocation,
	#instVars : [
		'#referencer => FMOne type: #FamixTWithDereferencedInvocations opposite: #dereferencedInvocations'
	],
	#category : #'Famix-Traits-DereferencedInvocation'
}

{ #category : #meta }
FamixTDereferencedInvocation classSide >> annotation [

	<MSEClass: #TDereferencedInvocation super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTDereferencedInvocation classSide >> generatedSlotNames [
	<generated>
	'FamixTDereferencedInvocation class>>#generatedSlotNames'.
	^ #(referencer)
]

{ #category : #generator }
FamixTDereferencedInvocation classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTDereferencedInvocation >> referencer [

	<generated>
	<MSEComment: 'Structural entity that references the BehaviouralEntity invoked'>
	^ referencer
]

{ #category : #accessing }
FamixTDereferencedInvocation >> referencer: anObject [

	<generated>
	referencer := anObject

]
