Extension { #name : #FAMIXTypeGroup }

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> addSystemComplexityLegendOn: view [

	| lb |
	lb := RTLegendBuilder new.
	lb onDemand.
	lb view: view.

	lb addColoredText: 'System complexity view' color: Color black.
	lb addText: 'box = class'.
	lb addText: 'line = inheritance (superclass is above subclasses)'.
	lb addRectanglePolymetricWidth: 'number of attributes' height: 'number of methods' box: 'a class'.
	lb addColorFadingFrom: Color white to: Color black text: 'Number of lines of code (white = few, black = a lot)'.
	lb build.
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewAnnotationConstellation [
	<menuItem: 'Annotation Constellation' category: 'Visualize'>
	| view |
	view := RTMondrian new.
	self viewAnnotationConstellationOn: view.
	^ view open setLabel: 'Annotation Constellation'
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewAnnotationConstellationOn: view [
	(FAMIXAnnotationTypeGroup withAll: (self flatCollectAsSet: #annotationTypes)) viewAnnotationConstellationOf: self on: view
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewBlueprintComplexity [
	<menuItem: 'Blueprint complexity' category: 'Visualize'> 
	
	| view |
	view := RTView new.
	view @ RTZoomableView @ RTDraggableView.
	self viewBlueprintOn: view.
	self asArray anyOne addBlueprintLegendOn: view. 
	view inspect.

]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewBlueprintOn: view [

	| nodes edges eb |
	nodes := RTBox new color: Color transparent; elementsOn: self.
	view addAll: nodes.
	"edges := RTEdge buildEdgesFromObjects: self from: #superclass to: #yourself using: (RTMultiLine new color: Color veryLightGray; width: 2; orthoVertical) scope: nodes."
	eb := RTEdgeBuilder new.
	eb view: view.
	eb objects: self.
	eb shape: (RTMultiLine new color: Color veryLightGray; width: 2; orthoVertical).
	edges := eb connectFrom: #superclass.
	view addAll: edges.
	nodes do: [ :each | 
		each @ RTDraggable.
		RTNest new on: each nest: {(each model viewBlueprintOn: view)}
		].

	edges do: [ :each | each shape withVerticallAttachPoint ].	
	RTTreeLayout new verticalGap: 40; on: nodes
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewSimpleSystemComplexityOn: b [ 
	"b is an instance of RTMondrian"
	
	| aRectangle |
	aRectangle := b shape rectangle
		height: [ :cls | [cls numberOfMethods max: 5] ifError: [0]];
		width: [ :cls | [cls numberOfAttributes max: 5] ifError: [0]];
		borderColor: Color lightGray.

	[aRectangle linearFillColor: #numberOfLinesOfCode within: self entities ] ifError: [].
	
	b interaction popupText.
	b interaction menu: [ :each | each mooseMenuMorph ].
	b nodes: self entities.
	[b edges connectFromAll: [ :cls | cls directSuperclasses] ] ifError: [ ].
	b layout tree 
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewSimpleSystemComplexityWithSelection: selectedClassGroup height: heightBlock width: widthBlock color: colorBlock on: view [
	view shape box
		height: heightBlock;
		width: widthBlock;
		borderColor: Color gray;
		if: [ :each | selectedClassGroup includes: each ] borderColor: Color red.
	view interaction menu: [ :each | each mooseMenuMorph ].
	view interaction draggable.
	view nodes: self entities.
	view interaction popup textElement: [ :e | e model printString ].
	view shape shape: RTLine new.
	view edges connectFrom: [:c | c superclass].
	view treeLayout.
	view normalizer
		normalizeColor: colorBlock
		using:
			{Color white.
			Color black}
	"view edges do: [ :e | e trachelShape pushBack ]."
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewSystemAttraction [
	<menuItem: 'System Attraction' category: 'Visualize'>
	| view |
	view := RTMondrian new.
	self viewSystemAttractionOn: view.
	^ view openWithToolbar title: 'System Attraction'
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewSystemAttractionHighlighting: strongClasses on: view [
	^ FAMIXSystemAttraction new view: self highlighting: strongClasses on: view
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewSystemAttractionOn: view [
	^ FAMIXSystemAttraction new view: self on: view
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewSystemComplexity [
	<menuItem: 'System complexity' category: 'Visualize'> 
	| b |
	b := RTMondrian new.
	self viewSimpleSystemComplexityOn: b.
	self addSystemComplexityLegendOn: b view.
	^ b openWithToolbar title: 'System Complexity'
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewSystemNestingMap [
	| view |
	view := RTView new.
	self viewSystemNestingMapOnRaw: view.
	view open
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewSystemNestingMapOnRaw: view [
	^ FAMIXSystemNestingMap new 
		viewNamespaces: (self mooseModel allNamespaces select: [:each | 
									each allClasses anySatisfy: [:c | c isStub not ]])
		highlighting: self 
		onRaw: view
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewTypeNestingGraphOn: view [
	view shape withoutBorder withText: #name.
	view nodes: self.
	self do: [:each |
		| visitor |
		visitor := FAMIXAttributesGraphTraverser new .
		each accept: visitor.
		view edges: visitor value graph nodes from: #model toAll: [:x | x nextNodes collect: #model] ].
	view horizontalDominanceTreeLayout.
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewUML [
	<menuItem: 'UML class diagram' category: 'Visualize'> 
	
	| view |
	view := RTUMLClassBuilder new.
	self viewUMLOn: view.
	^ view openWithToolbarEntitled: 'UML class diagram'
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewUMLOn: view [
	view
		addObjects: self;
		classname: #name;
		instanceVariables: #attributes;
		methodsNames: #methods;
		methodselector: #name;
		superclass: #superclass;
		treeLayout
]

{ #category : #'*Moose-RoassalPaintings' }
FAMIXTypeGroup >> viewWithinClusteredHierarchyOf: largerGroup on: view [
	"highlights the types from the current group within a clustered
	inheritance hierarchy of the largerGroup"
	| all selected |
	view shape ellipse 
		size: [ :each | (self includes: each) ifTrue: [ 100 ] ifFalse: [ 50 ] ]; 
		color: Color veryLightGray;
		if: [:each | self includes: each ] color: Color red.
	all := view nodes: largerGroup asSet, self.
	selected := (view view elements select: [ :each | self includes: each model ]).
	view edges connectFrom: #superclass.
	all do: #pushFront.
	selected do: #pushFront.
	view layout cluster.
	view build.
	view view canvas focusOnCenterScaled
]
