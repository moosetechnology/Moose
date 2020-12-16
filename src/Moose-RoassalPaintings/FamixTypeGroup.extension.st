Extension { #name : #FamixTypeGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> addSystemComplexityLegendOn: view [

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
FamixTypeGroup >> viewAnnotationConstellation [
	<menuItem: 'Annotation Constellation' category: 'Visualize'>
	| view |
	view := RTMondrian new.
	self viewAnnotationConstellationOn: view.
	^ view open setLabel: 'Annotation Constellation'
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewAnnotationConstellationOn: view [
	(FamixAnnotationTypeGroup withAll: (self flatCollectAsSet: #annotationTypes)) viewAnnotationConstellationOf: self on: view
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewBlueprintComplexity [
	<menuItem: 'Blueprint complexity' category: 'Visualize'>
	| canvas |
	canvas := RSCanvas new.
	canvas
		addAll:
			(self
				collect: [ :type | 
					| singleBlueprint |
					singleBlueprint := type blueprint asShape
						model: type;
						@ RSDraggable;
						yourself.
					"The following is a hack: after copying shapes from singleBlueprint, shapes are unaware of their connected edges."
					singleBlueprint edges
						do: [ :edge | 
							edge from addConnectedEdge: edge.
							edge to addConnectedEdge: edge ].
					singleBlueprint ]).
	RSEdgeBuilder line
		shapes: canvas nodes;
		color: Color veryLightGray;
		withVerticalAttachPoint;
		connectTo: [ :class | class superclass ].
	canvas pushBackEdges.
	RSTreeLayout new on: canvas nodes edges: canvas edges.
	canvas @ RSCanvasController.
	canvas open
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewSimpleSystemComplexityOn: b [ 
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
FamixTypeGroup >> viewSimpleSystemComplexityWithSelection: selectedClassGroup height: heightBlock width: widthBlock color: colorBlock on: view [
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
FamixTypeGroup >> viewSystemAttraction [
	<menuItem: 'System Attraction' category: 'Visualize'>
	| view |
	view := RTMondrian new.
	self viewSystemAttractionOn: view.
	^ view openWithToolbar title: 'System Attraction'
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewSystemAttractionHighlighting: strongClasses on: view [
	^ FAMIXSystemAttraction new view: self highlighting: strongClasses on: view
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewSystemAttractionOn: view [
	^ FAMIXSystemAttraction new view: self on: view
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewSystemComplexity [
	<menuItem: 'System complexity' category: 'Visualize'> 
	| b |
	b := RTMondrian new.
	self viewSimpleSystemComplexityOn: b.
	self addSystemComplexityLegendOn: b view.
	^ b openWithToolbar title: 'System Complexity'
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewSystemNestingMap [
<menuItem: 'Nesting Map' category: 'Visualize'> 
	| view |
	view := RTView new.
	self viewSystemNestingMapOnRaw: view.
	view open
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewSystemNestingMapOnRaw: view [
	^ FAMIXSystemNestingMap new
		viewNamespaces:
			(self mooseModel allNamespaces
				select:
					[ :each | (each allToScope: FamixTClass) anySatisfy: [ :c | c isStub not ] ])
		highlighting: self
		onRaw: view
]

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> viewWithinClusteredHierarchyOf: largerGroup on: view [
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
