Class {
	#name : #SmaCCDefinitionParser,
	#superclass : #SmaCCGLRParser,
	#instVars : [
		'acceptSyntaxErrors'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #'generated-accessing' }
SmaCCDefinitionParser class >> cacheId [
	^'2019-04-17T19:47:03.912455-05:00'
]

{ #category : #generated }
SmaCCDefinitionParser class >> definitionComment [
"%scopes default scanner directives parser;

directives <scopes>
	: scopes
	| states 
	;
directives <excludes> 
	: excludes 
	;
directives <root> 
	: root 
	;
directives <hierarchy> 
	: hierarchy 
	;
directives <attributes>
	: attributes
	;
directives <prefix> 
	: prefix 
	;
directives <suffix> 
	: suffix 
	;
directives <left> 
	: left 
	;
directives <right> 
	: right 
	;
directives <nonassoc> 
	: nonassoc 
	;
directives <id> 
	: id 
	;
directives <start> 
	: start 
	;
directives <glr>
	: glr
	;
directives <ignorecase>
	: ignorecase
	;
directives <ignorevariables>
	: ignore_variables
	;
directives <annotate_tokens>
	: annotate_tokens
	;
directives <lr1>
	: lr1
	;
directives <unicode>
	: unicode
	;
directives <byte>
	: byte
	;
<name> 
	: (<isLetter> | _) (<isLetter> | _ | <isDigit>)*
	;
<directive> 
	: \%
	;
<whitespace>
	: \s+ 
	;
<tokenname>
	: \< <name> \>
	;
default directives parser <symbolname>
	: <name>
	;
directives parser <keyword>
	: (\"" [^\""]* \"") + 
	;
<comment>
	: (\# [^\r\n]*) 
	| (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
parser <code>
	: \{ 
	;
parser <immediateCode>
	: \[
	;
parser <variablename>
	: \' <name> \' 
	;
<production>
	: \: (\: \=)? 
	;
<directive>
	: % 
	;
<semicolon>
	: \; 
	;
scanner <backslashcharacter>
	: \\ [^cx] 
	| \\ c [A-Z] 
	| \\ x [0-9A-Fa-f]{1,4}
	;
scanner <characterblock>
	: \[ ([^\]\\] | <backslashcharacter> )+ \] 
	;
scanner <repeat>
	: \{ [0-9]* \, [0-9]* \}
	;
scanner <character>
	: [^\ \t\v\\\r\n\{\(\[\.]
	; 
scanner <anycharacter>
	: \.
	;
parser <error>
	: error
	;
parser <classLeft> 
	: \{\{ 
	;
parser <classRight> 
	: \}\} 
	;
default parser <patternToken>
	: ` [^`]* `
	;

%glr;
%id <code> <immediateCode> <keyword> <symbolname> <tokenname> <variablename> <semicolon>
	<directive> <production> <classLeft> <classRight>;
%left	""|"";
%left ""("" <character> <backslashcharacter> <characterblock> <anycharacter> <tokenname> <symbolname> <directive>;
%left ""*"" ""+"" ""?"" <repeat> ;

%start ProductionRule RegexRule DirectiveLine File;

%hierarchy Directive (
		ScopeDirective
		NodeNameDirective 
		SuperclassDirective
		AttributeDirective
		AssociativeDirective
		IdDirective
		StartDirective
		FlagDirective
		IgnoreVariableDirective
	);
%hierarchy Symbol (
		KeywordSymbol
		TokenSymbol
		ProductionSymbol
		ErrorSymbol
	);
%hierarchy ProductionExpression (
		CodeProductionExpression
		ClassProductionExpression
	);
%hierarchy Regex (
		CharacterRegex
		CharacterBlockRegex
		AlternationRegex
		ConcatenationRegex
		TokenRegex
		RepeatRegex
	);
%prefix SmaCC;
%suffix Node;
%root Definition;

File
	: Rules {{GrammarDefinition}}
	;
Rules
	: Rule 'rule'
	| Rules Rule 'rule'
	;
Rule 
	: ProductionRule 
	| DirectiveLine
	| RegexRule 
	| Error
	;
Error
	: error 'smaccError' <semicolon> 'semicolon' {{DefinitionError}}
	| error 'smaccError' {{DefinitionError}}
	;
# Directives
DirectiveLine 
	: StartDirective <directive> 'directiveStartToken' Directive EndDirective <semicolon> 'semicolon' {{Directive}}
	;
Directive 
	: ExcludeScopesLine 
	| ScopesLine
	| RootClassLine
	| SuperclassLine
	| AttributesLine
	| PrefixLine
	| SuffixLine
	| LeftLine 
	| RightLine 
	| NonAssociativeLine
	| IdMethodLine
	| StartLine 
	| GLR
	| IgnoreCase
	| IgnoredVariables
	| AnnotateTokens
	| LR1
	| Unicode
	| Byte
	;
StartDirective 
	: {self scope: #directives. nil}
	;
EndDirective 
	: {self scope: #default. nil}
	;
ScopesLine 
	: <scopes> 'typeToken' Scopes {{ScopeDirective}}
	;
Scopes 
	: 
	| Scopes Symbol 'name'
	;
ExcludeScopesLine 
	: <excludes> 'typeToken' Scopes {{ScopeDirective}}
	;
RootClassLine 
	: <root> 'typeToken' <symbolname> 'name' {{NodeNameDirective}}
	;
SuperclassLine
	: <hierarchy> 'hierarchyToken' <symbolname> 'superclass' ""("" 'leftParen' ClassList "")"" 'rightParen' {{SuperclassDirective}}
	;
AttributesLine
	: <attributes> 'attributesToken' <symbolname> 'classname' ""("" 'leftParen' IvarList "")"" 'rightParen' {{AttributeDirective}}
	;
IvarList	
	:
	| IvarList <symbolname> 'name'
	;
ClassList 
	:
	| ClassList <symbolname> 'name'
	;
PrefixLine
	: <prefix> 'typeToken' <symbolname> 'name' {{NodeNameDirective}}
	;
SuffixLine
	: <suffix> 'typeToken' <symbolname> 'name' {{NodeNameDirective}}
	;
LeftLine
	: <left> 'typeToken' TokenList {{AssociativeDirective}}
	;
RightLine
	: <right> 'typeToken' TokenList {{AssociativeDirective}}
	;
NonAssociativeLine
	: <nonassoc> 'typeToken' TokenList {{AssociativeDirective}}
	;
TokenList
	: Term 'symbol'
	| TokenList Term 'symbol'
	;
IdMethodLine
	: <id> 'idToken' IdTokens {{IdDirective}}
	;
IdTokens
	: <tokenname> 'name'
	| IdTokens <tokenname> 'name'
	;
StartLine
	: <start> 'startToken' StartingTokens {{StartDirective}}
	;
StartingTokens
	: <symbolname> 'symbol'
	| StartingTokens <symbolname> 'symbol' 
	;
GLR
	: <glr> 'typeToken' {{FlagDirective}}
	;
IgnoredVariables
	: EndDirective <ignorevariables> 'ignoreVariablesToken' IgnoredVariableList {{IgnoreVariableDirective}}
	;
IgnoredVariableList
	: <symbolname> 'name'
	| IgnoredVariableList <symbolname> 'name'
	;
IgnoreCase
	: <ignorecase> 'typeToken' {{FlagDirective}}
	;
AnnotateTokens
	: <annotate_tokens> 'typeToken' {{FlagDirective}}
	;
LR1
	: <lr1> 'typeToken' {{FlagDirective}}
	;
Unicode
	: <unicode> 'typeToken' {{FlagDirective}}
	;
Byte
	: <byte> 'typeToken' {{FlagDirective}}
	;
# Scanner
RegexRule 
	: StartRegex <tokenname> 'name' <production> 'colon' Regex 'regex' EndRegex <semicolon> 'semicolon' {{TokenRule}}
	| Symbol 'state' RegexRule {{TokenRule}}
	;
StartRegex
	: {self scope: #scanner. nil}
	;
EndRegex
	: {self scope: #default. nil}
	;
Symbol 
	: <symbolname> 
	;
Regex
	: ConcatenationRegex
	| ConcatenationRegex 'item'  (""|"" 'barToken' ConcatenationRegex 'item')+ {{AlternationRegex}}
	;
ConcatenationRegex
	: RegexTerm
	| RegexTerm 'item' RegexTerm 'item' + {{ConcatenationRegex}}
	;
RegexTerm
	: <character> 'char' {{CharacterRegex}}
	| <directive> 'char' {{CharacterRegex}}
	| <anycharacter> 'char' {{CharacterRegex}}
	| <backslashcharacter> 'char' {{CharacterRegex}}
	| ""("" 'leftParen' Regex "")"" 'rightParen' {{Regex}}
	| <characterblock> 'block' {{CharacterBlockRegex}}
	| <tokenname> 'name' {{TokenRegex}}
	| RegexTerm 'regex' ""*"" 'count' {{RepeatRegex}}	
	| RegexTerm 'regex' ""+"" 'count' {{RepeatRegex}}
	| RegexTerm 'regex' ""?"" 'count' {{RepeatRegex}}
	| RegexTerm 'regex' <repeat> 'count' {{RepeatRegex}}
	;
# Parser 
ProductionRule
	: <symbolname> 'name' StartProduction <production> 'colon' ParserRules EndProduction <semicolon> 'semicolon' {{ProductionRule}}
	;
StartProduction
	: {self scope: #parser. nil}
	;
EndProduction
	: {self scope: #default. nil}
	;
ParserRules
	: ParserRules ""|"" 'barToken' ParserRule 'expression'
	| ParserRule 'expression'
	;
ParserRule 
	: Terms {{ProductionExpression}}
	| Terms <code> 'code' {{CodeProductionExpression}}
	| Terms <immediateCode> 'code' {{CodeProductionExpression}}
	| Terms <classLeft> 'left' <symbolname> 'classname' <classRight> 'right' {{ClassProductionExpression}}
	| Terms <classLeft> 'left' <classRight> 'right' {{ClassProductionExpression}}
	;
Terms 
	:
	| Terms SpecialTerm 'term'
	;
SpecialTerm
	: NamedTerm
	| SpecialTerm 'term' ""?"" 'operator' {{PostfixTerm}}
	| SpecialTerm 'term' ""+"" 'operator' {{PostfixTerm}}
	| SpecialTerm 'term' ""*"" 'operator' {{PostfixTerm}}
	| ""("" 'leftParen' ParserRules "")"" 'rightParen' {{GroupTerm}}
	;
NamedTerm
	: Term
	| Term <variablename> 'variableNameToken' {{Symbol}}
	;
Term
	: <keyword> 'name' {{KeywordSymbol}}
	| <tokenname> 'name' {{TokenSymbol}}
	| <symbolname> 'name' {{ProductionSymbol}}
	| <error> 'name' {{ErrorSymbol}}
	;"
]

{ #category : #generated }
SmaCCDefinitionParser class >> reduceTable [
^#(
	#(82 0 #reduceActionForStartRegex1: 5588993 false ) 
	#(53 0 #reduceActionForStartDirective1: 3355649 false ) 
	#(84 1 #liftFirstValue: 5679105 false ) 
	#(92 0 #reduceActionForStartProduction1: 6641665 false ) 
	#(47 1 #reduceActionForFile1: 2630657 false ) 
	#(48 1 #reduceActionForRules1: 2670593 false ) 
	#(49 1 #liftFirstValue: 2716676 false ) 
	#(49 1 #liftFirstValue: 2716674 false ) 
	#(49 1 #liftFirstValue: 2716675 false ) 
	#(49 1 #liftFirstValue: 2716673 false ) 
	#(50 1 #reduceActionForError2: 2786306 false ) 
	#(48 2 #reduceActionForRules2: 2670594 false ) 
	#(54 0 #reduceActionForEndDirective1: 3409921 false ) 
	#(81 2 #reduceActionForRegexRule2: 5413890 false ) 
	#(50 2 #reduceActionForError1: 2786305 false ) 
	#(96 0 #reduceActionForTerms1: 7192577 false ) 
	#(56 0 #reduceActionForTerms1: 3525633 false ) 
	#(73 1 #reduceActionForGLR1: 4853761 false ) 
	#(76 1 #reduceActionForGLR1: 5120001 false ) 
	#(77 1 #reduceActionForGLR1: 5181441 false ) 
	#(78 1 #reduceActionForGLR1: 5252097 false ) 
	#(79 1 #reduceActionForGLR1: 5299201 false ) 
	#(80 1 #reduceActionForGLR1: 5354497 false ) 
	#(52 1 #liftFirstValue: 3053570 false ) 
	#(52 1 #liftFirstValue: 3053569 false ) 
	#(52 1 #liftFirstValue: 3053571 false ) 
	#(52 1 #liftFirstValue: 3053572 false ) 
	#(52 1 #liftFirstValue: 3053573 false ) 
	#(52 1 #liftFirstValue: 3053574 false ) 
	#(52 1 #liftFirstValue: 3053575 false ) 
	#(52 1 #liftFirstValue: 3053576 false ) 
	#(52 1 #liftFirstValue: 3053577 false ) 
	#(52 1 #liftFirstValue: 3053578 false ) 
	#(52 1 #liftFirstValue: 3053579 false ) 
	#(52 1 #liftFirstValue: 3053580 false ) 
	#(52 1 #liftFirstValue: 3053581 false ) 
	#(52 1 #liftFirstValue: 3053583 false ) 
	#(52 1 #liftFirstValue: 3053582 false ) 
	#(52 1 #liftFirstValue: 3053584 false ) 
	#(52 1 #liftFirstValue: 3053585 false ) 
	#(52 1 #liftFirstValue: 3053586 false ) 
	#(52 1 #liftFirstValue: 3053587 false ) 
	#(93 0 #reduceActionForEndDirective1: 6691841 false ) 
	#(94 1 #reduceActionForParserRules2: 6740994 false ) 
	#(95 1 #reduceActionForParserRule1: 6839297 false ) 
	#(55 2 #reduceActionForScopesLine1: 3459073 false ) 
	#(57 2 #reduceActionForScopesLine1: 3565569 false ) 
	#(58 2 #reduceActionForRootClassLine1: 3641345 false ) 
	#(63 2 #reduceActionForRootClassLine1: 4117505 false ) 
	#(64 2 #reduceActionForRootClassLine1: 4199425 false ) 
	#(99 1 #reduceActionForTerm2: 7566338 false ) 
	#(99 1 #reduceActionForTerm3: 7566339 false ) 
	#(99 1 #reduceActionForTerm1: 7566337 false ) 
	#(99 1 #reduceActionForTerm4: 7566340 false ) 
	#(65 2 #reduceActionForLeftLine1: 4281345 false ) 
	#(68 1 #reduceActionForRules1: 4509697 false ) 
	#(66 2 #reduceActionForLeftLine1: 4352001 false ) 
	#(67 2 #reduceActionForLeftLine1: 4424705 false ) 
	#(70 1 #reduceActionForRules1: 4628481 false ) 
	#(69 2 #reduceActionForIdMethodLine1: 4568065 false ) 
	#(72 1 #reduceActionForRules1: 4767745 false ) 
	#(71 2 #reduceActionForStartLine1: 4695041 false ) 
	#(90 1 #reduceActionForRegexTerm7: 5936135 false ) 
	#(90 1 #reduceActionForRegexTerm2: 5936130 false ) 
	#(90 1 #reduceActionForRegexTerm2: 5936132 false ) 
	#(90 1 #reduceActionForRegexTerm6: 5936134 false ) 
	#(90 1 #reduceActionForRegexTerm2: 5936129 false ) 
	#(90 1 #reduceActionForRegexTerm2: 5936131 false ) 
	#(83 0 #reduceActionForEndDirective1: 5635073 false ) 
	#(85 1 #liftFirstValue: 5707777 false ) 
	#(88 1 #liftFirstValue: 5836801 false ) 
	#(95 2 #reduceActionForParserRule2: 6839298 false ) 
	#(95 2 #reduceActionForParserRule2: 6839299 false ) 
	#(96 2 #reduceActionForRules2: 7192578 false ) 
	#(97 1 #liftFirstValue: 7234561 false ) 
	#(98 1 #liftFirstValue: 7489537 false ) 
	#(56 2 #reduceActionForRules2: 3525634 false ) 
	#(62 0 #reduceActionForTerms1: 4066305 false ) 
	#(61 0 #reduceActionForTerms1: 4017153 false ) 
	#(68 2 #reduceActionForRules2: 4509698 false ) 
	#(70 2 #reduceActionForRules2: 4628482 false ) 
	#(72 2 #reduceActionForRules2: 4767746 false ) 
	#(51 5 #reduceActionForDirectiveLine1: 2919425 false ) 
	#(75 1 #reduceActionForRules1: 5028865 false ) 
	#(74 3 #reduceActionForIgnoredVariables1: 4900865 false ) 
	#(87 1 #reduceActionFor______barToken__ConcatenationRegex__item___1: 5767169 false ) 
	#(85 2 #reduceActionForRegex2: 5707778 false ) 
	#(90 2 #reduceActionForRegexTerm8: 5936136 false ) 
	#(90 2 #reduceActionForRegexTerm8: 5936137 false ) 
	#(90 2 #reduceActionForRegexTerm8: 5936138 false ) 
	#(90 2 #reduceActionForRegexTerm8: 5936139 false ) 
	#(88 2 #reduceActionForConcatenationRegex2: 5836802 false ) 
	#(89 1 #reduceActionForRules1: 5890049 false ) 
	#(94 3 #reduceActionForParserRules1: 6740993 false ) 
	#(91 6 #reduceActionForProductionRule1: 6491137 false ) 
	#(95 3 #reduceActionForParserRule5: 6839301 false ) 
	#(97 2 #reduceActionForSpecialTerm4: 7234564 false ) 
	#(97 2 #reduceActionForSpecialTerm4: 7234563 false ) 
	#(97 2 #reduceActionForSpecialTerm4: 7234562 false ) 
	#(98 2 #reduceActionForNamedTerm2: 7489538 false ) 
	#(75 2 #reduceActionForRules2: 5028866 false ) 
	#(90 3 #reduceActionForRegexTerm5: 5936133 false ) 
	#(81 6 #reduceActionForRegexRule1: 5413889 false ) 
	#(86 2 #reduceActionFor______barToken__ConcatenationRegex__item__1: 5767169 false ) 
	#(87 2 #reduceActionFor______barToken__ConcatenationRegex__item___2: 5767170 false ) 
	#(89 2 #reduceActionForRules2: 5890050 false ) 
	#(97 3 #reduceActionForSpecialTerm5: 7234565 false ) 
	#(95 4 #reduceActionForParserRule4: 6839300 false ) 
	#(59 5 #reduceActionForSuperclassLine1: 3725313 false ) 
	#(62 2 #reduceActionForRules2: 4066306 false ) 
	#(60 5 #reduceActionForAttributesLine1: 3871745 false ) 
	#(61 2 #reduceActionForRules2: 4017154 false )
	).
]

{ #category : #'generated-accessing' }
SmaCCDefinitionParser class >> scannerClass [
	^SmaCCDefinitionScanner
]

{ #category : #generated }
SmaCCDefinitionParser class >> startingStateForDirectiveLine [
	^ 4
]

{ #category : #generated }
SmaCCDefinitionParser class >> startingStateForFile [
	^ 1
]

{ #category : #generated }
SmaCCDefinitionParser class >> startingStateForProductionRule [
	^ 2
]

{ #category : #generated }
SmaCCDefinitionParser class >> startingStateForRegexRule [
	^ 3
]

{ #category : #generated }
SmaCCDefinitionParser class >> symbolNames [
	^ #('"("' '")"' '"*"' '"+"' '"?"' '"|"' '<scopes>' '<excludes>' '<root>' '<hierarchy>' '<attributes>' '<prefix>' '<suffix>' '<left>' '<right>' '<nonassoc>' '<id>' '<start>' '<glr>' '<ignorecase>' '<ignorevariables>' '<annotate_tokens>' '<lr1>' '<unicode>' '<byte>' '<whitespace>' '<tokenname>' '<symbolname>' '<keyword>' '<comment>' '<code>' '<immediateCode>' '<variablename>' '<production>' '<directive>' '<semicolon>' '<backslashcharacter>' '<characterblock>' '<repeat>' '<character>' '<anycharacter>' '<error>' '<classLeft>' '<classRight>' '<patternToken>' 'B e g i n' 'File' 'Rules' 'Rule' 'Error' 'DirectiveLine' 'Directive' 'StartDirective' 'EndDirective' 'ScopesLine' 'Scopes' 'ExcludeScopesLine' 'RootClassLine' 'SuperclassLine' 'AttributesLine' 'IvarList' 'ClassList' 'PrefixLine' 'SuffixLine' 'LeftLine' 'RightLine' 'NonAssociativeLine' 'TokenList' 'IdMethodLine' 'IdTokens' 'StartLine' 'StartingTokens' 'GLR' 'IgnoredVariables' 'IgnoredVariableList' 'IgnoreCase' 'AnnotateTokens' 'LR1' 'Unicode' 'Byte' 'RegexRule' 'StartRegex' 'EndRegex' 'Symbol' 'Regex' '("|" ''barToken'' ConcatenationRegex ''item'')' '("|" ''barToken'' ConcatenationRegex ''item'')+' 'ConcatenationRegex' 'RegexTerm ''item'' +' 'RegexTerm' 'ProductionRule' 'StartProduction' 'EndProduction' 'ParserRules' 'ParserRule' 'Terms' 'SpecialTerm' 'NamedTerm' 'Term' 'E O F' 'error')
]

{ #category : #generated }
SmaCCDefinitionParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCGrammarDefinitionNode #SmaCCGrammarDefinitionNode #OrderedCollection #SmaCCDefinitionNode #SmaCCDefinitionErrorNode #SmaCCDirectiveNode #SmaCCDirectiveNode nil nil #SmaCCScopeDirectiveNode #OrderedCollection #SmaCCScopeDirectiveNode #SmaCCNodeNameDirectiveNode #SmaCCSuperclassDirectiveNode #SmaCCAttributeDirectiveNode #OrderedCollection #OrderedCollection #SmaCCNodeNameDirectiveNode #SmaCCNodeNameDirectiveNode #SmaCCAssociativeDirectiveNode #SmaCCAssociativeDirectiveNode #SmaCCAssociativeDirectiveNode #OrderedCollection #SmaCCIdDirectiveNode #OrderedCollection #SmaCCStartDirectiveNode #OrderedCollection #SmaCCFlagDirectiveNode #SmaCCIgnoreVariableDirectiveNode #OrderedCollection #SmaCCFlagDirectiveNode #SmaCCFlagDirectiveNode #SmaCCFlagDirectiveNode #SmaCCFlagDirectiveNode #SmaCCFlagDirectiveNode #SmaCCTokenRuleNode nil nil #SmaCCToken #SmaCCRegexNode #OrderedCollection #OrderedCollection #SmaCCRegexNode #OrderedCollection #SmaCCRegexNode #SmaCCProductionRuleNode nil nil #OrderedCollection #SmaCCProductionExpressionNode #OrderedCollection #SmaCCDefinitionNode #SmaCCSymbolNode #SmaCCSymbolNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
SmaCCDefinitionParser class >> transitionTable [
^#(
#[1 0 6 0 27 0 21 0 28 0 10 0 35 0 25 0 47 0 29 0 48 0 33 0 49 0 33 0 50 0 33 0 51 0 45 0 53 0 33 0 81 0 53 0 82 0 57 0 84 0 33 0 91 0 65 0 101] 
#[1 0 69 0 28 0 73 0 91] 
#[1 0 6 0 27 0 57 0 28 0 81 0 81 0 53 0 82 0 57 0 84] 
#[1 0 10 0 35 0 85 0 51 0 45 0 53] 
#[1 0 14 0 27 0 14 0 28 0 18 0 34 0 89 0 92] 
#[0 0 0 0 100] 
#[1 0 6 0 27 0 21 0 28 0 10 0 35 0 93 0 49 0 93 0 50 0 93 0 51 0 45 0 53 0 93 0 81 0 53 0 82 0 57 0 84 0 93 0 91 0 22 0 100 0 65 0 101] 
#[0 0 26 0 27 0 28 0 35 0 100 0 101] 
#[0 0 30 0 27 0 28 0 35 0 100 0 101] 
#[0 0 34 0 27 0 28 0 35 0 100 0 101] 
#[0 0 97 0 35] 
#[0 0 38 0 27 0 28 0 35 0 100 0 101] 
#[0 0 101 0 27] 
#[1 0 6 0 27 0 57 0 28 0 105 0 81 0 53 0 82 0 57 0 84] 
#[0 0 42 0 27 0 28 0 35 0 100 0 101] 
#[1 0 46 0 27 0 46 0 28 0 46 0 35 0 109 0 36 0 46 0 100 0 46 0 101] 
#[1 0 18 0 34 0 89 0 92] 
#[0 0 0 0 100] 
#[0 0 14 0 27 0 28 0 36] 
#[0 0 0 0 100] 
#[0 0 0 0 100] 
#[0 0 113 0 34] 
#[0 0 50 0 27 0 28 0 35 0 100 0 101] 
#[1 0 117 0 7 0 121 0 8 0 125 0 9 0 129 0 10 0 133 0 11 0 137 0 12 0 141 0 13 0 145 0 14 0 149 0 15 0 153 0 16 0 157 0 17 0 161 0 18 0 165 0 19 0 169 0 20 0 54 0 21 0 173 0 22 0 177 0 23 0 181 0 24 0 185 0 25 0 189 0 52 0 193 0 54 0 189 0 55 0 189 0 57 0 189 0 58 0 189 0 59 0 189 0 60 0 189 0 63 0 189 0 64 0 189 0 65 0 189 0 66 0 189 0 67 0 189 0 69 0 189 0 71 0 189 0 73 0 189 0 74 0 189 0 76 0 189 0 77 0 189 0 78 0 189 0 79 0 189 0 80] 
#[0 1 17 0 34] 
#[0 0 58 0 27 0 28 0 35 0 100 0 101] 
#[0 0 62 0 27 0 28 0 35 0 100 0 101] 
#[1 0 66 0 1 0 66 0 6 0 66 0 27 0 66 0 28 0 66 0 29 0 66 0 31 0 66 0 32 0 66 0 36 0 66 0 42 0 66 0 43 1 21 0 94 1 25 0 95 1 29 0 96] 
#[1 0 70 0 28 0 70 0 36 1 33 0 56] 
#[1 0 70 0 28 0 70 0 36 1 37 0 56] 
#[0 1 41 0 28] 
#[0 1 45 0 28] 
#[0 1 49 0 28] 
#[0 1 53 0 28] 
#[0 1 57 0 28] 
#[1 1 61 0 27 1 65 0 28 1 69 0 29 1 73 0 42 1 77 0 68 1 81 0 99] 
#[1 1 61 0 27 1 65 0 28 1 69 0 29 1 73 0 42 1 85 0 68 1 81 0 99] 
#[1 1 61 0 27 1 65 0 28 1 69 0 29 1 73 0 42 1 89 0 68 1 81 0 99] 
#[1 1 93 0 27 1 97 0 70] 
#[1 1 101 0 28 1 105 0 72] 
#[0 0 74 0 36] 
#[0 0 78 0 36] 
#[0 0 82 0 36] 
#[0 0 86 0 36] 
#[0 0 90 0 36] 
#[0 0 94 0 36] 
#[1 0 54 0 36 1 109 0 54] 
#[0 1 113 0 21] 
#[0 0 98 0 36] 
#[0 0 102 0 36] 
#[0 0 106 0 36] 
#[0 0 110 0 36] 
#[0 0 114 0 36] 
#[0 0 118 0 36] 
#[0 0 122 0 36] 
#[0 0 126 0 36] 
#[0 0 130 0 36] 
#[0 0 134 0 36] 
#[0 0 138 0 36] 
#[0 0 142 0 36] 
#[0 0 146 0 36] 
#[0 0 150 0 36] 
#[0 0 154 0 36] 
#[0 0 158 0 36] 
#[0 0 162 0 36] 
#[0 0 166 0 36] 
#[0 0 170 0 36] 
#[1 1 117 0 1 1 121 0 27 1 125 0 35 1 129 0 37 1 133 0 38 1 137 0 40 1 141 0 41 1 145 0 85 1 149 0 88 1 153 0 90] 
#[1 1 157 0 6 0 174 0 36 1 161 0 93] 
#[0 0 178 0 2 0 6 0 36] 
#[1 1 165 0 1 0 182 0 2 0 182 0 6 1 61 0 27 1 65 0 28 1 69 0 29 1 169 0 31 1 173 0 32 0 182 0 36 1 73 0 42 1 177 0 43 1 181 0 97 1 181 0 98 1 189 0 99] 
#[1 1 193 0 28 0 186 0 36 1 193 0 84] 
#[1 1 193 0 28 0 190 0 36 1 193 0 84] 
#[0 0 194 0 36] 
#[0 1 197 0 1] 
#[0 1 201 0 1] 
#[0 0 198 0 36] 
#[0 0 202 0 36] 
#[0 0 206 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 33 0 36 0 42 0 43] 
#[0 0 210 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 33 0 36 0 42 0 43] 
#[0 0 214 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 33 0 36 0 42 0 43] 
#[0 0 218 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 33 0 36 0 42 0 43] 
#[1 1 61 0 27 1 65 0 28 1 69 0 29 0 222 0 36 1 73 0 42 1 205 0 99] 
#[0 0 226 0 27 0 28 0 29 0 36 0 42] 
#[1 1 61 0 27 1 65 0 28 1 69 0 29 0 230 0 36 1 73 0 42 1 205 0 99] 
#[1 1 61 0 27 1 65 0 28 1 69 0 29 0 234 0 36 1 73 0 42 1 205 0 99] 
#[0 0 238 0 27 0 36] 
#[1 1 209 0 27 0 242 0 36] 
#[0 0 246 0 28 0 36] 
#[1 1 213 0 28 0 250 0 36] 
#[0 1 217 0 36] 
#[1 1 221 0 28 1 225 0 75] 
#[1 1 117 0 1 1 121 0 27 1 125 0 35 1 129 0 37 1 133 0 38 1 137 0 40 1 141 0 41 1 229 0 85 1 149 0 88 1 153 0 90] 
#[0 0 254 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[0 1 2 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[0 1 6 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[0 1 10 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[0 1 14 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[0 1 18 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[1 1 22 0 36 1 233 0 83] 
#[1 1 26 0 2 1 237 0 6 1 26 0 36 1 241 0 86 1 245 0 87] 
#[1 1 117 0 1 1 30 0 2 1 249 0 3 1 253 0 4 2 1 0 5 1 30 0 6 1 121 0 27 1 125 0 35 1 30 0 36 1 129 0 37 1 133 0 38 2 5 0 39 1 137 0 40 1 141 0 41 2 9 0 89 2 13 0 90] 
#[1 0 66 0 1 0 66 0 2 0 66 0 6 0 66 0 27 0 66 0 28 0 66 0 29 0 66 0 31 0 66 0 32 0 66 0 36 0 66 0 42 0 66 0 43 2 17 0 95 1 29 0 96] 
#[0 2 21 0 36] 
#[1 0 66 0 1 0 66 0 2 0 66 0 6 0 66 0 27 0 66 0 28 0 66 0 29 0 66 0 31 0 66 0 32 0 66 0 42 0 66 0 43 2 25 0 94 1 25 0 95 1 29 0 96] 
#[0 1 34 0 2 0 6 0 36] 
#[0 1 38 0 2 0 6 0 36] 
#[1 2 29 0 28 2 33 0 44] 
#[1 1 42 0 1 1 42 0 2 2 37 0 3 2 41 0 4 2 45 0 5 1 42 0 6 1 42 0 27 1 42 0 28 1 42 0 29 1 42 0 31 1 42 0 32 1 42 0 36 1 42 0 42 1 42 0 43] 
#[0 1 46 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 36 0 42 0 43] 
#[1 1 50 0 1 1 50 0 2 1 50 0 3 1 50 0 4 1 50 0 5 1 50 0 6 1 50 0 27 1 50 0 28 1 50 0 29 1 50 0 31 1 50 0 32 2 49 0 33 1 50 0 36 1 50 0 42 1 50 0 43] 
#[0 1 54 0 28 0 36] 
#[1 1 58 0 2 1 58 0 28 2 53 0 62] 
#[1 1 62 0 2 1 62 0 28 2 57 0 61] 
#[0 1 66 0 27 0 28 0 29 0 36 0 42] 
#[0 1 70 0 27 0 36] 
#[0 1 74 0 28 0 36] 
#[0 1 78 0 27 0 28 0 35 0 100 0 101] 
#[0 1 82 0 28 0 36] 
#[1 2 61 0 28 1 86 0 36] 
#[0 2 65 0 2] 
#[0 2 69 0 36] 
#[1 1 117 0 1 1 121 0 27 1 125 0 35 1 129 0 37 1 133 0 38 1 137 0 40 1 141 0 41 2 73 0 88 1 153 0 90] 
#[0 1 90 0 2 0 6 0 36] 
#[1 1 94 0 2 1 237 0 6 1 94 0 36 2 77 0 86] 
#[0 1 98 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[0 1 102 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[0 1 106 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[0 1 110 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[1 1 117 0 1 1 114 0 2 1 114 0 6 1 121 0 27 1 125 0 35 1 114 0 36 1 129 0 37 1 133 0 38 1 137 0 40 1 141 0 41 2 81 0 90] 
#[1 1 118 0 1 1 118 0 2 1 249 0 3 1 253 0 4 2 1 0 5 1 118 0 6 1 118 0 27 1 118 0 35 1 118 0 36 1 118 0 37 1 118 0 38 2 5 0 39 1 118 0 40 1 118 0 41] 
#[0 1 122 0 2 0 6 0 36] 
#[0 1 126 0 27 0 28 0 35 0 100 0 101] 
#[1 2 85 0 2 1 157 0 6] 
#[0 2 89 0 44] 
#[0 1 130 0 2 0 6 0 36] 
#[0 1 134 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 36 0 42 0 43] 
#[0 1 138 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 36 0 42 0 43] 
#[0 1 142 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 36 0 42 0 43] 
#[0 1 146 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 36 0 42 0 43] 
#[1 2 93 0 2 2 97 0 28] 
#[1 2 101 0 2 2 105 0 28] 
#[0 1 150 0 28 0 36] 
#[0 1 154 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 35 0 36 0 37 0 38 0 39 0 40 0 41] 
#[0 1 158 0 27 0 28 0 35 0 100 0 101] 
#[0 1 162 0 2 0 6 0 36] 
#[0 1 166 0 2 0 6 0 36] 
#[1 1 170 0 1 1 170 0 2 1 249 0 3 1 253 0 4 2 1 0 5 1 170 0 6 1 170 0 27 1 170 0 35 1 170 0 36 1 170 0 37 1 170 0 38 2 5 0 39 1 170 0 40 1 170 0 41] 
#[0 1 174 0 1 0 2 0 3 0 4 0 5 0 6 0 27 0 28 0 29 0 31 0 32 0 36 0 42 0 43] 
#[0 1 178 0 2 0 6 0 36] 
#[0 1 182 0 36] 
#[0 1 186 0 2 0 28] 
#[0 1 190 0 36] 
#[0 1 194 0 2 0 28]
	).
]

{ #category : #private }
SmaCCDefinitionParser >> dismissErrorToken [
	self scope: #default.
	^ super dismissErrorToken
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForAttributesLine1: nodes [
	| result |
	result := SmaCCAttributeDirectiveNode new.
	result attributesToken: (nodes at: 1).
	result classname: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addTokens: (nodes at: 4) to: result names.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForConcatenationRegex2: nodes [
	| result |
	result := SmaCCConcatenationRegexNode new.
	result addNode: (nodes at: 1) to: result items.
	result addNodes: (nodes at: 2) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForDirectiveLine1: nodes [
	| result |
	result := nodes at: 3.
	result directiveStartToken: (nodes at: 2).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForEndDirective1: nodes [
	self scope: #default.
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForError1: nodes [
	| result |
	result := SmaCCDefinitionErrorNode new.
	result smaccError: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForError2: nodes [
	| result |
	result := SmaCCDefinitionErrorNode new.
	result smaccError: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForFile1: nodes [
	| result |
	result := SmaCCGrammarDefinitionNode new.
	result addNodes: (nodes at: 1) to: result rules.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForGLR1: nodes [
	| result |
	result := SmaCCFlagDirectiveNode new.
	result typeToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForIdMethodLine1: nodes [
	| result |
	result := SmaCCIdDirectiveNode new.
	result idToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForIgnoredVariables1: nodes [
	| result |
	result := SmaCCIgnoreVariableDirectiveNode new.
	result ignoreVariablesToken: (nodes at: 2).
	result addTokens: (nodes at: 3) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForLeftLine1: nodes [
	| result |
	result := SmaCCAssociativeDirectiveNode new.
	result typeToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result symbols.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForNamedTerm2: nodes [
	| result |
	result := nodes at: 1.
	result variableNameToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRule1: nodes [
	| result |
	result := SmaCCProductionExpressionNode new.
	result addNodes: (nodes at: 1) to: result terms.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRule2: nodes [
	| result |
	result := SmaCCCodeProductionExpressionNode new.
	result addNodes: (nodes at: 1) to: result terms.
	result code: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRule4: nodes [
	| result |
	result := SmaCCClassProductionExpressionNode new.
	result addNodes: (nodes at: 1) to: result terms.
	result left: (nodes at: 2).
	result classname: (nodes at: 3).
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRule5: nodes [
	| result |
	result := SmaCCClassProductionExpressionNode new.
	result addNodes: (nodes at: 1) to: result terms.
	result left: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRules1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRules2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForProductionRule1: nodes [
	| result |
	result := SmaCCProductionRuleNode new.
	result name: (nodes at: 1).
	result colon: (nodes at: 3).
	result addTokens: ((nodes at: 4) at: 1) to: result barTokens.
	result addNodes: ((nodes at: 4) at: 2) to: result expressions.
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegex2: nodes [
	| result |
	result := SmaCCAlternationRegexNode new.
	result addNode: (nodes at: 1) to: result items.
	result addTokens: ((nodes at: 2) at: 1) to: result barTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexRule1: nodes [
	| result |
	result := SmaCCTokenRuleNode new.
	result name: (nodes at: 2).
	result colon: (nodes at: 3).
	result regex: (nodes at: 4).
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexRule2: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result states.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm2: nodes [
	| result |
	result := SmaCCCharacterRegexNode new.
	result char: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm5: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParens.
	result addToken: (nodes at: 3) to: result rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm6: nodes [
	| result |
	result := SmaCCCharacterBlockRegexNode new.
	result block: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm7: nodes [
	| result |
	result := SmaCCTokenRegexNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRegexTerm8: nodes [
	| result |
	result := SmaCCRepeatRegexNode new.
	result regex: (nodes at: 1).
	result count: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRootClassLine1: nodes [
	| result |
	result := SmaCCNodeNameDirectiveNode new.
	result typeToken: (nodes at: 1).
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRules1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForRules2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForScopesLine1: nodes [
	| result |
	result := SmaCCScopeDirectiveNode new.
	result typeToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForSpecialTerm4: nodes [
	| result |
	result := SmaCCPostfixTermNode new.
	result term: (nodes at: 1).
	result operator: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForSpecialTerm5: nodes [
	| result |
	result := SmaCCGroupTermNode new.
	result leftParen: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result barTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result expressions.
	result rightParen: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStartDirective1: nodes [
	self scope: #directives.
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStartLine1: nodes [
	| result |
	result := SmaCCStartDirectiveNode new.
	result startToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result symbols.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStartProduction1: nodes [
	self scope: #parser.
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForStartRegex1: nodes [
	self scope: #scanner.
	^ nil
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForSuperclassLine1: nodes [
	| result |
	result := SmaCCSuperclassDirectiveNode new.
	result hierarchyToken: (nodes at: 1).
	result superclass: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addTokens: (nodes at: 4) to: result names.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm1: nodes [
	| result |
	result := SmaCCKeywordSymbolNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm2: nodes [
	| result |
	result := SmaCCTokenSymbolNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm3: nodes [
	| result |
	result := SmaCCProductionSymbolNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerm4: nodes [
	| result |
	result := SmaCCErrorSymbolNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForTerms1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionFor______barToken__ConcatenationRegex__item__1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionFor______barToken__ConcatenationRegex__item___1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionFor______barToken__ConcatenationRegex__item___2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #testing }
SmaCCDefinitionParser >> tryAllTokens [
	^ true
]

{ #category : #testing }
SmaCCDefinitionParser >> useAllTokenIds [
	^ false
]
