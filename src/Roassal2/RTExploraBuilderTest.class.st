"
A ROExploraBuilderTest is xxxxxxxxx.

Instance Variables
	builder:		<Object>

builder
	- xxxxx

"
Class {
	#name : #RTExploraBuilderTest,
	#superclass : #RTTest,
	#instVars : [
		'builder'
	],
	#category : #'Roassal2-Builder-Explora'
}

{ #category : #running }
RTExploraBuilderTest >> setUp [
	super setUp.
	builder := RTExploraBuilder new.

]

{ #category : #tests }
RTExploraBuilderTest >> testClickWithCallback [

	| node1 elem2 |
	node1 := builder node: 1.
	builder onClickExplore: [ :num | num*3 to: num*3 + 1 ].
	builder renderIn: builder view.
	
	node1 element announce: TRMouseClick.
	self assert: builder view numberOfElements = 3.
	
	elem2 := builder view elements at: 3.
	elem2 announce: TRMouseClick.
	self assert: builder view numberOfElements = 5.
	
	elem2 announce: TRMouseClick.
	self assert: builder view numberOfElements = 3.
	
	elem2 announce: TRMouseClick.
	self assert: builder view numberOfElements = 5.
	
	node1 element announce: TRMouseClick.
	self assert: builder view numberOfElements = 1.
]

{ #category : #tests }
RTExploraBuilderTest >> testClickWithoutCallback [

	| node |
	node := builder node: 5.
	self assert: node element model = 5.
	builder renderIn: builder view.
	
	node element announce: TRMouseClick.
	self assert: builder view numberOfElements = 1
]

{ #category : #tests }
RTExploraBuilderTest >> testEmpty [

	self assert: builder view numberOfElements = 0
]

{ #category : #tests }
RTExploraBuilderTest >> testIsExpandable [
	| node1 node2 |
	node1 := builder node: 1.
	builder renderIn: builder view.
	self assert: node1 isExpandable not.
	
	builder onClickExplore: [ :n | n = 1 ifTrue: [ 2 to: 3 ] ifFalse: [ #() ]].
	node1 element announce: TRMouseClick.
	node2 := node1 expandedNodes at: 1.
	self assert: node1 isExpandable.
	self assert: node2 isExpandable not.
	
]

{ #category : #tests }
RTExploraBuilderTest >> testNodeCantKillDaddy [
	| node1 elem2 |
	node1 := builder node: 1.
	builder onLeftClickExplore: [ :n | #(2 3) ].
	builder onRightClickExplore: [ :n | #(1) ].
	builder renderIn: builder view.
	self assert: builder view numberOfElements = 1.
	
	node1 element announce: TRMouseLeftClick.
	elem2 := builder view elementFromModel: 2.
	self assert: builder view numberOfElements = 3.
	
	elem2 announce: TRMouseRightClick.
	self assert: builder view numberOfElements = 3.
]

{ #category : #tests }
RTExploraBuilderTest >> testTwoWayExpansion [

	| node1 node2 n1 n2 n3 n4 expandDown |
	
	" A tree structure "
	n1 := RTExploraTestTree new.
	n2 := RTExploraTestTree new.
	n3 := RTExploraTestTree new.
	n4 := RTExploraTestTree new.
	n1 left: n2; right: n3.
	n2 parent: n1; left: n4.
	n3 parent: n1.
	n4 parent: n2.
	
	expandDown := [ :n |
		|r|
		r := OrderedCollection new.
		n left isNil ifFalse: [ r add: n left ].
		n right isNil ifFalse: [ r add: n right ].
		r
	].
	
	node2 := builder node: n2.
	builder onLeftClickExplore: [ :n | expandDown value: n ].
	builder onRightClickExplore: [ :n | n parent isNil ifFalse: [ Array with: n parent ] ifTrue: [ #() ] ].
	builder renderIn: builder view.
	
	node2 element announce: TRMouseRightClick.
	node1 := builder view elementFromModel: n1.
	self assert: builder view numberOfElements = 2.
	
	node2 element announce: TRMouseLeftClick.
	self assert: builder view numberOfElements = 3.
	
	node1 announce: TRMouseLeftClick.
	self assert: builder view numberOfElements = 4.
	
	node2 element announce: TRMouseRightClick.
	self assert: builder view numberOfElements = 2.
]

{ #category : #tests }
RTExploraBuilderTest >> testWithOneNode [

	builder node: 5.
	builder renderIn: builder view.
	self assert: builder view numberOfElements = 1
]
