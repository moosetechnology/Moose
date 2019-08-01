Class {
	#name : #FamixStMetricTest,
	#superclass : #TestCase,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #testing }
FamixStMetricTest >> assertNoErrorForAllMetricsOf: entity [
	(entity mooseDescription allAttributes select: [ :attr | attr type = FM3 number ])
		do: [ :each | 
			self shouldnt: (entity mmGetProperty: each) raise: Error ]
]

{ #category : #utility }
FamixStMetricTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #testing }
FamixStMetricTest >> testAllNamespaceMetrics [
self skip.
	self assertNoErrorForAllMetricsOf: (FamixStNamespace new name: 'namespace')
]

{ #category : #testing }
FamixStMetricTest >> testAllPackageMetrics [
	self assertNoErrorForAllMetricsOf: (FamixStPackage new name: 'package'; mooseModel: FamixStMooseModel new; yourself )
]

{ #category : #testing }
FamixStMetricTest >> testAverageHierarchyHeight [
	"
	self debug: #testAverageHierarchyHeight.
	"

	| classes |
	classes := self model allClasses.
	self assert: classes ahh asInteger equals: 1 "was 2 before stateful traits conversion"
]

{ #category : #testing }
FamixStMetricTest >> testSubclassHierarchyDepth [
	"
	self debug: #testSubclassHierarchyDepth
	"

	| classes modelClass protoObjectClass |
	classes := self model allClasses.
	modelClass := (classes select: [ :v | v name = #Model ]) first.
	self assert: modelClass subclassHierarchyDepth equals: 3.
	protoObjectClass := (classes select: [ :v | v name = #LANNode ]) first.
	self assert: protoObjectClass subclassHierarchyDepth equals: 2
]
