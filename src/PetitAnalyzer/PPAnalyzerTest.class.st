Class {
	#name : #PPAnalyzerTest,
	#superclass : #PPAbstractParserTest,
	#category : #'PetitAnalyzer-Tests'
}

{ #category : #accessing }
PPAnalyzerTest class >> packageNamesUnderTest [
	^ #('PetitAnalyzer')
]

{ #category : #utilities }
PPAnalyzerTest >> assert: aCollection includes: aString epsilon: aBoolean [
	| parsers checker stream |
	parsers := aCollection
		collect: [ :each | each end ].
	checker := [ :string |
		parsers anySatisfy: [ :parser |
			(parser parse: string asPetitStream)
				isPetitFailure not ] ].
	stream := WriteStream on: String new.
	32 to: 127 do: [ :index |
		(checker value: (String with: (Character value: index)))
			ifTrue: [ stream nextPut: (Character value: index) ] ].
	self
		assert: stream contents = aString
		description: 'Expected ' , aString printString , ', but got ' , stream contents printString.
	self
		assert: (checker value: '') = aBoolean
		description: 'Expected epsilon to ' , (aBoolean ifTrue: [ 'be' ] ifFalse: [ 'not be' ]) , '  included'
]

{ #category : #accessing }
PPAnalyzerTest >> grammarA [
	"Güting, Erwig, Übersetzerbau, Springer (p.63)"

	| grammar |
	grammar := Dictionary new.
	
	" terminals "
	grammar at: #a put: $a asParser.
	grammar at: #b put: $b asParser.
	grammar at: #c put: $c asParser.
	grammar at: #d put: $d asParser.
	grammar at: #e put: nil asParser.
	
	" non terminals "
	grammar at: #B put: (grammar at: #b) / (grammar at: #e).
	grammar at: #A put: (grammar at: #a) / (grammar at: #B).
	grammar at: #S put: (grammar at: #A) , (grammar at: #B) , (grammar at: #c) , (grammar at: #d).
	
	^ grammar	
]

{ #category : #accessing }
PPAnalyzerTest >> grammarB [
	"The canonical grammar to exercise first- and follow-set calculation, probably originally from the dragon-book."

	| grammar |
	grammar := Dictionary new.
	#(E Ep T Tp F) 		do: [ :each | grammar at: each put: (PPUnresolvedParser named: each) ].
		
	(grammar at: #E)		def: (grammar at: #T) , (grammar at: #Ep).
	(grammar at: #Ep)	def: ($+ asParser , (grammar at: #T) , (grammar at: #Ep)) optional.
	
	(grammar at: #T)		def: (grammar at: #F) , (grammar at: #Tp).
	(grammar at: #Tp)	def: ($* asParser , (grammar at: #F) , (grammar at: #Tp)) optional.
	
	(grammar at: #F)		def: ($( asParser , (grammar at: #E) , $) asParser) / $i asParser.
			
	#(E Ep T Tp F) 		do: [ :each | (grammar at: each) name: each ].
	
	^ grammar
]

{ #category : #accessing }
PPAnalyzerTest >> grammarC [
	"A highly recrusive grammar."

	| grammar |
	grammar := PPUnresolvedParser new.
	grammar def: (grammar , $+ asParser , grammar) / $1 asParser.
	^grammar
]

{ #category : #accessing }
PPAnalyzerTest >> grammarD [
	"A highly ambiguous grammar from: Saichaitanya Jampana. Exploring the problem of ambiguity in context-free grammars. Master's thesis, Oklahoma State University, July 2005."

	| grammar |
	grammar := Dictionary new.
	#(S A a B b)			do: [ :each | grammar at: each put: (PPUnresolvedParser named: each) ].

	(grammar at: #a)		def: $a asParser.
	(grammar at: #b)		def: $b asParser.
		
	(grammar at: #S)		def: (grammar at: #A) , (grammar at: #B) / (grammar at: #a).
	(grammar at: #A)		def: (grammar at: #S) , (grammar at: #B) / (grammar at: #b).
	(grammar at: #B)		def: (grammar at: #B) , (grammar at: #A) / (grammar at: #a).
		
	^ grammar
]

{ #category : #accessing }
PPAnalyzerTest >> grammarE [
	"The most stupid parser, it just references itself and never consumes anything. All algorithms should survive such an attack."

	| parser |
	parser := PPDelegateParser new.
	parser setParser: parser.
	^ parser
]

{ #category : #testing }
PPAnalyzerTest >> testAllNamedParsers [
	| p1 p2 p3 |
	p1 := #digit asParser name: 'a'.
	p2 := (#digit asParser name: 'b') star.
	p3 := (#digit asParser name: 'c') token end.
	self assert: p1 allNamedParsers size equals: 1.
	self assert: p1 allNamedParsers first name equals: 'a'.
	self assert: p2 allNamedParsers size equals: 1.
	self assert: p2 allNamedParsers first name equals: 'b'.
	self assert: p3 allNamedParsers size equals: 1.
	self assert: p3 allNamedParsers first name equals: 'c'
]

{ #category : #testing }
PPAnalyzerTest >> testAllParsers [
	| p1 p2 p3 |
	p1 := #lowercase asParser.
	p2 := p1 ==> #asUppercase.
	p3 := PPUnresolvedParser new.
	p3 def: p2 / p3.
	self assert: p1 allParsers size equals: 1.
	self assert: p2 allParsers size equals: 2.
	self assert: p3 allParsers size equals: 3
]

{ #category : #'testing-cycleset' }
PPAnalyzerTest >> testCycleSetGrammarA [
	self grammarA do: [ :each | self assert: each cycleSet isEmpty ]
]

{ #category : #'testing-cycleset' }
PPAnalyzerTest >> testCycleSetGrammarB [
	self grammarB do: [ :each | self assert: each cycleSet isEmpty ]
]

{ #category : #'testing-cycleset' }
PPAnalyzerTest >> testCycleSetGrammarC [
	| grammar cycleSet |
	grammar := self grammarC.
	cycleSet := grammar cycleSet.
	self assert: cycleSet size equals: 2.
	self assert: (cycleSet includes: grammar)
]

{ #category : #'testing-cycleset' }
PPAnalyzerTest >> testCycleSetGrammarD [
	| grammar cycleSet |
	grammar := self grammarD.
	cycleSet := (grammar at: #S) cycleSet.
	self assert: cycleSet size equals: 4.
	self assert: (cycleSet includes: (grammar at: #A)).
	self assert: (cycleSet includes: (grammar at: #S)).
	cycleSet := (grammar at: #A) cycleSet.
	self assert: cycleSet size equals: 4.
	self assert: (cycleSet includes: (grammar at: #A)).
	self assert: (cycleSet includes: (grammar at: #S)).
	cycleSet := (grammar at: #B) cycleSet.
	self assert: cycleSet size equals: 2.
	self assert: (cycleSet includes: (grammar at: #B))
]

{ #category : #'testing-cycleset' }
PPAnalyzerTest >> testCycleSetGrammarE [
	| grammar cycleSet |
	grammar := self grammarE.
	cycleSet := grammar cycleSet.
	self assert: cycleSet size equals: 1.
	self assert: (cycleSet includes: grammar)
]

{ #category : #'testing-cycleset' }
PPAnalyzerTest >> testCycleSetInChoice [
	| parser cycleSet |
	parser := PPUnresolvedParser new.
	parser def: parser / $a asParser.
	cycleSet := parser cycleSet.
	self assert: cycleSet size equals: 1.
	self assert: (cycleSet includes: parser).
	parser := PPUnresolvedParser new.
	parser def: $a asParser / parser.
	cycleSet := parser cycleSet.
	self assert: cycleSet size equals: 1.
	self assert: (cycleSet includes: parser)
]

{ #category : #'testing-cycleset' }
PPAnalyzerTest >> testCycleSetInSequence [
	| parser cycleSet |
	parser := PPUnresolvedParser new.
	parser def: parser , $a asParser.
	cycleSet := parser cycleSet.
	self assert: cycleSet size equals: 1.
	self assert: (cycleSet includes: parser).
	parser := PPUnresolvedParser new.
	parser def: nil asParser , parser.
	cycleSet := parser cycleSet.
	self assert: cycleSet size equals: 1.
	self assert: (cycleSet includes: parser).
	parser := PPUnresolvedParser new.
	parser def: $a asParser , parser.
	cycleSet := parser cycleSet.
	self assert: cycleSet isEmpty
]

{ #category : #'testing-transform' }
PPAnalyzerTest >> testDelegateReplace [
	| one other delegate |
	one := $a asParser.
	other := $b asParser.
	delegate := one token.
	self assert: delegate children first == one.
	self deny: delegate children first == other.
	
	delegate replace: other with: one.
	self assert: delegate children first == one.
	self deny: delegate children first == other.
	
	delegate replace: one with: other.
	self deny: delegate children first == one.
	self assert: delegate children first == other
]

{ #category : #'testing-firstset' }
PPAnalyzerTest >> testFirstSetExpression [
	| grammar |
	grammar := PPArithmeticParser new.
	self assert: grammar start firstSet includes: '(-0123456789' epsilon: false.
	self assert: grammar addition firstSet includes: '(-0123456789' epsilon: false.
	self assert: grammar factors firstSet includes:  '(-0123456789' epsilon: false.
	self assert: grammar multiplication firstSet includes:  '(-0123456789' epsilon: false.
	self assert: grammar number firstSet includes: '-0123456789' epsilon: false.
	self assert: grammar parentheses firstSet includes: '(' epsilon: false.
	self assert: grammar power firstSet includes: '(-0123456789' epsilon: false.
	self assert: grammar primary firstSet includes: '(-0123456789' epsilon: false.
	self assert: grammar terms firstSet includes: '(-0123456789' epsilon: false
]

{ #category : #'testing-firstset' }
PPAnalyzerTest >> testFirstSetGrammarA [
	| grammar |
	grammar := self grammarA.
	self assert: (grammar at: #a) firstSet includes: 'a' epsilon: false.
	self assert: (grammar at: #b) firstSet includes: 'b' epsilon: false.
	self assert: (grammar at: #c) firstSet includes: 'c' epsilon: false.
	self assert: (grammar at: #d) firstSet includes: 'd' epsilon: false.
	self assert: (grammar at: #e) firstSet includes: '' epsilon: true.
	self assert: (grammar at: #S) firstSet includes: 'abc' epsilon: false.
	self assert: (grammar at: #A) firstSet includes: 'ab' epsilon: true.
	self assert: (grammar at: #B) firstSet includes: 'b' epsilon: true
]

{ #category : #'testing-firstset' }
PPAnalyzerTest >> testFirstSetGrammarB [
	| grammar |
	grammar := self grammarB.
	self assert: (grammar at: #E) firstSet includes: '(i' epsilon: false.
	self assert: (grammar at: #Ep) firstSet includes: '+' epsilon: true.
	self assert: (grammar at: #T) firstSet includes: '(i' epsilon: false.
	self assert: (grammar at: #Tp) firstSet includes: '*' epsilon: true.
	self assert: (grammar at: #F) firstSet includes: '(i' epsilon: false
]

{ #category : #'testing-firstset' }
PPAnalyzerTest >> testFirstSetGrammarC [
	| grammar |
	grammar := self grammarC.
	self assert: grammar firstSet includes: '1' epsilon: false
]

{ #category : #'testing-firstset' }
PPAnalyzerTest >> testFirstSetGrammarD [
	| grammar |
	grammar := self grammarD.
	self assert: (grammar at: #S) firstSet includes: 'ab' epsilon: false.
	self assert: (grammar at: #A) firstSet includes: 'ab' epsilon: false.
	self assert: (grammar at: #B) firstSet includes: 'a' epsilon: false.
	self assert: (grammar at: #a) firstSet includes: 'a' epsilon: false.
	self assert: (grammar at: #b) firstSet includes: 'b' epsilon: false
]

{ #category : #'testing-firstset' }
PPAnalyzerTest >> testFirstSetGrammarE [
	self assert: self grammarE firstSet includes: '' epsilon: false
]

{ #category : #'testing-firstset' }
PPAnalyzerTest >> testFirstSetLambda [
	| grammar |
	grammar := PPLambdaParser new.
	self assert: grammar start firstSet includes: '(ABCDEFGHIJKLMNOPQRSTUVWXYZ\abcdefghijklmnopqrstuvwxyz' epsilon: false.
	self assert: grammar abstraction firstSet includes: '\' epsilon: false.
	self assert: grammar application firstSet includes: '(' epsilon: false.
	self assert: grammar expression firstSet includes: '(ABCDEFGHIJKLMNOPQRSTUVWXYZ\abcdefghijklmnopqrstuvwxyz' epsilon: false.
	self assert: grammar variable firstSet includes: 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' epsilon: false
]

{ #category : #'testing-followset' }
PPAnalyzerTest >> testFollowSetExampleA [
	| grammar followSets |
	grammar := self grammarA.
	followSets := (grammar at: #S) followSets.
	self assert: (followSets at: (grammar at: #a)) includes: 'bc' epsilon: false.
	self assert: (followSets at: (grammar at: #b)) includes: 'bc' epsilon: false.
	self assert: (followSets at: (grammar at: #c)) includes: 'd' epsilon: false.
	self assert: (followSets at: (grammar at: #d)) includes: '' epsilon: true.
	self assert: (followSets at: (grammar at: #e)) includes: 'bc' epsilon: false.
	self assert: (followSets at: (grammar at: #S)) includes: '' epsilon: true.
	self assert: (followSets at: (grammar at: #A)) includes: 'bc' epsilon: false.
	self assert: (followSets at: (grammar at: #B)) includes: 'bc' epsilon: false
]

{ #category : #'testing-followset' }
PPAnalyzerTest >> testFollowSetExampleB [
	| grammar followSets |
	grammar := self grammarB.
	followSets := (grammar at: #E) followSets.
	self assert: (followSets at: (grammar at: #E)) includes: ')' epsilon: true.
	self assert: (followSets at: (grammar at: #Ep)) includes: ')' epsilon: true.
	self assert: (followSets at: (grammar at: #T)) includes: ')+' epsilon: true.
	self assert: (followSets at: (grammar at: #Tp)) includes: ')+' epsilon: true.
	self assert: (followSets at: (grammar at: #F)) includes: ')*+' epsilon: true
]

{ #category : #'testing-followset' }
PPAnalyzerTest >> testFollowSetExampleC [
	self assert: self grammarC followSet includes: '+' epsilon: true
]

{ #category : #'testing-followset' }
PPAnalyzerTest >> testFollowSetExampleD [
	| grammar followSets |
	grammar := self grammarD.
	followSets := (grammar at: #S) followSets.
	self assert: (followSets at: (grammar at: #S)) includes: 'a' epsilon: true.
	self assert: (followSets at: (grammar at: #A)) includes: 'ab' epsilon: true.
	self assert: (followSets at: (grammar at: #B)) includes: 'ab' epsilon: true.
	self assert: (followSets at: (grammar at: #a)) includes: 'ab' epsilon: true.
	self assert: (followSets at: (grammar at: #b)) includes: 'ab' epsilon: true
]

{ #category : #'testing-followset' }
PPAnalyzerTest >> testFollowSetExampleE [
	self assert: self grammarE followSet includes: '' epsilon: true
]

{ #category : #testing }
PPAnalyzerTest >> testInnerChildren [
	| p1 p2 p3 |
	p1 := #digit asParser name: 'a'.
	p2 := #digit asParser star name: 'b'.
	p3 := (#digit asParser name: 'c') token star end.
	self assert: p1 innerChildren isEmpty.
	self assert: p2 innerChildren size equals: 1.
	self assert: (p2 innerChildren allSatisfy: [ :each | each name isNil ]).
	self assert: p3 innerChildren size equals: 2.
	self assert: (p3 innerChildren allSatisfy: [ :each | each name isNil ])
]

{ #category : #testing }
PPAnalyzerTest >> testIsNullable [
	self assert: $a asParser star isNullable.
	self assert: nil asParser isNullable.

	self deny: $a asParser plus isNullable.	
	self deny: PPLiteralSequenceParser new isNullable.
	self deny: PPLiteralObjectParser new isNullable.
	self deny: PPPredicateParser new isNullable.
	self deny: PPChoiceParser new isNullable.
	self deny: PPSequenceParser new isNullable.
	self deny: PPAndParser new isNullable.
	self deny: PPTokenParser new isNullable
]

{ #category : #testing }
PPAnalyzerTest >> testIsTerminal [
	self assert: PPEpsilonParser new isTerminal.
	self assert: PPFailingParser new isTerminal.
	self assert: PPPluggableParser new isTerminal.
	self assert: PPLiteralObjectParser new isTerminal.
	self assert: PPLiteralSequenceParser new isTerminal.
	self assert: PPPredicateObjectParser new isTerminal.
	self assert: PPPredicateSequenceParser new isTerminal.
	
	self deny: ($a asParser / $b asParser) isTerminal.
	self deny: ($a asParser , $b asParser) isTerminal.
	self deny: ($a asParser and) isTerminal.
	self deny: ($a asParser not) isTerminal
]

{ #category : #'testing-transform' }
PPAnalyzerTest >> testListReplace [
	| one other another list |
	one := $a asParser.
	other := $b asParser.
	another := $c asParser.
	list := one , another , one.
	self assert: list children first == one.
	self assert: list children second == another.
	self assert: list children last == one.
	
	list replace: other with: one.
	self assert: list children first == one.
	self assert: list children second == another.
	self assert: list children last == one.
	
	list replace: one with: other.
	self assert: list children first == other.
	self assert: list children second == another.
	self assert: list children last == other.
	
	list replace: another with: one.
	self assert: list children first == other.
	self assert: list children second == one.
	self assert: list children last == other
]

{ #category : #testing }
PPAnalyzerTest >> testNamedChildren [
	| p1 p2 p3 p4 |
	p1 := #digit asParser name: 'a'.
	p2 := (#digit asParser name: 'b') star.
	p3 := (#digit asParser name: 'c') token end.
	p4 := ((#digit asParser name: 'c') token name: 'd') end.
	self assert: p1 namedChildren isEmpty.
	self assert: p2 namedChildren size equals: 1.
	self assert: p2 namedChildren first name equals: 'b'.
	self assert: p3 namedChildren size equals: 1.
	self assert: p3 namedChildren first name equals: 'c'.
	self assert: p4 namedChildren size equals: 1.
	self assert: p4 namedChildren first name equals: 'd'
]

{ #category : #'testing-transform' }
PPAnalyzerTest >> testRepetitionReplace [
	| one two otherone othertwo repetition |
	one := $a asParser.
	two := $b asParser.
	otherone := $1 asParser.
	othertwo := $2 asParser.
	
	repetition := one starLazy: two.
	self assert: repetition children first == one.
	self assert: repetition children second == two.
	
	repetition replace: one with: otherone.
	self assert: repetition children first == otherone.
	self assert: repetition children second == two.
	
	repetition replace: two with: othertwo.
	self assert: repetition children first == otherone.
	self assert: repetition children second == othertwo
]

{ #category : #'testing-transform' }
PPAnalyzerTest >> testTransformIdentityGrammarC [
	| orig tran |
	orig := self grammarC.
	tran := orig transform: [ :each | each ].
	self deny: orig == tran.
	self deny: orig children first == tran children first.
	self deny: orig children first children first == tran children first children first.
	self deny: orig children first children last == tran children first children last.
	self deny: orig children last == tran children last.
	
	self assert: orig class == PPChoiceParser.
	self assert: orig children first class == PPSequenceParser.
	self assert: orig children first children first == orig.
	self assert: orig children first children last == orig.
	self assert: orig children last class == PPLiteralObjectParser.

	self assert: tran class == PPChoiceParser.
	self assert: tran children first class == PPSequenceParser.
	self assert: tran children first children first == tran.
	self assert: tran children first children last == tran.
	self assert: tran children last class == PPLiteralObjectParser
]

{ #category : #'testing-transform' }
PPAnalyzerTest >> testTransformIdentityGrammarE [
	| orig tran |
	orig := self grammarE.
	tran := orig transform: [ :each | each ].
	self deny: orig == tran.
	self deny: orig children first = tran children first.
	
	self assert: orig class == PPDelegateParser.
	self assert: orig children first == orig.
	
	self assert: tran class == PPDelegateParser.
	self assert: tran children first == tran
]

{ #category : #'testing-transform' }
PPAnalyzerTest >> testTransformWrapGrammarC [
	| orig tran |
	orig := self grammarC.
	tran := orig transform: [ :each | each memoized ].

	self assert: orig class == PPChoiceParser.
	self assert: orig children first class == PPSequenceParser.
	self assert: orig children first children first == orig.
	self assert: orig children first children last == orig.
	self assert: orig children last class == PPLiteralObjectParser.
	
	self assert: tran class == PPMemoizedParser.
	self assert: tran children first class == PPChoiceParser.
	self assert: tran children first children first class == PPMemoizedParser.
	self assert: tran children first children first children first class == PPSequenceParser.
	self assert: tran children first children first children first children first == tran.
	self assert: tran children first children first children first children last == tran.
	self assert: tran children first children last class == PPMemoizedParser.
	self assert: tran children first children last children first class == PPLiteralObjectParser
]

{ #category : #'testing-transform' }
PPAnalyzerTest >> testTransformWrapGrammarE [
	| orig tran |
	orig := self grammarE.
	tran := orig transform: [ :each | each memoized ].
	
	self assert: orig class == PPDelegateParser.
	self assert: orig children first == orig.
	
	self assert: tran class == PPMemoizedParser.
	self assert: tran children first class == PPDelegateParser.
	self assert: tran children first children first == tran
]
