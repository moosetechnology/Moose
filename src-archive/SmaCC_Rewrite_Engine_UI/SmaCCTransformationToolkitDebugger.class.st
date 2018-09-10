Class {
	#name : #SmaCCTransformationToolkitDebugger,
	#superclass : #GTGenericStackDebugger,
	#category : #'SmaCC_Rewrite_Engine_UI'
}

{ #category : #testing }
SmaCCTransformationToolkitDebugger class >> availableAutomatically [
	^ true
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugger class >> defaultTitle [
	^ 'Transformation'
]

{ #category : #testing }
SmaCCTransformationToolkitDebugger class >> handlesContext: aContext [
	^ (aContext findContextSuchThat: [ :each | self isTransformationContext: each ]) notNil
]

{ #category : #'class initialization' }
SmaCCTransformationToolkitDebugger class >> initialize [
	self register
]

{ #category : #testing }
SmaCCTransformationToolkitDebugger class >> isTransformationContext: each [
	^ each selector = #rewriteTree: and: [ each receiver isKindOf: SmaCCRewriteEngine ]
]

{ #category : #'tools registry' }
SmaCCTransformationToolkitDebugger class >> register [
	self registerToolsOn: Smalltalk tools
]

{ #category : #'tools registry' }
SmaCCTransformationToolkitDebugger class >> registerToolsOn: aRegistry [
	aRegistry registerDebugger: self withRank: 70
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugger class >> sessionClass [
	^ SmaCCTransformationToolkitDebugSession
]

{ #category : #building }
SmaCCTransformationToolkitDebugger >> buildInputOutputSourceIn: browser [
	browser transmit
		to: #originalSource;
		andShow: [ :presentation | 
			presentation text
				title: 'Original Source';
				wrapped: false;
				withLineNumbers: true;
				display: self session originalSource;
				with: [ :text | self installActionsForRootPragmas: #(#SmaCCTransformationInput) in: text ] ].
	browser transmit
		to: #newSource;
		andShow: [ :presentation | 
			presentation text
				title: 'New Source';
				wrapped: false;
				withLineNumbers: true;
				display: self session newSource ].
	browser transmit
		from: #ruleStack port: #selection;
		transformed: [ :selection | self inputSelectionIntervalFor: selection ];
		to: #originalSource port: #selectionInterval.
	browser transmit
		from: #ruleStack port: #selection;
		transformed: [ :selection | self outputSelectionIntervalFor: selection ];
		to: #newSource port: #selectionInterval
]

{ #category : #building }
SmaCCTransformationToolkitDebugger >> buildRuleSourceIn: browser [
	browser transmit
		from: #ruleStack port: #selection;
		when: [ :selection | selection notNil and: [ selection first isKindOf: SmaCCRewrite ] ];
		to: #ruleSource;
		andShow: [ :presentation :selection | 
			presentation pharoScript
				title:
					(selection isNil
						ifTrue: [ 'Source' ]
						ifFalse: [ (self codeObjectForSelection: selection) title ]);
				morphicSelectionAct: [ :text | self saveRule: text text asString in: selection ] entitled: 'Save';
				display: [ :each | self sourceForSelection: each ];
				smalltalkClass: [ selection ifNotNil: [ selection last methodClass ] ];
				doItReceiver: [ selection ifNotNil: [ selection last receiver ] ];
				doItContext: [ selection ifNotNil: [ selection last ] ];
				initialize: [ :text | text selectionInterval: (self sourceSelectionIntervalFor: selection) ];
				with: [ :text | self installActionsForRootPragmas: #(#SmaCCTransformationStack) in: text ] ].
	browser transmit
		from: #ruleStack port: #selection;
		when: [ :selection | selection notNil and: [ selection first isKindOf: SmaCCRewriteMethodDefinition ] ];
		to: #ruleSource;
		andShow: [ :presentation :selection | 
			presentation pharoMethod
				title: 'Method';
				morphicSelectionAct: [ :text | self saveMethod: text text asString in: selection ] entitled: 'Save';
				display: [ :each | self sourceForSelection: each ];
				smalltalkClass: [ selection ifNotNil: [ selection last methodClass ] ];
				doItReceiver: [ selection ifNotNil: [ selection last receiver ] ];
				doItContext: [ selection ifNotNil: [ selection last ] ];
				initialize: [ :text | text selectionInterval: (selection last method sourceNodeForPC: selection last pc) debugHighlightRange ];
				with: [ :text | self installActionsForRootPragmas: #(#SmaCCTransformationStack) in: text ] ]
]

{ #category : #building }
SmaCCTransformationToolkitDebugger >> buildRuleStackIn: browser [
	browser transmit
		to: #ruleStack;
		andShow: [ :presentation | 
			| stack |
			stack := self session transformationStack.
			presentation list
				title: 'Stack';
				display: [ stack ];
				initialize: [ :list | 
					stack isEmpty
						ifFalse: [ list selection: stack first ] ];
				format: [ :each | 
					| isBlock |
					isBlock := each last isBlockContext.
					(isBlock
						ifTrue: [ '[' ]
						ifFalse: [ '' ]) , each first displayString
						,
							(isBlock
								ifTrue: [ ']' ]
								ifFalse: [ '' ]) ] ].
	browser transmit
		from: #ruleStack port: #selection;
		transformed: [ :each | each ifNotNil: [ each last ] ];
		to: #stack port: #selection
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> codeObjectForSelection: anArray [
	(anArray first isKindOf: SmaCCRewriteMethodDefinition)
		ifTrue: [ ^ anArray first ].
	^ (self isTransformation: anArray)
		ifTrue: [ anArray first transformation ]
		ifFalse: [ anArray first match ]
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugger >> currentInputSelectionInterval [
	^ self selectionIntervalForPane: #originalSource
]

{ #category : #building }
SmaCCTransformationToolkitDebugger >> debuggerStructureIn: browser [
	browser
		row: [ :row | 
			row
				column: #ruleStack span: 1;
				column: #ruleSource span: 3 ];
		row: [ :row | 
			row
				column: #originalSource;
				column: #newSource ];
		row: [ :row | 
			row
				column: #stack;
				column: #code ]
			size: 0;
		row: #inspector
]

{ #category : #building }
SmaCCTransformationToolkitDebugger >> debuggerTransmissionsIn: browser [
	super debuggerTransmissionsIn: browser.
	self buildInputOutputSourceIn: browser.
	self buildRuleStackIn: browser.
	self buildRuleSourceIn: browser.
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> equivalentNodeTo: aNode in: otherTree [
	| equivParent nodeIndex equivNode |
	aNode isMethod
		ifTrue: [ ^ otherTree ].
	(aNode parent isReturn and: [ aNode parent parent parent isMethod ])
		ifTrue: [ "Hack to handle the inserted return statements"
			equivNode := otherTree isSequence
				ifTrue: [ otherTree statements last ]
				ifFalse: [ otherTree ].
			^ equivNode isReturn
				ifTrue: [ equivNode value ]
				ifFalse: [ equivNode ] ].
	aNode parent isMethod
		ifTrue: [ otherTree isSequence
				ifTrue: [ ^ otherTree ]
				ifFalse: [ ^ otherTree parent ] ].
	equivParent := self equivalentNodeTo: aNode parent in: otherTree.
	equivParent isNil
		ifTrue: [ ^ nil ].
	nodeIndex := aNode parent children identityIndexOf: aNode.
	^ equivParent children at: nodeIndex ifAbsent: [ nil ]
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> findFirstContext: aContext [
	| next context |
	context := aContext.
	[ (next := context findSimilarSender) notNil ] whileTrue: [context := next].
	^ context
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> inputSelectionIntervalFor: selection [
	^ selection isNil
		ifTrue: [ 1 to: 0 ]
		ifFalse: [ selection last receiver match startPosition to: selection last receiver match stopPosition ]
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> intervalFromMethodNode: aNode inSource: aString [
	| otherTree otherNode |
	otherTree := RBParser parseExpression: aString onError: [ :msg :pos | ^ 1 to: 0 ].
	otherNode := self equivalentNodeTo: aNode in: otherTree.
	otherNode isNil
		ifTrue: [ ^ 1 to: 0 ].
	^ otherNode start to: otherNode stop
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> isTransformation: selection [
	^ selection first transformation method == selection last method
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> outputSelectionIntervalFor: selection [
	| source stop context match start |
	selection isNil
		ifTrue: [ ^ 1 to: 0 ].
	context := selection last receiver.
	source := context source.
	match := context match.
	start := context startIndexFor: match.
	stop := context stopIndexFor: match.
	^ (source stringIndexFor: start) to: (source stringIndexFor: stop)
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugger >> rewriteCode [
	^ self rewriteCodePane presentations first
]

{ #category : #accessing }
SmaCCTransformationToolkitDebugger >> rewriteCodePane [
	^ self browser paneNamed: #ruleSource
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> save: aString into: selection [
	| context obj newContext method |
	(obj := self codeObjectForSelection: selection) code: aString.
	method := obj method.
	context := self findFirstContext: selection last.
	context isBlockContext
		ifTrue: [ ^ self inform: 'Cannot find method context to restart' ].
	self session unwindAndRestartToContext: context.
	newContext := Context
		sender: context sender
		receiver: context receiver
		method: method
		arguments: #().
	newContext push: context receiver.
	newContext privRefresh.
	self session interruptedProcess suspendedContext: newContext.
	self session stepToFirstInterestingBytecodeIn: self session interruptedProcess.
	self session updateContextTo: newContext.
	self updateBrowser
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> saveMethod: aString in: selection [
	RBParser parseMethod: aString onError: [ :msg :pos | ^ self inform: 'Code does not parse' ].
	self save: aString into: selection
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> saveRule: aString in: selection [
	RBParser parseExpression: aString onError: [ :msg :pos | ^ self inform: 'Code does not parse' ].
	self save: aString into: selection
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> sourceForSelection: anArray [
	anArray isNil
		ifTrue: [ ^ '' ].
	^ (self codeObjectForSelection: anArray) source
]

{ #category : #private }
SmaCCTransformationToolkitDebugger >> sourceSelectionIntervalFor: selection [
	selection isNil
		ifTrue: [ ^ 1 to: 0 ].
	^ self intervalFromMethodNode: (selection last method sourceNodeForPC: selection last pc) inSource: (self sourceForSelection: selection)
]
