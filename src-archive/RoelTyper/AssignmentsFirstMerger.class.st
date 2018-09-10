Class {
	#name : #AssignmentsFirstMerger,
	#superclass : #TypeMerger,
	#category : #'RoelTyper-Core'
}

{ #category : #public }
AssignmentsFirstMerger >> mergeInterfaceTypes: interfaceTypeCollection assignmentTypes: assignmentTypesCollection [
	"interfaceTypes is a set of trees of types reconstructed by looking at the interfaces.
	assignmentTypes is a set of trees of types reconstructed by looking at the assignments.
	The receiver takes these sets as input and needs to return one set of trees of types that combines both."

	"This merger favors the assignment types over the interface types. It only considers the interface types when there is no assignment information, or when there is only one interface type that is not related to the assignment types."

	| interfaceType assignments |
	(assignmentTypesCollection size = 1 and: [assignmentTypesCollection first = UndefinedObject]) ifTrue: [assignmentTypesCollection removeFirst].
	assignmentTypesCollection isEmpty
		ifTrue:
			[interfaceTypeCollection isEmpty
				ifTrue: [^OrderedCollection with: Object]
				ifFalse:
					[^self cleanBooleansIn: interfaceTypeCollection asOrderedCollection]].
	assignments := assignmentTypesCollection asOrderedCollection.
	interfaceTypeCollection size == 1
		ifFalse: [^self cleanBooleansIn: assignments].
	interfaceType := interfaceTypeCollection asOrderedCollection first.
	^((assignments anySatisfy: [:cl | cl includesBehavior: interfaceType])
		or:
			[assignments
				anySatisfy:
					[:assignmentType | interfaceType includesBehavior: assignmentType]])
		ifTrue: [self cleanBooleansIn: assignments]
		ifFalse:
			[self
				cleanBooleansIn:
					(assignments
						add: interfaceType;
						yourself)]
]
