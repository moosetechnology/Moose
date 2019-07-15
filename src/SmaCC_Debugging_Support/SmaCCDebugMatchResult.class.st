Class {
	#name : #SmaCCDebugMatchResult,
	#superclass : #Object,
	#instVars : [
		'patternNode',
		'matchedNodes',
		'matched',
		'children',
		'parent'
	],
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #examples }
SmaCCDebugMatchResult class >> exampleFailure [
	<gtExample>
	| jsParser result |
	jsParser := Smalltalk at: #JSParser ifAbsent: [ ^ nil ].
	result := (jsParser parse: '`?a` + `?a` + `?a`' startingAt: jsParser startingStateForExpression)
		debugMatch: (jsParser parse: '2 + 2 + 3' startingAt: jsParser startingStateForExpression).
	self assert: result matched not.
	^ result
]

{ #category : #examples }
SmaCCDebugMatchResult class >> exampleSuccess [
	<gtExample>
	| jsParser result |
	jsParser := Smalltalk at: #JSParser ifAbsent: [ ^ nil ].
	result := (jsParser parse: 'f(`?a{beList}`,1,`?b{beList}`,4,`?c{beList}`)' startingAt: jsParser startingStateForExpression)
		debugMatch: (jsParser parse: 'f(0,1,2,3,4)' startingAt: jsParser startingStateForExpression).
	self assert: result matched.
	^ result
]

{ #category : #'instance creation' }
SmaCCDebugMatchResult class >> forPattern: patternNode [
	^ self new
		patternNode: patternNode;
		yourself
]

{ #category : #inspector }
SmaCCDebugMatchResult >> allNodeChildren [
	| allChildren |
	children isEmpty
		ifTrue: [ ^ #() ].
	allChildren := OrderedCollection new.
	matchedNodes
		do: [ :node | 
			node node
				nodesDo: [ :each | allChildren add: (self nodeChildFor: each) ]
				andTokensDo: [ :each | allChildren add: (self nodeChildFor: each) ] ].
	^ allChildren asSortedCollection: [ :a :b | a node startPosition < b node startPosition ]
]

{ #category : #inspector }
SmaCCDebugMatchResult >> allPatternChildren [
	| allChildren |
	children isEmpty
		ifTrue: [ ^ #() ].
	allChildren := OrderedCollection new.
	patternNode
		nodesDo: [ :each | allChildren add: (self patternChildFor: each) ]
		andTokensDo: [ :each | allChildren add: (self patternChildFor: each) ].
	^ allChildren asSortedCollection: [ :a :b | a patternNode startPosition < b patternNode startPosition ]
]

{ #category : #accessing }
SmaCCDebugMatchResult >> children [
	^ children
]

{ #category : #accessing }
SmaCCDebugMatchResult >> children: anObject [
	children := anObject
]

{ #category : #private }
SmaCCDebugMatchResult >> createResultFor: anObject [
	| found search |
	(patternNode isKindOf: SmaCCToken)
		ifTrue: [ ^ nil ].
	found := false.
	search := [ :each | found := found or: [ each == anObject ] ].
	patternNode nodesDo: search andTokensDo: search.
	found
		ifTrue: [ ^ children
				add:
					((self class forPattern: anObject)
						parent: self;
						yourself) ].
	patternNode
		nodesDo: [ :each | 
			(self doesNode: each contain: anObject)
				ifTrue: [ | result |
					result := self class forPattern: each.
					result parent: self.
					children add: result.
					^ result createResultFor: anObject ] ].
	^ nil
]

{ #category : #private }
SmaCCDebugMatchResult >> doesNode: aNode contain: anObject [
	aNode
		allNodesDo: [ :each | 
			each == anObject
				ifTrue: [ ^ true ] ]
		andTokensDo: [ :each | 
			each == anObject
				ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #private }
SmaCCDebugMatchResult >> findResultFor: anObject [
	patternNode == anObject
		ifTrue: [ ^ self ].
	1 to: children size do: [ :i | 
		| result |
		result := (children at: i) findResultFor: anObject.
		result notNil
			ifTrue: [ [ children size > i ] whileTrue: [ children removeLast ].
				^ result ] ].
	^ self createResultFor: anObject
]

{ #category : #inspector }
SmaCCDebugMatchResult >> formatText: text matched: isMatched [
	isMatched isNil
		ifTrue: [ text addAttribute: (TextColor new color: Color lightGray) ]
		ifFalse: [ isMatched
				ifFalse: [ text
						addAttribute: (TextColor new color: Color red);
						allBold ] ]
]

{ #category : #inspector }
SmaCCDebugMatchResult >> gtInspectorIn: aComposite [
	<gtInspectorPresentationOrder: 1>
	| tabulator |
	tabulator := aComposite tabulator.
	tabulator
		title: 'Pattern matching';
		column: [ :c | 
			c
				row: #patternTree;
				row: #patternSource ];
		column: [ :c | 
			c
				row: #nodeTree;
				row: #nodeSource ].
	tabulator transmit
		to: #patternTree;
		andShow: [ :p | 
			p fastTreeTable
				title: 'Pattern';
				display: [ Array with: self ];
				children: [ :each | each allPatternChildren ];
				allExpanded;
				column: 'Variable' evaluated: [ :each | self patternLabelFor: each ];
				column: 'Type' evaluated: [ :each | '' ] tags: [ :each | {each patternNode class name} ] ].
	tabulator transmit
		to: #patternSource;
		andShow: [ :p | p text display: [ patternNode topParent completeSource ifNil: [ '' ] ] ].
	tabulator transmit
		from: #patternTree port: #selection;
		to: #patternSource port: #selectionInterval;
		transformation: [ :e | 
			e isNil
				ifTrue: [ 1 to: 0 ]
				ifFalse: [ e patternNode startPosition to: e patternNode stopPosition ] ].
	tabulator transmit
		to: #nodeTree;
		andShow: [ :p | 
			p fastTreeTable
				beMultiple;
				title: 'AST';
				display: [ matchedNodes ];
				children: [ :each | each matchResult allNodeChildren ];
				allExpanded;
				column: 'Variable' evaluated: [ :each | self nodeLabelFor: each ];
				column: 'Type' evaluated: [ :each | '' ] tags: [ :each | {each node class name} ] ].
	tabulator transmit
		to: #nodeSource;
		andShow: [ :p | 
			p text
				display: [ matchedNodes isEmpty
						ifTrue: [ '' ]
						ifFalse: [ matchedNodes first node topParent completeSource ifNil: [ '' ] ] ] ].
	tabulator transmit
		from: #patternTree port: #selection;
		to: #nodeTree port: #selection;
		transformation: [ :e | 
			e isNil
				ifTrue: [ #() ]
				ifFalse: [ e matchedNodes ] ].
	tabulator transmit
		from: #nodeTree port: #selection;
		to: #nodeSource port: #selectionInterval;
		transformation: [ :e | 
			| start end |
			start := SmallInteger maxVal.
			end := 0.
			e
				do: [ :each | 
					start := start min: each node startPosition.
					end := end max: each node stopPosition ].
			start = SmallInteger maxVal
				ifTrue: [ start := 1 ].
			start to: end ]
]

{ #category : #'initialize-release' }
SmaCCDebugMatchResult >> initialize [
	super initialize.
	children := OrderedCollection new.
	matchedNodes := #().
	matched := nil
]

{ #category : #accessing }
SmaCCDebugMatchResult >> matched [
	^ matched
]

{ #category : #accessing }
SmaCCDebugMatchResult >> matched: aBoolean [
	matched := aBoolean
]

{ #category : #accessing }
SmaCCDebugMatchResult >> matchedNodes [
	^ matchedNodes
]

{ #category : #inspector }
SmaCCDebugMatchResult >> nodeChildFor: aNode [
	^ (children
		detect: [ :each | each nodes identityIncludes: aNode ]
		ifNone: [ self class new
				parent: self;
				nodes: {aNode};
				yourself ]) matchedNodes detect: [ :each | each node == aNode ]
]

{ #category : #inspector }
SmaCCDebugMatchResult >> nodeLabelFor: each [
	| text |
	text := (each matchResult parent isNil
		ifTrue: [ 'aNode' ]
		ifFalse: [ each matchResult parent nodeLabelForChild: each node ]) asText.
	self formatText: text matched: each matchResult matched.
	^ text
]

{ #category : #inspector }
SmaCCDebugMatchResult >> nodeLabelForChild: aNode [
	^ (self nodes
		detect: [ :node | 
			| found |
			found := false.
			node nodesDo: [ :each | found := found or: [ each == aNode ] ] andTokensDo: [ :each | found := found or: [ each == aNode ] ].
			found ]) debugLabelForChild: aNode
]

{ #category : #accessing }
SmaCCDebugMatchResult >> nodes [
	^ matchedNodes collect: [ :each | each node ]
]

{ #category : #accessing }
SmaCCDebugMatchResult >> nodes: aCollection [
	matchedNodes := aCollection collect: [ :each | SmaCCDebugMatchedNode forResult: self andNode: each ]
]

{ #category : #accessing }
SmaCCDebugMatchResult >> parent [
	^ parent
]

{ #category : #accessing }
SmaCCDebugMatchResult >> parent: anObject [
	parent := anObject
]

{ #category : #inspector }
SmaCCDebugMatchResult >> patternChildFor: aNode [
	^ children
		detect: [ :each | each patternNode == aNode ]
		ifNone: [ self class new
				parent: self;
				patternNode: aNode;
				yourself ]
]

{ #category : #inspector }
SmaCCDebugMatchResult >> patternLabelFor: each [
	| text |
	text := (each parent isNil
		ifTrue: [ 'self' ]
		ifFalse: [ each parent patternNode debugLabelForChild: each patternNode ]) asText.
	self formatText: text matched: each matched.
	^ text
]

{ #category : #accessing }
SmaCCDebugMatchResult >> patternNode [
	^ patternNode
]

{ #category : #accessing }
SmaCCDebugMatchResult >> patternNode: anObject [
	patternNode := anObject
]

{ #category : #processing }
SmaCCDebugMatchResult >> processMatchFor: pattern and: anAstNode result: aBoolean [
	(self findResultFor: pattern)
		nodes:
			(anAstNode isCollection
				ifTrue: [ anAstNode ]
				ifFalse: [ Array with: anAstNode ]);
		matched: aBoolean
]
