Class {
	#name : #RTLegendBuilderTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-Legend'
}

{ #category : #running }
RTLegendBuilderTest >> setUp [
	super setUp.
	b := RTLegendBuilder new.
	b addText: 'Hapao show the coverage on which you have run it'.
	b addText: 'Big box = classes. Green classes are unit tests'.
	b addText: 'Inner box = method'.
	b addText: 'height = number of lines of code of '.
	b addText: 'width = number of methods that call it'.
	b addText: 'edge = static call between methods. Above calls below'.
	b addColor: Color black text: 'Method well tested'.
	b addColor: Color gray text: 'Method tested'.
	b addColor: Color red text: 'Method not tested'.
	b build
]

{ #category : #tests }
RTLegendBuilderTest >> testAddObjectText [

	| lb |
	lb := RTLegendBuilder new.
	lb addObject: 'hello world' text: [ :str | str substrings first ].
	lb build.
	
	self assert: lb view numberOfElements equals: 2.
	self assert: lb view elements second model equals: 'hello world'.
	self assert: (lb view elements second shape textFor: lb view elements second) equals: 'hello'.
]

{ #category : #tests }
RTLegendBuilderTest >> testBelow [

	| view element lb |
	view := RTView new.
	element := (RTEllipse new size: 30) element.
	view add: element.

	lb := RTLegendBuilder new.
	lb view: view.
	lb below.
	lb addText: 'Hello world'.
	lb build.
	
	self assert: view numberOfElements equals: 3.
	self assert: view elements first shape class == RTEllipse.
	self assert: view elements third shape class == RTLabel.
	self assert: view elements first position y < view elements third position y.
]

{ #category : #tests }
RTLegendBuilderTest >> testColorNotNil [

	self should: [ RTColorLegendItem new color: nil ] raise: Error.
	self shouldnt: [ RTColorLegendItem new color: Color red ] raise: Error
]

{ #category : #tests }
RTLegendBuilderTest >> testEdgesWhenOnDemand [

	| v  lb lbl allElements edges |
	v := RTView new.
	v @ RTDraggableView.

	lb := RTLegendBuilder new.
	lb view: v.
	lb onDemand.
	
	lb addRectanglePolymetricWidth: 'number of methods' height: 'Line of code' box: 'a Pharo class'.

	lb build.

	self assert: v canvas fixedShapes size equals: 1.
	
	lbl := v canvas fixedShapes first.
	allElements := lb group flatCollect: #yourself.
	edges := allElements select: [ :e | e class == RTEdge ].
	self assert: edges size equals: 2.
	self assert: (allElements includes: edges first from).
	self assert: (allElements includes: edges first to).
]

{ #category : #tests }
RTLegendBuilderTest >> testLayout [
	
	| firstInnerElement secondInnerElement |
	firstInnerElement := b view elements second.
	secondInnerElement := b view elements third.
	"First element is above second element"
	self assert: firstInnerElement position y < secondInnerElement position y
]

{ #category : #tests }
RTLegendBuilderTest >> testLegendElement [

	| lb |
	lb := RTLegendBuilder new.
	lb addLineColor: Color red text: 'Meaning of this great red line'.
	lb build.
	
	self assert: lb view elements first equals: lb legendElement

]

{ #category : #tests }
RTLegendBuilderTest >> testNumberOfElements [

	self assert: b view numberOfElements equals: 13
]

{ #category : #tests }
RTLegendBuilderTest >> testPolymorphicViewArrows [

	
	| lb view canvas |
	lb := RTLegendBuilder new.
	lb setAsFixed.
	lb addText: 'System complexity view'.
	lb addRectanglePolymetricWidth: 'number of methods' height: 'Line of code' box: 'a Pharo class'.
	lb addColorFadingFrom: Color black to: Color red text: 'number of lines of code'.
	lb build.
	
	view := lb view.
	self assert: (view elements select: [ :el | el trachelShape isNotFixed ]) isEmpty.
	self assert: (view edges select: [ :el | el trachelShape isNotFixed ]) isEmpty.
	
	canvas := view canvas.
	self assert: canvas numberOfShapes equals: 0
]

{ #category : #tests }
RTLegendBuilderTest >> testRight [

	| view element lb |
	view := RTView new.
	element := (RTEllipse new size: 30) element.
	view add: element.

	lb := RTLegendBuilder new.
	lb view: view.
	lb right.
	lb addText: 'Hello world'.
	lb build.
	
	self assert: view numberOfElements equals: 3.
	self assert: view elements first shape class == RTEllipse.
	self assert: view elements third shape class == RTLabel.
	self assert: view elements first position x < view elements third position x.
]

{ #category : #tests }
RTLegendBuilderTest >> testaddColorFading [

	| lb |
	lb := RTLegendBuilder new.
	lb addColorFadingFrom: Color green to: Color black text: 'this is a test'.
	lb build.
	
	self assert: lb view numberOfElements equals: 52.

]

{ #category : #tests }
RTLegendBuilderTest >> testaddColorFading02 [

	| lb |
	lb := RTLegendBuilder new.
	lb addColorFadingUsing: RTPalette c1 text: 'this is a test'.
	lb build.
	
	self assert: lb view numberOfElements equals: 52.

]

{ #category : #tests }
RTLegendBuilderTest >> testaddColoredtext [

	| lb |
	lb := RTLegendBuilder new.
	lb addColoredText: 'hello' color: Color red.
	lb build.
	
	self assert: lb view numberOfElements equals: 2.
	self assert: lb view canvas shapes first class equals: TRBoxShape.
	self assert: lb view canvas shapes second class equals: TRLabelShape.
	self assert: lb view canvas shapes second color equals: Color red.
]

{ #category : #tests }
RTLegendBuilderTest >> testaddLineColortext [

	| lb |
	lb := RTLegendBuilder new.
	lb addLineColor: Color red text: 'Meaning of this great red line'.
	lb build.
	
	self assert: lb view numberOfElements equals: 3.

]
