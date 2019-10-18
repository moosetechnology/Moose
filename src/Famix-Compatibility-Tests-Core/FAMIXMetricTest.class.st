Class {
	#name : #FAMIXMetricTest,
	#superclass : #TestCase,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #testing }
FAMIXMetricTest >> assertNoErrorForAllMetricsOf: entity [
	(entity mooseDescription allProperties select: [ :attr | attr type = FM3Number instance ])
		do: [ :each | self shouldnt: (entity mmGetProperty: each) raise: Error ]
]

{ #category : #utility }
FAMIXMetricTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #testing }
FAMIXMetricTest >> testAllNamespaceMetrics [
self skip.
	self assertNoErrorForAllMetricsOf: (FAMIXNamespace new name: 'namespace')
]

{ #category : #testing }
FAMIXMetricTest >> testAllPackageMetrics [
	self
		assertNoErrorForAllMetricsOf:
			(FAMIXPackage new
				name: 'package';
				mooseModel: FAMIXModel new)
]

{ #category : #testing }
FAMIXMetricTest >> testAverageHierarchyHeight [
	"
	self debug: #testAverageHierarchyHeight.
	"

	| classes |
	classes := self model allClasses.
	self assert: classes ahh asInteger equals: 1 "was 2 before stateful traits conversion"
]

{ #category : #testing }
FAMIXMetricTest >> testSubclassHierarchyDepth [
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
