Class {
	#name : #OnMooseMetaPropertiesWithoutComments,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseMetaPropertiesWithoutComments >> computeResult [
	| propertyMethods simplePropertyMethods propertyMethodsWithOpposite uncommented |
	simplePropertyMethods := (self model allAnnotationTypes entityNamed: 'MSEProperty:type:') annotatedEntities. 
	propertyMethodsWithOpposite :=  (self model allAnnotationTypes entityNamed: 'MSEProperty:type:opposite:') annotatedEntities.
	propertyMethods := simplePropertyMethods, propertyMethodsWithOpposite.
	uncommented := propertyMethods select: [:each |
		(each parentType withSuperclassHierarchy anySatisfy: [:x | x name = 'MooseEntity']) and: [
			(each isAnnotatedWith: 'MSEComment:') not] ].
	^ uncommented asMooseGroup sorted: [:a :b | a name < b name ]
]

{ #category : #accessing }
OnMooseMetaPropertiesWithoutComments >> explanation [
	^ 'All meta decribed properties should have a comment defined via a <MSEComment:> pragma'
]

{ #category : #accessing }
OnMooseMetaPropertiesWithoutComments >> label [
	^ 'Uncommented meta properties'
]

{ #category : #accessing }
OnMooseMetaPropertiesWithoutComments >> stakeholder [
	^ OnMoosePeople tudorGirba
]
