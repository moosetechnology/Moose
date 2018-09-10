Class {
	#name : #SmaCCEndToEndTest,
	#superclass : #TestCase,
	#instVars : [
		'currentClasses',
		'currentPackage',
		'manager'
	],
	#category : #'SmaCC_Tests'
}

{ #category : #private }
SmaCCEndToEndTest >> checkTokensAreInOrder: tokenCollection [
	tokenCollection
		inject: 0
		into:
			[ :sum :each | 
			self assert: sum < each startPosition.
			each startPosition ]
]

{ #category : #private }
SmaCCEndToEndTest >> classesInPackage [
	^ self package classes
]

{ #category : #tests }
SmaCCEndToEndTest >> expressionParserString [
	^ '
%left "+" "-" ;
%left "*" "/" ;
%right "^" ;

Expression: Expression ''first'' "+" Expression ''last'' {first + last}
	| Expression "-" Expression {''1'' - ''3''}
	| Expression "*" Expression {''1'' * ''3''}
	| Expression "/" Expression {''1'' / ''3''}
	| Expression "^" Expression {''1'' raisedTo: ''3''} 
	| "(" Expression ")" {''2''}
	| <number> {''1'' value asNumber};'
]

{ #category : #tests }
SmaCCEndToEndTest >> expressionScannerString [
	^ '
<number>	:	[0-9]+ (\. [0-9]+) ? ;
<whitespace>	:	\s+;'
]

{ #category : #private }
SmaCCEndToEndTest >> lookupType: className [
	^ self class environment at: className
]

{ #category : #private }
SmaCCEndToEndTest >> package [
	^ RPackageOrganizer default packageNamed: self class category
]

{ #category : #private }
SmaCCEndToEndTest >> parserClass [
	^ self lookupType: #TestParser
]

{ #category : #private }
SmaCCEndToEndTest >> removeClass: aBehavior [
	aBehavior removeFromSystem
]

{ #category : #private }
SmaCCEndToEndTest >> removeNewClasses [
	| classesToRemove |
	classesToRemove := self classesInPackage
		reject: [ :each | currentClasses includes: each ].
	(classesToRemove
		asSortedCollection: [ :a :b | a allSuperclasses size > b allSuperclasses size ])
		do: [ :each | self removeClass: each ]
]

{ #category : #private }
SmaCCEndToEndTest >> scannerClass [
	^ self lookupType: #TestScanner
]

{ #category : #private }
SmaCCEndToEndTest >> setUp [
	super setUp.
	SmaCCCodeGenerator reset.
	self setUpClasses
]

{ #category : #private }
SmaCCEndToEndTest >> setUpClasses [
	currentClasses := self classesInPackage
]

{ #category : #private }
SmaCCEndToEndTest >> supportsUnicodeStrings [
	^ [ String with: (Character value: 16rFF00).
	true ]
		on: Error
		do: [ :ex | ex return: false ]
]

{ #category : #private }
SmaCCEndToEndTest >> tearDown [
	self removeNewClasses.
	super tearDown
]

{ #category : #'tests-extended syntax' }
SmaCCEndToEndTest >> testAlternativePrecendence [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%left "+";
			%left "*";
			%root Parse ; %prefix Foo; %suffix Node; 
			Expression : <number> ''value'' {{Number}} 
				| Expression ''left'' ( "+" ''op'' | "*" ''op'') Expression ''right'' {{Binary}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1+2*3'.
	self assert: node op value = '+'.
	self assert: node right op value = '*'.
	node := self parserClass parse: '1*2+3'.
	self assert: node op value = '+'.
	self assert: node left op value = '*'
]

{ #category : #'tests-extended syntax' }
SmaCCEndToEndTest >> testAlternatives [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			Numbers : <number> ''left'' ( "+" ''op'' | "*" ''op'') <number> ''right'' {{Parse}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1+2'.
	self assert: node class name asString = 'FooParseNode'.
	self assert: node op value = '+'.
	node := self parserClass parse: '1*2'.
	self assert: node op value = '*'
]

{ #category : #tests }
SmaCCEndToEndTest >> testAmbiguousReduceReduceConflict [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<int> : \d+; <whitespace>: \s+;
			%glr;
			Expression : Left "!" "<" {''1''} | Right "!" ">" {''1''} ;
			Left : <int> "+" <int> "*" <int> {''1'' value asNumber + ''3'' value asNumber * ''5'' value asNumber};
			Right : <int> "+" <int> "*" <int> {''1'' value asNumber + (''3'' value asNumber * ''5'' value asNumber)};
			'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: '2 + 3 * 4!<') = 20.
	self assert: (self parserClass parse: '2 + 3 * 4!>') = 14.
	self
		should: [ self parserClass parse: '2 + 3 * 4!!' ]
		raise: SmaCCParserError
]

{ #category : #tests }
SmaCCEndToEndTest >> testAmbiguousResultWithDifferentScannerTokens [
	| parserCompiler results result |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%id <a> <aa>;
			<a> : a ; <aa> : aa;
			%glr;
			List : Item {''1''} | List Item {''1'' + ''2''} ;
			Item : <a> {1} | <aa> {1.5};
			'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self parserClass compile: 'alwaysPerformReduceAction ^true'.
	self parserClass
		compile:
			'actionsForCurrentToken 
		| oldToken oldPosition |
		(currentToken ids includes: scanner aaId) ifTrue: [
			oldToken := currentToken.
			oldPosition := scanner position.
			self position: currentToken stopPosition - 1.
			currentToken := currentToken class value: ''a'' start: currentToken startPosition ids: (Array with: scanner aId).
			super actionsForCurrentToken do: [:each | self splitWithAction: each].
			currentToken := oldToken.
			self position: oldPosition.
		].
		^super actionsForCurrentToken'.
	self assert: (self parserClass parse: 'a') = 1.
	[ result := self parserClass parse: 'aa' ]
		on: SmaCCAmbiguousResultNotification
		do:
			[ :ex | 
			results := ex tag
				collect: [ :each | each performOnSmaCCParser: ex parser ].
			ex resume: 0 ].
	self assert: result = 0.
	self assert: results size = 2.
	self assert: (results includes: 2).
	self assert: (results includes: 1.5)
]

{ #category : #tests }
SmaCCEndToEndTest >> testAmbiguousResults [
	| parserCompiler results result |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<int> : \d+; <whitespace>: \s+;
			%glr;
			Expression : Expression "+" Expression {''1'' + ''3''}
				| Expression "*" Expression {''1'' * ''3''}
				| <int> {''1'' value asNumber};
			'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self parserClass compile: 'alwaysPerformReduceAction ^true'.
	self assert: (self parserClass parse: '3 + 4') = 7.
	self assert: (self parserClass parse: '3 * 4') = 12.
	[ result := self parserClass parse: '2 + 3 * 4' ]
		on: SmaCCAmbiguousResultNotification
		do:
			[ :ex | 
			results := ex tag
				collect: [ :each | each performOnSmaCCParser: ex parser ].
			ex resume: 0 ].
	self assert: result = 0.
	self assert: results size = 2.
	self assert: (results includes: 20).
	self assert: (results includes: 14).

	"There are a bunch of ways to parse the following expression. If we don't merge the possibilities, then this will never complete."
	self
		assert:
			(self parserClass
				parse:
					'1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1')
				= 60
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testAttributesTokens [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	compiler
		buildDefinition:
			'<name> : \w+; <whitespace> : \s+; 
			%annotate_tokens;
			%root FooNode;
			%attributes FooANode (a b);
			A : "(" <name> "<<" "test" ")" {{FooANode}} ; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '( foo << test )'.
	self assert: node a isNil.
	node a: 1.
	node b: 2.
	self assert: node a = 1.
	self assert: node b = 2
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testAutoAnnotateTokens [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<name> : \w+; <whitespace> : \s+; 
			%annotate_tokens;
			%root FooNode;
			A : "(" <name> "<<" "test" ")" {{FooANode}} ; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '( foo << test )'.
	self assert: node nameToken value = 'foo'.
	self assert: node leftParenToken value = '('.
	self assert: node lessThanLessThanToken value = '<<'.
	self assert: node testToken value = 'test'.
	self assert: node rightParenToken value = ')'
]

{ #category : #tests }
SmaCCEndToEndTest >> testBadCharacterBlock [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	self
		should:
			[ parserCompiler
				buildDefinition:
					'<foo> : [a-] ;
					Start : <foo>;'.
			parserCompiler compileInto: 'TestScanner' andParser: 'TestParser' ]
		raise: SmaCCParserError
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testBadNode [
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : B "a" ''a'' {{FooNode}} ;
			B : A | C ;
			C : "c" ''c''; '.
	self
		assert:
			([ compiler compileInto: 'TestScanner' andParser: 'TestParser'.
			false ]
				on: SmaCCCompilationNotification
				do:
					[ :ex | 
					('Node creation' = ex messageText and: [ '*>>>A<<<*' match: ex tag ])
						ifTrue: [ ex return: true ]
						ifFalse: [ ex resume: nil ] ])
]

{ #category : #tests }
SmaCCEndToEndTest >> testBadSmalltalkBlock [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	self
		should:
			[ parserCompiler
				buildDefinition:
					'<foo> : foo ;
					Start : <foo> {self printOn: };'.
			parserCompiler compileInto: 'TestScanner' andParser: 'TestParser' ]
		raise: SmaCCParserError
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testChildrenVariables [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			%hierarchy If (IfElse);
			%left "+" "-" ;
			If : "if" number ''a'' "then" number ''b'' {{If}}
				| "if" number ''a'' "then" number ''b'' "else" number ''c'' {{IfElse}};
			number : <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'if 1 then 2 else 3'.
	self assert: node class name asString = 'FooIfElseNode'.
	self assert: node children size = 3
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testChildrenWhenNodeTypeNotSpecified [
	| compiler node values |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'%root Program;
			%prefix Test;
			%suffix Node;
			<id> : [a-zA-Z]+;
			<num> : [0-9]+;
			<whitespace> : [\s]+;
			Start : Expr ";" ;
			Expr : Term ''left'' "+" ''op''  Expr ''right''   {{Binary}}
			     | Term ''left'' "-" ''op'' Expr ''right''        {{Binary}}
			     | Term ;
			Term : Factor ''left'' "*" ''op'' Term ''right'' {{Binary}}
			     | Factor ''left'' "/" ''op'' Term ''right''       {{Binary}}
			     | Factor ;
			Factor : <num> ''value''                  {{Constant}}
			        | <id> ''name'' "(" Expr ''argument'' ")"        {{Function}}
			        | "(" Expr ")" ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 + 2;'.
	self assert: node children size = 2.
	values := #('1' '2') asSet.
	node children do: [ :each | values remove: each value value ]
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testChildrenWhenNodeTypeNotSpecifiedAndCouldBeToken [
	| compiler node values |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'%root Program;
			%prefix Test;
			%suffix Node;
			<id> : [a-zA-Z]+;
			<num> : [0-9]+;
			<whitespace> : [\s]+;
			Start : Expr ";" ;
			Expr : Term ''left'' "+" ''op''  Expr ''right''   {{Binary}}
			     | Term ''left'' "-" ''op'' Expr ''right''        {{Binary}}
			     | Term ;
			Term : Factor ''left'' "*" ''op'' Term ''right'' {{Binary}}
			     | Factor ''left'' "/" ''op'' Term ''right''       {{Binary}}
			     | Factor ;
			Factor : <num> ''value''                  {{Constant}}
			        | <id> ''name'' "(" Expr ''argument'' ")"        {{Function}}
				  | "(" Q ")" ;
			Q : Expr | <id> ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 + 2;'.
	self assert: node children size = 2.
	values := #('1' '2') asSet.
	node children do: [ :each | values remove: each value value ]
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testCodeReturnType [
	| compiler parser |
	(compiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	compiler
		buildDefinition:
			'<a> : a;
			<b> : b;
			<whitespace> : \s+;
			%root FooNode;
			File : A ''aNode'' B ''bNode'' C ''cNode'' {{FooNode}};
			A : <a> {''1''};
			B : <b> {^''1''};
			C : "C" ''c'' {^c};
			D : "D" {^''2''};
			E : "E" {^[]};'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	parser := self parserClass basicNew.
	self assert: (parser symbolTypes at: (parser symbolNames indexOf: 'A')) = #SmaCCToken.
	self assert: (parser symbolTypes at: (parser symbolNames indexOf: 'B')) = #SmaCCToken.
	self assert: (parser symbolTypes at: (parser symbolNames indexOf: 'C')) = #SmaCCToken.
	self assert: (parser symbolTypes at: (parser symbolNames indexOf: 'D')) = '' class name.
	self assert: ([  ] class includesBehavior: (Smalltalk at: (parser symbolTypes at: (parser symbolNames indexOf: 'E'))))
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testCollectionSuperclass [
	| parserCompiler node copy |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; %hierarchy Expression (Number Binary); 
			%left "+" "-" ;
			Expression : Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
				| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
				| <number> ''number'' {{Number}}
				| "(" ''leftParen'' Expression ")" ''rightParen'' {{Expression}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '(2 + 3 - (4))'.
	self assert: node class name asString = 'FooBinaryNode'.
	self assert: node operator value = '-'.
	self assert: node leftParens size = 1.
	self
		assert: node class superclass name asString = 'FooExpressionNode'.
	self assert: node right class name asString = 'FooNumberNode'.
	self assert: node right leftParens size = 1.
	self assert: node right parent == node.
	self assert: node left parent == node.
	self assert: node parent isNil.
	self assert: node children size = 2.
	self assert: (node children includes: node left).
	self assert: (node children includes: node right).
	self assert: node right number value = '4'.
	self assert: node left operator value = '+'.
	self assert: node left left number value = '2'.
	self assert: node left right number value = '3'.
	copy := node copy.
	self assert: copy ~~ node.
	self assert: copy left ~~ node left.
	self assert: copy right ~~ node right.
	self assert: copy operator ~~ node operator.
	self assert: copy = node.
	self assert: copy hash = node hash.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testCollectionSuperclassWithCodeNode [
	| parserCompiler node copy |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; %hierarchy Expression (Number Binary); 
			%left "+" "-" ;
			Expression : Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
				| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
				| Number {''1''}
				| "(" ''leftParen'' Expression ")" ''rightParen'' {{Expression}} ;
			Number : <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '(2 + 3 - (4))'.
	self assert: node class name asString = 'FooBinaryNode'.
	self assert: node operator value = '-'.
	self assert: node leftParens size = 1.
	self
		assert: node class superclass name asString = 'FooExpressionNode'.
	self assert: node right class name asString = 'FooNumberNode'.
	self assert: node right leftParens size = 1.
	self assert: node right parent == node.
	self assert: node left parent == node.
	self assert: node parent isNil.
	self assert: node children size = 2.
	self assert: (node children includes: node left).
	self assert: (node children includes: node right).
	self assert: node right number value = '4'.
	self assert: node left operator value = '+'.
	self assert: node left left number value = '2'.
	self assert: node left right number value = '3'.
	copy := node copy.
	self assert: copy ~~ node.
	self assert: copy left ~~ node left.
	self assert: copy right ~~ node right.
	self assert: copy operator ~~ node operator.
	self assert: copy = node.
	self assert: copy hash = node hash.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testCollectionSuperclassWithImplicitPullUp [
	| parserCompiler node copy |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; %hierarchy Expression (Number Binary); 
			%left "+" "-" ;
			Expression : Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
				| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
				| Number
				| "(" ''leftParen'' Expression ")" ''rightParen'' {{Expression}} ;
			Number : <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '(2 + 3 - (4))'.
	self assert: node class name asString = 'FooBinaryNode'.
	self assert: node operator value = '-'.
	self assert: node leftParens size = 1.
	self
		assert: node class superclass name asString = 'FooExpressionNode'.
	self assert: node right class name asString = 'FooNumberNode'.
	self assert: node right leftParens size = 1.
	self assert: node right parent == node.
	self assert: node left parent == node.
	self assert: node parent isNil.
	self assert: node children size = 2.
	self assert: (node children includes: node left).
	self assert: (node children includes: node right).
	self assert: node right number value = '4'.
	self assert: node left operator value = '+'.
	self assert: node left left number value = '2'.
	self assert: node left right number value = '3'.
	copy := node copy.
	self assert: copy ~~ node.
	self assert: copy left ~~ node left.
	self assert: copy right ~~ node right.
	self assert: copy operator ~~ node operator.
	self assert: copy = node.
	self assert: copy hash = node hash.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node
]

{ #category : #tests }
SmaCCEndToEndTest >> testComments [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : /* q */ /***/ /****/ a # b 
				;
			/* */ /***/ /****/
			#this is a comment
			begin : <a> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'a')
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testCopyCollection [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node;
			%left "+" "-" ;
			ExpressionList : ExpressionList Expression ''expression'' {{ExpressionList}}  | Expression ''expression'' {{ExpressionList}};
			Expression : Number ;
			Number : <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 2 3 4'.
	self assert: (node copyInContext: Dictionary new) = node
]

{ #category : #tests }
SmaCCEndToEndTest >> testCrLf [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : \r? \n | \r ;
			A : <a> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			(self parserClass
				parse: (String with: Character cr with: Character lf)).
	self
		should:
			[ self parserClass
				parse: (String with: Character cr with: Character cr) ]
		raise: SmaCCParserError
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testDefaultClassNameWithUnderscore [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%root Test ; %prefix Foo; %suffix Node; 
			test_class : "a" ''letter'' {{}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a'.
	self assert: node class name asString = 'FooTestClassNode'.
	self assert: node class superclass name asString = 'FooTestNode'.
	(self lookupType: #FooTestNodeVisitor) new acceptNode: node
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testEmptyAlternative [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'%root FooNode;
			A : B ''component'' {{FooANode}} ;
			B :  | C ; 
			C : "c" ''c'' {{FooCNode}} ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'c'.
	self assert: node class name asString = 'FooANode'.
	self assert: node component c value = 'c'.
	self assert: node component parent == node.
	node := self parserClass parse: ''.
	self assert: node component isNil
]

{ #category : #tests }
SmaCCEndToEndTest >> testErrorToken [
	| parserCompiler countingBlock |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<name> : [a-zA-Z]+; <whitespace>: \s+;
			%left "+"; Expression : <name> | Expression "+" Expression {[Notification signal] on: Error do: [:ex | ex return: (Notification raise)]} | error "+" Expression ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	countingBlock := [ :string | 
	| count |
	count := 0.
	[ [ self parserClass parse: string ]
		on: Notification
		do:
			[ :ex | 
			count := count + 1.
			[ ex resume ]
				on: Error
				do: [ :ex1 | 
					ex isResumable: true.
					ex1 retry ] ] ]
		on: SmaCCParserError
		do: [ :ex | ex return ].
	count ].
	#(#('a + b + c' 2) #('+ a + b + c' 2) #('a + b +' 1) #('a + 1 / 2 + b + c + 3' 2) #('1 + 1 / 2 + b + c + 3' 1))
		do: [ :each | self assert: (countingBlock value: each first) = each last ]
]

{ #category : #tests }
SmaCCEndToEndTest >> testErrors [
	| parserCompiler position |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition: self expressionScannerString , self expressionParserString.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self parserClass
		parse: '+3*4'
		onError: [ :str :pos | position := pos ].
	self assert: position = 1.
	self parserClass
		parseStream: (ReadStream on: '1+a+4')
		onError: [ :str :pos | position := pos ].
	self assert: position = 3
]

{ #category : #tests }
SmaCCEndToEndTest >> testExcludeScannerState [
	| parserCompiler parser |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%excludes a;
			<foo> : b;
			a <bar> : a;
			Start : <foo> {true} | <bar> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'b').
	self should: [ self parserClass parse: 'a' ] raise: SmaCCParserError.
	parser := self parserClass on: (ReadStream on: 'a').
	parser scope: #a.
	self deny: parser parse.
	parser := self parserClass on: (ReadStream on: 'b').
	parser scope: #a.
	self should: [ parser parse ] raise: SmaCCParserError
]

{ #category : #tests }
SmaCCEndToEndTest >> testExistingVariables [
	| parserCompiler |
	SmaCCScanner
		subclass: #TestScanner
		instanceVariableNames: 'scanner1 scanner2'
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	SmaCCParser
		subclass: #TestParser
		instanceVariableNames: 'parser1 parser2'
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self scannerClass instVarNames includes: 'scanner1').
	self assert: (self scannerClass instVarNames includes: 'scanner2').
	self assert: (self parserClass instVarNames includes: 'parser1').
	self assert: (self parserClass instVarNames includes: 'parser2')
]

{ #category : #tests }
SmaCCEndToEndTest >> testExpressions [
	#(#LR1 #LALR1)
		do:
			[ :each | 
			| parserCompiler |
			(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
				defaultCategory: self class category.
			parserCompiler grammar type: each.
			parserCompiler
				buildDefinition: self expressionScannerString , self expressionParserString.
			parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
			self
				assert:
					(self parserClass parse: '2 + 3 * 4 / 5 ^ 3 ^ 2')
						= (2 + (3 * 4 / (5 raisedTo: (3 raisedTo: 2)))).
			self
				assert:
					(self parserClass parse: '1.0*2/3+4.0^2^3+3')
						= (1.0 * 2 / 3 + (4.0 raisedTo: (2 raisedTo: 3)) + 3).
			self
				assert:
					(self parserClass parse: '(((1 + 2) * 3) ^ 2) ^ 3')
						= (((1 + 2) * 3 raisedTo: 2) raisedTo: 3) ]
]

{ #category : #tests }
SmaCCEndToEndTest >> testGLRHierarchy [
	| parserCompiler |
	SmaCCGLRParser
		subclass: #FooParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(Smalltalk at: #FooParser)
		subclass: #TestParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase; %glr;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: self parserClass superclass name asString = 'FooParser'
]

{ #category : #tests }
SmaCCEndToEndTest >> testHierarchy [
	| parserCompiler |
	SmaCCScanner
		subclass: #FooScanner
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(Smalltalk at: #FooScanner)
		subclass: #TestScanner
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	SmaCCParser
		subclass: #FooParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(Smalltalk at: #FooParser)
		subclass: #TestParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert: self scannerClass superclass name asString = 'FooScanner'.
	self assert: self parserClass superclass name asString = 'FooParser'
]

{ #category : #tests }
SmaCCEndToEndTest >> testIgnoreCaseKeywords [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<identifier> : [a-z_]+ ; <whitespace> : \s+ ;
			Start ::= "Foo" {true} | <identifier> <identifier> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'FOo').
	self deny: (self parserClass parse: 'FoObAr ASDS')
]

{ #category : #tests }
SmaCCEndToEndTest >> testIgnoreCaseTokens [
	| parserCompiler result |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<whitespace> : \s+ ;
			Start ::= "a" "a" {Array with: ''1'' with: ''2''};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	result := self parserClass parse: 'a A'.
	self assert: result first = result last.
	self assert: result first hash = result last hash
]

{ #category : #tests }
SmaCCEndToEndTest >> testIgnoreCaseWithMultipleKeywordCases [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<whitespace> : \s+ ;
			Start ::= "if" "If" "iF" "IF" {true}; '.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'IF IF IF IF').
	self assert: (self parserClass parse: 'iF If IF If')
]

{ #category : #tests }
SmaCCEndToEndTest >> testImplicitParserTokens [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler buildDefinition: 'A : <isLetter> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'a').
	self should: [ self parserClass parse: ' ' ] raise: SmaCCParserError
]

{ #category : #tests }
SmaCCEndToEndTest >> testImplicitScannerTokens [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : <isLetter> + ;
			A : <a> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'asdfssdafADSFS').
	self
		should: [ self parserClass parse: ' asdf asdf' ]
		raise: SmaCCParserError
]

{ #category : #tests }
SmaCCEndToEndTest >> testImplicitTokenPrecedence [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : . ;
			A : <a> {true} | <isLetter> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	0 to: 255 do:
		[ :each | 
		self
			assert: (self parserClass parse: (String with: (Character value: each))) ]
]

{ #category : #tests }
SmaCCEndToEndTest >> testInvertedCharactersBlock [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<A> : a{1,3} ;
			<ID> : [^a]+ ;
			<comment> : \s+ ;
			begin : {0} | begin <A> {''1'' + 1} | begin <ID> {''1'' - 1};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'aa') = 1.
	self assert: (self parserClass parse: 'aaaa') = 2.
	self assert: (self parserClass parse: 'a bab') = 0
]

{ #category : #tests }
SmaCCEndToEndTest >> testKeywords [
	| parserCompiler size |
	size := SmaCCGrammar maximumCharacterValue.
	self supportsUnicodeStrings
		ifTrue: [ SmaCCGrammar maximumCharacterValue: (2 raisedTo: 16) - 1 ].
	[ (parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			Start ::= "Foo" "bar";'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self parserClass parse: 'FoObAr' ]
		ensure: [ SmaCCGrammar maximumCharacterValue: size ]
]

{ #category : #tests }
SmaCCEndToEndTest >> testKeywordsWithStates [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%states default keyword;
			keyword <word> : word;
			keyword default <chars> : [a-z]+;
			Start : <chars>;
			other : <word>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self parserClass parse: 'word'
]

{ #category : #tests }
SmaCCEndToEndTest >> testLALRErrorHandler [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<whitespace> : \s+ ;
			Start : Foo "]" Foo ")";
			Foo : "a" Bar ;
			Bar : "b" | error ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		should: [ self parserClass parse: 'a ] a b )' ]
		raise: SmaCCParserError.
	self
		should: [ self parserClass parse: 'a ) a b )' ]
		raise: SmaCCParserError.
	self
		should: [ self parserClass parse: 'a b ] a  ]' ]
		raise: SmaCCParserError
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testLeftAndRightRecursive [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			Foo : Number ''number'' {{Collection}}
				| "(" ''leftParen'' Foo ")" ''rightParen'' {{Collection}} ;
			Number : <number> ''token'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '(((4)))'.
	self assert: node leftParens size = 3.
	self assert: node rightParens size = 3.
	self assert: node number token value = '4'.
	self checkTokensAreInOrder: node leftParens.
	self checkTokensAreInOrder: node rightParens.
	self assert: node children size = 1.
	self assert: node children first == node number.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testLeftRecursive [
	| parserCompiler node copy |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			Foo : Number ''number'' {{Collection}}
				| Foo "," ''comma'' Number ''number'' {{Collection}} ;
			Number : <number> ''token'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 , 2 , 3 , 4'.
	self assert: node numbers size = 4.
	node numbers
		keysAndValuesDo:
			[ :key :each | 
			self assert: key printString = each token value.
			self assert: each parent == node.
			self assert: (node children includes: each) ].
	self assert: node commas size = 3.
	node commas do: [ :each | self assert: each value = ',' ].
	copy := node copy.
	self assert: copy ~~ node.
	self assert: copy numbers ~~ node numbers.
	self assert: copy = node.
	self assert: copy hash = node hash.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testMatchCollection [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node;
			%left "+" "-" ;
			ExpressionList : ExpressionList Expression ''expression'' {{ExpressionList}}  | Expression ''expression'' {{ExpressionList}};
			Expression : Number ;
			Number : <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 2 3 4'.
	self assert: (node match: node inContext: Dictionary new)
]

{ #category : #tests }
SmaCCEndToEndTest >> testMoveFromGLRHierarchy [
	| parserCompiler |
	SmaCCGLRParser
		subclass: #FooParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(Smalltalk at: #FooParser)
		subclass: #TestParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert: self parserClass superclass name asString = 'SmaCCParser'
]

{ #category : #tests }
SmaCCEndToEndTest >> testMoveToGLRHierarchy [
	| parserCompiler |
	SmaCCParser
		subclass: #FooParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(Smalltalk at: #FooParser)
		subclass: #TestParser
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase; %glr;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert: self parserClass superclass name asString = 'SmaCCGLRParser'
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testMultipleComponents [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'%root FooNode;
			A : B C {{FooANode}} ;
			B : "b" ''b'' ;
			C : "c" ''c'';'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'bc'.
	self assert: node class name asString = 'FooANode'.
	self assert: node b startPosition = 1.
	self assert: node c startPosition = 2
]

{ #category : #tests }
SmaCCEndToEndTest >> testMultipleStartingPositions [
	| parserCompiler position |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<name> : \w+;
			%start plus ;
			multiply: plus "*" plus {true};
			plus: <name> {false} | <name> "+" <name> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'a*a').
	self assert: (self parserClass parse: 'a+a*a').
	self
		should: [ self parserClass parse: 'a+a' ]
		raise: SmaCCParserError.
	self
		deny:
			(self parserClass
				parse: 'a+a'
				startingAt: self parserClass startingStateForplus).
	self parserClass
		parse: 'a*a'
		startingAt: self parserClass startingStateForplus
		onError: [ :str :pos | position := pos ].
	self assert: position = 2
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testMultipleTypes [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B | C ;
			B : "b" ''b'' D {{FooBNode}} ;
			C : "c" ''c'' D {{FooCNode}};
			D : Number ''number'' | D "," ''comma'' Number ''number'' ;
			Number : <number> ''number'' {{FooNumberNode}};'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'b 1, 2, 3, 4'.
	self assert: node class name asString = 'FooBNode'.
	node numbers
		keysAndValuesDo:
			[ :key :each | 
			self assert: key printString = each number value.
			self assert: each parent == node ].
	self assert: node numbers size = 4.
	self assert: node commas size = 3
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testName [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<name> : \w+; <whitespace> : \s+; 
			%root FooNode;
			A : name ''nameNode'' {{FooANode}} ;
			name : simple | composite ;
			simple : <name> ''name'' {{FooNameNode}};
			composite : name ''base'' "." ''period'' <name> ''name'' {{FooFullNameNode}}; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a.b.c'.
	self assert: node nameNode name value = 'c'.
	self assert: node nameNode parent == node.
	self assert: node nameNode base name value = 'b'.
	self assert: node nameNode base parent == node nameNode.
	self assert: node nameNode base base name value = 'a'.
	self assert: node nameNode base base parent == node nameNode base
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testNamedSubComponent [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : {{FooANode}} | "a" ''a'' A ''sub'' {{FooANode}} ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'aaa'.
	self assert: node class name asString = 'FooANode'.
	self assert: node a startPosition = 1.
	self assert: node sub a startPosition = 2.
	self assert: node sub parent == node.
	self assert: node sub sub a startPosition = 3.
	self assert: node sub sub parent == node sub.
	self assert: node sub sub sub a isNil.
	self assert: node sub sub sub parent == node sub sub.
	self assert: node sub sub sub sub isNil
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testNextToken [
	| compiler token |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<next> : next; <whitespace> : \s+; 
			Next : <next>; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	token := self parserClass parse: ' next '
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testNodeAndExpression [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'%root FooNode;
			A : B "a" ''a'' {{FooNode}} ;
			B : {Object new} ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a'.
	self assert: node a value = 'a'
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testNodeClassName [
	| compiler pattern |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <name> : [a-z]+; <whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; %glr;
			%root FooNode;
			A : Name | Number ;
			Name : <name>''name'' {{FooNameNode}};
			Number : <number> ''number'' {{FooNumberNode}};'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	pattern := self parserClass
		parse: '`a{nodeClassName: #FooNumberNode}`'.
	self
		assert:
			(pattern
				match: (self parserClass parse: '123')
				inContext: Dictionary new).
	self
		deny:
			(pattern
				match: (self parserClass parse: 'abc')
				inContext: Dictionary new)
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testNodeWithoutRoot [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler buildDefinition: 'test : "a" ''letter'' {{FooNode}};'.
	self
		should:
			[ parserCompiler compileInto: 'TestScanner' andParser: 'TestParser' ]
		raise: SmaCCCompilationNotification
]

{ #category : #tests }
SmaCCEndToEndTest >> testNonAssociativeTokens [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<IDENTIFIER> : \w+ ; <whitespace> : \s+ ;
			%left "and" ;
			%nonassoc "=" "<=";
			%left "+" ;
			expr : expr "=" expr {true} | expr "<=" expr {true} | expr "and" expr {true} | expr "+" expr {true} | <IDENTIFIER> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		should: [ self parserClass parse: 'a=b=c' ]
		raise: SmaCCParserError.
	self
		should: [ self parserClass parse: 'a=b<=c' ]
		raise: SmaCCParserError.
	self
		should: [ self parserClass parse: 'a=b+c=d' ]
		raise: SmaCCParserError.
	self assert: (self parserClass parse: 'a=b and c=d')
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testNonRecursiveVariableInsideRecursiveProduction [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : B "a" ''letter'' {{FooNode}} ;
			B : A | C ;
			C : "c" ''c'' {{FooNode}};'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'c a a a'.
	self assert: node c value = 'c'.
	self assert: node letters size = 3
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testOptionalCollection [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B_opt {{FooANode}} ;
			B_opt : B | ;
			B : Number ''numberNode'' | B Number ''numberNode'' ;
			Number : <number> ''number'' {{FooNumberNode}};'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 2 3 4'.
	node numberNodes
		keysAndValuesDo:
			[ :key :each | 
			self assert: key printString = each number value.
			self assert: each parent == node ].
	self assert: node numberNodes size = 4
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testOptionalComponent [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B {{FooANode}} ;
			B : "b" ''b'' | ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ''.
	self assert: node b isNil.
	node := self parserClass parse: 'b'.
	self assert: node b startPosition = 1
]

{ #category : #public }
SmaCCEndToEndTest >> testOptionalVariableType [
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : Comma {{FooANode}} ;
			Comma : "," ''comma'' |  ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			self parserClass basicNew symbolTypes asSet asSortedCollection asArray
				= #(#FooANode #SmaCCToken)
]

{ #category : #tests }
SmaCCEndToEndTest >> testOverlappingTokens [
	| parserCompiler result |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<id1> : \w+; <id2> : \w+;
			%glr;
			Test : "keyword" {''1''} | <id1> {''1''} | <id2> {''1''} ;
			'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	result := self parserClass parse: 'keyword'.
	self assert: result ids size = 3
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testParseAllPattern [
	| compiler trees node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; 
			%root FooNode; %glr;
			A : "f:" ''f'' Z ''z'' {{FooANode}} | A "f:" ''f'' Z ''z'' {{FooANode}};
			Z : B | C;
			B : "b" ''b'' {{FooBNode}};
			C : "c" ''c'' {{FooCNode}}; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	trees := self parserClass
		parseAll: 'f: `a` f: `b`'
		startingAt: self parserClass defaultStartingState.
	self assert: trees size = 1.
	node := trees first.
	self assert: node fs size = 2.
	trees := self parserClass
		parseAll: 'f: `a{beToken}` f: `b{beToken}`'
		startingAt: self parserClass defaultStartingState.
	self assert: trees size = 4.
	node := trees first.
	self assert: node fs size = 2
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testPassThrough [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B ''b'' {{FooANode}} ;
			B : C ;
			C : Number;
			Number : <number> ''number'' {{FooNumberNode}}; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '12'.
	self assert: node class name asString = 'FooANode'.
	self assert: node b parent == node.
	self assert: node b number startPosition = 1.
	self assert: node b number value = '12'
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testPerformanceMatchCollection [
	| parserCompiler node match fastTime slowTime |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d; <whitespace> : \s+; 
			<patternToken>: (\`  [^\`]* \`)+ ;
			%glr;
			%root Parse ; %prefix Foo; %suffix Node;
			%left "+" "-" ;
			ExpressionList : ExpressionList Expression ''expression'' {{ExpressionList}}  | Expression ''expression'' {{ExpressionList}};
			Expression : Number ;
			Number : <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: (String new: 1000 withAll: $1) , '22' , (String new: 1000 withAll: $1).
	fastTime := Time millisecondsToRun: [ self assert: (node match: node inContext: Dictionary new) ].
	match := [ self parserClass parse: '`a{beList}` 22 `b{beList}`' ]
		on: SmaCCAmbiguousResultNotification
		do: [ :ex | (ex tag collect: [ :each | each performOnSmaCCParser: ex parser ]) detect: [ :each | (each isKindOf: SmaCCPatternNode) not ] ifNone: [ ex tag first ] ].
	slowTime := Time millisecondsToRun: [ self assert: (match match: node inContext: Dictionary new) ].
	self assert: (fastTime max: 1) * 10 > slowTime
]

{ #category : #'tests-extended syntax' }
SmaCCEndToEndTest >> testPlus [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			Numbers : <number> ''number'' ( "," ''comma'' <number> ''number'' )+ {{Parse}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1,2,3,4,5,6'.
	self assert: node class name asString = 'FooParseNode'.
	self assert: node numbers size = 6.
	self assert: node commas size = 5.
	self should: [self parserClass parse: '1'] raise: SmaCCParserError
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testPrefixSuffix [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%root Test ; %prefix Foo; %suffix Node; 
			test : "a" ''letter'' {{Test}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a'.
	self assert: node class name asString = 'FooTestNode'.
	self assert: node class superclass = SmaCCParseNode.
	(self lookupType: #FooTestNodeVisitor) new acceptNode: node
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testPrefixSuffixWithDefaultClassName [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%root Test ; %prefix Foo; %suffix Node; 
			test : "a" ''letter'' {{}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a'.
	self assert: node class name asString = 'FooTestNode'.
	self assert: node class superclass = SmaCCParseNode.
	(self lookupType: #FooTestNodeVisitor) new acceptNode: node
]

{ #category : #tests }
SmaCCEndToEndTest >> testPriority [
	| parserCompiler |
	SmaCCScanner
		subclass: #TestScanner
		instanceVariableNames: ''
		classVariableNames: ''
		category: 'SmaCC_Tests'.
	(self lookupType: #TestScanner)
		compile: 'all ^self recordAndReportMatch: (Array with: self _allId)'.
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<a> : \{ | \< \% ;
			<all> : .;
			%id <_all> <a> <all>;  
			begin : A {true}
					| All {false};
			A : <a> ;
			All: <_all>;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: '{').
	self assert: (self parserClass parse: '<%').
	self deny: (self parserClass parse: '}')
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testPullUpCollectionVariables [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : AList {{FooNode}} ;
			AList : B | AList B;
			B : <number> ''number'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 2 3 4'.
	node numbers
		keysAndValuesDo: [ :key :each | self assert: key printString = each value ].
	self assert: node numbers size = 4
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testPullUpMultipleTypes [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : D B {{FooBNode}} | D C {{FooCNode}};
			B : "b" ''b'' D ;
			C : "c" ''c'' D ;
			D : Number ''number'' | D Number ''number'' ;
			Number : <number> ''number'' {{FooNumberNode}};'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '0 b 1 2 3 4'.
	self assert: node class name asString = 'FooBNode'.
	node numbers
		keysAndValuesDo:
			[ :key :each | 
			self assert: (key - 1) printString = each number value.
			self assert: each parent == node ].
	self assert: node numbers size = 5
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testPullUpVariablesForLaterSymbols [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : "a" ''a'' B_opt {{FooNode}} ;
			B_opt : B | ;
			B : <number> ''number'' | B <number> ''number'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a 1 2 3 4'.
	node numbers
		keysAndValuesDo: [ :key :each | self assert: key printString = each value ].
	self assert: node numbers size = 4.
	node := self parserClass parse: 'a'.
	self assert: node numbers isEmpty
]

{ #category : #'tests-extended syntax' }
SmaCCEndToEndTest >> testQuestion [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			Numbers : <number> ''number'' ( "," ''comma'' <number> ''number'' )? {{Parse}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1,2'.
	self assert: node class name asString = 'FooParseNode'.
	self assert: node numbers size = 2.
	self assert: node comma notNil.
	node := self parserClass parse: '1'.
	self assert: node numbers size = 1.
	self assert: node comma isNil.
	self should: [ self parserClass parse: '1,2,3' ] raise: SmaCCParserError
]

{ #category : #'tests-extended syntax' }
SmaCCEndToEndTest >> testQuestionPrecedence [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%root Parse ; %prefix Foo; %suffix Node; %annotate_tokens;
			A : "a"? ("." "a"?)? "." "."{{}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self parserClass parse: '..'.
	self parserClass parse: '...'.
	self parserClass parse: 'a..'.
	self parserClass parse: '.a..'.
	self parserClass parse: 'a...'.
	self parserClass parse: 'a.a..'
]

{ #category : #tests }
SmaCCEndToEndTest >> testRecursiveRule [
	#(#LR1 #LALR1)
		do:
			[ :each | 
			| parserCompiler |
			(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
				defaultCategory: self class category.
			parserCompiler grammar type: each.
			parserCompiler
				buildDefinition:
					self expressionScannerString
						,
							'Test: Test1 Recursive;
							Test1: <number> {''1'' value};
							Recursive: | Recursive "|" <number> {''1'' add: ''3'' value; yourself};'.
			parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
			self
				assert:
					((parserCompiler grammar nonTerminalSymbolNamed: 'Recursive')
						firstTerminals
						includes: (parserCompiler grammar keywordTerminalNamed: '"|"')).
			self
				assert:
					(self parserClass parse: '2|3|4') asOrderedCollection
						= (OrderedCollection with: '2' with: '3' with: '4') ]
]

{ #category : #tests }
SmaCCEndToEndTest >> testReduceActionReuse [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : a ;
			begin : <a> {#()};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			(self parserClass selectors
				anySatisfy: [ :each | each beginsWith: 'reduceActionFor' ])
]

{ #category : #tests }
SmaCCEndToEndTest >> testReduceReduceConflict [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<letter> : \w ;
			<whitespace>: \s+	;
			begin : Foo <letter> {true} | Bar <letter> {false};
			Foo :  ;
			Bar : ;'.
	self
		assert:
			([ parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
			false ]
				on: SmaCCCompilationNotification
				do:
					[ :ex | 
					('*Reduce/Reduce*' match: ex messageText)
						ifTrue: [ ex return: true ]
						ifFalse: [ ex resume: nil ] ])
]

{ #category : #tests }
SmaCCEndToEndTest >> testReduceRules [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<char> : [a-zA-Z] ; 
			<ws> : \s ;
			Start ::= Chars {#liftFirstValue:};
			Chars : WS A WS {#liftSecondValue:};
			A : WS WS C {#liftLastValue:} | C WS {#liftLastValue:};
			WS : <ws> {#nil};
			C : <char> {#stringValue:};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: ' a  ') isNil.
	self assert: (self parserClass parse: '   a ') = 'a'
]

{ #category : #public }
SmaCCEndToEndTest >> testRenamedNullableVariable [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%glr;
			%root FooNode;
			A : B ''separator'' C {{FooANode}} ;
			B : C | ;
			C : Comma ''c'';
			Comma : "," ''comma'' {{FooCommaNode}};'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ',,'.
	self assert: node separator comma value = ','.
	self assert: node separator comma startPosition = 1.
	self assert: (node nodeVariables includes: #separator).
	self assert: node c comma value = ','.
	self assert: node c comma startPosition = 2.
	self deny: (self parserClass basicNew symbolTypes includes: #Object).
	node := self parserClass parse: ','.
	self assert: node separator isNil
]

{ #category : #public }
SmaCCEndToEndTest >> testRenamedVariable [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : Comma ''separator'' Comma {{FooANode}} ;
			Comma : "," ''comma'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ',,'.
	self assert: node separator value = ','.
	self assert: node separator startPosition = 1.
	self assert: (node tokenVariables includes: #separator).
	self assert: node comma value = ','.
	self assert: node comma startPosition = 2.
	self deny: (self parserClass basicNew symbolTypes includes: #Object)
]

{ #category : #public }
SmaCCEndToEndTest >> testRenamedVariableCollection [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : Commas ''separator'' "a" ''a'' Commas {{FooANode}} ;
			Commas : | Commas "," ''comma'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ',,,a,,,'.
	self assert: node separators size = 3.
	self assert: node separators first value = ','.
	self assert: node separators first startPosition = 1.
	self
		assert:
			node compositeTokenVariables asSortedCollection asArray
				= #(#commas #separators).
	self deny: (self parserClass basicNew symbolTypes includes: #Object)
]

{ #category : #tests }
SmaCCEndToEndTest >> testRepeat [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<letters> : [a-zA-Z];
			<test> : (\`[^\`]*\`)+;
			All : | All Test ;
			Test : <letters> | <test> ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: '`a`b`c`') size = 3
]

{ #category : #tests }
SmaCCEndToEndTest >> testRepeatingCharactersBlock [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<A> : a{1,3} ;
			<ID> : \w+ ;
			<whitespace> : \s+ ;
			begin : {true} | begin <A> {''1''} | begin <ID> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'aa').
	self deny: (self parserClass parse: 'aaaa')
]

{ #category : #tests }
SmaCCEndToEndTest >> testReuseCompositeToken [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<LETTERDIGIT> : [a-zA-Z_] \d ;
			<AAorBB> :  aa | bb;
			<IDENTIFIER>: <LETTERDIGIT> | <AAorBB>	;
			<whitespace>: \s+	;
			begin : <IDENTIFIER> begin {false} | <IDENTIFIER> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self should: [ self parserClass parse: '2' ] raise: SmaCCParserError.
	self assert: (self parserClass parse: 'aa').
	self assert: (self parserClass parse: 'bb').
	self assert: (self parserClass parse: 'a4').
	self should: [ self parserClass parse: 'ab' ] raise: SmaCCParserError.
	self should: [ self parserClass parse: '4b' ] raise: SmaCCParserError
]

{ #category : #tests }
SmaCCEndToEndTest >> testReuseSimpleToken [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<LETTER> : [a-zA-Z_\\] ;
			<DIGIT> : [0-9] ;
			<IDENTIFIER>: <LETTER> (<LETTER>|<DIGIT>)*	;
			<whitespace>: \s+	;
			begin : <IDENTIFIER> begin {false} | <IDENTIFIER> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self should: [ self parserClass parse: '2' ] raise: SmaCCParserError.
	self assert: (self parserClass parse: '\')
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testRightRecursive [
	| parserCompiler node copy |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			Foo : Number ''number'' {{Collection}}
				| Number ''number''  "," ''comma'' Foo {{Collection}} ;
			Number : <number> ''token'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 , 2 , 3 , 4'.
	self assert: node numbers size = 4.
	node numbers
		keysAndValuesDo:
			[ :key :each | 
			self assert: key printString = each token value.
			self assert: each parent == node.
			self assert: (node children includes: each) ].
	self assert: node commas size = 3.
	node commas
		inject: 0
		into:
			[ :sum :each | 
			self assert: sum < each startPosition.
			each startPosition ].
	node commas do: [ :each | self assert: each value = ',' ].
	copy := node copy.
	self assert: copy ~~ node.
	self assert: copy numbers ~~ node numbers.
	self assert: copy = node.
	self assert: copy hash = node hash.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node
]

{ #category : #tests }
SmaCCEndToEndTest >> testScannerScopes [
	| parserCompiler parser |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%scopes a ;
			<foo> : b;
			a <bar> : a;
			Start : <foo> {true} | <bar> {false};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: 'b').
	self should: [ self parserClass parse: 'a' ] raise: SmaCCParserError.
	parser := self parserClass on: (ReadStream on: 'a').
	parser scope: #a.
	self deny: parser parse.
	parser := self parserClass on: (ReadStream on: 'b').
	parser scope: #a.
	self assert: parser parse
]

{ #category : #tests }
SmaCCEndToEndTest >> testSimple [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<a> : a ;
			begin : <a> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self should: [ self parserClass parse: '2' ] raise: SmaCCParserError.
	self assert: (self parserClass parse: 'a')
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testSimpleHierarchy [
	| parserCompiler node copy |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			%hierarchy Binary (Plus Minus);
			%left "+" "-" ;
			Expression : Expression ''left'' "+" ''operator'' Expression ''right'' {{Plus}}
				| Expression ''left'' "-" ''operator'' Expression ''right'' {{Minus}}
				| <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '2 + 3 - 4'.
	self assert: node class name asString = 'FooMinusNode'.
	self assert: node operator value = '-'.
	self assert: node class superclass name asString = 'FooBinaryNode'.
	self assert: node right class name asString = 'FooNumberNode'.
	self assert: node left class name asString = 'FooPlusNode'.
	self assert: node right parent == node.
	self assert: node left parent == node.
	self assert: node parent isNil.
	self assert: node children size = 2.
	self assert: (node children includes: node left).
	self assert: (node children includes: node right).
	self assert: node right number value = '4'.
	self assert: node left operator value = '+'.
	self assert: node left left number value = '2'.
	self assert: node left right number value = '3'.
	copy := node copy.
	self assert: copy ~~ node.
	self assert: copy left ~~ node left.
	self assert: copy right ~~ node right.
	self assert: copy operator ~~ node operator.
	self assert: copy = node.
	self assert: copy hash = node hash.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testSimpleNode [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%root FooNode ;
			test : "a" ''letter'' {{FooNode}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: 'a'.
	self assert: node class name asString = 'FooNode'.
	self assert: node letter value = 'a'.
	self assert: node letter startPosition = 1.
	self assert: node letter stopPosition = 1.
	self assert: node class superclass = SmaCCParseNode.
	self assert: node copy ~~ node.
	self assert: node copy letter ~~ node letter.
	self assert: node = node copy.
	self assert: node hash = node copy hash.
	(self lookupType: #FooNodeVisitor) new acceptNode: node
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testSimpleTree [
	| parserCompiler node copy |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			%left "+" "-" ;
			Expression : Expression ''left'' "+" ''operator'' Expression ''right'' {{Binary}}
				| Expression ''left'' "-" ''operator'' Expression ''right'' {{Binary}}
				| <number> ''number'' {{Number}} ;'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '2 + 3 - 4'.
	self assert: node class name asString = 'FooBinaryNode'.
	self assert: node operator value = '-'.
	self assert: node class superclass name asString = 'FooParseNode'.
	self assert: node right class name asString = 'FooNumberNode'.
	self assert: node right parent == node.
	self assert: node left parent == node.
	self assert: node parent isNil.
	self assert: node children size = 2.
	self assert: (node children includes: node left).
	self assert: (node children includes: node right).
	self assert: node right number value = '4'.
	self assert: node left operator value = '+'.
	self assert: node left left number value = '2'.
	self assert: node left right number value = '3'.
	copy := node copy.
	self assert: copy ~~ node.
	self assert: copy left ~~ node left.
	self assert: copy right ~~ node right.
	self assert: copy operator ~~ node operator.
	self assert: copy = node.
	self assert: copy hash = node hash.
	(self lookupType: #FooParseNodeVisitor) new acceptNode: node
]

{ #category : #public }
SmaCCEndToEndTest >> testSingleVariableCollection [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; <integer> : \d+;
			%root P; %glr; %prefix Foo; %suffix Node;
			A : B {{}};
			B : B C ''item'' | ; 
			C : "#(" D ")" {{}};
			D :  | D <integer> ''item''; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '#(1)#(2 3 4)'.
	self assert: node items size = 2.
	self assert: node items first items size = 1.
	self assert: node items last items size = 3
]

{ #category : #tests }
SmaCCEndToEndTest >> testSpecialCharacters [
	| parserCompiler maxValue |
	[ String with: (Character value: 16rFF00) ]
		on: Error
		do: [ :ex | ^ self ].	"Unicode characters not supported"
	maxValue := SmaCCGrammar maximumCharacterValue.
	SmaCCGrammar maximumCharacterValue: 65535.
	[ (parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'%ignorecase;
			<name> : \x3g \x20 \xFF \xFF1 \xFF00 \cC;
			begin ::= <name> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			(self parserClass
				parse:
					(String
						withAll:
							(#(3 103 16r20 16rFF 16rFF1 16rFF00 2)
								collect: [ :each | Character value: each ]))) ]
		ensure: [ SmaCCGrammar maximumCharacterValue: maxValue ]
]

{ #category : #'tests-extended syntax' }
SmaCCEndToEndTest >> testStar [
	| parserCompiler node |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root Parse ; %prefix Foo; %suffix Node; 
			Numbers : <number> ''number'' ( "," ''comma'' <number> ''number'' )* {{Parse}};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1,2,3,4,5,6'.
	self assert: node class name asString = 'FooParseNode'.
	self assert: node numbers size = 6.
	self assert: node commas size = 5.
	node := self parserClass parse: '1'.
	self assert: node numbers size = 1.
	self assert: node commas isEmpty
]

{ #category : #tests }
SmaCCEndToEndTest >> testTimesRepeatRewriteBug [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator defaultCategory: self class category.
	parserCompiler buildDefinition: '<a> : <<[^>]+>>; t : <a> {true};'.
	parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self assert: (self parserClass parse: '<<aa>>')
]

{ #category : #public }
SmaCCEndToEndTest >> testTokenCollection [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; 
			%root P; %glr; %prefix Foo; %suffix Node;
			A : C B ''b'' C {{}};
			B : C {{}};
			C : "," ''comma''; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ',,,'.
	self assert: node b comma startPosition = 2.
	self assert: node commas first startPosition = 1.
	self assert: node commas last startPosition = 3.
	self assert: node commas size = 2
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testUnnamedCollectionSymbol [
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B {{FooANode}} ;
			B : "b" ''b'' {{FooBNode}} | B "b" ''b'' {{FooBNode}} ;'.
	self
		assert:
			([ compiler compileInto: 'TestScanner' andParser: 'TestParser'.
			false ]
				on: SmaCCCompilationNotification
				do:
					[ :ex | 
					('Node creation' = ex messageText and: [ '*>>>B<<<*' match: ex tag ])
						ifTrue: [ ex return: true ]
						ifFalse: [ ex resume: nil ] ])
]

{ #category : #public }
SmaCCEndToEndTest >> testUnnamedNodeVariable [
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'%glr;
			<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B D {{FooANode}};
			B : <number> ''a'' <number> ''b'' {{FooBNode}} | ;
			D : <number> ''c''; '.
	self
		assert:
			([ compiler compileInto: 'TestScanner' andParser: 'TestParser'.
			false ]
				on: SmaCCCompilationNotification
				do:
					[ :ex | 
					('Node creation' = ex messageText and: [ '*>>>B<<<*' match: ex tag ])
						ifTrue: [ ex return: true ]
						ifFalse: [ ex resume: nil ] ])
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testUnnamedSymbol [
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : B {{FooANode}} ;
			B : "b" ''b'' {{FooBNode}} ;'.
	self
		assert:
			([ compiler compileInto: 'TestScanner' andParser: 'TestParser'.
			false ]
				on: SmaCCCompilationNotification
				do:
					[ :ex | 
					('Node creation' = ex messageText and: [ '*>>>B<<<*' match: ex tag ])
						ifTrue: [ ex return: true ]
						ifFalse: [ ex resume: nil ] ])
]

{ #category : #tests }
SmaCCEndToEndTest >> testUnusedSymbols [
	| parserCompiler |
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<letters> : \w+ ;
			<whitespace>: \s+	;
			%start Bar;
			begin : Foo;
			Foo :  <letters>;
			Bar : Baz ;
			Baz : "test" ;'.
	self
		assert:
			([ parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
			true ]
				on: SmaCCCompilationNotification
				do: [ :ex | ex return: false ]).
	(parserCompiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	parserCompiler
		buildDefinition:
			'<letters> : \w+ ;
			<whitespace>: \s+	;
			begin : Foo;
			Foo :  <letters>;
			Bar : Baz ;
			Baz : "test" ;'.
	self
		assert:
			([ parserCompiler compileInto: 'TestScanner' andParser: 'TestParser'.
			false ]
				on: SmaCCCompilationNotification
				do: [ :ex | ex return: true ])
]

{ #category : #'tests-parse tree creation' }
SmaCCEndToEndTest >> testUseWithoutClassDefinition [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<number> : \d+; <whitespace> : \s+; 
			%root FooNode;
			A : <number> ''left'' B ''operator'' <number> ''right'' {{FooNode}} ;
			B : C ;
			C : "+" | "-" | "*" | "/" ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: '1 + 3'.
	self assert: node operator value = '+'
]

{ #category : #public }
SmaCCEndToEndTest >> testVariableCollection [
	| compiler node |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; <patternToken> : (\`  [^\`]* \`)+ ; 
			%root P; %glr; %prefix Foo; %suffix Node;
			A : B {{}};
			B : C | "d" ''d'';
			C : "," ''comma''; '.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	node := self parserClass parse: ','.
	self assert: node comma startPosition = 1.
	self assert: node d isNil.
	node := self parserClass parse: 'd'.
	self assert: node comma isNil.
	self assert: node d startPosition = 1
]

{ #category : #public }
SmaCCEndToEndTest >> testVariableCollectionType [
	| compiler |
	(compiler := SmaCCGrammarCompiler new) codeGenerator
		defaultCategory: self class category.
	compiler
		buildDefinition:
			'<whitespace> : \s+; 
			%root FooNode;
			A : Commas {{FooANode}} ;
			Commas : "," ''comma'' | Commas "," ''comma'' ;'.
	compiler compileInto: 'TestScanner' andParser: 'TestParser'.
	self
		assert:
			self parserClass basicNew symbolTypes asSet asSortedCollection asArray
				= #(#FooANode #OrderedCollection #SmaCCToken)
]
