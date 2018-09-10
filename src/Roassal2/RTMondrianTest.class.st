Class {
	#name : #RTMondrianTest,
	#superclass : #RTTest,
	#instVars : [
		'b'
	],
	#category : #'Roassal2-Builder-Mondrian'
}

{ #category : #running }
RTMondrianTest >> setUp [
	super setUp.
	b := RTMondrian new.
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testBasic [
	| pos someNodes |
	someNodes := b nodes: (1 to: 5).
	b applyLayout.
	
	pos := b view canvas shapes collect: #position.
	self assert: pos asArray equals: ((Array new: 5) at: 1 put: ((2.5@2.5)); at: 2 put: ((17.5@2.5)); at: 3 put: ((32.5@2.5)); at: 4 put: ((47.5@2.5)); at: 5 put: ((62.5@2.5)); yourself).
	
	self assert: someNodes equals: b view elements
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testBasic2 [
	| someNodes |
	someNodes := b nodes: (1 to: 5).
	b build.
	
	self assert: b view numberOfElements equals: 5
]

{ #category : #'tests - edges' }
RTMondrianTest >> testBasicEdges [

	b nodes: #(1 2).
	b edges
		connectTo: [ :v | v + 1 ].
	b build.
	
	self assert: b view edges size equals: 1
]

{ #category : #'tests - edges' }
RTMondrianTest >> testBasicEdgesAndTree [

	b nodes: #(1 2).
	b edges
		connectTo: [ :v | v + 1 ].
	b layout tree.
	b build.
	
	self assert: b view edges size equals: 1
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testBasicWithNesting [
	| result pos |
	b nodes: (1 to: 2) forEach: [ :nb | 
		b shape rectangle color: Color red.
		b nodes: (1 to: 3) ].

	b applyLayout.
	
	result := ((Array new: 8) at: 1 put: ((22.5@7.5)); at: 2 put: ((77.5@7.5)); at: 3 put: ((8.0@8.0)); at: 4 put: ((23.0@8.0)); at: 5 put: ((38.0@8.0)); at: 6 put: ((63.0@8.0)); at: 7 put: ((78.0@8.0)); at: 8 put: ((93.0@8.0)); yourself).
	
	pos := b view canvas shapes collect: #position.
	self assert: pos asArray equals: result
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testBasicWithNestingAndDifferentSizeOfInner [
	| result pos |
	b nodes: (1 to: 2) forEach: [ :nb | 
		b shape rectangle 
			size: [ :aValue | aValue * 5 ];
			color: Color red.
		b nodes: (1 to: 3).
		b layout grid ].

	b applyLayout.
		
	result := ((Array new: 8) at: 1 put: ((15.0@20.0)); at: 2 put: ((55.0@20.0)); at: 3 put: ((7.5@7.5)); at: 4 put: ((20.0@10.0)); at: 5 put: ((12.5@27.5)); at: 6 put: ((47.5@7.5)); at: 7 put: ((60.0@10.0)); at: 8 put: ((52.5@27.5)); yourself).
	
	pos := b view canvas shapes collect: #position.
	self assert: pos asArray equals: result
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testBasicWithNestingAndGridLayout [
	| result pos |
	b nodes: (1 to: 2) forEach: [ :nb | 
		b shape rectangle color: Color red.
		b nodes: (1 to: 3).
		b layout grid ].

	b build.
	
	result := ((Array new: 8) at: 1 put: ((12.5@12.5)); at: 2 put: ((47.5@12.5)); at: 3 put: ((8.0@8.0)); at: 4 put: ((18.0@8.0)); at: 5 put: ((8.0@18.0)); at: 6 put: ((43.0@8.0)); at: 7 put: ((53.0@8.0)); at: 8 put: ((43.0@18.0)); yourself).
	
	pos := b view canvas shapes collect: #position.
	self assert: pos asArray equals: result
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testBasicWithNestingAndNesting [
	| result pos |
	b nodes: (1 to: 2) forEach: [ :nb | 
		b shape rectangle color: Color red.
		b nodes: (1 to: 3) forEach: [ :nb2 |
			b shape rectangle color: Color blue.
		b nodes: (1 to: 3) 
		].
		b layout grid ].

	b build.

	result := ((Array new: 26) at: 1 put: ((52.5@22.5)); at: 2 put: ((167.5@22.5)); at: 3 put: ((28.0@13.0)); at: 4 put: ((78.0@13.0)); at: 5 put: ((28.0@33.0)); at: 6 put: ((13.5@13.5)); at: 7 put: ((28.5@13.5)); at: 8 put: ((43.5@13.5)); at: 9 put: ((63.5@13.5)); at: 10 put: ((78.5@13.5)); at: 11 put: ((93.5@13.5)); at: 12 put: ((13.5@33.5)); at: 13 put: ((28.5@33.5)); at: 14 put: ((43.5@33.5)); at: 15 put: ((143.0@13.0)); at: 16 put: ((193.0@13.0)); at: 17 put: ((143.0@33.0)); at: 18 put: ((128.5@13.5)); at: 19 put: ((143.5@13.5)); at: 20 put: ((158.5@13.5)); at: 21 put: ((178.5@13.5)); at: 22 put: ((193.5@13.5)); at: 23 put: ((208.5@13.5)); at: 24 put: ((128.5@33.5)); at: 25 put: ((143.5@33.5)); at: 26 put: ((158.5@33.5)); yourself).
	
	pos := b view canvas shapes collect: #position.
	self assert: pos asArray equals: result
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testColor [

	| view |
	b node: 1.
	b shape rectangle.
	b node: 2.
	b build.
	view := b view.

	self assert: view elements first trachelShape color equals: view elements second trachelShape color
]

{ #category : #'tests - edges' }
RTMondrianTest >> testConnectFromTo [

	b := RTMondrian new.
	b nodes: #(1 2).
	b edges allowRepetition; connectFrom: 1 to: 2.

	b build.
	
	"We have two edges because of the repetition"
	self assert: b view numberOfEdges equals: 2
]

{ #category : #'tests - edges' }
RTMondrianTest >> testConnectFromToNoRepetition [

	b := RTMondrian new.
	b nodes: #(1 2).
	b edges noRepetition; connectFrom: 1 to: 2.

	b build.
	
	"We have two edges because of the repetition"
	self assert: b view numberOfEdges equals: 1
]

{ #category : #'tests - frames' }
RTMondrianTest >> testDefaultFrameDepth [

	self assert: b rootFrame depth equals: 1.
]

{ #category : #'tests - frames' }
RTMondrianTest >> testDefaultFrames [

	self assert: b numberOfAllFrames equals: 1.
]

{ #category : #'tests - frames' }
RTMondrianTest >> testDefaultRootFrameAndCurrentFrame [

	self assert: b rootFrame equals: b currentFrame
]

{ #category : #'tests - edges' }
RTMondrianTest >> testEdgeInInnerFrame [

	b node: '1'
		forIt: [ 
			b nodes: (1 to: 2).
			b edges connectFrom: #yourself.
			b layout verticalLine ].
	b node: '2'
		forIt: [ 
			b nodes: (3 to: 4).
			b layout tree ].
	b layout horizontalLine.
	b build
]

{ #category : #'tests - edges' }
RTMondrianTest >> testEdgeInInnerFrame2 [

	b node: '1'
		forIt: [ 
			b shape rectangle.
			b nodes: (1 to: 2).
			b shape line color: Color red.
			b edges connectFrom: #yourself.
			b layout verticalLine ].
	b build.
	
	self assert: b view numberOfEdges equals: 0.
]

{ #category : #'tests - edges' }
RTMondrianTest >> testEdgeInInnerFrame3 [

	b node: '1'
		forIt: [ 
			b shape rectangle.
			b nodes: (1 to: 2).
			b shape line color: Color red.
			b edges connectTo: [ :v | v + 1 ].
			b layout verticalLine ].
	b build.
	
	self assert: b view numberOfEdges equals: 1.
	self assert: b view edges anyOne trachelShape from equals: (8.0 @ 7.5).
	self assert: b view edges anyOne trachelShape to equals: (8.0 @ 22.5).
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testExampleNodes [

	b node: '1'
		forIt: [ 
			b shape rectangle.
			b nodes: (1 to:2).
			b layout verticalLine ].
	b node: '2'
		forIt: [ 
			b shape circle
				size: 10;color:Color green.
			b nodes: (3 to:4).
			b layout tree ].
	b layout horizontalLine.
	b build.
	
	self assert: (b view canvas shapes collect: #position) asArray equals: ((Array new: 6) at: 1 put: ((7.5@15.0)); at: 2 put: ((8.0@7.5)); at: 3 put: ((8.0@22.5)); at: 4 put: ((41.5@10.0)); at: 5 put: ((35.5@10.0)); at: 6 put: ((48.5@10.0)); yourself)
	
]

{ #category : #'tests - frames' }
RTMondrianTest >> testFramesWithNestingNesting [

	b nodes: (1 to: 1) forEach: [ :nb | 
		b nodes: (2 to: 2) forEach: [ :nb2 |
		   b nodes: (3 to: 3) ] ].
	b build.
	
	"Checking the children links"
	self assert: b numberOfAllFrames equals: 3.
	self assert: b rootFrame numberOfChildrenFrames equals: 1.
	self assert: b rootFrame childrenFrames first numberOfChildrenFrames equals: 1.
	self assert: b rootFrame childrenFrames first childrenFrames first numberOfChildrenFrames equals: 0.
	
	"Checking the parent links"
	self assert: b rootFrame childrenFrames first parentFrame equals: b rootFrame.
	self assert: b rootFrame childrenFrames first childrenFrames first parentFrame equals: b rootFrame childrenFrames first.
	
	"Checking the number of elements"
	self assert: b rootFrame numberOfElements equals: 1.
	self assert: b rootFrame childrenFrames first numberOfElements equals: 1.
	self assert: b rootFrame childrenFrames first childrenFrames first numberOfElements equals: 1.
	
	"Checking the depth"
	self assert: b rootFrame depth equals: 1.
	self assert: b rootFrame childrenFrames first depth equals: 2.
	self assert: b rootFrame childrenFrames first childrenFrames first depth equals: 3.

]

{ #category : #'tests - frames' }
RTMondrianTest >> testFramesWithNestingNesting2 [

	b nodes: (1 to: 1) forEach: [ :nb | 
		b nodes: (1 to: 2) forEach: [ :nb2 |
		   b nodes: (1 to: 3) ] ].
	b build.
	
	"Checking the children links"
	self assert: b numberOfAllFrames equals: 4.
	self assert: b rootFrame numberOfChildrenFrames equals: 1.
	self assert: b rootFrame childrenFrames first numberOfChildrenFrames equals: 2.
	self assert: b rootFrame childrenFrames first childrenFrames first numberOfChildrenFrames equals: 0.
	
	"Checking the parent links"
	self assert: b rootFrame childrenFrames first parentFrame equals: b rootFrame.
	self assert: b rootFrame childrenFrames first childrenFrames first parentFrame equals: b rootFrame childrenFrames first.
	
	"Checking the number of elements"
	self assert: b rootFrame numberOfElements equals: 1.
	self assert: b rootFrame childrenFrames first numberOfElements equals: 2.
	self assert: b rootFrame childrenFrames first childrenFrames first numberOfElements equals: 3.
	
	"Checking the depth"
	self assert: b rootFrame depth equals: 1.
	self assert: b rootFrame childrenFrames first depth equals: 2.
	self assert: b rootFrame childrenFrames first childrenFrames first depth equals: 3.

]

{ #category : #'tests - interaction' }
RTMondrianTest >> testHighlightNeighbor [

	| elements |
	b interaction highlightNeighbors: [ :v | Array with: v + 1 ].
	b nodes: #(1 2 2).
	b build.
	elements := b view elements.
	
	"All nodes have default color"
	self assert: (elements allSatisfy: [ :e | e trachelShape color = b computeColorForNode ]).
	
	elements first announce: TRMouseEnter.
	
	self assert: (elements first trachelShape color = b computeColorForNode ).
	self assert: (elements second trachelShape color ~= b computeColorForNode ).
	self assert: (elements third trachelShape color ~= b computeColorForNode ).
]

{ #category : #'tests - interaction' }
RTMondrianTest >> testHighlightNeighborColor [

	| elements |
	b interaction highlightNeighbors: [ :v | Array with: v + 1 ] color: Color red.
	b nodes: #(1 2 2).
	b build.
	elements := b view elements.
	
	"All nodes have default color"
	self assert: (elements allSatisfy: [ :e | e trachelShape color = b computeColorForNode ]).
	
	elements first announce: TRMouseEnter.
	
	self assert: (elements first trachelShape color = b computeColorForNode ).
	self assert: (elements second trachelShape color = Color red ).
	self assert: (elements third trachelShape color = Color red ).
]

{ #category : #'tests - interaction' }
RTMondrianTest >> testInteraction [

	| i nodes |
	i := b interaction.
	nodes :=
	b nodes: #(1 2) forEach: [ :each |
		self assert: b interaction ~~ i
	].
	"Maybe this is what we should have"
	"self assert: nodes first announcer == nodes second announcer"
]

{ #category : #'tests - interaction' }
RTMondrianTest >> testInteractionNoOverride [

	"popup and draggable"	
	self assert: b interaction numberOfInteractions equals: 2.

	b interaction when: TRMouseClick do: [ :evt | ].
	self assert: b interaction numberOfInteractions equals: 3
]

{ #category : #'tests - interaction' }
RTMondrianTest >> testInteractionOverridePopup [

	"popup and draggable"	
	self assert: b interaction numberOfInteractions equals: 2.

	"Since there is a popup in the interaction, we cannot have two popup"
	b interaction popupText: 'hello'.
	self assert: b interaction numberOfInteractions equals: 2
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testLabeledBox [
	b shape labeledBox.
	b node: 42.
	b layout flow.
	b build.
	
	self assert: b view canvas numberOfShapes equals: 2.
]

{ #category : #'tests - edges' }
RTMondrianTest >> testNoLineShape [

	b := RTMondrian new.
	b nodes: (1 to: 2).
	b edges connectTo: 2.
	
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testNodesError [
	self should: [ b nodes: 5 ] raise: AssertionFailure.
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testNodesOnce [

	b nodes: #(1 2 3).
	self assert: b numberOfAllFrames equals: 1.
	self assert: b topElements size equals: 3
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testNodesTwice [

	b nodes: #(1 2 3).
	b nodes: #(1 2 3).
	self assert: b numberOfAllFrames equals: 1.
	self assert: b topElements size equals: 6
]

{ #category : #'tests - normalizer' }
RTMondrianTest >> testNormalizer [

	b := RTMondrian new.
	b nodes: #(1 2 3).
	b normalizer
		normalizeSize: #yourself min: 5 max: 30.
	b build.
	
	self assert: b view elements first trachelShape width equals: 5.
	self assert: b view elements second trachelShape width equals: 17.5.
	self assert: b view elements third trachelShape width equals: 30.
]

{ #category : #'tests - normalizer' }
RTMondrianTest >> testNormalizer02 [

	b := RTMondrian new.
	b nodes: #(1 2 3).
	b normalizer
		normalizeSize: #yourself.
	b build.
	
	self assert: b view elements first trachelShape width equals: 5.
	self assert: b view elements second trachelShape width equals: 17.5.
	self assert: b view elements third trachelShape width equals: 30.
]

{ #category : #'tests - edges' }
RTMondrianTest >> testNotUseInLayoutInInner [
	| v e1 e2 e3 e20 e21 e22 e4 e23 |
	b nodes: #(1 20) forEach: [ :n |
		b nodes: (n + 1 to: n + 3).
		b edges 
			connectTo: [ :nn | nn + 2 ].
		
		b edges 
			notUseInLayout;
			connectTo: [ :nn | nn + 1 ].
		b layout tree.
	].
	b build.
	v := b view.
	
	e1 := v elementFromModel: 1.
	e2 := v elementFromModel: 2.
	e3 := v elementFromModel: 3.
	e4 := v elementFromModel: 4.
	e20 := v elementFromModel: 20.
	e21 := v elementFromModel: 21.
	e22 := v elementFromModel: 22.
	e23 := v elementFromModel: 23.
	self assert: e2 encompassingRectangle topLeft - e1 encompassingRectangle topLeft equals: 5.5 @ 5.0.
	self assert: e4 encompassingRectangle topLeft - e1 encompassingRectangle topLeft equals: 5.5 @ 30.0.
	
	self assert: e21 encompassingRectangle topLeft - e20 encompassingRectangle topLeft equals: 5.5 @ 5.0.
	self assert: e23 encompassingRectangle topLeft - e20 encompassingRectangle topLeft equals: 5.5 @ 30.0.
]

{ #category : #'tests - frames' }
RTMondrianTest >> testParentFrame [

	| f |
	self assert: b currentFrame equals: b rootFrame.

	f := b pushNewFrame.	
	self assert: b currentFrame equals: f.
	self assert: b rootFrame ~~ f.
		
	self assert: b rootFrame equals: f parentFrame.
	
	b popFrame.
	self assert: b currentFrame equals: b rootFrame.
]

{ #category : #'tests - frames' }
RTMondrianTest >> testPartitionedLayoutInInnerFrame [

	b := RTMondrian new.
	b node: 5 forIt: [ 
		b node: 'hello'.
		b layout
			for: [ :str | str size > 5 ] use: RTGridLayout new;
			horizontalLine ].
	b layout grid.
	b build.
]

{ #category : #'tests - frames' }
RTMondrianTest >> testPushingNewFrame [

	| f |
	f := RTMondrianFrame new.
	b pushFrame: f.
	self assert: b rootFrame ~~ b currentFrame.
	self assert: b currentFrame equals: f.
]

{ #category : #'tests - frames' }
RTMondrianTest >> testRootFrameAndCurrentFrame [

	b nodes: #(1 2).
	self assert: b rootFrame equals: b currentFrame
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testShape [

	| n1 n2 |
	b shape circle.
	n1 := b node: #one.
	n2 := b node: #two.
	
	self assert: n1 shape class == RTEllipse.
	self assert: n2 shape class == RTBox.
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testShape2 [

	| n1 n2 |
	b shape circle.
	n1 := b node: #one forIt: [
		n2 := b node: #two ].
	
	self assert: n1 shape class == RTEllipse.
	self assert: n2 shape class == RTBox.
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testShape3 [

	| n1 n2 |
	b shape circle.
	b node: #one forIt: [
		b shape circle.
		n1 := b node: #two ].
	n2 := b node: #three.
	
	self assert: n1 shape class == RTEllipse.
	self assert: n2 shape class == RTBox.
]

{ #category : #'tests - interaction' }
RTMondrianTest >> testShapeAndForEach [

	| i nodes |
	i := b shape.
	nodes := 
	b nodes: #(1 2) forEach: [ :each |
		self assert: b shape ~~ i
	].
	self assert: nodes first shape == nodes second shape
]

{ #category : #'tests - interaction' }
RTMondrianTest >> testShowEdge [
	| elements |
	b interaction showEdge connectTo: [ :v | Array with: v + 1 ].
	b nodes: #(1 2 2 3).

	b layout circle initialRadius: 10. 
	b build.

	self assert: b view numberOfEdges equals: 0.
	
	elements := b view elements.
	elements first announce: TRMouseEnter new.
	self assert: b view numberOfEdges equals: 2.
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testSingleNode [

	b node: 10.
	b build.
	
	self assert: b view numberOfElements equals: 1.
	self assert: b view elements anyOne position equals: 2.5 @ 2.5.
]

{ #category : #'tests - nodes' }
RTMondrianTest >> testSingleNodeForIt [

	b node: 10 forIt: [ b node: 5 ].
	b build.
	
	self assert: b view numberOfElements equals: 2.
	self assert: b view elements first position equals: 7.5 @ 7.5.
	self assert: b view elements second position equals: 8.0 @ 8.0.
]

{ #category : #'tests - source' }
RTMondrianTest >> testSourceConnectFromAllTo [

	b nodes: (1 to: 2) forEach: [ :each |
		b node: each * 10 ].
	b edges source: (Array with: (Array with: 10) -> 20) connectFromAll: #key to: #value.
	b build.
	
	self assert: b view edges size equals: 1
]

{ #category : #'tests - source' }
RTMondrianTest >> testSourceConnectFromTo [

	b nodes: (1 to: 2) forEach: [ :each |
		b node: each * 10 ].
	b edges source: (Array with: 10 -> 20) connectFrom: #key to: #value.
	b build.
	
	self assert: b view edges size equals: 1
]

{ #category : #'tests - source' }
RTMondrianTest >> testSourceConnectFromToAll [

	b nodes: (1 to: 2) forEach: [ :each |
		b node: each * 10 ].
	b edges source: (Array with: 10 -> (Array with: 20)) connectFrom: #key toAll: #value.
	b build.
	
	self assert: b view edges size equals: 1
]

{ #category : #'tests - source' }
RTMondrianTest >> testSourceError [
	| values |
	values := Array with: (1 -> 2) 
	 with: (1 -> 3) 
	 with: (3 -> 7).
	
	b := RTMondrian new.
	b shape box
		fillColor: Color transparent;
		borderColor: Color black.
	b shape text.
	b nodes: ((values collect: #key) , (values collect: #value)) asSet.
	b shape line color: Color red.
	self
		should: [ b edges source: self connectFrom: #key to: #value ]
		raise: AssertionFailure
]

{ #category : #'tests - edges' }
RTMondrianTest >> testUseAssociationsWithError [

	b := RTMondrian new.
	b nodes: #(1 2 3).
	b edges
		useAssociation: 1 -> 5.
	b build.
	
	self assert: b view numberOfEdges equals: 0
]
