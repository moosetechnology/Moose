Extension { #name : #Object }

{ #category : #'*Moose-Finder' }
Object >> mooseBrowse [
	<menuItem: 'Browse implementation class' category: 'Utilities'>
	Smalltalk isInteractive ifTrue: [ self browse ]
]

{ #category : #'*Moose-Finder' }
Object >> mooseFinderActions [
	| categorized simple all first second |
	all := self class withAllSuperclasses
		flatCollect: [ :eachClass | 
			categorized := (Pragma allNamed: #menuItem:category: in: eachClass)
				collect: [ :eachPragma | 
					GLMGenericAction new
						action: [ :x | self perform: eachPragma methodSelector ];
						title: (eachPragma argumentAt: 1);
						category: (eachPragma argumentAt: 2) ].
			simple := (Pragma allNamed: #menuItem: in: eachClass)
				collect: [ :eachPragma | 
					GLMGenericAction new
						action: [ :x | self perform: eachPragma selector ];
						title: (eachPragma argumentAt: 1) ].
			categorized , simple ].
	^ all
		asSortedCollection: [ :a :b | 
			first := a isCategorized
				ifTrue: [ a category , a title ]
				ifFalse: [ a title ].
			second := b isCategorized
				ifTrue: [ b category , b title ]
				ifFalse: [ b title ].
			first < second ]
]

{ #category : #'*Moose-Finder' }
Object >> mooseFinderEvaluatorIn: composite [
	<moosePresentationOrder: 100>
	composite pharoScript
		display: [ GTSnippets snippetAt: self mooseInterestingEntity class ];
		title: 'Evaluator';
		titleIcon: MooseIcons mooseEvaluator;
		doItReceiver: [ self mooseInterestingEntity ];
		installDefaultSelectionActions;
		selectionPopulate: #selection
			on: $g
			entitled: 'Do it and go'
			with: [ :text :entity1 | 
				text selectLine.
				GTSnippets
					snippetAt: self mooseInterestingEntity class
					put: text text asString.
				Smalltalk compiler
					source: text selectedText;
					logged: false;
					receiver: self mooseInterestingEntity;
					evaluate ]
]

{ #category : #'*Moose-Finder' }
Object >> mooseFinderMetaIn: composite [
	<moosePresentationOrder: 1000>
	(self mooseInterestingEntity gtInspectorMetaIn: composite)
		titleIcon: MooseIcons mooseMethodsBrowser
]

{ #category : #'*Moose-Finder' }
Object >> mooseFinderPresentationsIn: composite [
	| pragmas |
	pragmas := Pragma 
				allNamed: #moosePresentationOrder: 
				from: self class 
				to: Object 
				sortedUsing: [: x :y | (x argumentAt: 1) < (y argumentAt: 1)].
	pragmas do: [ :eachPragma | 
		self perform: eachPragma selector with: composite ]

]

{ #category : #'*Moose-Finder' }
Object >> mooseFinderPresentationsIn: composite inContext: aMooseFinder [
	| pragmas |
	pragmas := Pragma
		allNamed: #moosePresentationOrder:
		from: self class
		to: Object
		sortedUsing: [ :x :y | (x argumentAt: 1) < (y argumentAt: 1) ].
	pragmas
		do: [ :eachPragma | 
			(eachPragma methodSelector findTokens: $:) size = 1
				ifTrue: [ self perform: eachPragma methodSelector with: composite ].
			(eachPragma methodSelector findTokens: $:) size = 2
				ifTrue: [ self
						perform: eachPragma methodSelector
						with: composite
						with: aMooseFinder ] ]
]

{ #category : #'*Moose-Finder' }
Object >> mooseIcon [
	^ Form extent: 16@16 
]

{ #category : #'*Moose-Finder' }
Object >> mooseInspect [
	<menuItem: 'In Inspector' category: 'Browse'>
	Smalltalk isInteractive ifTrue: [ self inspect ]
]

{ #category : #'*Moose-Finder' }
Object >> openInMoose [
	<menuItem: 'In Moose Finder' category: 'Browse'>
	^ MooseFinder new first openOn: self
]
