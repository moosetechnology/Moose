Extension { #name : #PPParser }

{ #category : #'*petitgui-accessing' }
PPParser >> backgroundForDepth: anInteger [
	^ Color gray: 1.0 - (anInteger / 20.0)
]

{ #category : #'*petitgui-debug' }
PPParser >> debug: anObject [
	"Parse anObject with the receiving parser and answer the parse-result or an instance of PPFailure."
	
	^ self enableDebug parse: anObject asPetitStream
]

{ #category : #'*petitgui-accessing' }
PPParser >> displayColor [
	^ self isTerminal
		ifTrue: [ Color r: 0.5 g: 0.0 b: 0.5 ]
		ifFalse: [ Color blue ]
]

{ #category : #'*petitgui-accessing' }
PPParser >> displayName [
	^ self name isNil
		ifFalse: [ self name asString ]
		ifTrue: [ self class name asString ]
]

{ #category : #'*petitgui-debug' }
PPParser >> enableDebug [
   | root newParser  |
	root := PPParserDebuggerResult new.
	
	"In order to debug island waters, we need to compute the island water..."
	self allParsers select: [ :p | p isKindOf: PPSea  ] thenDo: [ :island |
		island createWaterForRoot: self	
	].
	
	newParser := self transform: [:each |
		each >=> [:stream :continuation | 
			| result child |
			child := PPParserDebuggerResult new 
					parser: each;
					parent: root.
			root := root children add: child.
 			child start: stream position + 1.
			result := continuation value.
			child end: stream position.
			root result: result.
			root := root parent.
			result 
		]
	].
	
	^ PPDebugParser on: newParser root: root.

]

{ #category : #'*petitgui-accessing' }
PPParser >> example [
	^ String streamContents: [ :stream | self exampleOn: stream ] limitedTo: 1024
]

{ #category : #'*petitgui-accessing' }
PPParser >> exampleOn: aStream [
]

{ #category : #'*petitgui' }
PPParser >> gtAllParsersIn: composite [
	<gtInspectorPresentationOrder: 50>

	composite roassal2
		title: 'Graph'; 
		initializeView: [ RTMondrian new ];
		painting: [ :view |
			self viewAllParsersOn: view.	
		].
]

{ #category : #'*petitgui' }
PPParser class >> gtExampleCharactersParser [
	<gtExample>
	<label: 'Characters parser'>
	
	^ ($a to: $z) asParser
]

{ #category : #'*petitgui' }
PPParser class >> gtExampleEmptyParser [
	<gtExample>
	<label: 'Empty parser'>
	
	^ self new
]

{ #category : #'*petitgui' }
PPParser >> gtInspectorParserInspectorIn: composite [
	<gtInspectorPresentationOrder: 30>
	composite custom: (
		PPVerticalParserInspector new 
			title: 'Sampler';
			startOn: self)
]

{ #category : #'*petitgui' }
PPParser >> gtNamedTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
		title: 'Named Tree';
		children: [:n | n namedChildren ];
		format: [:n| n name ifNil: [ n asString ] ];
		shouldExpandToLevel: 3
]

{ #category : #'*petitgui' }
PPParser >> gtTreeViewIn: composite [
	<gtInspectorPresentationOrder: 40>

	composite tree
			title: 'Tree';
			children: [:n | n children ];
			format: [:n| n name ifNil: [ n asString ] ifNotNil: [n name] ];
			shouldExpandToLevel: 6
]

{ #category : #'*petitgui-morphic' }
PPParser >> morphicProduction [
	^ self newRowMorph
		layoutInset: 4;
		addMorphBack: (self newRowMorph
			layoutInset: 4;
			addMorphBack: (StringMorph new
				contents: self displayName;
				emphasis: TextEmphasis bold emphasisCode;
				yourself);
			yourself);
		addMorphBack: (self morphicShapeSeen: IdentitySet new depth: 0);
		addMorphBack: (self newColumnMorph
			addMorphBack: (self newSpacerMorph);
			addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1)	
				makeForwardArrow;
			yourself);
		yourself
]

{ #category : #'*petitgui-morphic' }
PPParser >> morphicShapeDefault [
	^ self newRowMorph
		addMorphBack: (self newColumnMorph
			addMorphBack: (self newSpacerMorph);
			addMorphBack: (LineMorph from: 0 @ 0 to: 20 @ 0 color: Color black width: 1)	
				makeForwardArrow;
			yourself);
		addMorphBack: (self newRowMorph
			borderWidth: 1;
			layoutInset: 3;
			color: Color white;
			addMorphBack: (StringMorph new
				contents: self displayName;
				color: self displayColor;
				yourself);
			yourself);
		yourself
]

{ #category : #'*petitgui-morphic' }
PPParser >> morphicShapeSeen: aSet depth: anInteger [
	^ self morphicShapeDefault
]

{ #category : #'*petitgui-morphic' }
PPParser >> morphicShapeSeen: aSet depth: anInteger do: aBlock [
	" avoid recursion "
	(aSet includes: self)
		ifTrue: [ ^ self morphicShapeDefault ].
	" display nice name when possible "
	(anInteger > 0 and: [ self name notNil ]) 
		ifTrue: [ ^ self morphicShapeDefault ].
	" don't do it too deep "
	(anInteger > 10)
		ifTrue: [ ^ self morphicShapeDefault ].
	aSet add: self. 
	^ aBlock value: [ :parser |
		parser 
			morphicShapeSeen: aSet 
			depth: anInteger + 1 ]
]

{ #category : #'*petitgui-mondrian' }
PPParser >> namedParsers [
    | result |
    result := OrderedCollection new.
    self namedParsersDo: [ :parser | result addLast: parser ].
    ^ result
]

{ #category : #'*petitgui-mondrian' }
PPParser >> namedParsersDo: aBlock [
    self namedParsersDo: aBlock seen: IdentitySet new
]

{ #category : #'*petitgui-mondrian' }
PPParser >> namedParsersDo: aBlock seen: aSet [
    self children do: [ :each | 
        (aSet includes: each)
            ifFalse: [
		        aSet add: each.
		        each name isEmptyOrNil
		            ifFalse: [ aBlock value: each ]
		            ifTrue: [ each namedParsersDo: aBlock seen: aSet ] ] ]
]

{ #category : #'*petitgui-morphic-creational' }
PPParser >> newColumnMorph [
	^ AlignmentMorph newColumn
		cellPositioning: #topLeft;
		color: Color transparent;
		listCentering: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 0;
		yourself
]

{ #category : #'*petitgui-morphic-creational' }
PPParser >> newRowMorph [
	^ AlignmentMorph newRow
		cellPositioning: #topLeft;
		color: Color transparent;
		listCentering: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 0;
		yourself
]

{ #category : #'*petitgui-morphic-creational' }
PPParser >> newSpacerMorph [
	^ Morph new
		color: Color transparent;
		borderWidth: 0;
		extent: 7 @ 7;
		yourself
]

{ #category : #'*petitgui-mondrian' }
PPParser >> viewAllNamedParsers [
	"
	PPSmalltalkParser new viewAllNamedParsers
	"
	| view |
	view := RTMondrian new.
	self viewAllNamedParsersWithSelection: {} on: view.
	^ view openWithToolbarEntitled: 'All named parsers'
]

{ #category : #'*petitgui-mondrian' }
PPParser >> viewAllNamedParsersWithSelection: aCollectionOfNames on: view [
	self viewAllNamedParsersWithSelection: aCollectionOfNames previewing: [ :each | each name ] on: view
]

{ #category : #'*petitgui-mondrian' }
PPParser >> viewAllNamedParsersWithSelection: aCollectionOfNames previewing: aBlock on: view [
	| l |
	view shape label
		color: [ :each | 
					(aCollectionOfNames includes: each name)
						ifFalse: [ Color black ]
						ifTrue: [ Color red ] ];
		text: [ :each | each displayName ].
	view interaction popupText: aBlock.
	view interaction item: 'Explore' action: #explore.
	view nodes: (self allParsers reject: [ :each | each name isEmptyOrNil ]).
	view edges
		source: (self allParsers reject: [ :each | each name isEmptyOrNil ]) connectFrom: #yourself toAll: #namedParsers.
	l := view layout horizontalDominanceTree.
	l verticalGap: 10;
		layered
]

{ #category : #'*petitgui-mondrian' }
PPParser >> viewAllParsers [

	"
	PPSmalltalkParser new viewAllParsers
	"
	| view |
	view := RTMondrian new.
	self viewAllParsersOn: view.
	view openWithToolbarEntitled: 'All parsers'.
	^ view
]

{ #category : #'*petitgui-mondrian' }
PPParser >> viewAllParsersOn: view [

	view shape label 
		height: 10;
		text: [ :each | 
			| labels |
			labels := OrderedCollection new.
			each name notNil ifTrue: [ labels add: each name ].
			each visualizationGraphType notNil ifTrue: [ labels add: each visualizationGraphType ].
			labels asArray ];
		if: [ :p | p name isNil ] fillColor: Color lightGray.
	view nodes: self allParsers.
	view edges connectToAll: #children.	
	view treeLayout
]

{ #category : #'*petitgui-mondrian' }
PPParser >> visualizationGraphType [
	^ nil
]
