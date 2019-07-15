Extension { #name : #FAMIXTypeGroup }

{ #category : #'*Moose-Finder' }
FAMIXTypeGroup >> browseAsSelectionInSystemComplexityLocator [
	<menuItem: 'As selection within system complexity' category: 'Browse'> 
	MooseSystemComplexityLocator openOn: self mooseModel allModelClasses withSelection: self
]

{ #category : #'*Moose-Finder' }
FAMIXTypeGroup >> mooseFinderComplexityIn: composite [
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
FAMIXTypeGroup >> mooseFinderUMLIn: composite [
    <moosePresentationOrder: 20>
    composite roassal2
			title: 'UML';
			titleIcon: MooseIcons mooseUml;
			initializeView: [ RTUMLClassBuilder new ];
			painting: [ :view :each | each viewUMLOn: view ]
]

{ #category : #'*Moose-Finder' }
FAMIXTypeGroup >> mooseFinderWithinNestedMapIn: composite [
	<moosePresentationOrder: 30>
	composite roassal2
			title: 'Nesting';
			titleIcon: MooseIcons mooseTreeMap;
			painting: [ :view :each | 
				each mooseInterestingEntity viewSystemNestingMapOnRaw: view ]

]

{ #category : #'*Moose-Finder' }
FAMIXTypeGroup >> mooseIcon [
	^ MooseIcons famixClassGroup 
]

{ #category : #'*Moose-Finder' }
FAMIXTypeGroup >> viewSystemComplexityInWizard [
	<menuItem: 'Customizable System Complexity' category: 'Visualize'>
	self isEmpty ifTrue: [ ^ self ].
	^ MooseCustomizableSystemComplexityBrowser 
					openOnClassGroup: self
					heightToSelect: #numberOfMethods
					widthToSelect: #numberOfAttributes
					colorToSelect: #numberOfLinesOfCode
]
