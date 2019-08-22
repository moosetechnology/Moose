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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithReferences >> addOutgoingReference: aReference [ 
	outgoingReferences add: aReference
]

{ #category : #accessing }
FamixTWithReferences >> outgoingReferences [
	"Relation named: #outgoingReferences type: #FamixTReference opposite: #source"

	<generated>
	<MSEComment: 'References from this entity to other entities.'>
	^ outgoingReferences
]

{ #category : #accessing }
FamixTWithReferences >> outgoingReferences: anObject [

	<generated>
	outgoingReferences value: anObject

]
