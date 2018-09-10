Class {
	#name : #JSParser,
	#superclass : #SmaCCGLRParser,
	#classInstVars : [
		'keywords'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #'generated-accessing' }
JSParser class >> cacheId [
	^'2018-03-19T12:40:41.761618-05:00'
]

{ #category : #generated }
JSParser class >> definitionComment [
"%root Program;
%prefix JS;
%suffix Node;

%scopes default template;

%start Expression Statement Script Module;

%ignore_variables semicolon comma leftParen rightParen leftBracket rightBracket leftBrace rightBrace left right colonToken;

%hierarchy Literal (
	BooleanLiteral 
	NullLiteral 
	NumericLiteral 
	RegularExpressionLiteral
	StringLiteral
);
%hierarchy Expression (
	ArrayLiteral
	ArrowFunction
	AssignmentExpression
	BinaryExpression
	CallExpression
	ClassExpression
	CommaExpression
	ConditionalExpression
	Function
	IndexedPropertyExpression
	Literal
	NameExpression
	NamedPropertyExpression
	NewExpression
	NewTargetExpression
	ObjectLiteral
	PrefixExpression
	PostfixExpression
	SpreadExpression
	SuperCallExpression
	SuperIndexedPropertyExpression
	SuperNamedPropertyExpression
	TaggedTemplateLiteral
	TemplateLiteral
	ThisExpression
	UnaryExpression
	YieldExpression
);
%hierarchy Function (
	GeneratorFunction
);
%hierarchy Statement (
	BlockStatement
	BreakStatement
	ContinueStatement
	DebuggerStatement
	DoWhileStatement
	EmptyStatement
	ExpressionStatement
	ForInStatement
	ForOfStatement
	ForStatement
	IfStatement
	LabelledStatement
	LexicalDeclaration
	ReturnStatement
	SwitchStatement
	ThrowStatement
	TryStatement
	VariableStatement
	WhileStatement
	WithStatement
);
%hierarchy MethodDefinition (
	GeneratorMethodDefinition
	GetMethodDefinition
	SetMethodDefinition
);
%hierarchy VariableDeclaration (
	RestVariableDeclaration
);

%glr;

%id <semicolon> <identifier> <slash> <slashEqual> <regular_expression> <identifierName> <rightBrace>;

%right ""else"";

<semicolon>
:	\;
;
<slash>
:	\/
;
<slashEqual>
:	\/\=
;
<rightBrace>
:	\}
;

<comment>
	: \/\/ [^\r\n]*
	| (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
<hex>
:	[0-9a-fA-F]
;
<identifier_start>
:	<isLetter> | \$ | _ | (\\ u <hex>{4,4})
;
<identifier_part>	#TODO
:	<identifier_start> | <isDigit> 
;
<identifier>
:	<identifier_start> <identifier_part>*
;
<identifierName>
:	<identifier>
;
<whitespace>
:	<isSeparator>+
;
<escape_sequence>
:	[^\r\n] | (x <hex>{2,2}) | (u <hex>{4,4})
;
<escape>
:	\\  <escape_sequence>
;
<line_continuation>
:	\\ (\r | \n | (\r\n))
;
<string>
:	(\"" ([^\""\\\r\n] | <line_continuation> | <escape>)* \"")+
|	(\' ([^\'\\\r\n] | <line_continuation> | <escape>)* \')+
;
<decimal_integer>
#:	0 | ([1-9][0-9]*)
:	[0-9]+	# numbers that start with 0's should be octals, but node appears to allow 09 (e.g., (1 + 09) == (1 + 011))
;
<decimal_digits>
:	[0-9]+
;
<exponent_part>
:	[eE] [\+\-]? <decimal_digits>
;
<decimal>
:	(<decimal_integer> \. <decimal_digits>? <exponent_part>?)
|	(\. <decimal_digits> <exponent_part>?)
|	(<decimal_integer> <exponent_part>?)
;
<hex_integer>
:	0 [xX] [0-9A-Fa-f]+
;
<binary_integer>
:	0 [bB] [0-1]+
;
<octal_integer>
:	0 [oO] [0-7]+
;
<numeric>
:	<decimal> | <hex_integer> | <binary_integer> | <octal_integer>
;
<regular_expression_backslash_sequence>
:	\\ [^\r\n]
;
<regular_expression_class_chars>
:	([^\\\]] | <regular_expression_backslash_sequence>)*
;
<regular_expression_class>
:	\[ <regular_expression_class_chars> \]
;
<regular_expression_first_char>
:	[^\\\/\[\*\r\n] | <regular_expression_backslash_sequence> | <regular_expression_class>
;
<regular_expression_char>
:	[^\\\/\[\r\n] | <regular_expression_backslash_sequence> | <regular_expression_class>
;
<regular_expression_chars>
:	<regular_expression_char>*
;
<regular_expression_body>
:	<regular_expression_first_char> <regular_expression_chars>
;
<regular_expression_flags>
:	<identifier>*
;
<regular_expression>
:	\/ <regular_expression_body> \/ <regular_expression_flags>
;
<patternToken>
: 	\`\? [^\`]+ \`
;
<no_substitution_template>##################
:	\` ([^\`$\\] | <escape> | \$[^\`\{])* \$? \`
;
<template_head>
:	\` ([^\`$\\] | <escape> | \$[^\`\{])* \$\{
;
template <template_middle>
:	\}  ([^\`$\\] | <escape> | \$[^\`\{])* \$\{
;
template <template_end>
:	\}  ([^\`$\\] | <escape> | \$[^\`\{])* \$?\`
;

goal 
:	Module
;

# A.2 Expressions
#IdentifierReference
#:	Identifier
#:	Identifier
#;
#BindingIdentifieropt
#:
#|	BindingIdentifier
#;
#BindingIdentifier
#:	Identifier
#;
Identifieropt
:
|	Identifier
;
Identifier
: 	<identifier> 'name' {{NameExpression}}
;
#LabeledIdentifier
#:	Identifier
#;
PrimaryExpression
:	""this"" 'thisToken' {{ThisExpression}}
|	Identifier	##
|	Literal 
|	ArrayLiteral 
|	ObjectLiteral 
|	FunctionExpression
|	ClassExpression
|	GeneratorExpression
|	RegularExpressionLiteral
|	TemplateLiteral
|	ParenthesizedExpression	# CoverParenthesizedExpressionAndArrowParameterList
;
ParenthesizedExpression
:	""("" 'leftParen' Expression "")"" 'rightParen' {{Expression}}
;
CoverParenthesizedExpressionAndArrowParameterList
:	""("" 'left' ParameterListopt "")"" 'right'	##
#|	""("" 'left' "")"" 'right'
#|	""("" 'left'   ""..."" 'ellipsis' Identifier 'varParameter' "")"" 'right'	##
#|	""("" 'left' ""..."" 'ellipsis' BindingPattern 'varParameter' "")"" 'right' 
|	""("" 'left' ParameterListopt "","" 'comma' ""..."" 'ellipsis' Identifier 'varParameter' "")"" 'right'	##
|	""("" 'left' ParameterListopt "","" 'comma' ""..."" 'ellipsis' BindingPattern 'varParameter' "")"" 'right'	##
;
ParameterListopt
:	
|	ParameterList
;
ParameterList
:	BindingElement 'parameter'
|	ParameterList "","" 'comma' BindingElement 'parameter'
;
Literal
:	NullLiteral 'value' {{NullLiteral}}
|	BooleanLiteral 'value' {{BooleanLiteral}}
|	NumericLiteral 'value' {{NumericLiteral}}
|	StringLiteral 'value' {{StringLiteral}}
;
ArrayLiteral 
:	""["" 'leftBracket' Elisionopt ""]"" 'rightBracket' {{}}
|	""["" 'leftBracket' ElementList ""]"" 'rightBracket' {{}}
|	""["" 'leftBracket' ElementList Elision ""]"" 'rightBracket' {{}}	##
;
ElementList
:	Elisionopt AssignmentExpression 'expression'
|	Elisionopt SpreadElement 'expression'
|	ElementList "","" 'comma' Elisionopt AssignmentExpression 'expression'
|	ElementList "","" 'comma' Elisionopt SpreadElement 'expression'
;
Elisionopt
:
|	Elision
;
Elision
:	"","" 'comma'
|	Elision "","" 'comma'
;
SpreadElement
:	""..."" 'ellipsis' AssignmentExpression 'expression' {{SpreadExpression}}
;
ObjectLiteral  
:	""{"" 'leftBrace' <rightBrace> 'rightBrace' {{}}
|	""{"" 'leftBrace' PropertyDefinitionList <rightBrace> 'rightBrace' {{}}
|	""{"" 'leftBrace' PropertyDefinitionList "","" 'comma' <rightBrace> 'rightBrace' {{}}
;
PropertyDefinitionList
:	PropertyDefinition 'definition'
|	PropertyDefinitionList "","" 'comma' PropertyDefinition 'definition'
;
PropertyDefinition
:	Identifier
|	CoverInitializedName
|	PropertyName 'name' "":"" 'colonToken' AssignmentExpression 'value' {{PropertyAssignment}}
|	MethodDefinition
;
PropertyName 
:	LiteralPropertyName
|	ComputedPropertyName
;
LiteralPropertyName
:	Identifier
|	StringLiteral 'name' {{NameExpression}}
|	NumericLiteral 'name' {{NameExpression}}
;
ComputedPropertyName
:	""["" 'leftBrace' AssignmentExpression 'expression' ""]"" 'rightBrace' {{}}
;
CoverInitializedName
:	Identifier 'name' Initializer {{PropertyAssignment}}	##
;
Initializeropt
:
|	Initializer
;
Initializer
:	""="" 'equalToken' AssignmentExpression 'value'
;
TemplateLiteral
:	<no_substitution_template> 'part' {{}}
|	StartTemplateLiteral <template_head> 'part' Expression 'expression' TemplateSpans {{}}
;
StartTemplateLiteral
:	{#template}
;
TemplateSpans
:	<template_end> 'part'
|	TemplateMiddleList <template_end> 'part'
;
TemplateMiddleList
:	<template_middle> 'part' Expression 'expression'
|	TemplateMiddleList <template_middle> 'part' Expression 'expression'
;
MemberExpression 
:	PrimaryExpression 
|	MemberExpression 'expression' ""["" 'leftBracket' Expression 'fieldExpression' ""]"" 'rightBracket' {{IndexedPropertyExpression}}
|	MemberExpression 'expression' ""."" 'periodToken' <identifierName> 'name' {{NamedPropertyExpression}}
|	MemberExpression 'expression' TemplateLiteral 'template' {{TaggedTemplateLiteral}}
|	SuperProperty
|	MetaProperty
|	""new"" 'newToken' MemberExpression 'expression' Arguments {{NewExpression}}
;
SuperProperty
:	""super"" 'superToken' ""["" 'leftBracket' Expression 'expression' ""]"" 'rightBracket' {{SuperIndexedPropertyExpression}}
|	""super"" 'superToken' ""."" 'periodToken' <identifierName> 'name' {{SuperNamedPropertyExpression}}
;
MetaProperty
:	NewTarget
;
NewTarget
:	""new"" 'newToken' ""."" 'periodToken' ""target"" 'targetToken' {{NewTargetExpression}}
;
NewExpression 
:	MemberExpression 
|	""new"" 'newToken' NewExpression 'expression' {{}}
;
CallExpression 
:	MemberExpression 'expression' Arguments {{}}
|	SuperCall
|	CallExpression 'expression' Arguments {{}}
|	CallExpression 'expression' ""["" 'leftBracket' Expression 'expression' ""]"" 'rightBracket' {{IndexedPropertyExpression}}
|	CallExpression 'expression' ""."" 'periodToken' <identifierName> 'name' {{NamedPropertyExpression}}
|	CallExpression 'expression' TemplateLiteral 'template'  {{TaggedTemplateLiteral}}
;
SuperCall
:	""super"" 'superToken' Arguments {{SuperCallExpression}}
;
Arguments 
:	""("" 'left' "")"" 'right'
|	""("" 'left' ArgumentList "")"" 'right'
;
ArgumentList 
:	AssignmentExpression 'argument'
|	""..."" 'ellipsis' AssignmentExpression 'varArgument'
|	ArgumentList "","" 'comma' AssignmentExpression 'argument'
|	ArgumentList "","" 'comma' ""..."" 'ellipsis' AssignmentExpression 'varArgument'
;
LeftHandSideExpression 
:	NewExpression 
|	CallExpression
;
UpdateExpression
:	LeftHandSideExpression 'expression' ""++"" 'operator' {{PostfixExpression}}
|	LeftHandSideExpression 'expression' ""--"" 'operator' {{PostfixExpression}}
|	""++"" 'operator' UnaryExpression 'expression' {{PrefixExpression}}	##
|	""--"" 'operator' UnaryExpression 'expression' {{PrefixExpression}}	##
|	LeftHandSideExpression ###
;
UnaryExpression 
:	UpdateExpression 
|	""delete"" 'operator' UnaryExpression 'expression' {{}}
|	""void"" 'operator' UnaryExpression 'expression' {{}}
|	""typeof"" 'operator' UnaryExpression 'expression' {{}}
|	""+"" 'operator' UnaryExpression 'expression' {{}}
|	""-"" 'operator' UnaryExpression 'expression' {{}}
|	""~"" 'operator' UnaryExpression 'expression' {{}} 
|	""!"" 'operator' UnaryExpression 'expression' {{}}
;
ExponentiationExpression
:	UnaryExpression
|	UnaryExpression 'leftExpression' ""**"" 'operator' ExponentiationExpression 'rightExpression' {{BinaryExpression}}
;
MultiplicativeExpression 
:	ExponentiationExpression 
|	MultiplicativeExpression 'leftExpression' ""*"" 'operator' UnaryExpression 'rightExpression' {{BinaryExpression}}
|	MultiplicativeExpression 'leftExpression' <slash> 'operator' UnaryExpression 'rightExpression' {{BinaryExpression}}
|	MultiplicativeExpression 'leftExpression' ""%"" 'operator' UnaryExpression 'rightExpression' {{BinaryExpression}}
;
AdditiveExpression 
:	MultiplicativeExpression 
|	AdditiveExpression 'leftExpression' ""+"" 'operator' MultiplicativeExpression 'rightExpression' {{BinaryExpression}}
|	AdditiveExpression 'leftExpression' ""-"" 'operator' MultiplicativeExpression 'rightExpression' {{BinaryExpression}}
;
ShiftExpression 
:	AdditiveExpression 
|	ShiftExpression 'leftExpression' ""<<"" 'operator' AdditiveExpression 'rightExpression' {{BinaryExpression}}
|	ShiftExpression 'leftExpression' "">>"" 'operator' AdditiveExpression 'rightExpression' {{BinaryExpression}}
|	ShiftExpression 'leftExpression' "">>>"" 'operator' AdditiveExpression 'rightExpression' {{BinaryExpression}}
;
RelationalExpression 
:	ShiftExpression 
|	RelationalExpression 'leftExpression' ""<"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' "">"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' ""<="" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' "">="" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' ""instanceof"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' ""in"" 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
;
EqualityExpression 
:	RelationalExpression 
|	EqualityExpression 'leftExpression' ""=="" 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
|	EqualityExpression 'leftExpression' ""!="" 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
|	EqualityExpression 'leftExpression' ""==="" 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
|	EqualityExpression 'leftExpression' ""!=="" 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
;
BitwiseANDExpression 
:	EqualityExpression 
|	BitwiseANDExpression 'leftExpression'""&"" 'operator' EqualityExpression 'rightExpression' {{BinaryExpression}}
;
BitwiseXORExpression 
:	BitwiseANDExpression 
|	BitwiseXORExpression 'leftExpression' ""^"" 'operator' BitwiseANDExpression 'rightExpression' {{BinaryExpression}}
;
BitwiseORExpression 
:	BitwiseXORExpression 
|	BitwiseORExpression 'leftExpression' ""|"" 'operator' BitwiseXORExpression 'rightExpression' {{BinaryExpression}}
;
LogicalANDExpression 
:	BitwiseORExpression 
|	LogicalANDExpression 'leftExpression' ""&&"" 'operator' BitwiseORExpression 'rightExpression' {{BinaryExpression}}
;
LogicalORExpression 
:	LogicalANDExpression 
|	LogicalORExpression 'leftExpression' ""||"" 'operator' LogicalANDExpression 'rightExpression' {{BinaryExpression}}
;
ConditionalExpression 
:	LogicalORExpression 
|	LogicalORExpression 'condition' ""?"" 'questionMarkToken' AssignmentExpression 'trueExpression' "":"" 'colonToken' AssignmentExpression 'falseExpression' {{}}
;
AssignmentExpression 
:	ConditionalExpression 
|	YieldExpression
|	ArrowFunction
|	LeftHandSideExpression 'lhs' AssignmentOperator 'operator' AssignmentExpression 'rhs' {{}}	##
;
AssignmentOperator
:	""=""	#
|	""*=""
|	<slashEqual>
|	""%=""
|	""+=""
|	""-=""
|	""<<=""
|	"">>=""
|	"">>>=""
|	""&=""
|	""^=""
|	""|=""
;
#AssignmentPattern
#:	ObjectAssignmentPattern
#|	ArrayAssignmentPattern
#;
#ObjectAssignmentPattern
#:	""{"" 'leftBrace' <rightBrace> 'rightBrace'
#|	""{"" 'leftBrace' AssignmentPropertyList <rightBrace> 'rightBrace'
#|	""{"" 'leftBrace' AssignmentPropertyList "","" 'comma' <rightBrace> 'rightBrace'
#;
#ArrayAssignmentPattern
#:	""["" 'leftBracket' Elisionopt AssignmentRestElementopt ""]"" 'rightBracket'
#|	""["" 'leftBracket' AssignmentElementList ""]"" 'rightBracket'
#|	""["" 'leftBracket' AssignmentElementList "","" 'comma' Elisionopt AssignmentRestElementopt ""]"" 'rightBracket'
#;
#AssignmentPropertyList
#:	AssignmentProperty
#|	AssignmentPropertyList AssignmentProperty
#;
#AssignmentElementList
#:	AssignmentElisionElement
#|	AssignmentElementList "","" 'comma' AssignmentElisionElement
#;
#AssignmentElisionElement
#:	Elisionopt AssignmentElement
#;
#AssignmentProperty
#:	IdentifierReference Initializeropt
#|	PropertyName "":"" 'colonToken' AssignmentElement
#;
#AssignmentElement
#:	DestructuringAssignmentTarget Initializeropt
#;
#AssignmentRestElementopt
#:
#|	AssignmentRestElement
#;
#AssignmentRestElement
#:	""..."" DestructuringAssignmentTarget
#;
#DestructuringAssignmentTarget
#:	LeftHandSideExpression
#;
Expressionopt
:
|	Expression
;
Expression
:	AssignmentExpression
|	Expression 'expression' "","" 'comma' AssignmentExpression 'expression' {{CommaExpression}}
;
#A.3 Statements
Statement 
:	BlockStatement
|	VariableStatement 
|	EmptyStatement 
|	ExpressionStatement 
|	IfStatement 
|	BreakableStatement
|	ContinueStatement 
|	BreakStatement 
|	ReturnStatement 
|	WithStatement 
|	LabelledStatement
|	ThrowStatement 
|	TryStatement 
|	DebuggerStatement
;
Declaration
:	HoistableDeclaration
|	ClassDeclaration
|	LexicalDeclaration
;
HoistableDeclaration
:	FunctionDeclaration
|	GeneratorDeclaration
;
BreakableStatement
:	IterationStatement 
|	SwitchStatement
;
BlockStatement
:	Block
;
Block 
:	""{"" 'leftBrace' StatementListopt <rightBrace> 'rightBrace' {{BlockStatement}}
;
StatementListopt
:
|	StatementList
;
StatementList 
:	StatementListItem 'statement'
|	StatementList StatementListItem 'statement'
;
StatementListItem
:	Statement
|	LexicalDeclaration #Declaration
;
LexicalDeclaration
:	LetOrConst 'typeToken' BindingList <semicolon> 'semicolon' {{}}
;
LetOrConst
:	""let""
|	""const""
;
BindingList
:	LexicalBinding 'binding'
|	BindingList "","" 'comma' LexicalBinding 'binding'
;
LexicalBinding
:	Identifier 'variable' Initializeropt {{VariableDeclaration}}	##
|	BindingPattern 'pattern' Initializer {{VariablePatternDeclaration}}
;
VariableStatement 
:	""var"" 'varToken' VariableDeclarationList <semicolon> 'semicolon' {{}}
;
VariableDeclarationList 
:	VariableDeclaration 'variable'
|	VariableDeclarationList "","" 'comma' VariableDeclaration 'variable'
;
VariableDeclaration 
:	Identifier 'variable' Initializeropt {{VariableDeclaration}}	##
|	BindingPattern 'pattern' Initializer {{VariablePatternDeclaration}}
;
BindingPattern
:	ObjectBindingPattern
|	ArrayBindingPattern
;
ObjectBindingPattern
:	""{"" 'leftBrace' <rightBrace> 'rightBrace' {{}}
|	""{"" 'leftBrace' BindingPropertyList <rightBrace> 'rightBrace' {{}}
|	""{"" 'leftBrace' BindingPropertyList "","" 'comma' <rightBrace> 'rightBrace' {{}}
;
ArrayBindingPattern
:	""["" 'leftBracket' Elisionopt BindingRestElementopt 'restElement' ""]"" 'rightBracket' {{}}
|	""["" 'leftBracket' BindingElementList ""]"" 'rightBracket' {{}}
|	""["" 'leftBracket' BindingElementList "","" 'comma' Elisionopt BindingRestElementopt 'restElement' ""]"" 'rightBracket' {{}}
;
BindingPropertyList
:	BindingProperty 'property'
|	BindingPropertyList "","" 'comma' BindingProperty 'property'
;
BindingElementList
:	BindingElisionElement 
|	BindingElementList "","" 'comma' BindingElisionElement 
;
BindingElisionElement
:	Elisionopt BindingElement 'element'
;
BindingProperty
:	SingleNameBinding
|	PropertyName 'name' "":"" 'colonToken' BindingElement 'element' {{}}
;
BindingElement
:	SingleNameBinding
|	BindingPattern 'variable' Initializeropt {{VariableDeclaration}}
;
SingleNameBinding
:	Identifier 'variable' Initializeropt {{VariableDeclaration}}	##
;
BindingRestElementopt
:
|	BindingRestElement
;
BindingRestElement
:	""..."" 'ellipsis' Identifier 'variable' {{RestVariableDeclaration}}	##
|	""..."" 'ellipsis' BindingPattern 'variable' {{RestVariableDeclaration}}
;
EmptyStatement 
:	<semicolon> 'semicolon' {{}}
;
ExpressionStatement 
:	Expression 'expression' <semicolon> 'semicolon' {{}}
;
IfStatement 
:	""if"" 'ifToken' ""("" 'left' Expression 'expression' "")"" 'right' Statement 'trueStatement' ""else"" 'elseToken' Statement 'elseStatement' {{}}
|	""if"" 'ifToken' ""("" 'left' Expression 'expression' "")"" 'right' Statement 'trueStatement' {{}}
;
IterationStatement 
:	""do"" 'doToken' Statement 'statement' ""while"" 'whileToken' ""("" 'left' Expression 'expression' "")"" 'right' <semicolon> 'semicolon' {{DoWhileStatement}}
|	""while"" 'whileToken' ""("" 'left' Expression 'expression' "")"" 'right' Statement 'statement' {{WhileStatement}}
|	""for"" 'forToken' ""("" 'left' Expressionopt 'initialExpression'<semicolon> 'semicolon' Expressionopt 'condition'<semicolon> 'semicolon' Expressionopt 'iteratorExpression' "")"" 'right' Statement 'statement' {{ForStatement}}
|	""for"" 'forToken' ""("" 'left' ""var"" 'varToken' VariableDeclarationList <semicolon> 'semicolon' Expressionopt 'condition' <semicolon> 'semicolon' Expressionopt 'iteratorExpression' "")"" 'right' Statement 'statement' {{ForStatement}}
|	""for"" 'forToken' ""("" 'left' LexicalDeclaration 'declaration' Expressionopt 'condition' <semicolon> 'semicolon' Expressionopt 'iteratorExpression' "")"" 'right' Statement 'statement' {{ForStatement}}
|	""for"" 'forToken' ""("" 'left' LeftHandSideExpression 'variable' ""in"" 'inToken' Expression 'expression' "")"" 'right' Statement 'statement' {{ForInStatement}}
|	""for"" 'forToken' ""("" 'left' ""var"" 'varToken' ForBinding 'variable' ""in"" 'inToken' Expression 'expression' "")"" 'right' Statement  'statement' {{ForInStatement}}
|	""for"" 'forToken' ""("" 'left' ForDeclaration ""in"" 'inToken' Expression 'expression' "")"" 'right' Statement  'statement' {{ForInStatement}}
|	""for"" 'forToken' ""("" 'left' LeftHandSideExpression 'variable' ""of"" 'ofToken' Expression 'expression' "")"" 'right' Statement 'statement' {{ForOfStatement}}
|	""for"" 'forToken' ""("" 'left' ""var"" 'varToken' VariableDeclaration 'variable' ""of"" 'ofToken' Expression 'expression' "")"" 'right' Statement  'statement' {{ForOfStatement}}
|	""for"" 'forToken' ""("" 'left' ForDeclaration ""of"" 'ofToken' Expression 'expression' "")"" 'right' Statement  'statement' {{ForOfStatement}}
;
ForDeclaration
:	LetOrConst 'varToken' ForBinding 'variable'
;
ForBinding
:	Identifier	##
|	BindingPattern
;
ContinueStatement 
:	""continue"" 'continueToken' CheckEOL Identifieropt 'label' <semicolon> 'semicolon' {{}}
;
BreakStatement 
:	""break"" 'breakToken' CheckEOL Identifieropt 'label' <semicolon> 'semicolon' {{}}
;
CheckEOL
:	{self checkEOL. nil}
;
ReturnStatement  
:	""return"" 'returnToken' CheckEOL Expressionopt 'expression' <semicolon> 'semicolon' {{}}
;
WithStatement 
:	""with"" 'withToken' ""("" 'left' Expression 'expression' "")"" 'right' Statement 'statement' {{}}
;
SwitchStatement 
:	""switch"" 'switchToken' ""("" 'left' Expression 'expression' "")"" 'right' CaseBlock {{}}
;
CaseBlock 
:	""{"" 'leftBrace' CaseClausesopt <rightBrace> 'rightBrace' 
|	""{"" 'leftBrace' CaseClausesopt DefaultClause 'clause' CaseClausesopt <rightBrace> 'rightBrace'
;
CaseClausesopt
:
|	CaseClauses
;
CaseClauses 
:	CaseClause 'clause'
|	CaseClauses CaseClause 'clause'
;
CaseClause 
:	""case"" 'caseToken' Expression 'caseExpression' "":"" 'colonToken' StatementListopt {{}}
;
DefaultClause 
:	""default"" 'defaultToken' "":"" 'colonToken' StatementListopt  {{}}
;
LabelledStatement 
:	<identifier> 'label' "":"" 'colonToken' LabeledItem 'statement' {{}}	##
;
LabeledItem
:	Statement
#|	FunctionDeclaration	#Statement already does FunctionExpression
;
ThrowStatement 
:	""throw"" 'throwToken' Expression 'expression' <semicolon> 'semicolon' {{}}
;
TryStatement 
:	""try"" 'tryToken' Block 'tryBlock' Catch {{}}
|	""try"" 'tryToken' Block 'tryBlock' Finally {{}}
|	""try"" 'tryToken' Block 'tryBlock' Catch Finally {{}}
;
Catch 
:	""catch"" 'catchToken' ""("" 'left' CatchParameter 'exceptionType' "")"" 'right' Block 'catchBlock'
;
Finally 
:	""finally"" 'finallyToken' Block 'finallyBlock'
;
CatchParameter
:	Identifier	##
|	BindingPattern
;
DebuggerStatement 
:	""debugger"" 'debuggerToken' <semicolon> 'semicolon' {{}}
;
#A.4
FunctionDeclaration 
:	""function"" 'functionToken' Identifieropt 'name' ""("" 'left' FormalParameters "")"" 'right' ""{"" 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{Function}}	##
;
FunctionExpression 
:	""function"" 'functionToken' Identifieropt 'name' ""("" 'left' FormalParameters "")"" 'right' ""{"" 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{Function}}	##
;
StrictFormalParameters
:	FormalParameters
;
FormalParameters
:
|	FormalParameterList
;
FormalParameterList 
:	FunctionRestParameter 'restParameter'
|	FormalsList
|	FormalsList "","" 'comma' FunctionRestParameter 'restParameter'
;
FormalsList
:	FormalParameter 'parameter'
| 	FormalsList "","" 'comma' FormalParameter 'parameter'
;
FunctionRestParameter
:	BindingRestElement
;
FormalParameter
:	BindingElement
;
FunctionBody 
:	FunctionStatementList
;
FunctionStatementList
:	StatementListopt
;
ArrowFunction
:	ArrowParameters ""=>"" 'arrow' ConciseBody {{}}
;
ArrowParameters
:	Identifier 'parameter'	##
|	CoverParenthesizedExpressionAndArrowParameterList
;
ConciseBody
:	AssignmentExpression 'statement'
|	""{"" 'leftBracket' FunctionBody <rightBrace> 'rightBracket'
;
MethodDefinition
:	PropertyName 'name' ""("" 'left' StrictFormalParameters "")"" 'right' ""{"" 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{}}
|	GeneratorMethod
|	""get"" 'getToken' PropertyName 'name' ""("" 'left' "")"" 'right' ""{"" 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{GetMethodDefinition}}
|	""set"" 'setToken' PropertyName 'name' ""("" 'left' PropertySetParameterList "")"" 'right' ""{"" 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{SetMethodDefinition}}
;
PropertySetParameterList
:	FormalParameter 'parameter'
;
GeneratorMethod
:	""*"" 'star' PropertyName 'name' ""("" 'left' StrictFormalParameters "")"" 'right' ""{"" 'leftBrace' GeneratorBody <rightBrace> 'rightBrace' {{GeneratorMethodDefinition}}
;
GeneratorDeclaration
:	""function"" 'functionToken' ""*"" 'star' Identifieropt 'name' ""("" 'left' FormalParameters "")"" 'right' ""{"" 'leftBrace' GeneratorBody <rightBrace> 'rightBrace' {{GeneratorFunction}}	##
;
GeneratorExpression
:	""function"" 'functionToken' ""*"" 'star' Identifieropt 'name' ""("" 'left' FormalParameters "")"" 'right' ""{"" 'leftBrace' GeneratorBody <rightBrace> 'rightBrace' {{GeneratorFunction}}	##
;
GeneratorBody
:	FunctionBody
;
YieldExpression
:	""yield"" 'yieldToken'  staropt AssignmentExpression 'expression' {{}}
;
staropt
:
|	""*"" 'star'
;
ClassDeclaration
:	""class"" 'classToken' Identifieropt 'name' ClassTail {{ClassExpression}}	##
;
ClassExpression
:	""class"" 'classToken' Identifieropt 'name' ClassTail {{}}	##
;
ClassTail
:	ClassHeritageopt ""{"" 'leftBrace' ClassBodyopt <rightBrace> 'rightBrace'
;
ClassHeritageopt
:
|	ClassHeritage
;
ClassHeritage
:	""extends"" 'extendsToken' LeftHandSideExpression 'superclass'
;
ClassBodyopt
:
|	ClassBody
;
ClassBody
:	ClassElementList
;
ClassElementList
:	ClassElement 'element'
|	ClassElementList ClassElement 'element'
;
ClassElement
:	MethodDefinition
|	""static"" 'staticToken' MethodDefinition 'method' {{StaticMethodDefinition}}
|	<semicolon> 'semicolon' {{EmptyStatement}}
;
#A.5
Script
:	ScriptBodyopt {{}}
;
ScriptBodyopt
:
|	ScriptBody
;
ScriptBody
:	StatementList
;
Module
:	ModuleBodyopt {{}}
;
ModuleBodyopt
:
|	ModuleBody
;
ModuleBody
:	ModuleItemList
;
ModuleItemList
:	ModuleItem 'item'
|	ModuleItemList ModuleItem 'item'
;
ModuleItem
:	ImportDeclaration
|	ExportDeclaration
|	StatementListItem
;
ImportDeclaration
:	""import"" 'importToken' ImportClause FromClause <semicolon> 'semicolon' {{}}
|	""import"" 'importToken' ModuleSpecifier <semicolon> 'semicolon' {{}}
;
ImportClause
:	ImportedDefaultBinding 'import'
|	NameSpaceImport 'import'
|	NamedImports 'import'
|	ImportedDefaultBinding 'import' "","" 'comma' NameSpaceImport 'import'
|	ImportedDefaultBinding 'import' "","" 'comma' NamedImports 'import'
;
ImportedDefaultBinding
:	ImportedBinding
;
NameSpaceImport
:	""*"" 'star' ""as"" 'asToken' ImportedBinding 'import' {{}}
;
NamedImports
:	""{"" 'leftBrace' <rightBrace> 'rightBrace' {{}}
|	""{"" 'leftBrace' ImportsList <rightBrace> 'rightBrace' {{}}
|	""{"" 'leftBrace' ImportsList "","" 'comma' <rightBrace> 'rightBrace' {{}}
;
FromClause
:	""from"" 'fromToken' ModuleSpecifier 'from'
;
ImportsList
:	ImportSpecifier 'specifier'
|	ImportsList "","" 'comma' ImportSpecifier 'specifier'
;
ImportSpecifier
:	ImportedBinding 'binding' {{}}
|	<identifierName> 'name' ""as"" 'asToken' ImportedBinding 'binding' {{}}
;
ModuleSpecifier
:	StringLiteral 'import'
;
ImportedBinding
:	Identifier	##
;
ExportDeclaration
:	""export"" 'exportToken' ""*"" 'star' FromClause <semicolon> 'semicolon' {{}}
|	""export"" 'exportToken' ExportClause FromClause <semicolon> 'semicolon' {{}}
|	""export"" 'exportToken' ExportClause <semicolon> 'semicolon' {{}}
|	""export"" 'exportToken' VariableStatement 'statement' {{}}
|	""export"" 'exportToken' Declaration 'declaration' {{}}
#|	""export"" 'exportToken' ""default"" 'defaultToken' HoistableDeclaration 'declaration' {{}}	#handled by AssignmentExpression version below
#|	""export"" 'exportToken' ""default"" 'defaultToken' ClassDeclaration 'declaration' {{}}	#handled by AssignmentExpression version below
|	""export"" 'exportToken' ""default"" 'defaultToken' AssignmentExpression 'statement'<semicolon> 'semicolon' {{}}
;
ExportClause
:	""{"" 'leftBrace' <rightBrace> 'rightBrace'
|	""{"" 'leftBrace' ExportsList <rightBrace> 'rightBrace'
|	""{"" 'leftBrace' ExportsList "","" 'comma' <rightBrace> 'rightBrace'
;
ExportsList
:	ExportSpecifier 'specifier'
|	ExportsList "","" 'comma' ExportSpecifier 'specifier'
;
ExportSpecifier
:	<identifierName> 'name' {{}}
|	<identifierName> 'name' ""as"" 'asToken' <identifierName> 'as' {{}}
;


NullLiteral
:	""null""
;
BooleanLiteral
:	""true""
|	""false""
;
StringLiteral
:	<string>
;
NumericLiteral
:	<numeric>
;
RegularExpressionLiteral
:	<regular_expression> 'value' {{RegularExpressionLiteral}}
;"
]

{ #category : #'file types' }
JSParser class >> fileExtension [
	^ '.js'
]

{ #category : #'file types' }
JSParser class >> fileExtensionType [
	^ 'Javascript files'
]

{ #category : #private }
JSParser class >> keywords [
	^ keywords
		ifNil:
			[ keywords := #(#break #case #catch #continue #debugger #delete #do #else #finally #for #function #if #in #instanceof #typeof #new #var #return #void #switch #while #this #with #throw #try)
				asSet collect: [ :each | each asString ] ]
]

{ #category : #'generated-accessing' }
JSParser class >> scannerClass [
	^JSScanner
]

{ #category : #generated }
JSParser class >> startingStateForExpression [
	^ 2
]

{ #category : #generated }
JSParser class >> startingStateForModule [
	^ 5
]

{ #category : #generated }
JSParser class >> startingStateForScript [
	^ 4
]

{ #category : #generated }
JSParser class >> startingStateForStatement [
	^ 3
]

{ #category : #generated }
JSParser class >> startingStateForgoal [
	^ 1
]

{ #category : #private }
JSParser >> actionsForCurrentToken [
	| actions |
	actions := super actionsForCurrentToken.
	(currentToken ids first ~= scanner identifierId
		and: [ (currentToken ids includes: scanner identifierId) and: [ (self keywords includes: currentToken value) not ] ])
		ifTrue: [ self addActionsFor: scanner identifierId to: actions ].
	(currentToken ids first ~= scanner identifierNameId and: [ currentToken ids includes: scanner identifierNameId ])
		ifTrue: [ self addActionsFor: scanner identifierNameId to: actions ].
	(currentToken ids first == scanner regular_expressionId and: [ actions isEmpty ])
		ifTrue: [ (currentToken value at: 2) == $=
				ifTrue: [ currentToken := scanner tokenClass value: '/=' start: currentToken startPosition ids: (Array with: scanner slashEqualId).
					self position: currentToken startPosition + 1 ]
				ifFalse: [ currentToken := scanner tokenClass value: '/' start: currentToken startPosition ids: (Array with: scanner slashId).
					self position: currentToken startPosition ].
			^ self actionsForCurrentToken ].
	(actions isEmpty and: [ ((currentState attributeNamed: #lastInsertedSemicolonPosition) ifNil: [ -1 ]) < scanner position ])
		ifTrue: [ self addActionsFor: self scanner semicolonId to: actions.
			actions notEmpty
				ifTrue: [ currentState attributeNamed: #lastInsertedSemicolonPosition put: scanner position.
					self position: currentToken startPosition - 1.
					currentToken := currentToken class value: ';' start: nil ids: (Array with: self scanner semicolonId) ] ].
	actions isEmpty
		ifTrue: [ (currentToken ids includes: scanner rightBraceId)
				ifTrue: [ | i scannerState stackItem |
					i := nodeStack size.
					scannerState := nil.
					[ i > 0 and: [ scannerState isNil ] ]
						whileTrue: [ stackItem := nodeStack at: i.
							stackItem = #template
								ifTrue: [ scannerState := stackItem ].
							i := i - 1 ].
					scannerState notNil
						ifTrue: [ self scope: scannerState.
							self position: currentToken startPosition - 1.
							currentToken := nil.
							self getNextToken.
							self scope: #default.
							(currentToken ids includes: scanner rightBraceId)
								ifTrue: [ ^ actions ].
							^ self actionsForCurrentToken ] ] ].
	^ actions
]

{ #category : #generated }
JSParser >> ambiguousTransitions [
^#(
#[ 0 54 3 109] 
#[ 0 62 3 169] 
#[ 0 82 0 254] 
#[ 0 82 4 201] 
#[ 1 2 4 221] 
#[ 0 22 0 25] 
#[ 0 22 0 29] 
#[ 0 22 0 33] 
#[ 0 22 0 37] 
#[ 0 22 0 41] 
#[ 0 22 0 45] 
#[ 0 22 0 49] 
#[ 0 22 0 57] 
#[ 0 22 0 73] 
#[ 0 22 0 85] 
#[ 0 22 0 93] 
#[ 0 22 0 109] 
#[ 0 22 0 113] 
#[ 0 22 0 121] 
#[ 0 22 0 129] 
#[ 0 22 0 137] 
#[ 0 22 0 145] 
#[ 0 22 0 153] 
#[ 0 22 0 165] 
#[ 0 22 1 237] 
#[ 0 22 0 173] 
#[ 0 22 1 241] 
#[ 0 22 0 185] 
#[ 0 22 0 189] 
#[ 0 22 0 193] 
#[ 0 22 0 197] 
#[ 0 6 0 22] 
#[ 0 82 1 98] 
#[ 0 82 1 102] 
#[ 0 226 1 122] 
#[ 0 230 1 122] 
#[ 1 162 4 249] 
#[ 1 94 1 170] 
#[ 0 254 1 102] 
#[ 1 22 2 97] 
#[ 0 114 7 109] 
#[ 1 186 2 58] 
#[ 0 82 3 98]
	).
]

{ #category : #private }
JSParser >> checkEOL [
	| stackTop position |
	(self isEOFToken or: [ currentToken ids includes: scanner semicolonId ])
		ifTrue: [ ^ self ].
	nodeStack isEmpty
		ifTrue: [ ^ self ].
	stackTop := nodeStack last.
	position := [ ((stackTop isKindOf: SmaCCToken)
		ifTrue: [ stackTop ]
		ifFalse: [ (stackTop isKindOf: SmaCCDeferredChoice)
				ifTrue: [ stackTop possibleItems first ] ]) stopPosition ]
		on: Error
		do: [ :ex | currentToken startPosition ].
	(scanner hasNewlineBetween: position and: currentToken startPosition)
		ifTrue: [ currentState attributeNamed: #lastInsertedSemicolonPosition put: scanner position.
			self position: currentToken startPosition - 1.
			currentToken := currentToken class value: ';' start: nil ids: (Array with: self scanner semicolonId) ]
]

{ #category : #private }
JSParser >> handleError: anInteger [
	(currentToken value = ';' and: [ currentToken startPosition isNil ])
		ifTrue: [ currentToken := nil.
			self getNextToken ].
	^ super handleError: anInteger
]

{ #category : #private }
JSParser >> keywords [
	^ self class keywords
]

{ #category : #private }
JSParser >> performReduceMethod: aSymbol with: items [
	^ (states size > 1
		and: [ items isEmpty
				and: [ (aSymbol beginsWith: 'reduceActionForStartTemplateLiteral') or: [ aSymbol beginsWith: 'reduceActionForCheckEOL' ] ] ])
		ifTrue: [ self perform: aSymbol with: items ]
		ifFalse: [ super performReduceMethod: aSymbol with: items ]
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArgumentList1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArgumentList2: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 2).
	self add: (nodes at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArgumentList3: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArgumentList4: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	self add: (nodes at: 3) to: (result at: 2).
	self add: (nodes at: 4) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArguments1: nodes [
	| result |
	result := Array new: 6.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArguments2: nodes [
	| result |
	result := Array new: 6.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 6).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrayBindingPattern1: nodes [
	| result |
	result := JSArrayBindingPatternNode new.
	result leftBracket: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result commas.
	result restElement: (nodes at: 3).
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrayBindingPattern2: nodes [
	| result |
	result := JSArrayBindingPatternNode new.
	result leftBracket: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result commas.
	result addNodes: ((nodes at: 2) at: 2) to: result elements.
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrayBindingPattern3: nodes [
	| result |
	result := JSArrayBindingPatternNode new.
	result leftBracket: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result commas.
	result addNodes: ((nodes at: 2) at: 2) to: result elements.
	result addToken: (nodes at: 3) to: result commas.
	result addTokens: (nodes at: 4) to: result commas.
	result restElement: (nodes at: 5).
	result rightBracket: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrayLiteral1: nodes [
	| result |
	result := JSArrayLiteralNode new.
	result leftBracket: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result commas.
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrayLiteral2: nodes [
	| result |
	result := JSArrayLiteralNode new.
	result leftBracket: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result commas.
	result addNodes: ((nodes at: 2) at: 2) to: result expressions.
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrayLiteral3: nodes [
	| result |
	result := JSArrayLiteralNode new.
	result leftBracket: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result commas.
	result addNodes: ((nodes at: 2) at: 2) to: result expressions.
	result addTokens: (nodes at: 3) to: result commas.
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrowFunction1: nodes [
	| result |
	result := JSArrowFunctionNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result parameters.
	result left: ((nodes at: 1) at: 2).
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result right: ((nodes at: 1) at: 4).
	result ellipsis: ((nodes at: 1) at: 5).
	result varParameter: ((nodes at: 1) at: 6).
	result arrow: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result statements.
	result leftBracket: ((nodes at: 3) at: 2).
	result rightBracket: ((nodes at: 3) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrowParameters1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForArrowParameters2: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 2 put: ((nodes at: 1) at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	result at: 5 put: ((nodes at: 1) at: 5).
	result at: 6 put: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForAssignmentExpression4: nodes [
	| result |
	result := JSAssignmentExpressionNode new.
	result lhs: (nodes at: 1).
	result operator: (nodes at: 2).
	result rhs: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBindingElementList1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBindingElementList2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBindingElisionElement1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBindingProperty2: nodes [
	| result |
	result := JSBindingPropertyNode new.
	result name: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result element: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBindingRestElement1: nodes [
	| result |
	result := JSRestVariableDeclarationNode new.
	result ellipsis: (nodes at: 1).
	result variable: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBlock1: nodes [
	| result |
	result := JSBlockStatementNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForBreakStatement1: nodes [
	| result |
	result := JSBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result label: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCallExpression1: nodes [
	| result |
	result := JSCallExpressionNode new.
	result expression: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result right: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 2) at: 3) to: result arguments.
	result addTokens: ((nodes at: 2) at: 4) to: result ellipsises.
	result addNodes: ((nodes at: 2) at: 5) to: result varArguments.
	result addTokens: ((nodes at: 2) at: 6) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCallExpression4: nodes [
	| result |
	result := JSIndexedPropertyExpressionNode new.
	result addNode: (nodes at: 1) to: result expressions.
	result leftBracket: (nodes at: 2).
	result addNode: (nodes at: 3) to: result expressions.
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCaseBlock1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCaseBlock2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 2).
	self addAll: (nodes at: 4) to: (result at: 2).
	result at: 3 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCaseClause1: nodes [
	| result |
	result := JSCaseClauseNode new.
	result caseToken: (nodes at: 1).
	result caseExpression: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCatch1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCheckEOL1: nodes [
	self checkEOL.
	^ nil
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForClassElement2: nodes [
	| result |
	result := JSStaticMethodDefinitionNode new.
	result staticToken: (nodes at: 1).
	result method: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForClassExpression1: nodes [
	| result |
	result := JSClassExpressionNode new.
	result classToken: (nodes at: 1).
	result name: (nodes at: 2).
	result extendsToken: ((nodes at: 3) at: 1).
	result superclass: ((nodes at: 3) at: 2).
	result leftBrace: ((nodes at: 3) at: 3).
	result addNodes: ((nodes at: 3) at: 4) to: result elements.
	result rightBrace: ((nodes at: 3) at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForClassTail1: nodes [
	| result |
	result := Array new: 5.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: (nodes at: 2).
	self addAll: (nodes at: 3) to: (result at: 4).
	result at: 5 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForComputedPropertyName1: nodes [
	| result |
	result := JSComputedPropertyNameNode new.
	result leftBrace: (nodes at: 1).
	result expression: (nodes at: 2).
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForConciseBody1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForConciseBody2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 1).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForConditionalExpression2: nodes [
	| result |
	result := JSConditionalExpressionNode new.
	result condition: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result trueExpression: (nodes at: 3).
	result colonToken: (nodes at: 4).
	result falseExpression: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForContinueStatement1: nodes [
	| result |
	result := JSContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result label: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCoverInitializedName1: nodes [
	| result |
	result := JSPropertyAssignmentNode new.
	result name: (nodes at: 1).
	result equalToken: ((nodes at: 2) at: 1).
	result value: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCoverParenthesizedExpressionAndArrowParameterList1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForCoverParenthesizedExpressionAndArrowParameterList2: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 5 put: (nodes at: 4).
	result at: 6 put: (nodes at: 5).
	result at: 4 put: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForDebuggerStatement1: nodes [
	| result |
	result := JSDebuggerStatementNode new.
	result debuggerToken: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForDefaultClause1: nodes [
	| result |
	result := JSDefaultClauseNode new.
	result defaultToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForElementList2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForElementList4: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self addAll: (nodes at: 3) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForEmptyStatement1: nodes [
	| result |
	result := JSEmptyStatementNode new.
	result semicolon: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExponentiationExpression2: nodes [
	| result |
	result := JSBinaryExpressionNode new.
	result leftExpression: (nodes at: 1).
	result operator: (nodes at: 2).
	result rightExpression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportClause1: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportClause2: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportClause3: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	self add: (nodes at: 3) to: (result at: 4).
	result at: 2 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportDeclaration1: nodes [
	| result |
	result := JSExportDeclarationNode new.
	result exportToken: (nodes at: 1).
	result star: (nodes at: 2).
	result fromToken: ((nodes at: 3) at: 1).
	result from: ((nodes at: 3) at: 2).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportDeclaration2: nodes [
	| result |
	result := JSExportDeclarationNode new.
	result exportToken: (nodes at: 1).
	result leftBrace: ((nodes at: 2) at: 1).
	result rightBrace: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 2) at: 3) to: result specifiers.
	result addTokens: ((nodes at: 2) at: 4) to: result commas.
	result fromToken: ((nodes at: 3) at: 1).
	result from: ((nodes at: 3) at: 2).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportDeclaration3: nodes [
	| result |
	result := JSExportDeclarationNode new.
	result exportToken: (nodes at: 1).
	result leftBrace: ((nodes at: 2) at: 1).
	result rightBrace: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 2) at: 3) to: result specifiers.
	result addTokens: ((nodes at: 2) at: 4) to: result commas.
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportDeclaration4: nodes [
	| result |
	result := JSExportDeclarationNode new.
	result exportToken: (nodes at: 1).
	result statement: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportDeclaration5: nodes [
	| result |
	result := JSExportDeclarationNode new.
	result exportToken: (nodes at: 1).
	result declaration: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportDeclaration6: nodes [
	| result |
	result := JSExportDeclarationNode new.
	result exportToken: (nodes at: 1).
	result defaultToken: (nodes at: 2).
	result statement: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportSpecifier1: nodes [
	| result |
	result := JSExportSpecifierNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExportSpecifier2: nodes [
	| result |
	result := JSExportSpecifierNode new.
	result name: (nodes at: 1).
	result asToken: (nodes at: 2).
	result _as: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExpression2: nodes [
	| result |
	result := JSCommaExpressionNode new.
	result addNode: (nodes at: 1) to: result expressions.
	result comma: (nodes at: 2).
	result addNode: (nodes at: 3) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForExpressionStatement1: nodes [
	| result |
	result := JSExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForFormalParameterList1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForFormalParameterList2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForFormalParameterList3: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 3).
	self add: (nodes at: 2) to: (result at: 3).
	result at: 1 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForFormalParameters1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForFunctionExpression1: nodes [
	| result |
	result := JSFunctionNode new.
	result functionToken: (nodes at: 1).
	result name: (nodes at: 2).
	result left: (nodes at: 3).
	result restParameter: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result parameters.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result right: (nodes at: 5).
	result leftBrace: (nodes at: 6).
	result addNodes: (nodes at: 7) to: result statements.
	result rightBrace: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForGeneratorExpression1: nodes [
	| result |
	result := JSGeneratorFunctionNode new.
	result functionToken: (nodes at: 1).
	result star: (nodes at: 2).
	result name: (nodes at: 3).
	result left: (nodes at: 4).
	result restParameter: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result parameters.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result right: (nodes at: 6).
	result leftBrace: (nodes at: 7).
	result addNodes: (nodes at: 8) to: result statements.
	result rightBrace: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForGeneratorMethod1: nodes [
	| result |
	result := JSGeneratorMethodDefinitionNode new.
	result star: (nodes at: 1).
	result name: (nodes at: 2).
	result left: (nodes at: 3).
	result restParameter: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result parameters.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result right: (nodes at: 5).
	result leftBrace: (nodes at: 6).
	result addNodes: (nodes at: 7) to: result statements.
	result rightBrace: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIdentifier1: nodes [
	| result |
	result := JSNameExpressionNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIfStatement1: nodes [
	| result |
	result := JSIfStatementNode new.
	result ifToken: (nodes at: 1).
	result left: (nodes at: 2).
	result expression: (nodes at: 3).
	result right: (nodes at: 4).
	result trueStatement: (nodes at: 5).
	result elseToken: (nodes at: 6).
	result elseStatement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIfStatement2: nodes [
	| result |
	result := JSIfStatementNode new.
	result ifToken: (nodes at: 1).
	result left: (nodes at: 2).
	result expression: (nodes at: 3).
	result right: (nodes at: 4).
	result trueStatement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForImportClause1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForImportClause4: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForImportDeclaration1: nodes [
	| result |
	result := JSImportDeclarationNode new.
	result importToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result imports.
	result comma: ((nodes at: 2) at: 2).
	result fromToken: ((nodes at: 3) at: 1).
	result from: ((nodes at: 3) at: 2).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForImportDeclaration2: nodes [
	| result |
	result := JSImportDeclarationNode new.
	result importToken: (nodes at: 1).
	result addObject: (nodes at: 2) to: result imports.
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForImportSpecifier1: nodes [
	| result |
	result := JSImportSpecifierNode new.
	result binding: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForImportSpecifier2: nodes [
	| result |
	result := JSImportSpecifierNode new.
	result name: (nodes at: 1).
	result asToken: (nodes at: 2).
	result binding: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForInitializer1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForInitializeropt1: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement10: nodes [
	| result |
	result := JSForOfStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result varToken: (nodes at: 3).
	result variable: (nodes at: 4).
	result ofToken: (nodes at: 5).
	result expression: (nodes at: 6).
	result right: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement11: nodes [
	| result |
	result := JSForOfStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result varToken: ((nodes at: 3) at: 1).
	result variable: ((nodes at: 3) at: 2).
	result ofToken: (nodes at: 4).
	result expression: (nodes at: 5).
	result right: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement1: nodes [
	| result |
	result := JSDoWhileStatementNode new.
	result doToken: (nodes at: 1).
	result statement: (nodes at: 2).
	result whileToken: (nodes at: 3).
	result left: (nodes at: 4).
	result expression: (nodes at: 5).
	result right: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement2: nodes [
	| result |
	result := JSWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result left: (nodes at: 2).
	result expression: (nodes at: 3).
	result right: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement3: nodes [
	| result |
	result := JSForStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result initialExpression: (nodes at: 3).
	result addToken: (nodes at: 4) to: result semicolons.
	result condition: (nodes at: 5).
	result addToken: (nodes at: 6) to: result semicolons.
	result iteratorExpression: (nodes at: 7).
	result right: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement4: nodes [
	| result |
	result := JSForStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result varToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result variables.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: (nodes at: 5) to: result semicolons.
	result condition: (nodes at: 6).
	result addToken: (nodes at: 7) to: result semicolons.
	result iteratorExpression: (nodes at: 8).
	result right: (nodes at: 9).
	result statement: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement5: nodes [
	| result |
	result := JSForStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result declaration: (nodes at: 3).
	result condition: (nodes at: 4).
	result addToken: (nodes at: 5) to: result semicolons.
	result iteratorExpression: (nodes at: 6).
	result right: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement6: nodes [
	| result |
	result := JSForInStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result variable: (nodes at: 3).
	result inToken: (nodes at: 4).
	result expression: (nodes at: 5).
	result right: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement7: nodes [
	| result |
	result := JSForInStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result varToken: (nodes at: 3).
	result variable: (nodes at: 4).
	result inToken: (nodes at: 5).
	result expression: (nodes at: 6).
	result right: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement8: nodes [
	| result |
	result := JSForInStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result varToken: ((nodes at: 3) at: 1).
	result variable: ((nodes at: 3) at: 2).
	result inToken: (nodes at: 4).
	result expression: (nodes at: 5).
	result right: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForIterationStatement9: nodes [
	| result |
	result := JSForOfStatementNode new.
	result forToken: (nodes at: 1).
	result left: (nodes at: 2).
	result variable: (nodes at: 3).
	result ofToken: (nodes at: 4).
	result expression: (nodes at: 5).
	result right: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLabelledStatement1: nodes [
	| result |
	result := JSLabelledStatementNode new.
	result label: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLexicalDeclaration1: nodes [
	| result |
	result := JSLexicalDeclarationNode new.
	result typeToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result bindings.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLiteral1: nodes [
	| result |
	result := JSNullLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLiteral2: nodes [
	| result |
	result := JSBooleanLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLiteral3: nodes [
	| result |
	result := JSNumericLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForLiteral4: nodes [
	| result |
	result := JSStringLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMemberExpression2: nodes [
	| result |
	result := JSIndexedPropertyExpressionNode new.
	result addNode: (nodes at: 1) to: result expressions.
	result leftBracket: (nodes at: 2).
	result fieldExpression: (nodes at: 3).
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMemberExpression3: nodes [
	| result |
	result := JSNamedPropertyExpressionNode new.
	result expression: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMemberExpression4: nodes [
	| result |
	result := JSTaggedTemplateLiteralNode new.
	result expression: (nodes at: 1).
	result template: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMemberExpression7: nodes [
	| result |
	result := JSNewExpressionNode new.
	result newToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result right: ((nodes at: 3) at: 2).
	result addNodes: ((nodes at: 3) at: 3) to: result arguments.
	result addTokens: ((nodes at: 3) at: 4) to: result ellipsises.
	result addNodes: ((nodes at: 3) at: 5) to: result varArguments.
	result addTokens: ((nodes at: 3) at: 6) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMethodDefinition1: nodes [
	| result |
	result := JSMethodDefinitionNode new.
	result name: (nodes at: 1).
	result left: (nodes at: 2).
	result restParameter: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result parameters.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: (nodes at: 4).
	result leftBrace: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result statements.
	result rightBrace: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMethodDefinition3: nodes [
	| result |
	result := JSGetMethodDefinitionNode new.
	result getToken: (nodes at: 1).
	result name: (nodes at: 2).
	result left: (nodes at: 3).
	result right: (nodes at: 4).
	result leftBrace: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result statements.
	result rightBrace: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForMethodDefinition4: nodes [
	| result |
	result := JSSetMethodDefinitionNode new.
	result setToken: (nodes at: 1).
	result name: (nodes at: 2).
	result left: (nodes at: 3).
	result addNode: (nodes at: 4) to: result parameters.
	result right: (nodes at: 5).
	result leftBrace: (nodes at: 6).
	result addNodes: (nodes at: 7) to: result statements.
	result rightBrace: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForModule1: nodes [
	| result |
	result := JSModuleNode new.
	result addNodes: (nodes at: 1) to: result items.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForModuleBodyopt1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForModuleBodyopt2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForModuleItemList1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForModuleItemList2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForNameSpaceImport1: nodes [
	| result |
	result := JSNameSpaceImportNode new.
	result star: (nodes at: 1).
	result asToken: (nodes at: 2).
	result import: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForNamedImports1: nodes [
	| result |
	result := JSNamedImportsNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForNamedImports2: nodes [
	| result |
	result := JSNamedImportsNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result specifiers.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForNamedImports3: nodes [
	| result |
	result := JSNamedImportsNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result specifiers.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForNewExpression2: nodes [
	| result |
	result := JSNewExpressionNode new.
	result newToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForNewTarget1: nodes [
	| result |
	result := JSNewTargetExpressionNode new.
	result newToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result targetToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForObjectBindingPattern1: nodes [
	| result |
	result := JSObjectBindingPatternNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForObjectBindingPattern2: nodes [
	| result |
	result := JSObjectBindingPatternNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result properties.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForObjectBindingPattern3: nodes [
	| result |
	result := JSObjectBindingPatternNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result properties.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForObjectLiteral1: nodes [
	| result |
	result := JSObjectLiteralNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForObjectLiteral2: nodes [
	| result |
	result := JSObjectLiteralNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForObjectLiteral3: nodes [
	| result |
	result := JSObjectLiteralNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result definitions.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForParameterList1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForParameterList2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForParameterListopt1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForParenthesizedExpression1: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParens.
	result addToken: (nodes at: 3) to: result rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForPrimaryExpression1: nodes [
	| result |
	result := JSThisExpressionNode new.
	result thisToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForPropertyDefinition3: nodes [
	| result |
	result := JSPropertyAssignmentNode new.
	result name: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForRegularExpressionLiteral1: nodes [
	| result |
	result := JSRegularExpressionLiteralNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForReturnStatement1: nodes [
	| result |
	result := JSReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expression: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForScript1: nodes [
	| result |
	result := JSScriptNode new.
	result addNodes: (nodes at: 1) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSingleNameBinding1: nodes [
	| result |
	result := JSVariableDeclarationNode new.
	result variable: (nodes at: 1).
	result equalToken: ((nodes at: 2) at: 1).
	result value: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSpreadElement1: nodes [
	| result |
	result := JSSpreadExpressionNode new.
	result ellipsis: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForStartTemplateLiteral1: nodes [
	^ #template
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSuperCall1: nodes [
	| result |
	result := JSSuperCallExpressionNode new.
	result superToken: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result right: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 2) at: 3) to: result arguments.
	result addTokens: ((nodes at: 2) at: 4) to: result ellipsises.
	result addNodes: ((nodes at: 2) at: 5) to: result varArguments.
	result addTokens: ((nodes at: 2) at: 6) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSuperProperty1: nodes [
	| result |
	result := JSSuperIndexedPropertyExpressionNode new.
	result superToken: (nodes at: 1).
	result leftBracket: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSuperProperty2: nodes [
	| result |
	result := JSSuperNamedPropertyExpressionNode new.
	result superToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSwitchStatement1: nodes [
	| result |
	result := JSSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result left: (nodes at: 2).
	result expression: (nodes at: 3).
	result right: (nodes at: 4).
	result leftBrace: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result clauses.
	result rightBrace: ((nodes at: 5) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTemplateLiteral1: nodes [
	| result |
	result := JSTemplateLiteralNode new.
	result addToken: (nodes at: 1) to: result parts.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTemplateLiteral2: nodes [
	| result |
	result := JSTemplateLiteralNode new.
	result addToken: (nodes at: 2) to: result parts.
	result addNode: (nodes at: 3) to: result expressions.
	result addTokens: ((nodes at: 4) at: 1) to: result parts.
	result addNodes: ((nodes at: 4) at: 2) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTemplateMiddleList1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTemplateMiddleList2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTemplateSpans2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForThrowStatement1: nodes [
	| result |
	result := JSThrowStatementNode new.
	result throwToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTryStatement1: nodes [
	| result |
	result := JSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result tryBlock: (nodes at: 2).
	result catchToken: ((nodes at: 3) at: 1).
	result left: ((nodes at: 3) at: 2).
	result exceptionType: ((nodes at: 3) at: 3).
	result right: ((nodes at: 3) at: 4).
	result catchBlock: ((nodes at: 3) at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTryStatement2: nodes [
	| result |
	result := JSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result tryBlock: (nodes at: 2).
	result finallyToken: ((nodes at: 3) at: 1).
	result finallyBlock: ((nodes at: 3) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForTryStatement3: nodes [
	| result |
	result := JSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result tryBlock: (nodes at: 2).
	result catchToken: ((nodes at: 3) at: 1).
	result left: ((nodes at: 3) at: 2).
	result exceptionType: ((nodes at: 3) at: 3).
	result right: ((nodes at: 3) at: 4).
	result catchBlock: ((nodes at: 3) at: 5).
	result finallyToken: ((nodes at: 4) at: 1).
	result finallyBlock: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForUnaryExpression8: nodes [
	| result |
	result := JSUnaryExpressionNode new.
	result operator: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForUpdateExpression1: nodes [
	| result |
	result := JSPostfixExpressionNode new.
	result expression: (nodes at: 1).
	result operator: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForUpdateExpression3: nodes [
	| result |
	result := JSPrefixExpressionNode new.
	result operator: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForVariableDeclaration2: nodes [
	| result |
	result := JSVariablePatternDeclarationNode new.
	result pattern: (nodes at: 1).
	result equalToken: ((nodes at: 2) at: 1).
	result value: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForVariableStatement1: nodes [
	| result |
	result := JSVariableStatementNode new.
	result varToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result variables.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForWithStatement1: nodes [
	| result |
	result := JSWithStatementNode new.
	result withToken: (nodes at: 1).
	result left: (nodes at: 2).
	result expression: (nodes at: 3).
	result right: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForYieldExpression1: nodes [
	| result |
	result := JSYieldExpressionNode new.
	result yieldToken: (nodes at: 1).
	result star: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #generated }
JSParser >> reduceTable [
^#(
	#(133 0 #reduceActionForStartTemplateLiteral1:) 
	#(250 0 #reduceActionForModuleBodyopt1:) 
	#(247 0 #reduceActionForModuleBodyopt1:) 
	#(115 0 #reduceActionForParameterListopt1:) 
	#(120 0 #reduceActionForModuleBodyopt1:) 
	#(199 0 #reduceActionForCheckEOL1:) 
	#(110 0 #nil) 
	#(174 1 #liftFirstValue:) 
	#(269 1 #liftFirstValue:) 
	#(268 1 #liftFirstValue:) 
	#(112 1 #reduceActionForPrimaryExpression1:) 
	#(236 0 #nil) 
	#(170 0 #reduceActionForModuleBodyopt1:) 
	#(191 1 #reduceActionForEmptyStatement1:) 
	#(111 1 #reduceActionForIdentifier1:) 
	#(270 1 #liftFirstValue:) 
	#(271 1 #liftFirstValue:) 
	#(272 1 #reduceActionForRegularExpressionLiteral1:) 
	#(132 1 #reduceActionForTemplateLiteral1:) 
	#(112 1 #liftFirstValue:) 
	#(227 1 #reduceActionForArrowParameters1:) 
	#(136 1 #liftFirstValue:) 
	#(227 1 #reduceActionForArrowParameters2:) 
	#(140 1 #liftFirstValue:) 
	#(138 1 #liftFirstValue:) 
	#(145 1 #liftFirstValue:) 
	#(141 1 #liftFirstValue:) 
	#(146 1 #liftFirstValue:) 
	#(147 1 #liftFirstValue:) 
	#(148 1 #liftFirstValue:) 
	#(149 1 #liftFirstValue:) 
	#(150 1 #liftFirstValue:) 
	#(151 1 #liftFirstValue:) 
	#(152 1 #liftFirstValue:) 
	#(153 1 #liftFirstValue:) 
	#(154 1 #liftFirstValue:) 
	#(155 1 #liftFirstValue:) 
	#(156 1 #liftFirstValue:) 
	#(157 1 #liftFirstValue:) 
	#(158 1 #liftFirstValue:) 
	#(159 1 #liftFirstValue:) 
	#(160 1 #liftFirstValue:) 
	#(163 1 #liftFirstValue:) 
	#(172 1 #liftFirstValue:) 
	#(164 1 #liftFirstValue:) 
	#(168 1 #liftFirstValue:) 
	#(253 1 #liftFirstValue:) 
	#(167 1 #liftFirstValue:) 
	#(109 1 #liftFirstValue:) 
	#(249 1 #reduceActionForModule1:) 
	#(250 1 #reduceActionForModuleBodyopt2:) 
	#(251 1 #reduceActionForModuleBodyopt2:) 
	#(252 1 #reduceActionForModuleItemList1:) 
	#(117 1 #reduceActionForLiteral1:) 
	#(117 1 #reduceActionForLiteral2:) 
	#(117 1 #reduceActionForLiteral4:) 
	#(117 1 #reduceActionForLiteral3:) 
	#(248 1 #reduceActionForModuleBodyopt2:) 
	#(171 1 #reduceActionForModuleItemList1:) 
	#(246 1 #reduceActionForScript1:) 
	#(247 1 #reduceActionForModuleBodyopt2:) 
	#(147 2 #reduceActionForUnaryExpression8:) 
	#(130 0 #reduceActionForInitializeropt1:) 
	#(115 1 #reduceActionForModuleBodyopt2:) 
	#(180 1 #liftFirstValue:) 
	#(116 1 #reduceActionForParameterList1:) 
	#(187 1 #liftFirstValue:) 
	#(146 2 #reduceActionForUpdateExpression3:) 
	#(121 1 #reduceActionForModuleItemList1:) 
	#(120 1 #reduceActionForModuleBodyopt2:) 
	#(240 0 #reduceActionForInitializeropt1:) 
	#(110 1 #liftFirstValue:) 
	#(215 2 #reduceActionForDebuggerStatement1:) 
	#(264 2 #reduceActionForExportDeclaration5:) 
	#(165 1 #liftFirstValue:) 
	#(264 2 #reduceActionForExportDeclaration4:) 
	#(166 1 #liftFirstValue:) 
	#(162 0 #nil) 
	#(263 1 #liftFirstValue:) 
	#(255 1 #reduceActionForImportClause1:) 
	#(256 1 #liftFirstValue:) 
	#(262 1 #liftFirstValue:) 
	#(140 2 #reduceActionForNewExpression2:) 
	#(142 2 #reduceActionForSuperCall1:) 
	#(178 1 #reduceActionForParameterList1:) 
	#(236 1 #liftFirstValue:) 
	#(123 2 #reduceActionForObjectLiteral1:) 
	#(127 1 #liftFirstValue:) 
	#(125 1 #liftFirstValue:) 
	#(124 1 #reduceActionForParameterList1:) 
	#(126 1 #liftFirstValue:) 
	#(170 1 #reduceActionForModuleBodyopt2:) 
	#(229 1 #liftFirstValue:) 
	#(127 1 #reduceActionForIdentifier1:) 
	#(136 2 #reduceActionForMemberExpression4:) 
	#(141 2 #reduceActionForCallExpression1:) 
	#(141 2 #reduceActionForMemberExpression4:) 
	#(161 1 #liftFirstValue:) 
	#(146 2 #reduceActionForUpdateExpression1:) 
	#(192 2 #reduceActionForExpressionStatement1:) 
	#(175 1 #reduceActionForParameterList1:) 
	#(252 2 #reduceActionForModuleItemList2:) 
	#(171 2 #reduceActionForModuleItemList2:) 
	#(189 0 #nil) 
	#(184 1 #reduceActionForBindingElementList1:) 
	#(181 2 #reduceActionForObjectBindingPattern1:) 
	#(183 1 #reduceActionForParameterList1:) 
	#(186 1 #liftFirstValue:) 
	#(188 2 #reduceActionForSingleNameBinding1:) 
	#(130 1 #reduceActionForModuleBodyopt2:) 
	#(114 3 #reduceActionForCoverParenthesizedExpressionAndArrowParameterList1:) 
	#(113 3 #reduceActionForParenthesizedExpression1:) 
	#(187 2 #reduceActionForSingleNameBinding1:) 
	#(118 3 #reduceActionForArrayLiteral2:) 
	#(118 3 #reduceActionForArrayLiteral1:) 
	#(119 2 #reduceActionForElementList2:) 
	#(121 2 #reduceActionForModuleItemList2:) 
	#(238 3 #reduceActionForClassExpression1:) 
	#(240 1 #reduceActionForModuleBodyopt2:) 
	#(265 2 #reduceActionForExportClause1:) 
	#(267 1 #reduceActionForExportSpecifier1:) 
	#(266 1 #reduceActionForParameterList1:) 
	#(264 3 #reduceActionForExportDeclaration3:) 
	#(162 1 #liftFirstValue:) 
	#(219 0 #reduceActionForFormalParameters1:) 
	#(258 2 #reduceActionForNamedImports1:) 
	#(260 1 #reduceActionForParameterList1:) 
	#(261 1 #reduceActionForImportSpecifier1:) 
	#(254 3 #reduceActionForImportDeclaration2:) 
	#(139 3 #reduceActionForNewTarget1:) 
	#(136 3 #reduceActionForMemberExpression7:) 
	#(143 2 #reduceActionForArguments1:) 
	#(144 1 #reduceActionForArgumentList1:) 
	#(137 3 #reduceActionForSuperProperty2:) 
	#(210 3 #reduceActionForThrowStatement1:) 
	#(211 3 #reduceActionForTryStatement1:) 
	#(211 3 #reduceActionForTryStatement2:) 
	#(179 2 #reduceActionForSingleNameBinding1:) 
	#(177 3 #reduceActionForVariableStatement1:) 
	#(179 2 #reduceActionForVariableDeclaration2:) 
	#(235 3 #reduceActionForYieldExpression1:) 
	#(129 2 #reduceActionForCoverInitializedName1:) 
	#(123 3 #reduceActionForObjectLiteral2:) 
	#(169 3 #reduceActionForBlock1:) 
	#(209 1 #liftFirstValue:) 
	#(208 3 #reduceActionForLabelledStatement1:) 
	#(136 3 #reduceActionForMemberExpression3:) 
	#(141 3 #reduceActionForMemberExpression3:) 
	#(160 3 #reduceActionForAssignmentExpression4:) 
	#(148 3 #reduceActionForExponentiationExpression2:) 
	#(149 3 #reduceActionForExponentiationExpression2:) 
	#(150 3 #reduceActionForExponentiationExpression2:) 
	#(151 3 #reduceActionForExponentiationExpression2:) 
	#(152 3 #reduceActionForExponentiationExpression2:) 
	#(153 3 #reduceActionForExponentiationExpression2:) 
	#(154 3 #reduceActionForExponentiationExpression2:) 
	#(155 3 #reduceActionForExponentiationExpression2:) 
	#(156 3 #reduceActionForExponentiationExpression2:) 
	#(157 3 #reduceActionForExponentiationExpression2:) 
	#(158 3 #reduceActionForExponentiationExpression2:) 
	#(163 3 #reduceActionForExpression2:) 
	#(176 2 #reduceActionForSingleNameBinding1:) 
	#(173 3 #reduceActionForLexicalDeclaration1:) 
	#(176 2 #reduceActionForVariableDeclaration2:) 
	#(228 1 #reduceActionForConciseBody1:) 
	#(226 3 #reduceActionForArrowFunction1:) 
	#(185 2 #reduceActionForBindingElisionElement1:) 
	#(189 1 #liftFirstValue:) 
	#(182 3 #reduceActionForArrayBindingPattern2:) 
	#(181 3 #reduceActionForObjectBindingPattern2:) 
	#(131 2 #reduceActionForInitializer1:) 
	#(116 3 #reduceActionForParameterList2:) 
	#(118 4 #reduceActionForArrayLiteral3:) 
	#(122 2 #reduceActionForSpreadElement1:) 
	#(198 4 #reduceActionForBreakStatement1:) 
	#(241 2 #reduceActionForInitializer1:) 
	#(242 0 #reduceActionForModuleBodyopt1:) 
	#(197 4 #reduceActionForContinueStatement1:) 
	#(259 2 #reduceActionForInitializer1:) 
	#(264 4 #reduceActionForExportDeclaration1:) 
	#(237 3 #reduceActionForClassExpression1:) 
	#(264 4 #reduceActionForExportDeclaration6:) 
	#(265 3 #reduceActionForExportClause2:) 
	#(264 4 #reduceActionForExportDeclaration2:) 
	#(196 1 #liftFirstValue:) 
	#(195 2 #reduceActionForInitializer1:) 
	#(223 1 #liftFirstValue:) 
	#(222 1 #liftFirstValue:) 
	#(219 1 #reduceActionForModuleBodyopt2:) 
	#(220 1 #reduceActionForFormalParameterList2:) 
	#(220 1 #reduceActionForFormalParameterList1:) 
	#(221 1 #reduceActionForParameterList1:) 
	#(257 3 #reduceActionForNameSpaceImport1:) 
	#(258 3 #reduceActionForNamedImports2:) 
	#(254 4 #reduceActionForImportDeclaration1:) 
	#(255 3 #reduceActionForImportClause4:) 
	#(200 4 #reduceActionForReturnStatement1:) 
	#(144 2 #reduceActionForArgumentList2:) 
	#(143 3 #reduceActionForArguments2:) 
	#(137 4 #reduceActionForSuperProperty1:) 
	#(213 2 #reduceActionForInitializer1:) 
	#(211 4 #reduceActionForTryStatement3:) 
	#(178 3 #reduceActionForParameterList2:) 
	#(128 3 #reduceActionForComputedPropertyName1:) 
	#(123 4 #reduceActionForObjectLiteral3:) 
	#(124 3 #reduceActionForParameterList2:) 
	#(218 1 #reduceActionForModuleBodyopt2:) 
	#(125 3 #reduceActionForPropertyDefinition3:) 
	#(134 1 #reduceActionForParameterList1:) 
	#(132 4 #reduceActionForTemplateLiteral2:) 
	#(136 4 #reduceActionForMemberExpression2:) 
	#(141 4 #reduceActionForCallExpression4:) 
	#(175 3 #reduceActionForParameterList2:) 
	#(225 1 #reduceActionForModuleBodyopt2:) 
	#(224 1 #reduceActionForModuleBodyopt2:) 
	#(190 2 #reduceActionForBindingRestElement1:) 
	#(182 4 #reduceActionForArrayBindingPattern1:) 
	#(184 3 #reduceActionForBindingElementList2:) 
	#(186 3 #reduceActionForBindingProperty2:) 
	#(181 4 #reduceActionForObjectBindingPattern3:) 
	#(183 3 #reduceActionForParameterList2:) 
	#(119 4 #reduceActionForElementList4:) 
	#(245 1 #reduceActionForEmptyStatement1:) 
	#(245 1 #liftFirstValue:) 
	#(242 1 #reduceActionForModuleBodyopt2:) 
	#(243 1 #reduceActionForModuleBodyopt2:) 
	#(244 1 #reduceActionForModuleItemList1:) 
	#(267 3 #reduceActionForExportSpecifier2:) 
	#(265 4 #reduceActionForExportClause3:) 
	#(266 3 #reduceActionForParameterList2:) 
	#(193 5 #reduceActionForIfStatement2:) 
	#(261 3 #reduceActionForImportSpecifier2:) 
	#(258 4 #reduceActionForNamedImports3:) 
	#(260 3 #reduceActionForParameterList2:) 
	#(144 3 #reduceActionForArgumentList3:) 
	#(204 0 #reduceActionForModuleBodyopt1:) 
	#(202 5 #reduceActionForSwitchStatement1:) 
	#(214 1 #liftFirstValue:) 
	#(194 5 #reduceActionForIterationStatement2:) 
	#(201 5 #reduceActionForWithStatement1:) 
	#(230 1 #liftFirstValue:) 
	#(135 2 #reduceActionForTemplateMiddleList1:) 
	#(134 2 #reduceActionForTemplateSpans2:) 
	#(159 5 #reduceActionForConditionalExpression2:) 
	#(228 3 #reduceActionForConciseBody2:) 
	#(114 6 #reduceActionForCoverParenthesizedExpressionAndArrowParameterList2:) 
	#(245 2 #reduceActionForClassElement2:) 
	#(239 4 #reduceActionForClassTail1:) 
	#(244 2 #reduceActionForModuleItemList2:) 
	#(220 3 #reduceActionForFormalParameterList3:) 
	#(221 3 #reduceActionForParameterList2:) 
	#(144 4 #reduceActionForArgumentList4:) 
	#(204 1 #reduceActionForModuleBodyopt2:) 
	#(205 1 #reduceActionForModuleItemList1:) 
	#(135 3 #reduceActionForTemplateMiddleList2:) 
	#(182 6 #reduceActionForArrayBindingPattern3:) 
	#(194 7 #reduceActionForIterationStatement1:) 
	#(194 7 #reduceActionForIterationStatement6:) 
	#(194 7 #reduceActionForIterationStatement9:) 
	#(194 7 #reduceActionForIterationStatement8:) 
	#(194 7 #reduceActionForIterationStatement11:) 
	#(193 7 #reduceActionForIfStatement1:) 
	#(203 3 #reduceActionForCaseBlock1:) 
	#(205 2 #reduceActionForModuleItemList2:) 
	#(212 5 #reduceActionForCatch1:) 
	#(194 8 #reduceActionForIterationStatement10:) 
	#(194 8 #reduceActionForIterationStatement7:) 
	#(194 8 #reduceActionForIterationStatement5:) 
	#(234 1 #reduceActionForModuleBodyopt2:) 
	#(217 8 #reduceActionForFunctionExpression1:) 
	#(229 7 #reduceActionForMethodDefinition3:) 
	#(229 7 #reduceActionForMethodDefinition1:) 
	#(216 8 #reduceActionForFunctionExpression1:) 
	#(194 9 #reduceActionForIterationStatement3:) 
	#(233 9 #reduceActionForGeneratorExpression1:) 
	#(206 4 #reduceActionForCaseClause1:) 
	#(207 3 #reduceActionForDefaultClause1:) 
	#(203 5 #reduceActionForCaseBlock2:) 
	#(231 8 #reduceActionForGeneratorMethod1:) 
	#(229 8 #reduceActionForMethodDefinition4:) 
	#(232 9 #reduceActionForGeneratorExpression1:) 
	#(194 10 #reduceActionForIterationStatement4:)
	).
]

{ #category : #generated }
JSParser >> symbolNames [
	^ #('"!"' '"!="' '"!=="' '"%"' '"%="' '"&"' '"&&"' '"&="' '"("' '")"' '"*"' '"**"' '"*="' '"+"' '"++"' '"+="' '","' '"-"' '"--"' '"-="' '"."' '"..."' '":"' '"<"' '"<<"' '"<<="' '"<="' '"="' '"=="' '"==="' '"=>"' '">"' '">="' '">>"' '">>="' '">>>"' '">>>="' '"?"' '"["' '"]"' '"^"' '"^="' '"as"' '"break"' '"case"' '"catch"' '"class"' '"const"' '"continue"' '"debugger"' '"default"' '"delete"' '"do"' '"else"' '"export"' '"extends"' '"false"' '"finally"' '"for"' '"from"' '"function"' '"get"' '"if"' '"import"' '"in"' '"instanceof"' '"let"' '"new"' '"null"' '"of"' '"return"' '"set"' '"static"' '"super"' '"switch"' '"target"' '"this"' '"throw"' '"true"' '"try"' '"typeof"' '"var"' '"void"' '"while"' '"with"' '"yield"' '"{"' '"|"' '"|="' '"||"' '"~"' '<semicolon>' '<slash>' '<slashEqual>' '<rightBrace>' '<comment>' '<identifier>' '<identifierName>' '<whitespace>' '<string>' '<numeric>' '<regular_expression>' '<patternToken>' '<no_substitution_template>' '<template_head>' '<template_middle>' '<template_end>' 'B e g i n' 'goal' 'Identifieropt' 'Identifier' 'PrimaryExpression' 'ParenthesizedExpression' 'CoverParenthesizedExpressionAndArrowParameterList' 'ParameterListopt' 'ParameterList' 'Literal' 'ArrayLiteral' 'ElementList' 'Elisionopt' 'Elision' 'SpreadElement' 'ObjectLiteral' 'PropertyDefinitionList' 'PropertyDefinition' 'PropertyName' 'LiteralPropertyName' 'ComputedPropertyName' 'CoverInitializedName' 'Initializeropt' 'Initializer' 'TemplateLiteral' 'StartTemplateLiteral' 'TemplateSpans' 'TemplateMiddleList' 'MemberExpression' 'SuperProperty' 'MetaProperty' 'NewTarget' 'NewExpression' 'CallExpression' 'SuperCall' 'Arguments' 'ArgumentList' 'LeftHandSideExpression' 'UpdateExpression' 'UnaryExpression' 'ExponentiationExpression' 'MultiplicativeExpression' 'AdditiveExpression' 'ShiftExpression' 'RelationalExpression' 'EqualityExpression' 'BitwiseANDExpression' 'BitwiseXORExpression' 'BitwiseORExpression' 'LogicalANDExpression' 'LogicalORExpression' 'ConditionalExpression' 'AssignmentExpression' 'AssignmentOperator' 'Expressionopt' 'Expression' 'Statement' 'Declaration' 'HoistableDeclaration' 'BreakableStatement' 'BlockStatement' 'Block' 'StatementListopt' 'StatementList' 'StatementListItem' 'LexicalDeclaration' 'LetOrConst' 'BindingList' 'LexicalBinding' 'VariableStatement' 'VariableDeclarationList' 'VariableDeclaration' 'BindingPattern' 'ObjectBindingPattern' 'ArrayBindingPattern' 'BindingPropertyList' 'BindingElementList' 'BindingElisionElement' 'BindingProperty' 'BindingElement' 'SingleNameBinding' 'BindingRestElementopt' 'BindingRestElement' 'EmptyStatement' 'ExpressionStatement' 'IfStatement' 'IterationStatement' 'ForDeclaration' 'ForBinding' 'ContinueStatement' 'BreakStatement' 'CheckEOL' 'ReturnStatement' 'WithStatement' 'SwitchStatement' 'CaseBlock' 'CaseClausesopt' 'CaseClauses' 'CaseClause' 'DefaultClause' 'LabelledStatement' 'LabeledItem' 'ThrowStatement' 'TryStatement' 'Catch' 'Finally' 'CatchParameter' 'DebuggerStatement' 'FunctionDeclaration' 'FunctionExpression' 'StrictFormalParameters' 'FormalParameters' 'FormalParameterList' 'FormalsList' 'FunctionRestParameter' 'FormalParameter' 'FunctionBody' 'FunctionStatementList' 'ArrowFunction' 'ArrowParameters' 'ConciseBody' 'MethodDefinition' 'PropertySetParameterList' 'GeneratorMethod' 'GeneratorDeclaration' 'GeneratorExpression' 'GeneratorBody' 'YieldExpression' 'staropt' 'ClassDeclaration' 'ClassExpression' 'ClassTail' 'ClassHeritageopt' 'ClassHeritage' 'ClassBodyopt' 'ClassBody' 'ClassElementList' 'ClassElement' 'Script' 'ScriptBodyopt' 'ScriptBody' 'Module' 'ModuleBodyopt' 'ModuleBody' 'ModuleItemList' 'ModuleItem' 'ImportDeclaration' 'ImportClause' 'ImportedDefaultBinding' 'NameSpaceImport' 'NamedImports' 'FromClause' 'ImportsList' 'ImportSpecifier' 'ModuleSpecifier' 'ImportedBinding' 'ExportDeclaration' 'ExportClause' 'ExportsList' 'ExportSpecifier' 'NullLiteral' 'BooleanLiteral' 'StringLiteral' 'NumericLiteral' 'RegularExpressionLiteral' 'E O F' 'error')
]

{ #category : #generated }
JSParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #JSModuleNode #JSModuleNode #JSNameExpressionNode #JSNameExpressionNode #JSExpressionNode #JSExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #JSLiteralNode #JSArrayLiteralNode #OrderedCollection #OrderedCollection #OrderedCollection #JSSpreadExpressionNode #JSObjectLiteralNode #OrderedCollection #JSProgramNode #JSProgramNode #JSNameExpressionNode #JSComputedPropertyNameNode #JSPropertyAssignmentNode #OrderedCollection #OrderedCollection #JSTemplateLiteralNode #ByteSymbol #OrderedCollection #OrderedCollection #JSExpressionNode #JSExpressionNode #JSNewTargetExpressionNode #JSNewTargetExpressionNode #JSExpressionNode #JSExpressionNode #JSSuperCallExpressionNode #OrderedCollection #OrderedCollection #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #SmaCCToken #JSExpressionNode #JSExpressionNode #JSStatementNode #JSProgramNode #JSFunctionNode #JSStatementNode #JSBlockStatementNode #JSBlockStatementNode #OrderedCollection #OrderedCollection #JSStatementNode #JSLexicalDeclarationNode #SmaCCToken #OrderedCollection #JSProgramNode #JSVariableStatementNode #OrderedCollection #JSProgramNode #JSProgramNode #JSObjectBindingPatternNode #JSArrayBindingPatternNode #OrderedCollection #OrderedCollection #OrderedCollection #JSProgramNode #JSVariableDeclarationNode #JSVariableDeclarationNode #JSRestVariableDeclarationNode #JSRestVariableDeclarationNode #JSEmptyStatementNode #JSExpressionStatementNode #JSIfStatementNode #JSStatementNode #OrderedCollection #JSProgramNode #JSContinueStatementNode #JSBreakStatementNode nil #JSReturnStatementNode #JSWithStatementNode #JSSwitchStatementNode #OrderedCollection #OrderedCollection #OrderedCollection #JSCaseClauseNode #JSDefaultClauseNode #JSLabelledStatementNode #JSStatementNode #JSThrowStatementNode #JSTryStatementNode #OrderedCollection #OrderedCollection #JSProgramNode #JSDebuggerStatementNode #JSFunctionNode #JSFunctionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JSRestVariableDeclarationNode #JSVariableDeclarationNode #OrderedCollection #OrderedCollection #JSArrowFunctionNode #OrderedCollection #OrderedCollection #JSMethodDefinitionNode #JSVariableDeclarationNode #JSGeneratorMethodDefinitionNode #JSGeneratorFunctionNode #JSGeneratorFunctionNode #OrderedCollection #JSYieldExpressionNode #SmaCCToken #JSClassExpressionNode #JSClassExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JSProgramNode #JSScriptNode #OrderedCollection #OrderedCollection #JSModuleNode #OrderedCollection #OrderedCollection #OrderedCollection #JSProgramNode #JSImportDeclarationNode #OrderedCollection #JSNameExpressionNode #JSNameSpaceImportNode #JSNamedImportsNode #OrderedCollection #OrderedCollection #JSImportSpecifierNode #SmaCCToken #JSNameExpressionNode #JSExportDeclarationNode #OrderedCollection #OrderedCollection #JSExportSpecifierNode #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #JSRegularExpressionLiteralNode #SmaCCToken #SmaCCToken)
]

{ #category : #generated }
JSParser >> transitionTable [
^#(
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 0 81 0 55 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 101 0 64 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 201 0 109 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 1 205 0 164 1 205 0 167 1 205 0 168 1 205 0 169 1 205 0 172 1 205 0 173 1 105 0 174 1 205 0 177 1 205 0 191 1 205 0 192 1 205 0 193 1 205 0 194 1 205 0 197 1 205 0 198 1 205 0 200 1 205 0 201 1 205 0 202 1 205 0 208 1 205 0 210 1 205 0 211 1 205 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 0 201 0 249 1 193 0 250 1 197 0 251 1 201 0 252 1 205 0 253 1 205 0 254 1 205 1 8 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16 0 10 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 245 0 159 1 245 0 160 1 245 0 163 0 241 0 217 1 245 0 226 1 173 0 227 0 241 0 233 1 245 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 1 249 0 164 1 249 0 167 1 249 0 168 1 249 0 169 1 249 0 177 1 249 0 191 1 249 0 192 1 249 0 193 1 249 0 194 1 249 0 197 1 249 0 198 1 249 0 200 1 249 0 201 1 249 0 202 1 249 0 208 1 249 0 210 1 249 0 211 1 249 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 1 253 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 2 5 0 246 2 9 0 247 2 13 0 248 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16 0 14 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 0 81 0 55 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 101 0 64 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 1 205 0 164 1 205 0 167 1 205 0 168 1 205 0 169 1 205 0 172 1 205 0 173 1 105 0 174 1 205 0 177 1 205 0 191 1 205 0 192 1 205 0 193 1 205 0 194 1 205 0 197 1 205 0 198 1 205 0 200 1 205 0 201 1 205 0 202 1 205 0 208 1 205 0 210 1 205 0 211 1 205 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 2 17 0 249 1 193 0 250 1 197 0 251 1 201 0 252 1 205 0 253 1 205 0 254 1 205 1 8 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16 0 10 1 17] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 2 33 0 146 2 33 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 18 0 10 0 33 0 14 0 37 0 15 0 18 0 17 0 41 0 18 0 45 0 19 2 37 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 2 41 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 2 45 0 111 0 241 0 112 0 241 0 113 0 217 0 114 2 49 0 115 2 53 0 116 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 2 57 0 159 2 57 0 160 2 57 0 163 2 61 0 180 2 61 0 181 2 61 0 182 2 73 0 187 2 73 0 188 0 241 0 217 2 57 0 226 1 173 0 227 0 241 0 233 2 57 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 2 81 0 146 2 81 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 2 85 0 146 2 85 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 2 89 0 146 2 89 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 2 93 0 146 2 93 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 22 0 1 0 22 0 9 0 22 0 14 0 22 0 15 2 97 0 17 0 22 0 18 0 22 0 19 0 22 0 22 0 22 0 39 0 22 0 40 0 22 0 47 0 22 0 52 0 22 0 57 0 22 0 61 0 22 0 68 0 22 0 69 0 22 0 74 0 22 0 77 0 22 0 79 0 22 0 81 0 22 0 83 0 22 0 86 0 22 0 87 0 22 0 91 0 22 0 97 0 22 0 100 0 22 0 101 0 22 0 102 0 22 0 104 0 22 0 105 2 101 0 119 2 105 0 120 2 109 0 121] 
#[1 0 26 0 92 0 26 0 97 2 113 0 199] 
#[1 0 30 0 56 0 30 0 87 1 241 0 97 2 117 0 110 2 117 0 111] 
#[0 0 34 0 39 0 87 0 97] 
#[1 0 26 0 92 0 26 0 97 2 125 0 199] 
#[0 2 129 0 92] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 2 133 0 146 2 133 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 137 0 164 2 137 0 167 2 137 0 168 2 137 0 169 2 137 0 177 2 137 0 191 2 137 0 192 2 137 0 193 2 137 0 194 2 137 0 197 2 137 0 198 2 137 0 200 2 137 0 201 2 137 0 202 2 137 0 208 2 137 0 210 2 137 0 211 2 137 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 2 141 0 11 2 145 0 47 1 105 0 48 2 149 0 51 2 153 0 61 1 105 0 67 0 149 0 82 2 157 0 87 2 161 0 165 2 161 0 166 2 161 0 173 1 105 0 174 2 173 0 177 2 161 0 216 2 161 0 232 2 161 0 237 2 189 1 9] 
#[0 0 38 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 2 193 0 9] 
#[1 0 30 0 9 2 197 0 11 1 241 0 97 2 201 0 110 2 201 0 111] 
#[0 2 205 0 9] 
#[1 2 209 0 11 2 213 0 87 1 241 0 97 2 237 0 100 2 225 0 111 2 221 0 255 2 225 1 0 2 229 1 1 2 233 1 2 2 237 1 6 2 225 1 7 2 237 1 14] 
#[0 0 34 0 39 0 87 0 97] 
#[1 2 21 0 9 2 249 0 21 0 49 0 39 0 57 0 47 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 2 253 0 74 0 129 0 77 1 221 0 79 1 237 0 87 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 3 1 0 111 3 1 0 112 3 1 0 113 3 1 0 117 3 1 0 118 3 1 0 123 3 1 0 132 0 237 0 133 3 1 0 136 3 1 0 137 3 1 0 138 3 1 0 139 3 5 0 140 3 1 0 217 3 1 0 233 3 1 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 3 1 1 16] 
#[0 0 42 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 26 0 1 0 26 0 9 0 26 0 14 0 26 0 15 0 26 0 18 0 26 0 19 0 26 0 39 0 26 0 47 0 26 0 52 0 26 0 57 0 26 0 61 0 26 0 68 0 26 0 69 0 26 0 74 0 26 0 77 0 26 0 79 0 26 0 81 0 26 0 83 0 26 0 86 0 26 0 87 0 26 0 91 0 26 0 92 0 26 0 97 0 26 0 100 0 26 0 101 0 26 0 102 0 26 0 104 0 26 0 105 3 9 0 199] 
#[1 3 13 0 9 3 17 0 21 3 21 0 39 3 25 0 143] 
#[0 3 29 0 9] 
#[0 0 46 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 3 33 0 159 3 33 0 160 3 33 0 163 0 241 0 217 3 33 0 226 1 173 0 227 0 241 0 233 3 33 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 0 38 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 3 37 0 87 3 41 0 169] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 3 45 0 146 3 45 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 3 57 0 111 3 61 0 178 3 65 0 179 3 69 0 180 3 69 0 181 3 69 0 182] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 3 73 0 146 3 73 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 3 77 0 9] 
#[0 3 81 0 9] 
#[1 0 50 0 1 0 50 0 9 3 89 0 11 0 50 0 14 0 50 0 15 0 50 0 18 0 50 0 19 0 50 0 39 0 50 0 47 0 50 0 52 0 50 0 57 0 50 0 61 0 50 0 68 0 50 0 69 0 50 0 74 0 50 0 77 0 50 0 79 0 50 0 81 0 50 0 83 0 50 0 86 0 50 0 87 0 50 0 91 0 50 0 97 0 50 0 100 0 50 0 101 0 50 0 102 0 50 0 104 0 50 0 105 3 89 0 236] 
#[1 0 25 0 1 0 29 0 9 3 93 0 11 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 3 97 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 3 101 0 62 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 3 105 0 72 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 7 0 95 0 181 0 97 3 157 0 100 3 161 0 101 0 193 0 102 0 197 0 104 0 6 0 105 3 113 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 3 117 0 124 3 121 0 125 3 125 0 126 3 125 0 127 3 125 0 128 3 121 0 129 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 3 141 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 1 77 0 226 1 173 0 227 3 121 0 229 3 121 0 231 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 3 157 1 14 3 161 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 3 165 0 146 3 165 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 0 58 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 62 0 2 0 62 0 3 0 62 0 4 0 62 0 5 0 62 0 6 0 62 0 7 0 62 0 8 0 62 0 9 0 62 0 11 0 62 0 12 0 62 0 13 0 62 0 14 0 62 0 15 0 62 0 16 0 62 0 17 0 62 0 18 0 62 0 19 0 62 0 20 0 62 0 21 0 11 0 23 0 62 0 24 0 62 0 25 0 62 0 26 0 62 0 27 0 62 0 28 0 62 0 29 0 62 0 30 0 62 0 31 0 62 0 32 0 62 0 33 0 62 0 34 0 62 0 35 0 62 0 36 0 62 0 37 0 62 0 38 0 62 0 39 0 62 0 41 0 62 0 42 0 62 0 65 0 62 0 66 0 62 0 88 0 62 0 89 0 62 0 90 0 62 0 92 0 62 0 93 0 62 0 94 0 62 0 95 0 62 0 104 0 62 0 105] 
#[0 0 66 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 70 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 74 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 78 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 0 1 17] 
#[1 0 82 0 2 0 82 0 3 0 82 0 4 0 82 0 5 0 82 0 6 0 82 0 7 0 82 0 8 0 82 0 9 0 82 0 10 0 82 0 11 0 82 0 12 0 82 0 13 0 82 0 14 0 82 0 15 0 82 0 16 0 82 0 17 0 82 0 18 0 82 0 19 0 82 0 20 0 82 0 21 0 82 0 23 0 82 0 24 0 82 0 25 0 82 0 26 0 82 0 27 0 82 0 28 0 82 0 29 0 82 0 30 0 86 0 31 0 82 0 32 0 82 0 33 0 82 0 34 0 82 0 35 0 82 0 36 0 82 0 37 0 82 0 38 0 82 0 39 0 82 0 40 0 82 0 41 0 82 0 42 0 82 0 65 0 82 0 66 0 82 0 70 0 82 0 88 0 82 0 89 0 82 0 90 0 82 0 92 0 82 0 93 0 82 0 94 0 82 0 95 0 82 0 104 0 82 0 105 0 82 0 106 0 82 0 107 0 82 1 17] 
#[0 0 90 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 94 0 31] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 3 173 0 105] 
#[1 0 98 0 2 0 98 0 3 0 98 0 4 0 98 0 5 0 98 0 6 0 98 0 7 0 98 0 8 3 13 0 9 0 98 0 10 0 98 0 11 0 98 0 12 0 98 0 13 0 98 0 14 0 98 0 15 0 98 0 16 0 98 0 17 0 98 0 18 0 98 0 19 0 98 0 20 3 177 0 21 0 98 0 23 0 98 0 24 0 98 0 25 0 98 0 26 0 98 0 27 0 98 0 28 0 98 0 29 0 98 0 30 0 98 0 32 0 98 0 33 0 98 0 34 0 98 0 35 0 98 0 36 0 98 0 37 0 98 0 38 3 181 0 39 0 98 0 40 0 98 0 41 0 98 0 42 0 98 0 65 0 98 0 66 0 98 0 70 0 98 0 87 0 98 0 88 0 98 0 89 0 98 0 90 0 98 0 92 0 98 0 93 0 98 0 94 0 98 0 95 0 197 0 104 0 6 0 105 0 98 0 106 0 98 0 107 3 185 0 132 0 237 0 133 3 189 0 143 0 98 1 17] 
#[0 0 90 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 90 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 102 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 106 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 106 0 107 1 17] 
#[1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 6 0 106 0 7 0 106 0 8 3 13 0 9 0 106 0 10 0 106 0 11 0 106 0 12 0 106 0 13 0 106 0 14 0 106 0 15 0 106 0 16 0 106 0 17 0 106 0 18 0 106 0 19 0 106 0 20 3 193 0 21 0 106 0 23 0 106 0 24 0 106 0 25 0 106 0 26 0 106 0 27 0 106 0 28 0 106 0 29 0 106 0 30 0 106 0 32 0 106 0 33 0 106 0 34 0 106 0 35 0 106 0 36 0 106 0 37 0 106 0 38 3 197 0 39 0 106 0 40 0 106 0 41 0 106 0 42 0 106 0 65 0 106 0 66 0 106 0 70 0 106 0 87 0 106 0 88 0 106 0 89 0 106 0 90 0 106 0 92 0 106 0 93 0 106 0 94 0 106 0 95 0 197 0 104 0 6 0 105 0 106 0 106 0 106 0 107 3 201 0 132 0 237 0 133 3 205 0 143 0 106 1 17] 
#[0 0 110 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 114 0 2 0 114 0 3 0 114 0 4 4 9 0 5 0 114 0 6 0 114 0 7 4 9 0 8 0 114 0 10 0 114 0 11 0 114 0 12 4 9 0 13 0 114 0 14 3 221 0 15 4 9 0 16 0 114 0 17 0 114 0 18 3 229 0 19 4 9 0 20 0 114 0 23 0 114 0 24 0 114 0 25 4 9 0 26 0 114 0 27 4 9 0 28 0 114 0 29 0 114 0 30 0 114 0 32 0 114 0 33 0 114 0 34 4 9 0 35 0 114 0 36 4 9 0 37 0 114 0 38 0 114 0 40 0 114 0 41 4 9 0 42 0 114 0 65 0 114 0 66 0 114 0 70 0 114 0 88 4 9 0 89 0 114 0 90 0 114 0 92 0 114 0 93 4 9 0 94 0 114 0 95 0 114 0 106 0 114 0 107 4 9 0 161 0 114 1 17] 
#[0 0 118 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[1 0 122 0 2 0 122 0 3 0 122 0 4 0 122 0 6 0 122 0 7 0 122 0 10 0 122 0 11 4 13 0 12 0 122 0 14 0 122 0 17 0 122 0 18 0 122 0 23 0 122 0 24 0 122 0 25 0 122 0 27 0 122 0 29 0 122 0 30 0 122 0 32 0 122 0 33 0 122 0 34 0 122 0 36 0 122 0 38 0 122 0 40 0 122 0 41 0 122 0 65 0 122 0 66 0 122 0 70 0 122 0 88 0 122 0 90 0 122 0 92 0 122 0 93 0 122 0 95 0 122 0 106 0 122 0 107 0 122 1 17] 
#[0 0 126 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[1 0 130 0 2 0 130 0 3 4 17 0 4 0 130 0 6 0 130 0 7 0 130 0 10 4 21 0 11 0 130 0 14 0 130 0 17 0 130 0 18 0 130 0 23 0 130 0 24 0 130 0 25 0 130 0 27 0 130 0 29 0 130 0 30 0 130 0 32 0 130 0 33 0 130 0 34 0 130 0 36 0 130 0 38 0 130 0 40 0 130 0 41 0 130 0 65 0 130 0 66 0 130 0 70 0 130 0 88 0 130 0 90 0 130 0 92 4 25 0 93 0 130 0 95 0 130 0 106 0 130 0 107 0 130 1 17] 
#[1 0 134 0 2 0 134 0 3 0 134 0 6 0 134 0 7 0 134 0 10 4 29 0 14 0 134 0 17 4 33 0 18 0 134 0 23 0 134 0 24 0 134 0 25 0 134 0 27 0 134 0 29 0 134 0 30 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 36 0 134 0 38 0 134 0 40 0 134 0 41 0 134 0 65 0 134 0 66 0 134 0 70 0 134 0 88 0 134 0 90 0 134 0 92 0 134 0 95 0 134 0 106 0 134 0 107 0 134 1 17] 
#[1 0 138 0 2 0 138 0 3 0 138 0 6 0 138 0 7 0 138 0 10 0 138 0 17 0 138 0 23 0 138 0 24 4 37 0 25 0 138 0 27 0 138 0 29 0 138 0 30 0 138 0 32 0 138 0 33 4 41 0 34 4 45 0 36 0 138 0 38 0 138 0 40 0 138 0 41 0 138 0 65 0 138 0 66 0 138 0 70 0 138 0 88 0 138 0 90 0 138 0 92 0 138 0 95 0 138 0 106 0 138 0 107 0 138 1 17] 
#[1 0 142 0 2 0 142 0 3 0 142 0 6 0 142 0 7 0 142 0 10 0 142 0 17 0 142 0 23 4 49 0 24 4 53 0 27 0 142 0 29 0 142 0 30 4 57 0 32 4 61 0 33 0 142 0 38 0 142 0 40 0 142 0 41 4 65 0 65 4 69 0 66 0 142 0 70 0 142 0 88 0 142 0 90 0 142 0 92 0 142 0 95 0 142 0 106 0 142 0 107 0 142 1 17] 
#[1 4 73 0 2 4 77 0 3 0 146 0 6 0 146 0 7 0 146 0 10 0 146 0 17 0 146 0 23 4 81 0 29 4 85 0 30 0 146 0 38 0 146 0 40 0 146 0 41 0 146 0 70 0 146 0 88 0 146 0 90 0 146 0 92 0 146 0 95 0 146 0 106 0 146 0 107 0 146 1 17] 
#[1 4 89 0 6 0 150 0 7 0 150 0 10 0 150 0 17 0 150 0 23 0 150 0 38 0 150 0 40 0 150 0 41 0 150 0 70 0 150 0 88 0 150 0 90 0 150 0 92 0 150 0 95 0 150 0 106 0 150 0 107 0 150 1 17] 
#[1 0 154 0 7 0 154 0 10 0 154 0 17 0 154 0 23 0 154 0 38 0 154 0 40 4 93 0 41 0 154 0 70 0 154 0 88 0 154 0 90 0 154 0 92 0 154 0 95 0 154 0 106 0 154 0 107 0 154 1 17] 
#[1 0 158 0 7 0 158 0 10 0 158 0 17 0 158 0 23 0 158 0 38 0 158 0 40 0 158 0 70 4 97 0 88 0 158 0 90 0 158 0 92 0 158 0 95 0 158 0 106 0 158 0 107 0 158 1 17] 
#[1 4 101 0 7 0 162 0 10 0 162 0 17 0 162 0 23 0 162 0 38 0 162 0 40 0 162 0 70 0 162 0 90 0 162 0 92 0 162 0 95 0 162 0 106 0 162 0 107 0 162 1 17] 
#[1 0 166 0 10 0 166 0 17 0 166 0 23 4 105 0 38 0 166 0 40 0 166 0 70 4 109 0 90 0 166 0 92 0 166 0 95 0 166 0 106 0 166 0 107 0 166 1 17] 
#[0 0 170 0 10 0 17 0 23 0 40 0 70 0 92 0 95 0 106 0 107 1 17] 
#[0 0 174 0 10 0 17 0 23 0 40 0 92 0 106 0 107 1 17] 
#[1 4 113 0 17 4 117 0 92] 
#[0 0 178 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 186 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 190 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 178 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 4 121 0 111 4 125 0 175 4 129 0 176 4 133 0 180 4 133 0 181 4 133 0 182] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 194 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 194 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 170 0 10 0 17 0 23 0 40 0 70 0 92 0 95 0 106 0 107 1 17] 
#[0 4 137 0 31] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 170 0 10 0 17 0 23 0 40 0 70 0 92 0 95 0 106 0 107 1 17] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 198 1 17] 
#[0 0 202 1 17] 
#[0 0 206 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 0 81 0 55 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 101 0 64 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 4 141 0 164 4 141 0 167 4 141 0 168 4 141 0 169 4 141 0 172 4 141 0 173 1 105 0 174 4 141 0 177 4 141 0 191 4 141 0 192 4 141 0 193 4 141 0 194 4 141 0 197 4 141 0 198 4 141 0 200 4 141 0 201 4 141 0 202 4 141 0 208 4 141 0 210 4 141 0 211 4 141 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 4 141 0 253 4 141 0 254 4 141 1 8 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16 0 210 1 17] 
#[0 0 214 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 190 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 190 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 218 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 222 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 230 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 3 93 0 11 4 145 0 39 3 101 0 62 3 105 0 72 3 109 0 95 1 241 0 97 4 153 0 100 4 157 0 101 4 149 0 111 3 117 0 124 3 121 0 125 3 125 0 126 3 125 0 127 3 125 0 128 3 121 0 129 3 121 0 229 3 121 0 231 4 153 1 14 4 157 1 15] 
#[0 0 62 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 56 0 60 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 4 113 0 17 0 0 1 17] 
#[0 0 0 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 4 161 0 164 4 161 0 167 4 161 0 168 4 161 0 169 4 161 0 172 4 161 0 173 1 105 0 174 4 161 0 177 4 161 0 191 4 161 0 192 4 161 0 193 4 161 0 194 4 161 0 197 4 161 0 198 4 161 0 200 4 161 0 201 4 161 0 202 4 161 0 208 4 161 0 210 4 161 0 211 4 161 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16 0 234 1 17] 
#[0 0 238 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 57 0 59 0 61 0 63 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 0 1 17] 
#[0 0 242 1 17] 
#[0 0 246 1 17] 
#[0 0 0 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 2 57 0 159 2 57 0 160 2 57 0 163 0 241 0 217 2 57 0 226 1 173 0 227 0 241 0 233 2 57 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 0 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 114 0 2 0 114 0 3 0 114 0 4 0 114 0 6 0 114 0 7 0 114 0 10 0 114 0 11 0 114 0 12 0 114 0 14 3 221 0 15 0 114 0 17 0 114 0 18 3 229 0 19 0 114 0 23 0 114 0 24 0 114 0 25 0 114 0 27 0 114 0 29 0 114 0 30 0 114 0 32 0 114 0 33 0 114 0 34 0 114 0 36 0 114 0 38 0 114 0 40 0 114 0 41 0 114 0 65 0 114 0 66 0 114 0 70 0 114 0 88 0 114 0 90 0 114 0 92 0 114 0 93 0 114 0 95 0 114 0 106 0 114 0 107 0 114 1 17] 
#[0 0 250 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[1 0 22 0 1 0 22 0 9 0 22 0 14 0 22 0 15 2 97 0 17 0 22 0 18 0 22 0 19 0 22 0 22 0 22 0 39 0 22 0 40 0 22 0 47 0 22 0 52 0 22 0 57 0 22 0 61 0 22 0 68 0 22 0 69 0 22 0 74 0 22 0 77 0 22 0 79 0 22 0 81 0 22 0 83 0 22 0 86 0 22 0 87 0 22 0 91 0 22 0 97 0 22 0 100 0 22 0 101 0 22 0 102 0 22 0 104 0 22 0 105 2 101 0 119 4 165 0 120 2 109 0 121 4 169 0 184 4 173 0 185] 
#[1 3 93 0 11 4 145 0 39 3 101 0 62 3 105 0 72 4 177 0 95 1 241 0 97 4 153 0 100 4 157 0 101 4 181 0 111 3 117 0 124 3 121 0 125 4 185 0 126 4 185 0 127 4 185 0 128 3 121 0 129 4 189 0 183 4 193 0 186 4 193 0 188 3 121 0 229 3 121 0 231 4 153 1 14 4 157 1 15] 
#[1 0 82 0 2 0 82 0 3 0 82 0 4 0 82 0 5 0 82 0 6 0 82 0 7 0 82 0 8 0 82 0 9 0 15 0 10 0 82 0 11 0 82 0 12 0 82 0 13 0 82 0 14 0 82 0 15 0 82 0 16 0 15 0 17 0 82 0 18 0 82 0 19 0 82 0 20 0 82 0 21 0 82 0 24 0 82 0 25 0 82 0 26 0 82 0 27 0 19 0 28 0 82 0 29 0 82 0 30 0 86 0 31 0 82 0 32 0 82 0 33 0 82 0 34 0 82 0 35 0 82 0 36 0 82 0 37 0 82 0 38 0 82 0 39 0 15 0 40 0 82 0 41 0 82 0 42 0 82 0 65 0 82 0 66 0 82 0 88 0 82 0 89 0 82 0 90 0 82 0 93 0 82 0 94 0 15 0 95 0 82 0 104 0 82 0 105 4 205 0 130 4 209 0 131] 
#[1 4 213 0 10 4 217 0 17] 
#[1 1 2 0 10 0 23 0 17] 
#[1 4 225 0 10 4 113 0 17] 
#[1 0 254 0 10 0 254 0 17 4 201 0 28 0 254 0 40 0 254 0 95 4 229 0 130 4 209 0 131] 
#[0 1 6 0 10 0 17 0 28 0 40 0 65 0 70 0 95] 
#[0 1 6 0 10 0 17 0 28 0 40 0 65 0 70 0 95] 
#[0 1 10 0 10 0 17] 
#[0 1 14 0 10 0 17 0 40 0 95] 
#[0 0 250 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 1 18 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 0 250 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 1 18 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 1 22 0 1 0 9 0 14 0 15 0 17 0 18 0 19 0 22 0 39 0 40 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[1 4 233 0 17 4 237 0 40 4 241 0 121] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 4 245 0 22 0 49 0 39 4 249 0 40 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 4 253 0 122 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 1 0 159 5 1 0 160 0 241 0 217 5 1 0 226 1 173 0 227 0 241 0 233 5 1 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 1 26 0 1 1 26 0 9 1 26 0 14 1 26 0 15 5 5 0 17 1 26 0 18 1 26 0 19 1 26 0 22 1 26 0 39 1 26 0 40 1 26 0 47 1 26 0 52 1 26 0 57 1 26 0 61 1 26 0 68 1 26 0 69 1 26 0 74 1 26 0 77 1 26 0 79 1 26 0 81 1 26 0 83 1 26 0 86 1 26 0 87 1 26 0 91 1 26 0 97 1 26 0 100 1 26 0 101 1 26 0 102 1 26 0 104 1 26 0 105] 
#[1 0 30 0 92 1 241 0 97 5 9 0 110 5 9 0 111] 
#[1 5 13 0 56 1 30 0 87 5 17 0 239 5 21 0 240 5 25 0 241] 
#[0 1 34 0 9 0 56 0 87 0 92] 
#[1 0 30 0 92 1 241 0 97 5 29 0 110 5 29 0 111] 
#[0 1 38 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 0 250 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 5 33 0 84] 
#[1 5 37 0 60 5 41 1 3] 
#[1 0 30 0 56 0 30 0 87 1 241 0 97 5 45 0 110 5 45 0 111] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 49 0 159 5 49 0 160 0 241 0 217 5 49 0 226 1 173 0 227 0 241 0 233 5 49 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 30 0 9 5 53 0 11 1 241 0 97 5 57 0 110 5 57 0 111] 
#[1 5 61 0 95 5 65 0 98 5 69 1 10 5 73 1 11] 
#[0 1 42 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 1 46 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 1 46 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 1 50 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 1 54 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 1 54 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 1 46 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 5 37 0 60 5 77 0 92 5 81 1 3] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 5 105 0 48 0 73 0 52 1 221 0 57 0 93 0 61 5 105 0 67 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 5 85 0 82 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 58 0 92 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 5 89 0 140 1 5 0 141 1 5 0 142 5 89 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 97 0 159 5 97 0 160 5 93 0 162 5 97 0 163 5 101 0 173 5 105 0 174 5 109 0 195 0 241 0 217 5 97 0 226 1 173 0 227 0 241 0 233 5 97 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 30 0 9 1 241 0 97 5 113 0 110 5 113 0 111] 
#[0 5 117 0 9] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 121 0 159 5 121 0 160 5 121 0 163 0 241 0 217 5 121 0 226 1 173 0 227 0 241 0 233 5 121 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 5 125 0 43] 
#[1 5 129 0 95 1 241 0 97 5 133 0 98 5 145 0 111 5 137 1 4 5 141 1 5 5 145 1 7] 
#[0 1 62 0 17 0 60 0 95] 
#[1 5 37 0 60 5 149 1 3] 
#[1 5 153 0 17 1 66 0 60] 
#[0 1 66 0 60] 
#[0 1 66 0 60] 
#[0 5 157 0 92] 
#[0 1 70 0 17 0 60] 
#[0 1 74 0 92] 
#[0 5 161 0 76] 
#[1 3 17 0 21 3 21 0 39] 
#[1 0 98 0 2 0 98 0 3 0 98 0 4 0 98 0 5 0 98 0 6 0 98 0 7 0 98 0 8 3 13 0 9 0 98 0 10 0 98 0 11 0 98 0 12 0 98 0 13 0 98 0 14 0 98 0 15 0 98 0 16 0 98 0 17 0 98 0 18 0 98 0 19 0 98 0 20 3 177 0 21 0 98 0 23 0 98 0 24 0 98 0 25 0 98 0 26 0 98 0 27 0 98 0 28 0 98 0 29 0 98 0 30 0 98 0 32 0 98 0 33 0 98 0 34 0 98 0 35 0 98 0 36 0 98 0 37 0 98 0 38 3 181 0 39 0 98 0 40 0 98 0 41 0 98 0 42 0 98 0 65 0 98 0 66 0 98 0 70 0 98 0 87 0 98 0 88 0 98 0 89 0 98 0 90 0 98 0 92 0 98 0 93 0 98 0 94 0 98 0 95 0 197 0 104 0 6 0 105 0 98 0 106 0 98 0 107 3 185 0 132 0 237 0 133 5 165 0 143 0 98 1 17] 
#[0 1 78 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 58 0 92 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 97 0 159 5 97 0 160 5 169 0 162 5 97 0 163 0 241 0 217 5 97 0 226 1 173 0 227 0 241 0 233 5 97 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 5 173 0 10 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 5 177 0 22 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 5 181 0 144 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 185 0 159 5 185 0 160 0 241 0 217 5 185 0 226 1 173 0 227 0 241 0 233 5 185 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 5 189 0 98] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 193 0 159 5 193 0 160 5 193 0 163 0 241 0 217 5 193 0 226 1 173 0 227 0 241 0 233 5 193 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 197 0 159 5 197 0 160 5 197 0 163 0 241 0 217 5 197 0 226 1 173 0 227 0 241 0 233 5 197 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 4 113 0 17 5 201 0 92] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 3 141 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 5 205 0 46 5 209 0 58 5 213 0 212 5 217 0 213] 
#[0 0 250 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[1 2 97 0 17 0 22 0 22 0 22 0 39 0 22 0 40 0 22 0 87 0 22 0 97 5 221 0 120 2 109 0 121 4 169 0 184 4 173 0 185] 
#[1 4 145 0 39 5 225 0 95 1 241 0 97 4 153 0 100 4 157 0 101 5 229 0 111 5 233 0 126 5 233 0 127 5 233 0 128 4 189 0 183 4 193 0 186 4 193 0 188 4 153 1 14 4 157 1 15] 
#[1 0 254 0 17 4 201 0 28 0 254 0 92 5 237 0 130 4 209 0 131] 
#[1 5 241 0 17 5 245 0 92] 
#[0 1 86 0 17 0 92] 
#[1 4 201 0 28 5 249 0 131] 
#[0 0 250 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 253 0 159 5 253 0 160 5 253 0 163 0 241 0 217 5 253 0 226 1 173 0 227 0 241 0 233 5 253 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 1 0 159 6 1 0 160 6 1 0 163 0 241 0 217 6 1 0 226 1 173 0 227 0 241 0 233 6 1 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 90 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 5 0 159 6 5 0 160 0 241 0 217 6 5 0 226 1 173 0 227 0 241 0 233 6 5 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 4 145 0 39 1 241 0 97 4 153 0 100 4 157 0 101 6 13 0 111 6 13 0 126 6 13 0 127 6 13 0 128 4 153 1 14 4 157 1 15] 
#[1 0 27 0 1 0 31 0 9 0 35 0 14 0 39 0 15 2 97 0 17 0 43 0 18 0 47 0 19 0 22 0 22 0 51 0 39 0 22 0 40 0 55 0 47 0 59 0 52 0 63 0 57 0 67 0 61 0 71 0 68 0 75 0 69 0 79 0 74 0 83 0 77 0 87 0 79 0 91 0 81 0 95 0 83 0 99 0 86 0 103 0 87 0 107 0 91 0 111 0 97 0 115 0 100 0 119 0 101 0 123 0 102 0 127 0 104 0 131 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 2 101 0 119 2 105 0 120 2 109 0 121 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 17 0 159 6 17 0 160 0 241 0 217 6 17 0 226 1 173 0 227 0 241 0 233 6 17 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 4 145 0 39 1 241 0 97 4 153 0 100 4 157 0 101 6 21 0 111 6 21 0 126 6 21 0 127 6 21 0 128 4 153 1 14 4 157 1 15] 
#[1 4 145 0 39 1 241 0 97 4 153 0 100 4 157 0 101 6 25 0 111 6 25 0 126 6 25 0 127 6 25 0 128 4 153 1 14 4 157 1 15] 
#[0 1 94 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 82 0 2 0 82 0 3 0 82 0 4 0 82 0 5 0 82 0 6 0 82 0 7 0 82 0 8 0 135 0 9 0 82 0 11 0 82 0 12 0 82 0 13 0 82 0 14 0 82 0 15 0 82 0 16 0 139 0 17 0 82 0 18 0 82 0 19 0 82 0 20 0 82 0 21 1 98 0 23 0 82 0 24 0 82 0 25 0 82 0 26 0 82 0 27 0 19 0 28 0 82 0 29 0 82 0 30 0 86 0 31 0 82 0 32 0 82 0 33 0 82 0 34 0 82 0 35 0 82 0 36 0 82 0 37 0 82 0 38 0 82 0 39 0 82 0 41 0 82 0 42 0 82 0 65 0 82 0 66 0 82 0 88 0 82 0 89 0 82 0 90 0 82 0 92 0 82 0 93 0 82 0 94 1 102 0 95 0 82 0 104 0 82 0 105 6 29 0 131] 
#[1 6 33 0 17 6 37 0 95] 
#[0 1 106 0 17 0 95] 
#[1 6 41 0 9 6 45 0 23] 
#[0 1 110 0 9 0 23] 
#[0 1 110 0 9 0 23] 
#[0 1 102 0 17 0 95] 
#[0 6 49 0 95] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 1 114 0 45 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 1 114 0 51 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 1 114 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 4 161 0 164 4 161 0 167 4 161 0 168 4 161 0 169 4 161 0 172 4 161 0 173 1 105 0 174 4 161 0 177 4 161 0 191 4 161 0 192 4 161 0 193 4 161 0 194 4 161 0 197 4 161 0 198 4 161 0 200 4 161 0 201 4 161 0 202 4 161 0 208 4 161 0 210 4 161 0 211 4 161 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 102 0 17 0 95] 
#[0 1 118 0 11 0 17 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[1 0 226 0 2 0 226 0 3 0 226 0 4 0 226 0 5 0 226 0 6 0 226 0 7 0 226 0 8 0 143 0 9 0 226 0 11 0 226 0 12 0 226 0 13 0 226 0 14 0 226 0 15 0 226 0 16 0 226 0 17 0 226 0 18 0 226 0 19 0 226 0 20 0 226 0 21 1 122 0 23 0 226 0 24 0 226 0 25 0 226 0 26 0 226 0 27 0 226 0 28 0 226 0 29 0 226 0 30 0 226 0 32 0 226 0 33 0 226 0 34 0 226 0 35 0 226 0 36 0 226 0 37 0 226 0 38 0 226 0 39 0 226 0 41 0 226 0 42 0 226 0 65 0 226 0 66 0 226 0 88 0 226 0 89 0 226 0 90 0 226 0 92 0 226 0 93 0 226 0 94 0 226 0 104 0 226 0 105] 
#[1 0 230 0 2 0 230 0 3 0 230 0 4 0 230 0 5 0 230 0 6 0 230 0 7 0 230 0 8 0 147 0 9 0 230 0 11 0 230 0 12 0 230 0 13 0 230 0 14 0 230 0 15 0 230 0 16 0 230 0 17 0 230 0 18 0 230 0 19 0 230 0 20 0 230 0 21 1 122 0 23 0 230 0 24 0 230 0 25 0 230 0 26 0 230 0 27 0 230 0 28 0 230 0 29 0 230 0 30 0 230 0 32 0 230 0 33 0 230 0 34 0 230 0 35 0 230 0 36 0 230 0 37 0 230 0 38 0 230 0 39 0 230 0 41 0 230 0 42 0 230 0 65 0 230 0 66 0 230 0 88 0 230 0 89 0 230 0 90 0 230 0 92 0 230 0 93 0 230 0 94 0 230 0 104 0 230 0 105] 
#[0 0 250 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 6 57 0 164 6 57 0 167 6 57 0 168 6 57 0 169 6 57 0 177 6 57 0 191 6 57 0 192 6 57 0 193 6 57 0 194 6 57 0 197 6 57 0 198 6 57 0 200 6 57 0 201 6 57 0 202 6 57 0 208 6 57 0 209 6 57 0 210 6 57 0 211 6 57 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 61 0 159 6 61 0 160 6 61 0 163 0 241 0 217 6 61 0 226 1 173 0 227 0 241 0 233 6 61 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 6 65 0 98] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 69 0 159 6 69 0 160 6 69 0 163 0 241 0 217 6 69 0 226 1 173 0 227 0 241 0 233 6 69 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 126 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 1 130 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 6 73 0 98] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 77 0 159 6 77 0 160 6 77 0 163 0 241 0 217 6 77 0 226 1 173 0 227 0 241 0 233 6 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 134 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 1 130 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 142 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 142 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 12 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 1 138 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 81 0 159 6 81 0 160 0 241 0 217 6 81 0 226 1 173 0 227 0 241 0 233 6 81 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 6 85 0 148 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 6 89 0 146 6 89 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 6 93 0 146 6 93 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 6 97 0 146 6 97 0 147 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 6 101 0 148 6 101 0 149 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 6 105 0 148 6 105 0 149 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 6 109 0 150 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 6 113 0 150 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 6 117 0 150 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 6 121 0 151 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 6 125 0 151 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 6 129 0 151 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 6 133 0 151 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 6 137 0 151 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 6 141 0 151 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 6 145 0 152 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 6 149 0 152 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 6 153 0 152 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 6 157 0 152 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 6 161 0 153 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 6 165 0 154 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 6 169 0 155 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 6 173 0 156 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 177 0 159 6 177 0 160 0 241 0 217 6 177 0 226 1 173 0 227 0 241 0 233 6 177 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 2 21 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 2 29 0 140 1 5 0 141 1 5 0 142 2 29 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 6 181 0 157 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 185 0 159 6 185 0 160 0 241 0 217 6 185 0 226 1 173 0 227 0 241 0 233 6 185 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 146 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 254 0 17 4 201 0 28 0 254 0 92 6 189 0 130 4 209 0 131] 
#[1 6 193 0 17 6 197 0 92] 
#[0 1 150 0 17 0 92] 
#[1 4 201 0 28 6 201 0 131] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 6 205 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 209 0 159 6 209 0 160 0 241 0 217 6 209 0 226 1 173 0 227 6 213 0 228 0 241 0 233 6 209 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 154 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 6 17 0 159 6 17 0 160 0 241 0 217 6 17 0 226 1 173 0 227 0 241 0 233 6 17 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 1 98 0 9 1 102 0 17 1 98 0 23 4 201 0 28 1 102 0 95 6 29 0 131] 
#[0 1 122 0 9 0 23] 
#[0 1 122 0 9 0 23] 
#[0 1 158 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 57 0 59 0 61 0 63 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 6 217 0 22 2 37 0 39 0 151 0 40 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 2 41 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 2 45 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 4 253 0 122 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 1 0 159 5 1 0 160 2 61 0 180 2 61 0 181 2 61 0 182 6 221 0 187 6 221 0 188 6 225 0 189 6 225 0 190 0 241 0 217 5 1 0 226 1 173 0 227 0 241 0 233 5 1 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 6 233 0 17 6 237 0 40] 
#[0 1 166 0 17 0 40] 
#[1 1 94 0 2 1 94 0 3 1 94 0 4 1 94 0 5 1 94 0 6 1 94 0 7 1 94 0 8 1 94 0 9 0 155 0 10 1 94 0 11 1 94 0 12 1 94 0 13 1 94 0 14 1 94 0 15 1 94 0 16 0 155 0 17 1 94 0 18 1 94 0 19 1 94 0 20 1 94 0 21 1 94 0 24 1 94 0 25 1 94 0 26 1 94 0 27 0 155 0 28 1 94 0 29 1 94 0 30 1 94 0 32 1 94 0 33 1 94 0 34 1 94 0 35 1 94 0 36 1 94 0 37 1 94 0 38 1 94 0 39 0 155 0 40 1 94 0 41 1 94 0 42 1 94 0 65 1 94 0 66 1 94 0 88 1 94 0 89 1 94 0 90 1 94 0 93 1 94 0 94 0 155 0 95 1 94 0 104 1 94 0 105] 
#[1 1 98 0 9 0 159 0 17 1 98 0 23 4 201 0 28 0 159 0 95 4 205 0 130 6 241 0 131] 
#[1 6 41 0 9 6 245 0 23] 
#[1 6 249 0 17 6 253 0 95] 
#[0 1 174 0 17 0 95] 
#[0 1 178 0 17 0 95] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 7 1 0 159 7 1 0 160 0 241 0 217 7 1 0 226 1 173 0 227 0 241 0 233 7 1 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 182 0 10 0 17 0 40 0 95] 
#[0 1 186 0 10 0 17 0 40 0 70 0 92 0 95] 
#[0 1 190 0 31] 
#[0 7 5 0 22] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 7 13 0 187 7 13 0 188] 
#[0 1 194 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 1 198 0 10 0 17 0 40 0 95] 
#[1 0 22 0 1 0 22 0 9 0 22 0 14 0 22 0 15 0 163 0 17 0 22 0 18 0 22 0 19 0 22 0 22 0 22 0 39 1 22 0 40 0 22 0 47 0 22 0 52 0 22 0 57 0 22 0 61 0 22 0 68 0 22 0 69 0 22 0 74 0 22 0 77 0 22 0 79 0 22 0 81 0 22 0 83 0 22 0 86 0 22 0 87 0 22 0 91 0 22 0 97 0 22 0 100 0 22 0 101 0 22 0 102 0 22 0 104 0 22 0 105 7 17 0 120 2 109 0 121] 
#[0 1 202 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 5 5 0 17 7 21 0 40] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 7 25 0 159 7 25 0 160 0 241 0 217 7 25 0 226 1 173 0 227 0 241 0 233 7 25 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 206 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 1 210 0 17 0 40] 
#[0 1 210 0 17 0 40] 
#[0 1 214 0 1 0 9 0 14 0 15 0 17 0 18 0 19 0 22 0 39 0 40 0 47 0 52 0 57 0 61 0 68 0 69 0 74 0 77 0 79 0 81 0 83 0 86 0 87 0 91 0 97 0 100 0 101 0 102 0 104 0 105] 
#[0 7 29 0 92] 
#[1 2 21 0 9 0 49 0 39 0 57 0 47 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 1 237 0 87 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 241 0 111 0 241 0 112 0 241 0 113 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 7 33 0 140 1 5 0 141 1 5 0 142 7 33 0 145 0 241 0 217 0 241 0 233 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 1 218 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 7 37 0 87] 
#[0 1 222 0 87] 
#[0 7 41 0 92] 
#[0 7 45 0 9] 
#[0 7 49 0 100 1 6 1 14] 
#[0 7 53 0 92] 
#[1 5 13 0 56 1 30 0 87 7 57 0 239 5 21 0 240 5 25 0 241] 
#[0 7 61 0 92] 
#[1 0 30 0 9 1 241 0 97 7 65 0 110 7 65 0 111] 
#[0 7 69 0 9] 
#[0 1 226 0 60 0 92] 
#[1 1 230 0 17 7 73 0 43 1 230 0 95] 
#[1 7 77 0 17 7 81 0 95] 
#[0 1 234 0 17 0 95] 
#[0 1 238 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 7 85 0 92] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 7 89 0 111 7 93 0 178 7 97 0 179 7 101 0 180 7 101 0 181 7 101 0 182 7 105 0 196] 
#[1 0 114 0 2 0 114 0 3 0 114 0 4 4 9 0 5 0 114 0 6 0 114 0 7 4 9 0 8 0 114 0 11 0 114 0 12 4 9 0 13 0 114 0 14 3 221 0 15 4 9 0 16 0 114 0 17 0 114 0 18 3 229 0 19 4 9 0 20 0 114 0 24 0 114 0 25 4 9 0 26 0 114 0 27 4 9 0 28 0 114 0 29 0 114 0 30 0 114 0 32 0 114 0 33 0 114 0 34 4 9 0 35 0 114 0 36 4 9 0 37 0 114 0 38 0 114 0 41 4 9 0 42 0 167 0 65 0 114 0 66 7 113 0 70 0 114 0 88 4 9 0 89 0 114 0 90 0 114 0 92 0 114 0 93 4 9 0 94 4 9 0 161] 
#[0 7 117 0 92] 
#[1 1 242 0 10 4 113 0 17 1 242 0 92] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 58 0 92 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 97 0 159 5 97 0 160 7 121 0 162 5 97 0 163 0 241 0 217 5 97 0 226 1 173 0 227 0 241 0 233 5 97 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 7 125 0 111 4 125 0 175 4 129 0 176 7 129 0 180 7 129 0 181 7 129 0 182 7 133 0 196] 
#[1 7 137 0 65 7 141 0 70] 
#[0 7 145 0 9] 
#[1 1 246 0 10 7 149 0 22 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 7 177 0 187 7 177 0 188 7 173 0 190 7 161 0 219 7 165 0 220 7 169 0 221 7 173 0 222 7 177 0 223] 
#[1 7 181 0 10 4 113 0 17] 
#[1 1 241 0 97 7 185 0 111 7 185 1 7] 
#[0 1 250 0 60] 
#[0 7 189 0 43] 
#[1 7 193 0 17 7 197 0 95] 
#[0 1 254 0 17 0 95] 
#[0 2 2 0 17 0 95] 
#[0 7 201 0 92] 
#[1 2 209 0 11 2 213 0 87 7 205 1 1 7 209 1 2] 
#[0 2 6 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 2 10 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 2 14 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 7 213 0 92] 
#[0 2 18 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 7 217 0 159 7 217 0 160 0 241 0 217 7 217 0 226 1 173 0 227 0 241 0 233 7 217 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 7 221 0 10 7 225 0 17] 
#[0 2 22 0 10 0 17] 
#[0 2 26 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 4 113 0 17 7 229 0 40] 
#[1 7 233 0 10 4 113 0 17] 
#[0 2 30 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 7 237 0 9] 
#[1 3 37 0 87 7 241 0 169] 
#[1 2 34 0 1 2 34 0 9 2 34 0 14 2 34 0 15 2 34 0 18 2 34 0 19 2 34 0 39 2 34 0 44 2 34 0 45 2 34 0 47 2 34 0 48 2 34 0 49 2 34 0 50 2 34 0 51 2 34 0 52 2 34 0 53 2 34 0 54 2 34 0 55 2 34 0 57 5 209 0 58 2 34 0 59 2 34 0 61 2 34 0 63 2 34 0 64 2 34 0 67 2 34 0 68 2 34 0 69 2 34 0 71 2 34 0 74 2 34 0 75 2 34 0 77 2 34 0 78 2 34 0 79 2 34 0 80 2 34 0 81 2 34 0 82 2 34 0 83 2 34 0 84 2 34 0 85 2 34 0 86 2 34 0 87 2 34 0 91 2 34 0 92 2 34 0 95 2 34 0 97 2 34 0 100 2 34 0 101 2 34 0 102 2 34 0 104 2 34 0 105 7 245 0 213 2 34 1 17] 
#[0 2 38 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 7 149 0 22 3 49 0 39 1 162 0 40 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 6 221 0 187 6 221 0 188 6 225 0 189 6 225 0 190] 
#[0 1 170 0 10 0 17 0 28 0 40 0 65 0 70 0 95] 
#[1 0 254 0 17 1 98 0 23 4 201 0 28 0 254 0 95 4 205 0 130 4 209 0 131] 
#[0 7 249 0 23] 
#[0 2 42 0 17 0 70 0 92] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 3 57 0 111 7 253 0 179 3 69 0 180 3 69 0 181 3 69 0 182] 
#[0 2 46 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 2 50 0 17 0 70 0 92] 
#[1 8 1 0 10 4 113 0 17] 
#[1 8 5 0 10 4 113 0 17] 
#[0 2 54 0 10 0 17 0 23 0 40 0 70 0 92 0 95 0 106 0 107 1 17] 
#[0 1 98 0 9] 
#[0 8 9 0 9] 
#[0 8 13 0 40] 
#[0 8 17 0 9] 
#[0 8 21 0 9] 
#[0 2 58 0 17 0 95] 
#[1 3 93 0 11 4 145 0 39 3 101 0 62 3 105 0 72 8 25 0 95 1 241 0 97 4 153 0 100 4 157 0 101 4 149 0 111 8 29 0 125 3 125 0 126 3 125 0 127 3 125 0 128 8 29 0 129 8 29 0 229 8 29 0 231 4 153 1 14 4 157 1 15] 
#[0 2 62 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 1 246 0 10 7 149 0 22 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 7 177 0 187 7 177 0 188 7 173 0 190 8 33 0 218 8 37 0 219 7 165 0 220 7 169 0 221 7 173 0 222 7 177 0 223] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 8 41 0 159 8 41 0 160 0 241 0 217 8 41 0 226 1 173 0 227 0 241 0 233 8 41 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 2 66 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 2 70 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 2 74 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 4 113 0 17 8 45 0 106 8 49 0 107 8 53 0 134 8 57 0 135] 
#[0 2 78 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 4 113 0 17 8 61 0 40] 
#[0 2 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 4 113 0 17 8 65 0 40] 
#[0 2 86 0 10 0 17 0 23 0 40 0 70 0 92 0 95 0 106 0 107 1 17] 
#[0 2 90 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 2 94 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 2 94 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[0 2 94 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 14 0 17 0 18 0 23 0 24 0 25 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 38 0 40 0 41 0 65 0 66 0 70 0 88 0 90 0 92 0 93 0 95 0 106 0 107 1 17] 
#[1 2 98 0 2 2 98 0 3 4 17 0 4 2 98 0 6 2 98 0 7 2 98 0 10 4 21 0 11 2 98 0 14 2 98 0 17 2 98 0 18 2 98 0 23 2 98 0 24 2 98 0 25 2 98 0 27 2 98 0 29 2 98 0 30 2 98 0 32 2 98 0 33 2 98 0 34 2 98 0 36 2 98 0 38 2 98 0 40 2 98 0 41 2 98 0 65 2 98 0 66 2 98 0 70 2 98 0 88 2 98 0 90 2 98 0 92 4 25 0 93 2 98 0 95 2 98 0 106 2 98 0 107 2 98 1 17] 
#[1 2 98 0 2 2 98 0 3 4 17 0 4 2 98 0 6 2 98 0 7 2 98 0 10 4 21 0 11 2 98 0 14 2 98 0 17 2 98 0 18 2 98 0 23 2 98 0 24 2 98 0 25 2 98 0 27 2 98 0 29 2 98 0 30 2 98 0 32 2 98 0 33 2 98 0 34 2 98 0 36 2 98 0 38 2 98 0 40 2 98 0 41 2 98 0 65 2 98 0 66 2 98 0 70 2 98 0 88 2 98 0 90 2 98 0 92 4 25 0 93 2 98 0 95 2 98 0 106 2 98 0 107 2 98 1 17] 
#[1 2 102 0 2 2 102 0 3 2 102 0 6 2 102 0 7 2 102 0 10 4 29 0 14 2 102 0 17 4 33 0 18 2 102 0 23 2 102 0 24 2 102 0 25 2 102 0 27 2 102 0 29 2 102 0 30 2 102 0 32 2 102 0 33 2 102 0 34 2 102 0 36 2 102 0 38 2 102 0 40 2 102 0 41 2 102 0 65 2 102 0 66 2 102 0 70 2 102 0 88 2 102 0 90 2 102 0 92 2 102 0 95 2 102 0 106 2 102 0 107 2 102 1 17] 
#[1 2 102 0 2 2 102 0 3 2 102 0 6 2 102 0 7 2 102 0 10 4 29 0 14 2 102 0 17 4 33 0 18 2 102 0 23 2 102 0 24 2 102 0 25 2 102 0 27 2 102 0 29 2 102 0 30 2 102 0 32 2 102 0 33 2 102 0 34 2 102 0 36 2 102 0 38 2 102 0 40 2 102 0 41 2 102 0 65 2 102 0 66 2 102 0 70 2 102 0 88 2 102 0 90 2 102 0 92 2 102 0 95 2 102 0 106 2 102 0 107 2 102 1 17] 
#[1 2 102 0 2 2 102 0 3 2 102 0 6 2 102 0 7 2 102 0 10 4 29 0 14 2 102 0 17 4 33 0 18 2 102 0 23 2 102 0 24 2 102 0 25 2 102 0 27 2 102 0 29 2 102 0 30 2 102 0 32 2 102 0 33 2 102 0 34 2 102 0 36 2 102 0 38 2 102 0 40 2 102 0 41 2 102 0 65 2 102 0 66 2 102 0 70 2 102 0 88 2 102 0 90 2 102 0 92 2 102 0 95 2 102 0 106 2 102 0 107 2 102 1 17] 
#[1 2 106 0 2 2 106 0 3 2 106 0 6 2 106 0 7 2 106 0 10 2 106 0 17 2 106 0 23 2 106 0 24 4 37 0 25 2 106 0 27 2 106 0 29 2 106 0 30 2 106 0 32 2 106 0 33 4 41 0 34 4 45 0 36 2 106 0 38 2 106 0 40 2 106 0 41 2 106 0 65 2 106 0 66 2 106 0 70 2 106 0 88 2 106 0 90 2 106 0 92 2 106 0 95 2 106 0 106 2 106 0 107 2 106 1 17] 
#[1 2 106 0 2 2 106 0 3 2 106 0 6 2 106 0 7 2 106 0 10 2 106 0 17 2 106 0 23 2 106 0 24 4 37 0 25 2 106 0 27 2 106 0 29 2 106 0 30 2 106 0 32 2 106 0 33 4 41 0 34 4 45 0 36 2 106 0 38 2 106 0 40 2 106 0 41 2 106 0 65 2 106 0 66 2 106 0 70 2 106 0 88 2 106 0 90 2 106 0 92 2 106 0 95 2 106 0 106 2 106 0 107 2 106 1 17] 
#[1 2 106 0 2 2 106 0 3 2 106 0 6 2 106 0 7 2 106 0 10 2 106 0 17 2 106 0 23 2 106 0 24 4 37 0 25 2 106 0 27 2 106 0 29 2 106 0 30 2 106 0 32 2 106 0 33 4 41 0 34 4 45 0 36 2 106 0 38 2 106 0 40 2 106 0 41 2 106 0 65 2 106 0 66 2 106 0 70 2 106 0 88 2 106 0 90 2 106 0 92 2 106 0 95 2 106 0 106 2 106 0 107 2 106 1 17] 
#[1 2 106 0 2 2 106 0 3 2 106 0 6 2 106 0 7 2 106 0 10 2 106 0 17 2 106 0 23 2 106 0 24 4 37 0 25 2 106 0 27 2 106 0 29 2 106 0 30 2 106 0 32 2 106 0 33 4 41 0 34 4 45 0 36 2 106 0 38 2 106 0 40 2 106 0 41 2 106 0 65 2 106 0 66 2 106 0 70 2 106 0 88 2 106 0 90 2 106 0 92 2 106 0 95 2 106 0 106 2 106 0 107 2 106 1 17] 
#[1 2 106 0 2 2 106 0 3 2 106 0 6 2 106 0 7 2 106 0 10 2 106 0 17 2 106 0 23 2 106 0 24 4 37 0 25 2 106 0 27 2 106 0 29 2 106 0 30 2 106 0 32 2 106 0 33 4 41 0 34 4 45 0 36 2 106 0 38 2 106 0 40 2 106 0 41 2 106 0 65 2 106 0 66 2 106 0 70 2 106 0 88 2 106 0 90 2 106 0 92 2 106 0 95 2 106 0 106 2 106 0 107 2 106 1 17] 
#[1 2 106 0 2 2 106 0 3 2 106 0 6 2 106 0 7 2 106 0 10 2 106 0 17 2 106 0 23 2 106 0 24 4 37 0 25 2 106 0 27 2 106 0 29 2 106 0 30 2 106 0 32 2 106 0 33 4 41 0 34 4 45 0 36 2 106 0 38 2 106 0 40 2 106 0 41 2 106 0 65 2 106 0 66 2 106 0 70 2 106 0 88 2 106 0 90 2 106 0 92 2 106 0 95 2 106 0 106 2 106 0 107 2 106 1 17] 
#[1 2 110 0 2 2 110 0 3 2 110 0 6 2 110 0 7 2 110 0 10 2 110 0 17 2 110 0 23 4 49 0 24 4 53 0 27 2 110 0 29 2 110 0 30 4 57 0 32 4 61 0 33 2 110 0 38 2 110 0 40 2 110 0 41 4 65 0 65 4 69 0 66 2 110 0 70 2 110 0 88 2 110 0 90 2 110 0 92 2 110 0 95 2 110 0 106 2 110 0 107 2 110 1 17] 
#[1 2 110 0 2 2 110 0 3 2 110 0 6 2 110 0 7 2 110 0 10 2 110 0 17 2 110 0 23 4 49 0 24 4 53 0 27 2 110 0 29 2 110 0 30 4 57 0 32 4 61 0 33 2 110 0 38 2 110 0 40 2 110 0 41 4 65 0 65 4 69 0 66 2 110 0 70 2 110 0 88 2 110 0 90 2 110 0 92 2 110 0 95 2 110 0 106 2 110 0 107 2 110 1 17] 
#[1 2 110 0 2 2 110 0 3 2 110 0 6 2 110 0 7 2 110 0 10 2 110 0 17 2 110 0 23 4 49 0 24 4 53 0 27 2 110 0 29 2 110 0 30 4 57 0 32 4 61 0 33 2 110 0 38 2 110 0 40 2 110 0 41 4 65 0 65 4 69 0 66 2 110 0 70 2 110 0 88 2 110 0 90 2 110 0 92 2 110 0 95 2 110 0 106 2 110 0 107 2 110 1 17] 
#[1 2 110 0 2 2 110 0 3 2 110 0 6 2 110 0 7 2 110 0 10 2 110 0 17 2 110 0 23 4 49 0 24 4 53 0 27 2 110 0 29 2 110 0 30 4 57 0 32 4 61 0 33 2 110 0 38 2 110 0 40 2 110 0 41 4 65 0 65 4 69 0 66 2 110 0 70 2 110 0 88 2 110 0 90 2 110 0 92 2 110 0 95 2 110 0 106 2 110 0 107 2 110 1 17] 
#[1 4 73 0 2 4 77 0 3 2 114 0 6 2 114 0 7 2 114 0 10 2 114 0 17 2 114 0 23 4 81 0 29 4 85 0 30 2 114 0 38 2 114 0 40 2 114 0 41 2 114 0 70 2 114 0 88 2 114 0 90 2 114 0 92 2 114 0 95 2 114 0 106 2 114 0 107 2 114 1 17] 
#[1 4 89 0 6 2 118 0 7 2 118 0 10 2 118 0 17 2 118 0 23 2 118 0 38 2 118 0 40 2 118 0 41 2 118 0 70 2 118 0 88 2 118 0 90 2 118 0 92 2 118 0 95 2 118 0 106 2 118 0 107 2 118 1 17] 
#[1 2 122 0 7 2 122 0 10 2 122 0 17 2 122 0 23 2 122 0 38 2 122 0 40 4 93 0 41 2 122 0 70 2 122 0 88 2 122 0 90 2 122 0 92 2 122 0 95 2 122 0 106 2 122 0 107 2 122 1 17] 
#[1 2 126 0 7 2 126 0 10 2 126 0 17 2 126 0 23 2 126 0 38 2 126 0 40 2 126 0 70 4 97 0 88 2 126 0 90 2 126 0 92 2 126 0 95 2 126 0 106 2 126 0 107 2 126 1 17] 
#[0 8 69 0 23] 
#[1 4 101 0 7 2 130 0 10 2 130 0 17 2 130 0 23 2 130 0 38 2 130 0 40 2 130 0 70 2 130 0 90 2 130 0 92 2 130 0 95 2 130 0 106 2 130 0 107 2 130 1 17] 
#[0 2 134 0 10 0 17 0 23 0 40 0 92 0 106 0 107 1 17] 
#[0 2 138 0 17 0 92] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 4 121 0 111 8 73 0 176 4 133 0 180 4 133 0 181 4 133 0 182] 
#[0 2 142 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 2 146 0 17 0 92] 
#[1 0 25 0 1 0 29 0 9 3 93 0 11 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 3 97 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 3 101 0 62 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 3 105 0 72 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 7 0 95 0 181 0 97 3 157 0 100 3 161 0 101 0 193 0 102 0 197 0 104 0 6 0 105 3 113 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 3 117 0 124 3 121 0 125 3 125 0 126 3 125 0 127 3 125 0 128 3 121 0 129 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 8 77 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 8 81 0 224 8 85 0 225 1 77 0 226 1 173 0 227 3 121 0 229 3 121 0 231 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 3 157 1 14 3 161 1 15 0 241 1 16] 
#[0 2 150 0 10 0 17 0 23 0 40 0 70 0 92 0 95 0 106 0 107 1 17] 
#[0 2 154 0 10 0 17 0 23 0 40 0 70 0 92 0 95 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 2 37 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 2 41 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 8 89 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 7 25 0 159 7 25 0 160 8 93 0 180 8 93 0 181 8 93 0 182 0 241 0 217 7 25 0 226 1 173 0 227 0 241 0 233 7 25 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 2 158 0 17 0 40] 
#[0 8 97 0 40] 
#[0 2 162 0 40] 
#[1 2 97 0 17 0 22 0 22 0 22 0 39 0 22 0 40 0 22 0 87 0 22 0 97 8 101 0 120 2 109 0 121 8 105 0 185] 
#[0 2 166 0 10 0 17 0 28 0 40 0 65 0 70 0 95] 
#[0 0 171 0 17 0 95] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 2 37 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 2 41 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 2 45 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 8 41 0 159 8 41 0 160 2 61 0 180 2 61 0 181 2 61 0 182 8 109 0 187 8 109 0 188 0 241 0 217 8 41 0 226 1 173 0 227 0 241 0 233 8 41 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 4 145 0 39 8 113 0 95 1 241 0 97 4 153 0 100 4 157 0 101 5 229 0 111 5 233 0 126 5 233 0 127 5 233 0 128 8 117 0 186 8 117 0 188 4 153 1 14 4 157 1 15] 
#[0 2 170 0 10 0 17 0 28 0 40 0 65 0 70 0 95] 
#[0 2 174 0 10 0 17 0 40 0 70 0 92 0 95] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 8 121 0 111 8 125 0 180 8 125 0 181 8 125 0 182] 
#[1 0 254 0 10 0 254 0 17 4 201 0 28 0 254 0 40 0 254 0 95 4 205 0 130 4 209 0 131] 
#[0 2 178 0 10 0 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 4 245 0 22 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 8 129 0 122 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 8 133 0 159 8 133 0 160 0 241 0 217 8 133 0 226 1 173 0 227 0 241 0 233 8 133 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 2 182 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 2 186 0 17 0 40] 
#[0 2 190 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 2 194 0 87] 
#[1 3 93 0 11 4 145 0 39 3 101 0 62 3 105 0 72 8 137 0 73 8 141 0 92 2 198 0 95 1 241 0 97 4 153 0 100 4 157 0 101 8 145 0 111 8 145 0 126 8 145 0 127 8 145 0 128 8 165 0 229 8 165 0 231 8 153 0 242 8 157 0 243 8 161 0 244 8 165 0 245 4 153 1 14 4 157 1 15] 
#[0 2 202 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 8 169 0 159 8 169 0 160 8 169 0 163 0 241 0 217 8 169 0 226 1 173 0 227 0 241 0 233 8 169 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 2 206 0 92] 
#[0 2 210 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 2 214 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 2 218 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 8 173 0 9] 
#[1 1 246 0 10 7 149 0 22 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 7 177 0 187 7 177 0 188 7 173 0 190 8 177 0 219 7 165 0 220 7 169 0 221 7 173 0 222 7 177 0 223] 
#[0 8 181 0 98] 
#[1 8 185 0 95 5 65 0 98 8 189 1 11] 
#[0 2 222 0 60 0 92] 
#[0 2 226 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 254 0 17 4 201 0 28 2 230 0 65 0 254 0 70 0 254 0 92 5 237 0 130 4 209 0 131] 
#[1 5 241 0 17 8 193 0 92] 
#[1 1 86 0 17 8 197 0 70 1 86 0 92] 
#[1 4 201 0 28 2 230 0 65 5 249 0 131] 
#[0 8 201 0 65] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 8 205 0 159 8 205 0 160 8 205 0 163 0 241 0 217 8 205 0 226 1 173 0 227 0 241 0 233 8 205 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 8 209 0 159 8 209 0 160 8 209 0 163 0 241 0 217 8 209 0 226 1 173 0 227 0 241 0 233 8 209 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 58 0 92 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 97 0 159 5 97 0 160 8 213 0 162 5 97 0 163 0 241 0 217 5 97 0 226 1 173 0 227 0 241 0 233 5 97 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 8 217 0 92] 
#[1 0 254 0 17 4 201 0 28 2 230 0 65 2 230 0 70 0 254 0 92 6 189 0 130 4 209 0 131] 
#[1 4 201 0 28 2 230 0 65 2 230 0 70 6 201 0 131] 
#[0 2 234 0 65 0 70] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 8 221 0 159 8 221 0 160 8 221 0 163 0 241 0 217 8 221 0 226 1 173 0 227 0 241 0 233 8 221 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 8 225 0 159 8 225 0 160 8 225 0 163 0 241 0 217 8 225 0 226 1 173 0 227 0 241 0 233 8 225 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 1 246 0 10 7 149 0 22 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 7 177 0 187 7 177 0 188 7 173 0 190 8 229 0 219 7 165 0 220 7 169 0 221 7 173 0 222 7 177 0 223] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 8 233 0 111 8 93 0 180 8 93 0 181 8 93 0 182] 
#[0 2 238 0 10 0 17] 
#[0 2 242 0 10] 
#[0 8 237 0 10] 
#[0 2 246 0 10] 
#[1 2 250 0 10 8 241 0 17] 
#[0 2 254 0 10] 
#[0 3 2 0 10 0 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 8 245 0 164 8 245 0 167 8 245 0 168 8 245 0 169 8 245 0 177 8 245 0 191 8 245 0 192 8 245 0 193 8 245 0 194 8 245 0 197 8 245 0 198 8 245 0 200 8 245 0 201 8 245 0 202 8 245 0 208 8 245 0 210 8 245 0 211 8 245 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 3 6 0 60] 
#[1 1 241 0 97 8 249 0 111 8 249 1 7] 
#[1 8 253 0 95 1 241 0 97 5 133 0 98 5 145 0 111 9 1 1 5 5 145 1 7] 
#[0 3 10 0 60] 
#[0 3 14 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 3 18 0 60] 
#[0 3 18 0 60] 
#[0 3 22 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 3 26 0 10 0 17] 
#[0 3 30 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 9 5 0 22 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 9 9 0 159 9 9 0 160 0 241 0 217 9 9 0 226 1 173 0 227 0 241 0 233 9 9 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 3 34 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 9 13 0 87 9 17 0 203] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 9 29 0 111 9 29 0 180 9 29 0 181 9 29 0 182 9 29 0 214] 
#[0 3 38 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 3 42 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 8 109 0 187 8 109 0 188] 
#[0 3 46 0 17 0 92] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 9 33 0 164 9 33 0 167 9 33 0 168 9 33 0 169 9 33 0 177 9 33 0 191 9 33 0 192 9 33 0 193 9 33 0 194 9 33 0 197 9 33 0 198 9 33 0 200 9 33 0 201 9 33 0 202 9 33 0 208 9 33 0 210 9 33 0 211 9 33 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 9 37 0 164 9 37 0 167 9 37 0 168 9 37 0 169 9 37 0 177 9 37 0 191 9 37 0 192 9 37 0 193 9 37 0 194 9 37 0 197 9 37 0 198 9 37 0 200 9 37 0 201 9 37 0 202 9 37 0 208 9 37 0 210 9 37 0 211 9 37 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 1 246 0 10 7 149 0 22 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 7 177 0 187 7 177 0 188 7 173 0 190 9 41 0 218 8 37 0 219 7 165 0 220 7 169 0 221 7 173 0 222 7 177 0 223] 
#[0 3 50 0 9 0 23] 
#[0 9 45 0 10] 
#[1 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 9 53 0 187 9 53 0 188 9 53 0 223 9 53 0 230] 
#[0 3 54 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 3 58 0 17 0 95] 
#[0 9 57 0 10] 
#[0 3 62 0 10] 
#[0 3 66 0 17 0 95] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 9 61 0 159 9 61 0 160 9 61 0 163 0 241 0 217 9 61 0 226 1 173 0 227 0 241 0 233 9 61 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 3 70 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 3 74 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 9 65 0 106 9 69 0 107] 
#[0 3 78 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 3 82 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 9 73 0 159 9 73 0 160 0 241 0 217 9 73 0 226 1 173 0 227 0 241 0 233 9 73 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 3 86 0 17 0 92] 
#[0 3 90 0 95] 
#[0 9 77 0 95] 
#[0 3 94 0 95] 
#[1 0 82 0 2 0 82 0 3 0 82 0 4 0 82 0 5 0 82 0 6 0 82 0 7 0 82 0 8 0 82 0 9 0 82 0 11 0 82 0 12 0 82 0 13 0 82 0 14 0 82 0 15 0 82 0 16 0 82 0 17 0 82 0 18 0 82 0 19 0 82 0 20 0 82 0 21 0 82 0 24 0 82 0 25 0 82 0 26 0 82 0 27 0 82 0 28 0 82 0 29 0 82 0 30 0 86 0 31 0 82 0 32 0 82 0 33 0 82 0 34 0 82 0 35 0 82 0 36 0 82 0 37 0 82 0 38 0 82 0 39 0 175 0 40 0 82 0 41 0 82 0 42 0 82 0 65 0 82 0 66 0 82 0 88 0 82 0 89 0 82 0 90 0 82 0 93 0 82 0 94 0 82 0 104 0 82 0 105] 
#[0 3 98 0 10 0 40] 
#[0 3 102 0 10 0 17 0 28 0 40 0 65 0 70 0 95] 
#[1 7 149 0 22 3 49 0 39 1 162 0 40 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 6 221 0 187 6 221 0 188 9 81 0 189 9 81 0 190] 
#[0 3 106 0 17 0 40] 
#[0 3 110 0 17 0 95] 
#[0 3 114 0 10 0 17 0 28 0 40 0 65 0 70 0 95] 
#[0 3 118 0 17 0 95] 
#[0 9 85 0 10] 
#[0 9 89 0 10] 
#[0 3 122 0 17 0 40] 
#[0 3 122 0 17 0 40] 
#[1 3 93 0 11 4 145 0 39 3 101 0 62 3 105 0 72 1 241 0 97 4 153 0 100 4 157 0 101 8 145 0 111 8 145 0 126 8 145 0 127 8 145 0 128 9 93 0 229 9 93 0 231 4 153 1 14 4 157 1 15] 
#[0 3 126 0 11 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[0 6 41 0 9] 
#[0 3 130 0 11 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[0 9 97 0 95] 
#[0 3 134 0 95] 
#[1 3 93 0 11 4 145 0 39 3 101 0 62 3 105 0 72 8 137 0 73 8 141 0 92 3 138 0 95 1 241 0 97 4 153 0 100 4 157 0 101 8 145 0 111 8 145 0 126 8 145 0 127 8 145 0 128 9 101 0 229 9 101 0 231 9 101 0 245 4 153 1 14 4 157 1 15] 
#[0 3 142 0 11 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[1 9 105 0 10 4 113 0 17] 
#[1 1 246 0 10 7 149 0 22 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 7 177 0 187 7 177 0 188 7 173 0 190 9 109 0 219 7 165 0 220 7 169 0 221 7 173 0 222 7 177 0 223] 
#[0 9 113 0 10] 
#[0 3 146 0 17 0 95] 
#[0 3 150 0 60 0 92] 
#[0 3 154 0 17 0 95] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 58 0 92 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 97 0 159 5 97 0 160 9 117 0 162 5 97 0 163 0 241 0 217 5 97 0 226 1 173 0 227 0 241 0 233 5 97 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 9 121 0 159 9 121 0 160 9 121 0 163 0 241 0 217 9 121 0 226 1 173 0 227 0 241 0 233 9 121 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 9 125 0 159 9 125 0 160 9 125 0 163 0 241 0 217 9 125 0 226 1 173 0 227 0 241 0 233 9 125 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 9 129 0 10 4 113 0 17] 
#[1 9 133 0 10 4 113 0 17] 
#[0 9 137 0 92] 
#[1 0 25 0 1 0 29 0 9 1 58 0 10 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 97 0 159 5 97 0 160 9 141 0 162 5 97 0 163 0 241 0 217 5 97 0 226 1 173 0 227 0 241 0 233 5 97 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 9 145 0 10 4 113 0 17] 
#[1 9 149 0 10 4 113 0 17] 
#[0 9 153 0 10] 
#[0 3 98 0 10 0 40] 
#[0 9 157 0 87] 
#[1 7 149 0 22 3 49 0 39 3 53 0 87 1 241 0 97 7 9 0 111 2 61 0 180 2 61 0 181 2 61 0 182 9 165 0 187 9 165 0 188 9 161 0 190 9 161 0 222 9 165 0 223] 
#[1 3 158 0 1 3 158 0 9 3 158 0 14 3 158 0 15 3 158 0 18 3 158 0 19 3 158 0 39 3 158 0 44 3 158 0 45 3 158 0 47 3 158 0 48 3 158 0 49 3 158 0 50 3 158 0 51 3 158 0 52 3 158 0 53 9 169 0 54 3 158 0 55 3 158 0 57 3 158 0 59 3 158 0 61 3 158 0 63 3 158 0 64 3 158 0 67 3 158 0 68 3 158 0 69 3 158 0 71 3 158 0 74 3 158 0 75 3 158 0 77 3 158 0 78 3 158 0 79 3 158 0 80 3 158 0 81 3 158 0 82 3 158 0 83 3 158 0 84 3 158 0 85 3 158 0 86 3 158 0 87 3 158 0 91 3 158 0 92 3 158 0 95 3 158 0 97 3 158 0 100 3 158 0 101 3 158 0 102 3 158 0 104 3 158 0 105 3 158 1 17] 
#[0 3 162 0 17 0 95] 
#[0 3 166 0 60] 
#[0 3 170 0 17 0 95] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 9 173 0 159 9 173 0 160 0 241 0 217 9 173 0 226 1 173 0 227 0 241 0 233 9 173 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 3 174 0 10 0 17] 
#[1 9 177 0 45 3 178 0 51 3 178 0 95 9 181 0 204 9 185 0 205 9 189 0 206] 
#[0 3 182 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 3 186 0 10] 
#[0 3 186 0 10] 
#[0 9 193 0 10] 
#[0 3 190 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 3 194 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 9 197 0 10] 
#[0 9 201 0 87] 
#[0 3 198 0 10] 
#[0 9 205 0 10] 
#[0 9 209 0 87] 
#[1 4 113 0 17 3 202 0 106 3 202 0 107] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 9 213 0 159 9 213 0 160 9 213 0 163 0 241 0 217 9 213 0 226 1 173 0 227 0 241 0 233 9 213 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 3 206 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 3 210 0 10 0 17 0 23 0 40 0 70 0 92 0 95 0 106 0 107 1 17] 
#[0 3 214 0 10 0 17 0 23 0 40 0 70 0 92 0 95 0 106 0 107 1 17] 
#[0 9 217 0 40] 
#[0 3 218 0 31] 
#[0 3 218 0 31] 
#[0 3 222 0 11 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[0 3 226 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 93 0 94 0 95 0 97 0 100 0 101 0 102 0 104 0 105 0 106 0 107 1 17] 
#[0 3 230 0 11 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[0 9 221 0 92] 
#[0 9 225 0 10] 
#[0 9 229 0 87] 
#[0 9 233 0 92] 
#[1 9 237 0 10 4 113 0 17] 
#[1 9 241 0 10 4 113 0 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 9 245 0 164 9 245 0 167 9 245 0 168 9 245 0 169 9 245 0 177 9 245 0 191 9 245 0 192 9 245 0 193 9 245 0 194 9 245 0 197 9 245 0 198 9 245 0 200 9 245 0 201 9 245 0 202 9 245 0 208 9 245 0 210 9 245 0 211 9 245 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 9 249 0 164 9 249 0 167 9 249 0 168 9 249 0 169 9 249 0 177 9 249 0 191 9 249 0 192 9 249 0 193 9 249 0 194 9 249 0 197 9 249 0 198 9 249 0 200 9 249 0 201 9 249 0 202 9 249 0 208 9 249 0 210 9 249 0 211 9 249 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 1 58 0 10 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 97 0 159 5 97 0 160 9 253 0 162 5 97 0 163 0 241 0 217 5 97 0 226 1 173 0 227 0 241 0 233 5 97 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 10 1 0 10] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 10 5 0 164 10 5 0 167 10 5 0 168 10 5 0 169 10 5 0 177 10 5 0 191 10 5 0 192 10 5 0 193 10 5 0 194 10 5 0 197 10 5 0 198 10 5 0 200 10 5 0 201 10 5 0 202 10 5 0 208 10 5 0 210 10 5 0 211 10 5 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 10 9 0 164 10 9 0 167 10 9 0 168 10 9 0 169 10 9 0 177 10 9 0 191 10 9 0 192 10 9 0 193 10 9 0 194 10 9 0 197 10 9 0 198 10 9 0 200 10 9 0 201 10 9 0 202 10 9 0 208 10 9 0 210 10 9 0 211 10 9 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 10 13 0 87] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 8 77 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 10 17 0 224 8 85 0 225 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 3 234 0 10] 
#[0 3 238 0 10 0 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 10 21 0 164 10 21 0 167 10 21 0 168 10 21 0 169 10 21 0 177 10 21 0 191 10 21 0 192 10 21 0 193 10 21 0 194 10 21 0 197 10 21 0 198 10 21 0 200 10 21 0 201 10 21 0 202 10 21 0 208 10 21 0 210 10 21 0 211 10 21 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 3 242 0 10 0 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 10 25 0 159 10 25 0 160 10 25 0 163 0 241 0 217 10 25 0 226 1 173 0 227 0 241 0 233 10 25 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 10 29 0 51 10 33 0 95 10 37 0 207] 
#[1 9 177 0 45 3 246 0 51 3 246 0 95 10 41 0 206] 
#[0 3 250 0 45 0 51 0 95] 
#[1 3 37 0 87 10 45 0 169] 
#[0 10 49 0 87] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 8 77 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 10 53 0 224 8 85 0 225 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 10 57 0 87] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 8 77 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 10 61 0 224 8 85 0 225 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 4 113 0 17 3 254 0 106 3 254 0 107] 
#[0 4 2 0 10 0 17 0 28 0 40 0 65 0 70 0 95] 
#[0 4 6 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 10 65 0 87] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 8 77 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 10 69 0 224 8 85 0 225 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 1 58 0 10 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 57 0 47 0 73 0 52 1 221 0 57 0 93 0 61 0 109 0 68 1 217 0 69 0 121 0 74 0 129 0 77 1 221 0 79 0 145 0 81 0 153 0 83 0 165 0 86 1 237 0 87 0 173 0 91 1 241 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 5 97 0 159 5 97 0 160 10 73 0 162 5 97 0 163 0 241 0 217 5 97 0 226 1 173 0 227 0 241 0 233 5 97 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 10 77 0 164 10 77 0 167 10 77 0 168 10 77 0 169 10 77 0 177 10 77 0 191 10 77 0 192 10 77 0 193 10 77 0 194 10 77 0 197 10 77 0 198 10 77 0 200 10 77 0 201 10 77 0 202 10 77 0 208 10 77 0 210 10 77 0 211 10 77 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 10 81 0 164 10 81 0 167 10 81 0 168 10 81 0 169 10 81 0 177 10 81 0 191 10 81 0 192 10 81 0 193 10 81 0 194 10 81 0 197 10 81 0 198 10 81 0 200 10 81 0 201 10 81 0 202 10 81 0 208 10 81 0 210 10 81 0 211 10 81 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 4 10 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 4 14 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 10 85 0 10] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 10 89 0 164 10 89 0 167 10 89 0 168 10 89 0 169 10 89 0 177 10 89 0 191 10 89 0 192 10 89 0 193 10 89 0 194 10 89 0 197 10 89 0 198 10 89 0 200 10 89 0 201 10 89 0 202 10 89 0 208 10 89 0 210 10 89 0 211 10 89 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 4 18 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 4 22 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 8 77 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 10 93 0 224 8 85 0 225 1 77 0 226 1 173 0 227 0 241 0 233 10 97 0 234 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 10 101 0 95] 
#[0 4 26 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 4 113 0 17 10 105 0 23] 
#[0 10 109 0 23] 
#[0 4 30 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 9 177 0 45 3 178 0 95 10 113 0 204 9 185 0 205 9 189 0 206] 
#[0 4 34 0 45 0 51 0 95] 
#[0 4 38 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 8 77 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 10 93 0 224 8 85 0 225 1 77 0 226 1 173 0 227 0 241 0 233 10 117 0 234 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 10 121 0 95] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 8 77 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 10 125 0 224 8 85 0 225 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 10 129 0 95] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 8 77 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 10 93 0 224 8 85 0 225 1 77 0 226 1 173 0 227 0 241 0 233 10 133 0 234 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 10 137 0 95] 
#[0 10 141 0 10] 
#[0 4 42 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 4 46 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 10 145 0 164 10 145 0 167 10 145 0 168 10 145 0 169 10 145 0 177 10 145 0 191 10 145 0 192 10 145 0 193 10 145 0 194 10 145 0 197 10 145 0 198 10 145 0 200 10 145 0 201 10 145 0 202 10 145 0 208 10 145 0 210 10 145 0 211 10 145 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 4 50 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 4 54 0 95] 
#[0 10 149 0 95] 
#[0 4 58 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 54 0 45 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 54 0 51 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 10 153 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 54 0 45 0 57 0 47 1 105 0 48 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 1 105 0 67 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 54 0 95 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 2 1 0 164 2 1 0 167 2 1 0 168 2 1 0 169 10 157 0 170 3 145 0 171 2 1 0 172 2 1 0 173 1 105 0 174 2 1 0 177 2 1 0 191 2 1 0 192 2 1 0 193 2 1 0 194 2 1 0 197 2 1 0 198 2 1 0 200 2 1 0 201 2 1 0 202 2 1 0 208 2 1 0 210 2 1 0 211 2 1 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 10 161 0 95] 
#[0 10 165 0 95] 
#[0 4 62 0 11 0 17 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[0 10 169 0 95] 
#[0 4 66 0 11 0 17 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[0 10 173 0 95] 
#[0 4 70 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[1 0 25 0 1 0 29 0 9 0 33 0 14 0 37 0 15 0 41 0 18 0 45 0 19 0 49 0 39 0 53 0 44 0 57 0 47 0 65 0 49 0 69 0 50 0 73 0 52 0 77 0 53 1 221 0 57 0 89 0 59 0 93 0 61 0 97 0 63 0 109 0 68 1 217 0 69 0 117 0 71 0 121 0 74 0 125 0 75 0 129 0 77 0 133 0 78 1 221 0 79 0 141 0 80 0 145 0 81 0 149 0 82 0 153 0 83 0 157 0 84 0 161 0 85 0 165 0 86 0 169 0 87 0 173 0 91 0 177 0 92 0 181 0 97 1 225 0 100 1 229 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 205 0 111 0 241 0 112 0 241 0 113 0 217 0 114 0 241 0 117 0 241 0 118 0 241 0 123 0 241 0 132 0 237 0 133 0 241 0 136 0 241 0 137 0 241 0 138 0 241 0 139 1 13 0 140 1 5 0 141 1 5 0 142 1 13 0 145 1 21 0 146 1 21 0 147 1 29 0 148 1 29 0 149 1 33 0 150 1 37 0 151 1 41 0 152 1 45 0 153 1 49 0 154 1 53 0 155 1 57 0 156 1 61 0 157 1 65 0 158 1 77 0 159 1 77 0 160 1 77 0 163 10 177 0 164 10 177 0 167 10 177 0 168 10 177 0 169 10 177 0 177 10 177 0 191 10 177 0 192 10 177 0 193 10 177 0 194 10 177 0 197 10 177 0 198 10 177 0 200 10 177 0 201 10 177 0 202 10 177 0 208 10 177 0 210 10 177 0 211 10 177 0 215 0 241 0 217 1 77 0 226 1 173 0 227 0 241 0 233 1 77 0 235 0 241 0 238 1 217 1 12 1 221 1 13 1 225 1 14 1 229 1 15 0 241 1 16] 
#[0 4 74 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 4 78 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 65 0 66 0 70 0 87 0 88 0 89 0 90 0 92 0 93 0 94 0 95 0 104 0 105 0 106 0 107 1 17] 
#[0 4 82 0 45 0 51 0 95] 
#[0 4 86 0 45 0 95] 
#[0 4 90 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 4 94 0 11 0 17 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[0 4 98 0 11 0 17 0 39 0 62 0 72 0 73 0 92 0 95 0 97 0 100 0 101] 
#[0 4 102 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 1 17] 
#[0 4 106 0 1 0 9 0 14 0 15 0 18 0 19 0 39 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 59 0 61 0 63 0 64 0 67 0 68 0 69 0 71 0 74 0 75 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 85 0 86 0 87 0 91 0 92 0 95 0 97 0 100 0 101 0 102 0 104 0 105 1 17]
	).
]
