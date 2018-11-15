"
I provide the details on a parser view, as see in PPBrowser.


self new openOn: PPArithmeticParser
"
Class {
	#name : #PPParserBrowser,
	#superclass : #GLMCompositePresentation,
	#category : #'PetitGui-Core'
}

{ #category : #openning }
PPParserBrowser class >> openOn: aParserClass [  
	<script: 'self openOn: PPArithmeticParser'>
	^ self new openOn: aParserClass
]

{ #category : #building }
PPParserBrowser >> buildBrowser [
	"self openOn: PPArithmeticParser"
	| browser |
	
	browser := GLMTabulator new.
	browser title: [:each | each name].
	browser 
		row: [:r | r column: #productions ; column: #workspace span: 2];
		row: #inspector.
	browser transmit to: #productions; andShow: [:a | 
	 	self productionsIn: a ]. 
	browser transmit to: #workspace; fromOutsidePort: #entity; from: #productions; andShow: [:a | 
		self workspaceIn: a ]. 
	browser transmit to: #inspector; fromOutsidePort: #entity; from: #productions; passivelyFrom: #outer port: #sampleText; andShow: [:a |
		self inspectorIn: a ].
	browser transmit from: #inspector port: #sampleText; toOutsidePort: #sampleText; when: [:arg | arg notNil ].

	browser transmit from: #workspace; toOutsidePort: #productionToSelect; 
		transformed: [:parser | parser name ];
		when: [:parser | parser name notNil ].
	browser transmit fromOutsidePort: #productionToSelect; to: #productions port: #selection.
	^ browser
]

{ #category : #building }
PPParserBrowser >> compose [
	"self openOn: PPArithmeticParser"
	self title: [:each | each name].
	self tabulator with: [ :tabulator |
		tabulator 
			row: [:r | r column: #productions ; column: #workspace span: 2];
			row: #inspector.
		tabulator transmit to: #productions; andShow: [:a | 
		 	self productionsIn: a ]. 
		tabulator transmit to: #workspace; fromOutsidePort: #entity; from: #productions; andShow: [:a | 
			self workspaceIn: a ]. 
		tabulator transmit to: #inspector; fromOutsidePort: #entity; from: #productions; passivelyFrom: #outer port: #sampleText; andShow: [:a |
			self inspectorIn: a ].
		tabulator transmit from: #inspector port: #sampleText; toOutsidePort: #sampleText; when: [:arg | arg notNil ].

		tabulator transmit from: #workspace; toOutsidePort: #productionToSelect; 
			transformed: [:parser | parser name ];
			when: [:parser | parser name notNil ].
		tabulator transmit fromOutsidePort: #productionToSelect; to: #productions port: #selection ]
]

{ #category : #'private building' }
PPParserBrowser >> exampleIn: composite [
	composite text
		title: 'Example';
		useExplicitNotNil;
		display: [ :class :productionSelector | (self production: productionSelector from: class) example ];
		act: [:text | text update] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Generate another one'
]

{ #category : #'private building' }
PPParserBrowser >> firstIn: composite [
	composite list
		title: 'First';
		useExplicitNotNil;
		display: [ :class :productionSelector | (self production: productionSelector from: class) firstSet ];
		format: [ :parser | parser displayName ]
]

{ #category : #'private building' }
PPParserBrowser >> followIn: aBrowser [
	aBrowser list
		title: 'Follow';
		useExplicitNotNil;
		format: [ :parser | parser displayName ];
		display: [ :class :productionSelector | 
			| parser |
			parser := class new.
			parser followSets
				at: (parser productionAt: productionSelector)
				ifAbsent: [ Array with: nil asParser ] ]
]

{ #category : #'private building' }
PPParserBrowser >> graphIn: composite [
	composite morph
		title: 'Graph';
		useExplicitNotNil;
		display: [ :class :selector |
			| morph |
			morph := ScrollPane new.
			morph color: Color white.
			morph scroller addMorph: (self production: selector from: class) morphicProduction.
			morph ]
]

{ #category : #'private building' }
PPParserBrowser >> inspectorIn: composite [
	composite dynamic
		allowNil;
		display: [ :class :productionSelector :sampleText | 
					| wrapperBrowser |
					wrapperBrowser := GLMTabulator new.
					wrapperBrowser allowNil.
					wrapperBrowser column: #wrapped.
					wrapperBrowser transmit
						to: #wrapped;
						andShow: [ :a | a custom: (PPParserInspector new noTitle) ].

					wrapperBrowser transmit
						from: #wrapped port: #sampleText;
						toOutsidePort: #sampleText.
						
					wrapperBrowser transmit
						fromOutsidePort: #sampleText;
						to: #wrapped port: #sampleText.

					wrapperBrowser startOn: ([(self production: productionSelector from: class) end] on: Error do: [:e | nil]) .
					(wrapperBrowser pane port: #sampleText) value: (sampleText ifNil: [ '' ] ifNotNil: [ sampleText ]).
					wrapperBrowser
					]

				
]

{ #category : #'private building' }
PPParserBrowser >> mapIn: composite [
	self class environment at: #GLMRoassal2Presentation ifPresent: [ :cls |
		composite roassal2
			title: 'Map';
			useExplicitNotNil;
			initializeView: [ RTMondrian new ];
			painting: [ :view :class :selector |
				(self production: #start from: class)
					viewAllNamedParsersWithSelection: (Array with: selector)  
					previewing: [:eachParser | self sourceCodeFrom: class selector: eachParser name ]
					on:  view ] ]	

]

{ #category : #'private utilities' }
PPParserBrowser >> production: selector from: class [
	^ selector isNil 
		ifTrue: [ ^ PPSentinel instance ]
		ifFalse: [ class newStartingAt: selector ]
]

{ #category : #'private utilities' }
PPParserBrowser >> productionSelectorsFrom: class [
	^ (((class allInstVarNames copyWithoutAll: class ignoredNames)
		collect: [ :each | each asSymbol ])
			select: [ :each | class includesSelector: each ]) asSortedCollection add: #start; yourself
]

{ #category : #'private building' }
PPParserBrowser >> productionsIn: composite [
	"Doru: These menus should be built dynamically: title and enabled status should adapt" 
	"enabled: RBRefactoryChangeManager instance hasRedoableOperations"	" , RBRefactoryChangeManager instance redoChange"	"enabled: RBRefactoryChangeManager instance hasUndoableOperations"	" , RBRefactoryChangeManager instance undoChange "

	composite list
		title: [ :class | class name ];
		format: [ :class | class asString ];
		display: [ :class | self productionSelectorsFrom: class ];
		shouldValidate: true;
		act: [ :list :class | 
					RBRefactoryChangeManager instance redoOperation.
					list pane browser update ]
			icon: GLMUIThemeExtraIcons glamorousRedo
			entitled: 'Redo';
		act: [ :list :class | 
					RBRefactoryChangeManager instance undoOperation.
					list pane browser update ]
			icon: GLMUIThemeExtraIcons glamorousUndo
			entitled: 'Undo';
		selectionAct: [ :list  :class | 
					| oldName refactoring |
					oldName := list selection.
					refactoring := PPRefactoringUtils new performRenameProduction: oldName from: class.
					refactoring changes changes notEmpty ifTrue: [
						list update.
						list selection: refactoring changes changes first newName asSymbol ] ]
			on: $r
			entitled: 'Rename (r)';
		selectionAct: [ :list :class | 
					PPRefactoringUtils new performRefactoring: (PPRemoveProductionRefactoring onClass: class production: list selection).
					list pane browser update ]
			on: $x
			entitled: 'Remove (x)';
		selectionAct: [ :list :class | Smalltalk tools browser openOnClass: class selector: list selection ]
			on: $b
			entitled: 'Browse (b)';
		selectionAct: [ :list :class | (self production: list selection from: class) explore ]
			on: $I
			entitled: 'Explore (I)'
]

{ #category : #'private utilities' }
PPParserBrowser >> sourceCodeFrom: class selector: production [
	^ class ultimateSourceCodeAt: (production ifNil: [ #start ]) ifAbsent: [ String new ]
]

{ #category : #'private building' }
PPParserBrowser >> sourceIn: composite [
	composite pharoMethod
		title: 'Source';
		useExplicitNotNil;
		display: [ :class :production | self sourceCodeFrom: class selector: production ];
		smalltalkClass: [ :class | class ];
		selectionAct: [ :text :class :production | 
				| selector refactoring |
				selector := UIManager default
					request: 'Production name to extract to:'
					initialAnswer: ''
					title: 'Extract production'.
				selector isEmptyOrNil ifFalse: [
					selector := selector asSymbol.
					refactoring := PPExtractProductionRefactoring
						onClass: class
						production: production
						interval: text selectionInterval
						to: selector.
					PPRefactoringUtils new performRefactoring: refactoring.
					text pane browser update.
					(text pane port: #productionToSelect) value: selector ] ]
			on: $e
			entitled: 'Extract production';		
		act: [ :text :class :production | 
				| selector refactoring |
				refactoring := PPDefineProductionRefactoring 	
						onClass: class 
						source: text text asString 
						protocols: #(grammar).
				PPRefactoringUtils new performRefactoring: refactoring.
				selector := refactoring changes changes last selector.
				selector = production 
					ifTrue: [text update]
					ifFalse: [
						text pane browser update.
						(text pane port: #productionToSelect) value: selector ] ]
			icon: GLMUIThemeExtraIcons glamorousAccept
			on: $s
			entitled: 'Accept'
]

{ #category : #'private building' }
PPParserBrowser >> workspaceIn: composite [
	self sourceIn: composite.
	self graphIn: composite.
	self mapIn: composite.
	self exampleIn: composite.
	self firstIn: composite.
	self followIn: composite.
]
