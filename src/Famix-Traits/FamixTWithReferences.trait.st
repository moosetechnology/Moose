Trait {
	#name : #FamixTWithReferences,
	#instVars : [
		'#outgoingReferences => FMMany type: #FamixTReference opposite: #referencer'
	],
	#category : #'Famix-Traits-Reference'
}

{ #category : #meta }
FamixTWithReferences classSide >> annotation [

	<FMClass: #TWithReferences super: #Object>
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
	"Relation named: #outgoingReferences type: #FamixTReference opposite: #referencer"

	<generated>
	<FMComment: 'References from this entity to other entities.'>
	<derived>
	^ outgoingReferences
]

{ #category : #accessing }
FamixTWithReferences >> outgoingReferences: anObject [

	<generated>
	outgoingReferences value: anObject
]
