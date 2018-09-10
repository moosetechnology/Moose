"
Provides the right part of the PPBrowser when a parser is selected.

"
Class {
	#name : #PPDrabBrowser,
	#superclass : #Object,
	#instVars : [
		'browser',
		'input',
		'stream',
		'output',
		'rootClass'
	],
	#category : #'PetitGui-Core'
}

{ #category : #browse }
PPDrabBrowser >> browseClassesOn: aBrowser [
	aBrowser tree
		title: 'Grammars';
		format: [ :class | class name ];
		children: [ :class | self subclassesOf: class ];
		selectionAct: [
			| className |
			className := UIManager default 
				request: 'Class name' 
				initialAnswer: '' 
				title: 'New Parser'.
			className ifNotNil: [ 
				PPRefactoringUtils new 
					performRefactoring: (PPAddParserRefactoring
						name: className asSymbol
						category: #ParserExample
						superclass: self selectedClass).
				self selectedClass: (self class environment classNamed: className) ] ]
			on: $n entitled: 'New ... (n)';
		selectionAct: [
			| superclass |
			superclass := self selectedClass superclass.
			self performRefactoring: (PPRemoveParserRefactoring onClass: self selectedClass).
			self selectedClass: superclass ]
			on: $r entitled: 'Remove (x)';
		selectionAct: [
			self selectedClass browse ]
			on: $b entitled: 'Browse (b)'
]

{ #category : #'browse-static' }
PPDrabBrowser >> browseCyclesOn: aBrowser [
	aBrowser list
		title: 'Cycles';
		useExplicitNotNil;
		format: [ :parser | parser displayName ];
		display: [ :parsers | self production cycleSet ]
]

{ #category : #browse }
PPDrabBrowser >> browseDynamicOn: aBrowser [
	| tabulator |
	aBrowser useExplicitNotNil.
	
	tabulator := aBrowser tabulator.
	tabulator
		title: 'Dynamic';
		useExplicitNotNil;
		row: #input; row: #output.
	tabulator transmit
		to: #input;
		andShow: [ :a | self browseInputOn: a ].
	tabulator transmit
		to: #output;
		from: #input;
		andShow: [ :a | self browseOutputOn: a ].
		
	tabulator transmit
		from: #output;
		to: #input->#selectionInterval;
		when: [ :selection | selection notNil ];
		transformed: [ :selection | selection second to: selection third ]

]

{ #category : #'browse-static' }
PPDrabBrowser >> browseExampleOn: aBrowser [
	aBrowser text
		title: 'Example';
		useExplicitNotNil;
		display: [ :parsers | self production example ]
]

{ #category : #'browse-static' }
PPDrabBrowser >> browseFirstOn: aBrowser [
	aBrowser list
		title: 'First';
		useExplicitNotNil;
		format: [ :parser | parser displayName ];
		display: [ :parsers | self production firstSet ]
]

{ #category : #'browse-static' }
PPDrabBrowser >> browseFollowOn: aBrowser [
	aBrowser list
		title: 'Follow';
		useExplicitNotNil;
		format: [ :parser | parser displayName ];
		display: [ :parsers | 
			| parser |
			parser := self selectedClass new.
			parser followSets
				at: (parser productionAt: self selectedSelector)
				ifAbsent: [ Array with: nil asParser ] ]
]

{ #category : #'browse-static' }
PPDrabBrowser >> browseGraphOn: aBrowser [
	aBrowser morph
		title: 'Graph';
		useExplicitNotNil;
		display: [ :parsers |
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: self production morphicProduction.
			morph ]
]

{ #category : #'browse-dynamic' }
PPDrabBrowser >> browseInputOn: aBrowser [
	aBrowser text
		useExplicitNotNil;
		display: [ :class :selector | input ];
		selectionPopulate: #selection on: $s entitled: 'Parse (s)' with: [ :presentation |
			input := presentation text asString.
			stream := PPBrowserStream on: input.
			output := self production end 
				parse: stream.
			output isPetitFailure
				ifTrue: [ presentation selectionInterval: (output position + 1 to: output position) ].
			output ]
]

{ #category : #browse }
PPDrabBrowser >> browseOn: aComposite [
	aComposite title: PPBrowser label; color: Color yellow muchDarker.
	aComposite row: [ :row | row column: #class; column: #selector ].
	aComposite row: [ :row | row column: #part span: 2 ] span: 2.
	aComposite transmit 
		to: #class; 
		andShow: [ :composite | self browseClassesOn: composite ].
	aComposite transmit 
		to: #selector; 
		from: #class; 
		andShow: [ :composite | self browseSelectorsOn: composite ].
	aComposite transmit
		to: #part;
		from: #class;
		from: #selector;
		andShow: [ :composite | self browsePartsOn: composite ]
]

{ #category : #'browse-dynamic' }
PPDrabBrowser >> browseOutputOn: aBrowser [
	aBrowser text
		title: 'Result';
		display: [ output ];
		act: [:text | output inspect ] entitled: 'Inspect'.

	aBrowser list
		title: 'Debugger';
		format: [ :each | (String new: 2 * each fourth withAll: $ ) asText , each first, ' - ', each last printString ];
		selectionAct: [:list | list selection last inspect ] entitled: 'Inspect token';
		display: [ 
			| depth trace |
			depth := -1.
			trace := OrderedCollection new.
			(self production end transform: [ :each |
				each name notNil 
					ifTrue: [ 
						each >=> [ :s :cc |
							| t r |
							depth := depth + 1. 
							trace addLast: (t := Array with: each name with: s position + 1 with: s position with: depth with: Object new with: nil).
							r := cc value.
							t at: t size put: r.
							t at: 3 put: s position.
							r isPetitFailure
								ifFalse: [ t at: 1 put: (t at: 1) asText allBold ].
							depth := depth - 1.
							r ] ]
					ifFalse: [ each ] ])
				parse: input.
			trace ].
	aBrowser table 
		title: 'Tally';
		column: 'Parser' evaluated: [ :each | each first displayName ];
		column: 'Count' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ stream asFrequencyTable ].
	aBrowser table 
		title: 'Profile';
		column: 'Parser' evaluated: [ :each | each first displayName ];
		column: 'Time (ms)' evaluated: [ :each | each second printString ];
		column: 'Percentage (%)' evaluated: [ :each | each third printString ];
		display: [ stream asTimingTable ].
	aBrowser morph 
		title: 'Progress';
		display: [
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: stream asPositionMorph.
			morph ]
]

{ #category : #browse }
PPDrabBrowser >> browsePartsOn: aComposite [
	aComposite useExplicitNotNil.
	aComposite tabbedArrangement.
	self browseStaticOn: aComposite.
	self browseDynamicOn: aComposite
]

{ #category : #browse }
PPDrabBrowser >> browseSelectorsOn: aBrowser [
	aBrowser list
		title: 'Productions';
		format: [ :class | class asString ];
		display: [ :class | 
			((((class allInstVarNames
				copyWithoutAll: class ignoredNames)
				copyWithoutAll: self rootClass allInstVarNames)
				collect: [ :each | each asSymbol ])
				select: [ :each | class includesSelector: each ])
				asSortedCollection ];
		selectionAct: [
			| selector |
			selector := UIManager default 
				request: 'Production name' 
				initialAnswer: self selectedSelector
				title: 'New production'.
			selector ifNotNil: [ 
				self performRefactoring: (PPRenameProdcutionRefactoring
					onClass: self selectedClass
					rename: self selectedSelector
					to: selector asSymbol).
				self selectedSelector: selector asSymbol ] ]
			on: $r entitled: 'Rename... (r)';
		selectionAct: [
			self performRefactoring: (PPRemoveProductionRefactoring
				onClass: self selectedClass
				production: self selectedSelector).
			self selectedSelector: nil ]
			on: $r entitled: 'Remove (x)';
		selectionAct: [
			Smalltalk tools browser 
				openOnClass: self selectedClass 
				selector: self selectedSelector ] 
			on: $b entitled: 'Browse (b)'
]

{ #category : #'browse-static' }
PPDrabBrowser >> browseSourceOn: aBrowser [
	aBrowser pharoMethod
		title: 'Source';
		useExplicitNotNil;
		display: [ self sourceCode ];
		smalltalkClass: [ self selectedClass ];
		act: [ :node |
			| refactoring |
			refactoring := PPDefineProductionRefactoring 	
				onClass: self selectedClass 
				source: node text asString
				protocols: #(production).
			self performRefactoring: refactoring.
			self selectedSelector: refactoring selector ]
		on: $s 
		entitled: 'accept (s)'
]

{ #category : #browse }
PPDrabBrowser >> browseStaticOn: aBrowser [
	aBrowser useExplicitNotNil.
	aBrowser tabbedArrangement.
	self browseSourceOn: aBrowser.
	self browseGraphOn: aBrowser.
	self browseCyclesOn: aBrowser.
	self browseFirstOn: aBrowser.
	self browseFollowOn: aBrowser.
	self browseExampleOn: aBrowser
]

{ #category : #'initialize-release' }
PPDrabBrowser >> initialize [
	super initialize.
	input := String new.
	output := String new.
	stream := PPBrowserStream on: input
]

{ #category : #public }
PPDrabBrowser >> openOn: aClass [
	rootClass := aClass.
	browser := GLMTabulator new.
	self browseOn: browser.
	browser openOn: self rootModel
]

{ #category : #querying }
PPDrabBrowser >> performRefactoring: aRefactoring [
	^ PPRefactoringUtils new performRefactoring: aRefactoring
]

{ #category : #'accessing-view' }
PPDrabBrowser >> production [
	| parser |
	^ (parser := self selectedClass new)
		productionAt: (self selectedSelector
			ifNil: [ ^ parser ])
]

{ #category : #accessing }
PPDrabBrowser >> rootClass [
	^ rootClass
]

{ #category : #accessing }
PPDrabBrowser >> rootModel [
	^ self subclassesOf: self rootClass
]

{ #category : #'accessing-view' }
PPDrabBrowser >> selectedClass [
	^ ((browser paneNamed: #class) port: #selection) value
]

{ #category : #'accessing-view' }
PPDrabBrowser >> selectedClass: aClass [
	((browser paneNamed: #class) update; port: #selection) value: aClass
]

{ #category : #'accessing-view' }
PPDrabBrowser >> selectedSelector [
	^ ((browser paneNamed: #selector) port: #selection) value
]

{ #category : #'accessing-view' }
PPDrabBrowser >> selectedSelector: aSelector [
	((browser paneNamed: #selector) update; port: #selection) value: aSelector
]

{ #category : #'accessing-view' }
PPDrabBrowser >> sourceCode [
	^ (self selectedClass ifNil: [ ^ String new ]) 
		sourceCodeAt: (self selectedSelector ifNil: [ #start ])
		ifAbsent: [ String new ]
]

{ #category : #'accessing-view' }
PPDrabBrowser >> sourceCode: aString in: aClass [
	| tree source selector |
	tree := RBParser parseMethod: aString onError: [ :msg :pos | nil ].
	source := tree isNil
		ifTrue: [ aString ]
		ifFalse: [ 
			| rewriter |
			rewriter := RBParseTreeRewriter new.
			rewriter
				replace: '`#literal' with: '`#literal asParser' when: [ :node |
					(node isLiteralNode and: [ node value isString or: [ node value isCharacter ] ])
						and: [ (node parent isNil or: [ node parent isMessage not or: [ node parent selector ~= #asParser ] ])
						and: [ (node parents noneSatisfy: [ :each | each isBlock ]) ] ] ];
				replaceMethod: '`@method: `@args | `@temps | ``@.statements. ``.statement `{ :node | node isReturn not }' 
					with: '`@method: `@args | `@temps | ``@.statements. ^ ``.statement'.
			(rewriter executeTree: tree)
				ifTrue: [ rewriter tree newSource ]
				ifFalse: [ aString ] ].
	selector := aClass compile: source.
	(aString numArgs = 0 and: [ (aClass allInstVarNames includes: selector) not ])
		ifTrue: [ aClass addInstVarNamed: selector asString ].
	^ selector
]

{ #category : #querying }
PPDrabBrowser >> subclassesOf: aBehavior [
	^ aBehavior subclasses asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #public }
PPDrabBrowser >> update [
	browser entity: self rootModel
]
