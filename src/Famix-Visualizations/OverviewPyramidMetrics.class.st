Class {
	#name : #OverviewPyramidMetrics,
	#superclass : #Object,
	#instVars : [
		'nop',
		'noc',
		'nom',
		'loc',
		'cyclo',
		'fanout',
		'calls',
		'andc',
		'ahh'
	],
	#category : #'Famix-Visualizations-Overview-Pyramid'
}

{ #category : #'instance creation' }
OverviewPyramidMetrics class >> on: aMooseModel [

	^ super new model: aMooseModel
]

{ #category : #'accessing - metrics' }
OverviewPyramidMetrics >> ahh [
	"Average Hierarchy Height. tell us how deep the class hierarchies are"

	^ ahh
]

{ #category : #'accessing - metrics' }
OverviewPyramidMetrics >> andc [
	"Average number of derived classes. First sign of how extensively abstractions are refined by means of inheritance"
	^ andc
]

{ #category : #'accessing - metrics ratio' }
OverviewPyramidMetrics >> callNom [
	" Coupling intensity (CALLS/Operation). Tell us how many other operations are called on average from each operation"
	^ self nom isZero 
		ifTrue: [ ^ -1 ]
		ifFalse: [ 
			self truncatedFloatForFraction: (self calls/ self nom) ]
]

{ #category : #'accessing - metrics' }
OverviewPyramidMetrics >> calls [

	^ calls
]

{ #category : #'accessing - metrics' }
OverviewPyramidMetrics >> cyclo [

	^ cyclo
]

{ #category : #'accessing - metrics ratio' }
OverviewPyramidMetrics >> cycloLoc [

	"Intrinsic operation complexity (CYCLO/Code Line). Characterizes how much conditional complexity we are to expect in operations"
	^ self loc isZero 
		ifTrue: [ ^ -1 ]
		ifFalse: [ self truncatedFloatForFraction: (self cyclo/ self loc) ]
]

{ #category : #'accessing - metrics' }
OverviewPyramidMetrics >> fanout [

	^ fanout
]

{ #category : #'accessing - metrics ratio' }
OverviewPyramidMetrics >> fanoutCalls [
	"Coupling dispersion (FANOUT/Operation Call). Indicator of how much the coupling involves many classes "
	
	^ self calls isZero 
		ifTrue: [ ^ -1 ]
		ifFalse: [ 
			self truncatedFloatForFraction: (self fanout / self calls) ]
]

{ #category : #'accessing - metrics' }
OverviewPyramidMetrics >> loc [

	^ loc
]

{ #category : #'accessing - metrics ratio' }
OverviewPyramidMetrics >> locNom [

	"Operation Structuring (LOC/Operation). Indication of how well the code is distributed among operations"
	^ self nom isZero 
		ifTrue: [ ^ -1 ]
		ifFalse: [ 
			self truncatedFloatForFraction: (self loc/self nom) ]
]

{ #category : #initialization }
OverviewPyramidMetrics >> model: aMooseModel [
	| allModelMethods allModelClasses |
	MooseCustomTask
		runWithProgress: [ :bar | 
			allModelMethods := aMooseModel allMethods reject: [ :each | each isStub ].
			bar increment.
			allModelClasses := aMooseModel allModelClasses reject: #isAnonymousClass.
			bar increment.
			nop := aMooseModel allModelPackages size.
			bar increment.
			noc := allModelClasses size.
			bar increment.
			nom := allModelMethods size.
			bar increment.
			loc := allModelMethods sumNumbers: #numberOfLinesOfCode.
			bar increment.
			cyclo := allModelMethods sumNumbers: #cyclomaticComplexity.
			bar increment.
			fanout := allModelClasses sumNumbers: #fanOut.
			bar increment.
			calls := allModelMethods sumNumbers: [ :each | each invokedMethods size ].
			bar increment.
			andc := (allModelClasses sumNumbers: [ :class | class directSubclasses size ]) / noc.
			bar increment.
			ahh := allModelClasses average: #hierarchyNestingLevel.
			bar increment ]
		description: 'OverviewPyramid - computing metrics'
		length: 11
]

{ #category : #'accessing - metrics' }
OverviewPyramidMetrics >> noc [ 

	^ noc
]

{ #category : #'accessing - metrics ratio' }
OverviewPyramidMetrics >> nocNop [
	"High-level Structuring (NOC/Package). Indicates if packages tend to be coarse grained or fine grained"
	
	^ self nop isZero 
		ifTrue: [ -1 ]
		ifFalse: [ self truncatedFloatForFraction: (self noc / self nop) ]
]

{ #category : #'accessing - metrics' }
OverviewPyramidMetrics >> nom [ 

	^ nom
]

{ #category : #'accessing - metrics ratio' }
OverviewPyramidMetrics >> nomNoc [
	"Class structuring (NOM/Class). Reveals how operations are dirstributed among classes"
	
	^ self noc isZero 
		ifTrue: [ ^ -1 ]
		ifFalse: [ 
			self truncatedFloatForFraction: (self nom / self noc) ]
]

{ #category : #'accessing - metrics' }
OverviewPyramidMetrics >> nop [

	^ nop
]

{ #category : #private }
OverviewPyramidMetrics >> truncatedFloatForFraction: aFraction [
	^ (((aFraction * 100) truncated) / 100 ) asFloat 
]
