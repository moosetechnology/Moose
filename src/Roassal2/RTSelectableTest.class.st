Class {
	#name : #RTSelectableTest,
	#superclass : #RTTest,
	#instVars : [
		'selectedElements',
		'view',
		'selectable'
	],
	#category : #'Roassal2-Core-Tests'
}

{ #category : #running }
RTSelectableTest >> setUp [
	| b |
	super setUp.
	b := RTMondrian new.
	b nodes: Collection withAllSubclasses.
	b layout flow.
	b normalizer 
		normalizeSize: #numberOfMethods.
	b build.	
	selectedElements := #().
	selectable := RTSelectable new selectionCallback: [ :es | selectedElements := es ].
	b view elements @ selectable.
	
	view := b view.
	
	
]

{ #category : #tests }
RTSelectableTest >> testClickOn [

	| e |
	e := view elements first.
	self assert: e trachelShape color ~= Color red.
	selectable clickOn: e.
	self assert: e trachelShape color equals: Color red.
]

{ #category : #tests }
RTSelectableTest >> testClickOnTwice [

	| e |
	e := view elements first.
	selectable clickOn: e.
	selectable clickOn: e.
	self assert: e trachelShape color ~= Color red.

]

{ #category : #tests }
RTSelectableTest >> testSelectable [
	| e |
	self assert: selectedElements isEmpty.
	e := RTElement new.
	self assert: (selectable selectionCallback value: e) equals: e
]
