Class {
	#name : #OnMooseMetaModelClassesWithoutComments,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseMetaModelClassesWithoutComments >> computeResult [
	| uncommentedClasses |
	uncommentedClasses := self interestingClasses select: [:each | each comments isEmpty ]. 
	^ uncommentedClasses sorted: [:a :b | a name < b name ]
]

{ #category : #accessing }
OnMooseMetaModelClassesWithoutComments >> explanation [
	^ 'All subclasses of MooseEntity should have an explicit comment'
]

{ #category : #private }
OnMooseMetaModelClassesWithoutComments >> interestingClasses [
	^ (self model allModelClasses entityNamed: #'Smalltalk::MooseEntity') withSubclassHierarchyGroup	
"	select: [:each | 
		each isSUnitTestCase not and: [
			#(Moose MO GLM FAMIX) anySatisfy: [:prefix | 
				each name beginsWith: prefix ]]]"
]

{ #category : #accessing }
OnMooseMetaModelClassesWithoutComments >> label [
	^ 'Uncommented meta-model classes'
]

{ #category : #accessing }
OnMooseMetaModelClassesWithoutComments >> stakeholder [
	^ OnMoosePeople tudorGirba
]
