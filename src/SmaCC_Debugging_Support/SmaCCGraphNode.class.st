Class {
	#name : #SmaCCGraphNode,
	#superclass : #Object,
	#instVars : [
		'state',
		'name',
		'success',
		'followed',
		'directLinks',
		'previousNodes',
		'reductions',
		'parser'
	],
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #inspecting }
SmaCCGraphNode class >> gtExampleSmaCCGraphNode [
	<gtExample>
	<label: 'SmaCCGraphNode'>
	
	| parser |
	
	parser := SmaCCDefinitionParser new.
	
	^ SmaCCGraphNode named: '' state: parser class defaultStartingState parser: parser
]

{ #category : #'instance creation' }
SmaCCGraphNode class >> named: aString state: anInteger parser: aSmaCCParser [
	^ self new
		name: aString;
		state: anInteger;
		parser: aSmaCCParser;
		yourself
]

{ #category : #accessing }
SmaCCGraphNode >> addDirectLinkToNodeNamed: aString state: anInteger [
	| node |
	(followed notNil and: [ followed name = aString ])
		ifTrue: [ ^ followed ].
	directLinks
		do: [ :each | 
			each name = aString
				ifTrue: [ ^ each ] ].
	node := self class named: aString state: anInteger parser: parser.
	node addPrevious: self.
	^ directLinks add: node
]

{ #category : #private }
SmaCCGraphNode >> addPrevious: aSmaCCGraphNode [
	previousNodes add: aSmaCCGraphNode
]

{ #category : #accessing }
SmaCCGraphNode >> addReduction: aString [
	reductions add: aString
]

{ #category : #accessing }
SmaCCGraphNode >> allNodes [
	| nodes |
	nodes := IdentitySet new.
	self allNodesInto: nodes.
	^ nodes
]

{ #category : #private }
SmaCCGraphNode >> allNodesInto: aCollection [
	(aCollection includes: self)
		ifTrue: [ ^ self ].
	aCollection add: self.
	followed notNil
		ifTrue: [ followed allNodesInto: aCollection ].
	directLinks do: [ :each | each allNodesInto: aCollection ]
]

{ #category : #accessing }
SmaCCGraphNode >> description [
	| stream |
	previousNodes isEmpty
		ifTrue: [ ^ 'Start' ].
	success
		ifTrue: [ ^ 'Parsing was successful' ].
	stream := WriteStream on: String new.
	reductions asSortedCollection do: [ :each | stream nextPutAll: each ] separatedBy: [ stream cr ].
	^ stream contents
]

{ #category : #accessing }
SmaCCGraphNode >> directLinks [
	^ directLinks
]

{ #category : #accessing }
SmaCCGraphNode >> followed [
	^ followed
]

{ #category : #accessing }
SmaCCGraphNode >> followed: aSmaCCGraphNode [
	followed := aSmaCCGraphNode.
	aSmaCCGraphNode notNil
		ifTrue: [ aSmaCCGraphNode addPrevious: self ]
]

{ #category : #inspecting }
SmaCCGraphNode >> gtGraphInspectorViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	composite roassal2
		title: 'Graph';
		initializeView: [ parser roassalViewForStack: self stack ]
]

{ #category : #'initialize-release' }
SmaCCGraphNode >> initialize [
	super initialize.
	name := ''.
	success := false.
	directLinks := OrderedCollection new.
	previousNodes := OrderedCollection new.
	reductions := Set new
]

{ #category : #testing }
SmaCCGraphNode >> isFollowed [
	^ previousNodes isEmpty or: [ previousNodes anySatisfy: [ :each | each followed == self ] ]
]

{ #category : #accessing }
SmaCCGraphNode >> name [
	^ name
]

{ #category : #accessing }
SmaCCGraphNode >> name: aString [
	name := aString
]

{ #category : #accessing }
SmaCCGraphNode >> parser: aSmaCCParser [
	parser := aSmaCCParser
]

{ #category : #private }
SmaCCGraphNode >> stack [
	| stack |
	stack := previousNodes notEmpty
		ifTrue: [ previousNodes first stack ]
		ifFalse: [ OrderedCollection new ].
	stack add: state.
	^ stack
]

{ #category : #accessing }
SmaCCGraphNode >> state [
	^ state
]

{ #category : #accessing }
SmaCCGraphNode >> state: anInteger [
	state := anInteger
]

{ #category : #accessing }
SmaCCGraphNode >> success [
	^ success
]

{ #category : #accessing }
SmaCCGraphNode >> success: aBoolean [
	success := aBoolean
]
