Trait {
	#name : #FamixTWithReferences,
	#instVars : [
		'#outgoingReferences => FMMany type: #FamixTReference opposite: #source'
	],
	#category : #'Famix-Traits-Reference'
}

{ #category : #meta }
FamixTWithReferences classSide >> annotation [

	<MSEClass: #TWithReferences super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithReferences >> addOutgoingReference: aReference [ 
	outgoingReferences add: aReference
]

{ #category : #adding }
FamixTWithReferences >> addOutgoingReferences: anObject [
	<generated>
	^ self outgoingReferences add: anObject
]

{ #category : #accessing }
FamixTWithReferences >> outgoingReferences [
	"Relation named: #outgoingReferences type: #FamixTReference opposite: #source"

	<generated>
	<MSEComment: 'References from this entity to other entities.'>
	<derived>
	^ outgoingReferences
]

{ #category : #accessing }
FamixTWithReferences >> outgoingReferences: anObject [

	<generated>
	outgoingReferences value: anObject

]
