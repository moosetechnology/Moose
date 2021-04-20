"
The MooseVisualLocator is a simple template that offers a list of classes on the left hand side and some presentation on the right hand side. It is meant to be subclassed.
"
Class {
	#name : #MooseVisualLocator,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #building }
MooseVisualLocator >> browserTitle [
	browser title: 'System Complexity Locator'
]

{ #category : #building }
MooseVisualLocator >> buildBrowser [
	browser := GLMTabulator withStatusbar.
	self browserTitle.
	browser
		column: #classes;
		column: #map span: 4.
	(browser transmit)
		to: #classes;
		andShow: [ :a | self classesIn: a ].
	(browser transmit)
		to: #map;
		fromOutsidePort: #entity;
		from: #classes port: #selection transformed: [ :group | group asMooseGroup ];
		andShow: [ :a | self mapIn: a ].
	(browser transmit)
		fromOutsidePort: #classesToSelect;
		to: #classes port: #selection.
	^ browser
]

{ #category : #building }
MooseVisualLocator >> classesIn: a [

	"Ideally, we should implement it like below, but somehow the original selection is not set properly
	a dynamic 
		display: [:group |
			| composite | 
			composite := GLMCompositePresentation new.
			group mooseFinderListIn: composite.			
			group mooseFinderEvaluatorIn: composite.
			composite ]"

	a list
		icon: #mooseIcon;
		title: [ :each | 
			each mooseInterestingEntity size asString , ' items' ];
		titleIcon: MooseIcons mooseList;
		beMultiple;
		searchOn: [ :text :each | 
			Smalltalk compiler
				evaluate: ' | entity each | each := self. entity := each.' , text
				for: each
				logged: false ];
		showOnly: 50;
		format: #displayString;
		dynamicActionsOnSelection: [ :list | 
			list selection mooseInterestingEntity mooseFinderActions ];
		dynamicActions: [ :list | 
			list entity mooseInterestingEntity mooseFinderActions ].
	^ a pharoScript
		  display: [ :entity | 'self' ];
		  title: 'Evaluator';
		  titleIcon: MooseIcons mooseEvaluator;
		  selectionPopulate: #selection
		  on: $o
		  entitled: 'Open script (o)'
		  with: [ :text :entity | 
			  Smalltalk compiler
				  evaluate: text selectedText
				  for: entity mooseInterestingEntity
				  logged: false ];
		  selectionAct: [ :text :entity | 
			  (Smalltalk compiler
				   evaluate: text selectedText
				   for: entity mooseInterestingEntity
				   logged: false) inspect ]
		  on: $/ entitled: 'Inspect script (/)'
]

{ #category : #building }
MooseVisualLocator >> mapIn: a [
	self subclassResponsibility
]
