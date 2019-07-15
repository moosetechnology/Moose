Class {
	#name : #DeepTraverserVsHardcodedTraversalsTest,
	#superclass : #TestCase,
	#category : #'DeepTraverser-Tests-Transformed-To-Examples'
}

{ #category : #testing }
DeepTraverserVsHardcodedTraversalsTest >> testSubclassesOfMultipleClasses [
	self 
		assert: ({ Collection . Exception } deepCollect: #subclasses as: Set) size
		equals: (Collection allSubclasses , Exception allSubclasses) asSet size
]

{ #category : #testing }
DeepTraverserVsHardcodedTraversalsTest >> testSubclassesOfOneClass [
	self 
		assert: (Collection deepCollect: #subclasses as: Set) size
		equals: Collection allSubclasses size
]

{ #category : #testing }
DeepTraverserVsHardcodedTraversalsTest >> testSubclassesOfOneClassInAnArray [
	self 
		assert: ({ Collection } deepCollect: #subclasses as: Set) size
		equals: Collection allSubclasses size
]

{ #category : #testing }
DeepTraverserVsHardcodedTraversalsTest >> testWithSubclassesOfMultipleClasses [
	self 
		assert: ({ Collection . Exception } withDeepCollect: #subclasses as: Set) size
		equals: (Collection withAllSubclasses , Exception withAllSubclasses) asSet size
]

{ #category : #testing }
DeepTraverserVsHardcodedTraversalsTest >> testWithSubclassesOfOneClass [
	self 
		assert: (Collection withDeepCollect: #subclasses as: Set) size
		equals: Collection withAllSubclasses size
]

{ #category : #testing }
DeepTraverserVsHardcodedTraversalsTest >> testWithSubclassesOfOneClassInAnArray [
	self 
		assert: ({ Collection } withDeepCollect: #subclasses as: Set) size
		equals: Collection withAllSubclasses size
]
