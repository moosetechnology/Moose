Extension { #name : #FamixTypeGroup }

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> browseAsSelectionInSystemComplexityLocator [
	<menuItem: 'As selection within system complexity' category: 'Browse'> 
	MooseSystemComplexityLocator openOn: self mooseModel allModelClasses withSelection: self
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseFinderComplexityIn: composite [
	<moosePresentationOrder: 20>
	composite roassal3
		title: 'Hierarchy';
		titleIcon: MooseIcons mooseSystemComplexity;
		initializeCanvas: [ self systemComplexity ]
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseFinderUMLIn: composite [
    <moosePresentationOrder: 20>
    composite roassal3
			title: 'UML';
			titleIcon: MooseIcons mooseUml;
			initializeCanvas: [ self uml ]
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseFinderWithinNestedMapIn: composite [
	<moosePresentationOrder: 30>
	composite roassal2
			title: 'Nesting';
			titleIcon: MooseIcons mooseTreeMap;
			painting: [ :view :each | 
				each mooseInterestingEntity viewSystemNestingMapOnRaw: view ]

]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseIcon [
	^ MooseIcons famixClassGroup 
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> systemComplexity [
	| canvas |
	canvas := RSCanvas new.
	canvas
		addAll:
			(self entities
				collect: [ :type | 
					RSBox new
						model: type;
						borderColor: Color lightGray;
						popup ]).
	RSNormalizer height
		shapes: canvas shapes;
		normalize: [ :type | type numberOfMethods max: 5 ].
	RSNormalizer width
		shapes: canvas shapes;
		normalize: [ :type | type numberOfAttributes max: 5 ].
	RSNormalizer color
		from: Color white;
		to: Color black;
		shapes: canvas shapes;
		normalize: #numberOfLinesOfCode.
	RSEdgeBuilder line
		shapes: canvas shapes;
		withVerticalAttachPoint;
		connectToAll: #directSuperclasses.
	canvas pushBackEdges.
	RSTreeLayout new on: canvas shapes edges: canvas edges.
	self addSystemComplexityLegendOn: canvas.
	canvas @ RSCanvasController.
	^ canvas
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> uml [
	| builder |
	builder := RSUMLClassBuilder new.
	builder classes: self.
	builder modelDescriptor
		instVars: #attributes;
		methodSelector: #name.
	builder build.
	^ builder canvas
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewSystemComplexityInWizard [
	<menuItem: 'Customizable System Complexity' category: 'Visualize'>
	self ifEmpty: [ ^ self ].
	^ MooseCustomizableSystemComplexityBrowser
		openOnClassGroup: self
		heightToSelect: #numberOfMethods
		widthToSelect: #numberOfAttributes
		colorToSelect: #numberOfLinesOfCode
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewUML [
	<menuItem: 'UML class diagram' category: 'Visualize'>
	^ self uml openWithTitle: 'UML class diagram'
]
