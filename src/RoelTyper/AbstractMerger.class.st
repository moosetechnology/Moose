Class {
	#name : #AbstractMerger,
	#superclass : #TypeMerger,
	#category : #'RoelTyper-Core'
}

{ #category : #public }
AbstractMerger >> mergeInterfaceTypes: interfaceTypeCollection assignmentTypes: assignmentTypesCollection [
	"interfaceTypes is a set of trees of types reconstructed by looking at the interfaces.
	assignmentTypes is a set of trees of types reconstructed by looking at the assignments.
	The receiver takes these sets as input and needs to return one set of trees of types that combines both."

	"This class does this by preferring abstract types over concrete types."

	| assignmentsToKeep chain |
	(interfaceTypeCollection isEmpty and: [assignmentTypesCollection notEmpty])
		ifTrue: [^assignmentTypesCollection].
	assignmentsToKeep := assignmentTypesCollection
		select:
			[:assignmentType | 
			chain := assignmentType withAllSuperclasses.
			(interfaceTypeCollection
				anySatisfy: [:superType | chain includes: superType]) not].
	assignmentsToKeep addAll: interfaceTypeCollection.
	^assignmentsToKeep isEmpty
		ifTrue: [OrderedCollection with: Object]
		ifFalse: [assignmentsToKeep]
]
