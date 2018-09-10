Class {
	#name : #SmaCCScannerCompiler,
	#superclass : #Object,
	#instVars : [
		'grammar',
		'codeGenerator'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> addActions [
	self symbols
		keysAndValuesDo:
			[ :index :each | 
			each regularExpression
				ifNotNil: [ :eachRegex | eachRegex action: index ] ]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> addActionsFrom: aRegularExpression to: aKeywordMap at: states [
	^ states
		do:
			[ :state | 
			state ~= aRegularExpression action
				ifTrue:
					[ | keywordData |
					keywordData := grammar hasMultipleScannerStates
						ifTrue:
							[ Array
								with: aRegularExpression action
								with: aRegularExpression states asSortedCollection asArray ]
						ifFalse: [ aRegularExpression action ].
					aRegularExpression
						possibleMatchesDo:
							[ :string | 
							(aKeywordMap at: state ifAbsentPut: [ Dictionary new ])
								at: string
								put: keywordData ] ] ]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> addNormalSymbols [
	grammar symbols: (self symbols asSortedCollection: [ :a :b | a < b ])
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> addSpecialSymbols [
	grammar tokens
		keysDo:
			[ :each | 
			(codeGenerator scannerActionFor: each) notNil
				ifTrue: [ grammar terminalSymbolNamed: each ] ]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> addSpecificREsWithoutActionsTo: aRegularExpression [
	| dfa regex |
	regex := aRegularExpression.
	dfa := regex isNil
		ifTrue: [ nil ]
		ifFalse: [ regex asDFA ].
	self
		specificRegularExpressionsDo:
			[ :each | 
			| actions |
			actions := dfa isNil
				ifTrue: [ nil ]
				ifFalse: [ dfa actionForSpecificRegularExpression: each ].
			actions isNil
				ifTrue: [ regex := regex isNil
						ifTrue: [ each ]
						ifFalse: [ regex | each ] ] ].
	^ regex
]

{ #category : #'initialize-release' }
SmaCCScannerCompiler >> codeGenerator: aSmaCCCodeGenerator [
	codeGenerator := aSmaCCCodeGenerator
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> combinedGeneralRegexes [
	| combinedRegex |
	combinedRegex := nil.
	self
		generalRegularExpressionsDo:
			[ :each | 
			combinedRegex := combinedRegex isNil
				ifTrue: [ each ]
				ifFalse: [ combinedRegex | each ] ].
	^ combinedRegex
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileMethodsFor: regex [
	| keywordmap dfa selectorMap |
	dfa := regex asDFA.
	selectorMap := self computeSelectorMap.
	keywordmap := self computeKeywordMapFor: dfa.
	codeGenerator selectorMap: selectorMap.
	codeGenerator compileKeywordInitializerUsing: keywordmap.
	codeGenerator compileNode: dfa.
	codeGenerator
		compileEmptySymbolTokenId: (self symbols indexOf: grammar emptySymbol).
	codeGenerator
		compileErrorSymbolTokenId: (self symbols indexOf: grammar errorSymbol).
	codeGenerator compileIgnoreCaseMethods
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileScanner [
	| regex |
	regex := self createRegex.
	self compileTokenIdMethods.
	self compileMethodsFor: regex
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> compileTokenIdMethods [
	(self symbols select: [ :each | each createIdMethod ])
		do:
			[ :each | 
			codeGenerator
				compileTokenIdMethodNamed: each safeMethodName
				withId: (self symbols indexOf: each) ]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> computeKeywordMapFor: dfa [
	| keywordmap |
	keywordmap := Dictionary new.
	self
		specificRegularExpressionsDo:
			[ :each | 
			| actions |
			actions := dfa actionForSpecificRegularExpression: each.
			actions isNil
				ifFalse:
					[ self addActionsFrom: each to: keywordmap at: actions ] ].
	^ keywordmap
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> computeSelectorMap [
	| selectorMap |
	selectorMap := Dictionary new.
	self symbols
		keysAndValuesDo:
			[ :index :each | 
			(codeGenerator scannerActionFor: each name)
				ifNotNil: [ :selector | selectorMap at: index put: selector ] ].
	^ selectorMap
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> createRegex [
	self addSpecialSymbols.
	self addNormalSymbols.
	self addActions.
	^ self addSpecificREsWithoutActionsTo: self combinedGeneralRegexes
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> generalRegularExpressionsDo: aBlock [
	self
		regularExpressionsDo: [ :each | 
			each isKeywordLiteral
				ifFalse: [ aBlock value: each ] ]
]

{ #category : #'initialize-release' }
SmaCCScannerCompiler >> grammar: aGrammar [
	grammar := aGrammar
]

{ #category : #'compiling-scanner' }
SmaCCScannerCompiler >> regularExpressionsDo: aBlock [
	self symbols do: [ :each | each regularExpression ifNotNil: aBlock ]
]

{ #category : #'regular expression construction' }
SmaCCScannerCompiler >> specificRegularExpressionsDo: aBlock [
	self
		regularExpressionsDo: [ :each | 
			each isKeywordLiteral
				ifTrue: [ aBlock value: each ] ]
]

{ #category : #accessing }
SmaCCScannerCompiler >> symbols [
	^ grammar symbols
]
