Extension { #name : #SmaCCNode }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCNode >> gtGraphInspectorViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	(Smalltalk includesKey: #RTView) not
		ifTrue: [ ^ nil ].
	composite roassal2
		title: 'Graph';
		initializeView: [ | nodes view shape elements |
			nodes := self allStates.
			view := (Smalltalk at: #RTView) new.
			shape := ((Smalltalk at: #RTRoundedBox) new
				borderRadius: 10;
				color: Color white;
				borderColor: [ :n | 
					n == self
						ifTrue: [ Color green ]
						ifFalse: [ n action isNil
								ifTrue: [ Color red ]
								ifFalse: [ n action isEmpty
										ifTrue: [ Color lightGray ]
										ifFalse: [ Color black ] ] ] ];
				yourself)
				+
					((Smalltalk at: #RTLabel) new
						color: Color black;
						text: [ :n | 
							| label |
							label := n action isSymbol
								ifTrue: [ n ]
								ifFalse: [ (n action ifNotNil: [ :a | a asArray ]) printString ].
							label copyFrom: 1 to: (label size min: 20) ];
						yourself).
			shape allOfSameSizeWithPadding.
			elements := shape elementsOn: nodes.
			elements @ (Smalltalk at: #RTDraggable).
			view addAll: elements.
			(Smalltalk at: #RTEdgeBuilder) new
				view: view;
				objects: nodes;
				label: [ :from :to | (from transitions detect: [ :each | each to == to ]) edgeLabel ];
				shape:
					(RTStyledMultiLine new
						color: (Color blue alpha: 0.4);
						arrowHead;
						attachPoint: (Smalltalk at: #RTShorterDistanceAttachPoint) instance;
						yourself);
				connectFrom: #yourself toAll: [ :node | node transitions collect: [ :each | each to ] ].
			view @ (Smalltalk at: #RTDraggableView).
			(Smalltalk at: #RTForceBasedLayout) new
				charge: -6000;
				nbIterations: 50;
				on: elements edges: view edges.
			view ]
]
