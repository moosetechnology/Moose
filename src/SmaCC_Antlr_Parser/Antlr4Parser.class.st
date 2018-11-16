Class {
	#name : #Antlr4Parser,
	#superclass : #SmaCCGLRParser,
	#category : #'SmaCC_Antlr_Parser'
}

{ #category : #'generated-accessing' }
Antlr4Parser class >> cacheId [
	^'2018-10-20T09:42:45.078374-05:00'
]

{ #category : #generated }
Antlr4Parser class >> definitionComment [
"# Converted to SmaCC from https://github.com/antlr/grammars-v4/tree/master/antlr4 commit f08f5d22947ff8dc7231aa0dbce60a72debee665
/*
 * [The ""BSD license""]
 *  Copyright (c) 2012-2014 Terence Parr
 *  Copyright (c) 2012-2014 Sam Harwell
 *  Copyright (c) 2015 Gerald Rosenberg
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *  3. The name of the author may not be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 *  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*	A grammar for ANTLR v4 written in ANTLR v4.
 *
 *	Modified 2015.06.16 gbr
 *	-- update for compatibility with Antlr v4.5
 *	-- add mode for channels
 *	-- moved members to LexerAdaptor
 * 	-- move fragments to imports
 */

#parser grammar ANTLRv4Parser;

#options
#   { tokenVocab = ANTLRv4Lexer; }

%glr;
%root Grammar;
%prefix Antlr4;
%suffix Node;
%scopes default;
%excludes action argAction lexerCharSet;

%id <actionBlock> <argActionBlock>;

action <actionBlock>
	: .
	;

argAction <argActionBlock>
	: .
	;

<semicolon>
    : \;
    ;

<bar>
    : \|
    ;

<lParen>
    : \(
    ;

<lBracket>
    : \[
    ;

<lBrace>
    : \{
    ;

<rParen>
    : \)
    ;

default lexerCharSet <rBracket>
    : \]
    ;

<rBrace>
    : \}
    ;

<comma>
    : ,
    ;

<lt>
    : <
    ;

<gt>
    : >
    ;

<dotDot>
    : \. \.
    ;

<dot>
    : \.
    ;

<tilde>
    : ~
    ;

<equal>
    : =
    ;

<plusEqual>
    : \+ =
    ;

<question>
    : \?
    ;

<star>
    : \*
    ;

<plus>
    : \+
    ;

<at>
    : @
    ;

<pound>
    : \#
    ;

<colon>
    : \:
    ;

<colonColon>
    : \:\:
    ;

<arrow>
    : \- >
    ;

<catch>
    : catch
    ;

<channels>
    : channels
    ;

<finally>
    : finally
    ;

<fragment>
    : fragment
    ;

<grammar>
    : grammar
    ;

<import>
    : import
    ;

<lexer>
    : lexer
    ;

<locals>
    : locals
    ;

<mode>
    : mode
    ;

<options>
    : options
    ;

<parser>
    : parser
    ;

<private>
    : private
    ;

<protected>
    : protected
    ;

<public>
    : public
    ;

<returns>
    : returns
    ;

<throws>
    : throws
    ;

<tokens>
    : tokens
    ;

<token_ref>
    : [A-Z] (<isLetter> | <isDigit> | _)*
    ;

<rule_ref>
    : [a-z] (<isLetter> | <isDigit> | _)*
    ;

<int>
    : 0 | [1-9][0-9]*
    ;

<escseq>
	: \\ ([btnfr'\\] | (u [0-9A-F]{1,4}) | .)
	;

<string_literal>
    : \' (<escseq> | [^'\r\n\\])* \'
    ;

lexerCharSet <lexer_char_set>
	: ([^\]\\] | <escseq> )+
	;

<doc_comment>
    : /\*\*([^*/]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/
    ;

<comment>
	: \/\/ [^\r\n]* 
	| /\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/
	| <doc_comment>
 	;

<whitespace>
	: \s+
	;

# The main entry point for parsing a v4 grammar.
grammarSpec
   : grammarType identifier 'nameToken' <semicolon> 'semicolon' prequelConstruct 'prequel'* rules modeSpec 'mode'* {{}}
   ;

grammarType
   : (<lexer> 'grammarTypeToken' <grammar> 'grammarToken' | <parser> 'grammarTypeToken' <grammar> 'grammarToken' | <grammar> 'grammarToken')
   ;

# This is the list of all constructs that can be declared before
# the set of rules that compose the grammar, and is invoked 0..n
# times by the grammarPrequel rule.
prequelConstruct
   : optionsSpec
   | delegateGrammars
   | tokensSpec
   | channelsSpec
   | action
   ;

# ------------
# Options - things that affect analysis and/or code generation
optionsSpec
   : <options> 'optionsToken' <lBrace> 'leftBrace' (option 'option' <semicolon> 'semicolon')* <rBrace> 'rightBrace' {{}}
   ;

option
   : identifier 'nameToken' <equal> 'equal' optionValue 'value' {{}}
   ;

optionValue
   : identifier 'nameToken' (<dot> 'dot' identifier 'nameToken')* {{NamespaceName}}
   | <string_literal> 'value' {{StringLiteral}}
   | actionBlock 'actionBlock'
   | <int> 'value' {{IntegerLiteral}}
   ;

# ------------
# Delegates
delegateGrammars
   : <import> 'importToken' delegateGrammar 'import' (<comma> 'comma' delegateGrammar 'import')* <semicolon> 'semicolon' {{Import}}
   ;

delegateGrammar
   : identifier 'aliasNameToken' <equal> 'equal' identifier 'nameToken' {{}}
   | identifier 'nameToken' {{}}
   ;

# ------------
# Tokens & Channels
tokensSpec
   : <tokens> 'tokensToken' <lBrace> 'leftBrace' idList? <rBrace> 'rightBrace' {{}}
   ;

channelsSpec
   : <channels> 'channelsToken' <lBrace> 'leftBrace' idList? <rBrace> 'rightBrace' {{}}
   ;

idList
   : identifier 'nameToken' (<comma> 'comma' identifier 'nameToken')* <comma> 'comma'?
   ;

# Match stuff like @parser::members {int i;}
action
   : <at> 'atToken' (actionScopeName 'scopeName' <colonColon> 'colonColon')? identifier 'nameToken' actionBlock 'actionBlock' {{}}
   ;

# Scope names could collide with keywords; allow them as ids for action scopes
actionScopeName
   : identifier 'nameToken' 
   | <lexer> 'nameToken' 
   | <parser> 'nameToken' 
   ;

actionBlock
   : SwitchToAction <lBrace> 'leftBrace' <actionBlock> 'actionBlock'  <rBrace> 'rightBrace' {{}}
   ;

SwitchToAction
    : {self scope: #action. nil}
    ;

argActionBlock
   : SwitchToArgAction <lBracket> 'leftBracket' <argActionBlock> 'argActionBlock' <rBracket> 'rightBracket'
   ;

SwitchToArgAction
    : {self scope: #argAction. nil}
    ;

modeSpec
   : <mode> 'modeToken' identifier 'nameToken' <semicolon> 'semicolon' lexerRuleSpec 'lexerRule'* {{}}
   ;

rules
   : ruleSpec 'rule'*
   ;

ruleSpec
   : parserRuleSpec
   | lexerRuleSpec
   ;

parserRuleSpec
   : ruleModifiers? <rule_ref> 'nameToken' argActionBlock? ruleReturns? throwsSpec 'throws'? localsSpec 'locals'? rulePrequel 'prequel'* <colon> 'colon' ruleBlock <semicolon> 'semicolon' exceptionGroup {{}}
   ;

exceptionGroup
   : exceptionHandler 'handler'* finallyClause 'finally'? 
   ;

exceptionHandler
   : <catch> 'catchToken' argActionBlock actionBlock 'actionBlock' {{}}
   ;

finallyClause
   : <finally> 'finallyToken' actionBlock 'actionBlock' {{}}
   ;

rulePrequel
   : optionsSpec
   | ruleAction
   ;

ruleReturns
   : <returns> 'returnsToken' argActionBlock
   ;

# --------------
# Exception spec
throwsSpec
   : <throws> 'throwsToken' identifier 'nameToken' (<comma> 'comma' identifier 'nameToken')* {{}}
   ;

localsSpec
   : <locals> 'localsToken' argActionBlock {{}}
   ;

/** Match stuff like @init {int i;} */
ruleAction
   : <at> 'atToken' identifier 'nameToken' actionBlock 'actionBlock' {{}}
   ;

ruleModifiers
   : ruleModifier +
   ;

# An individual access modifier for a rule. The 'fragment' modifier
# is an internal indication for lexer rules that they do not match
# from the input but are like subroutines for other lexer rules to
# reuse for certain lexical patterns. The other modifiers are passed
# to the code generation templates and may be ignored by the template
# if they are of no use in that language.
ruleModifier
   : <public> 'modifier'
   | <private> 'modifier'
   | <protected> 'modifier'
   | <fragment> 'modifier'
   ;

ruleBlock
   : ruleAltList
   ;

ruleAltList
   : labeledAlt (<bar> 'bar' labeledAlt)*
   ;

labeledAlt
   : alternative (<pound> 'pound' identifier 'nameToken')?
   ;

# --------------------
# lexer rules
lexerRuleSpec
   : <fragment> 'modifier'? <token_ref> 'nameToken' <colon> 'colon' lexerRuleBlock <semicolon> 'semicolon' {{}}
   ;

lexerRuleBlock
   : lexerAltList
   ;

lexerAltList
   : lexerAlt 'lexerExpression' (<bar> 'bar' lexerAlt 'lexerExpression')*
   ;

lexerAlt
   : lexerElements lexerCommands 'lexerCommand'? {{}}
   | {{}}
   # explicitly allow empty alts
   ;

lexerElements
   : lexerElement 'lexerElement' +
   ;

lexerElement
   : labeledLexerElement 'labeledLexerElement' ebnfSuffix 'suffix'? {{}}
   | lexerAtom 'expression' ebnfSuffix 'suffix'? {{}}
   | lexerBlock 'expression' ebnfSuffix 'suffix'? {{}}
   | actionBlock 'actionBlock' <question> 'questionMark'? {{}}
   ;

# but preds can be anywhere
labeledLexerElement
   : identifier 'nameToken' (<equal> 'equal' | <plusEqual> 'equal') (lexerAtom 'expression' | lexerBlock 'expression') {{}}
   ;

lexerBlock
   : <lParen> 'leftParen' lexerAltList <rParen> 'rightParen' {{}}
   ;

# E.g., channel(HIDDEN), skip, more, mode(INSIDE), push(INSIDE), pop
lexerCommands
   : <arrow> 'arrow' lexerCommand 'command' (<comma> 'comma' lexerCommand 'command')* {{}}
   ;

lexerCommand
   : lexerCommandName <lParen> 'leftParen' lexerCommandExpr <rParen> 'rightParen' {{}}
   | lexerCommandName {{}}
   ;

lexerCommandName
   : identifier 'nameToken'
   | <mode> 'modeToken'
   ;

lexerCommandExpr
   : identifier 'nameToken'
   | <int> 'value'
   ;

# --------------------
# Rule Alts
altList
   : alternative (<bar> 'bar' alternative)*
   ;

alternative
   : elementOptions 'options'? element 'element' +
   |
   # explicitly allow empty alts
   ;

element
   : labeledElement (ebnfSuffix 'suffix' |) {{}}
   | atom 'value' (ebnfSuffix 'suffix' |) {{}}
   | ebnf
   | actionBlock 'actionBlock' <question> 'questionMark'? {{}}
   ;

labeledElement
   : identifier 'nameToken' (<equal> 'equal' | <plusEqual> 'equal') (atom 'value' | block 'value')
   ;

# --------------------
# EBNF and blocks
ebnf
   : block 'block' blockSuffix? {{}}
   ;

blockSuffix
   : ebnfSuffix 'suffix'
   ;

ebnfSuffix
   : <question> 'countToken' <question> 'nonGreedyToken'? {{}}
   | <star> 'countToken' <question> 'nonGreedyToken'? {{}}
   | <plus> 'countToken' <question> 'nonGreedyToken'? {{}}
   ;

lexerAtom
   : characterRange
   | terminal
   | notSet
   | lexerCharSet
   | <dot> 'dot' elementOptions 'options'? {{}}
   ;

atom
   : terminal
   | ruleref
   | notSet
   | <dot> 'dot' elementOptions 'options'? {{}}
   ;

# --------------------
# Inverted element set
notSet
   : <tilde> 'tilde' setElement 'expression' {{}}
   | <tilde> 'tilde' blockSet 'expression' {{}}
   ;

blockSet
   : <lParen> 'leftParen' setElement 'expression' (<bar> 'bar' setElement 'expression')* <rParen> 'rightParen' {{}}
   ;

setElement
   : <token_ref> 'nameToken' elementOptions 'options'? {{}}
   | <string_literal> 'value' elementOptions 'options'? {{}}
   | characterRange
   | lexerCharSet
   ;

lexerCharSet
	: SwitchToLexerCharSet <lBracket> 'leftBracket' <lexer_char_set> 'charSet' SwitchToDefault <rBracket> 'rightBracket' {{}}
	;
	
SwitchToLexerCharSet
	: {self scope: #lexerCharSet. nil}
	;
	
SwitchToDefault
	: {self scope: #default. nil}
	;

# -------------
# Grammar Block
block
   : <lParen> 'leftParen' (optionsSpec 'options'? ruleAction 'action'* <colon> 'colon')? altList <rParen> 'rightParen' {{}}
   ;

# ----------------
# Parser rule ref
ruleref
   : <rule_ref> 'nameToken' argActionBlock? elementOptions 'options'? {{}}
   ;

# ---------------
# Character Range
characterRange
   : <string_literal> 'from' <dotDot> 'dotDot' <string_literal> 'to' {{}}
   ;

terminal
   : <token_ref> 'nameToken' elementOptions 'options'? {{ReferenceTerminal}}
   | <string_literal> 'value' elementOptions 'options'? {{StringTerminal}}
   ;

# Terminals may be adorned with certain options when
# reference in the grammar: TOK<,,,>
elementOptions
   : <lt> 'lt' elementOption (<comma> 'comma' elementOption)* <gt> 'gt' {{}}
   ;

elementOption
   : identifier 'nameToken'
   | identifier <equal> 'equal' (identifier | <string_literal> 'value')
   ;

identifier
   : <rule_ref> 'nameToken'
   | <token_ref> 'nameToken'
   ;"
]

{ #category : #'file types' }
Antlr4Parser class >> fileExtension [
	^ '.g4'
]

{ #category : #generated }
Antlr4Parser class >> reduceTable [
^#(
	#(55 1 #reduceActionForgrammarType3:) 
	#(55 2 #reduceActionForgrammarType1:) 
	#(150 1 #liftFirstValue:) 
	#(53 0 #reduceActionForprequelConstruct__prequel__1:) 
	#(82 0 #reduceActionForprequelConstruct__prequel__1:) 
	#(53 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(56 1 #liftFirstValue:) 
	#(54 0 #reduceActionForprequelConstruct__prequel__1:) 
	#(81 1 #reduceActionForrules1:) 
	#(74 1 #liftFirstValue:) 
	#(76 0 #reduceActionForSwitchToAction1:) 
	#(66 0 #reduceActionFor__comma___comma__delegateGrammar__import___1:) 
	#(67 1 #reduceActionFordelegateGrammar2:) 
	#(59 0 #reduceActionFor__comma___comma__delegateGrammar__import___1:) 
	#(52 6 #reduceActionForgrammarSpec1:) 
	#(98 1 #liftFirstValue:) 
	#(78 0 #reduceActionForSwitchToArgAction1:) 
	#(85 0 #nil) 
	#(82 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(83 1 #liftFirstValue:) 
	#(96 1 #reduceActionForrules1:) 
	#(97 1 #reduceActionForruleModifier__1:) 
	#(73 3 #reduceActionForaction1:) 
	#(69 3 #reduceActionForchannelsSpec1:) 
	#(72 0 #reduceActionFor__comma___comma__delegateGrammar__import___1:) 
	#(68 3 #reduceActionFortokensSpec1:) 
	#(54 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(109 0 #reduceActionForlexerAlt3:) 
	#(139 0 #reduceActionForSwitchToLexerCharSet1:) 
	#(86 0 #reduceActionForprequelConstruct__prequel__1:) 
	#(85 1 #liftFirstValue:) 
	#(97 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(69 4 #reduceActionForchannelsSpec2:) 
	#(70 2 #reduceActionForidList1:) 
	#(64 4 #reduceActionFordelegateGrammars1:) 
	#(66 2 #reduceActionFor__comma___comma__delegateGrammar__import___2:) 
	#(67 3 #reduceActionFordelegateGrammar1:) 
	#(57 4 #reduceActionForoptionsSpec1:) 
	#(59 2 #reduceActionFor__comma___comma__delegateGrammar__import___2:) 
	#(68 4 #reduceActionFortokensSpec2:) 
	#(131 1 #reduceActionForlexerAtom5:) 
	#(145 1 #reduceActionForterminal1:) 
	#(145 1 #reduceActionForterminal3:) 
	#(112 1 #reduceActionForlexerElement7:) 
	#(105 1 #reduceActionForrules1:) 
	#(108 0 #reduceActionFor__comma___comma__delegateGrammar__import___1:) 
	#(109 1 #reduceActionForlexerAlt1:) 
	#(110 1 #reduceActionForrules1:) 
	#(111 1 #reduceActionForruleModifier__1:) 
	#(112 1 #reduceActionForlexerElement1:) 
	#(112 1 #reduceActionForlexerElement5:) 
	#(131 1 #liftFirstValue:) 
	#(94 2 #reduceActionForlocalsSpec1:) 
	#(92 2 #reduceActionForruleReturns1:) 
	#(73 5 #reduceActionForaction2:) 
	#(70 3 #reduceActionForidList2:) 
	#(72 2 #reduceActionFor__comma___comma__delegateGrammar__import___2:) 
	#(65 2 #reduceActionForgrammarType1:) 
	#(58 2 #reduceActionForgrammarType1:) 
	#(80 0 #reduceActionForprequelConstruct__prequel__1:) 
	#(131 2 #reduceActionForlexerAtom6:) 
	#(137 1 #reduceActionForsetElement1:) 
	#(137 1 #reduceActionForsetElement3:) 
	#(133 2 #reduceActionFornotSet2:) 
	#(137 1 #liftFirstValue:) 
	#(145 2 #reduceActionForterminal2:) 
	#(145 2 #reduceActionForterminal4:) 
	#(112 2 #reduceActionForlexerElement8:) 
	#(104 4 #reduceActionForlexerRuleSpec1:) 
	#(106 2 #reduceActionForidList1:) 
	#(109 2 #reduceActionForlexerAlt2:) 
	#(111 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(130 1 #reduceActionForebnfSuffix1:) 
	#(112 2 #reduceActionForlexerElement2:) 
	#(112 2 #reduceActionForlexerElement6:) 
	#(93 3 #reduceActionForthrowsSpec1:) 
	#(124 0 #reduceActionForalternative3:) 
	#(91 1 #liftFirstValue:) 
	#(86 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(75 4 #reduceActionForactionBlock1:) 
	#(71 2 #reduceActionForgrammarType1:) 
	#(61 1 #reduceActionForoptionValue4:) 
	#(61 1 #reduceActionForoptionValue2:) 
	#(60 3 #reduceActionForoption1:) 
	#(61 1 #liftFirstValue:) 
	#(63 0 #reduceActionFor__comma___comma__delegateGrammar__import___1:) 
	#(79 4 #reduceActionFormodeSpec1:) 
	#(104 5 #reduceActionForlexerRuleSpec2:) 
	#(114 3 #reduceActionForlexerBlock1:) 
	#(148 0 #reduceActionFor__comma___comma__elementOption__1:) 
	#(149 1 #reduceActionForelementOption1:) 
	#(136 0 #reduceActionFor__comma___comma__delegateGrammar__import___1:) 
	#(137 2 #reduceActionForsetElement2:) 
	#(137 2 #reduceActionForsetElement4:) 
	#(144 3 #reduceActionForcharacterRange1:) 
	#(108 2 #reduceActionFor__comma___comma__delegateGrammar__import___2:) 
	#(119 1 #reduceActionForgrammarType3:) 
	#(117 0 #reduceActionFor__comma___comma__delegateGrammar__import___1:) 
	#(118 1 #reduceActionForlexerCommand2:) 
	#(119 1 #reduceActionForlexerCommandName1:) 
	#(130 2 #reduceActionForebnfSuffix2:) 
	#(140 0 #reduceActionForSwitchToDefault1:) 
	#(113 3 #reduceActionForlabeledLexerElement2:) 
	#(77 4 #reduceActionForargActionBlock1:) 
	#(142 0 #reduceActionForprequelConstruct__prequel__1:) 
	#(132 1 #reduceActionForatom4:) 
	#(143 1 #reduceActionForruleref1:) 
	#(126 1 #reduceActionForelement6:) 
	#(99 1 #reduceActionForrules1:) 
	#(102 0 #reduceActionFor__bar___bar__labeledAlt__1:) 
	#(103 1 #reduceActionForlabeledAlt1:) 
	#(124 1 #reduceActionForalternative1:) 
	#(125 1 #reduceActionForruleModifier__1:) 
	#(126 1 #reduceActionForelement2:) 
	#(126 1 #liftFirstValue:) 
	#(126 1 #reduceActionForelement4:) 
	#(132 1 #liftFirstValue:) 
	#(128 1 #reduceActionForebnf1:) 
	#(61 2 #reduceActionForoptionValue1:) 
	#(80 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(107 2 #reduceActionForgrammarType1:) 
	#(115 3 #reduceActionForlexerCommands1:) 
	#(95 3 #reduceActionForruleAction1:) 
	#(123 0 #reduceActionFor__bar___bar__alternative__1:) 
	#(132 2 #reduceActionForatom5:) 
	#(143 2 #reduceActionForruleref3:) 
	#(143 2 #reduceActionForruleref2:) 
	#(126 2 #reduceActionForelement7:) 
	#(88 0 #reduceActionForprequelConstruct__prequel__1:) 
	#(100 2 #reduceActionForruleAltList1:) 
	#(125 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(126 2 #reduceActionForelement1:) 
	#(126 2 #reduceActionForelement3:) 
	#(128 2 #reduceActionForebnf2:) 
	#(129 1 #liftFirstValue:) 
	#(124 2 #reduceActionForalternative2:) 
	#(63 2 #reduceActionFor__comma___comma__delegateGrammar__import___2:) 
	#(146 4 #reduceActionForelementOptions1:) 
	#(148 2 #reduceActionFor__comma___comma__elementOption__2:) 
	#(149 3 #reduceActionForelementOption3:) 
	#(149 3 #reduceActionForelementOption2:) 
	#(134 4 #reduceActionForblockSet1:) 
	#(136 2 #reduceActionFor__comma___comma__delegateGrammar__import___2:) 
	#(117 2 #reduceActionFor__comma___comma__delegateGrammar__import___2:) 
	#(120 1 #reduceActionForgrammarType3:) 
	#(120 1 #reduceActionForlexerCommandName1:) 
	#(138 5 #reduceActionForlexerCharSet1:) 
	#(141 3 #reduceActionForblock1:) 
	#(121 2 #reduceActionForaltList1:) 
	#(142 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(143 3 #reduceActionForruleref4:) 
	#(84 7 #reduceActionForparserRuleSpec1:) 
	#(87 1 #reduceActionForalternative1:) 
	#(102 2 #reduceActionFor__bar___bar__labeledAlt__2:) 
	#(103 3 #reduceActionForlabeledAlt2:) 
	#(127 3 #reduceActionForlabeledElement1:) 
	#(62 2 #reduceActionForgrammarType1:) 
	#(147 2 #reduceActionFor__comma___comma__elementOption_1:) 
	#(135 2 #reduceActionForgrammarType1:) 
	#(116 2 #reduceActionForgrammarType1:) 
	#(118 4 #reduceActionForlexerCommand1:) 
	#(84 8 #reduceActionForparserRuleSpec5:) 
	#(123 2 #reduceActionFor__bar___bar__alternative__2:) 
	#(88 2 #reduceActionForprequelConstruct__prequel__2:) 
	#(87 2 #reduceActionForexceptionGroup2:) 
	#(101 2 #reduceActionFor__bar___bar__labeledAlt_1:) 
	#(84 8 #reduceActionForparserRuleSpec3:) 
	#(84 8 #reduceActionForparserRuleSpec2:) 
	#(84 8 #reduceActionForparserRuleSpec9:) 
	#(84 9 #reduceActionForparserRuleSpec7:) 
	#(84 9 #reduceActionForparserRuleSpec6:) 
	#(122 2 #reduceActionFor__bar___bar__alternative_1:) 
	#(141 5 #reduceActionForblock2:) 
	#(90 2 #reduceActionForfinallyClause1:) 
	#(84 9 #reduceActionForparserRuleSpec4:) 
	#(84 9 #reduceActionForparserRuleSpec13:) 
	#(84 9 #reduceActionForparserRuleSpec11:) 
	#(84 9 #reduceActionForparserRuleSpec10:) 
	#(84 10 #reduceActionForparserRuleSpec8:) 
	#(141 6 #reduceActionForblock3:) 
	#(89 3 #reduceActionForexceptionHandler1:) 
	#(84 10 #reduceActionForparserRuleSpec15:) 
	#(84 10 #reduceActionForparserRuleSpec14:) 
	#(84 10 #reduceActionForparserRuleSpec12:) 
	#(84 11 #reduceActionForparserRuleSpec16:)
	).
]

{ #category : #'generated-accessing' }
Antlr4Parser class >> scannerClass [
	^Antlr4Scanner
]

{ #category : #generated }
Antlr4Parser class >> startingStateForgrammarSpec [
	^ 1
]

{ #category : #generated }
Antlr4Parser class >> symbolNames [
	^ #('<actionBlock>' '<argActionBlock>' '<semicolon>' '<bar>' '<lParen>' '<lBracket>' '<lBrace>' '<rParen>' '<rBracket>' '<rBrace>' '<comma>' '<lt>' '<gt>' '<dotDot>' '<dot>' '<tilde>' '<equal>' '<plusEqual>' '<question>' '<star>' '<plus>' '<at>' '<pound>' '<colon>' '<colonColon>' '<arrow>' '<catch>' '<channels>' '<finally>' '<fragment>' '<grammar>' '<import>' '<lexer>' '<locals>' '<mode>' '<options>' '<parser>' '<private>' '<protected>' '<public>' '<returns>' '<throws>' '<tokens>' '<token_ref>' '<rule_ref>' '<int>' '<string_literal>' '<lexer_char_set>' '<comment>' '<whitespace>' 'B e g i n' 'grammarSpec' 'prequelConstruct ''prequel''*' 'modeSpec ''mode''*' 'grammarType' 'prequelConstruct' 'optionsSpec' '(option ''option'' <semicolon> ''semicolon'')' '(option ''option'' <semicolon> ''semicolon'')*' 'option' 'optionValue' '(<dot> ''dot'' identifier ''nameToken'')' '(<dot> ''dot'' identifier ''nameToken'')*' 'delegateGrammars' '(<comma> ''comma'' delegateGrammar ''import'')' '(<comma> ''comma'' delegateGrammar ''import'')*' 'delegateGrammar' 'tokensSpec' 'channelsSpec' 'idList' '(<comma> ''comma'' identifier ''nameToken'')' '(<comma> ''comma'' identifier ''nameToken'')*' 'action' 'actionScopeName' 'actionBlock' 'SwitchToAction' 'argActionBlock' 'SwitchToArgAction' 'modeSpec' 'lexerRuleSpec ''lexerRule''*' 'rules' 'ruleSpec ''rule''*' 'ruleSpec' 'parserRuleSpec' 'localsSpec ''locals''?' 'rulePrequel ''prequel''*' 'exceptionGroup' 'exceptionHandler ''handler''*' 'exceptionHandler' 'finallyClause' 'rulePrequel' 'ruleReturns' 'throwsSpec' 'localsSpec' 'ruleAction' 'ruleModifiers' 'ruleModifier +' 'ruleModifier' 'ruleBlock' 'ruleAltList' '(<bar> ''bar'' labeledAlt)' '(<bar> ''bar'' labeledAlt)*' 'labeledAlt' 'lexerRuleSpec' 'lexerRuleBlock' 'lexerAltList' '(<bar> ''bar'' lexerAlt ''lexerExpression'')' '(<bar> ''bar'' lexerAlt ''lexerExpression'')*' 'lexerAlt' 'lexerElements' 'lexerElement ''lexerElement'' +' 'lexerElement' 'labeledLexerElement' 'lexerBlock' 'lexerCommands' '(<comma> ''comma'' lexerCommand ''command'')' '(<comma> ''comma'' lexerCommand ''command'')*' 'lexerCommand' 'lexerCommandName' 'lexerCommandExpr' 'altList' '(<bar> ''bar'' alternative)' '(<bar> ''bar'' alternative)*' 'alternative' 'element ''element'' +' 'element' 'labeledElement' 'ebnf' 'blockSuffix' 'ebnfSuffix' 'lexerAtom' 'atom' 'notSet' 'blockSet' '(<bar> ''bar'' setElement ''expression'')' '(<bar> ''bar'' setElement ''expression'')*' 'setElement' 'lexerCharSet' 'SwitchToLexerCharSet' 'SwitchToDefault' 'block' 'ruleAction ''action''*' 'ruleref' 'characterRange' 'terminal' 'elementOptions' '(<comma> ''comma'' elementOption)' '(<comma> ''comma'' elementOption)*' 'elementOption' 'identifier' 'E O F' 'error')
]

{ #category : #generated }
Antlr4Parser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #Antlr4GrammarSpecNode #Antlr4GrammarSpecNode #OrderedCollection #OrderedCollection #OrderedCollection #Antlr4GrammarNode #Antlr4OptionsSpecNode #OrderedCollection #OrderedCollection #Antlr4OptionNode #Antlr4GrammarNode #OrderedCollection #OrderedCollection #Antlr4ImportNode #OrderedCollection #OrderedCollection #Antlr4DelegateGrammarNode #Antlr4TokensSpecNode #Antlr4ChannelsSpecNode #OrderedCollection #OrderedCollection #OrderedCollection #Antlr4ActionNode #SmaCCToken #Antlr4ActionBlockNode nil #OrderedCollection nil #Antlr4ModeSpecNode #OrderedCollection #OrderedCollection #OrderedCollection #Antlr4GrammarNode #Antlr4ParserRuleSpecNode #Antlr4LocalsSpecNode #OrderedCollection #OrderedCollection #OrderedCollection #Antlr4ExceptionHandlerNode #Antlr4FinallyClauseNode #Antlr4GrammarNode #OrderedCollection #Antlr4ThrowsSpecNode #Antlr4LocalsSpecNode #Antlr4RuleActionNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Antlr4LexerRuleSpecNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Antlr4LexerAltNode #OrderedCollection #OrderedCollection #Antlr4LexerElementNode #Antlr4LabeledLexerElementNode #Antlr4LexerBlockNode #Antlr4LexerCommandsNode #OrderedCollection #OrderedCollection #Antlr4LexerCommandNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Antlr4GrammarNode #OrderedCollection #Antlr4EbnfNode #Antlr4EbnfSuffixNode #Antlr4EbnfSuffixNode #Antlr4GrammarNode #Antlr4GrammarNode #Antlr4NotSetNode #Antlr4BlockSetNode #OrderedCollection #OrderedCollection #Antlr4GrammarNode #Antlr4LexerCharSetNode nil nil #Antlr4BlockNode #OrderedCollection #Antlr4RulerefNode #Antlr4CharacterRangeNode #Antlr4GrammarNode #Antlr4ElementOptionsNode #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCError)
]

{ #category : #generated }
Antlr4Parser class >> transitionTable [
^#(
#[1 0 9 0 31 0 13 0 33 0 17 0 37 0 21 0 52 0 25 0 55] 
#[0 0 6 0 44 0 45] 
#[0 0 29 0 31] 
#[0 0 33 0 31] 
#[0 0 0 0 151] 
#[0 0 45 0 44 0 45 0 150] 
#[0 0 10 0 44 0 45] 
#[0 0 10 0 44 0 45] 
#[0 0 14 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 13 0 15 0 17 0 22 0 24 0 25 0 34 0 36] 
#[0 0 14 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 13 0 15 0 17 0 18 0 22 0 24 0 25 0 34 0 36] 
#[0 0 49 0 3] 
#[1 0 18 0 22 0 18 0 28 0 18 0 30 0 18 0 32 0 18 0 35 0 18 0 36 0 18 0 38 0 18 0 39 0 18 0 40 0 18 0 43 0 18 0 44 0 18 0 45 0 53 0 53 0 18 0 151] 
#[1 0 57 0 22 0 61 0 28 0 22 0 30 0 65 0 32 0 22 0 35 0 69 0 36 0 22 0 38 0 22 0 39 0 22 0 40 0 73 0 43 0 22 0 44 0 22 0 45 0 77 0 56 0 77 0 57 0 77 0 64 0 77 0 68 0 77 0 69 0 77 0 73 0 101 0 81 0 105 0 82 0 22 0 151] 
#[1 0 117 0 33 0 117 0 37 0 121 0 44 0 121 0 45 0 117 0 74 0 121 0 150] 
#[0 0 125 0 7] 
#[1 0 133 0 44 0 133 0 45 0 129 0 67 0 133 0 150] 
#[0 0 137 0 7] 
#[0 0 141 0 7] 
#[0 0 26 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 0 30 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 0 30 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 0 30 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 0 30 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 0 30 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[1 0 34 0 35 0 145 0 54 0 34 0 151] 
#[1 0 149 0 30 0 38 0 35 0 189 0 38 0 189 0 39 0 189 0 40 0 165 0 44 0 169 0 45 0 173 0 83 0 173 0 84 0 181 0 96 0 185 0 97 0 189 0 98 0 173 0 104 0 38 0 151] 
#[0 0 42 0 25] 
#[0 0 42 0 25] 
#[0 0 197 0 25] 
#[1 0 46 0 7 0 42 0 25 0 201 0 75 0 205 0 76] 
#[1 0 209 0 10 0 217 0 44 0 217 0 45 0 213 0 70 0 217 0 150] 
#[1 0 50 0 3 0 50 0 11 0 221 0 66] 
#[1 0 54 0 3 0 54 0 11 0 225 0 17] 
#[1 0 58 0 10 0 58 0 44 0 58 0 45 0 229 0 59] 
#[1 0 233 0 10 0 217 0 44 0 217 0 45 0 237 0 70 0 217 0 150] 
#[1 0 241 0 35 0 245 0 79 0 62 0 151] 
#[1 0 66 0 30 0 66 0 38 0 66 0 39 0 66 0 40 0 249 0 44 0 66 0 45] 
#[0 0 66 0 30 0 38 0 39 0 40 0 45] 
#[0 0 66 0 30 0 38 0 39 0 40 0 45] 
#[0 0 66 0 30 0 38 0 39 0 40 0 45] 
#[0 0 253 0 24] 
#[1 0 70 0 6 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 1 5 0 41 1 9 0 42 1 13 0 77 1 17 0 78 1 21 0 85 1 25 0 92 1 29 0 93 1 21 0 94] 
#[0 0 78 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 0 82 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 1 37 0 45] 
#[1 1 45 0 30 1 45 0 38 1 45 0 39 1 45 0 40 0 86 0 45 1 45 0 98] 
#[0 0 90 0 30 0 38 0 39 0 40 0 45] 
#[0 0 82 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 1 49 0 44 0 45 0 150] 
#[0 0 94 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 1 53 0 7] 
#[0 0 98 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 1 57 0 10] 
#[1 0 102 0 10 0 102 0 11 1 61 0 72] 
#[1 1 65 0 3 1 69 0 11 1 73 0 65] 
#[0 1 77 0 44 0 45 0 150] 
#[1 1 81 0 10 1 93 0 44 1 93 0 45 1 85 0 58 1 89 0 60 1 93 0 150] 
#[0 0 106 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 1 97 0 10] 
#[0 1 101 0 44 0 45 0 150] 
#[0 0 110 0 35 0 151] 
#[0 1 105 0 24] 
#[1 0 114 0 3 0 114 0 4 1 109 0 5 0 118 0 6 0 46 0 7 1 113 0 15 1 117 0 16 1 121 0 44 1 189 0 45 1 125 0 47 1 129 0 75 0 205 0 76 1 133 0 105 1 137 0 106 1 141 0 109 1 145 0 110 1 149 0 111 1 153 0 112 1 157 0 113 1 161 0 114 1 165 0 131 1 165 0 133 1 165 0 138 1 177 0 139 1 165 0 144 1 165 0 145 1 189 0 150] 
#[1 0 70 0 6 1 193 0 77 1 17 0 78] 
#[1 0 70 0 6 1 197 0 77 1 17 0 78] 
#[0 1 201 0 44 0 45 0 150] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 1 5 0 41 1 9 0 42 1 205 0 85 1 209 0 92 1 213 0 93 1 205 0 94] 
#[0 1 217 0 6] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 1 221 0 86] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 1 9 0 42 1 225 0 85 1 229 0 93 1 225 0 94] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 1 233 0 85 1 233 0 94] 
#[0 0 126 0 22 0 24 0 36] 
#[1 0 70 0 6 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 1 5 0 41 1 9 0 42 1 237 0 77 1 17 0 78 1 241 0 85 1 245 0 92 1 249 0 93 1 241 0 94] 
#[0 0 66 0 30 0 38 0 39 0 40 0 45] 
#[0 0 130 0 30 0 38 0 39 0 40 0 45] 
#[1 0 46 0 7 1 253 0 75 0 205 0 76] 
#[0 2 1 0 1] 
#[0 0 134 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[1 0 138 0 10 2 5 0 11 2 9 0 71] 
#[0 0 142 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[1 0 133 0 44 0 133 0 45 2 13 0 67 0 133 0 150] 
#[0 0 146 0 3 0 11] 
#[0 0 150 0 3 0 11] 
#[0 0 154 0 22 0 24 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 0 158 0 10 0 44 0 45] 
#[0 2 17 0 3] 
#[0 2 21 0 17] 
#[0 0 162 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 2 25 0 3] 
#[1 0 114 0 3 0 114 0 4 1 109 0 5 0 118 0 6 0 46 0 7 1 113 0 15 1 117 0 16 1 121 0 44 1 189 0 45 1 125 0 47 1 129 0 75 0 205 0 76 2 29 0 105 1 137 0 106 1 141 0 109 1 145 0 110 1 149 0 111 1 153 0 112 1 157 0 113 1 161 0 114 1 165 0 131 1 165 0 133 1 165 0 138 1 177 0 139 1 165 0 144 1 165 0 145 1 189 0 150] 
#[1 0 114 0 4 1 109 0 5 0 118 0 6 0 46 0 7 0 114 0 8 1 113 0 15 1 117 0 16 1 121 0 44 1 189 0 45 1 125 0 47 1 129 0 75 0 205 0 76 2 33 0 106 1 141 0 109 1 145 0 110 1 149 0 111 1 153 0 112 1 157 0 113 1 161 0 114 1 165 0 131 1 165 0 133 1 165 0 138 1 177 0 139 1 165 0 144 1 165 0 145 1 189 0 150] 
#[1 0 166 0 3 0 166 0 4 0 166 0 5 0 166 0 6 0 166 0 7 0 166 0 8 2 37 0 12 0 166 0 15 0 166 0 16 0 166 0 19 0 166 0 20 0 166 0 21 0 166 0 26 0 166 0 44 0 166 0 45 0 166 0 47 2 41 0 146] 
#[1 2 45 0 5 0 118 0 6 2 49 0 44 2 53 0 47 2 57 0 134 2 61 0 137 2 61 0 138 1 177 0 139 2 61 0 144] 
#[1 0 170 0 3 0 170 0 4 0 170 0 5 0 170 0 6 0 170 0 7 0 170 0 8 2 37 0 12 0 170 0 15 0 170 0 16 0 14 0 17 0 14 0 18 0 170 0 19 0 170 0 20 0 170 0 21 0 170 0 23 0 170 0 26 0 170 0 44 0 170 0 45 0 170 0 47 2 73 0 146] 
#[1 0 174 0 3 0 174 0 4 0 174 0 5 0 174 0 6 0 174 0 7 0 174 0 8 2 37 0 12 2 77 0 14 0 174 0 15 0 174 0 16 0 174 0 19 0 174 0 20 0 174 0 21 0 174 0 26 0 174 0 44 0 174 0 45 0 174 0 47 2 81 0 146] 
#[1 0 178 0 3 0 178 0 4 0 178 0 5 0 178 0 6 0 178 0 7 0 178 0 8 0 178 0 15 0 178 0 16 2 85 0 19 0 178 0 26 0 178 0 44 0 178 0 45 0 178 0 47] 
#[0 2 89 0 3] 
#[0 0 182 0 3] 
#[1 0 186 0 3 0 186 0 4 0 186 0 8 2 93 0 108] 
#[1 0 190 0 3 0 190 0 4 0 190 0 8 2 97 0 26 2 101 0 115] 
#[1 0 194 0 3 0 194 0 4 1 109 0 5 0 118 0 6 0 46 0 7 0 194 0 8 1 113 0 15 1 117 0 16 0 194 0 26 1 121 0 44 1 189 0 45 1 125 0 47 1 129 0 75 0 205 0 76 2 105 0 112 1 157 0 113 1 161 0 114 1 165 0 131 1 165 0 133 1 165 0 138 1 177 0 139 1 165 0 144 1 165 0 145 1 189 0 150] 
#[0 0 198 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 26 0 44 0 45 0 47] 
#[1 0 202 0 3 0 202 0 4 0 202 0 5 0 202 0 6 0 202 0 7 0 202 0 8 0 202 0 15 0 202 0 16 2 109 0 19 2 113 0 20 2 117 0 21 0 202 0 26 0 202 0 44 0 202 0 45 0 202 0 47 2 121 0 130] 
#[1 0 206 0 3 0 206 0 4 0 206 0 5 0 206 0 6 0 206 0 7 0 206 0 8 0 206 0 15 0 206 0 16 2 109 0 19 2 113 0 20 2 117 0 21 0 206 0 26 0 206 0 44 0 206 0 45 0 206 0 47 2 125 0 130] 
#[1 0 206 0 3 0 206 0 4 0 206 0 5 0 206 0 6 0 206 0 7 0 206 0 8 0 206 0 15 0 206 0 16 2 109 0 19 2 113 0 20 2 117 0 21 0 206 0 26 0 206 0 44 0 206 0 45 0 206 0 47 2 129 0 130] 
#[0 0 210 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[0 0 210 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[0 2 133 0 6] 
#[0 0 210 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[0 0 210 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[1 2 137 0 17 2 141 0 18] 
#[0 0 214 0 22 0 24 0 36] 
#[0 0 218 0 22 0 24 0 34 0 36 0 42] 
#[1 0 102 0 11 0 102 0 22 0 102 0 24 0 102 0 34 0 102 0 36 2 145 0 72] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 2 149 0 86] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 1 9 0 42 2 153 0 85 2 157 0 93 2 153 0 94] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 2 161 0 85 2 161 0 94] 
#[0 2 165 0 2] 
#[1 2 169 0 22 2 173 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 2 189 0 86] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 2 193 0 85 2 193 0 94] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 2 197 0 86] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 1 5 0 41 1 9 0 42 2 201 0 85 2 205 0 92 2 209 0 93 2 201 0 94] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 2 213 0 86] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 1 9 0 42 2 217 0 85 2 221 0 93 2 217 0 94] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 2 225 0 85 2 225 0 94] 
#[0 0 222 0 22 0 28 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 151] 
#[0 2 229 0 10] 
#[1 0 226 0 10 2 233 0 44 2 233 0 45 2 233 0 150] 
#[0 0 230 0 10 0 11 0 22 0 24 0 34 0 36] 
#[0 0 234 0 3 0 11] 
#[0 0 238 0 10 0 44 0 45] 
#[1 0 46 0 7 2 253 0 44 2 253 0 45 2 237 0 46 2 241 0 47 2 245 0 61 2 245 0 75 0 205 0 76 2 253 0 150] 
#[1 0 242 0 30 0 242 0 35 0 242 0 44 3 1 0 80 0 242 0 151] 
#[0 3 5 0 3] 
#[0 3 9 0 8] 
#[1 3 17 0 44 3 17 0 45 3 13 0 149 3 17 0 150] 
#[0 0 246 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[1 0 118 0 6 2 49 0 44 2 53 0 47 3 21 0 137 3 21 0 138 1 177 0 139 3 21 0 144] 
#[1 0 250 0 3 0 250 0 4 0 250 0 5 0 250 0 6 0 250 0 7 0 250 0 8 2 37 0 12 0 250 0 15 0 250 0 16 0 250 0 19 0 250 0 20 0 250 0 21 0 250 0 23 0 250 0 26 0 250 0 44 0 250 0 45 0 250 0 47 3 25 0 146] 
#[1 0 254 0 3 0 254 0 4 0 254 0 5 0 254 0 6 0 254 0 7 0 254 0 8 2 37 0 12 2 77 0 14 0 254 0 15 0 254 0 16 0 254 0 19 0 254 0 20 0 254 0 21 0 254 0 23 0 254 0 26 0 254 0 44 0 254 0 45 0 254 0 47 3 29 0 146] 
#[0 1 2 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 1 2 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 1 6 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 1 6 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 1 10 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 3 33 0 47] 
#[0 1 14 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 1 18 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 26 0 44 0 45 0 47] 
#[0 1 22 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 1 26 0 3 3 37 0 4 1 26 0 8 3 41 0 107] 
#[1 3 45 0 35 3 57 0 44 3 57 0 45 3 49 0 118 3 53 0 119 3 57 0 150] 
#[0 1 30 0 3 0 4 0 8] 
#[0 1 34 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 26 0 44 0 45 0 47] 
#[1 1 38 0 3 1 38 0 4 1 38 0 5 1 38 0 6 1 38 0 7 1 38 0 8 1 38 0 15 1 38 0 16 3 61 0 19 1 38 0 23 1 38 0 26 1 38 0 44 1 38 0 45 1 38 0 47] 
#[1 1 38 0 3 1 38 0 4 1 38 0 5 1 38 0 6 1 38 0 7 1 38 0 8 1 38 0 15 1 38 0 16 3 65 0 19 1 38 0 23 1 38 0 26 1 38 0 44 1 38 0 45 1 38 0 47] 
#[1 1 38 0 3 1 38 0 4 1 38 0 5 1 38 0 6 1 38 0 7 1 38 0 8 1 38 0 15 1 38 0 16 3 69 0 19 1 38 0 23 1 38 0 26 1 38 0 44 1 38 0 45 1 38 0 47] 
#[0 1 42 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 26 0 44 0 45 0 47] 
#[0 1 46 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 26 0 44 0 45 0 47] 
#[0 1 46 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 26 0 44 0 45 0 47] 
#[0 3 73 0 48] 
#[1 1 109 0 5 0 118 0 6 1 113 0 15 1 117 0 16 3 77 0 44 1 125 0 47 3 81 0 114 3 85 0 131 3 85 0 133 3 85 0 138 1 177 0 139 3 85 0 144 3 85 0 145] 
#[1 1 109 0 5 0 118 0 6 1 113 0 15 1 117 0 16 3 77 0 44 1 125 0 47 3 89 0 114 3 93 0 131 3 93 0 133 3 93 0 138 1 177 0 139 3 93 0 144 3 93 0 145] 
#[1 3 97 0 11 1 50 0 22 1 50 0 24 1 50 0 34 1 50 0 36 2 9 0 71] 
#[1 2 169 0 22 3 101 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 3 105 0 86] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 3 109 0 85 3 109 0 94] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 3 113 0 86] 
#[0 3 117 0 9] 
#[0 3 121 0 44 0 45 0 150] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 3 145 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 1 58 0 22 0 24 0 36] 
#[0 1 62 0 22 0 24 0 36] 
#[0 1 58 0 22 0 24 0 36] 
#[1 2 169 0 22 3 205 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 3 209 0 86] 
#[1 2 169 0 22 3 213 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 3 217 0 86] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 1 9 0 42 3 221 0 85 3 225 0 93 3 221 0 94] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 3 229 0 85 3 229 0 94] 
#[1 2 169 0 22 3 233 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 3 237 0 86] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 3 241 0 85 3 241 0 94] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 3 245 0 86] 
#[0 1 66 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 22 0 23 0 24 0 26 0 27 0 28 0 29 0 30 0 32 0 35 0 36 0 38 0 39 0 40 0 43 0 44 0 45 0 47 0 151] 
#[0 1 70 0 10 0 11 0 22 0 24 0 34 0 36] 
#[0 1 74 0 3] 
#[0 1 78 0 3] 
#[0 1 82 0 3] 
#[0 1 86 0 3] 
#[1 1 90 0 3 1 90 0 15 3 249 0 63] 
#[1 3 253 0 30 1 94 0 35 0 165 0 44 4 1 0 104 1 94 0 151] 
#[0 1 98 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 1 102 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[1 1 106 0 11 1 106 0 13 4 5 0 148] 
#[1 1 110 0 11 1 110 0 13 4 9 0 17] 
#[1 1 114 0 4 1 114 0 8 4 13 0 136] 
#[0 1 118 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 1 122 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 1 126 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[1 0 114 0 3 0 114 0 4 1 109 0 5 0 118 0 6 0 46 0 7 0 114 0 8 1 113 0 15 1 117 0 16 1 121 0 44 1 189 0 45 1 125 0 47 1 129 0 75 0 205 0 76 4 17 0 109 1 145 0 110 1 149 0 111 1 153 0 112 1 157 0 113 1 161 0 114 1 165 0 131 1 165 0 133 1 165 0 138 1 177 0 139 1 165 0 144 1 165 0 145 1 189 0 150] 
#[0 1 130 0 3 0 4 0 8] 
#[0 1 134 0 3 0 4 0 5 0 8 0 11] 
#[1 1 138 0 3 1 138 0 4 1 138 0 8 1 138 0 11 4 21 0 117] 
#[1 1 142 0 3 1 142 0 4 4 25 0 5 1 142 0 8 1 142 0 11] 
#[0 1 146 0 3 0 4 0 5 0 8 0 11] 
#[0 1 150 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 23 0 26 0 44 0 45 0 47] 
#[0 1 150 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 23 0 26 0 44 0 45 0 47] 
#[0 1 150 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 23 0 26 0 44 0 45 0 47] 
#[1 1 154 0 9 4 29 0 140] 
#[1 0 170 0 3 0 170 0 4 0 170 0 5 0 170 0 6 0 170 0 7 0 170 0 8 2 37 0 12 0 170 0 15 0 170 0 16 0 170 0 19 0 170 0 20 0 170 0 21 0 170 0 23 0 170 0 26 0 170 0 44 0 170 0 45 0 170 0 47 2 73 0 146] 
#[0 1 158 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[0 1 158 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[0 1 158 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[0 1 158 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 26 0 44 0 45 0 47] 
#[0 2 233 0 44 0 45 0 150] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 4 33 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 2 169 0 22 4 37 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 4 41 0 86] 
#[1 2 169 0 22 4 45 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[0 1 162 0 3 0 4 0 5 0 7 0 8 0 12 0 15 0 16 0 19 0 20 0 21 0 22 0 23 0 24 0 34 0 36 0 41 0 42 0 44 0 45 0 47] 
#[1 0 46 0 7 4 49 0 75 0 205 0 76] 
#[1 1 54 0 4 3 125 0 5 0 46 0 7 1 54 0 8 2 37 0 12 3 129 0 15 1 117 0 16 1 166 0 22 1 166 0 24 0 69 0 36 1 121 0 44 3 133 0 45 3 137 0 47 4 53 0 57 3 141 0 75 0 205 0 76 4 57 0 121 4 61 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 4 65 0 142 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 1 170 0 3 1 170 0 4 1 170 0 5 1 170 0 7 1 170 0 8 2 37 0 12 1 170 0 15 1 170 0 16 1 170 0 19 1 170 0 20 1 170 0 21 1 170 0 23 1 170 0 44 1 170 0 45 1 170 0 47 4 69 0 146] 
#[1 1 174 0 3 1 174 0 4 1 174 0 5 0 70 0 6 1 174 0 7 1 174 0 8 2 37 0 12 1 174 0 15 1 174 0 16 0 14 0 17 0 14 0 18 1 174 0 19 1 174 0 20 1 174 0 21 1 174 0 23 1 174 0 44 1 174 0 45 1 174 0 47 4 73 0 77 1 17 0 78 4 77 0 146] 
#[1 0 174 0 3 0 174 0 4 0 174 0 5 0 174 0 7 0 174 0 8 2 37 0 12 0 174 0 15 0 174 0 16 0 174 0 19 0 174 0 20 0 174 0 21 0 174 0 23 0 174 0 44 0 174 0 45 0 174 0 47 2 81 0 146] 
#[1 1 178 0 3 1 178 0 4 1 178 0 5 1 178 0 7 1 178 0 8 1 178 0 15 1 178 0 16 4 81 0 19 1 178 0 23 1 178 0 44 1 178 0 45 1 178 0 47] 
#[0 4 85 0 3] 
#[0 1 182 0 3] 
#[1 1 186 0 3 1 186 0 4 4 89 0 102] 
#[1 1 190 0 3 1 190 0 4 4 93 0 23] 
#[1 1 194 0 3 1 194 0 4 3 125 0 5 0 46 0 7 1 194 0 8 3 129 0 15 1 117 0 16 1 194 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 4 97 0 126 3 169 0 127 4 97 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 201 0 150] 
#[0 1 198 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 23 0 44 0 45 0 47] 
#[1 1 202 0 3 1 202 0 4 1 202 0 5 1 202 0 7 1 202 0 8 1 202 0 15 1 202 0 16 2 109 0 19 2 113 0 20 2 117 0 21 1 202 0 23 1 202 0 44 1 202 0 45 1 202 0 47 4 101 0 130] 
#[0 1 206 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 23 0 44 0 45 0 47] 
#[1 1 210 0 3 1 210 0 4 1 210 0 5 1 210 0 7 1 210 0 8 1 210 0 15 1 210 0 16 2 109 0 19 2 113 0 20 2 117 0 21 1 210 0 23 1 210 0 44 1 210 0 45 1 210 0 47 4 105 0 130] 
#[0 1 214 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[1 1 218 0 3 1 218 0 4 1 218 0 5 1 218 0 7 1 218 0 8 1 218 0 15 1 218 0 16 2 109 0 19 2 113 0 20 2 117 0 21 1 218 0 23 1 218 0 44 1 218 0 45 1 218 0 47 4 109 0 129 4 109 0 130] 
#[0 1 214 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[0 1 214 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[1 3 125 0 5 0 46 0 7 3 129 0 15 1 117 0 16 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 4 117 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 201 0 150] 
#[1 4 121 0 17 4 125 0 18] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 4 129 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 2 169 0 22 4 133 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 4 137 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 2 169 0 22 4 141 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 4 145 0 86] 
#[1 0 74 0 22 0 74 0 24 1 1 0 34 0 74 0 36 4 149 0 85 4 149 0 94] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 4 153 0 86] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 4 157 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 2 169 0 22 4 161 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 4 165 0 86] 
#[1 2 169 0 22 4 169 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 1 222 0 3 4 173 0 15 4 177 0 62] 
#[0 0 249 0 44] 
#[0 1 226 0 30 0 35 0 44 0 151] 
#[1 4 181 0 11 4 185 0 13 4 189 0 147] 
#[1 4 197 0 44 4 197 0 45 4 193 0 47 4 197 0 150] 
#[1 4 201 0 4 4 205 0 8 4 209 0 135] 
#[0 1 230 0 3 0 4 0 8] 
#[1 1 234 0 3 1 234 0 4 1 234 0 8 4 213 0 11 4 217 0 116] 
#[1 4 229 0 44 4 229 0 45 4 221 0 46 4 225 0 120 4 229 0 150] 
#[0 4 233 0 9] 
#[0 4 237 0 3] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 4 241 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 2 169 0 22 4 245 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 4 249 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 1 238 0 22 0 24 0 36] 
#[1 1 166 0 22 1 166 0 24 4 253 0 142] 
#[0 5 1 0 8] 
#[1 1 242 0 4 1 242 0 8 5 5 0 123] 
#[1 2 169 0 22 5 9 0 24 5 13 0 95] 
#[0 1 246 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[1 1 250 0 3 1 250 0 4 1 250 0 5 1 250 0 7 1 250 0 8 2 37 0 12 1 250 0 15 1 250 0 16 1 250 0 19 1 250 0 20 1 250 0 21 1 250 0 23 1 250 0 44 1 250 0 45 1 250 0 47 5 17 0 146] 
#[0 1 254 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[0 2 2 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 23 0 44 0 45 0 47] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 5 21 0 87 5 25 0 88 2 6 0 151] 
#[1 2 10 0 3 5 29 0 4 5 33 0 101] 
#[0 5 37 0 44 0 45 0 150] 
#[0 2 14 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 23 0 44 0 45 0 47] 
#[0 2 18 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 23 0 44 0 45 0 47] 
#[0 2 22 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 23 0 44 0 45 0 47] 
#[0 2 26 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 23 0 44 0 45 0 47] 
#[0 2 30 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 23 0 44 0 45 0 47] 
#[1 2 34 0 3 2 34 0 4 3 125 0 5 0 46 0 7 2 34 0 8 3 129 0 15 1 117 0 16 2 34 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 4 97 0 126 3 169 0 127 4 97 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 201 0 150] 
#[1 3 125 0 5 3 129 0 15 1 117 0 16 3 77 0 44 5 41 0 45 3 137 0 47 5 45 0 132 5 45 0 133 5 49 0 141 5 45 0 143 5 45 0 145] 
#[1 3 125 0 5 3 129 0 15 1 117 0 16 3 77 0 44 5 41 0 45 3 137 0 47 5 53 0 132 5 53 0 133 5 57 0 141 5 53 0 143 5 53 0 145] 
#[0 5 61 0 3] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 65 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 5 69 0 3] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 73 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 2 169 0 22 5 77 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 0 122 0 22 0 122 0 24 0 122 0 36 5 81 0 86] 
#[1 2 169 0 22 5 85 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[0 5 89 0 3] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 93 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 2 169 0 22 5 97 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 101 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 5 105 0 44 0 45 0 150] 
#[0 2 38 0 3 0 15] 
#[1 3 17 0 44 3 17 0 45 5 109 0 149 3 17 0 150] 
#[0 2 42 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 2 46 0 11 0 13] 
#[0 2 50 0 11 0 13] 
#[0 2 54 0 11 0 13] 
#[1 0 118 0 6 2 49 0 44 2 53 0 47 5 113 0 137 5 113 0 138 1 177 0 139 5 113 0 144] 
#[0 2 58 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[0 2 62 0 4 0 8] 
#[1 3 45 0 35 3 57 0 44 3 57 0 45 5 117 0 118 3 53 0 119 3 57 0 150] 
#[0 2 66 0 3 0 4 0 8 0 11] 
#[0 2 70 0 8] 
#[0 5 121 0 8] 
#[0 2 74 0 8] 
#[0 2 78 0 3 0 4 0 5 0 6 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 26 0 44 0 45 0 47] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 5 125 0 87 5 25 0 88 2 6 0 151] 
#[0 5 129 0 3] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 133 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 5 137 0 3] 
#[1 2 169 0 22 5 141 0 24 5 13 0 95] 
#[0 2 82 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[1 5 145 0 4 2 86 0 8 5 149 0 122] 
#[1 1 54 0 4 3 125 0 5 0 46 0 7 1 54 0 8 2 37 0 12 3 129 0 15 1 117 0 16 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 153 0 121 4 61 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 2 90 0 22 0 24] 
#[0 2 94 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[0 2 98 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 5 157 0 27 5 161 0 29 2 102 0 30 2 102 0 35 2 102 0 38 2 102 0 39 2 102 0 40 2 102 0 44 2 102 0 45 5 165 0 89 5 169 0 90 2 102 0 151] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 173 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 2 106 0 3 0 4] 
#[0 2 110 0 3 0 4] 
#[1 1 174 0 3 1 174 0 4 1 174 0 5 0 70 0 6 1 174 0 7 1 174 0 8 2 37 0 12 1 174 0 15 1 174 0 16 1 174 0 19 1 174 0 20 1 174 0 21 1 174 0 23 1 174 0 44 1 174 0 45 1 174 0 47 4 73 0 77 1 17 0 78 4 77 0 146] 
#[0 2 114 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[0 2 114 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[0 2 114 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[0 2 114 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 5 177 0 87 5 25 0 88 2 6 0 151] 
#[0 5 181 0 3] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 5 185 0 87 5 25 0 88 2 6 0 151] 
#[0 5 189 0 3] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 193 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 2 169 0 22 5 197 0 24 0 69 0 36 2 181 0 57 2 181 0 91 2 181 0 95] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 201 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 5 205 0 87 5 25 0 88 2 6 0 151] 
#[0 5 209 0 3] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 213 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 5 217 0 3] 
#[0 2 118 0 3 0 15] 
#[0 2 122 0 11 0 13] 
#[0 2 126 0 4 0 8] 
#[0 2 130 0 3 0 4 0 8 0 11] 
#[0 2 134 0 3 0 4 0 8 0 11] 
#[0 2 138 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 5 221 0 87 5 25 0 88 2 6 0 151] 
#[0 5 225 0 3] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 5 229 0 87 5 25 0 88 2 6 0 151] 
#[1 1 54 0 4 3 125 0 5 0 46 0 7 1 54 0 8 2 37 0 12 3 129 0 15 1 117 0 16 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 233 0 121 4 61 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[1 1 54 0 4 3 125 0 5 0 46 0 7 1 54 0 8 2 37 0 12 3 129 0 15 1 117 0 16 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 5 237 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 2 142 0 4 0 8] 
#[0 5 241 0 8] 
#[1 0 70 0 6 5 245 0 77 1 17 0 78] 
#[1 0 46 0 7 5 249 0 75 0 205 0 76] 
#[0 2 146 0 27 0 29 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 2 150 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 2 154 0 3 0 4] 
#[0 2 158 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 5 253 0 87 5 25 0 88 2 6 0 151] 
#[0 2 162 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 6 1 0 87 5 25 0 88 2 6 0 151] 
#[0 6 5 0 3] 
#[1 1 54 0 3 1 54 0 4 3 125 0 5 0 46 0 7 2 37 0 12 3 129 0 15 1 117 0 16 1 54 0 23 1 121 0 44 3 133 0 45 3 137 0 47 3 141 0 75 0 205 0 76 6 9 0 99 3 149 0 100 3 153 0 103 3 157 0 124 3 161 0 125 3 165 0 126 3 169 0 127 3 165 0 128 3 177 0 132 3 177 0 133 3 185 0 141 3 177 0 143 3 177 0 145 3 197 0 146 3 201 0 150] 
#[0 6 13 0 3] 
#[0 2 166 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 6 17 0 87 5 25 0 88 2 6 0 151] 
#[0 6 21 0 3] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 6 25 0 87 5 25 0 88 2 6 0 151] 
#[0 2 170 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 6 29 0 87 5 25 0 88 2 6 0 151] 
#[0 2 174 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 6 33 0 8] 
#[0 2 178 0 4 0 8] 
#[0 2 182 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[1 0 46 0 7 6 37 0 75 0 205 0 76] 
#[0 2 186 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 2 190 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 2 194 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 6 41 0 87 5 25 0 88 2 6 0 151] 
#[0 6 45 0 3] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 6 49 0 87 5 25 0 88 2 6 0 151] 
#[0 2 198 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 6 53 0 87 5 25 0 88 2 6 0 151] 
#[0 2 202 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 2 206 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 2 210 0 3 0 4 0 5 0 7 0 8 0 15 0 16 0 19 0 20 0 21 0 23 0 44 0 45 0 47] 
#[0 2 214 0 27 0 29 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 2 218 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[1 2 6 0 27 2 6 0 29 2 6 0 30 2 6 0 35 2 6 0 38 2 6 0 39 2 6 0 40 2 6 0 44 2 6 0 45 6 57 0 87 5 25 0 88 2 6 0 151] 
#[0 2 222 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 2 226 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151] 
#[0 2 230 0 30 0 35 0 38 0 39 0 40 0 44 0 45 0 151]
	).
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForSwitchToAction1: nodes [
	self scope: #action.
	^ nil
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForSwitchToArgAction1: nodes [
	self scope: #argAction.
	^ nil
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForSwitchToDefault1: nodes [
	self scope: #default.
	^ nil
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForSwitchToLexerCharSet1: nodes [
	self scope: #lexerCharSet.
	^ nil
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__bar___bar__alternative_1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	result at: 3 put: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__bar___bar__alternative__1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__bar___bar__alternative__2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self add: ((nodes at: 2) at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__bar___bar__labeledAlt_1: nodes [
	| result |
	result := Array new: 5.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	result at: 5 put: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__bar___bar__labeledAlt__1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__bar___bar__labeledAlt__2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 5).
	self add: ((nodes at: 2) at: 3) to: (result at: 4).
	self add: ((nodes at: 2) at: 4) to: (result at: 2).
	self add: ((nodes at: 2) at: 5) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__comma___comma__delegateGrammar__import___1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__comma___comma__delegateGrammar__import___2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__comma___comma__elementOption_1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__comma___comma__elementOption__1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFor__comma___comma__elementOption__2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self add: ((nodes at: 2) at: 3) to: (result at: 3).
	self add: ((nodes at: 2) at: 4) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForaction1: nodes [
	| result |
	result := Antlr4ActionNode new.
	result atToken: (nodes at: 1).
	result nameToken: (nodes at: 2).
	result actionBlock: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForaction2: nodes [
	| result |
	result := Antlr4ActionNode new.
	result atToken: (nodes at: 1).
	result scopeName: (nodes at: 2).
	result colonColon: (nodes at: 3).
	result nameToken: (nodes at: 4).
	result actionBlock: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForactionBlock1: nodes [
	| result |
	result := Antlr4ActionBlockNode new.
	result leftBrace: (nodes at: 2).
	result actionBlock: (nodes at: 3).
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForaltList1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForalternative1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForalternative2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForalternative3: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForargActionBlock1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 2).
	result at: 2 put: (nodes at: 3).
	result at: 3 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForatom4: nodes [
	| result |
	result := Antlr4AtomNode new.
	result dot: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForatom5: nodes [
	| result |
	result := Antlr4AtomNode new.
	result dot: (nodes at: 1).
	result options: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForblock1: nodes [
	| result |
	result := Antlr4BlockNode new.
	result leftParen: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result elements.
	result addNodes: ((nodes at: 2) at: 2) to: result optionses.
	result addTokens: ((nodes at: 2) at: 3) to: result bars.
	result rightParen: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForblock2: nodes [
	| result |
	result := Antlr4BlockNode new.
	result leftParen: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result actions.
	result colon: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result elements.
	result addNodes: ((nodes at: 4) at: 2) to: result optionses.
	result addTokens: ((nodes at: 4) at: 3) to: result bars.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForblock3: nodes [
	| result |
	result := Antlr4BlockNode new.
	result leftParen: (nodes at: 1).
	result addNode: (nodes at: 2) to: result optionses.
	result addNodes: (nodes at: 3) to: result actions.
	result colon: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result elements.
	result addNodes: ((nodes at: 5) at: 2) to: result optionses.
	result addTokens: ((nodes at: 5) at: 3) to: result bars.
	result rightParen: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForblockSet1: nodes [
	| result |
	result := Antlr4BlockSetNode new.
	result leftParen: (nodes at: 1).
	result addNode: (nodes at: 2) to: result expressions.
	result addTokens: ((nodes at: 3) at: 1) to: result bars.
	result addNodes: ((nodes at: 3) at: 2) to: result expressions.
	result rightParen: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForchannelsSpec1: nodes [
	| result |
	result := Antlr4ChannelsSpecNode new.
	result channelsToken: (nodes at: 1).
	result leftBrace: (nodes at: 2).
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForchannelsSpec2: nodes [
	| result |
	result := Antlr4ChannelsSpecNode new.
	result channelsToken: (nodes at: 1).
	result leftBrace: (nodes at: 2).
	result addTokens: ((nodes at: 3) at: 1) to: result nameTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForcharacterRange1: nodes [
	| result |
	result := Antlr4CharacterRangeNode new.
	result from: (nodes at: 1).
	result dotDot: (nodes at: 2).
	result to: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFordelegateGrammar1: nodes [
	| result |
	result := Antlr4DelegateGrammarNode new.
	result aliasNameToken: (nodes at: 1).
	result equal: (nodes at: 2).
	result nameToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFordelegateGrammar2: nodes [
	| result |
	result := Antlr4DelegateGrammarNode new.
	result nameToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFordelegateGrammars1: nodes [
	| result |
	result := Antlr4ImportNode new.
	result importToken: (nodes at: 1).
	result addNode: (nodes at: 2) to: result imports.
	result addTokens: ((nodes at: 3) at: 1) to: result commas.
	result addNodes: ((nodes at: 3) at: 2) to: result imports.
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForebnf1: nodes [
	| result |
	result := Antlr4EbnfNode new.
	result block: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForebnf2: nodes [
	| result |
	result := Antlr4EbnfNode new.
	result block: (nodes at: 1).
	result suffix: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForebnfSuffix1: nodes [
	| result |
	result := Antlr4EbnfSuffixNode new.
	result countToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForebnfSuffix2: nodes [
	| result |
	result := Antlr4EbnfSuffixNode new.
	result countToken: (nodes at: 1).
	result nonGreedyToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelement1: nodes [
	| result |
	result := Antlr4ElementNode new.
	result nameToken: ((nodes at: 1) at: 1).
	result equal: ((nodes at: 1) at: 2).
	result value: ((nodes at: 1) at: 3).
	result suffix: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelement2: nodes [
	| result |
	result := Antlr4ElementNode new.
	result nameToken: ((nodes at: 1) at: 1).
	result equal: ((nodes at: 1) at: 2).
	result value: ((nodes at: 1) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelement3: nodes [
	| result |
	result := Antlr4ElementNode new.
	result value: (nodes at: 1).
	result suffix: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelement4: nodes [
	| result |
	result := Antlr4ElementNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelement6: nodes [
	| result |
	result := Antlr4ElementNode new.
	result actionBlock: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelement7: nodes [
	| result |
	result := Antlr4ElementNode new.
	result actionBlock: (nodes at: 1).
	result questionMark: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelementOption1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelementOption2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelementOption3: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForelementOptions1: nodes [
	| result |
	result := Antlr4ElementOptionsNode new.
	result lt: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result nameTokens.
	result addToken: ((nodes at: 2) at: 2) to: result equals.
	result addToken: ((nodes at: 2) at: 3) to: result values.
	result addTokens: ((nodes at: 3) at: 1) to: result commas.
	result addTokens: ((nodes at: 3) at: 2) to: result nameTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result equals.
	result addTokens: ((nodes at: 3) at: 4) to: result values.
	result gt: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForexceptionGroup2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForexceptionHandler1: nodes [
	| result |
	result := Antlr4ExceptionHandlerNode new.
	result catchToken: (nodes at: 1).
	result leftBracket: ((nodes at: 2) at: 1).
	result argActionBlock: ((nodes at: 2) at: 2).
	result rightBracket: ((nodes at: 2) at: 3).
	result actionBlock: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForfinallyClause1: nodes [
	| result |
	result := Antlr4FinallyClauseNode new.
	result finallyToken: (nodes at: 1).
	result actionBlock: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForgrammarSpec1: nodes [
	| result |
	result := Antlr4GrammarSpecNode new.
	result grammarTypeToken: ((nodes at: 1) at: 1).
	result grammarToken: ((nodes at: 1) at: 2).
	result nameToken: (nodes at: 2).
	result semicolon: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result prequels.
	result addNodes: (nodes at: 5) to: result rules.
	result addNodes: (nodes at: 6) to: result modes.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForgrammarType1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForgrammarType3: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForidList1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForidList2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlabeledAlt1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlabeledAlt2: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: (nodes at: 2).
	result at: 4 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlabeledElement1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlabeledLexerElement2: nodes [
	| result |
	result := Antlr4LabeledLexerElementNode new.
	result nameToken: (nodes at: 1).
	result equal: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerAlt1: nodes [
	| result |
	result := Antlr4LexerAltNode new.
	result addNodes: (nodes at: 1) to: result lexerElements.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerAlt2: nodes [
	| result |
	result := Antlr4LexerAltNode new.
	result addNodes: (nodes at: 1) to: result lexerElements.
	result lexerCommand: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerAlt3: nodes [
	| result |
	result := Antlr4LexerAltNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerAtom5: nodes [
	| result |
	result := Antlr4LexerAtomNode new.
	result dot: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerAtom6: nodes [
	| result |
	result := Antlr4LexerAtomNode new.
	result dot: (nodes at: 1).
	result options: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerBlock1: nodes [
	| result |
	result := Antlr4LexerBlockNode new.
	result leftParen: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result lexerExpressions.
	result addTokens: ((nodes at: 2) at: 2) to: result bars.
	result rightParen: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerCharSet1: nodes [
	| result |
	result := Antlr4LexerCharSetNode new.
	result leftBracket: (nodes at: 2).
	result charSet: (nodes at: 3).
	result rightBracket: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerCommand1: nodes [
	| result |
	result := Antlr4LexerCommandNode new.
	result addToken: ((nodes at: 1) at: 1) to: result nameTokens.
	result modeToken: ((nodes at: 1) at: 2).
	result leftParen: (nodes at: 2).
	result addToken: ((nodes at: 3) at: 1) to: result nameTokens.
	result value: ((nodes at: 3) at: 2).
	result rightParen: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerCommand2: nodes [
	| result |
	result := Antlr4LexerCommandNode new.
	result addToken: ((nodes at: 1) at: 1) to: result nameTokens.
	result modeToken: ((nodes at: 1) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerCommandName1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerCommands1: nodes [
	| result |
	result := Antlr4LexerCommandsNode new.
	result arrow: (nodes at: 1).
	result addNode: (nodes at: 2) to: result commands.
	result addTokens: ((nodes at: 3) at: 1) to: result commas.
	result addNodes: ((nodes at: 3) at: 2) to: result commands.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerElement1: nodes [
	| result |
	result := Antlr4LexerElementNode new.
	result labeledLexerElement: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerElement2: nodes [
	| result |
	result := Antlr4LexerElementNode new.
	result labeledLexerElement: (nodes at: 1).
	result suffix: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerElement5: nodes [
	| result |
	result := Antlr4LexerElementNode new.
	result expression: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerElement6: nodes [
	| result |
	result := Antlr4LexerElementNode new.
	result expression: (nodes at: 1).
	result suffix: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerElement7: nodes [
	| result |
	result := Antlr4LexerElementNode new.
	result actionBlock: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerElement8: nodes [
	| result |
	result := Antlr4LexerElementNode new.
	result actionBlock: (nodes at: 1).
	result questionMark: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerRuleSpec1: nodes [
	| result |
	result := Antlr4LexerRuleSpecNode new.
	result nameToken: (nodes at: 1).
	result colon: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result lexerExpressions.
	result addTokens: ((nodes at: 3) at: 2) to: result bars.
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlexerRuleSpec2: nodes [
	| result |
	result := Antlr4LexerRuleSpecNode new.
	result modifier: (nodes at: 1).
	result nameToken: (nodes at: 2).
	result colon: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result lexerExpressions.
	result addTokens: ((nodes at: 4) at: 2) to: result bars.
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForlocalsSpec1: nodes [
	| result |
	result := Antlr4LocalsSpecNode new.
	result localsToken: (nodes at: 1).
	result leftBracket: ((nodes at: 2) at: 1).
	result argActionBlock: ((nodes at: 2) at: 2).
	result rightBracket: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFormodeSpec1: nodes [
	| result |
	result := Antlr4ModeSpecNode new.
	result modeToken: (nodes at: 1).
	result nameToken: (nodes at: 2).
	result semicolon: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result lexerRules.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFornotSet2: nodes [
	| result |
	result := Antlr4NotSetNode new.
	result tilde: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForoption1: nodes [
	| result |
	result := Antlr4OptionNode new.
	result nameToken: (nodes at: 1).
	result equal: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForoptionValue1: nodes [
	| result |
	result := Antlr4NamespaceNameNode new.
	result addToken: (nodes at: 1) to: result nameTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result dots.
	result addTokens: ((nodes at: 2) at: 2) to: result nameTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForoptionValue2: nodes [
	| result |
	result := Antlr4StringLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForoptionValue4: nodes [
	| result |
	result := Antlr4IntegerLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForoptionsSpec1: nodes [
	| result |
	result := Antlr4OptionsSpecNode new.
	result optionsToken: (nodes at: 1).
	result leftBrace: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result options.
	result addTokens: ((nodes at: 3) at: 2) to: result semicolons.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec10: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addTokens: (nodes at: 1) to: result modifiers.
	result addToken: (nodes at: 2) to: result nameTokens.
	result throws: (nodes at: 3).
	result locals: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result prequels.
	result colon: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result elements.
	result addNodes: ((nodes at: 7) at: 2) to: result optionses.
	result addTokens: ((nodes at: 7) at: 3) to: result pounds.
	result addTokens: ((nodes at: 7) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 7) at: 5) to: result bars.
	result semicolon: (nodes at: 8).
	result addNodes: ((nodes at: 9) at: 1) to: result handlers.
	result finally: ((nodes at: 9) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec11: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addTokens: (nodes at: 1) to: result modifiers.
	result addToken: (nodes at: 2) to: result nameTokens.
	result returnsToken: ((nodes at: 3) at: 1).
	result addToken: ((nodes at: 3) at: 2) to: result leftBrackets.
	result addToken: ((nodes at: 3) at: 3) to: result argActionBlocks.
	result addToken: ((nodes at: 3) at: 4) to: result rightBrackets.
	result locals: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result prequels.
	result colon: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result elements.
	result addNodes: ((nodes at: 7) at: 2) to: result optionses.
	result addTokens: ((nodes at: 7) at: 3) to: result pounds.
	result addTokens: ((nodes at: 7) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 7) at: 5) to: result bars.
	result semicolon: (nodes at: 8).
	result addNodes: ((nodes at: 9) at: 1) to: result handlers.
	result finally: ((nodes at: 9) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec12: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addTokens: (nodes at: 1) to: result modifiers.
	result addToken: (nodes at: 2) to: result nameTokens.
	result returnsToken: ((nodes at: 3) at: 1).
	result addToken: ((nodes at: 3) at: 2) to: result leftBrackets.
	result addToken: ((nodes at: 3) at: 3) to: result argActionBlocks.
	result addToken: ((nodes at: 3) at: 4) to: result rightBrackets.
	result throws: (nodes at: 4).
	result locals: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result prequels.
	result colon: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result elements.
	result addNodes: ((nodes at: 8) at: 2) to: result optionses.
	result addTokens: ((nodes at: 8) at: 3) to: result pounds.
	result addTokens: ((nodes at: 8) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 8) at: 5) to: result bars.
	result semicolon: (nodes at: 9).
	result addNodes: ((nodes at: 10) at: 1) to: result handlers.
	result finally: ((nodes at: 10) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec13: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addTokens: (nodes at: 1) to: result modifiers.
	result addToken: (nodes at: 2) to: result nameTokens.
	result addToken: ((nodes at: 3) at: 1) to: result leftBrackets.
	result addToken: ((nodes at: 3) at: 2) to: result argActionBlocks.
	result addToken: ((nodes at: 3) at: 3) to: result rightBrackets.
	result locals: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result prequels.
	result colon: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result elements.
	result addNodes: ((nodes at: 7) at: 2) to: result optionses.
	result addTokens: ((nodes at: 7) at: 3) to: result pounds.
	result addTokens: ((nodes at: 7) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 7) at: 5) to: result bars.
	result semicolon: (nodes at: 8).
	result addNodes: ((nodes at: 9) at: 1) to: result handlers.
	result finally: ((nodes at: 9) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec14: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addTokens: (nodes at: 1) to: result modifiers.
	result addToken: (nodes at: 2) to: result nameTokens.
	result addToken: ((nodes at: 3) at: 1) to: result leftBrackets.
	result addToken: ((nodes at: 3) at: 2) to: result argActionBlocks.
	result addToken: ((nodes at: 3) at: 3) to: result rightBrackets.
	result throws: (nodes at: 4).
	result locals: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result prequels.
	result colon: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result elements.
	result addNodes: ((nodes at: 8) at: 2) to: result optionses.
	result addTokens: ((nodes at: 8) at: 3) to: result pounds.
	result addTokens: ((nodes at: 8) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 8) at: 5) to: result bars.
	result semicolon: (nodes at: 9).
	result addNodes: ((nodes at: 10) at: 1) to: result handlers.
	result finally: ((nodes at: 10) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec15: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addTokens: (nodes at: 1) to: result modifiers.
	result addToken: (nodes at: 2) to: result nameTokens.
	result addToken: ((nodes at: 3) at: 1) to: result leftBrackets.
	result addToken: ((nodes at: 3) at: 2) to: result argActionBlocks.
	result addToken: ((nodes at: 3) at: 3) to: result rightBrackets.
	result returnsToken: ((nodes at: 4) at: 1).
	result addToken: ((nodes at: 4) at: 2) to: result leftBrackets.
	result addToken: ((nodes at: 4) at: 3) to: result argActionBlocks.
	result addToken: ((nodes at: 4) at: 4) to: result rightBrackets.
	result locals: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result prequels.
	result colon: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result elements.
	result addNodes: ((nodes at: 8) at: 2) to: result optionses.
	result addTokens: ((nodes at: 8) at: 3) to: result pounds.
	result addTokens: ((nodes at: 8) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 8) at: 5) to: result bars.
	result semicolon: (nodes at: 9).
	result addNodes: ((nodes at: 10) at: 1) to: result handlers.
	result finally: ((nodes at: 10) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec16: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addTokens: (nodes at: 1) to: result modifiers.
	result addToken: (nodes at: 2) to: result nameTokens.
	result addToken: ((nodes at: 3) at: 1) to: result leftBrackets.
	result addToken: ((nodes at: 3) at: 2) to: result argActionBlocks.
	result addToken: ((nodes at: 3) at: 3) to: result rightBrackets.
	result returnsToken: ((nodes at: 4) at: 1).
	result addToken: ((nodes at: 4) at: 2) to: result leftBrackets.
	result addToken: ((nodes at: 4) at: 3) to: result argActionBlocks.
	result addToken: ((nodes at: 4) at: 4) to: result rightBrackets.
	result throws: (nodes at: 5).
	result locals: (nodes at: 6).
	result addNodes: (nodes at: 7) to: result prequels.
	result colon: (nodes at: 8).
	result addNodes: ((nodes at: 9) at: 1) to: result elements.
	result addNodes: ((nodes at: 9) at: 2) to: result optionses.
	result addTokens: ((nodes at: 9) at: 3) to: result pounds.
	result addTokens: ((nodes at: 9) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 9) at: 5) to: result bars.
	result semicolon: (nodes at: 10).
	result addNodes: ((nodes at: 11) at: 1) to: result handlers.
	result finally: ((nodes at: 11) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec1: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addToken: (nodes at: 1) to: result nameTokens.
	result locals: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result prequels.
	result colon: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result elements.
	result addNodes: ((nodes at: 5) at: 2) to: result optionses.
	result addTokens: ((nodes at: 5) at: 3) to: result pounds.
	result addTokens: ((nodes at: 5) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 5) at: 5) to: result bars.
	result semicolon: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result handlers.
	result finally: ((nodes at: 7) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec2: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addToken: (nodes at: 1) to: result nameTokens.
	result throws: (nodes at: 2).
	result locals: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result prequels.
	result colon: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result elements.
	result addNodes: ((nodes at: 6) at: 2) to: result optionses.
	result addTokens: ((nodes at: 6) at: 3) to: result pounds.
	result addTokens: ((nodes at: 6) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 6) at: 5) to: result bars.
	result semicolon: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result handlers.
	result finally: ((nodes at: 8) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec3: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addToken: (nodes at: 1) to: result nameTokens.
	result returnsToken: ((nodes at: 2) at: 1).
	result addToken: ((nodes at: 2) at: 2) to: result leftBrackets.
	result addToken: ((nodes at: 2) at: 3) to: result argActionBlocks.
	result addToken: ((nodes at: 2) at: 4) to: result rightBrackets.
	result locals: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result prequels.
	result colon: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result elements.
	result addNodes: ((nodes at: 6) at: 2) to: result optionses.
	result addTokens: ((nodes at: 6) at: 3) to: result pounds.
	result addTokens: ((nodes at: 6) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 6) at: 5) to: result bars.
	result semicolon: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result handlers.
	result finally: ((nodes at: 8) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec4: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addToken: (nodes at: 1) to: result nameTokens.
	result returnsToken: ((nodes at: 2) at: 1).
	result addToken: ((nodes at: 2) at: 2) to: result leftBrackets.
	result addToken: ((nodes at: 2) at: 3) to: result argActionBlocks.
	result addToken: ((nodes at: 2) at: 4) to: result rightBrackets.
	result throws: (nodes at: 3).
	result locals: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result prequels.
	result colon: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result elements.
	result addNodes: ((nodes at: 7) at: 2) to: result optionses.
	result addTokens: ((nodes at: 7) at: 3) to: result pounds.
	result addTokens: ((nodes at: 7) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 7) at: 5) to: result bars.
	result semicolon: (nodes at: 8).
	result addNodes: ((nodes at: 9) at: 1) to: result handlers.
	result finally: ((nodes at: 9) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec5: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addToken: (nodes at: 1) to: result nameTokens.
	result addToken: ((nodes at: 2) at: 1) to: result leftBrackets.
	result addToken: ((nodes at: 2) at: 2) to: result argActionBlocks.
	result addToken: ((nodes at: 2) at: 3) to: result rightBrackets.
	result locals: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result prequels.
	result colon: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result elements.
	result addNodes: ((nodes at: 6) at: 2) to: result optionses.
	result addTokens: ((nodes at: 6) at: 3) to: result pounds.
	result addTokens: ((nodes at: 6) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 6) at: 5) to: result bars.
	result semicolon: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result handlers.
	result finally: ((nodes at: 8) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec6: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addToken: (nodes at: 1) to: result nameTokens.
	result addToken: ((nodes at: 2) at: 1) to: result leftBrackets.
	result addToken: ((nodes at: 2) at: 2) to: result argActionBlocks.
	result addToken: ((nodes at: 2) at: 3) to: result rightBrackets.
	result throws: (nodes at: 3).
	result locals: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result prequels.
	result colon: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result elements.
	result addNodes: ((nodes at: 7) at: 2) to: result optionses.
	result addTokens: ((nodes at: 7) at: 3) to: result pounds.
	result addTokens: ((nodes at: 7) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 7) at: 5) to: result bars.
	result semicolon: (nodes at: 8).
	result addNodes: ((nodes at: 9) at: 1) to: result handlers.
	result finally: ((nodes at: 9) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec7: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addToken: (nodes at: 1) to: result nameTokens.
	result addToken: ((nodes at: 2) at: 1) to: result leftBrackets.
	result addToken: ((nodes at: 2) at: 2) to: result argActionBlocks.
	result addToken: ((nodes at: 2) at: 3) to: result rightBrackets.
	result returnsToken: ((nodes at: 3) at: 1).
	result addToken: ((nodes at: 3) at: 2) to: result leftBrackets.
	result addToken: ((nodes at: 3) at: 3) to: result argActionBlocks.
	result addToken: ((nodes at: 3) at: 4) to: result rightBrackets.
	result locals: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result prequels.
	result colon: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result elements.
	result addNodes: ((nodes at: 7) at: 2) to: result optionses.
	result addTokens: ((nodes at: 7) at: 3) to: result pounds.
	result addTokens: ((nodes at: 7) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 7) at: 5) to: result bars.
	result semicolon: (nodes at: 8).
	result addNodes: ((nodes at: 9) at: 1) to: result handlers.
	result finally: ((nodes at: 9) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec8: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addToken: (nodes at: 1) to: result nameTokens.
	result addToken: ((nodes at: 2) at: 1) to: result leftBrackets.
	result addToken: ((nodes at: 2) at: 2) to: result argActionBlocks.
	result addToken: ((nodes at: 2) at: 3) to: result rightBrackets.
	result returnsToken: ((nodes at: 3) at: 1).
	result addToken: ((nodes at: 3) at: 2) to: result leftBrackets.
	result addToken: ((nodes at: 3) at: 3) to: result argActionBlocks.
	result addToken: ((nodes at: 3) at: 4) to: result rightBrackets.
	result throws: (nodes at: 4).
	result locals: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result prequels.
	result colon: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result elements.
	result addNodes: ((nodes at: 8) at: 2) to: result optionses.
	result addTokens: ((nodes at: 8) at: 3) to: result pounds.
	result addTokens: ((nodes at: 8) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 8) at: 5) to: result bars.
	result semicolon: (nodes at: 9).
	result addNodes: ((nodes at: 10) at: 1) to: result handlers.
	result finally: ((nodes at: 10) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForparserRuleSpec9: nodes [
	| result |
	result := Antlr4ParserRuleSpecNode new.
	result addTokens: (nodes at: 1) to: result modifiers.
	result addToken: (nodes at: 2) to: result nameTokens.
	result locals: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result prequels.
	result colon: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result elements.
	result addNodes: ((nodes at: 6) at: 2) to: result optionses.
	result addTokens: ((nodes at: 6) at: 3) to: result pounds.
	result addTokens: ((nodes at: 6) at: 4) to: result nameTokens.
	result addTokens: ((nodes at: 6) at: 5) to: result bars.
	result semicolon: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result handlers.
	result finally: ((nodes at: 8) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForprequelConstruct__prequel__1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForprequelConstruct__prequel__2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForruleAction1: nodes [
	| result |
	result := Antlr4RuleActionNode new.
	result atToken: (nodes at: 1).
	result nameToken: (nodes at: 2).
	result actionBlock: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForruleAltList1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForruleModifier__1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForruleReturns1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForruleref1: nodes [
	| result |
	result := Antlr4RulerefNode new.
	result nameToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForruleref2: nodes [
	| result |
	result := Antlr4RulerefNode new.
	result nameToken: (nodes at: 1).
	result options: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForruleref3: nodes [
	| result |
	result := Antlr4RulerefNode new.
	result nameToken: (nodes at: 1).
	result leftBracket: ((nodes at: 2) at: 1).
	result argActionBlock: ((nodes at: 2) at: 2).
	result rightBracket: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForruleref4: nodes [
	| result |
	result := Antlr4RulerefNode new.
	result nameToken: (nodes at: 1).
	result leftBracket: ((nodes at: 2) at: 1).
	result argActionBlock: ((nodes at: 2) at: 2).
	result rightBracket: ((nodes at: 2) at: 3).
	result options: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForrules1: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForsetElement1: nodes [
	| result |
	result := Antlr4SetElementNode new.
	result nameToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForsetElement2: nodes [
	| result |
	result := Antlr4SetElementNode new.
	result nameToken: (nodes at: 1).
	result options: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForsetElement3: nodes [
	| result |
	result := Antlr4SetElementNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForsetElement4: nodes [
	| result |
	result := Antlr4SetElementNode new.
	result value: (nodes at: 1).
	result options: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForterminal1: nodes [
	| result |
	result := Antlr4ReferenceTerminalNode new.
	result nameToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForterminal2: nodes [
	| result |
	result := Antlr4ReferenceTerminalNode new.
	result nameToken: (nodes at: 1).
	result options: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForterminal3: nodes [
	| result |
	result := Antlr4StringTerminalNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForterminal4: nodes [
	| result |
	result := Antlr4StringTerminalNode new.
	result value: (nodes at: 1).
	result options: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionForthrowsSpec1: nodes [
	| result |
	result := Antlr4ThrowsSpecNode new.
	result throwsToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result nameTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result commas.
	result addTokens: ((nodes at: 3) at: 2) to: result nameTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFortokensSpec1: nodes [
	| result |
	result := Antlr4TokensSpecNode new.
	result tokensToken: (nodes at: 1).
	result leftBrace: (nodes at: 2).
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
Antlr4Parser >> reduceActionFortokensSpec2: nodes [
	| result |
	result := Antlr4TokensSpecNode new.
	result tokensToken: (nodes at: 1).
	result leftBrace: (nodes at: 2).
	result addTokens: ((nodes at: 3) at: 1) to: result nameTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]
