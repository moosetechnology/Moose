"
A RTSankeyBuilderTest is a test class for testing the behavior of RTSankeyBuilder
"
Class {
	#name : #RTSankeyBuilderTest,
	#superclass : #TestCase,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTSankeyBuilderTest >> test01 [
	"basic"
	| b |
	b := RTSankeyBuilder new.
	self assert: b extent equals: 400@300.
	self assert: b shape shape class equals: RTBox.
	self assert: b nodePadding equals: 0.
	
	self assert: b interaction numberOfInteractions equals: 1.
	self assert: b interactionEdge numberOfInteractions equals: 0.
	self assert: b lineShape shape class equals: RTBezier4Line.
	
	^ b
]

{ #category : #tests }
RTSankeyBuilderTest >> test02 [
	"build"
	| b |
	b := RTSankeyBuilder new.
	b build.
]

{ #category : #tests }
RTSankeyBuilderTest >> test03 [
	"data and build"
	| b nodes links |
	b := RTSankeyBuilder new.
	
	nodes := OrderedCollection new
		add: 'A';
		add: 'B';
		yourself.
	links := OrderedCollection new
		add: 'A'->'B';
		yourself.
	b 
		iterations: 32;
		nodePadding: 5;
		nodes: nodes;
		links: links;
		linkFrom: #key;
		linkTo: #value;
		linkValue: 1;
		build.
	b view
]
