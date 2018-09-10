Extension { #name : #FAMIXType }

{ #category : #'*Moose-Finder' }
FAMIXType >> addBlueprintLegendOn: view [

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

{ #category : #'*Moose-Finder' }
FAMIXType >> mooseFinderAttributesIn: composite [
	<moosePresentationOrder: 20>
	composite table
			title: 'Attributes';
			titleIcon: MooseIcons famixAttributeGroup;
			display: [ self attributes ];
			column: 'Name' evaluated: #name;
			column: 'Declared type' evaluated: [ :each | each declaredType gtDisplayString ];
			column: 'Modifiers' evaluated: [ '' ] tags: #modifiers;
			when: [ self attributes notEmpty ];
			selectionPopulate: #selection  
				entitled: 'Open declared type' 
				with:  [ :table | table selection declaredType ]
]

{ #category : #'*Moose-Finder' }
FAMIXType >> mooseFinderBlueprintIn: composite [
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

{ #category : #'*Moose-Finder' }
FAMIXType >> mooseFinderHierarchyIn: composite [
	<moosePresentationOrder: 20>
	composite roassal2
			title: 'Hierarchy';
			titleIcon: MooseIcons mooseSystemComplexity;
			initializeView: [ RTMondrian new ];
			painting: [ :b | self viewHierarchyOn: b ]
]

{ #category : #'*Moose-Finder' }
FAMIXType >> mooseFinderMethodsIn: composite [
	<moosePresentationOrder: 20>
	composite table
			title: 'Methods';
			titleIcon: MooseIcons famixMethodGroup;
			display: [ self methods ];
			column: 'Name' evaluated: #signature;
			column: 'Declared type' evaluated: [ :each | each declaredType gtDisplayString ];
			when: [ self methods notEmpty ];
			selectionPopulate: #selection  
				entitled: 'Open declared type' 
				with:  [ :table | table selection declaredType ]
]
