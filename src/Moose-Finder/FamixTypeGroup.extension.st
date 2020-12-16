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
