"
1. assignment type subtype of interface type: In this scenario, an interface type is reconstructed, an abstract type for which several concrete (sub)types are plausible at runtime. The assign- ment type is found to be one of these types: it is a subtype of the interface type. In the left column of Figure 3 we see that the interface type will be Number, while the assignment type is SmallInteger, a subclass of Number. Note that this scenario is the most frequently occurring.
	
	2. interface type subtype of assignment type: It can occur that the assignment type does not lie within the hierarchy defined by the interface type, but is a supertype of that hierarchy. In that case the concrete assignment type is more general than the abstract interface type. This is illustrated in the middle pane of Figure 3: the extracted type (which would be Date, since it implements a method weekday) is subtype of the assignment type (Magnitude).

	3. assignment and interface type unrelated: Another possibil- ity is related to the previous one, but here the assignment type and the interface type are completely unrelated. This is a tech- nique sometimes used in dynamic languages. For example, one can hold a collection of objects and, when there is only one object in the collection, decide to directly hold that object in- stead of a collection with only one element. When doing type reconstruction this can easily lead to two different types being extracted: one a collection type, and a second, completely dif- ferent type. The right side of Figure 3 shows how an assignment type could be SmallInteger, while the interface type would be Collection, two completely separated types.
	4. assignment type same as the interface type: Both can be the same, in which case there is no need to merge.

When merging the sets of interface and assignment types, these cases need to be taken into account. 

Number of different merging approaches:
• 
	with the AbstractMerger the result of the first case in the exam- ple will be the interface type, since it is the most abstract.
•
	the ConcreteMerger will favor the assignment type for the first case in the example. The motivation for this choice is that it is very likely that the concrete type will indeed be the one as- signed, given that it corresponds to the active type. However, this is a heuristic, and some valid types might be omitted be- cause of it.

	• the AssignmentsFirstMerger is a refinement of the ConcreteMerger and therefore also favors the assignment types over the interface types. However when there are assignment types and all interface types are subtypes of the assignment types, the result will be the assignment types (and the found interface types are not used). It only considers the interface types when there is no assignment information, or when there are interface type that are not related to the assignment types.

"
Class {
	#name : #TypeMerger,
	#superclass : #Object,
	#category : #'RoelTyper-Core'
}

{ #category : #'instance creation' }
TypeMerger class >> interfaceTypes: interfaceTypeCollection assignmentTypes: assignmentTypesCollection [
	^self new
		mergeInterfaceTypes: interfaceTypeCollection
		assignmentTypes: assignmentTypesCollection
]

{ #category : #private }
TypeMerger >> cleanBooleansIn: collection [
	"Remove all occurences of True, False and Boolean in the given collection. If any element was removed, add Boolean"

	"Note: removeAllSuchThat: in VisualWorks returns the elements removed, while in Squeak it returns the new set. Therefore I adopted a check on the sizes to see if any Boolean class was removed or not, instead of checking the result of removeAllSuchThat: "

	| oldSize |
	oldSize := collection size.
	collection
		removeAllSuchThat:
			[ :type | type == True | (type == False) | (type == Boolean)].
	^oldSize == collection size
		ifFalse:
			[collection
				add: Boolean;
				yourself]
		ifTrue: [collection]
]

{ #category : #public }
TypeMerger >> mergeInterfaceTypes: interfaceTypeCollection assignmentTypes: assignmentTypesCollection [
	"interfaceTypes is a set of trees of types reconstructed by looking at the interfaces.
	assignmentTypes is a set of trees of types reconstructed by looking at the assignments.
	The receiver takes these sets as input and needs to return one set of trees of types that combines both."

	^self subclassResponsibility
]
