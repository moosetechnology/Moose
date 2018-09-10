Class {
	#name : #OnMooseTestClassInTestPackage,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseTestClassInTestPackage >> computeResult [ 
	| testCaseClass phexampleClass |
	testCaseClass := self model allClasses entityNamed: TestCase mooseName.
	^ testCaseClass subclassHierarchyGroup reject: [:each | 
		(self isException: each) or: [
			'*-Tests*' match: each parentPackage name ] ]
]

{ #category : #accessing }
OnMooseTestClassInTestPackage >> explanation [
	^'Test classes should be placed in a package named "*-Tests-*"'
]

{ #category : #private }
OnMooseTestClassInTestPackage >> isException: aClass [
	"we reject the Phexample classes"
	^ aClass superclassHierarchy anySatisfy: [:each | each name = 'Phexample']
]

{ #category : #accessing }
OnMooseTestClassInTestPackage >> label [ 
	^'Test classes not in test package'
]

{ #category : #accessing }
OnMooseTestClassInTestPackage >> stakeholder [
	^ OnMoosePeople tudorGirba
]
