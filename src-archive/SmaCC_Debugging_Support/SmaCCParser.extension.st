Extension { #name : #SmaCCParser }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> actionsAndSymbolsForState: stateIndex do: aBlock [
	| action bytes |
	bytes := self transitionTable at: stateIndex.
	(bytes at: 1) = 0
		ifTrue: [ action := ((bytes at: 2) bitShift: 8) + (bytes at: 3).
			4 to: bytes size by: 2 do: [ :i | aBlock value: action value: ((bytes at: i) bitShift: 8) + (bytes at: i + 1) ] ]
		ifFalse: [ 2 to: bytes size by: 4 do:
				[ :i | aBlock value: ((bytes at: i) bitShift: 8) + (bytes at: i + 1) value: ((bytes at: i + 2) bitShift: 8) + (bytes at: i + 3) ] ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> allActionsAndSymbolsForState: stateIndex do: aBlock [
	self
		actionsAndSymbolsForState: stateIndex
		do: [ :action :symbol | 
			| row |
			(action bitAnd: self actionMask) = 2r11
				ifTrue: [ row := self ambiguousTransitions at: (action bitShift: -2).
					1 to: row size by: 2 do: [ :i | aBlock value: ((row at: i) bitShift: 8) + (row at: i + 1) value: symbol ] ]
				ifFalse: [ aBlock value: action value: symbol ] ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser class >> filesWithParserErrorsIn: aDirectory [
	^ (self sourceFilesIn: aDirectory)
		select: [ :each | 
			[ self parseFile: each.
			false ]
				on: Error
				do: [ :ex | ex return: true ] ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> fillInGraphFromStack: nodeCollection returnTable: tableArray size: sizeInteger [
	self
		allActionsAndSymbolsForState: nodeCollection last state
		do: [ :action :symbol | 
			| id type next name entry top stream reduction |
			id := action bitShift: -2.
			type := action bitAnd: self actionMask.
			type = self acceptAction
				ifTrue: [ nodeCollection last success: true ].
			type = self shiftAction
				ifTrue: [ ((tableArray at: id) > sizeInteger or: [ self isAcceptState: id ])
						ifTrue: [ name := self symbolNameFor: symbol.
							next := nodeCollection last addDirectLinkToNodeNamed: name state: id.
							nodeCollection add: next.
							[ self fillInGraphFromStack: nodeCollection returnTable: tableArray size: sizeInteger + 1 ]
								ensure: [ nodeCollection removeLast ] ] ].
			type = self reduceAction
				ifTrue: [ entry := self reduceTable at: id.
					(entry at: 2) >= sizeInteger
						ifTrue: [ name := self symbolNameFor: entry first.
							stream := WriteStream on: String new.
							stream
								nextPutAll: name;
								nextPutAll: ' :'.
							nodeCollection size - (entry at: 2) + 1 to: nodeCollection size do: [ :i | 
								stream
									nextPut: $ ;
									nextPutAll: (nodeCollection at: i) name ].
							stream nextPut: $;.
							reduction := stream contents.
							top := nodeCollection at: nodeCollection size - (entry at: 2).
							nodeCollection size - (entry at: 2) + 1 to: nodeCollection size do: [ :i | (nodeCollection at: i) addReduction: reduction ].
							next := top addDirectLinkToNodeNamed: name state: ((self actionForState: top state and: entry first) bitShift: -2) ] ] ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> graphForStack: aCollection [
	| id name next graphNodeStack returnTable |
	graphNodeStack := OrderedCollection new.
	graphNodeStack add: (SmaCCGraphNode named: '' state: aCollection first parser: self).
	2 to: aCollection size do: [ :i | 
		id := self symbolIdForTransitionFrom: (aCollection at: i - 1) to: (aCollection at: i).
		name := self symbolNameFor: id.
		next := SmaCCGraphNode named: name state: (aCollection at: i) parser: self.
		graphNodeStack last followed: next.
		graphNodeStack add: next ].
	returnTable := self maxReturnSizeTable.
	self fillInGraphFromStack: graphNodeStack returnTable: returnTable size: 0.
	^ graphNodeStack first
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser class >> gtExampleSmaCCParser [
	<gtExample>
	<label: 'SmaCCParser'>
	
	^ SmaCCDefinitionParser new.
	
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> gtGraphInspectorViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	((Smalltalk includesKey: #RTView) not or: [ (self class >> #transitionTable) methodClass = SmaCCParser ])
		ifTrue: [ ^ nil ].
	composite roassal2
		title: 'Graph';
		initializeView: [ self roassalView ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser class >> gtGraphInspectorViewIn: composite [
	<gtInspectorPresentationOrder: 14>
	self new gtGraphInspectorViewIn: composite
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> isAcceptState: stateIndex [
	self
		allActionsAndSymbolsForState: stateIndex
		do: [ :action :symbol | 
			action = self acceptAction
				ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> layout: aView from: aNode position: aPoint [
	| element bottom nextLeft horizontalGap verticalGap position |
	horizontalGap := 20.
	verticalGap := 3.
	element := aView elementFromModel: aNode.
	nextLeft := aPoint x + element width + horizontalGap.
	bottom := aPoint y.
	aNode followed notNil
		ifTrue: [ bottom := (self layout: aView from: aNode followed position: nextLeft @ bottom) + verticalGap ].
	(aNode directLinks asSortedCollection: [ :a :b | a name < b name ]) do: [ :each | bottom := (self layout: aView from: each position: nextLeft @ bottom) + verticalGap ].
	bottom = aPoint y
		ifTrue: [ bottom := bottom + element height + verticalGap ].
	bottom := bottom - verticalGap.
	bottom := bottom max: aPoint y + element height.
	position := aPoint x @ ((bottom + aPoint y) / 2 - (element height / 2)).
	(Smalltalk at: #RTLayoutTranslator) default translateTopLeftOf: element to: position.
	^ bottom
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> maxReturnSizeTable [
	| table |
	table := Array new: self transitionTable size withAll: 0.
	1 to: table size do: [ :i | 
		self
			allActionsAndSymbolsForState: i
			do: [ :action :symbol | 
				(action bitAnd: self actionMask) = self reduceAction
					ifTrue: [ | size |
						size := (self reduceTable at: (action bitShift: -2)) at: 2.
						table at: i put: ((table at: i) max: size) ] ] ].
	table max
		timesRepeat: [ 1 to: table size do: [ :i | 
				self
					allActionsAndSymbolsForState: i
					do: [ :action :symbol | 
						(action bitAnd: self actionMask) = self shiftAction
							ifTrue: [ | size |
								size := (table at: (action bitShift: -2)) - 1.
								table at: i put: ((table at: i) max: size) ] ] ] ].
	^ table
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> roassalView [
	^ self roassalViewForStack: (stateStack ifNil: [ Array with: self class defaultStartingState ])
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> roassalViewForStack: stack [
	| shape nodes es root view |
	root := self graphForStack: stack.
	nodes := root allNodes.
	view := (Smalltalk at: #RTView) new.
	shape := (Smalltalk at: #RTEllipse) new
		color: Color white;
		borderColor: Color black;
		width: 25;
		height: 25;
		yourself.
	view add: (shape elementOn: root).
	shape := ((Smalltalk at: #RTRoundedBox) new
		borderRadius: [ :n | 
			('<"' includes: n name first)
				ifTrue: [ 0 ]
				ifFalse: [ 10 ] ];
		color: Color white;
		borderColor: [ :n | 
			n success
				ifTrue: [ Color green ]
				ifFalse: [ n isFollowed
						ifTrue: [ Color black ]
						ifFalse: [ Color lightGray ] ] ];
		yourself)
		+
			((Smalltalk at: #RTLabel) new
				color: [ :n | 
					n success
						ifTrue: [ Color green ]
						ifFalse: [ n isFollowed
								ifTrue: [ Color black ]
								ifFalse: [ Color lightGray ] ] ];
				text: [ :n | n name ];
				yourself).
	shape allOfSameSizeWithPadding.
	es := shape
		elementsOn:
			(nodes copy
				remove: root;
				yourself).
	view addAll: es.
	shape := (Smalltalk at: #RTMultiLine) new.
	shape orthoHorizontal.
	shape color: Color black.
	shape attachPoint: (Smalltalk at: #RTHorizontalAttachPoint) instance.
	(Smalltalk at: #RTEdgeBuilder) new
		view: view;
		objects: nodes;
		shape: shape;
		connectTo: [ :n | n followed ].
	shape := (Smalltalk at: #RTMultiLine) new.
	shape orthoHorizontal.
	shape color: Color lightGray.
	shape attachPoint: (Smalltalk at: #RTHorizontalAttachPoint) instance.
	(Smalltalk at: #RTEdgeBuilder) new
		view: view;
		objects: nodes;
		shape: shape;
		connectToAll: [ :n | n directLinks ].
	view elements @ ((Smalltalk at: #RTPopup) text: [ :n | n description ]).
	view @ (Smalltalk at: #RTDraggableView).
	self layout: view from: root position: 0 @ 0.
	^ view
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser class >> sourceFilesIn: aDirectory [
	^ aDirectory asFileReference allFiles
		select: [ :each | 
			| extension |
			extension := '.' , each extension.
			self fileExtensions includes: extension ]
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> symbolIdForTransitionFrom: fromState to: toState [
	| toValue |
	toValue := (toState bitShift: 2) bitOr: self shiftAction.
	self
		allActionsAndSymbolsForState: fromState
		do: [ :action :symbol | 
			toValue = action
				ifTrue: [ ^ symbol ] ].
	^ 0
]

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCParser >> symbolNameFor: anInteger [
	^ self symbolNames at: anInteger ifAbsent: [ '?' ]
]
