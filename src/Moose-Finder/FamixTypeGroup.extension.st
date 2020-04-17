Extension { #name : #FamixTypeGroup }

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> browseAsSelectionInSystemComplexityLocator [
	<menuItem: 'As selection within system complexity' category: 'Browse'> 
	MooseSystemComplexityLocator openOn: self mooseModel allModelClasses withSelection: self
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseFinderComplexityIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Hierarchy';
			titleIcon: MooseIcons mooseSystemComplexity;
			initializeView: [ RTMondrian new ];
			painting: [ :b :each | 
				each mooseInterestingEntity viewSimpleSystemComplexityOn: b.
				self addSystemComplexityLegendOn: b view ]

]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> mooseFinderUMLIn: composite [
    <moosePresentationOrder: 20>
    composite roassal2
			title: 'UML';
			titleIcon: MooseIcons mooseUml;
			initializeView: [ RTUMLClassBuilder new ];
			painting: [ :view :each | each viewUMLOn: view ]
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
FamixTypeGroup >> viewSystemComplexityInWizard [
	<menuItem: 'Customizable System Complexity' category: 'Visualize'>
	self isEmpty ifTrue: [ ^ self ].
	^ MooseCustomizableSystemComplexityBrowser
		openOnClassGroup: self
		heightToSelect: #numberOfMethods
		widthToSelect: #numberOfAttributes
		colorToSelect: #numberOfLinesOfCode
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewUML [
	<menuItem: 'UML class diagram' category: 'Visualize'> 
	
	| view |
	view := RTUMLClassBuilder new.
	self viewUMLOn: view.
	^ view openWithToolbarEntitled: 'UML class diagram'
]

{ #category : #'*Moose-Finder' }
FamixTypeGroup >> viewUMLOn: view [
	view
		addObjects: self;
		classname: #name;
		instanceVariables: #attributes;
		methodsNames: #methods;
		methodselector: #name;
		superclass: #superclass;
		treeLayout
]
