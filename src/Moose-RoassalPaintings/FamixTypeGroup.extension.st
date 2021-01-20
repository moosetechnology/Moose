Extension { #name : #FamixTypeGroup }

{ #category : #'*Moose-RoassalPaintings' }
FamixTypeGroup >> addSystemComplexityLegendOn: aCanvas [
	| legend |
	legend := RSLegend new.
	legend container: aCanvas.
	legend onDemand.
	legend title: 'System complexity view'.
	legend text: 'Box = Class'.
	legend text: 'Line = Inheritance'.
	legend
		polymetricWidth: 'number of attributes'
		height: 'number of methods'
		box: 'a class'.
	legend
		text: 'Number of lines of code'
		withFadingRamp:
			{(0 -> 'white').
			(1 -> 'black')}.
	legend build
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
					singleBlueprint := type blueprint canvas asShape
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
	^ self systemComplexity openWithTitle: 'System Complexity'
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
