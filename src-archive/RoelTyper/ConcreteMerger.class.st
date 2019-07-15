Class {
	#name : #ConcreteMerger,
	#superclass : #TypeMerger,
	#category : #'RoelTyper-Core'
}

{ #category : #public }
ConcreteMerger >> mergeInterfaceTypes: interfaceTypeCollection assignmentTypes: assignmentTypesCollection [
	"interfaceTypes is a set of trees of types reconstructed by looking at the interfaces.
	assignmentTypes is a set of trees of types reconstructed by looking at the assignments.
	The receiver takes these sets as input and needs to return one set of trees of types that combines both."

	"This class does this by preferring concrete types over abstract types."

	| toKeep chain |
	toKeep := interfaceTypeCollection copy.
	assignmentTypesCollection
		do:
			[:assignmentType | 
			chain := assignmentType withAllSuperclasses.
			(interfaceTypeCollection select: [:type | chain includes: type])
				do:
					[:each | 
					toKeep
						remove: each
						ifAbsent: []]].
	toKeep addAll: assignmentTypesCollection.
	^toKeep isEmpty
		ifTrue: [OrderedCollection with: Object]
		ifFalse: [toKeep asOrderedCollection]
]
