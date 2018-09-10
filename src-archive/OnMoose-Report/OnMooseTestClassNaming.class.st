"
self openOn: MooseModel root allModels last
"
Class {
	#name : #OnMooseTestClassNaming,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseTestClassNaming >> computeResult [
	| testCaseClass phexampleClass |
	testCaseClass := self model allClasses entityNamed: TestCase mooseName.
	^ testCaseClass subclassHierarchyGroup reject: [ :each | self isException: each ]
]

{ #category : #private }
OnMooseTestClassNaming >> exceptionCases [
	^ #() "(self model allClasses entityNamed: #'Smalltalk::Phexample') withSubclassHierarchy"
]

{ #category : #accessing }
OnMooseTestClassNaming >> explanation [
	^'Test classes should be named "*Test"'
]

{ #category : #accessing }
OnMooseTestClassNaming >> isException: each [
	^ "each isStub" false or: [
		('*Test' match: each name) or: [ 
			('*Example' match: each name) or: [
				('*TestCase' match: each name) and: [ each directSubclasses notEmpty ] ] ] ]
]

{ #category : #accessing }
OnMooseTestClassNaming >> label [ 
	^'Test Class Naming'
]

{ #category : #accessing }
OnMooseTestClassNaming >> stakeholder [
	^ OnMoosePeople tudorGirba
]
