Class {
	#name : #RTTransitivelyTHighlightableTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTTransitivelyTHighlightableTest >> testBasicNoCycle [

	| v eb element allShapes int |
	v := RTView new.
	v addAll: (RTBox elementsOn: (1 to: 3)).
	RTGridLayout on: v elements.
	
	eb := RTEdgeBuilder new.
	eb view: v.
	eb useAssociations: (Array with: 1 -> 2 with: 2 -> 3 ).
	
	self assert: (v canvas shapes allSatisfy: [ :s | s color = RTShape defaultColor ]).
	element := v elementFromModel: 1.
	int := RTTransitivelyHighlightable new color: Color red.
	element @ int.
	element announce: TRMouseEnter new.
	
	allShapes := v canvas shapes select: [ :s | s class == TRBoxShape ].
	self assert: (allShapes allSatisfy: [ :s | s color = Color red ]).
	
	self assert: int getConnectedElementBlock notNil.
	self assert: (int getConnectedElementBlock rtValue: element) class equals: RTGroup.
	self assert: (int getConnectedElementBlock rtValue: element) size equals: 1.
	self assert: (int getConnectedElementBlock rtValue: element) first model equals: 2.
]

{ #category : #tests }
RTTransitivelyTHighlightableTest >> testBasicNoCycleAndIncoming [

	| v eb element allShapes |
	v := RTView new.
	v addAll: (RTBox elementsOn: (1 to: 3)).
	RTGridLayout on: v elements.
	
	eb := RTEdgeBuilder new.
	eb view: v.
	eb useAssociations: (Array with: 1 -> 2 with:  2 -> 3 ).
	
	self assert: (v canvas shapes allSatisfy: [ :s | s color = RTShape defaultColor ]).
	element := v elementFromModel: 3.
	element @ (RTTransitivelyHighlightable new focusOnIncomingElements; color: Color red).
	element announce: TRMouseEnter new.
	
	allShapes := v canvas shapes select: [ :s | s class == TRBoxShape ].
	self assert: (allShapes allSatisfy: [ :s | s color = Color red ]).
]

{ #category : #tests }
RTTransitivelyTHighlightableTest >> testBasicWithCycle [

	| v eb element allShapes |
	v := RTView new.
	v addAll: (RTBox elementsOn: (1 to: 3)).
	RTGridLayout on: v elements.
	
	eb := RTEdgeBuilder new.
	eb view: v.
	eb useAssociations: (Array with: 1 -> 2 with: 2 -> 3 with: 3 -> 1).
	
	self assert: (v canvas shapes allSatisfy: [ :s | s color = RTShape defaultColor ]).
	element := v elementFromModel: 1.
	element @ (RTTransitivelyHighlightable new color: Color red).
	element announce: TRMouseEnter new.
	
	allShapes := v canvas shapes select: [ :s | s class == TRBoxShape ].
	self assert: (allShapes allSatisfy: [ :s | s color = Color red ]).
]

{ #category : #tests }
RTTransitivelyTHighlightableTest >> testBasicWithCycleAndEdgeHighlighting [

	| v eb element allShapes int |
	v := RTView new.
	v addAll: (RTBox elementsOn: (1 to: 3)).
	RTGridLayout on: v elements.
	
	eb := RTEdgeBuilder new.
	eb view: v.
	eb useAssociations: (Array with: 1 -> 2 with: 2 -> 3 with: 3 -> 1).
	
	self assert: (v canvas shapes allSatisfy: [ :s | s color = RTShape defaultColor ]).
	element := v elementFromModel: 1.
	int := RTTransitivelyHighlightable new color: Color red.
	int edgeColor: Color black.
	element @ int.
	element announce: TRMouseEnter new.
	
	self assert: int shouldHighlightEdges.
	
	allShapes := v canvas shapes select: [ :s | s class == TRBoxShape ].
	self assert: (allShapes allSatisfy: [ :s | s color = Color red ]).
]

{ #category : #tests }
RTTransitivelyTHighlightableTest >> testShouldNotHighlightEdges [

	self deny: RTTransitivelyHighlightable new shouldHighlightEdges.
	self assert: RTTransitivelyHighlightable new edgeColor isNil.
	self assert: RTTransitivelyHighlightable new shouldNotHighlightEdges.
	self assert: (RTTransitivelyHighlightable new edgeColor: Color red; shouldHighlightEdges).
]
