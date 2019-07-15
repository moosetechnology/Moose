Extension { #name : #FamixType }

{ #category : #'*Roassal2-FamixNGCompatibility' }
FamixType >> addBlueprintLegendOn: view [

	| lb |
	lb := RTLegendBuilder new.
	lb onDemand.
	lb view: view.

	lb addColoredText: 'Class Blueprint' color: Color black.
	lb addText: 'large box = class'.
	lb addText: 'Each class is composed of 5 part, from left to right'.
	lb addText: '  constructor, public methods, private methods, accessors, variables'.
	lb addLineColor: Color cyan text: 'variable access'.
	lb addLineColor: Color gray text: 'method invocation'.
	lb addColor: Color red text: 'Setter'.
	lb addColor: Color orange text: 'Getter'.
	lb addColor: Color cyan text: 'Abstract'.
	lb addColor: Color brown text: 'Overriding'.
	lb addColor: Color gray text: 'Constant'.
	lb build.
]

{ #category : #'*Roassal2-FamixNGCompatibility' }
FamixType >> mooseFinderBlueprintIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2 
			title: 'Blueprint';
			titleIcon: MooseIcons mooseBlueprint;
			painting: [ :view :each | 
				view @ RTDraggableView.
				each mooseInterestingEntity viewBlueprintOn: view.
				self addBlueprintLegendOn: view.
 ]
]

{ #category : #'*Roassal2-FamixNGCompatibility' }
FamixType >> mooseFinderHierarchyIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Hierarchy';
			titleIcon: MooseIcons mooseSystemComplexity;
			initializeView: [ RTMondrian new ];
			painting: [ :b | self viewHierarchyOn: b ]
]

{ #category : #'*Roassal2-FamixNGCompatibility' }
FamixType >> viewBlueprint [
	<menuItem: 'Class blueprint' category: 'Visualize'>
	| view |
	view := RTView new.
	view @ RTDraggableView.
	self viewBlueprintOn: view.
	^ view open
]

{ #category : #'*Roassal2-FamixNGCompatibility' }
FamixType >> viewUML [
	<menuItem: 'UML class diagram' category: 'Visualize'> 
	
	| view |
	view := RTUMLClassBuilder new.
	self viewUMLOn: view.
	^ view openWithToolbarEntitled: 'UML class diagram'
]

{ #category : #'*Roassal2-FamixNGCompatibility' }
FamixType >> viewUMLOn: view [

	view
		addObjects: {self};
		classname: #name;
		instanceVariables: #attributes;
		methodsNames: #methods;
		methodselector: #name;
		superclass: nil
]
