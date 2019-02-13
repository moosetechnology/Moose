"
This class contains some examples. These examples are not accessible from the World menu.
"
Class {
	#name : #RTGeneralExample,
	#superclass : #RTObject,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #animations }
RTGeneralExample >> animationTest [
	<gtExample>
	"
	self new animationTest
	"
	| view circle |
	view := RTView new.
	circle := (RTEllipse new size: 40; color: (Color purple alpha: 0.2)) element.
	view add: circle.
	view addAnimation: (RTLinearMove to: 100 @ 100 during: 2 on: circle). 

	^ view
]

{ #category : #edges }
RTGeneralExample >> arrowedEdges01 [
	<gtExample>
	"
	self new arrowedEdges01
	"

	| v e1 e2 l |
	v := RTView new.
	e1 := (RTEllipse new size: 10) element.
	e2 := (RTEllipse new size: 10) element.
	e2 translateBy: 100@0.

	e1 @ RTDraggable.
	e2 @ RTDraggable.
	
	v add: e1.
	v add: e2.
	l := RTEdge from: e1 to: e2.
	l + (RTLine new color: Color red) + (RTSimpleArrowHead new color: Color red).
	v add: l.

	^ v
]

{ #category : #attachpoints }
RTGeneralExample >> attachPoint01 [
	<gtExample>

	| v e1 e2 l |
	v := RTView new.
	e1 := (RTEllipse new size: 30; color: (Color blue alpha: 0.3)) element.

	e2 := (RTEllipse new size: 30; color: (Color yellow alpha: 0.3)) element.

	l := (RTLine new attachPoint: RTShorterDistanceAttachPoint new) edgeFrom: e1 to: e2.
	 
	e1 @ RTDraggable.
	e2 @ RTDraggable.

	v addAll: (Array with: l with: e2 with: e1).

	^ v
]

{ #category : #beziers }
RTGeneralExample >> beziers01 [
	<gtExample>
	
	| v shape  edge els |
	v := RTView new.
	shape := RTEllipse new size: 10; color: (Color purple alpha: 0.3).
	els := (shape elementsOn: (1 to: 6)) @ RTDraggable.
	v addAll: els .
	RTHorizontalLineLayout on: v elements.

	edge := (RTBezierLine new controllingElements: v elements) edgeFrom: els first to: els last.
	v add: edge.

	^ v
]

{ #category : #beziers }
RTGeneralExample >> beziers02 [
	<gtExample>
	
	"
	self new beziers02
	"

	| v classes hierarchicalLinks depLinks dep |
	v := RTView new.
	classes := (RTEllipse new
		color: Color purple;
		size: 10) elementsOn: Collection withAllSubclasses.
	classes @ RTDraggable @ RTPopup.
	classes
		when: TRMouseEnter
		do: [ :evt | RTBlink outgoingEdgesOf: evt element ].
	v addAll: classes.
	hierarchicalLinks := RTEdgeBuilder new
		view: v;
		objects: Collection withAllSubclasses;
		shape: (RTLine new color: (Color white alpha: 0.2));
		connectFrom: #superclass to: #yourself.

	"A nice layout"
	RTClusterLayout on: v elements edges: v edges.

	"Computing dependencies"
	dep := OrderedCollection new.
	Collection withAllSubclasses
		do:
			[ :cls | 
			cls rtmethods
				do:
					[ :cm | 
					((cm literals
						select: [ :l | l class == Association and: [ l value notNil ] ])
						collect: #value)
						do:
							[ :depClass | 
							cls ~~ depClass
								ifTrue: [ dep add: cls -> depClass ] ] ] ].

	"Add dependency edges"
	depLinks := RTEdgeBuilder new
		view: v;
		objects: dep;
		shape:
			(RTBezierLine new
				color: (Color blue alpha: 0.2);
				follow: #superclass);
		connectFrom: #key to: #value.


	"Move the edges at the back"
	depLinks do: [ :e | e trachelShape pushBack ].
	hierarchicalLinks do: [ :e | e trachelShape pushBack ].

	"Open the view"
	^ v
]

{ #category : #beziers }
RTGeneralExample >> beziersWithArrow [
	<gtExample>

	"self new beziersWithArrow"
	| v shape  edge els |
	v := RTView new.
	shape := RTEllipse new size: 10; color: (Color purple alpha: 0.3).
	els := (shape elementsOn: (1 to: 6)) @ RTDraggable.
	v addAll: els .
	RTHorizontalLineLayout on: v elements.
	edge := (RTEdge from: els first to: els last) + ((RTBezierLine new controllingElements: v elements) + (RTEmptyArrowHead new)).
	v add: edge.

	^ v
]

{ #category : #animations }
RTGeneralExample >> blinking [
	<gtExample>
	"
	self new blinking
	"
	| view el |
	view := RTView new.
	el := (RTBox new size: 100) element.
	view add: el.
	el when: TRMouseClick do: [ :evt | RTBlink on: el in: view ].
	^ view
]

{ #category : #layout }
RTGeneralExample >> cellLayout [
	"
	self new cellLayout
	"

	<gtExample>
	| view substrings |
	view := RTView new.
	substrings := (RTCellLayout >> #doExecute:) sourceCode substrings.
	view addAll: (RTLabel elementsOn: substrings).
	RTCellLayout on: view elements.
	view @ RTDraggableView.
	^ view
]

{ #category : #layout }
RTGeneralExample >> cellLayout2 [
	<gtExample>
	"
	self new cellLayout2
	"
	| view substrings |
	view := RTView new.
	substrings := #('doExecute:' 'elements' '|').
	view addAll: (RTLabel elementsOn: substrings).
	
	RTCellLayout new lineItemsCount: 3; on: view elements.
	view @ RTDraggableView.
	^ view
]

{ #category : #layout }
RTGeneralExample >> cellLayout3 [
	<gtExample>
	"
	self new cellLayout3
	"
	| view els |
	view := RTView new.
	els := RTEllipse new size: #yourself; elementsOn: ((1 to: 20) collect: [ :v | 50 atRandom ]).
	view addAll: els.
	
	RTCellLayout new lineItemsCount: 5; on: view elements.
	view @ RTDraggableView.
	^ view
]

{ #category : #layout }
RTGeneralExample >> circleLayout [
	<gtExample>
	"
	self new circleLayout
	"

	| v els |
	v := RTView new.
	els := RTBox new
		size: 10;
		elementsOn: (1 to: 100).
	v addAll: els.
	els @ RTDraggable.
	RTEdgeBuilder new
		view: v;
		objects: (1 to: 100);
		shape:
			(RTLine new
				color: (Color blue alpha: 0.4);
				withVerticallAttachPoint;
				yourself);
		connectFrom: [ :value | value // 2 ] to: #yourself.
	RTCircleLayout new
		initialRadius: 260;
		on: v elements.
	v @ RTDraggableView.
	^ v
]

{ #category : #shapes }
RTGeneralExample >> circleWaves [
	<gtExample>
	"
	self new circleWaves
	"
	"Inspired from http://haptic-data.com/toxiclibsjs/examples/ColorWaves_raphael.html"
	
	| nbOfCircles  v shape mousePos |
	nbOfCircles := 25.
	
	mousePos := 50 @ 50.
	v := RTView new.
	shape := RTEllipse new sizeElement: [ :el | ((el position - mousePos) r abs / 3) min: 50 ]; color: (Color blue alpha: 0.4).
	v addAll: (shape elementsOn: (1 to: nbOfCircles)).
	RTGridLayout on: v elements.
	
	v when: TRMouseMove do: [ :evt |  Transcript show: evt positionFromCamera printString; cr . mousePos := evt positionFromCamera. v elements do: #updateShape. v canvas signalUpdate ].
	
	^ v
]

{ #category : #shapes }
RTGeneralExample >> circles [
	<gtExample>
	"
	self new circles
	"

	| view shape el |
	view := RTView new.
	shape := RTEllipse new color: (Color purple alpha: 0.2); size: 80.
	100 timesRepeat: [ 
		el := shape element translateTo: 500 atRandom @ 500 atRandom.
		el @ RTDraggable.
		view add: el. 
		view addAnimation: (RTLinearMove to: 500 atRandom @ 500 atRandom during: 2 on: el).
	].	
	^ view
]

{ #category : #layout }
RTGeneralExample >> classHierarchy [
	<gtExample>
	"
	self new classHierarchy
	"

	| view |
	view := RTView new.
	view
		addAll:
			(RTBox elementsOn: Collection withAllSubclasses) @ RTDraggable.
	RTEdgeBuilder new
		view: view;
		objects: Collection withAllSubclasses;
		connectFrom: #superclass to: #yourself.
	RTTreeLayout on: view elements edges: view edges.
	view @ RTDraggableView.
	view edges do: [ :e | e trachelShape pushBack ].
	^ view
]

{ #category : #layout }
RTGeneralExample >> clusterLayout [
	<gtExample>
	"
	self new clusterLayout
	"

	| v |
	v := RTView new.
	v
		addAll:
			((RTEllipse new
				color: Color purple;
				size: 10) elementsOn: Collection withAllSubclasses) @ RTDraggable.
	RTEdgeBuilder new
		view: v;
		objects: Collection withAllSubclasses;
		connectFrom: #superclass to: #yourself.
	RTClusterLayout on: v elements edges: v edges.
	v edges do: [ :e | e trachelShape pushBack ].
	^ v
]

{ #category : #shapes }
RTGeneralExample >> colorWaves [
	<gtExample>
	"
	self new colorWaves
	"
	"Inspired from http://haptic-data.com/toxiclibsjs/examples/ColorWaves_raphael.html"
	
	| nbOfCircles normalizer v shape mousePos |
	nbOfCircles := 25.
	
	mousePos := 50 @ 50.
	normalizer := RTMultiLinearColor new. 
	v := RTView new.
	shape := RTEllipse new 
					sizeElement: [ :el | ((el position - mousePos) r abs / 3) min: 50 ]; 
					colorElement: [ :el | 
						| va|
						va := ((((el position - mousePos) r abs / 3) min: 50) / 50).
						(normalizer level: va) alpha: 0.4 ].
	v addAll: (shape elementsOn: (1 to: nbOfCircles)).
	RTGridLayout on: v elements.
	
	v when: TRMouseMove do: [ :evt | mousePos := evt positionFromCamera. v elements do: #updateShape. v canvas signalUpdate ].
	
	^ v
]

{ #category : #morph }
RTGeneralExample >> combiningRoassalAndMorphic [
	<todo: 'connect to gtExamples'>
	
	"Example by Peter Uhnak"
	|container button view es e|

	view := RTView new.
	container := BorderedMorph new.
	(button := PluggableButtonMorph new)
		label: 'I am a morph';
		actionBlock: [ (view elements, view edges) do: [ :each | each color: Color random. each signalUpdate ] ].

	es := RTBox new color: Color black; size: 50; elementsOn: #(1 2).
	e := RTLine new color: Color black; edgeFrom: es first to: es second.
	view addAll: es; add: e.
	es second translateBy: 100 @ 200.

	container addMorph: view canvas buildMorph.
	container addMorph: button.

	container openInWindow.
]

{ #category : #'compound elements' }
RTGeneralExample >> compound01 [
	<gtExample>
	| c es v |
	c := (RTBox new color: Color red trans) compoundElement.
	c @ RTDraggable.
	c @ RTPopup.
	es := (RTBox new color: Color white) compoundElementsOn: (1 to: 10).
	c addAll: es @ RTPopup.
	
	es do: [ :ee | 
		| g |
		g := RTSlider new.
		g build.
		ee addAll: g view elements.
	].
	
	c layout grid.
	
	v := RTView new.
	v add: c.
	^ v
]

{ #category : #edges }
RTGeneralExample >> directedEdges01 [
	<gtExample>
	"
	self new directedEdges01
	"

	| v classesRoassal classesTrachel shape1 shape2 helpBar1 helpBar2 |
	v := RTView new.
	v @ RTDraggableView.
	shape1 := RTEllipse new
		size: #numberOfMethods;
		color: (Color gray alpha: 0.3).
	shape2 := RTEllipse new
		size: #numberOfMethods;
		color: (Color pink alpha: 0.3).
	classesRoassal := shape1 elementsOn: RTObject withAllSubclasses.
	classesTrachel := shape2 elementsOn: TRObject withAllSubclasses.
	classesRoassal @ RTPopup.
	classesTrachel @ RTPopup.
	v addAll: classesRoassal.
	v addAll: classesTrachel.
	RTEdgeBuilder new
		view: v;
		fromObjects: RTObject withAllSubclasses;
		toObjects: TRObject withAllSubclasses;
		shape: (RTDirectedLine new color: (Color blue alpha: 0.5));
		connectToAll: #dependentClasses.
	RTHorizontalLineLayout new
		gapSize: 1;
		on: classesRoassal , classesTrachel.
	helpBar1 := TRLabelShape new
		text: 'Dependencies between Roassal and Trachel'.
	helpBar2 := TRLabelShape new
		text: 'down links = Roassal depends on Trachel'.
	v canvas addFixedShape: helpBar1.
	v canvas addFixedShape: helpBar2.
	TRConstraint stick: helpBar1 above: helpBar2.
	TRConstraint stickAtTheBottomOfTheWindow: helpBar2.
	^ v
]

{ #category : #edges }
RTGeneralExample >> directedEdges02 [
	<gtExample>
	"
	self new directedEdges02
	"

	| v elements1 elements2 objects1 objects2 shape1 shape2 assocs |
	objects1 := 1 to: 5.
	objects2 := 6 to: 10.
	assocs := Array
		with: 1 -> 5
		with: 2 -> 6
		with: 6 -> 10
		with: 10 -> 2.
	v := RTView new.
	v @ RTDraggableView.
	shape1 := RTEllipse new
		size: 10;
		color: (Color gray alpha: 0.3).
	shape2 := RTEllipse new
		size: 10;
		color: (Color pink alpha: 0.3).
	elements1 := shape1 elementsOn: objects1.
	elements2 := shape2 elementsOn: objects2.
	elements1 @ RTPopup.
	elements2 @ RTPopup.
	v addAll: elements1.
	v addAll: elements2.
	RTEdgeBuilder new
		view: v;
		objects: objects1, objects2;
		shape: (RTDirectedLine new color: (Color blue alpha: 0.5));
		source: assocs connectFrom: #key to: #value.
	RTHorizontalLineLayout new
		gapSize: 1;
		on: elements1 , elements2.
	^ v
]

{ #category : #fun }
RTGeneralExample >> dragonCurve [
	<gtExample>
	"
	self new dragonCurve
	"
	| v curveDragon calc addLine center 
	color   lines |
	v := RTView new.
	v @ RTDraggableView.
	center := 0@0.
	lines := 0.
	"RTNColorLinearNormalizer future work"
	color:= [ [Color random] ].
	addLine := [ :p1 :p2 | | e1 e2 |
		e1 := RTBox elementOn: p1.
		e2 := RTBox elementOn: p2.
		e1 extent: 1@1.
		e2 extent: 1@1.
		e1 translateTo: p1.
		e2 translateTo: p2.
		v add: e1; add: e2.
		v add: (RTLine new color: color value; edgeFrom: e1 to: e2)
		 ].
	curveDragon := nil.
	curveDragon := [ :p1 :p2 :level :order |
		level = 0 ifTrue: [ addLine value: (center+p1) value: (center+p2). ]
		ifFalse: [ | cx cy px py l |
			cx := (p1 x + p2 x)/2.
			cy := (p1 y + p2 y)/2.
			px := (cx - (p2 y - cy)).
			py := (cy + (p2 x - cx)).
			l := level -1.
			order ifTrue: [ 
				curveDragon value: p1 value: px@py value: l value: order.
				curveDragon value: p2 value: px@py value: l value: order not ]
			ifFalse: [
				curveDragon value: p2 value: px@py value: l value: order not.
				curveDragon value: p1 value: px@py value: l value: order
				] ] ].
	calc := [ :extent :level| | p1 p2 |
		p1 := (extent x negated / 5)@(extent y negated / 4).
		p2 := (extent x / 3)@0.
		center := extent / 2.
		
		curveDragon value: p1 value: p2 value: level value: true ].
	
	calc value: 800@800 value: 13.
	^ v
]

{ #category : #edges }
RTGeneralExample >> dynamicEdges01 [
	<gtExample>
	"
	self new dynamicEdges01
	"

	| v es |
	v := RTView new.
	es := ((RTEllipse new size: 30) + RTLabel) elementsOn: (1 to: 20).
	v addAll: es.
	RTCircleLayout new initialRadius: 150; on: es.

	es @ (RTShowEdge new connectToAll: [ :value | value - 5 to: value + 5]; shape: (RTLine new color: (Color blue alpha: 0.4))).

	^ v
]

{ #category : #edges }
RTGeneralExample >> dynamicEdges02 [
	<gtExample>
	"
	self new dynamicEdges02
	"
	| v es |
	v := RTView new.
	es := ((RTEllipse new size: 30) + RTLabel) elementsOn: (1 to: 20).
	v addAll: es.
	RTCircleLayout new initialRadius: 150; on: es.

	es @ (RTShowEdge new 
				connectToAll: [ :value | value - 5 to: value + 5]; 
				shape: [ :el | RTBezierLine new 
									centerOfObjects: (el model - 5 to: el model + 5) inView: v; 
									color: (Color blue alpha: 0.4) ] ).

	^ v
]

{ #category : #edges }
RTGeneralExample >> dynamicLabels [
	<gtExample>
	"
	self new dynamicLabels
	"

	| view elements |
	view := RTView new.
	elements := RTEllipse new size: 30; elementsOn: (1 to: 20).
	view addAll: elements.
	RTCircleLayout new initialRadius: 150; on: elements.
	elements @ (RTShowLabel new highlight: [ :value | value - 5 to: value + 5]; center; yourself).
	elements @ (RTShowEdge new 
						connectToAll: [ :value | value - 5 to: value + 5]; 
						shape: (RTLine new color: (Color blue alpha: 0.4))).
	^ view
]

{ #category : #shapes }
RTGeneralExample >> edges [
	<gtExample>
	"
	self new edges
	"

	| view elements |
	view := RTView new.
	elements := (RTBox new color: (Color purple alpha: 0.2))
		elementsOn: Collection withAllSubclasses.
	view addAll: elements.
	RTEdgeBuilder new
		view: view;
		objects: Collection withAllSubclasses;
		shape: (RTLine new color: (Color blue alpha: 0.2));
		connectFrom: #yourself to: #superclass.
	RTGridLayout on: view elements.
	^ view
]

{ #category : #shapes }
RTGeneralExample >> edges2 [
	<gtExample>
	"
	self new edges2
	"
	
	| view elements |
	view := RTView new.
	elements := (RTBox new color: (Color purple alpha: 0.2); size: 40) elementsOn: #(1 2).
	elements @ RTDraggable.
	view addAll: elements.
	
	RTEdgeBuilder new
		view: view;
		useAssociation: 1 -> 2.
	
	RTHorizontalLineLayout on: elements.
	^ view
]

{ #category : #interaction }
RTGeneralExample >> edition [
	<gtExample>

	"
	self new edition
	"
	
	| view selected statusBar |
	view := RTView new.
	selected := nil.
	statusBar := nil.
	
	view when: TRMouseClick do: [ :evt |
		selected == #line ifTrue: [ 
			| ex1 ex2 line |
			ex1 := (RTBox new size: 10; color: (Color purple alpha: 0.2)) element. 
			ex2 := (RTBox new size: 10; color: (Color purple alpha: 0.2)) element.
			ex1 translateTo: evt position.
			ex2 translateTo: evt position + (100 @ 60).
			ex1 @ RTHighlightable.
			ex2 @ RTHighlightable.
			ex1 @ RTDraggable. 
			ex2 @ RTDraggable.
			line := (RTLine new "width: 3;" color: (Color blue alpha: 0.2)) edgeFrom: ex1 to: ex2.
			view addAll: (Array with: ex1 with: ex2 with: line ).
			line trachelShape pushBack.
		].

		selected == #circle ifTrue: [ 
			| ellipse |
			ellipse := (RTEllipse new size: 40; color: (Color yellow alpha: 0.2)) element. 
			ellipse translateTo: evt position.		
			ellipse @ RTDraggable. 
			view add: ellipse.		
		].

		
		selected == #rectangle ifTrue: [ 
			| box |
			box := (RTBox new width: 40; height: 30; color: (Color blue alpha: 0.2)) element. 
			box translateTo: evt position.		
			box @ RTDraggable. 
			view add: box.		
		].
		view canvas signalUpdate.
	].



	view @ RTDraggableView.

	view addMenu: '+ line' callback: [ selected := #line. statusBar text: 'line' ].
	view addMenu: '+ circle' callback: [ selected := #circle. statusBar text: 'circle' ].
	view addMenu: '+ rectangle' callback: [ selected := #rectangle. statusBar text: 'rectangle' ].
	view addMenu: 'Info' callback: [ TRPlatform current inform: 'Vectorial editing is hyper cool' ].

	statusBar := TRLabelShape new.
	statusBar text: 'Please, select an option'.
	view canvas addShape: statusBar.
	statusBar setAsFixed.
	TRConstraint stickAtTheBottomOfTheWindow: statusBar.

	view canvas color: Color white.
	^ view
]

{ #category : #nesting }
RTGeneralExample >> elementWithFontsZooming [
	<gtExample>
	"
	self new elementWithFontsZooming
	"
	| view firstGroup secondGroup bothGroups mainElement originalExtent mainWithNested |
	view := RTView new.
	"element creation"
	mainElement := RTBox new color: (Color blue alpha: 0.3); elementOn: nil.
	firstGroup := (RTLabel new) elementsOn: #('Smalltalk' 'World').
	secondGroup := (RTBox new size: #yourself) elementsOn: #(30 40).
	bothGroups := RTGroup with: firstGroup with: secondGroup.
	"layouting"
	RTHorizontalLineLayout new gapSize: 1; alignLeft; on: firstGroup; on: secondGroup.
	RTVerticalLineLayout new gapSize: 1; alignLeft; on: bothGroups.
	RTNest new padding: 1; on: mainElement nest: firstGroup, secondGroup.
	mainWithNested := RTGroup with: mainElement with: bothGroups.
	mainWithNested @ RTDraggable.
	view add: mainWithNested.
	"define menu and their actions"
	originalExtent := mainElement extent.
	view addMenu: 'Smaller' 
		callback: [ view addAnimation: (RTResizeMove new 
													toExtent: mainElement extent * 0.6 
													during: 0.3 on: mainElement) ].
	view addMenu: 'Bigger' 
		callback: [ view addAnimation: (RTResizeMove new 
													toExtent: mainElement extent * (1 / 0.6) 
													during: 0.3 on: mainElement) ].
	view addMenu: 'Original' callback: [ mainElement extent: originalExtent. view signalUpdate ].
	view addMenu: 'Half' callback: [ mainElement extent: originalExtent / 2. view signalUpdate ].
	^ view
]

{ #category : #nesting }
RTGeneralExample >> elementZooming [
	<gtExample>
	"
	self new elementZooming
	"
	| view firstGroup secondGroup bothGroups mainElement originalExtent mainWithNested |
	view := RTView new.
	"element creation"
	mainElement := RTBox new color: (Color blue alpha: 0.3); elementOn: nil.
	firstGroup := (RTBox new size: #yourself) elementsOn: #(20 50).
	secondGroup := (RTBox new size: #yourself) elementsOn: #(30 40).
	bothGroups := RTGroup with: firstGroup with: secondGroup.
	"layouting"
	RTHorizontalLineLayout new gapSize: 1; alignLeft; on: firstGroup; on: secondGroup.
	RTVerticalLineLayout new gapSize: 1; alignLeft; on: bothGroups.
	RTNest new padding: 1; on: mainElement nest: firstGroup, secondGroup.
	mainWithNested := RTGroup with: mainElement with: bothGroups.
	mainWithNested @ RTDraggable.
	view add: mainWithNested.
	"define menu and their actions"
	originalExtent := mainElement extent.
	view addMenu: 'Smaller' 
		callback: [ view addAnimation: (RTResizeMove new 
													toExtent: mainElement extent * 0.6 
													during: 0.3 on: mainElement) ].
	view addMenu: 'Bigger' 
		callback: [ view addAnimation: (RTResizeMove new 
													toExtent: mainElement extent * (1 / 0.6) 
													during: 0.3 on: mainElement) ].
	view addMenu: 'Original' callback: [ mainElement extent: originalExtent. view signalUpdate ].
	view addMenu: 'Half' callback: [ mainElement extent: originalExtent / 2. view signalUpdate ].
	^ view
]

{ #category : #animations }
RTGeneralExample >> escapingCircle [
	<gtExample>
	
	| v e |
	v := RTView new.
	e := (RTEllipse new size: 50; color: (Color blue alpha: 0.4)) element.
	v add: e.

	e when: TRMouseEnter do: [ :evt | 
		| newPos |
		newPos := ((300 atRandom - 150) @ (300 atRandom - 150)) + evt element position. 
		v addAnimation: (RTAccelerationMove to: newPos  during: 2 on: evt element) ].
	^ v

]

{ #category : #animations }
RTGeneralExample >> expandingArc [
	<gtExample>
	"
	self new expandingArc
	"

	| v e angle externalRadius |
	v := RTView new.
	angle := TRVIAnimatedValue new
					evaluator: [ :t | 0 interpolateTo: 360 at: t ];
					timer: (TRVITimer new cycleLength: 4);
					yourself.
	externalRadius := TRVIAnimatedValue new
					evaluator: [ :t | 50 interpolateTo: 150 at: t ];
					timer: (TRVITimer new cycleLength: 4);
					yourself.
					
	e := (RTArc new 
			innerRadius: 50;
			externalRadius: externalRadius;
			outerAngle: angle innerAngle: 30) element.
	v add: e.
	v addAnimation: (RTResetAllShape new trCanvas: v canvas).
	angle start.
	externalRadius start.
	^ v
]

{ #category : #layout }
RTGeneralExample >> forceBasedLayout [
	<gtExample>
	"
	self new forceBasedLayout
	"

	| v classes edges |
	v := RTView new.
	classes := (RTEllipse new
		color: (Color purple alpha: 0.3);
		size: 10) elementsOn: Collection withAllSubclasses.
	(classes elementFromModel: Collection) trachelShape color: Color red.
	classes @ RTDraggable.
	v addAll: classes.
	edges := RTEdgeBuilder new
		view: v;
		objects: Collection withAllSubclasses;
		shape: (RTLine new color: (Color purple alpha: 0.2));
		connectFrom: #superclass to: #yourself.
	edges do: [ :e | e trachelShape pushBack ].

	"RTForceBasedLayout on: v elements edges: v edges."
	v addAnimation: (RTForceLayoutStepping new view: v).
	v @ RTDraggableView.
	^ v
]

{ #category : #groups }
RTGeneralExample >> group1 [
	<gtExample>
	<noTest>
	"self new group1"

	| view group1 group2 host1 host2 edgesGroup1 edgesGroup2 |
	view := RTView new.
	group1 := (RTBox new color: (Color blue alpha: 0.3)) elementsOn: (1 to: 10).
	group2 := (RTBox new color: (Color blue alpha: 0.3)) elementsOn: (1 to: 10).
	
	host1 := (RTBox new color: (Color green alpha: 0.3)) element.
	host2 := (RTBox new color: (Color green alpha: 0.3)) element.
	
	view addAll: group1; addAll: group2; add: host1; add: host2.
	
	edgesGroup1 := RTEdge 
		buildEdgesFromObjects: (1 to: 10) 
		from: [ :v | v //2 ] to: #yourself inView: view scope: group1.
	edgesGroup2 := RTEdge 
		buildEdgesFromObjects: (1 to: 10) 
		from: [ :v | v //2 ] to: #yourself inView: view scope: group2.

	
	RTTreeLayout on: group1 edges: edgesGroup1.
	RTTreeLayout on: group2 edges: edgesGroup2.
	
	RTNest new on: host1 nest: group1.
	RTNest new on: host2 nest: group2.
	
	RTHorizontalLineLayout on: (Array with: host1 with: host2).
	
	host1 @ RTDraggable.
	host2 @ RTDraggable.
	
	view canvas addMenu: 'In' callback: [ RTZoomInMove on: view ].
	view canvas addMenu: 'Out' callback: [ RTZoomOutMove on: view ].

	view @ RTDraggableView.
	
	^ view
]

{ #category : #animations }
RTGeneralExample >> growingSquare [
	<gtExample>
	" 
	self new growingSquare
	"

	| view el |
	view := RTView new.
	el := RTBox new size: 20; color: (Color purple alpha: 0.2); element.
	el @ RTDraggable.
	el translateTo: 100 @ 130.
	
	el when: TRMouseClick do: [ :evt |
		| t |
		t := evt element trachelShape width + 5.
		evt element trachelShape extent: t @ t. evt signalUpdate ].

	view add: el.
	^ view
]

{ #category : #shapes }
RTGeneralExample >> growingSquares [
	<gtExample>
	"
	self new growingSquares
	"
	
	| view shape |
	view := RTView new.

	shape := RTBox new size: #yourself.
	1 to: 100 do: [ :i |
		view add: ((shape elementOn: i) translateTo: 20 @ 20; yourself).
	].
	RTGridLayout on: view elements.
	
	^ view
]

{ #category : #interaction }
RTGeneralExample >> highlight [
	<gtExample>
	" self new highlight "
		
	| v es |
	v := RTView new.
	es := ((RTBox new size: 30)" + RTLabel") elementsOn: (1 to: 16).

	es @ (RTHighlightable highlight: [ :vv | | arr |
		arr := OrderedCollection new.
		arr add: vv - 1.
		arr add: vv.
		arr add: vv + 1.
		arr add: vv - 4.
		arr add: vv + 4.
		arr]).

	RTGridLayout on: es.
	v addAll: es.
	^ v
]

{ #category : #shapes }
RTGeneralExample >> highlightSquare [
	<gtExample>
	"
	self new highlightSquare
	"
	
	| view shape el |
	view := RTView new.

	shape := RTBox new size: #yourself.
	1 to: 100 do: [ :i |
		el := shape elementOn: i.
		el translateTo: 20 @ 20.
		el when: TRMouseEnter do: [ :e | e shape color: Color red. e signalUpdate ].
		el when: TRMouseLeave do: [ :e | e shape color: Color gray. e signalUpdate ].
		el when: TRMouseDragging do: [ :e | e shape translateBy: e step. e signalUpdate ].
		view add: el.
	].
	RTGridLayout on: view elements.
	
	^ view
]

{ #category : #interaction }
RTGeneralExample >> hoverZoom [
	<gtExample>
	"
	self new hoverZoom
	"
		
	| v es |
	v := RTView new.
	es := RTBox new size: #yourself; elementsOn: (10 to: 60 by: 5).
	v addAll: es.
	es do: [ :eachElement | | nested |
		nested := RTBox new color: (Color green alpha: 0.5); 
						size: #yourself; elementsOn: (10 to: 25 by: 5).
		nested @ RTHighlightable.
		v add: nested.
		RTNest new 
			layout: RTGridLayout new;
			on: eachElement nest: nested ].

	es @ RTMouseHoverZoom.

	RTGridLayout on: es.
	^ v
]

{ #category : #labels }
RTGeneralExample >> label [
	<gtExample>
	"
	self new label
	"
	| v label els |
	v := RTView new.
	label := RTLabel new height: [ :e | e ].
	els := label elementsOn: (1 to: 30).
	v addAll: els.
	RTGridLayout on: els.
	^ v
]

{ #category : #shapes }
RTGeneralExample >> label2 [
	<gtExample>
	"
	self new label2
	"
	| view |
	view := RTView new.
	1 to: 20 do: [ :i |
		view add: (RTLabel elementOn: 'hello world').
	].
"	RTVerticalLineLayout on: view elements."
	RTGridLayout on: view elements.
"	RTHorizontalLineLayout on: view elements."
	^ view
]

{ #category : #shapes }
RTGeneralExample >> label3 [
	<gtExample>
	"
	self new label3
	"
	| view |
	view := RTView new.
	1 to: 20 do: [ :i |
		view add: (RTLabel elementOn: i asString).
	].
"	RTVerticalLineLayout on: view elements."
	RTGridLayout on: view elements.
"	RTHorizontalLineLayout on: view elements."
	^ view
]

{ #category : #shapes }
RTGeneralExample >> linkedSquares [
	<gtExample>
	"
	self new linkedSquares
	"
	| view shape  fromEl toEl edge |
	view := RTView new.

	shape := RTBox new size: 90; color: (Color blue alpha: 0.1).
	fromEl := shape element.
	fromEl translateTo: 20 @ 30.
	fromEl @ RTDraggable.

	toEl := shape element.
	toEl translateTo: 200 @ 80.
	toEl @ RTDraggable.
	
	edge := RTLine edgeFrom: fromEl to: toEl.  	
	view add: fromEl; add: toEl; add: edge.

	^ view
]

{ #category : #shapes }
RTGeneralExample >> manySquares [
	<gtExample>
	"
	self new manySquares
	"
	
	| view shape el |
	view := RTView new.

	shape := RTBox new.
	1 to: 7000 do: [ :i |
		el := shape elementOn: i.
		el translateTo: 20 @ 20.
		el @ RTHighlightable.
		el @ RTDraggable.
		view add: el.
	].
	RTGridLayout new gapSize: 1; on: view elements.
	
	^ view
]

{ #category : #camera }
RTGeneralExample >> movingCamera [
	<gtExample>
	
	"
	self new movingCamera
	"
		
	| v menu |
	v := RTView new.
	v add: (RTEllipse new size: 50) element.

	menu := RTMenuBuilder new view: v.
	menu menu: '<-' callback: [ v canvas camera translateBy: -10 @ 0. v signalUpdate ].
	menu menu: '->' callback: [ v canvas camera translateBy: 10 @ 0. v signalUpdate ].
	menu menu: 'V' callback: [ v canvas camera translateBy: 0 @ 10. v signalUpdate ].
	menu menu: '^' callback: [ v canvas camera translateBy: 0 @ -10. v signalUpdate ].
	 
	^ v
]

{ #category : #nesting }
RTGeneralExample >> multipleNesting [
	<gtExample>
	<noTest>
	" 
	self new multipleNesting
	"
	| view inner host edges outter trachelCanvas resizable |
	outter := OrderedCollection new.
	view := RTView new.
	view @ RTDraggableView.
	
	1 to: 200 by: 10 do: [ :i |
		inner := (RTBox new color: (Color purple alpha: 0.2)) elementsOn: (1 to: i).
		host := (RTBox new color: (Color yellow alpha: 0.1)) element.
		outter add: host.

		view add: host.
		view addAll: inner.
		edges := 
			RTEdge 
				buildEdgesFromObjects: (1 to: 100) 
				from: [ :v | v // 2 ] 
				to: #yourself 
				inView: view
				scope: inner.

		RTGridLayout new on: inner.
		RTNest new		
			on: host nest: inner.
	].
	RTGridLayout on: outter.
	
	trachelCanvas := view setUpCanvas.
	TRFocusCenter on: trachelCanvas.
	
	"Zoom a specific element"
	resizable := outter at: (Random new nextInt: outter size).
	view addMenu: 'Smaller' 
		callback: [ view addAnimation: (RTResizeMove new 
													toExtent: resizable extent * 0.6 
													during: 0.3 on: resizable) ].
	view addMenu: 'Bigger' 
		callback: [ view addAnimation: (RTResizeMove new 
													toExtent: resizable extent * (1 / 0.6) 
													during: 0.3 on: resizable) ].
	
	^ view
]

{ #category : #nesting }
RTGeneralExample >> nestedHierarchy [
	<gtExample>
	" 
	self new nestedHierarchy
	"

	| view inner host |
	view := RTView new.
	inner := (RTBox new color: (Color purple alpha: 0.2))
		elementsOn: (1 to: 100).
	host := (RTBox new color: (Color yellow alpha: 0.1)) element.
	inner
		do:
			[ :i | i when: TRMouseClick do: [ :event | event model inspect ] ].
	view add: host.
	view addAll: inner.
	RTEdgeBuilder new
		view: view;
		objects: (1 to: 100);
		connectFrom: [ :v | v // 2 ] to: #yourself.
	RTTreeLayout new on: inner edges: view edges.
	RTNest new on: host nest: inner.
	^ view
]

{ #category : #nesting }
RTGeneralExample >> nesting [
	<gtExample>
	"
	self new nesting
	"
	| view el shape inner |
	view := RTView new.
	el := (RTBox new width: 80; height: 40; color: (Color purple alpha: 0.3)) element.
	
	shape := RTBox new color: (Color purple alpha: 0.3).
	inner := shape elementsOn: (1 to: 20).

	view add: el.
	view addAll: inner.

	el @ RTDraggable.
	
	RTNest
		new 
		layout: RTGridLayout new;
		on: el nest: inner.
		
	el translateTo: 100 @ 50.
	^ view
	
]

{ #category : #nesting }
RTGeneralExample >> nesting2 [
	<gtExample>
	"
	self new nesting2
	"

	| view el shape  innerElements |
	view := RTView new.
	el := (RTBox new width: 80; height: 40; color: (Color purple alpha: 0.3)) element.
	el translateTo: 200 @ 150.
	shape := RTBox new color: (Color red alpha: 0.3); size: #yourself.
	
	innerElements := (1 to: 30) collect: [ :i | shape elementOn: i ].
	view addAll: innerElements.
	
	
	RTNest
		new 
		layout: RTGridLayout new;
		on: el nest: innerElements.
		
	view add: el.
	
	^ view
	
]

{ #category : #nesting }
RTGeneralExample >> nesting3 [
	<gtExample>
	"
	self new nesting3
	"
	| view el shape inner |
	view := RTView new.
	el := (RTBox new width: 80; height: 40; color: (Color purple alpha: 0.3)) element.
	
	shape := RTBox new color: (Color purple alpha: 0.3).
	inner := (shape elementOn: #inner).

	view add: el.
	view add: inner.

	RTNest
		new 
		layout: RTGridLayout new;
		on: el nest: (Array with: inner).
		
	el translateTo: 100 @ 50.
	^ view
	
]

{ #category : #nesting }
RTGeneralExample >> nesting4 [
	<gtExample>
	"
	self new nesting4
	"
	| v es |
	v := RTView new.
	v @ RTDraggableView.

	es := RTBox new elementsOn: RTShape withAllSubclasses.
	v addAll: es.

	es @ RTPopup.

	RTNest new
		view: v;
		for: es add: [ :group :model |
			group addAll: ((RTBox new color: (Color blue alpha: 0.2)) elementsOn: model methods).
			
			RTNest new 
				view: v;
				for: group add: [ :g2 :m2 | g2 addAll: ((RTBox new color: Color yellow) elementsOn: #(1 2 3)).
				RTHorizontalLineLayout on: g2. ].
				 
			RTHorizontalFlowLayout on: group ].

	RTHorizontalFlowLayout on: es.
	^ v
]

{ #category : #animations }
RTGeneralExample >> newYear2014 [
	<gtExample>
	"
	self new newYear2014
	"
	| view txt x y el shape size offset |
	txt := 
	'
	xxxxx  xxxxx     xxx      x
	x   x  x   x    x  x     x
	   x   x   x   x   x    x x 
	  x    x   x       x    xxxxx
	 x     x   x       x      x
	xxxxx  xxxxx       x      x
	'.
	view := RTView new.
	x := 0.
	y := 0.
	size := 20.
	offset := 100 @ 100.
	txt linesDo: [ :line |
		y := y + 1.
		line do: [ :c |
			x := x + 1.
			c = $x ifTrue: [ 
				shape := (RTEllipse new size: size; color: (Color purple alpha: 0.2)).
				el := shape element.
				el translateTo: (800 atRandom @ 450 atRandom).
				view add: el.
				view addAnimation: (RTLinearMove new to: ((x * size) @ (y * size) + offset) during: 0.5 on: el).
			]
		].
	   x := 0.
	].
	^ view
]

{ #category : #normalizers }
RTGeneralExample >> normalizer01 [
	<gtExample>
	"
	self new normalizer01
	"
	| v es n |
	v := RTView new.
	n := RTGrayLinearColor new 
				command: #asInteger; 
				scope: ($a to: $z).
				
	es := RTBox new
				size: 40;
				color: n;
				elementsOn: ($a to: $z).
				
	v addAll: es.
	es @ RTPopup.
	RTGridLayout on: es.

	^ v
]

{ #category : #layout }
RTGeneralExample >> numbers [
	<gtExample>
	"self new numbers"

	| view elements |
	view := RTView new.
	elements := RTBox elementsOn: (1 to: 100).
	elements @ RTDraggable.
	view addAll: elements.
	RTEdgeBuilder new
		view: view;
		objects: (1 to: 100);
		shape: (RTLine new color: Color purple);
		connectFrom: [ :v | v // 2 ] to: #yourself.
	RTTreeLayout on: view elements edges: view edges.
	view edges do: [ :e | e trachelShape pushBack ].
	view @ RTDraggableView.
	^ view
]

{ #category : #popup }
RTGeneralExample >> popup1 [
	<gtExample>
	"
	self new popup1
	"
	| v els |
	v := RTView new.
	v @ RTDraggableView.
	els := (RTBox new size: 20) elementsOn: (1 to: 100).
	els @ (RTPopup new textElement: [ :e | e model printString ]).
	els @ RTDraggable.
	els when: TRMouseClick do: [ :evt | evt element inspect ].
	v addAll: els.
	RTGridLayout on: els.
	^ v
]

{ #category : #popup }
RTGeneralExample >> popupView1 [
	<gtExample>
	<noTest>
	
	"
	self new popupView1
	"
	| v els |
	v := RTView new.
	v @ RTDraggableView.
	els := (RTBox new size: 20) elementsOn: (1 to: 100).
	
	els @ (RTPopup new group: [ :group :el |
		el model timesRepeat: [
			group add: (RTBox new size: 10; color: (Color purple alpha: 0.5)) element ].
		RTGridLayout on: group. ]).
	
	
	
	v addAll: els.
	els @ RTDraggable @ RTLabeled.
	RTGridLayout on: els.
	^ v
]

{ #category : #popup }
RTGeneralExample >> popupView2 [
	<gtExample>
	<noTest>
	"
	self new popupView2
	"
	| v els background |
	v := RTView new.
	v @ RTDraggableView.
	els := (RTBox new size: 20) elementsOn: (1 to: 100).
	
	els @ (RTPopup new group: [ :group :el |
		el model timesRepeat: [
			group add: (RTBox new size: 10; color: (Color purple alpha: 0.5)) element ].
		RTGridLayout on: group.		
		background := (RTBox new color: (Color white alpha: 0.5)) element.
	
		RTNest new centerOn: background elements: group.
		group add: background.	
		 ]).
	
	v addAll: els.
	els @ RTDraggable@RTLabeled.
	RTGridLayout on: els.
	^ v
]

{ #category : #popup }
RTGeneralExample >> popupWithLegend [
	<gtExample>
	"
	self new popupWithLegend
	"

	| view |

	view := RTMondrian new.
	view interaction noInteractions.

	view interaction popup group: [ :group :el |
		
		| background elements cls legend1 legend2 | 
		elements := RTGroup new.
		background := (RTBox new color: (Color green alpha: 0.8)) element.
		
		el model timesRepeat: [ 
				cls := RTEllipse.
				50 atRandom > 25
					ifTrue: [ cls := RTBox ].
				elements add: (cls new size: 10; color: (Color purple alpha: 0.5)) element
				].
		RTGridLayout on: elements.
		
		
		"Legend Good"
		legend1 := RTGroup new.
		legend1 add: (RTBox new size: 10; color: (Color purple alpha: 0.5)) element.
		legend1 add: (RTLabel elementOn: '= Good').
		RTHorizontalLineLayout on: legend1.
		
		"Legend Bad"
		legend2 := RTGroup new.
		legend2 add: (RTEllipse new size: 10; color: (Color purple alpha: 0.5)) element.
		legend2 add: (RTLabel elementOn: '= Bad').
		RTHorizontalLineLayout on: legend2.
		
		RTVerticalLineLayout new gapSize: 0; on: (Array with: legend1 with: legend2 with: elements). 
		
			RTNest new centerOn: background elements: (Array with: legend1 with: legend2 with: elements).

		
		group add: background.
		group addAll: legend1.
		group addAll: legend2.
		group addAll: elements ].


	view shape rectangle size: #yourself.
	view nodes: (1 to:50).
	view layout grid.
	^ view
]

{ #category : #labels }
RTGeneralExample >> rotatingLabels [
	<gtExample>
	"
	self new rotatingLabels
	"

	| v shape |
	v := RTView new.
	shape := RTRotatedLabel new.
	shape angleInDegree: [ :cls | cls numberOfMethods negated / 1.5 ].
	shape text: [ :cls | '                                                                                ', cls name ].
	shape color: (Color black alpha: 0.2).
	v addAll: (shape elementsOn: Collection withAllSubclasses).

	v canvas color: Color white.
	^ v
]

{ #category : #labels }
RTGeneralExample >> rotatingLabelsAnimated [
	<gtExample>
	"
	self new rotatingLabelsAnimated
	"

	| v shape timer rotationRatio seconds |
	v := RTView new.
	seconds := 7.
	timer := TRVITimer new cycleLength: seconds.
	rotationRatio := 0.2.

	shape := RTRotatedLabel new.
	shape angleInDegree: [ :cls | 
		| valueEnd |
		valueEnd := cls numberOfMethods negated / rotationRatio.
		TRVIAnimatedValue new
					evaluator: [ :t | 0 interpolateTo: valueEnd at: t ];
					timer: timer;
					yourself. ].

	shape text: [ :cls | '                                                                                ', cls name ].
	shape color: (Color black alpha: 0.2).
	v addAll: (shape elementsOn: Collection withAllSubclasses).

	v canvas color: Color white.
	v addAnimation: RTResetAllShape new.
	timer start.
	^ v
]

{ #category : #animations }
RTGeneralExample >> shrinking [
	<gtExample>
	"
	self new shrinking
	"
	| e v |
	v := RTView new.
	e := (RTBox new color: Color green; width: 150; height: 120) element.
	v add: e.

	e when: TRMouseClick do: [ :evt |
		| anim |
		anim := RTResizeMove new toExtent: (50 @ 30) on: e.
		anim after: [ 
			| el |
			el := RTLabel elementOn: 'hello'.
			v add: el.
			RTNest new on: e nest: (Array with: el). e trachelShape signalUpdate ].
		v addAnimation: anim.
	].
	e @ RTDraggable.
	^ v
]

{ #category : #layout }
RTGeneralExample >> smoothLayout [
	<gtExample>
	"
	self new smoothLayout
	"

	| v translator |
	translator := RTSmoothLayoutTranslator new.
	v := RTView new.
	v canvas
		addMenu: 'grid'
		callback:
			[ 
			RTGridLayout new
				translator: translator;
				on: v elements.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'hori'
		callback:
			[ 
			RTHorizontalLineLayout new
				translator: translator;
				on: v elements.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'treeV'
		callback:
			[ 
			RTTreeLayout new
				translator: translator;
				on: v elements edges: v edges.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'treeH'
		callback:
			[ 
			RTHorizontalTreeLayout new
				translator: translator;
				on: v elements edges: v edges.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'cluster'
		callback:
			[ 
			RTClusterLayout new
				translator: translator;
				on: v elements edges: v edges.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'circle'
		callback:
			[ 
			RTCircleLayout new
				translator: translator;
				scaleBy: 0.8;
				on: v elements.
			v canvas signalUpdate ].
	v canvas
		addMenu: 'radial'
		callback:
			[ 
			RTRadialTreeLayout new
				translator: translator;
				on: v elements.
			v canvas signalUpdate ].
	v addAll: (RTBox new elementsOn: (1 to: 100)).
	RTEdgeBuilder new
		view: v;
		objects: (1 to: 100);
		connectFrom: [ :value | value // 2 ] to: #yourself.
	RTTreeLayout new on: v elements edges: v edges.
	^ v
]

{ #category : #beziers }
RTGeneralExample >> softviz01 [
	<gtExample>
	<noTest>
	"
	self new softviz01
	Circle = classes, size = number of methods; gray links = inheritance; blue links = dependencies; layout = force based layout on the inheritance links
	"

	| v inheritanceEdges shape helpBar1 helpBar2 elements |
	v := RTView new.
	shape := RTEllipse new
		color: (Color red alpha: 0.4);
		size: [ :e | e numberOfMethods / 5 max: 5 ].
	elements := shape elementsOn: Collection withAllSubclasses.
	elements @ RTPopup.
	v addAll: elements.

	"Defining edges from inheritance"
	inheritanceEdges := RTEdgeBuilder new
		view: v;
		objects: Collection withAllSubclasses;
		connectFrom: #superclass to: #yourself.

	"Layout the whole thing"
	RTOptimizedForceBasedLayout new
		userDefinedEdges: inheritanceEdges;
		on: v elements.

	"Defining edges from dependencies"
	Collection withAllSubclasses
		do:
			[ :cls | 
			cls rtmethods
				do:
					[ :cm | 
					((cm literals
						select: [ :l | l class == Association and: [ l value notNil ] ])
						collect: #value)
						do:
							[ :depClass | 
							(cls ~~ depClass
								and: [ Collection withAllSubclasses includes: depClass ])
								ifTrue:
									[ 
									RTEdgeBuilder new
										view: v;
										shape:
											(RTBezierLine new
												follow: #superclass;
												color: (Color blue alpha: 0.1));
										useAssociations: (Array with: cls -> depClass) ] ] ] ].
	helpBar1 := TRLabelShape new
		text:
			'Circle = classes, size = number of methods; gray links = inheritance;'.
	helpBar2 := TRLabelShape new
		text:
			'blue links = dependencies; layout = force based layout on the inheritance links'.
	v canvas addFixedShape: helpBar1.
	v canvas addFixedShape: helpBar2.
	TRConstraint stick: helpBar1 above: helpBar2.
	TRConstraint stickAtTheBottomOfTheWindow: helpBar2.


	"Open the view"
	^ v
]

{ #category : #shapes }
RTGeneralExample >> styledLabel [
	<gtExample>
	"
	self new styledLabel
	"

	| v shape el all cls|
	v := RTView new.
	cls := TRPlatform current textEmphasisClass.
	(shape := RTStyledLabel new) color: Color black.
	#(#normal #italic #bold #underlined #struckOut)
		do:
			[ :each | 
			el := shape
				emphasis: (cls perform: each);
				elementOn: each.
			v add: el ].
	all := shape
		emphasis:
			(Array with: cls bold
				with: cls italic
				with: cls underlined);
		elementOn: 'bold + italic + underlined'.
	v add: all.
	RTVerticalLineLayout on: v elements.
	^ v
]

{ #category : #'software visualization' }
RTGeneralExample >> systemComplexity [
	<gtExample>
	"
	self new systemComplexity
	"

	| v els edges |
	v := RTView new.
	els := RTBox new
		height: [ :c | c numberOfMethods max: 5 ];
		borderColor: Color black;
		width: [ :c | c numberOfVariables * 5 max: 5 ];
		color:
			(RTGrayLinearColor new
				command: #numberOfLinesOfCode;
				scope: Collection withAllSubclasses);
		elementsOn: Collection withAllSubclasses.
	v addAll: els.
	els @ RTDraggable @ RTPopup.
	edges := RTEdgeBuilder new
		view: v;
		objects: Collection withAllSubclasses;
		shape:
			(RTLine new
				withVerticallAttachPoint;
				yourself);
		connectFrom: #superclass to: #yourself.
	edges do: #moveBehindItsExtremities.
	RTTreeLayout on: v elements.
	v @ RTDraggableView.
	^ v
]

{ #category : #fun }
RTGeneralExample >> worm [
	<gtExample>
	"
	self new worm
	"

	| v s e last lineLength callback nbOfElements head |
	v := RTView new.
	s := RTEllipse new 
					size: [ :m | m * 10 ]; 
					color: (Color blue alpha: 0.4).
	nbOfElements := 10.
	last := nil.
	1 to: nbOfElements do: [ :i | 
		e := (s elementOn: i).
		v add: e.		
		last ifNotNil: [ v add: (RTLine new edgeFrom: e to: last) ].
		last := e.		
	].

	lineLength := 40.

	callback := TRTranslationCallback 
		block: [ :shape :step | 
				| diff alpha dist |
				(shape element outgoingEdges collect: #to) do: [ :el | 
					diff := shape position - el position.
					alpha := diff theta.
					dist := ((diff x * diff x) + (diff y * diff y)) sqrt. 
					el translateBy: (alpha cos * (dist - lineLength)) @ (alpha sin * (dist - lineLength)) ] ].
	 
	v elements do: [ :el | el trachelShape addCallback: callback ].

	head := v elements last.
	v when: TRMouseMove do: [ :evt | 
		head translateBy: (evt positionFromCamera - head position) / 10.
		v canvas signalUpdate ].
	^ v
]

{ #category : #animations }
RTGeneralExample >> zooming [
	<gtExample>

	| v |
	v := RTView new.
	v add: (RTBox new size: 40) element @ RTHighlightable @ RTDraggable.

	v canvas addMenu: 'In' callback: [ RTZoomInMove on: v ].
	v canvas addMenu: 'Out' callback: [ RTZoomOutMove on: v ].
	v @ RTDraggableView.
	^ v
]
