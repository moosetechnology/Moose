Class {
	#name : #RTGTContextTest,
	#superclass : #RTTest,
	#instVars : [
		'prez',
		'view'
	],
	#category : #'Roassal2GT-Glamour-Context'
}

{ #category : #running }
RTGTContextTest >> setUp [
	super setUp.
	prez := GLMRoassal2Presentation new.
	view := RTView new.
]

{ #category : #tests }
RTGTContextTest >> testGetContextFor [

	| context |
	self deny: view hasAttributes.
	context := prez getContextFor: view.
	self assert: context notNil.
	self assert: context class equals: RTAbstractViewContext defaultContextClass.
	self assert: (context class inheritsFrom: RTAbstractViewContext).
	self assert: view hasAttributes.
]

{ #category : #tests }
RTGTContextTest >> testGetContextFor02 [

	| context |
	context := prez getContextFor: view.

	self assert: (RTAbstractViewContext getContextFor: view) equals: context.
	
	RTEmptyViewContext setOnView: view.	
	self assert: (RTAbstractViewContext getContextFor: view) ~~ context.
	self assert: (RTAbstractViewContext getContextFor: view) class equals: RTEmptyViewContext.
]

{ #category : #'removing context' }
RTGTContextTest >> testRemovingContext [
	| c |
	self assert: view announcer numberOfSubscriptions equals: 0.
	RTInteractiveViewContext setOnView: view.
	self assert: view announcer numberOfSubscriptions equals: 0.
	prez useContextToInitialize: view.
	self assert: view announcer numberOfSubscriptions equals: 1.
	
	c := prez getContextFor: view.
	self assert: c class equals: RTInteractiveViewContext.
	c removeFromView.
	self assert: view announcer numberOfSubscriptions equals: 0.
]

{ #category : #'removing context' }
RTGTContextTest >> testRemovingContext02 [
	RTInteractiveViewContext setOnView: view.
	prez useContextToInitialize: view.
	self assert: view announcer numberOfSubscriptions equals: 1.
	"self assert: (view hasInteraction: RTSelectableElementContextInteraction)."
	self assert: (view hasInteraction: RTResizeableViewContextInteraction).

	RTEmptyViewContext setOnView: view.
	prez useContextToInitialize: view.
	self assert: view announcer numberOfSubscriptions equals: 0.

	RTInteractiveViewContext setOnView: view.
	prez useContextToInitialize: view.
	self assert: view announcer numberOfSubscriptions equals: 1.

]

{ #category : #tests }
RTGTContextTest >> testdefaultContextClass [
	self assert: RTAbstractViewContext defaultContextClass notNil.
	self assert: RTAbstractViewContext defaultContextClass isBehavior.
]

{ #category : #tests }
RTGTContextTest >> testuseContextToInitialize [

	self assert: view announcer numberOfSubscriptions = 0.
	prez useContextToInitialize: view.
	self assert: view announcer numberOfSubscriptions > 0
]
