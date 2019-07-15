"
SmaCCSmalltalkCodeGenerator represents a code generator for Smalltalk.

Instance Variables
	isExpressions	<Dictionary key: String value: Symbol>	a map of strings to is??? methods on String that answer true for those strings (e.g., '0123456789' -> #isDigit)
	parseTreeCache	<Dictionary key: Symbol value: RBProgramNode>	mapping from selector names to code compiled in the method

"
Class {
	#name : #SmaCCSmalltalkCodeGenerator,
	#superclass : #SmaCCCodeGenerator,
	#instVars : [
		'isExpressions',
		'parseTreeCache'
	],
	#classVars : [
		'MaxJumpSize',
		'MaxLiterals'
	],
	#classInstVars : [
		'keywords'
	],
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCSmalltalkCodeGenerator class >> codeTemplatesArray [
	^super codeTemplatesArray ,
		#(
			#(#addAllSendTo:with: 'self addAll: (<2s>) to: (<1s>)')
			#(#addAllFirstSendTo:with: 'self addAllFirst: (<2s>) to: (<1s>)')
			#(#addSendTo:with: 'self add: (<2s>) to: (<1s>)')
			#(#addFirstSendTo:with: 'self addFirst: (<2s>) to: (<1s>)')
			#(#arrayType '')
			#(#assignArray:index:to: '(<1s>) at: (<2p>) put: (<3s>)')
			#(#assignmentTo:from: '<1s> := <2s>')
			#(#at:index: '(<1s>) at: <2p>')
			#(#bitXor:with: '(<1s>) bitXor: (<2s>)')
			#(#booleanType '')
			#(#cast:to: '<1s>')
			#(#collectionType '')
			#(#collectionVariableItemsIn:forCollectionGetter:andVariableGetter: 'SmaCCParseNode collectionVariableIn: (<1s>) collectionGetter: <2p> variableGetter: <3p>')
			#(#compareEqual:to: '(<1s>) = (<2s>)')
			#(#copy:inContext:onlyNodes: '<1s> collect: [:each | <3?:(each isKindOf: SmaCCParseNode) ifTrue: [>each copyInContext: <2s>]<3?:]>')
			#(#copyNode: '(<1s>) copy')
			#(#copyNodeCollection: '(<1s>) collect: [:each | each copy]')
			#(#dictionaryType '')
			#(#endConditionalString ']')
			#(#endDoWhileLoopWithClause: '<1s>] whileTrue')
			#(#endLiteralArray ')')
			#(#endMethodString '')
			#(#hashFor: '(<1s>) hash')
			#(#ifFalseReturn: '(<1s>) ifFalse: [^false]')
			#(#integerType '')
			#(#isKindOfTest:class: '(<1s> isKindOf: <2s>) ifTrue: [')
			#(#iterateObjects:name: '(<1s>) do: [:<2s> |')
			#(#literalArraySeparator ' ')
			#(#newArrayOfSize: 'Array new: <1p>')
			#(#newCollectionOfSize: 'OrderedCollection new: <1p>')
			#(#newObject: '<1s> new')
			#(#newUnsignedShortArrayArray '#(')
			#(#nodeCollectionType 'OrderedCollection')
			#(#notNilCheckFor: '(<1s>) notNil ifTrue: [')
			#(#objectType 'Object')
			#(#private '')
			#(#protected '')
			#(#public '')
			#(#receiverName 'self')
			#(#reduceActionArrayType '')
			#(#reduceActionLiteralStart '#(')
			#(#return: '^<1s>')
			#(#startDoWhileLoop '[')
			#(#startIfWithClause: '(<1s>) ifTrue: [')
			#(#statementSeparator '.')
			#(#static '')
			#(#stringType '')
			#(#undefinedObject 'nil')
			#(#unsignedShort '')
			#(#unsignedShortArrayArray '')
			#(#uppercaseString: '(<1s>) asUppercase')
			#(#variableDeclaration:ofType: '| <1s> |')
			#(#variableItemIn:forVariableGetter: 'SmaCCParseNode variableIn: (<1s>) getter: <2p>')
			#(#virtual '')
			#(#voidType '')
		)
]

{ #category : #'class initialization' }
SmaCCSmalltalkCodeGenerator class >> initialize [
	MaxJumpSize := 900.
	MaxLiterals := 30
]

{ #category : #private }
SmaCCSmalltalkCodeGenerator class >> keywords [
	"While Smalltalk doesn't have many keywords, we don't want to overwrite any existing method."

	^ keywords
		ifNil:
			[ keywords := (SmaCCParseNode allSelectors
				inject: #('self' 'super' 'nil' 'true' 'false') asSet
				into:
					[ :sum :each | 
			(each numArgs <= 1 and: [ each isInfix not ])
				ifTrue:
					[ sum
						add:
							(each last = $:
								ifTrue: [ each first: each size - 1 ]
								ifFalse: [ each ]) asString ].
			sum ])
				remove: 'name' ifAbsent: [  ];
				remove: 'value' ifAbsent: [  ];
				remove: 'annotations' ifAbsent: [  ];
				yourself ]
]

{ #category : #accessing }
SmaCCSmalltalkCodeGenerator class >> parseSourceSelector [
	^ #canParseSmalltalk:
]

{ #category : #accessing }
SmaCCSmalltalkCodeGenerator class >> typeName [
	^ #Smalltalk
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> acceptStateEdge: aSmaCCStateEdge [
	^ aSmaCCStateEdge transitionObjects size = 1
		ifTrue: [ 'scope == #'
				, aSmaCCStateEdge transitionObjects asArray first ]
		ifFalse:
			[ '(' , aSmaCCStateEdge transitionObjects asArray storeString
				, ' includes: scope)' ]
]

{ #category : #private }
SmaCCSmalltalkCodeGenerator >> addImplementationSpecificRewritesTo: rewriter [
	rewriter
		replace:
			'`{:node :dict | (node isLiteralNode and: [(node value isKindOf: Character) and: [(node value codePoint between: 32 and: 126) not]]) ifTrue: [dict at: ''literal'' put: node. true] ifFalse: [false]}'
			with: '(Character value: `{:dict | RBLiteralNode value: (dict at: ''literal'') value codePoint})';
		replace:
			'``@.Stmts1.
				(`@a ifTrue: [``@.Stmts2]) `{:node :dictionary | | index myStatements |
						index := node parent statements indexOf: node.
						myStatements := node parent statements.
						dictionary at: #size put: ``@.Stmts2 size - (myStatements size - index).
						index ~~  myStatements size and: [``@.Stmts2 size >= (myStatements size - index) and: [
							(index + 1 to: myStatements size) allSatisfy: [:each | 
								(myStatements at: each) = (``@.Stmts2 at: ``@.Stmts2 size - (myStatements size - each))]]]
						}.
				``@.Stmts3'
			with:
			'``@.Stmts1.
				`{:dictionary | RBMessageNode receiver: `@a selector: #ifTrue: arguments: (Array with: (RBBlockNode body: (RBSequenceNode statements: (``@.Stmts2 copyFrom: 1 to: (dictionary at: #size)))))}.
				``@.Stmts3';
		replace: 'currentCharacter == `#l1 or: [currentCharacter == `#l2]'
			with:
			'`{RBLiteralNode value: (String with: `#l1 value with: `#l2 value)} includes: currentCharacter';
		replace: 'currentCharacter == `#l1 or: [currentCharacter == `#l2 or: `@a]'
			with:
			'(`{RBLiteralNode value: (String with: `#l1 value with: `#l2 value)} includes: currentCharacter) or: `@a';
		replace: '(`#l1 includes: currentCharacter) or: [currentCharacter == `#l2]'
			with:
			'`{RBLiteralNode value: `#l1 value , (String with: `#l2 value)} includes: currentCharacter';
		replace:
			'(`#l1 includes: currentCharacter) or: [currentCharacter == `#l2 or: `@a]'
			with:
			'(`{RBLiteralNode value: `#l1 value , (String with: `#l2 value)} includes: currentCharacter) or: `@a';
		replace:
			'`@.Stmts1.
				currentCharacter isLiteral ifTrue: [`@.Stmts2].
				`@.Stmts3'
			with:
			'`@.Stmts1.
				`@.Stmts2'.
	rewriter
		replace: 'currentCharacter == (Character value: `@a)'
		with: 'currentCharacter = (Character value: `@a)'
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> addVariable: aSmaCCVariableDefinition forDefinition: aSmaCCNodeClassDefinition [
	| instVarName |
	instVarName := self
		nonKeywordNameFor: aSmaCCVariableDefinition sourceVariableName.
	(aSmaCCNodeClassDefinition modelClass
		definesInstanceVariable: instVarName)
		ifTrue: [ ^ self ].
	aSmaCCNodeClassDefinition modelClass addInstanceVariable: instVarName
]

{ #category : #'reduction table' }
SmaCCSmalltalkCodeGenerator >> basicCompileSourceFor: aSmaCCReduceAction [
	| parseTree rewriter methodName existing |
	parseTree := RBParser
		parseExpression: aSmaCCReduceAction rhs reduceAction source.
	(parseTree isLiteralNode
		and:
			[ parseTree value isSymbol
				and:
					[ parseTree value numArgs <= 1
						and: [ self parserClass definesMethod: parseTree value ] ] ])
		ifTrue: [ ^ parseTree value ].
	rewriter := self parseTreeRewriterFor: aSmaCCReduceAction rhs.
	rewriter executeTree: parseTree.
	parseTree := rewriter tree.
	methodName := ('reduceActionFor'
		, aSmaCCReduceAction symbol safeMethodName
		,
			(aSmaCCReduceAction symbol positionOf: aSmaCCReduceAction rhs)
				printString , ':') asSymbol.
	parseTree isSequence
		ifFalse: [ parseTree := RBSequenceNode
				statements: (Array with: parseTree) ].
	parseTree := RBMethodNode
		selector: methodName
		arguments: (Array with: (RBVariableNode named: 'nodes'))
		body: parseTree.
	parseTree addReturn.
	existing := self findExistingMethodFor: parseTree.
	existing notNil
		ifTrue: [ ^ existing ].
	self parserClass
		compile: parseTree formattedCode
		classified: 'generated-reduction actions'.
	^ methodName
]

{ #category : #accessing }
SmaCCSmalltalkCodeGenerator >> changes [
	^ model changes
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> closestIsExpressionsFor: aSmaCCCharacterEdge seen: aCollection [
	| expressions |
	expressions := OrderedCollection new.
	isExpressions
		keysAndValuesDo:
			[ :string :selector | 
			| isInString |
			isInString := false.
			((string
				allSatisfy:
					[ :each | 
					(aSmaCCCharacterEdge transitionObjects includes: each)
						ifTrue: [ isInString := true ]
						ifFalse: [ aCollection includes: each ] ]) and: [ isInString ])
				ifTrue: [ expressions add: selector ] ].
	(expressions isEmpty
		or:
			[ (self minMaxPairsFor: aSmaCCCharacterEdge without: expressions) size
				> (self minMaxPairsFor: aSmaCCCharacterEdge without: #()) size ])
		ifTrue: [ ^ #() ].
	expressions size > 1
		ifTrue:
			[ | strings newExpressions |
			strings := expressions
				collect:
					[ :each | 
					each
						->
							((isExpressions keyAtValue: each)
								select: [ :char | aSmaCCCharacterEdge transitionObjects includes: char ]) ].
			strings := strings
				asSortedCollection:
					[ :a :b | 
					a value size > b value size
						or:
							[ a value size = b value size
								and:
									[ (isExpressions keyAtValue: a key) size
										< (isExpressions keyAtValue: b key) size ] ] ].
			newExpressions := OrderedCollection with: strings first.
			2 to: strings size do:
				[ :i | 
				| left |
				left := (strings at: i) value.
				newExpressions
					do: [ :each | left := left reject: [ :char | each value includes: char ] ].
				left notEmpty
					ifTrue: [ newExpressions add: (strings at: i) ] ].
			expressions := newExpressions collect: [ :each | each key ] ].
	^ expressions
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> comment: aString [
	^ '"' , (aString trim copyReplaceAll: '"' with: '""') , '"'
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> commonIfTrueCodeRewriter [
	^ RBParseTreeRewriter new
		replace:
			'``@.Stmts1.
				(`@a ifTrue: ``@block) `{:node :dictionary | | index myStatements |
						index := node parent statements indexOf: node.
						myStatements := node parent statements.
						dictionary at: #size put: ``@block body statements size - (myStatements size - index).
						index ~~  myStatements size and: [``@block body statements size >= (myStatements size - index) and: [
							(index + 1 to: myStatements size) allSatisfy: [:each | 
								(myStatements at: each) = (``@block body statements at: ``@block body statements size - (myStatements size - each))]]]
						}.
				``@.Stmts3'
			with:
			'``@.Stmts1.
				`{:dictionary | RBMessageNode receiver: `@a selector: #ifTrue: arguments: (Array with: (RBBlockNode body: (RBSequenceNode statements: (``@block body statements copyFrom: 1 to: (dictionary at: #size)))))}.
				``@.Stmts3';
		yourself
]

{ #category : #'compiling-parser' }
SmaCCSmalltalkCodeGenerator >> compileCacheId [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'cacheId';
		cr;
		tab;
		nextPutAll: '^''';
		nextPutAll: DateAndTime now printString;
		nextPut: $'.
	parserClass theMetaClass compile: stream contents classified: #'generated-accessing'
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> compileChanges [
	self removeUnnecessaryChanges.
	RBRefactoryChangeManager instance performChange: self changes.
	parserClass realClass ifNotNil: [ :each | each resetCaches ].
	scannerClass realClass
		ifNotNil: [ :each | each initializeKeywordMap ]
]

{ #category : #'compiling-nodes' }
SmaCCSmalltalkCodeGenerator >> compileChildrenMethod: aSmaCCNodeClassDefinition [
	
]

{ #category : #'compiling-nodes' }
SmaCCSmalltalkCodeGenerator >> compileCopyInContextMethod: aSmaCCNodeClassDefinition [
	
]

{ #category : #'compiling-nodes' }
SmaCCSmalltalkCodeGenerator >> compileEqualMethod: aSmaCCNodeClassDefinition [
	
]

{ #category : #'compiling-nodes' }
SmaCCSmalltalkCodeGenerator >> compileHashMethod: aSmaCCNodeClassDefinition [
	
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> compileIgnoreCaseMethods [
	super compileIgnoreCaseMethods.
	self grammar ignoreCase
		ifFalse: [ ^ self ].
	scannerClass
		compile:
			'tokenClass
	^SmaCCCaseInsensitiveToken'
		classified: #generated
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> compileInitializeMethod: aSmaCCNodeClassDefinition [
	| stream |
	((aSmaCCNodeClassDefinition modelClass definesMethod: #initialize)
		and: [ aSmaCCNodeClassDefinition collectionVariableDefinitions isEmpty ])
		ifTrue: [ ^ self ].
	stream := WriteStream on: String new.
	stream nextPutAll: 'initialize'.
	(aSmaCCNodeClassDefinition modelClass superclass
		definesMethod: #initialize)
		ifTrue: [ stream
				cr;
				tab;
				nextPutAll: 'super initialize.' ].
	aSmaCCNodeClassDefinition collectionVariableDefinitions
		do:
			[ :each | 
			stream
				cr;
				tab;
				nextPutAll: (self nonKeywordNameFor: each sourceVariableName);
				nextPutAll: ' := OrderedCollection new: 2.' ].
	aSmaCCNodeClassDefinition modelClass
		compile: stream contents
		classified: #'generated-initialize-release'
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> compileKeywordInitializerUsing: keywordMapDictionary [
	| stream dataStream |
	keywordMapDictionary isEmpty
		ifTrue: [ ^ self ].
	stream := WriteStream with: String new.
	stream nextPutAll: 'initializeKeywordMap'.
	stream nextPutAll: ' keywordMap :=  Dictionary new. '.
	dataStream := WriteStream with: Array new.
	keywordMapDictionary
		keysAndValuesDo:
			[ :key :value | 
			value keys asSortedCollection
				do:
					[ :each | 
					dataStream
						nextPut:
							(Array with: key with: each with: (value at: each)) ] ].
	stream
		nextPutAll: '#(';
		cr.
	dataStream contents
		do:
			[ :each | 
			stream nextPutAll: '#('.
			each
				do: [ :item | item storeOn: stream ]
				separatedBy: [ stream nextPut: $  ].
			stream nextPut: $) ]
		separatedBy: [ stream cr ].
	stream nextPut: $).
	stream
		nextPutAll:
			' do: [:each | (keywordMap at: each first ifAbsentPut: [Dictionary new]) at: (each at: 2) put: each last]. ^keywordMap'.
	scannerClass theMetaClass
		compile: (RBParser parseMethod: stream contents) formattedCode
		classified: #'generated-initialization'
]

{ #category : #'compiling-nodes' }
SmaCCSmalltalkCodeGenerator >> compileMatchInContextMethod: aSmaCCNodeClassDefinition [
	
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> compileMethodIn: modelClass [
	modelClass compile: self formattedCode classified: #generated
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> compileMethodWithoutFormattingIn: modelClass [
	| code |
	code := self codeStream contents.
	code := code trim.
	modelClass compile: code classified: #generated
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> compileOptimizedMethodIn: modelClass [
	| tree |
	tree := RBParser parseMethod: self codeStream contents.
	self rewriters
		do: [ :each | [ each executeTree: tree ] whileTrue: [ tree := each tree ] ].
	self compileScannerTree: tree into: modelClass
]

{ #category : #'compiling-nodes' }
SmaCCSmalltalkCodeGenerator >> compilePostCopyMethod: aSmaCCNodeClassDefinition [
	
]

{ #category : #'compiling-parser' }
SmaCCSmalltalkCodeGenerator >> compileScannerClassIntoParser [
	| stream |
	stream := WriteStream with: String new.
	stream
		nextPutAll: 'scannerClass';
		cr;
		tab;
		nextPutAll: '^';
		nextPutAll: scannerClass name.
	parserClass theMetaClass
		compile: stream contents
		classified: #'generated-accessing'
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> compileScannerTree: tree into: modelClass [
	| i |
	i := 1.
	[ (self countLiteralsIn: tree) > self maxLiterals
		and:
			[ (self
				splitIfTrueBranchFrom: tree
				usingName: (tree selector , 'X' , i printString) asSymbol
				into: modelClass)
				or:
					[ self
						splitSequenceFrom: tree
						usingName: (tree selector , 'X' , i printString) asSymbol
						into: modelClass ] ] ] whileTrue: [ i := i + 1 ].
	modelClass compile: tree formattedCode classified: #generated
]

{ #category : #'compiling-parser' }
SmaCCSmalltalkCodeGenerator >> compileSymbolTypes: anArray [
	self
		startPublicVirtualMethod;
		nextPutLine: (self method: 'symbolTypes' type: self arrayType);
		nextPutStatement: (self return: anArray storeString);
		endMethod;
		compileMethodIn: self parserClass
]

{ #category : #'compiling-nodes' }
SmaCCSmalltalkCodeGenerator >> compileVariablesMethods: aSmaCCNodeClassDefinition [
	| compileBlock allVariables class |
	allVariables := OrderedCollection new.
	class := aSmaCCNodeClassDefinition.
	[ class notNil ]
		whileTrue:
			[ allVariables addAll: class variableDefinitions.
			class := class superclass ].
	compileBlock := [ :variables :methodName | 
	| vars ignoredVars |
	ignoredVars := variables
		select: [ :each | grammar ignoredVariables includes: each variableName ].
	vars := variables
		reject: [ :each | grammar ignoredVariables includes: each variableName ].
	(vars
		anySatisfy: [ :each | aSmaCCNodeClassDefinition isLocalVariable: each ])
		ifTrue:
			[ self
				startPublicOverrideMethod;
				nextPutLine: (self method: methodName type: self collectionType);
				nextPutStatement:
					(self
						return:
							(vars collect: [ :each | each getterMethodName asSymbol ]) asArray
								storeString);
				endMethod;
				compileMethodIn: aSmaCCNodeClassDefinition modelClass ].
	(ignoredVars
		anySatisfy: [ :each | aSmaCCNodeClassDefinition isLocalVariable: each ])
		ifTrue:
			[ | ignoredMethodName |
			ignoredMethodName := methodName copy.
			ignoredMethodName at: 1 put: ignoredMethodName first asUppercase.
			ignoredMethodName := 'ignored' , ignoredMethodName.
			self
				startPublicOverrideMethod;
				nextPutLine: (self method: ignoredMethodName type: self collectionType);
				nextPutStatement:
					(self
						return:
							(ignoredVars collect: [ :each | each getterMethodName asSymbol ])
								asArray storeString);
				endMethod;
				compileMethodIn: aSmaCCNodeClassDefinition modelClass ] ].
	compileBlock
		value:
			(allVariables
				select: [ :each | each isBaseNodeType and: [ each isCollection not ] ])
			value: 'nodeVariables';
		value:
			(allVariables
				select: [ :each | each isBaseNodeType and: [ each isCollection ] ])
			value: 'compositeNodeVariables';
		value:
			(allVariables
				select: [ :each | each isBaseTokenType and: [ each isCollection not ] ])
			value: 'tokenVariables';
		value:
			(allVariables
				select: [ :each | each isBaseTokenType and: [ each isCollection ] ])
			value: 'compositeTokenVariables';
		value:
			(allVariables
				select: [ :each | each isBaseTokenType not and: [ each isBaseNodeType not ] ])
			value: 'otherVariables'
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> countLiteralsIn: aParseTree [
	| literals |
	literals := Set new.
	aParseTree
		nodesDo:
			[ :each | 
			each isLiteralNode
				ifTrue: [ each parent isLiteralNode
						ifFalse: [ literals add: each value ] ].
			each isMessage
				ifTrue: [ literals add: each selector ] ].
	^ literals size
]

{ #category : #'reduction table' }
SmaCCSmalltalkCodeGenerator >> defaultNodeReductionSource: aReduction [
	aReduction index = 0
		ifTrue: [ ^ 'nil' ].
	^ '''' , aReduction index printString , ''''
]

{ #category : #'reduction table' }
SmaCCSmalltalkCodeGenerator >> defaultReductionSource [
	^ '#reduceFor:'
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> defineClass: aString asSubclassOf: aBehavior [
	| current variables |
	current := Smalltalk at: aString asSymbol ifAbsent: [ Object ].
	variables := ''.
	(current includesBehavior: SmaCCParser) | (current includesBehavior: SmaCCScanner)
		ifTrue:
			[ | stream |
			stream := WriteStream on: String new.
			current instVarNames
				do: [ :each | 
					stream
						nextPutAll: each;
						space ].
			variables := stream contents ].
	model
		defineClass:
			aBehavior name , ' subclass: #' , aString , ' instanceVariableNames: ''' , variables
				,
					(''' classVariableNames: '''' poolDictionaries: '''' category: '''
						, (defaultCategory ifNil: [ RPackage defaultPackageName ]) , ''' ').
	^ model classNamed: aString asSymbol
]

{ #category : #'reduction table' }
SmaCCSmalltalkCodeGenerator >> findExistingMethodFor: aRBMethodNode [
	| potentialSelectors |
	potentialSelectors := #(#liftFirstValue: #liftLastValue: #liftSecondValue: #nil #stringValue:)
		asSet.
	potentialSelectors
		addAll: (self parserClass selectors select: [ :each | each numArgs <= 1 ]).
	^ potentialSelectors
		detect:
			[ :each | 
			| parseTree |
			parseTree := self parserParseTreeFor: each.
			parseTree notNil
				and:
					[ aRBMethodNode body
						equalTo: parseTree body
						exceptForVariables: aRBMethodNode argumentNames ] ]
		ifNone: [ nil ]
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> formattedCode [
	^ (RBParser parseMethod: self codeStream contents) formattedCode
]

{ #category : #private }
SmaCCSmalltalkCodeGenerator >> generatedMethodsIn: aRBClass [
	^ aRBClass selectors
		select:
			[ :each | 
			(aRBClass protocolsFor: each)
				anySatisfy: [ :protocol | protocol notNil and: [ 'generated*' match: protocol ] ] ]
]

{ #category : #testing }
SmaCCSmalltalkCodeGenerator >> hasLiteralByteArrays [
	^ true
]

{ #category : #'initialize-release' }
SmaCCSmalltalkCodeGenerator >> initialize [
	super initialize.
	model := RBNamespace new
		name: 'Compile Scanner/Parser';
		yourself.
	self initializeIsExpressions.
	parseTreeCache := Dictionary new
]

{ #category : #private }
SmaCCSmalltalkCodeGenerator >> initializeIsExpressions [
	| expressions |
	isExpressions := Dictionary new.
	expressions := SmaCCGrammar isExpressionMap.
	(expressions keys asSortedCollection: [ :a :b | a size > b size or: [ a size = b size and: [ a > b ] ] ])
		do: [ :key | isExpressions at: (expressions at: key) put: key ]
]

{ #category : #private }
SmaCCSmalltalkCodeGenerator >> keywords [
	^ self class keywords
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> maxJumpSize [
	^ MaxJumpSize
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> maxLiterals [
	^ MaxLiterals
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> method: aString type: typeString [
	^ aString
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> method: aString type: anObject argumentName: argumentNameString argumentType: argumentTypeString [
	^ aString , ' ' , argumentNameString
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> method: aString type: anObject argumentName: firstArgumentNameString argumentType: firstArgumentTypeString argumentName: secondArgumentNameString argumentType: secondArgumentTypeString [
	| keywords |
	keywords := aString asSymbol keywords.
	^ keywords first , ' ' , firstArgumentNameString , ' '
		, keywords last , ' ' , secondArgumentNameString
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> optimizationRewriter [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				currentCharacter == `#l ifTrue: [`@.Stmts3. ^`@r3].
				`@.Stmts4'
			with:
			'`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				`@.Stmts3. ^`@r3';
		replace:
			'`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				currentCharacter == `#l ifTrue: [`@.Stmts3].
				`@.Stmts4'
			with:
			'`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				`@.Stmts3. 
				`@.Stmts4';
		replaceMethod:
			'`name
					`@.Stmts1.
					`@a ifTrue: [^self `name].
					`@.Stmts3'
			with:
			'`name
					[`@.Stmts1.
					`@a] whileTrue.
					`@.Stmts3';
		replaceMethod:
			'`name
					`@.Stmts1.
					`@a ifTrue: [`@.Stmts2.
							^self `name].
					`@.Stmts3'
			with:
			'`name
					[`@.Stmts1.
					`@a] whileTrue: [`@.Stmts2].
					`@.Stmts3';
		replace:
			'`@.Stmts1.
				currentCharacter isLiteral ifTrue: [`@.Stmts2].
				`@.Stmts3'
			with:
			'`@.Stmts1.
				`@.Stmts2';
		replace:
			'`@.Stmts1.
				`.Stmt.
				`@.Stmts.
				`@a ifTrue: [self step. `.Stmt. `@.Stmts].
				`@.Stmts2'
			with:
			'`@.Stmts1.
				`@a ifTrue: [self step].
				`.Stmt.
				`@.Stmts.
				`@.Stmts2';
		replace:
			'`@.Stmts1.
				true ifTrue: [`@.Stmts2. ^`@obj].
				`@.Stmts3'
			with:
			'`@.Stmts1.
				`@.Stmts2.
				^`@obj';
		replace:
			'`@.Stmts1.
				[`@.Stmts2. true] whileTrue.
				^`@Stmt'
			with:
			'`@.Stmts1.
				[`@.Stmts2. true] whileTrue.'.
	self addImplementationSpecificRewritesTo: rewriter.
	^ rewriter
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> outputGreaterThanMatch: each on: stream [
	stream
		nextPutAll: 'currentCharacter >= ';
		nextPutAll: each first storeString
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> outputInvertedMatchFor: aSmaCCCharacterEdge on: stream [
	| char |
	char := Character
		value:
			((0 to: SmaCCGrammar maximumCharacterValue)
				detect:
					[ :each | 
					(aSmaCCCharacterEdge transitionObjects
						includes: (Character value: each)) not ]).
	stream
		nextPutAll: 'currentCharacter ~~ ';
		nextPutAll: char storeString
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> outputIsSelector: isSelector on: stream [
	stream nextPutAll: 'currentCharacter ' , isSelector
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> outputLessThanMatch: each on: stream [
	stream
		nextPutAll: 'currentCharacter <= ';
		nextPutAll: each last storeString
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> outputMatchFor: aSmaCCCharacterEdge on: stream without: isSelectors [
	| pairs |
	pairs := self
		minMaxPairsFor: aSmaCCCharacterEdge
		without: isSelectors.
	pairs isEmpty
		ifTrue: [ stream next: isSelectors size - 1 put: $].
			^ self ].
	isSelectors notEmpty
		ifTrue: [ stream nextPutAll: ' or: [' ].
	pairs
		do: [ :each | self outputMatchForTransition: each on: stream ]
		separatedBy: [ stream nextPutAll: ' or: [' ].
	stream next: pairs size - 1 put: $].
	stream next: isSelectors size put: $]
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> outputMatchForTransition: each on: stream [
	each first = each last
		ifTrue: [ ^ self outputSingleCharacterMatch: each on: stream ].
	each first = (Character value: 0)
		ifTrue: [ ^ self outputLessThanMatch: each on: stream ].
	each last = (Character value: SmaCCGrammar maximumCharacterValue)
		ifTrue: [ ^ self outputGreaterThanMatch: each on: stream ].
	self outputRangeMatch: each on: stream
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> outputRangeMatch: each on: stream [
	stream
		nextPutAll: '(currentCharacter between: ';
		nextPutAll: each first storeString;
		nextPutAll: ' and: ';
		nextPutAll: each last storeString;
		nextPutAll: ')'
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> outputSingleCharacterMatch: each on: stream [
	stream
		nextPutAll: 'currentCharacter == ';
		nextPutAll: each first storeString
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> outputStreamClass [
	^ WriteStream
]

{ #category : #'reduction table' }
SmaCCSmalltalkCodeGenerator >> parseTreeRewriterFor: aSmaCCRHS [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	1 to: aSmaCCRHS size do:
		[ :i | 
		rewriter
			replace: i printString storeString
			with: '(nodes at: ' , i printString , ')'.
		(aSmaCCRHS variableNameForIndex: i)
			ifNotNil:
				[ :name | rewriter replace: name with: '(nodes at: ' , i printString , ')' ] ].
	^ rewriter
]

{ #category : #private }
SmaCCSmalltalkCodeGenerator >> parserParseTreeFor: aSelector [
	^ parseTreeCache
		at: aSelector
		ifAbsentPut:
			[ | definingClass |
			definingClass := self parserClass whoDefinesMethod: aSelector.
			definingClass parseTreeFor: aSelector ]
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> reduceAction: anArray [
	^ '#(' , anArray first storeString , ' '
		, (anArray at: 2) storeString , ' ' , anArray last storeString , ')'
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> removeChange: aRBChange [
	| index |
	index := self changes changes identityIndexOf: aRBChange.
	index > 0
		ifFalse: [ ^ self ].
	self changes changes removeAt: index
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> removeOldMethods [
	self
		removeOldMethodsFrom: scannerClass;
		removeOldMethodsFrom: scannerClass theMetaClass;
		removeOldMethodsFrom: parserClass;
		removeOldMethodsFrom: parserClass theMetaClass
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> removeOldMethodsFrom: aRBClass [
	(self generatedMethodsIn: aRBClass)
		do: [ :each | aRBClass removeMethod: each ]
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> removeUnnecessaryChanges [
	self removeUnnecessaryMethodChanges.
	self removeUnnecessaryClassChanges
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> removeUnnecessaryClassChanges [
	| allChanges classChanges |
	allChanges := self changes changes copy.
	(allChanges
		allSatisfy: [ :each | (each isKindOf: RBCompositeRefactoryChange) not ])
		ifFalse: [ ^ self ].
	classChanges := allChanges
		select:
			[ :each | 
			(each isKindOf: RBAddClassChange)
				and:
					[ each changeClass notNil
						and: [ each changeClass superclass name = each superclassName ] ] ].
	classChanges
		do:
			[ :each | 
			| addVars variables existingVariables |
			addVars := allChanges
				select:
					[ :change | 
					(change isKindOf: RBAddInstanceVariableChange)
						and: [ each changeClass = change changeClass ] ].
			variables := addVars
				inject: Set new
				into:
					[ :sum :change | 
					sum
						add: change variable;
						yourself ].
			variables addAll: each instanceVariableNames.
			existingVariables := each changeClass instVarNames.
			(existingVariables size = variables size
				and:
					[ existingVariables asSortedCollection asArray
						= variables asSortedCollection asArray ])
				ifTrue:
					[ self removeChange: each.
					addVars do: [ :change | self removeChange: change ] ] ]
]

{ #category : #compiling }
SmaCCSmalltalkCodeGenerator >> removeUnnecessaryMethodChanges [
	| allChanges |
	allChanges := self changes changes copy.
	(allChanges
		allSatisfy: [ :each | (each isKindOf: RBCompositeRefactoryChange) not ])
		ifFalse: [ ^ self ].
	allChanges
		keysAndValuesDo:
			[ :key :each | 
			(each isKindOf: RBRemoveMethodChange)
				ifTrue:
					[ key + 1 to: allChanges size do:
						[ :i | 
						| other |
						other := allChanges at: i.
						[ ((other isKindOf: RBAddMethodChange)
							and:
								[ each selector = other selector
									and:
										[ each changeClassName = other changeClassName
											and:
												[ (other changeClass sourceCodeAt: other selector) asString
													= other parseTree source asString ] ] ])
							ifTrue: [ self
									removeChange: each;
									removeChange: other ] ]
							on: Error
							do: [ :ex | ex return ] ] ] ]
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> rewriters [
	| rewriters |
	rewriters := OrderedCollection new.
	rewriters add: self commonIfTrueCodeRewriter.
	rewriters add: self optimizationRewriter.
	rewriters add: self scanStringRewriter.
	^ rewriters
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> scanStringRewriter [
	^ RBParseTreeRewriter new
		replace:
			'self step. currentCharacter == `#l1 ifTrue: [self step. currentCharacter == `#l2 ifTrue: `@b]. `@.Stmts'
			with:
			'(self scanForString: `{RBLiteralNode value: (String with: `#l1 value with: `#l2 value)}) ifTrue: `@b. `@.Stmts';
		replace:
			'(self scanForString: `#l1) ifTrue: [self step. currentCharacter == `#l2 ifTrue: `@b]. `@.Stmts'
			with:
			'(self scanForString: `{RBLiteralNode value: (`#l1 value copyWith: `#l2 value)}) ifTrue: `@b. `@.Stmts';
		replace:
			'self recordMatch: `@m. self step. currentCharacter == `#l1 ifTrue: [self recordMatch: `@m. self step. currentCharacter == `#l2 ifTrue: `@b]. `@.Stmts'
			with:
			'self recordMatch: `@m. (self scanForString: `{RBLiteralNode value: (String with: `#l1 value with: `#l2 value)}) ifTrue: `@b. `@.Stmts';
		replace:
			'self recordMatch: `@m. (self scanForString: `#l1) ifTrue: [self recordMatch: `@m. self step. currentCharacter == `#l2 ifTrue: `@b]. `@.Stmts'
			with:
			'self recordMatch: `@m. (self scanForString: `{RBLiteralNode value: (`#l1 value copyWith: `#l2 value)}) ifTrue: `@b. `@.Stmts';
		yourself
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> scannerActionFor: aString [
	| selector current |
	aString size > 2
		ifFalse: [ ^ nil ].
	selector := (aString copyFrom: 2 to: aString size - 1) asSymbol.
	selector numArgs = 0
		ifFalse: [ ^ nil ].
	((SmaCCScanner organization listAtCategoryNamed: #'default token handling') includes: selector)
		ifTrue: [ ^ selector ].
	current := scannerClass.
	[ current notNil and: [ current superclass notNil and: [ current name ~= #SmaCCScanner ] ] ]
		whileTrue: [ (current directlyDefinesMethod: selector)
				ifTrue: [ ^ selector ].
			current := current superclass ].
	^ nil
]

{ #category : #accessing }
SmaCCSmalltalkCodeGenerator >> scannerClass [
	^ scannerClass
]

{ #category : #accessing }
SmaCCSmalltalkCodeGenerator >> scannerClass: aClassOrString [
	(aClassOrString isKindOf: Behavior)
		ifTrue: [ scannerClass := model classFor: aClassOrString ]
		ifFalse:
			[ scannerClass := model classNamed: aClassOrString asSymbol.
			scannerClass isNil
				ifTrue:
					[ scannerClass := self
						defineClass: aClassOrString
						asSubclassOf: SmaCCScanner ] ]
]

{ #category : #accessing }
SmaCCSmalltalkCodeGenerator >> selectorMap: aDictionary [
	| arrayMap |
	aDictionary isEmpty
		ifTrue: [ ^ self ].
	arrayMap := Array new: aDictionary keys asSortedCollection last.
	aDictionary
		keysAndValuesDo: [ :key :value | arrayMap at: key put: value ].
	self
		startPublicOverrideMethod;
		nextPutLine: (self method: 'tokenActions' type: self collectionType);
		nextPutStatement: (self return: arrayMap storeString);
		endMethod;
		compileMethodIn: self scannerClass
]

{ #category : #private }
SmaCCSmalltalkCodeGenerator >> send: selector to: aString [
	^ '(' , aString , ') ' , selector
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> send: selectorString to: receiverString with: argumentString [
	^ '(' , receiverString , ') ' , selectorString , ' ('
		, argumentString , ')'
]

{ #category : #private }
SmaCCSmalltalkCodeGenerator >> send: selectorString to: receiverString with: firstArgumentString with: secondArgumentString [
	| keywords |
	keywords := selectorString asSymbol keywords.
	^ '(' , receiverString , ') ' , keywords first , ' ('
		, firstArgumentString , ') ' , keywords last , ' ('
		, secondArgumentString , ')'
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> send: selectorString to: receiverString with: firstArgumentString with: secondArgumentString with: thirdArgumentString [
	| keywords |
	keywords := selectorString asSymbol keywords.
	^ '(' , receiverString , ') ' , keywords first , ' ('
		, firstArgumentString , ') ' , (keywords at: 2) , ' ('
		, secondArgumentString , ') ' , keywords last , ' ('
		, thirdArgumentString , ')'
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> splitIfTrueBranchFrom: aParseTree usingName: aSelector into: modelClass [
	| blocks |
	blocks := SortedCollection sortBlock: [ :a :b | a key > b key ].
	aParseTree body
		nodesDo:
			[ :each | 
			(each isBlock
				and:
					[ each parent isMessage
						and:
							[ each parent selector = #ifTrue:
								and: [ each body lastIsReturn or: [ each containsReturn not ] ] ] ])
				ifTrue:
					[ | literalCount |
					literalCount := self countLiteralsIn: each.
					literalCount > 2
						ifTrue: [ blocks add: literalCount -> each ] ] ].
	blocks notEmpty
		ifTrue:
			[ | blockToExtract method body |
			blockToExtract := blocks first value.
			method := RBMethodNode
				selector: aSelector
				body: blockToExtract body copy.
			body := RBMessageNode
				receiver: (RBVariableNode named: 'self')
				selector: aSelector.
			blockToExtract containsReturn
				ifTrue: [ body := RBReturnNode value: body ].
			blockToExtract
				replaceNode: blockToExtract body
				withNode: (RBSequenceNode statements: (OrderedCollection with: body)).
			self compileScannerTree: method into: modelClass.
			^ true ].
	^ false
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> splitSequenceFrom: aParseTree usingName: aSelector into: modelClass [
	| sequence statements |
	statements := aParseTree body copy statements.
	statements size <= 1
		ifTrue: [ ^ false ].
	sequence := RBSequenceNode statements: OrderedCollection new.
	[ (self countLiteralsIn: sequence) < self maxLiterals
		and: [ statements notEmpty ] ]
		whileTrue: [ sequence addNodeFirst: statements removeLast ].
	sequence removeNode: sequence statements first.
	sequence statements size <= 1
		ifTrue: [ ^ false ].
	sequence statements size
		timesRepeat: [ aParseTree body removeNode: aParseTree body statements last ].
	aParseTree body
		addNode:
			(RBReturnNode
				value:
					(RBMessageNode
						receiver: (RBVariableNode named: 'self')
						selector: aSelector)).
	self
		compileScannerTree: (RBMethodNode selector: aSelector body: sequence)
		into: modelClass.
	^ true
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> superMessage: aString [
	^ 'super ' , aString
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> superMessage: aString argument: argumentString [
	^ 'super ' , aString , ' (' , argumentString , ')'
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> superMessage: aString argument: firstArgumentString argument: secondArgumentString [
	| keywords |
	keywords := aString asSymbol keywords.
	^ 'super ' , keywords first , ' (' , firstArgumentString , ') '
		, keywords last , ' (' , secondArgumentString , ')'
]

{ #category : #'code generation templates' }
SmaCCSmalltalkCodeGenerator >> variableReference: aSmaCCVariableDefinition in: aString [
	^ '(' , aString , ') ' , aSmaCCVariableDefinition getterMethodName
]

{ #category : #'compiling-scanner' }
SmaCCSmalltalkCodeGenerator >> writeMatchingCodeFor: aSmaCCNode [
	| matchedItem |
	(aSmaCCNode action notNil and: [ aSmaCCNode action size > 0 ])
		ifTrue:
			[ matchedItem := aSmaCCNode action asArray.
			self codeStream
				nextPutAll:
					(aSmaCCNode transitions isEmpty
						ifTrue: [ '^self recordAndReportMatch:' ]
						ifFalse: [ 'self recordMatch: ' ]).
			matchedItem isSymbol
				ifTrue: [ self codeStream nextPutAll: matchedItem storeString ]
				ifFalse:
					[ self codeStream nextPutAll: '#('.
					matchedItem
						do: [ :each | self codeStream nextPutAll: each storeString ]
						separatedBy: [ self codeStream nextPut: $  ].
					self codeStream nextPut: $) ].
			self codeStream
				nextPut: $.;
				cr ].
	(aSmaCCNode transitions
		anySatisfy: [ :each | each isCharacterTransition ])
		ifTrue: [ self nextPutLine: 'self step.' ]
]

{ #category : #'compiling-parser' }
SmaCCSmalltalkCodeGenerator >> writeTransitionTableEntry: anArray on: aStream firstIsType: aBoolean [
	| startIndex |
	aStream cr.
	self hasLiteralByteArrays
		ifTrue:
			[ aStream nextPutAll: '#['.
			aBoolean
				ifTrue: [ aStream print: anArray first.
					startIndex := 2 ]
				ifFalse: [ startIndex := 1 ].
			startIndex to: anArray size do:
				[ :i | 
				aStream
					nextPutAll: self literalArraySeparator;
					print: ((anArray at: i) bitShift: -8);
					nextPutAll: self literalArraySeparator;
					print: ((anArray at: i) bitAnd: 16rFF) ].
			aStream nextPut: $] ]
		ifFalse:
			[ aStream nextPutAll: '#('.
			anArray
				do: [ :each | aStream print: each ]
				separatedBy: [ aStream nextPutAll: self literalArraySeparator ].
			aStream nextPut: $) ]
]
