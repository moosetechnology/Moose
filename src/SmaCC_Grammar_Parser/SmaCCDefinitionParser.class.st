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
	^'2018-12-28T19:02:13.563237-06:00'
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
%id <code> <keyword> <symbolname> <tokenname> <variablename> <semicolon>
	<directive> <production> <classLeft> <classRight>;
%left	""|"";
%left ""("" <character> <backslashcharacter> <characterblock> <anycharacter> <tokenname> <symbolname> <directive>;
%left ""*"" ""+"" ""?"" <repeat> ;

%start ProductionRule RegexRule File;

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
	#(77 0 #reduceActionForStartRegex1:) 
	#(50 0 #reduceActionForStartDirective1:) 
	#(79 1 #liftFirstValue:) 
	#(87 0 #reduceActionForStartProduction1:) 
	#(44 1 #reduceActionForFile1:) 
	#(45 1 #reduceActionForRules1:) 
	#(46 1 #liftFirstValue:) 
	#(47 1 #reduceActionForError2:) 
	#(45 2 #reduceActionForRules2:) 
	#(51 0 #reduceActionForEndDirective1:) 
	#(76 2 #reduceActionForRegexRule2:) 
	#(47 2 #reduceActionForError1:) 
	#(91 0 #reduceActionForTerms1:) 
	#(53 0 #reduceActionForTerms1:) 
	#(70 1 #reduceActionForGLR1:) 
	#(73 1 #reduceActionForGLR1:) 
	#(74 1 #reduceActionForGLR1:) 
	#(75 1 #reduceActionForGLR1:) 
	#(49 1 #liftFirstValue:) 
	#(88 0 #reduceActionForEndDirective1:) 
	#(89 1 #reduceActionForParserRules2:) 
	#(90 1 #reduceActionForParserRule1:) 
	#(52 2 #reduceActionForScopesLine1:) 
	#(54 2 #reduceActionForScopesLine1:) 
	#(55 2 #reduceActionForRootClassLine1:) 
	#(60 2 #reduceActionForRootClassLine1:) 
	#(61 2 #reduceActionForRootClassLine1:) 
	#(94 1 #reduceActionForTerm2:) 
	#(94 1 #reduceActionForTerm3:) 
	#(94 1 #reduceActionForTerm1:) 
	#(94 1 #reduceActionForTerm4:) 
	#(62 2 #reduceActionForLeftLine1:) 
	#(65 1 #reduceActionForRules1:) 
	#(63 2 #reduceActionForLeftLine1:) 
	#(64 2 #reduceActionForLeftLine1:) 
	#(67 1 #reduceActionForRules1:) 
	#(66 2 #reduceActionForIdMethodLine1:) 
	#(69 1 #reduceActionForRules1:) 
	#(68 2 #reduceActionForStartLine1:) 
	#(85 1 #reduceActionForRegexTerm7:) 
	#(85 1 #reduceActionForRegexTerm2:) 
	#(85 1 #reduceActionForRegexTerm6:) 
	#(78 0 #reduceActionForEndDirective1:) 
	#(80 1 #liftFirstValue:) 
	#(83 1 #liftFirstValue:) 
	#(90 2 #reduceActionForParserRule2:) 
	#(91 2 #reduceActionForRules2:) 
	#(92 1 #liftFirstValue:) 
	#(93 1 #liftFirstValue:) 
	#(53 2 #reduceActionForRules2:) 
	#(59 0 #reduceActionForTerms1:) 
	#(58 0 #reduceActionForTerms1:) 
	#(65 2 #reduceActionForRules2:) 
	#(67 2 #reduceActionForRules2:) 
	#(69 2 #reduceActionForRules2:) 
	#(48 5 #reduceActionForDirectiveLine1:) 
	#(72 1 #reduceActionForRules1:) 
	#(71 3 #reduceActionForIgnoredVariables1:) 
	#(82 1 #reduceActionFor______barToken__ConcatenationRegex__item___1:) 
	#(80 2 #reduceActionForRegex2:) 
	#(85 2 #reduceActionForRegexTerm8:) 
	#(83 2 #reduceActionForConcatenationRegex2:) 
	#(84 1 #reduceActionForRules1:) 
	#(89 3 #reduceActionForParserRules1:) 
	#(86 6 #reduceActionForProductionRule1:) 
	#(90 3 #reduceActionForParserRule4:) 
	#(92 2 #reduceActionForSpecialTerm4:) 
	#(93 2 #reduceActionForNamedTerm2:) 
	#(72 2 #reduceActionForRules2:) 
	#(85 3 #reduceActionForRegexTerm5:) 
	#(76 6 #reduceActionForRegexRule1:) 
	#(81 2 #reduceActionFor______barToken__ConcatenationRegex__item__1:) 
	#(82 2 #reduceActionFor______barToken__ConcatenationRegex__item___2:) 
	#(84 2 #reduceActionForRules2:) 
	#(92 3 #reduceActionForSpecialTerm5:) 
	#(90 4 #reduceActionForParserRule3:) 
	#(56 5 #reduceActionForSuperclassLine1:) 
	#(59 2 #reduceActionForRules2:) 
	#(57 5 #reduceActionForAttributesLine1:) 
	#(58 2 #reduceActionForRules2:)
	).
]

{ #category : #'generated-accessing' }
SmaCCDefinitionParser class >> scannerClass [
	^SmaCCDefinitionScanner
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
	^ #('"("' '")"' '"*"' '"+"' '"?"' '"|"' '<scopes>' '<excludes>' '<root>' '<hierarchy>' '<attributes>' '<prefix>' '<suffix>' '<left>' '<right>' '<nonassoc>' '<id>' '<start>' '<glr>' '<ignorecase>' '<ignorevariables>' '<annotate_tokens>' '<lr1>' '<whitespace>' '<tokenname>' '<symbolname>' '<keyword>' '<comment>' '<code>' '<variablename>' '<production>' '<directive>' '<semicolon>' '<backslashcharacter>' '<characterblock>' '<repeat>' '<character>' '<anycharacter>' '<error>' '<classLeft>' '<classRight>' '<patternToken>' 'B e g i n' 'File' 'Rules' 'Rule' 'Error' 'DirectiveLine' 'Directive' 'StartDirective' 'EndDirective' 'ScopesLine' 'Scopes' 'ExcludeScopesLine' 'RootClassLine' 'SuperclassLine' 'AttributesLine' 'IvarList' 'ClassList' 'PrefixLine' 'SuffixLine' 'LeftLine' 'RightLine' 'NonAssociativeLine' 'TokenList' 'IdMethodLine' 'IdTokens' 'StartLine' 'StartingTokens' 'GLR' 'IgnoredVariables' 'IgnoredVariableList' 'IgnoreCase' 'AnnotateTokens' 'LR1' 'RegexRule' 'StartRegex' 'EndRegex' 'Symbol' 'Regex' '("|" ''barToken'' ConcatenationRegex ''item'')' '("|" ''barToken'' ConcatenationRegex ''item'')+' 'ConcatenationRegex' 'RegexTerm ''item'' +' 'RegexTerm' 'ProductionRule' 'StartProduction' 'EndProduction' 'ParserRules' 'ParserRule' 'Terms' 'SpecialTerm' 'NamedTerm' 'Term' 'E O F' 'error')
]

{ #category : #generated }
SmaCCDefinitionParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCGrammarDefinitionNode #SmaCCGrammarDefinitionNode #OrderedCollection #SmaCCDefinitionNode #SmaCCDefinitionErrorNode #SmaCCDirectiveNode #SmaCCDirectiveNode nil nil #SmaCCScopeDirectiveNode #OrderedCollection #SmaCCScopeDirectiveNode #SmaCCNodeNameDirectiveNode #SmaCCSuperclassDirectiveNode #SmaCCAttributeDirectiveNode #OrderedCollection #OrderedCollection #SmaCCNodeNameDirectiveNode #SmaCCNodeNameDirectiveNode #SmaCCAssociativeDirectiveNode #SmaCCAssociativeDirectiveNode #SmaCCAssociativeDirectiveNode #OrderedCollection #SmaCCIdDirectiveNode #OrderedCollection #SmaCCStartDirectiveNode #OrderedCollection #SmaCCFlagDirectiveNode #SmaCCIgnoreVariableDirectiveNode #OrderedCollection #SmaCCFlagDirectiveNode #SmaCCFlagDirectiveNode #SmaCCFlagDirectiveNode #SmaCCTokenRuleNode nil nil #SmaCCToken #SmaCCRegexNode #OrderedCollection #OrderedCollection #SmaCCRegexNode #OrderedCollection #SmaCCRegexNode #SmaCCProductionRuleNode nil nil #OrderedCollection #SmaCCProductionExpressionNode #OrderedCollection #SmaCCDefinitionNode #SmaCCSymbolNode #SmaCCSymbolNode #SmaCCToken #SmaCCError)
]

{ #category : #generated }
SmaCCDefinitionParser class >> transitionTable [
^#(
#[1 0 6 0 25 0 17 0 26 0 10 0 32 0 21 0 44 0 25 0 45 0 29 0 46 0 29 0 47 0 29 0 48 0 41 0 50 0 29 0 76 0 49 0 77 0 53 0 79 0 29 0 86 0 61 0 96] 
#[1 0 65 0 26 0 69 0 86] 
#[1 0 6 0 25 0 53 0 26 0 77 0 76 0 49 0 77 0 53 0 79] 
#[1 0 14 0 25 0 14 0 26 0 18 0 31 0 81 0 87] 
#[0 0 0 0 95] 
#[1 0 6 0 25 0 17 0 26 0 10 0 32 0 85 0 46 0 85 0 47 0 85 0 48 0 41 0 50 0 85 0 76 0 49 0 77 0 53 0 79 0 85 0 86 0 22 0 95 0 61 0 96] 
#[0 0 26 0 25 0 26 0 32 0 95 0 96] 
#[0 0 30 0 25 0 26 0 32 0 95 0 96] 
#[0 0 30 0 25 0 26 0 32 0 95 0 96] 
#[0 0 89 0 32] 
#[0 0 30 0 25 0 26 0 32 0 95 0 96] 
#[0 0 93 0 25] 
#[1 0 6 0 25 0 53 0 26 0 97 0 76 0 49 0 77 0 53 0 79] 
#[0 0 30 0 25 0 26 0 32 0 95 0 96] 
#[1 0 34 0 25 0 34 0 26 0 34 0 32 0 101 0 33 0 34 0 95 0 34 0 96] 
#[1 0 18 0 31 0 81 0 87] 
#[0 0 0 0 95] 
#[0 0 14 0 25 0 26 0 33] 
#[0 0 0 0 95] 
#[0 0 105 0 31] 
#[0 0 38 0 25 0 26 0 32 0 95 0 96] 
#[1 0 109 0 7 0 113 0 8 0 117 0 9 0 121 0 10 0 125 0 11 0 129 0 12 0 133 0 13 0 137 0 14 0 141 0 15 0 145 0 16 0 149 0 17 0 153 0 18 0 157 0 19 0 161 0 20 0 42 0 21 0 165 0 22 0 169 0 23 0 173 0 49 0 177 0 51 0 173 0 52 0 173 0 54 0 173 0 55 0 173 0 56 0 173 0 57 0 173 0 60 0 173 0 61 0 173 0 62 0 173 0 63 0 173 0 64 0 173 0 66 0 173 0 68 0 173 0 70 0 173 0 71 0 173 0 73 0 173 0 74 0 173 0 75] 
#[0 0 249 0 31] 
#[0 0 46 0 25 0 26 0 32 0 95 0 96] 
#[0 0 50 0 25 0 26 0 32 0 95 0 96] 
#[1 0 54 0 1 0 54 0 6 0 54 0 25 0 54 0 26 0 54 0 27 0 54 0 29 0 54 0 33 0 54 0 39 0 54 0 40 0 253 0 89 1 1 0 90 1 5 0 91] 
#[1 0 58 0 26 0 58 0 33 1 9 0 53] 
#[1 0 58 0 26 0 58 0 33 1 13 0 53] 
#[0 1 17 0 26] 
#[0 1 21 0 26] 
#[0 1 25 0 26] 
#[0 1 29 0 26] 
#[0 1 33 0 26] 
#[1 1 37 0 25 1 41 0 26 1 45 0 27 1 49 0 39 1 53 0 65 1 57 0 94] 
#[1 1 37 0 25 1 41 0 26 1 45 0 27 1 49 0 39 1 61 0 65 1 57 0 94] 
#[1 1 37 0 25 1 41 0 26 1 45 0 27 1 49 0 39 1 65 0 65 1 57 0 94] 
#[1 1 69 0 25 1 73 0 67] 
#[1 1 77 0 26 1 81 0 69] 
#[0 0 62 0 33] 
#[0 0 66 0 33] 
#[0 0 70 0 33] 
#[0 0 74 0 33] 
#[1 0 42 0 33 1 85 0 51] 
#[0 1 89 0 21] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[0 0 78 0 33] 
#[1 1 93 0 1 1 97 0 25 1 101 0 32 1 105 0 34 1 109 0 35 1 113 0 37 1 117 0 38 1 121 0 80 1 125 0 83 1 129 0 85] 
#[1 1 133 0 6 0 82 0 33 1 137 0 88] 
#[0 0 86 0 2 0 6 0 33] 
#[1 1 141 0 1 0 90 0 2 0 90 0 6 1 37 0 25 1 41 0 26 1 45 0 27 1 145 0 29 0 90 0 33 1 49 0 39 1 149 0 40 1 153 0 92 1 153 0 93 1 161 0 94] 
#[1 1 165 0 26 0 94 0 33 1 165 0 79] 
#[1 1 165 0 26 0 98 0 33 1 165 0 79] 
#[0 0 102 0 33] 
#[0 1 169 0 1] 
#[0 1 173 0 1] 
#[0 0 106 0 33] 
#[0 0 110 0 33] 
#[0 0 114 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 30 0 33 0 39 0 40] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 30 0 33 0 39 0 40] 
#[0 0 122 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 30 0 33 0 39 0 40] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 30 0 33 0 39 0 40] 
#[1 1 37 0 25 1 41 0 26 1 45 0 27 0 130 0 33 1 49 0 39 1 177 0 94] 
#[0 0 134 0 25 0 26 0 27 0 33 0 39] 
#[1 1 37 0 25 1 41 0 26 1 45 0 27 0 138 0 33 1 49 0 39 1 177 0 94] 
#[1 1 37 0 25 1 41 0 26 1 45 0 27 0 142 0 33 1 49 0 39 1 177 0 94] 
#[0 0 146 0 25 0 33] 
#[1 1 181 0 25 0 150 0 33] 
#[0 0 154 0 26 0 33] 
#[1 1 185 0 26 0 158 0 33] 
#[0 1 189 0 33] 
#[1 1 193 0 26 1 197 0 72] 
#[1 1 93 0 1 1 97 0 25 1 101 0 32 1 105 0 34 1 109 0 35 1 113 0 37 1 117 0 38 1 201 0 80 1 125 0 83 1 129 0 85] 
#[0 0 162 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[0 0 166 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[0 0 166 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[0 0 170 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[0 0 166 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[0 0 166 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[1 0 174 0 33 1 205 0 78] 
#[1 0 178 0 2 1 209 0 6 0 178 0 33 1 213 0 81 1 217 0 82] 
#[1 1 93 0 1 0 182 0 2 1 221 0 3 1 225 0 4 1 229 0 5 0 182 0 6 1 97 0 25 1 101 0 32 0 182 0 33 1 105 0 34 1 109 0 35 1 233 0 36 1 113 0 37 1 117 0 38 1 237 0 84 1 241 0 85] 
#[1 0 54 0 1 0 54 0 2 0 54 0 6 0 54 0 25 0 54 0 26 0 54 0 27 0 54 0 29 0 54 0 33 0 54 0 39 0 54 0 40 1 245 0 90 1 5 0 91] 
#[0 1 249 0 33] 
#[1 0 54 0 1 0 54 0 2 0 54 0 6 0 54 0 25 0 54 0 26 0 54 0 27 0 54 0 29 0 54 0 39 0 54 0 40 1 253 0 89 1 1 0 90 1 5 0 91] 
#[0 0 186 0 2 0 6 0 33] 
#[1 2 1 0 26 2 5 0 41] 
#[1 0 190 0 1 0 190 0 2 2 9 0 3 2 13 0 4 2 17 0 5 0 190 0 6 0 190 0 25 0 190 0 26 0 190 0 27 0 190 0 29 0 190 0 33 0 190 0 39 0 190 0 40] 
#[0 0 194 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 33 0 39 0 40] 
#[1 0 198 0 1 0 198 0 2 0 198 0 3 0 198 0 4 0 198 0 5 0 198 0 6 0 198 0 25 0 198 0 26 0 198 0 27 0 198 0 29 2 21 0 30 0 198 0 33 0 198 0 39 0 198 0 40] 
#[0 0 202 0 26 0 33] 
#[1 0 206 0 2 0 206 0 26 2 25 0 59] 
#[1 0 210 0 2 0 210 0 26 2 29 0 58] 
#[0 0 214 0 25 0 26 0 27 0 33 0 39] 
#[0 0 218 0 25 0 33] 
#[0 0 222 0 26 0 33] 
#[0 0 226 0 25 0 26 0 32 0 95 0 96] 
#[0 0 230 0 26 0 33] 
#[1 2 33 0 26 0 234 0 33] 
#[0 2 37 0 2] 
#[0 2 41 0 33] 
#[1 1 93 0 1 1 97 0 25 1 101 0 32 1 105 0 34 1 109 0 35 1 113 0 37 1 117 0 38 2 45 0 83 1 129 0 85] 
#[0 0 238 0 2 0 6 0 33] 
#[1 0 242 0 2 1 209 0 6 0 242 0 33 2 49 0 81] 
#[0 0 246 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[0 0 246 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[0 0 246 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[0 0 246 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[1 1 93 0 1 0 250 0 2 0 250 0 6 1 97 0 25 1 101 0 32 0 250 0 33 1 105 0 34 1 109 0 35 1 113 0 37 1 117 0 38 2 53 0 85] 
#[1 0 254 0 1 0 254 0 2 1 221 0 3 1 225 0 4 1 229 0 5 0 254 0 6 0 254 0 25 0 254 0 32 0 254 0 33 0 254 0 34 0 254 0 35 1 233 0 36 0 254 0 37 0 254 0 38] 
#[0 1 2 0 2 0 6 0 33] 
#[0 1 6 0 25 0 26 0 32 0 95 0 96] 
#[1 2 57 0 2 1 133 0 6] 
#[0 2 61 0 41] 
#[0 1 10 0 2 0 6 0 33] 
#[0 1 14 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 33 0 39 0 40] 
#[0 1 14 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 33 0 39 0 40] 
#[0 1 14 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 33 0 39 0 40] 
#[0 1 18 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 33 0 39 0 40] 
#[1 2 65 0 2 2 69 0 26] 
#[1 2 73 0 2 2 77 0 26] 
#[0 1 22 0 26 0 33] 
#[0 1 26 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 32 0 33 0 34 0 35 0 36 0 37 0 38] 
#[0 1 30 0 25 0 26 0 32 0 95 0 96] 
#[0 1 34 0 2 0 6 0 33] 
#[0 1 38 0 2 0 6 0 33] 
#[1 1 42 0 1 1 42 0 2 1 221 0 3 1 225 0 4 1 229 0 5 1 42 0 6 1 42 0 25 1 42 0 32 1 42 0 33 1 42 0 34 1 42 0 35 1 233 0 36 1 42 0 37 1 42 0 38] 
#[0 1 46 0 1 0 2 0 3 0 4 0 5 0 6 0 25 0 26 0 27 0 29 0 33 0 39 0 40] 
#[0 1 50 0 2 0 6 0 33] 
#[0 1 54 0 33] 
#[0 1 58 0 2 0 26] 
#[0 1 62 0 33] 
#[0 1 66 0 2 0 26]
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
SmaCCDefinitionParser >> reduceActionForParserRule3: nodes [
	| result |
	result := SmaCCClassProductionExpressionNode new.
	result addNodes: (nodes at: 1) to: result terms.
	result left: (nodes at: 2).
	result classname: (nodes at: 3).
	result right: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCDefinitionParser >> reduceActionForParserRule4: nodes [
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
