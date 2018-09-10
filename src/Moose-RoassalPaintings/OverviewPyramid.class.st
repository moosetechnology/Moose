Class {
	#name : #OverviewPyramid,
	#superclass : #Object,
	#instVars : [
		'mooseModel',
		'metrics',
		'moView',
		'treesholdsToUse',
		'rectangles'
	],
	#classVars : [
		'CPPTreesholds',
		'JavaTreesholds',
		'MoosePyramidResults',
		'SmalltalkTreesholds'
	],
	#category : #'Moose-RoassalPaintings-OverviewPyramid'
}

{ #category : #accessing }
OverviewPyramid class >> callNomSymbol [

	^ #CallsNom
]

{ #category : #accessing }
OverviewPyramid class >> colorForMetricValue: aNumber fromTreesholds: aCollection [

	| treesholds lowDifference averageDifference hightDifference |
	treesholds := aCollection.
	
	lowDifference := (treesholds first - aNumber) abs.
	averageDifference := (treesholds second - aNumber) abs.
	hightDifference := (treesholds third - aNumber) abs.
	
	{lowDifference. averageDifference. hightDifference} min = lowDifference ifTrue: [^ Color blue].
	{lowDifference. averageDifference. hightDifference} min = averageDifference ifTrue: [^ Color green].
	{lowDifference. averageDifference. hightDifference} min = hightDifference ifTrue: [^ Color red].
	
]

{ #category : #accessing }
OverviewPyramid class >> cycloLocSymbol [

	^ #CycloLoc
]

{ #category : #accessing }
OverviewPyramid class >> fanoutCallsSymbol [

	^ #FanoutCalls
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
OverviewPyramid class >> locNomSymbol [

	^ #LocNom
]

{ #category : #accessing }
OverviewPyramid class >> nocNopSymbol [

	^ #NocNop
]

{ #category : #accessing }
OverviewPyramid class >> nomNocSymbol [

	^ #NomNoc
]

{ #category : #'instance creation' }
OverviewPyramid class >> on: aMooseModel [
	"(self on: MooseModel root allModels anyOne) open"
	^ super new initializeWith: aMooseModel.
]

{ #category : #accessing }
OverviewPyramid class >> treesholdForModel: aMooseModel [
	"return the treeshold to use for aMooseModel (it can be Java, smalltalk, cpp treeshold according the source language of the model)"

	^ aMooseModel isSmalltalk
		ifTrue: [ SmalltalkTreesholds ]
		ifFalse: [ JavaTreesholds ]
]

{ #category : #rendering }
OverviewPyramid >> aNode: aNodeSymbol color: aColor popup: aString on: aView [
	aView shape rectangle withoutBorder width: 70; height: 30; fillColor: aColor.
		aView node: aNodeSymbol forIt: [
			aView interaction popupText: [:n | aString]. 
			aView shape label fillColor: aColor; fontColor: Color black.
			aView node: aNodeSymbol ].

]

{ #category : #'accessing - metrics' }
OverviewPyramid >> ahh [

	^ metrics ahh
]

{ #category : #'accessing - metrics' }
OverviewPyramid >> andc [

	^ metrics andc
]

{ #category : #'accessing - metrics' }
OverviewPyramid >> calls [

	^ metrics calls
]

{ #category : #rendering }
OverviewPyramid >> colorForMetric: aSymbol withValue: aNumber [

	| treesholds lowDifference averageDifference hightDifference |
	treesholds := self treesholdsToUse at: aSymbol.
	
	lowDifference := (treesholds first - aNumber) abs.
	averageDifference := (treesholds second - aNumber) abs.
	hightDifference := (treesholds third - aNumber) abs.
	
	{lowDifference. averageDifference. hightDifference} min = lowDifference ifTrue: [^ Color blue darker].
	{lowDifference. averageDifference. hightDifference} min = averageDifference ifTrue: [^ Color green muchDarker].
	{lowDifference. averageDifference. hightDifference} min = hightDifference ifTrue: [^ Color red darker].
	
]

{ #category : #'accessing - metrics' }
OverviewPyramid >> cyclo [

	^ metrics cyclo
]

{ #category : #initialize }
OverviewPyramid >> emptyRectangles: aNumber [
	aNumber timesRepeat: [rectangles add: PyramidRectangle white].

]

{ #category : #'accessing - metrics' }
OverviewPyramid >> fanout [

	^ metrics fanout
]

{ #category : #initialize }
OverviewPyramid >> initializeRectangles [
	rectangles := OrderedCollection new.
	self emptyRectangles: 4.
	rectangles add: (PyramidRectangle new 
		color: Color paleGreen; 
		text: 'ANDC';
		popup: 'Average Number of Derived Classes';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: [self colorForMetric: #ANDC withValue: self andc]; 
		textColor: Color white;
		calculation: [self truncatedStringForFraction: self andc];
		popup: 'Average number of derived classes.
First sign of how extensively abstractions
are refined by means of inheritance';
		yourself ).
	self emptyRectangles: 7.
	rectangles add: (PyramidRectangle new 
		color: Color paleGreen; 
		text: 'AHH';
		popup: 'Average Hierarchy Height';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: [self colorForMetric: #AHH withValue: self ahh]; 
		textColor: Color white;
		calculation: [self truncatedStringForFraction: self ahh];
		popup: 'Average Hierarchy Height.
Tell us how deep the class hierarchies are';
		yourself ).
	self emptyRectangles: 6.
	rectangles add: (PyramidRectangle new 
		color: [self colorForMetric: #NocNop withValue: metrics nocNop]; 
		textColor: Color white;
		calculation: [metrics nocNop];
		popup: 'High-level Structuring (NOC/Package).
Indicates if packages tend to be coarse grained or fine grained';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow; 
		text: 'NOP';
		popup: 'Number Of Packages';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow;  
		calculation: [self nop];
		popup: 'Number Of Packages';
		yourself ).
	self emptyRectangles: 5.
	rectangles add: (PyramidRectangle new 
		color: [self colorForMetric: #NomNoc withValue: metrics nomNoc]; 
		textColor: Color white;
		calculation: [metrics nomNoc];
		popup: 'Class structuring (NOM/Class).
Reveals how operations are distributed among classes';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow; 
		text: 'NOC';
		popup: 'Number Of Classes';
		yourself ).
	self yellowRectangles: 1.
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow;  
		calculation: [self noc];
		popup: 'Number Of Classes';
		yourself ).
	self emptyRectangles: 4.
	rectangles add: (PyramidRectangle new 
		color: [self colorForMetric: #LocNom withValue: metrics locNom]; 
		textColor: Color white;
		calculation: [metrics locNom];
		popup: 'Operation Structuring (LOC/Operation).
Indication of how well the code is distributed among operations';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow; 
		text: 'NOM';
		popup: 'Number Of Methods';
		yourself ).
	self yellowRectangles: 2.
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow;  
		calculation: [self nom];
		popup: 'Number Of Methods';
		yourself ).	
	rectangles add: (PyramidRectangle new 
		color: Color lightMagenta; 
		text: 'NOM';
		popup: 'Number Of Methods';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: [self colorForMetric: #CallsNom withValue: metrics callNom]; 
		textColor: Color white;
		calculation: [metrics callNom];
		popup: 'Coupling intensity (CALLS/Operation).
Tell us how many other operations are called on average from each operation';
		yourself ).
	self emptyRectangles: 1.
	rectangles add: (PyramidRectangle new 
		color: [self colorForMetric: #CycloLoc withValue: metrics cycloLoc]; 
		textColor: Color white;
		calculation: [metrics cycloLoc];
		popup: 'Intrinsic operation complexity (CYCLO/Code Line).
Characterizes how much conditional complexity we are to expect in operations';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow; 
		text: 'LOC';
		popup: 'Lines Of Code';
		yourself ).
	self yellowRectangles: 3.
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow;  
		calculation: [self loc];
		popup: 'Lines Of Code';
		yourself ).	
	rectangles add: (PyramidRectangle new 
		color: Color lightMagenta;  
		calculation: [self calls];
		popup: 'Number Of Invocations';
		yourself ).	
	rectangles add: (PyramidRectangle new 
		color: Color lightMagenta; 
		text: 'CALL';
		popup: 'Number Of Invocations';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: [self colorForMetric: #FanoutCalls withValue: metrics fanoutCalls]; 
		textColor: Color white;
		calculation: [metrics fanoutCalls];
		popup: 'Coupling dispersion (FANOUT/Operation Call).
Indicator of how much the coupling involves many classes';
		yourself ).
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow; 
		text: 'CYCLO';
		popup: 'Cyclomatic Number';
		yourself ).
	self yellowRectangles: 4.
	rectangles add: (PyramidRectangle new 
		color: Color paleYellow;  
		calculation: [self cyclo];
		popup: 'Cyclomatic Number';
		yourself ).	
	rectangles add: (PyramidRectangle new 
		color: Color lightMagenta;  
		calculation: [self fanout];
		popup: 'Number Of Called Classes';
		yourself ).	
	rectangles add: (PyramidRectangle new color: Color lightMagenta;yourself).
	rectangles add: (PyramidRectangle new 
		color: Color lightMagenta; 
		text: 'FANOUT';
		popup: 'Number Of Called Classes';
		yourself ).

]

{ #category : #initialize }
OverviewPyramid >> initializeWith: aMooseModel [

	mooseModel := aMooseModel.
	moView := RTMondrian new.
	metrics := aMooseModel overviewPyramidMetrics.
	self treesholdsToUse: (self class treesholdForModel: aMooseModel).
	self initializeRectangles.
]

{ #category : #'accessing - metrics' }
OverviewPyramid >> loc [

	^ metrics loc
]

{ #category : #'accessing - metrics' }
OverviewPyramid >> noc [ 

	^ metrics noc
]

{ #category : #'accessing - metrics' }
OverviewPyramid >> nom [

	^ metrics nom
]

{ #category : #'accessing - metrics' }
OverviewPyramid >> nop [

	^ metrics nop
]

{ #category : #opening }
OverviewPyramid >> open [

	self render.
	^ moView open
		setLabel: 'Overview pyramid';
		extent: (620@250);
		yourself.
]

{ #category : #rendering }
OverviewPyramid >> render [
	
	^ self renderOn: moView 
]

{ #category : #rendering }
OverviewPyramid >> renderOn: mondrian [
	| s |
	s := RTCompositeShape new.
	s add: (RTBox new 
		height: 20; 
		width: 60;
		color: [:e | e backgroundColor]).
	s add: (RTLabel new 
		text: [:e | e label];
		color: [:e | e textColor]).
		
	mondrian shape shapeInitializer: [ :aShape | ]; shape: s.
	mondrian nodes: rectangles.
	mondrian layout grid gapSize: 0; lineItemsCount: [ 9 ].
	
	
]

{ #category : #'accessing - treeshold' }
OverviewPyramid >> treesholdsToUse [

	^ treesholdsToUse.
]

{ #category : #'accessing - treeshold' }
OverviewPyramid >> treesholdsToUse: aDictionary [

	treesholdsToUse := aDictionary. 
]

{ #category : #private }
OverviewPyramid >> truncatedFloatForFraction: aFraction [
	^ (((aFraction * 100) truncated) / 100 ) asFloat 
]

{ #category : #private }
OverviewPyramid >> truncatedStringForFraction: aFraction [
	^ (self truncatedFloatForFraction: aFraction) asString
]

{ #category : #'accessing - treeshold' }
OverviewPyramid >> useCPPTreesholds [

	self treesholdsToUse: CPPTreesholds. 
]

{ #category : #'accessing - treeshold' }
OverviewPyramid >> useJavaTreesholds [

	self treesholdsToUse:  JavaTreesholds. 
]

{ #category : #initialize }
OverviewPyramid >> yellowRectangles: aNumber [
	aNumber timesRepeat: [rectangles add: PyramidRectangle paleYellow].

]
