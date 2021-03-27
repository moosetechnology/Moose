"
self openOn: MooseModel root allModels last allModelClasses
"
Class {
	#name : #MooseSystemComplexityLocator,
	#superclass : #MooseVisualLocator,
	#category : #'Moose-Finder'
}

{ #category : #'as yet unclassified' }
MooseSystemComplexityLocator class >> openOn: aGroup withSelection: anotherGroup [
	| browser |
	browser := self new browser.
	browser openOn: aGroup.
	(browser pane port: #classesToSelect) value: anotherGroup
]

{ #category : #building }
MooseSystemComplexityLocator >> mapIn: a [
	^ a roassal2
		title: [ :allClasses :selectedClasses | 
			'System Complexity with ' , selectedClasses size asString
				, ' selected classes' ];
		initializeView: [ RTMondrian new ];
		dynamicActions:
				[ :mondrian | mondrian entity second mooseInterestingEntity mooseFinderActions ];
		painting: [ :view :allClasses :selectedClasses | 
			allClasses specialize "reject: [ :each | each isInterface ]"
				viewSimpleSystemComplexityWithSelection: selectedClasses
				height: #numberOfMethods
				width: #numberOfAttributes
				color: #numberOfLinesOfCode
				on: view	 ]
]
