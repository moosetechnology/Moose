Class {
	#name : #Antlr4GrammarNodeVisitor,
	#superclass : #SmaCCParseNodeVisitor,
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitAction: anAction [
	^ self visitGrammar: anAction
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitActionBlock: anActionBlock [
	^ self visitGrammar: anActionBlock
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitAtom: anAtom [
	^ self visitGrammar: anAtom
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitBlock: aBlock [
	^ self visitGrammar: aBlock
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitBlockSet: aBlockSet [
	^ self visitGrammar: aBlockSet
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitChannelsSpec: aChannelsSpec [
	^ self visitGrammar: aChannelsSpec
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitCharacterRange: aCharacterRange [
	^ self visitGrammar: aCharacterRange
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitDelegateGrammar: aDelegateGrammar [
	^ self visitGrammar: aDelegateGrammar
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitEbnf: anEbnf [
	^ self visitGrammar: anEbnf
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitEbnfSuffix: anEbnfSuffix [
	^ self visitGrammar: anEbnfSuffix
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitElement: anElement [
	^ self visitGrammar: anElement
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitElementOptions: anElementOptions [
	^ self visitGrammar: anElementOptions
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitExceptionHandler: anExceptionHandler [
	^ self visitGrammar: anExceptionHandler
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitFinallyClause: aFinallyClause [
	^ self visitGrammar: aFinallyClause
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitGrammar: aGrammar [
	^ self visitSmaCCParseNode: aGrammar
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitGrammarSpec: aGrammarSpec [
	^ self visitGrammar: aGrammarSpec
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitImport: anImport [
	^ self visitGrammar: anImport
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitIntegerLiteral: anIntegerLiteral [
	^ self visitGrammar: anIntegerLiteral
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLabeledLexerElement: aLabeledLexerElement [
	^ self visitGrammar: aLabeledLexerElement
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLexerAlt: aLexerAlt [
	^ self visitGrammar: aLexerAlt
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLexerAtom: aLexerAtom [
	^ self visitGrammar: aLexerAtom
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLexerBlock: aLexerBlock [
	^ self visitGrammar: aLexerBlock
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLexerCharSet: aLexerCharSet [
	^ self visitGrammar: aLexerCharSet
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLexerCommand: aLexerCommand [
	^ self visitGrammar: aLexerCommand
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLexerCommands: aLexerCommands [
	^ self visitGrammar: aLexerCommands
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLexerElement: aLexerElement [
	^ self visitGrammar: aLexerElement
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLexerRuleSpec: aLexerRuleSpec [
	^ self visitGrammar: aLexerRuleSpec
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitLocalsSpec: aLocalsSpec [
	^ self visitGrammar: aLocalsSpec
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitModeSpec: aModeSpec [
	^ self visitGrammar: aModeSpec
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitNamespaceName: aNamespaceName [
	^ self visitGrammar: aNamespaceName
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitNotSet: aNotSet [
	^ self visitGrammar: aNotSet
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitOption: anOption [
	^ self visitGrammar: anOption
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitOptionsSpec: anOptionsSpec [
	^ self visitGrammar: anOptionsSpec
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitParserRuleSpec: aParserRuleSpec [
	^ self visitGrammar: aParserRuleSpec
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitReferenceTerminal: aReferenceTerminal [
	^ self visitGrammar: aReferenceTerminal
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitRuleAction: aRuleAction [
	^ self visitGrammar: aRuleAction
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitRuleref: aRuleref [
	^ self visitGrammar: aRuleref
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitSetElement: aSetElement [
	^ self visitGrammar: aSetElement
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitStringLiteral: aStringLiteral [
	^ self visitGrammar: aStringLiteral
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitStringTerminal: aStringTerminal [
	^ self visitGrammar: aStringTerminal
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitThrowsSpec: aThrowsSpec [
	^ self visitGrammar: aThrowsSpec
]

{ #category : #generated }
Antlr4GrammarNodeVisitor >> visitTokensSpec: aTokensSpec [
	^ self visitGrammar: aTokensSpec
]
