"
A ROClusterLayout is xxxxxxxxx.

Instance Variables
	externalLayer:		<Object>
	maxAbcissa:		<Object>
	maxLayer:		<Object>

externalLayer
	- xxxxx

maxAbcissa
	- xxxxx

maxLayer
	- xxxxx

"
Class {
	#name : #RTClusterLayout,
	#superclass : #RTAbstractGraphLayout,
	#instVars : [
		'externalLayer',
		'maxLayer',
		'maxAbcissa'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #algorithm }
RTClusterLayout >> computePosition: aNode [

	|children previous|
	
	children := self childrenFor: aNode.
	
	children do: [ :e | self computePosition: e ].
		
											children isEmpty ifTrue: [ externalLayer first = aNode ifFalse: [ previous := externalLayer at: ( externalLayer indexOf: aNode) - 1.
																											((self fatherOf: previous) = (self fatherOf: aNode)) ifTrue: [ self xOf: aNode put: (self xOf: previous) + (horizontalGap / 2) ] 
																																			ifFalse: [ self xOf: aNode put: (self xOf: previous) + horizontalGap] ] ]
																																	
															ifFalse: [ self xOf: aNode put: ((self xOf: (self leftContourOf: aNode)) + (self xOf: (self rightContourOf: aNode)) / 2 )]
]

{ #category : #hook }
RTClusterLayout >> doExecute: nodeElements [ 

	| root gap |
	"Not much to do if there is only one element"
	nodeElements size = 1 ifTrue: [ ^ self ].
	
	root := self rootNodesFor: nodeElements .
	root do: [ :e | self initializeNode: e ].
	root do: [ :e | self computePosition: e ].
	
	maxLayer := (root collect: [ :e | self layerOf: e ]) max.
	
	(root size > 1) ifTrue: [ maxLayer := maxLayer + 1 ].
	
	maxAbcissa := (self xOf: externalLayer last) + horizontalGap .
	
	gap := maxAbcissa "+ horizontalGap "/ 2 / Float pi / maxLayer.
	
	verticalGap := verticalGap max: gap.
	
	root do: [ :e | self draw: e. self step ].
	
	
]

{ #category : #'drawing-general' }
RTClusterLayout >> draw: aNode [

	(self childrenFor: aNode) do: [ :e | self draw: e ].
	translator translateTopLeftOf: aNode to: (Point r: maxLayer - (self layerOf: aNode) * verticalGap theta: (maxAbcissa - (self xOf: aNode) / maxAbcissa) * 2 * Float pi )
]

{ #category : #'initialize-release' }
RTClusterLayout >> initialize [ 

	super initialize.
	verticalGap := 30.
	horizontalGap := 20.
	externalLayer := OrderedCollection new
]

{ #category : #'initialize-release' }
RTClusterLayout >> initializeNode: aNode [

	|children|
	
	children := self childrenFor: aNode.
	
	children do: [ :e | self initializeNode: e.
						self fatherOf: e put: aNode ].
	
	children isEmpty ifTrue: [ self layerOf: aNode put: 0.
							externalLayer add: aNode ] 
					ifFalse: [ self layerOf: aNode put: ((children collect: [ :e | (self layerOf: e) ]) max + 1).
							self leftContourOf: aNode put: children first.
							self rightContourOf: aNode put: children last ].
					
]
