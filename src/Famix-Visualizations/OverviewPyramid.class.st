"
I show an overview of a model complexity.

I am use in Moose Panel: Right-click on a model, 'Visualize', 'Overview Pyramid'.
See also an example on class side.

More documentation here: https://www.simpleorientedarchitecture.com/overview-pyramid-metrics-ndepend/
"
Class {
	#name : #OverviewPyramid,
	#superclass : #MooseAbstractVisualization,
	#instVars : [
		'metrics',
		'treesholdsToUse',
		'bricks'
	],
	#classVars : [
		'CPPTreesholds',
		'JavaTreesholds',
		'MoosePyramidResults',
		'SmalltalkTreesholds'
	],
	#category : #'Famix-Visualizations-Overview-Pyramid'
}

{ #category : #accessing }
OverviewPyramid class >> defaultTitle [
	^ 'Overview pyramid'
]

{ #category : #'instance creation' }
OverviewPyramid class >> example [
	<script>
	(self forMooseModel: MooseModel root allModels anyOne) open
]

{ #category : #'instance creation' }
OverviewPyramid class >> forMooseModel: aMooseModel [
	^ self new
		mooseModel: aMooseModel;
		yourself
]

{ #category : #accessing }
OverviewPyramid class >> icon [
	^ Smalltalk ui theme iconNamed: #smallLanguage
]

{ #category : #'class initialization' }
OverviewPyramid class >> initialize [
	"self initialize"
	self initializeJavaTreesholds.
	self initializeCPPTreesholds.  
	self initializeSmalltalkTreesholds .
		
	MoosePyramidResults := Dictionary new
		at: #CycloLoc put: 0.23;
		at: #LocNom put: 6.69;
		at: #NomNoc put: 5.83;
		at: #NocNop put: 6.09;
		at: #CallsNom put: 4.18;
		at: #FanoutCalls put: 0.72;
		at: #ANDC put: 0.99;
		at: #AHH put: nil;
		yourself.
]

{ #category : #'class initialization' }
OverviewPyramid class >> initializeCPPTreesholds [

	CPPTreesholds := Dictionary new
		at: #CycloLoc put: (OrderedCollection withAll: #(0.20 0.25 0.30));
		at: #LocNom put: (OrderedCollection withAll: #(5 10 16));
		at: #NomNoc put: (OrderedCollection withAll: #(4 9 15));
		at: #NocNop put: (OrderedCollection withAll: #(3 19 35));
		at: #CallsNom put: (OrderedCollection withAll: #(1.17 1.58 2));
		at: #FanoutCalls put: (OrderedCollection withAll: #(0.20 0.34 0.48));
		at: #ANDC put: (OrderedCollection withAll: #(0.19 0.28 0.37));
		at: #AHH put: (OrderedCollection withAll: #(0.05 0.13 0.21));
		yourself.
		

]

{ #category : #'class initialization' }
OverviewPyramid class >> initializeJavaTreesholds [

	JavaTreesholds := Dictionary new
		at: #CycloLoc put: (OrderedCollection withAll: #(0.16 0.20 0.24));
		at: #LocNom put: (OrderedCollection withAll: #(7 10 13));
		at: #NomNoc put: (OrderedCollection withAll: #(4 7 10));
		at: #NocNop put: (OrderedCollection withAll: #(6 17 26));
		at: #CallsNom put: (OrderedCollection withAll: #(2.01 2.62 3.2));
		at: #FanoutCalls put: (OrderedCollection withAll: #(0.56 0.62 0.68));
		at: #ANDC put: (OrderedCollection withAll: #(0.25 0.41 0.57));
		at: #AHH put: (OrderedCollection withAll: #(0.09 0.21 0.32));
		yourself.

]

{ #category : #'class initialization' }
OverviewPyramid class >> initializeSmalltalkTreesholds [

	SmalltalkTreesholds := Dictionary new
		at: #CycloLoc put: (OrderedCollection withAll: #(0.16 0.22 0.27));
		at: #LocNom put: (OrderedCollection withAll: #(4.92 6.91 8.90));
		at: #NomNoc put: (OrderedCollection withAll: #(8.18 11.24 14.30));
		at: #NocNop put: (OrderedCollection withAll: #(4.63 8.57 12.50));
		at: #CallsNom put: (OrderedCollection withAll: #(3.13 5.46 7.79));
		at: #FanoutCalls put: (OrderedCollection withAll: #(0.15 0.23 0.31));
		at: #ANDC put: (OrderedCollection withAll: #(0.37 0.60 0.83));
		at: #AHH put: (OrderedCollection withAll: #(1.42 2.22 3.03));
		yourself.

]

{ #category : #accessing }
OverviewPyramid class >> treesholdForModel: aMooseModel [

	"return the treeshold to use for aMooseModel (it can be Java, smalltalk, cpp treeshold according the source language of the model)"

	^ aMooseModel sourceLanguage isSmalltalk
		  ifTrue: [ SmalltalkTreesholds ]
		  ifFalse: [ JavaTreesholds ]
]

{ #category : #building }
OverviewPyramid >> build [
	self buildBricks.
	canvas addAll: bricks.
	RSGridLayout new
		gapSize: 0;
		on: canvas shapes
]

{ #category : #building }
OverviewPyramid >> buildAHH [
	bricks
		add:
			(PyramidBrickFactory inheritance
				text: 'AHH';
				popup: 'Average Hierarchy Height';
				brick).
	bricks
		add:
			(PyramidBrickFactory new
				color: (self colorForMetric: #AHH withValue: metrics ahh);
				textColor: Color white;
				text: (self truncatedStringForFraction: metrics ahh);
				popup:
					'Average Hierarchy Height.
Tell us how deep the class hierarchies are';
				brick)
]

{ #category : #building }
OverviewPyramid >> buildANDC [
	bricks
		add:
			(PyramidBrickFactory inheritance
				text: 'ANDC';
				popup: 'Average Number of Derived Classes';
				brick).
	bricks
		add:
			(PyramidBrickFactory new
				color: (self colorForMetric: #ANDC withValue: metrics andc);
				textColor: Color white;
				text: (self truncatedStringForFraction: metrics andc);
				popup:
					'Average number of derived classes.
First sign of how extensively abstractions
are refined by means of inheritance';
				brick)
]

{ #category : #building }
OverviewPyramid >> buildBricks [
	self buildEmptyBricks: 4.
	self buildANDC.
	self buildEmptyBricks: 7.
	self buildAHH.
	self buildEmptyBricks: 6.
	self buildNumberOfPackages.
	self buildEmptyBricks: 5.
	self buildNumberOfClasses.
	self buildEmptyBricks: 4.
	self buildNumberOfMethods.
	self buildNumberOfCalls.
	self buildEmptyBricks: 1.
	self buildNumberOfLOC.
	self buildNumberOfInvocations.
	self buildCyclomaticComplexity.
	self buildNumberOfCalledClasses
]

{ #category : #building }
OverviewPyramid >> buildCyclomaticComplexity [
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: 'CYCLO';
				popup: 'Cyclomatic Number';
				brick).
	self buildEmptySizeAndComplexityBricks: 4.
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: metrics cyclo;
				popup: 'Cyclomatic Number';
				brick)
]

{ #category : #building }
OverviewPyramid >> buildEmptyBricks: aNumber [
	aNumber
		timesRepeat: [ bricks add: PyramidBrickFactory empty brick ]
]

{ #category : #building }
OverviewPyramid >> buildEmptySizeAndComplexityBricks: aNumber [
	aNumber
		timesRepeat: [ bricks add: PyramidBrickFactory sizeAndComplexity brick ]
]

{ #category : #building }
OverviewPyramid >> buildLegend [
	| legend |
	legend := RSLegend new.
	legend container: self canvas.
	legend onDemand.
	legend title: self class defaultTitle.
	legend build
]

{ #category : #building }
OverviewPyramid >> buildNumberOfCalledClasses [
	bricks
		add:
			(PyramidBrickFactory coupling
				text: metrics fanout;
				popup: 'Number Of Called Classes';
				brick).
	bricks add: PyramidBrickFactory coupling brick.
	bricks
		add:
			(PyramidBrickFactory coupling
				text: 'FANOUT';
				popup: 'Number Of Called Classes';
				brick)
]

{ #category : #building }
OverviewPyramid >> buildNumberOfCalls [
	bricks
		add:
			(PyramidBrickFactory coupling
				text: 'NOM';
				popup: 'Number Of Methods';
				brick).
	bricks
		add:
			(PyramidBrickFactory new
				color: (self colorForMetric: #CallsNom withValue: metrics callNom);
				textColor: Color white;
				text: metrics callNom;
				popup:
					'Coupling intensity (CALLS/Operation).
Tell us how many other operations are called on average from each operation';
				brick)
]

{ #category : #building }
OverviewPyramid >> buildNumberOfClasses [
	bricks
		add:
			(PyramidBrickFactory new
				color: (self colorForMetric: #NomNoc withValue: metrics nomNoc);
				textColor: Color white;
				text: metrics nomNoc;
				popup:
					'Class structuring (NOM/Class).
Reveals how operations are distributed among classes';
				brick).
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: 'NOC';
				popup: 'Number Of Classes';
				brick).
	self buildEmptySizeAndComplexityBricks: 1.
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: metrics noc;
				popup: 'Number Of Classes';
				brick)
]

{ #category : #building }
OverviewPyramid >> buildNumberOfInvocations [
	bricks
		add:
			(PyramidBrickFactory coupling
				text: metrics calls;
				popup: 'Number Of Invocations';
				brick).
	bricks
		add:
			(PyramidBrickFactory coupling
				text: 'CALL';
				popup: 'Number Of Invocations';
				brick).
	bricks
		add:
			(PyramidBrickFactory new
				color: (self colorForMetric: #FanoutCalls withValue: metrics fanoutCalls);
				textColor: Color white;
				text: metrics fanoutCalls;
				popup:
					'Coupling dispersion (FANOUT/Operation Call).
Indicator of how much the coupling involves many classes';
				brick)
]

{ #category : #building }
OverviewPyramid >> buildNumberOfLOC [
	bricks
		add:
			(PyramidBrickFactory new
				color: (self colorForMetric: #CycloLoc withValue: metrics cycloLoc);
				textColor: Color white;
				text: metrics cycloLoc;
				popup:
					'Intrinsic operation complexity (CYCLO/Code Line).
Characterizes how much conditional complexity we are to expect in operations';
				brick).
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: 'LOC';
				popup: 'Lines Of Code';
				brick).
	self buildEmptySizeAndComplexityBricks: 3.
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: metrics loc;
				popup: 'Lines Of Code';
				brick)
]

{ #category : #building }
OverviewPyramid >> buildNumberOfMethods [
	bricks
		add:
			(PyramidBrickFactory new
				color: (self colorForMetric: #LocNom withValue: metrics locNom);
				textColor: Color white;
				text: metrics locNom;
				popup:
					'Operation Structuring (LOC/Operation).
Indication of how well the code is distributed among operations';
				brick).
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: 'NOM';
				popup: 'Number Of Methods';
				brick).
	self buildEmptySizeAndComplexityBricks: 2.
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: metrics nom;
				popup: 'Number Of Methods';
				brick)
]

{ #category : #building }
OverviewPyramid >> buildNumberOfPackages [
	bricks
		add:
			(PyramidBrickFactory new
				color: (self colorForMetric: #NocNop withValue: metrics nocNop);
				textColor: Color white;
				text: metrics nocNop;
				popup:
					'High-level Structuring (NOC/Package).
Indicates if packages tend to be coarse grained or fine grained';
				brick).
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: 'NOP';
				popup: 'Number Of Packages';
				brick).
	bricks
		add:
			(PyramidBrickFactory sizeAndComplexity
				text: metrics nop;
				popup: 'Number Of Packages';
				brick)
]

{ #category : #private }
OverviewPyramid >> colorForMetric: aSymbol withValue: aNumber [

	| treesholds lowDifference averageDifference hightDifference |

	treesholds := self treesholdsToUse at: aSymbol.

	lowDifference := (treesholds first - aNumber) abs.
	averageDifference := (treesholds second - aNumber) abs.
	hightDifference := (treesholds third - aNumber) abs.

	{lowDifference.
	averageDifference.
	hightDifference} min = lowDifference
		ifTrue: [ ^ Color blue darker ].

	{lowDifference.
	averageDifference.
	hightDifference} min = averageDifference
		ifTrue: [ ^ Color green muchDarker ].

	{lowDifference.
	averageDifference.
	hightDifference} min = hightDifference
		ifTrue: [ ^ Color red darker ]
]

{ #category : #initialization }
OverviewPyramid >> initialize [
	super initialize.
	bricks := RSGroup new
]

{ #category : #initialization }
OverviewPyramid >> mooseModel: aMooseModel [
	metrics := aMooseModel overviewPyramidMetrics.
	self treesholdsToUse: (self class treesholdForModel: aMooseModel)
]

{ #category : #opening }
OverviewPyramid >> open [
	^ super open extent: 620 @ 250
]

{ #category : #treeshold }
OverviewPyramid >> treesholdsToUse [

	^ treesholdsToUse
]

{ #category : #treeshold }
OverviewPyramid >> treesholdsToUse: aDictionary [

	treesholdsToUse := aDictionary
]

{ #category : #private }
OverviewPyramid >> truncatedStringForFraction: aFraction [
	^ (metrics truncatedFloatForFraction: aFraction) asString
]

{ #category : #treeshold }
OverviewPyramid >> useCPPTreesholds [

	self treesholdsToUse: CPPTreesholds
]

{ #category : #treeshold }
OverviewPyramid >> useJavaTreesholds [

	self treesholdsToUse: JavaTreesholds
]
