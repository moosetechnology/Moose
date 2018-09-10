Class {
	#name : #RTGTContextInteractionTest,
	#superclass : #RTTest,
	#category : #'Roassal2GT-Glamour-Roassal-Interaction'
}

{ #category : #tests }
RTGTContextInteractionTest >> testBasic [

	| v int |
	v := RTView new.
	int := RTEmptyViewContextInteraction new.
	v @ int.
	self assert: (RTAbstractViewContext getContextFor: v) class equals: RTEmptyViewContext.
]

{ #category : #tests }
RTGTContextInteractionTest >> testBasic02 [

	| v int |
	v := RTView new.
	int := RTResizeableViewContextInteraction new.
	v @ int.
	self assert: (RTAbstractViewContext getContextFor: v) class equals: RTInteractiveViewContext.
]
