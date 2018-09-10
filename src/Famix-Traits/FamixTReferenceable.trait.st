Trait {
	#name : #FamixTReferenceable,
	#instVars : [
		'#incomingReferences => FMMany type: #FamixTReference opposite: #target'
	],
	#category : #'Famix-Traits-Reference'
}

{ #category : #meta }
FamixTReferenceable classSide >> annotation [

	<MSEClass: #TReferenceable super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTReferenceable classSide >> generatedSlotNames [
	<generated>
	'FamixTReferenceable class>>#generatedSlotNames'.
	^ #(incomingReferences)
]

{ #category : #generator }
FamixTReferenceable classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTReferenceable >> addIncomingReference: aReference [ 
	incomingReferences add: aReference
]

{ #category : #accessing }
FamixTReferenceable >> incomingReferences [

	<generated>
	<MSEComment: 'References to this entity by other entities.'>
	^ incomingReferences
]

{ #category : #accessing }
FamixTReferenceable >> incomingReferences: anObject [

	<generated>
	incomingReferences value: anObject

]
