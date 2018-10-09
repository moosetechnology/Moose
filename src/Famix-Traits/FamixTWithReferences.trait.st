Trait {
	#name : #FamixTWithReferences,
	#instVars : [
		'#outgoingReferences => FMMany type: #FamixTReference opposite: #source'
	],
	#category : #'Famix-Traits-Reference'
}

{ #category : #meta }
FamixTWithReferences classSide >> annotation [

	<MSEClass: #TWithReferences super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithReferences classSide >> generatedSlotNames [
	<generated>
	'FamixTWithReferences class>>#generatedSlotNames'.
	^ #(outgoingReferences)
]

{ #category : #generator }
FamixTWithReferences classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithReferences >> addOutgoingReference: aReference [ 
	outgoingReferences add: aReference
]

{ #category : #accessing }
FamixTWithReferences >> outgoingReferences [

	<generated>
	<MSEComment: 'References from this entity to other entities.'>
	^ outgoingReferences
]

{ #category : #accessing }
FamixTWithReferences >> outgoingReferences: anObject [

	<generated>
	outgoingReferences value: anObject

]
