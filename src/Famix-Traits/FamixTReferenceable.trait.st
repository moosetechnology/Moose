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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTReferenceable >> addIncomingReference: aReference [ 
	incomingReferences add: aReference
]

{ #category : #accessing }
FamixTReferenceable >> incomingReferences [
	"Relation named: #incomingReferences type: #FamixTReference opposite: #target"

	<generated>
	<MSEComment: 'References to this entity by other entities.'>
	^ incomingReferences
]

{ #category : #accessing }
FamixTReferenceable >> incomingReferences: anObject [

	<generated>
	incomingReferences value: anObject

]
