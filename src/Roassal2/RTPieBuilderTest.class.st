Class {
	#name : #RTPieBuilderTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-PieChart'
}

{ #category : #tests }
RTPieBuilderTest >> testExample [

	| b es |
	b := RTPieBuilder new.
	b interaction popup.
	b objects: (Array with: Dictionary with: Collection with: Set with: OrderedCollection ).
	es := b slice: #numberOfMethods.
	b normalizer distinctColor.	
	b labeled.
	b emphasize: Set by: 20.
	b emphasize: Dictionary by: 20.
	b build.
	
	self assert: es size equals: 4
]

{ #category : #tests }
RTPieBuilderTest >> testExample02 [

	| c g ds b data |
	data := #(20 30 50 100).

	c := RTComposer new.

	"First visualization"
	g := RTGrapher new.
	g extent: 200 @ 200.
	g view: c view.
	ds := RTData new.
	ds interaction popup.
	ds barShape color: Color blue.
	ds points: data.
	g add: ds.
	g axisX noTick; noLabel.
	g build.
	c group: #graph.

	"Second visualization"
	b := RTPieBuilder new.
	b view: c view.
	b interaction popup.
	b objects: data.
	b slice: #yourself.
	b normalizer distinctColor.	
	b labeled.
	b build.
	c group: #pie.

	"Layouting"
	c move: #graph onTheLeftOf: #pie.

	c view
]
