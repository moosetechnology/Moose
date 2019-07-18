Class {
	#name : #JSParser,
	#superclass : #SmaCCGLRParser,
	#classInstVars : [
		'keywords'
	],
	#category : #'SmaCC_Javascript_Parser'
}

{ #category : #generated }
JSParser class >> ambiguousTransitions [
^#(
#[ 0 10 0 201] 
#[ 0 26 2 89] 
#[ 0 98 1 150] 
#[ 0 98 4 245] 
#[ 1 154 5 9] 
#[ 0 25 0 30] 
#[ 0 30 2 5] 
#[ 0 30 0 33] 
#[ 0 30 0 41] 
#[ 0 30 0 45] 
#[ 0 30 0 49] 
#[ 0 30 0 53] 
#[ 0 30 0 57] 
#[ 0 30 0 61] 
#[ 0 30 0 69] 
#[ 0 30 0 85] 
#[ 0 30 0 97] 
#[ 0 30 0 105] 
#[ 0 30 0 121] 
#[ 0 30 0 125] 
#[ 0 30 0 133] 
#[ 0 30 0 141] 
#[ 0 30 0 149] 
#[ 0 30 0 157] 
#[ 0 30 0 165] 
#[ 0 30 0 177] 
#[ 0 30 2 9] 
#[ 0 30 0 185] 
#[ 0 30 0 189] 
#[ 0 30 0 193] 
#[ 0 30 0 197] 
#[ 0 6 0 30] 
#[ 0 10 0 30 0 201] 
#[ 0 98 1 182] 
#[ 1 106 1 218] 
#[ 1 110 1 222] 
#[ 1 174 2 190] 
#[ 1 150 1 182] 
#[ 2 202 5 73] 
#[ 1 226 2 169] 
#[ 0 162 7 245] 
#[ 0 10 3 246] 
#[ 2 214 2 230] 
#[ 0 98 5 30]
	).
]

{ #category : #'generated-accessing' }
JSParser class >> cacheId [
	^'2019-04-15T17:15:49.025026-05:00'
]

{ #category : #generated }
JSParser class >> definitionComment [
"%root Program;
%prefix JS;
%suffix Node;

%scopes default template;
%excludes jsx jsxText;

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
	XCodeExpression	#JSX
	XElement	#JSX
	XFragment	#JSX
	XSelfClosingElement	#JSX
	XText	#JSX
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

%id <semicolon> <identifier> <slash> <slashEqual> <regular_expression> <identifierName> <rightBrace> <jsxLT> <lt>;

%right <else>;

default <leftParen>
:   \(
;
default <rightParen>
:   \)
;
jsx jsxText default <leftBrace>
:   \{
;
jsx jsxText default <rightBrace>
:   \}
;
default <leftBracket>
:   \[
;
default <rightBracket>
:   \]
;
default <semicolon>
:	\;
;
jsx default <slash>
:	\/
;
default <slashEqual>
:	\/\=
;
jsxText default <lt>
:	\<
;
default <ltLt>
:	\<\<
;
default <ltLtEq>
:	\<\<\=
;
jsx jsxText default <gt>
:   \>
;
default <gtGt>
:   \>\>
;
default <gtGtEq>
:   \>\>\=
;
default <gtGtGtEq>
:   \>\>\>\=
;
default <gtGtGt>
:   \>\>\>
;
default <eqGt>
:   \=\>
;
default <ltEq>
:   \<\=
;
default <gtEq>
:   \>\=
;
jsx default <period>
:   \.
;
jsx default <eq>
:   \=
;
default <eqEq>
:   \=\=
;
default <eqEqEq>
:   \=\=\=
;
default <star>
:   \*
;
default <starStar>
:   \*\*
;
default <starEq>
:   \*\=
;
default <percentEq>
:   \%\=
;
default <ampEq>
:   \&\=
;
default <upEq>
:   \^\=
;
default <barEq>
:   \|\=
;
default <minusEq>
:   \-\=
;
default <plusEq>
:   \+\=
;
default <plus>
:   \+
;
default <plusPlus>
:   \+\+
;
default <minus>
:   \-
;
default <minusMinus>
:   \-\-
;
default <tilde>
:   \~
;
default <amp>
:   \&
;
default <ampAmp>
:   \&\&
;
default <question>
:   \?
;
default <percent>
:   \%
;
default <bar>
:   \|
;
default <barBar>
:   \|\|
;
default <up>
:   \^
;
default <bang>
:   \!
;
default <bangEq>
:   \!\=
;
default <bangEqEq>
:   \!\=\=
;
default <as>
:   as
;
default <break>
:   break
;
default <case>
:   case
;
default <catch>
:   catch
;
default <class>
:   class
;
default <const>
:   const
;
default <continue>
:   continue
;
default <debugger>
:   debugger
;
default <default>
:   default
;
default <delete>
:   delete
;
default <do>
:   do
;
default <else>
:   else
;
default <export>
:   export
;
default <extends>
:   extends
;
default <false>
:   false
;
default <finally>
:   finally
;
default <for>
:   for
;
default <from>
:   from
;
default <function>
:   function
;
default <get>
:   get
;
default <if>
:   if
;
default <import>
:   import
;
default <in>
:   in
;
default <instanceof>
:   instanceof
;
default <let>
:   let
;
default <new>
:   new
;
default <null>
:   null
;
default <of>
:   of
;
default <return>
:   return
;
default <set>
:   set
;
default <static>
:   static
;
default <super>
:   super
;
default <switch>
:   switch
;
default <target>
:   target
;
default <this>
:   this
;
default <throw>
:   throw
;
default <true>
:   true
;
default <try>
:   try
;
default <typeof>
:   typeof
;
default <var>
:   var
;
default <void>
:   void
;
default <while>
:   while
;
default <with>
:   with
;
default <yield>
:   yield
;
default <dotDotDot>
:   \.\.\.
;
default <comma>
:   \,
;
default <colon>
:   \:
;

default <comment>
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
default <identifier>
:	<identifier_start> <identifier_part>*
;
default <identifierName>
:	<identifier>
;
jsx default <whitespace>
:	(<isSeparator> | \xA0 | \xFEFF)+
;
default <escape_sequence>
:	[^\r\n] | (x <hex>{2,2}) | (u <hex>{4,4})
;
default <escape>
:	\\  <escape_sequence>
;
default <line_continuation>
:	\\ (\r | \n | (\r\n))
;
jsx default <string>
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
default <numeric>
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
IdentifierName
: 	<identifierName> 'name' {{NameExpression}}
;
#LabeledIdentifier
#:	Identifier
#;
PrimaryExpression
:	<this> 'thisToken' {{ThisExpression}}
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
:	<leftParen> 'leftParen' Expression <rightParen> 'rightParen' {{Expression}}
;
CoverParenthesizedExpressionAndArrowParameterList
:	<leftParen> 'left' ParameterListopt <rightParen> 'right'	##
#|	<leftParen> 'left' <rightParen> 'right'
#|	<leftParen> 'left'   <dotDotDot> 'ellipsis' Identifier 'varParameter' <rightParen> 'right'	##
#|	<leftParen> 'left' <dotDotDot> 'ellipsis' BindingPattern 'varParameter' <rightParen> 'right' 
|	<leftParen> 'left' ParameterListopt <comma> 'comma' <dotDotDot> 'ellipsis' Identifier 'varParameter' <rightParen> 'right'	##
|	<leftParen> 'left' ParameterListopt <comma> 'comma' <dotDotDot> 'ellipsis' BindingPattern 'varParameter' <rightParen> 'right'	##
;
ParameterListopt
:	
|	ParameterList
;
ParameterList
:	BindingElement 'parameter'
|	ParameterList <comma> 'comma' BindingElement 'parameter'
;
Literal
:	NullLiteral 'value' {{NullLiteral}}
|	BooleanLiteral 'value' {{BooleanLiteral}}
|	NumericLiteral 'value' {{NumericLiteral}}
|	StringLiteral 'value' {{StringLiteral}}
;
ArrayLiteral 
:	<leftBracket> 'leftBracket' Elisionopt <rightBracket> 'rightBracket' {{}}
|	<leftBracket> 'leftBracket' ElementList <rightBracket> 'rightBracket' {{}}
|	<leftBracket> 'leftBracket' ElementList Elision <rightBracket> 'rightBracket' {{}}	##
;
ElementList
:	Elisionopt AssignmentExpression 'expression'
|	Elisionopt SpreadElement 'expression'
|	ElementList <comma> 'comma' Elisionopt AssignmentExpression 'expression'
|	ElementList <comma> 'comma' Elisionopt SpreadElement 'expression'
;
Elisionopt
:
|	Elision
;
Elision
:	<comma> 'comma'
|	Elision <comma> 'comma'
;
SpreadElement
:	<dotDotDot> 'ellipsis' AssignmentExpression 'expression' {{SpreadExpression}}
;
ObjectLiteral  
:	<leftBrace> 'leftBrace' <rightBrace> 'rightBrace' {{}}
|	<leftBrace> 'leftBrace' PropertyDefinitionList <rightBrace> 'rightBrace' {{}}
|	<leftBrace> 'leftBrace' PropertyDefinitionList <comma> 'comma' <rightBrace> 'rightBrace' {{}}
;
PropertyDefinitionList
:	PropertyDefinition 'definition'
|	PropertyDefinitionList <comma> 'comma' PropertyDefinition 'definition'
;
PropertyDefinition
:	Identifier
|	CoverInitializedName
|	PropertyName 'name' <colon> 'colonToken' AssignmentExpression 'value' {{PropertyAssignment}}
|	MethodDefinition
;
PropertyName 
:	LiteralPropertyName
|	ComputedPropertyName
;
LiteralPropertyName
:	IdentifierName
|	StringLiteral 'name' {{NameExpression}}
|	NumericLiteral 'name' {{NameExpression}}
;
ComputedPropertyName
:	<leftBracket> 'leftBrace' AssignmentExpression 'expression' <rightBracket> 'rightBrace' {{}}
;
CoverInitializedName
:	Identifier 'name' Initializer {{PropertyAssignment}}	##
;
Initializeropt
:
|	Initializer
;
Initializer
:	<eq> 'equalToken' AssignmentExpression 'value'
;
TemplateLiteral
:	<no_substitution_template> 'part' {{}}
|	StartTemplateLiteral <template_head> 'part' Expression 'expression' TemplateSpans {{}}
;
StartTemplateLiteral
:	[#template]
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
|	MemberExpression 'expression' <leftBracket> 'leftBracket' Expression 'fieldExpression' <rightBracket> 'rightBracket' {{IndexedPropertyExpression}}
|	MemberExpression 'expression' <period> 'periodToken' <identifierName> 'name' {{NamedPropertyExpression}}
|	MemberExpression 'expression' TemplateLiteral 'template' {{TaggedTemplateLiteral}}
|	SuperProperty
|	MetaProperty
|	<new> 'newToken' MemberExpression 'expression' Arguments {{NewExpression}}
;
SuperProperty
:	<super> 'superToken' <leftBracket> 'leftBracket' Expression 'expression' <rightBracket> 'rightBracket' {{SuperIndexedPropertyExpression}}
|	<super> 'superToken' <period> 'periodToken' <identifierName> 'name' {{SuperNamedPropertyExpression}}
;
MetaProperty
:	NewTarget
;
NewTarget
:	<new> 'newToken' <period> 'periodToken' <target> 'targetToken' {{NewTargetExpression}}
;
NewExpression 
:	MemberExpression 
|	<new> 'newToken' NewExpression 'expression' {{}}
;
CallExpression 
:	MemberExpression 'expression' Arguments {{}}
|	SuperCall
|	CallExpression 'expression' Arguments {{}}
|	CallExpression 'expression' <leftBracket> 'leftBracket' Expression 'expression' <rightBracket> 'rightBracket' {{IndexedPropertyExpression}}
|	CallExpression 'expression' <period> 'periodToken' <identifierName> 'name' {{NamedPropertyExpression}}
|	CallExpression 'expression' TemplateLiteral 'template'  {{TaggedTemplateLiteral}}
;
SuperCall
:	<super> 'superToken' Arguments {{SuperCallExpression}}
;
Arguments 
:	<leftParen> 'left' <rightParen> 'right'
|	<leftParen> 'left' ArgumentList <rightParen> 'right'
|	<leftParen> 'left' ArgumentList <comma> 'comma' <rightParen> 'right'
;
ArgumentList 
:	AssignmentExpression 'argument'
|	<dotDotDot> 'ellipsis' AssignmentExpression 'varArgument'
|	ArgumentList <comma> 'comma' AssignmentExpression 'argument'
|	ArgumentList <comma> 'comma' <dotDotDot> 'ellipsis' AssignmentExpression 'varArgument'
;
LeftHandSideExpression 
:	NewExpression 
|	CallExpression
;
UpdateExpression
:	LeftHandSideExpression 'expression' <plusPlus> 'operator' {{PostfixExpression}}
|	LeftHandSideExpression 'expression' <minusMinus> 'operator' {{PostfixExpression}}
|	<plusPlus> 'operator' UnaryExpression 'expression' {{PrefixExpression}}	##
|	<minusMinus> 'operator' UnaryExpression 'expression' {{PrefixExpression}}	##
|	LeftHandSideExpression ###
;
UnaryExpression 
:	UpdateExpression 
|	<delete> 'operator' UnaryExpression 'expression' {{}}
|	<void> 'operator' UnaryExpression 'expression' {{}}
|	<typeof> 'operator' UnaryExpression 'expression' {{}}
|	<plus> 'operator' UnaryExpression 'expression' {{}}
|	<minus> 'operator' UnaryExpression 'expression' {{}}
|	<tilde> 'operator' UnaryExpression 'expression' {{}} 
|	<bang> 'operator' UnaryExpression 'expression' {{}}
;
ExponentiationExpression
:	UnaryExpression
|	UnaryExpression 'leftExpression' <starStar> 'operator' ExponentiationExpression 'rightExpression' {{BinaryExpression}}
;
MultiplicativeExpression 
:	ExponentiationExpression 
|	MultiplicativeExpression 'leftExpression' <star> 'operator' UnaryExpression 'rightExpression' {{BinaryExpression}}
|	MultiplicativeExpression 'leftExpression' <slash> 'operator' UnaryExpression 'rightExpression' {{BinaryExpression}}
|	MultiplicativeExpression 'leftExpression' <percent> 'operator' UnaryExpression 'rightExpression' {{BinaryExpression}}
;
AdditiveExpression 
:	MultiplicativeExpression 
|	AdditiveExpression 'leftExpression' <plus> 'operator' MultiplicativeExpression 'rightExpression' {{BinaryExpression}}
|	AdditiveExpression 'leftExpression' <minus> 'operator' MultiplicativeExpression 'rightExpression' {{BinaryExpression}}
;
ShiftExpression 
:	AdditiveExpression 
|	ShiftExpression 'leftExpression' <ltLt> 'operator' AdditiveExpression 'rightExpression' {{BinaryExpression}}
|	ShiftExpression 'leftExpression' <gtGt> 'operator' AdditiveExpression 'rightExpression' {{BinaryExpression}}
|	ShiftExpression 'leftExpression' <gtGtGt> 'operator' AdditiveExpression 'rightExpression' {{BinaryExpression}}
;
RelationalExpression 
:	ShiftExpression 
|	RelationalExpression 'leftExpression' <lt> 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' <gt> 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' <ltEq> 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' <gtEq> 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' <instanceof> 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
|	RelationalExpression 'leftExpression' <in> 'operator' ShiftExpression 'rightExpression' {{BinaryExpression}}
;
EqualityExpression 
:	RelationalExpression 
|	EqualityExpression 'leftExpression' <eqEq> 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
|	EqualityExpression 'leftExpression' <bangEq> 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
|	EqualityExpression 'leftExpression' <eqEqEq> 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
|	EqualityExpression 'leftExpression' <bangEqEq> 'operator' RelationalExpression 'rightExpression' {{BinaryExpression}}
;
BitwiseANDExpression 
:	EqualityExpression 
|	BitwiseANDExpression 'leftExpression'<amp> 'operator' EqualityExpression 'rightExpression' {{BinaryExpression}}
;
BitwiseXORExpression 
:	BitwiseANDExpression 
|	BitwiseXORExpression 'leftExpression' <up> 'operator' BitwiseANDExpression 'rightExpression' {{BinaryExpression}}
;
BitwiseORExpression 
:	BitwiseXORExpression 
|	BitwiseORExpression 'leftExpression' <bar> 'operator' BitwiseXORExpression 'rightExpression' {{BinaryExpression}}
;
LogicalANDExpression 
:	BitwiseORExpression 
|	LogicalANDExpression 'leftExpression' <ampAmp> 'operator' BitwiseORExpression 'rightExpression' {{BinaryExpression}}
;
LogicalORExpression 
:	LogicalANDExpression 
|	LogicalORExpression 'leftExpression' <barBar> 'operator' LogicalANDExpression 'rightExpression' {{BinaryExpression}}
;
ConditionalExpression 
:	LogicalORExpression 
|	LogicalORExpression 'condition' <question> 'questionMarkToken' AssignmentExpression 'trueExpression' <colon> 'colonToken' AssignmentExpression 'falseExpression' {{}}
;
AssignmentExpression 
:	ConditionalExpression 
|	YieldExpression
|	ArrowFunction
|	LeftHandSideExpression 'lhs' AssignmentOperator 'operator' AssignmentExpression 'rhs' {{}}	##
;
AssignmentOperator
:	<eq>	#
|	<starEq>
|	<slashEqual>
|	<percentEq>
|	<plusEq>
|	<minusEq>
|	<ltLtEq>
|	<gtGtEq>
|	<gtGtGtEq>
|	<ampEq>
|	<upEq>
|	<barEq>
;
#AssignmentPattern
#:	ObjectAssignmentPattern
#|	ArrayAssignmentPattern
#;
#ObjectAssignmentPattern
#:	<leftBrace> 'leftBrace' <rightBrace> 'rightBrace'
#|	<leftBrace> 'leftBrace' AssignmentPropertyList <rightBrace> 'rightBrace'
#|	<leftBrace> 'leftBrace' AssignmentPropertyList <comma> 'comma' <rightBrace> 'rightBrace'
#;
#ArrayAssignmentPattern
#:	<leftBracket> 'leftBracket' Elisionopt AssignmentRestElementopt <rightBracket> 'rightBracket'
#|	<leftBracket> 'leftBracket' AssignmentElementList <rightBracket> 'rightBracket'
#|	<leftBracket> 'leftBracket' AssignmentElementList <comma> 'comma' Elisionopt AssignmentRestElementopt <rightBracket> 'rightBracket'
#;
#AssignmentPropertyList
#:	AssignmentProperty
#|	AssignmentPropertyList AssignmentProperty
#;
#AssignmentElementList
#:	AssignmentElisionElement
#|	AssignmentElementList <comma> 'comma' AssignmentElisionElement
#;
#AssignmentElisionElement
#:	Elisionopt AssignmentElement
#;
#AssignmentProperty
#:	IdentifierReference Initializeropt
#|	PropertyName <colon> 'colonToken' AssignmentElement
#;
#AssignmentElement
#:	DestructuringAssignmentTarget Initializeropt
#;
#AssignmentRestElementopt
#:
#|	AssignmentRestElement
#;
#AssignmentRestElement
#:	<dotDotDot> DestructuringAssignmentTarget
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
|	Expression 'expression' <comma> 'comma' AssignmentExpression 'expression' {{CommaExpression}}
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
:	<leftBrace> 'leftBrace' StatementListopt <rightBrace> 'rightBrace' {{BlockStatement}}
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
:	<let>
|	<const>
;
BindingList
:	LexicalBinding 'binding'
|	BindingList <comma> 'comma' LexicalBinding 'binding'
;
LexicalBinding
:	Identifier 'variable' Initializeropt {{VariableDeclaration}}	##
|	BindingPattern 'pattern' Initializer {{VariablePatternDeclaration}}
;
VariableStatement 
:	<var> 'varToken' VariableDeclarationList <semicolon> 'semicolon' {{}}
;
VariableDeclarationList 
:	VariableDeclaration 'variable'
|	VariableDeclarationList <comma> 'comma' VariableDeclaration 'variable'
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
:	<leftBrace> 'leftBrace' <rightBrace> 'rightBrace' {{}}
|	<leftBrace> 'leftBrace' BindingPropertyList <rightBrace> 'rightBrace' {{}}
|	<leftBrace> 'leftBrace' BindingPropertyList <comma> 'comma' <rightBrace> 'rightBrace' {{}}
;
ArrayBindingPattern
:	<leftBracket> 'leftBracket' Elisionopt BindingRestElementopt 'restElement' <rightBracket> 'rightBracket' {{}}
|	<leftBracket> 'leftBracket' BindingElementList <rightBracket> 'rightBracket' {{}}
|	<leftBracket> 'leftBracket' BindingElementList <comma> 'comma' Elisionopt BindingRestElementopt 'restElement' <rightBracket> 'rightBracket' {{}}
;
BindingPropertyList
:	BindingProperty 'property'
|	BindingPropertyList <comma> 'comma' BindingProperty 'property'
;
BindingElementList
:	BindingElisionElement 
|	BindingElementList <comma> 'comma' BindingElisionElement 
;
BindingElisionElement
:	Elisionopt BindingElement 'element'
;
BindingProperty
:	SingleNameBinding
|	PropertyName 'name' <colon> 'colonToken' BindingElement 'element' {{}}
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
:	<dotDotDot> 'ellipsis' Identifier 'variable' {{RestVariableDeclaration}}	##
|	<dotDotDot> 'ellipsis' BindingPattern 'variable' {{RestVariableDeclaration}}
;
EmptyStatement 
:	<semicolon> 'semicolon' {{}}
;
ExpressionStatement 
:	Expression 'expression' <semicolon> 'semicolon' {{}}
;
IfStatement 
:	<if> 'ifToken' <leftParen> 'left' Expression 'expression' <rightParen> 'right' Statement 'trueStatement' <else> 'elseToken' Statement 'elseStatement' {{}}
|	<if> 'ifToken' <leftParen> 'left' Expression 'expression' <rightParen> 'right' Statement 'trueStatement' {{}}
;
IterationStatement 
:	<do> 'doToken' Statement 'statement' <while> 'whileToken' <leftParen> 'left' Expression 'expression' <rightParen> 'right' <semicolon> 'semicolon' {{DoWhileStatement}}
|	<while> 'whileToken' <leftParen> 'left' Expression 'expression' <rightParen> 'right' Statement 'statement' {{WhileStatement}}
|	<for> 'forToken' <leftParen> 'left' Expressionopt 'initialExpression'<semicolon> 'semicolon' Expressionopt 'condition'<semicolon> 'semicolon' Expressionopt 'iteratorExpression' <rightParen> 'right' Statement 'statement' {{ForStatement}}
|	<for> 'forToken' <leftParen> 'left' <var> 'varToken' VariableDeclarationList <semicolon> 'semicolon' Expressionopt 'condition' <semicolon> 'semicolon' Expressionopt 'iteratorExpression' <rightParen> 'right' Statement 'statement' {{ForStatement}}
|	<for> 'forToken' <leftParen> 'left' LexicalDeclaration 'declaration' Expressionopt 'condition' <semicolon> 'semicolon' Expressionopt 'iteratorExpression' <rightParen> 'right' Statement 'statement' {{ForStatement}}
|	<for> 'forToken' <leftParen> 'left' LeftHandSideExpression 'variable' <in> 'inToken' Expression 'expression' <rightParen> 'right' Statement 'statement' {{ForInStatement}}
|	<for> 'forToken' <leftParen> 'left' <var> 'varToken' ForBinding 'variable' <in> 'inToken' Expression 'expression' <rightParen> 'right' Statement  'statement' {{ForInStatement}}
|	<for> 'forToken' <leftParen> 'left' ForDeclaration <in> 'inToken' Expression 'expression' <rightParen> 'right' Statement  'statement' {{ForInStatement}}
|	<for> 'forToken' <leftParen> 'left' LeftHandSideExpression 'variable' <of> 'ofToken' Expression 'expression' <rightParen> 'right' Statement 'statement' {{ForOfStatement}}
|	<for> 'forToken' <leftParen> 'left' <var> 'varToken' VariableDeclaration 'variable' <of> 'ofToken' Expression 'expression' <rightParen> 'right' Statement  'statement' {{ForOfStatement}}
|	<for> 'forToken' <leftParen> 'left' ForDeclaration <of> 'ofToken' Expression 'expression' <rightParen> 'right' Statement  'statement' {{ForOfStatement}}
;
ForDeclaration
:	LetOrConst 'varToken' ForBinding 'variable'
;
ForBinding
:	Identifier	##
|	BindingPattern
;
ContinueStatement 
:	<continue> 'continueToken' CheckEOL Identifieropt 'label' <semicolon> 'semicolon' {{}}
;
BreakStatement 
:	<break> 'breakToken' CheckEOL Identifieropt 'label' <semicolon> 'semicolon' {{}}
;
CheckEOL
:	[self checkEOL. nil]
;
ReturnStatement  
:	<return> 'returnToken' CheckEOL Expressionopt 'expression' <semicolon> 'semicolon' {{}}
;
WithStatement 
:	<with> 'withToken' <leftParen> 'left' Expression 'expression' <rightParen> 'right' Statement 'statement' {{}}
;
SwitchStatement 
:	<switch> 'switchToken' <leftParen> 'left' Expression 'expression' <rightParen> 'right' CaseBlock {{}}
;
CaseBlock 
:	<leftBrace> 'leftBrace' CaseClausesopt <rightBrace> 'rightBrace' 
|	<leftBrace> 'leftBrace' CaseClausesopt DefaultClause 'clause' CaseClausesopt <rightBrace> 'rightBrace'
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
:	<case> 'caseToken' Expression 'caseExpression' <colon> 'colonToken' StatementListopt {{}}
;
DefaultClause 
:	<default> 'defaultToken' <colon> 'colonToken' StatementListopt  {{}}
;
LabelledStatement 
:	<identifier> 'label' <colon> 'colonToken' LabeledItem 'statement' {{}}	##
;
LabeledItem
:	Statement
#|	FunctionDeclaration	#Statement already does FunctionExpression
;
ThrowStatement 
:	<throw> 'throwToken' Expression 'expression' <semicolon> 'semicolon' {{}}
;
TryStatement 
:	<try> 'tryToken' Block 'tryBlock' Catch {{}}
|	<try> 'tryToken' Block 'tryBlock' Finally {{}}
|	<try> 'tryToken' Block 'tryBlock' Catch Finally {{}}
;
Catch 
:	<catch> 'catchToken' <leftParen> 'left' CatchParameter 'exceptionType' <rightParen> 'right' Block 'catchBlock'
;
Finally 
:	<finally> 'finallyToken' Block 'finallyBlock'
;
CatchParameter
:	Identifier	##
|	BindingPattern
;
DebuggerStatement 
:	<debugger> 'debuggerToken' <semicolon> 'semicolon' {{}}
;
#A.4
FunctionDeclaration 
:	<function> 'functionToken' Identifieropt 'name' <leftParen> 'left' FormalParameters <rightParen> 'right' <leftBrace> 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{Function}}	##
;
FunctionExpression 
:	<function> 'functionToken' Identifieropt 'name' <leftParen> 'left' FormalParameters <rightParen> 'right' <leftBrace> 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{Function}}	##
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
|	FormalsList <comma> 'comma' FunctionRestParameter 'restParameter'
;
FormalsList
:	FormalParameter 'parameter'
| 	FormalsList <comma> 'comma' FormalParameter 'parameter'
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
:	ArrowParameters <eqGt> 'arrow' ConciseBody {{}}
;
ArrowParameters
:	Identifier 'parameter'	##
|	CoverParenthesizedExpressionAndArrowParameterList
;
ConciseBody
:	AssignmentExpression 'statement'
|	<leftBrace> 'leftBracket' FunctionBody <rightBrace> 'rightBracket'
;
MethodDefinition
:	PropertyName 'name' <leftParen> 'left' StrictFormalParameters <rightParen> 'right' <leftBrace> 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{}}
|	GeneratorMethod
|	<get> 'getToken' PropertyName 'name' <leftParen> 'left' <rightParen> 'right' <leftBrace> 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{GetMethodDefinition}}
|	<set> 'setToken' PropertyName 'name' <leftParen> 'left' PropertySetParameterList <rightParen> 'right' <leftBrace> 'leftBrace' FunctionBody <rightBrace> 'rightBrace' {{SetMethodDefinition}}
;
PropertySetParameterList
:	FormalParameter 'parameter'
;
GeneratorMethod
:	<star> 'star' PropertyName 'name' <leftParen> 'left' StrictFormalParameters <rightParen> 'right' <leftBrace> 'leftBrace' GeneratorBody <rightBrace> 'rightBrace' {{GeneratorMethodDefinition}}
;
GeneratorDeclaration
:	<function> 'functionToken' <star> 'star' Identifieropt 'name' <leftParen> 'left' FormalParameters <rightParen> 'right' <leftBrace> 'leftBrace' GeneratorBody <rightBrace> 'rightBrace' {{GeneratorFunction}}	##
;
GeneratorExpression
:	<function> 'functionToken' <star> 'star' Identifieropt 'name' <leftParen> 'left' FormalParameters <rightParen> 'right' <leftBrace> 'leftBrace' GeneratorBody <rightBrace> 'rightBrace' {{GeneratorFunction}}	##
;
GeneratorBody
:	FunctionBody
;
YieldExpression
:	<yield> 'yieldToken'  staropt AssignmentExpression 'expression' {{}}
;
staropt
:
|	<star> 'star'
;
ClassDeclaration
:	<class> 'classToken' Identifieropt 'name' ClassTail {{ClassExpression}}	##
;
ClassExpression
:	<class> 'classToken' Identifieropt 'name' ClassTail {{}}	##
;
ClassTail
:	ClassHeritageopt <leftBrace> 'leftBrace' ClassBodyopt <rightBrace> 'rightBrace'
;
ClassHeritageopt
:
|	ClassHeritage
;
ClassHeritage
:	<extends> 'extendsToken' LeftHandSideExpression 'superclass'
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
|	<static> 'staticToken' MethodDefinition 'method' {{StaticMethodDefinition}}
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
:	<import> 'importToken' ImportClause FromClause <semicolon> 'semicolon' {{}}
|	<import> 'importToken' ModuleSpecifier <semicolon> 'semicolon' {{}}
;
ImportClause
:	ImportedDefaultBinding 'import'
|	NameSpaceImport 'import'
|	NamedImports 'import'
|	ImportedDefaultBinding 'import' <comma> 'comma' NameSpaceImport 'import'
|	ImportedDefaultBinding 'import' <comma> 'comma' NamedImports 'import'
;
ImportedDefaultBinding
:	ImportedBinding
;
NameSpaceImport
:	<star> 'star' <as> 'asToken' ImportedBinding 'import' {{}}
;
NamedImports
:	<leftBrace> 'leftBrace' <rightBrace> 'rightBrace' {{}}
|	<leftBrace> 'leftBrace' ImportsList <rightBrace> 'rightBrace' {{}}
|	<leftBrace> 'leftBrace' ImportsList <comma> 'comma' <rightBrace> 'rightBrace' {{}}
;
FromClause
:	<from> 'fromToken' ModuleSpecifier
;
ImportsList
:	ImportSpecifier 'specifier'
|	ImportsList <comma> 'comma' ImportSpecifier 'specifier'
;
ImportSpecifier
:	ImportedBinding 'binding' {{}}
|	<identifierName> 'name' <as> 'asToken' ImportedBinding 'binding' {{}}
;
ModuleSpecifier
:	StringLiteral 'from'
;
ImportedBinding
:	Identifier	##
;
ExportDeclaration
:	<export> 'exportToken' <star> 'star' FromClause <semicolon> 'semicolon' {{}}
|	<export> 'exportToken' ExportClause FromClause <semicolon> 'semicolon' {{}}
|	<export> 'exportToken' ExportClause <semicolon> 'semicolon' {{}}
|	<export> 'exportToken' VariableStatement 'statement' {{}}
|	<export> 'exportToken' Declaration 'declaration' {{}}
#|	<export> 'exportToken' <default> 'defaultToken' HoistableDeclaration 'declaration' {{}}	#handled by AssignmentExpression version below
#|	<export> 'exportToken' <default> 'defaultToken' ClassDeclaration 'declaration' {{}}	#handled by AssignmentExpression version below
|	<export> 'exportToken' <default> 'defaultToken' AssignmentExpression 'statement'<semicolon> 'semicolon' {{}}
;
ExportClause
:	<leftBrace> 'leftBrace' <rightBrace> 'rightBrace'
|	<leftBrace> 'leftBrace' ExportsList <rightBrace> 'rightBrace'
|	<leftBrace> 'leftBrace' ExportsList <comma> 'comma' <rightBrace> 'rightBrace'
;
ExportsList
:	ExportSpecifier 'specifier'
|	ExportsList <comma> 'comma' ExportSpecifier 'specifier'
;
ExportSpecifier
:	<identifierName> 'name' {{}}
|	<identifierName> 'name' <as> 'asToken' <identifierName> 'as' {{}}
;


NullLiteral
:	<null>
;
BooleanLiteral
:	<true>
|	<false>
;
StringLiteral
:	<string>
;
NumericLiteral
:	<numeric>
;
RegularExpressionLiteral
:	<regular_expression> 'value' {{RegularExpressionLiteral}}
;
#################################
# JSX Extensions
#################################
jsx jsxText <jsxLT>
:	\<
;
PrimaryExpression
:	JSXElement
|	JSXFragment
;
JSXElement
:	JSXSelfClosingElement
|	JSXOpeningElement 'openingElement' StartJSXText JSXChildren JSXClosingElement 'closingElement' {{XElement}}
;
JSXSelfClosingElement
:	SwitchToJSX <jsxLT> 'ltToken' JSXElementName 'name' JSXAttributes? <slash> 'slashToken' SwitchToJSXTextOrDefault1 <gt> 'gtToken' {{XSelfClosingElement}}
;
JSXOpeningElement
:	SwitchToJSX <jsxLT> 'ltToken' JSXElementName  'name' JSXAttributes? SwitchToJSXText <gt> 'gtToken' {{XOpeningElement}}
;
JSXClosingElement
:	SwitchToJSX <jsxLT> 'ltToken' <slash> 'slashToken' JSXElementName 'name' SwitchToJSXTextOrDefault2 <gt> 'gtToken' {{XClosingElement}}
;
JSXFragment
:	<jsxLT> 'ltToken' SwitchToJSXText <gt> 'gtToken' StartJSXText JSXChildren <jsxLT> 'ltToken' <slash> 'slashToken' SwitchToJSXTextOrDefault2 <gt> 'gtToken' {{XFragment}}
;
JSXElementName
:	<JSXIdentifier> 'identifier' {{XElementName}}
|	JSXNamespacedName
|	JSXMemberExpression
;
jsx <JSXIdentifier>
:	<identifier_start> (<identifier_part> | \-)*
;
JSXNamespacedName
:	<JSXIdentifier> 'identifier' <colon> 'colonToken' <JSXIdentifier> 'identifier' {{XNamespacedName}}
;
JSXMemberExpression
:	(<JSXIdentifier> 'identifier' <period> 'periodToken')+ <JSXIdentifier> 'identifier' {{XMemberExpression}}
;
JSXAttributes
:	(JSXSpreadAttribute 'attribute' | JSXAttribute 'attribute')+
;
JSXSpreadAttribute
:	SwitchToDefault <leftBrace> 'leftBrace' SpreadElement 'element' SwitchToJSX <rightBrace> 'rightBrace' {{XSpreadAttribute}}
;
JSXAttribute
:	JSXAttributeName 'name' JSXAttributeInitializer? {{XAttribute}}
;
JSXAttributeName
: 	<JSXIdentifier> 'identifier' {{XElementName}}
| 	JSXNamespacedName
;
JSXAttributeInitializer
:	<eq> 'equalToken' JSXAttributeValue 'value'
;
JSXAttributeValue
:	StringLiteral 'value' {{StringLiteral}}
|	SwitchToDefault <leftBrace> 'leftBrace' AssignmentExpression 'expression' SwitchToJSX <rightBrace> 'rightBrace' {{XCodeExpression}}
|	JSXElement
|	JSXFragment
;
JSXChildren
:	JSXChild 'item' *
;
JSXChild
:	<JSXText> 'value' {{XText}}
|	JSXElement
|	SwitchToDefault <leftBrace> 'leftBrace' JSXChildExpression 'expression' ? SwitchToJSXText <rightBrace> 'rightBrace' {{XCodeExpression}}
;
jsxText <JSXText>
:	[^\{\<\>\}]+
;
JSXChildExpression
:	AssignmentExpression
|	SpreadElement
;
SwitchToJSX
:	[self scope: #jsx. nil]
;
SwitchToJSXText
:	[self scope: #jsxText. nil]
;
StartJSXText
:	[#jsxText]
;
SwitchToJSXTextOrDefault1
:	[self switchToJSXTextOrDefault: 1]
;
SwitchToJSXTextOrDefault2
:	[self switchToJSXTextOrDefault: 2]
;
SwitchToDefault
:	[self scope: #default. #default]
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
			[ keywords := #(break case catch class const continue debugger default delete do else export extends finally for function if import in instanceof new return super switch this throw try typeof var void while with yield)
				asSet collect: [ :each | each asString ] ]
]

{ #category : #generated }
JSParser class >> reduceTable [
^#(
	#(137 0 #reduceActionForStartTemplateLiteral1: 10525697 true ) 
	#(299 0 #reduceActionForSwitchToJSX1: 35507201 true ) 
	#(254 0 #reduceActionForModuleBodyopt1: 30284801 false ) 
	#(251 0 #reduceActionForModuleBodyopt1: 30192641 false ) 
	#(119 0 #reduceActionForParameterListopt1: 8295425 false ) 
	#(174 0 #reduceActionForModuleBodyopt1: 19740673 false ) 
	#(124 0 #reduceActionForModuleBodyopt1: 9136129 false ) 
	#(195 1 #reduceActionForEmptyStatement1: 22236161 false ) 
	#(203 0 #reduceActionForCheckEOL1: 25078785 true ) 
	#(113 0 #nil 7064577 false ) 
	#(178 1 #liftFirstValue: 20032514 false ) 
	#(273 1 #liftFirstValue: 32862210 false ) 
	#(178 1 #liftFirstValue: 20032513 false ) 
	#(272 1 #liftFirstValue: 32838657 false ) 
	#(116 1 #reduceActionForPrimaryExpression1: 7254017 false ) 
	#(273 1 #liftFirstValue: 32862209 false ) 
	#(240 0 #nil 29422593 false ) 
	#(114 1 #reduceActionForIdentifier1: 7096321 false ) 
	#(274 1 #liftFirstValue: 32899073 false ) 
	#(275 1 #liftFirstValue: 32926721 false ) 
	#(276 1 #reduceActionForRegularExpressionLiteral1: 32956417 false ) 
	#(136 1 #reduceActionForTemplateLiteral1: 10374145 false ) 
	#(300 0 #reduceActionForSwitchToJSXText1: 35548161 true ) 
	#(116 1 #liftFirstValue: 7254018 false ) 
	#(231 1 #reduceActionForArrowParameters1: 27767809 false ) 
	#(140 1 #liftFirstValue: 10793985 false ) 
	#(116 1 #liftFirstValue: 7254027 false ) 
	#(231 1 #reduceActionForArrowParameters2: 27767810 false ) 
	#(116 1 #liftFirstValue: 7254019 false ) 
	#(116 1 #liftFirstValue: 7254020 false ) 
	#(116 1 #liftFirstValue: 7254021 false ) 
	#(116 1 #liftFirstValue: 7254026 false ) 
	#(144 1 #liftFirstValue: 11692033 false ) 
	#(140 1 #liftFirstValue: 10793989 false ) 
	#(140 1 #liftFirstValue: 10793990 false ) 
	#(142 1 #liftFirstValue: 11560961 false ) 
	#(149 1 #liftFirstValue: 12770305 false ) 
	#(149 1 #liftFirstValue: 12770306 false ) 
	#(145 1 #liftFirstValue: 11782146 false ) 
	#(150 1 #liftFirstValue: 12831749 false ) 
	#(151 1 #liftFirstValue: 13210625 false ) 
	#(152 1 #liftFirstValue: 13644801 false ) 
	#(153 1 #liftFirstValue: 13814785 false ) 
	#(154 1 #liftFirstValue: 14235649 false ) 
	#(155 1 #liftFirstValue: 14533633 false ) 
	#(156 1 #liftFirstValue: 14918657 false ) 
	#(157 1 #liftFirstValue: 15656961 false ) 
	#(158 1 #liftFirstValue: 16187393 false ) 
	#(159 1 #liftFirstValue: 16351233 false ) 
	#(160 1 #liftFirstValue: 16519169 false ) 
	#(161 1 #liftFirstValue: 16686081 false ) 
	#(162 1 #liftFirstValue: 16856065 false ) 
	#(163 1 #liftFirstValue: 17026049 false ) 
	#(164 1 #liftFirstValue: 17247233 false ) 
	#(167 1 #liftFirstValue: 18969601 false ) 
	#(176 1 #liftFirstValue: 19875841 false ) 
	#(168 1 #liftFirstValue: 19121158 false ) 
	#(168 1 #liftFirstValue: 19121153 false ) 
	#(172 1 #liftFirstValue: 19615745 false ) 
	#(257 1 #liftFirstValue: 30420995 false ) 
	#(176 1 #liftFirstValue: 19875842 false ) 
	#(168 1 #liftFirstValue: 19121154 false ) 
	#(168 1 #liftFirstValue: 19121155 false ) 
	#(168 1 #liftFirstValue: 19121156 false ) 
	#(168 1 #liftFirstValue: 19121157 false ) 
	#(171 1 #liftFirstValue: 19553281 false ) 
	#(168 1 #liftFirstValue: 19121159 false ) 
	#(168 1 #liftFirstValue: 19121160 false ) 
	#(168 1 #liftFirstValue: 19121161 false ) 
	#(168 1 #liftFirstValue: 19121162 false ) 
	#(171 1 #liftFirstValue: 19553282 false ) 
	#(168 1 #liftFirstValue: 19121163 false ) 
	#(168 1 #liftFirstValue: 19121164 false ) 
	#(168 1 #liftFirstValue: 19121165 false ) 
	#(168 1 #liftFirstValue: 19121166 false ) 
	#(116 1 #liftFirstValue: 7254022 false ) 
	#(164 1 #liftFirstValue: 17247235 false ) 
	#(116 1 #liftFirstValue: 7254024 false ) 
	#(164 1 #liftFirstValue: 17247234 false ) 
	#(116 1 #liftFirstValue: 7254023 false ) 
	#(112 1 #liftFirstValue: 6887425 false ) 
	#(253 1 #reduceActionForModule1: 30254081 false ) 
	#(254 1 #reduceActionForModuleBodyopt2: 30284802 false ) 
	#(255 1 #reduceActionForModuleBodyopt2: 30316545 false ) 
	#(256 1 #reduceActionForModuleItemList1: 30347265 false ) 
	#(257 1 #liftFirstValue: 30420993 false ) 
	#(257 1 #liftFirstValue: 30420994 false ) 
	#(121 1 #reduceActionForLiteral1: 8440833 false ) 
	#(121 1 #reduceActionForLiteral2: 8440834 false ) 
	#(121 1 #reduceActionForLiteral4: 8440836 false ) 
	#(121 1 #reduceActionForLiteral3: 8440835 false ) 
	#(116 1 #liftFirstValue: 7254025 false ) 
	#(116 1 #liftFirstValue: 7254028 false ) 
	#(277 1 #liftFirstValue: 33208321 false ) 
	#(301 0 #reduceActionForStartJSXText1: 35597313 true ) 
	#(116 1 #liftFirstValue: 7254029 false ) 
	#(252 1 #reduceActionForModuleBodyopt2: 30224385 false ) 
	#(175 1 #reduceActionForModuleItemList1: 19778561 false ) 
	#(250 1 #reduceActionForScript1: 30161921 false ) 
	#(251 1 #reduceActionForModuleBodyopt2: 30192642 false ) 
	#(134 0 #reduceActionForInitializeropt1: 10275841 false ) 
	#(119 1 #reduceActionForModuleBodyopt2: 8295426 false ) 
	#(184 1 #liftFirstValue: 20713473 false ) 
	#(184 1 #liftFirstValue: 20713474 false ) 
	#(120 1 #reduceActionForParameterList1: 8334337 false ) 
	#(191 1 #liftFirstValue: 21811201 false ) 
	#(127 2 #reduceActionForObjectLiteral1: 9315329 false ) 
	#(115 1 #reduceActionForIdentifier1: 7152641 false ) 
	#(129 1 #liftFirstValue: 9707521 false ) 
	#(131 1 #liftFirstValue: 9945089 false ) 
	#(128 1 #reduceActionForParameterList1: 9572353 false ) 
	#(130 1 #liftFirstValue: 9882625 false ) 
	#(130 1 #liftFirstValue: 9882626 false ) 
	#(129 1 #liftFirstValue: 9707522 false ) 
	#(174 1 #reduceActionForModuleBodyopt2: 19740674 false ) 
	#(129 1 #liftFirstValue: 9707524 false ) 
	#(233 1 #liftFirstValue: 27988994 false ) 
	#(131 1 #reduceActionForIdentifier1: 9945090 false ) 
	#(131 1 #reduceActionForIdentifier1: 9945091 false ) 
	#(125 1 #reduceActionForModuleItemList1: 9161729 false ) 
	#(124 1 #reduceActionForModuleBodyopt2: 9136130 false ) 
	#(151 2 #reduceActionForUnaryExpression5: 13210629 false ) 
	#(150 2 #reduceActionForUpdateExpression3: 12831747 false ) 
	#(151 2 #reduceActionForUnaryExpression5: 13210630 false ) 
	#(150 2 #reduceActionForUpdateExpression3: 12831748 false ) 
	#(151 2 #reduceActionForUnaryExpression5: 13210631 false ) 
	#(151 2 #reduceActionForUnaryExpression5: 13210632 false ) 
	#(244 0 #reduceActionForInitializeropt1: 29727745 false ) 
	#(113 1 #liftFirstValue: 7064578 false ) 
	#(219 2 #reduceActionForDebuggerStatement1: 26677249 false ) 
	#(151 2 #reduceActionForUnaryExpression5: 13210626 false ) 
	#(268 2 #reduceActionForExportDeclaration5: 31635461 false ) 
	#(169 1 #liftFirstValue: 19404801 false ) 
	#(169 1 #liftFirstValue: 19404803 false ) 
	#(268 2 #reduceActionForExportDeclaration4: 31635460 false ) 
	#(170 1 #liftFirstValue: 19483649 false ) 
	#(170 1 #liftFirstValue: 19483650 false ) 
	#(169 1 #liftFirstValue: 19404802 false ) 
	#(166 0 #nil 18937857 false ) 
	#(267 1 #liftFirstValue: 31600641 false ) 
	#(259 1 #reduceActionForImportClause1: 30667777 false ) 
	#(259 1 #reduceActionForImportClause1: 30667778 false ) 
	#(259 1 #reduceActionForImportClause1: 30667779 false ) 
	#(260 1 #liftFirstValue: 30920705 false ) 
	#(266 1 #liftFirstValue: 31558657 false ) 
	#(144 2 #reduceActionForNewExpression2: 11692034 false ) 
	#(146 2 #reduceActionForSuperCall1: 12246017 false ) 
	#(151 2 #reduceActionForUnaryExpression5: 13210628 false ) 
	#(182 1 #reduceActionForParameterList1: 20414465 false ) 
	#(151 2 #reduceActionForUnaryExpression5: 13210627 false ) 
	#(240 1 #liftFirstValue: 29422594 false ) 
	#(140 2 #reduceActionForMemberExpression4: 10793988 false ) 
	#(145 2 #reduceActionForCallExpression1: 11782145 false ) 
	#(145 2 #reduceActionForMemberExpression4: 11782150 false ) 
	#(145 2 #reduceActionForCallExpression1: 11782147 false ) 
	#(165 1 #liftFirstValue: 17430531 false ) 
	#(165 1 #liftFirstValue: 17430535 false ) 
	#(165 1 #liftFirstValue: 17430536 false ) 
	#(165 1 #liftFirstValue: 17430537 false ) 
	#(165 1 #liftFirstValue: 17430529 false ) 
	#(165 1 #liftFirstValue: 17430530 false ) 
	#(165 1 #liftFirstValue: 17430532 false ) 
	#(165 1 #liftFirstValue: 17430538 false ) 
	#(165 1 #liftFirstValue: 17430539 false ) 
	#(165 1 #liftFirstValue: 17430540 false ) 
	#(165 1 #liftFirstValue: 17430534 false ) 
	#(165 1 #liftFirstValue: 17430533 false ) 
	#(150 2 #reduceActionForUpdateExpression1: 12831745 false ) 
	#(150 2 #reduceActionForUpdateExpression1: 12831746 false ) 
	#(196 2 #reduceActionForExpressionStatement1: 22286337 false ) 
	#(179 1 #reduceActionForParameterList1: 20064257 false ) 
	#(256 2 #reduceActionForModuleItemList2: 30347266 false ) 
	#(296 0 #reduceActionForModuleBodyopt1: 35192833 false ) 
	#(175 2 #reduceActionForModuleItemList2: 19778562 false ) 
	#(185 2 #reduceActionForObjectBindingPattern1: 20776961 false ) 
	#(187 1 #reduceActionForParameterList1: 21406721 false ) 
	#(190 1 #liftFirstValue: 21697537 false ) 
	#(193 0 #nil 22005761 false ) 
	#(188 1 #reduceActionForBindingElementList1: 21525505 false ) 
	#(192 2 #reduceActionForSingleNameBinding1: 21917697 false ) 
	#(134 1 #reduceActionForModuleBodyopt2: 10275842 false ) 
	#(118 3 #reduceActionForCoverParenthesizedExpressionAndArrowParameterList1: 7671809 false ) 
	#(117 3 #reduceActionForParenthesizedExpression1: 7565313 false ) 
	#(191 2 #reduceActionForSingleNameBinding1: 21811202 false ) 
	#(133 2 #reduceActionForCoverInitializedName1: 10192897 false ) 
	#(127 3 #reduceActionForObjectLiteral2: 9315330 false ) 
	#(223 0 #reduceActionForFormalParameters1: 27235329 false ) 
	#(173 3 #reduceActionForBlock1: 19641345 false ) 
	#(122 3 #reduceActionForArrayLiteral2: 8623106 false ) 
	#(122 3 #reduceActionForArrayLiteral1: 8623105 false ) 
	#(123 2 #reduceActionForElementList2: 8886274 false ) 
	#(123 2 #reduceActionForElementList2: 8886273 false ) 
	#(125 2 #reduceActionForModuleItemList2: 9161730 false ) 
	#(242 3 #reduceActionForClassExpression1: 29549569 false ) 
	#(244 1 #reduceActionForModuleBodyopt2: 29727746 false ) 
	#(269 2 #reduceActionForExportClause1: 32396289 false ) 
	#(271 1 #reduceActionForExportSpecifier1: 32716801 false ) 
	#(270 1 #reduceActionForParameterList1: 32612353 false ) 
	#(268 3 #reduceActionForExportDeclaration3: 31635459 false ) 
	#(166 1 #liftFirstValue: 18937858 false ) 
	#(262 2 #reduceActionForNamedImports1: 31045633 false ) 
	#(264 1 #reduceActionForParameterList1: 31328257 false ) 
	#(265 1 #reduceActionForImportSpecifier1: 31432705 false ) 
	#(258 3 #reduceActionForImportDeclaration2: 30495746 false ) 
	#(143 3 #reduceActionForNewTarget1: 11588609 false ) 
	#(140 3 #reduceActionForMemberExpression7: 10793991 false ) 
	#(147 2 #reduceActionForArguments1: 12316673 false ) 
	#(148 1 #reduceActionForArgumentList1: 12502017 false ) 
	#(141 3 #reduceActionForSuperProperty2: 11295746 false ) 
	#(214 3 #reduceActionForThrowStatement1: 26173441 false ) 
	#(215 3 #reduceActionForTryStatement1: 26269697 false ) 
	#(215 3 #reduceActionForTryStatement2: 26269698 false ) 
	#(183 2 #reduceActionForSingleNameBinding1: 20550657 false ) 
	#(181 3 #reduceActionForVariableStatement1: 20319233 false ) 
	#(183 2 #reduceActionForVariableDeclaration2: 20550658 false ) 
	#(239 3 #reduceActionForYieldExpression1: 29331457 false ) 
	#(213 1 #liftFirstValue: 26079233 false ) 
	#(212 3 #reduceActionForLabelledStatement1: 25979905 false ) 
	#(140 3 #reduceActionForMemberExpression3: 10793987 false ) 
	#(145 3 #reduceActionForMemberExpression3: 11782149 false ) 
	#(164 3 #reduceActionForAssignmentExpression4: 17247236 false ) 
	#(152 3 #reduceActionForExponentiationExpression2: 13644802 false ) 
	#(153 3 #reduceActionForExponentiationExpression2: 13814787 false ) 
	#(153 3 #reduceActionForExponentiationExpression2: 13814786 false ) 
	#(153 3 #reduceActionForExponentiationExpression2: 13814788 false ) 
	#(154 3 #reduceActionForExponentiationExpression2: 14235650 false ) 
	#(154 3 #reduceActionForExponentiationExpression2: 14235651 false ) 
	#(155 3 #reduceActionForExponentiationExpression2: 14533634 false ) 
	#(155 3 #reduceActionForExponentiationExpression2: 14533635 false ) 
	#(155 3 #reduceActionForExponentiationExpression2: 14533636 false ) 
	#(156 3 #reduceActionForExponentiationExpression2: 14918658 false ) 
	#(156 3 #reduceActionForExponentiationExpression2: 14918659 false ) 
	#(156 3 #reduceActionForExponentiationExpression2: 14918660 false ) 
	#(156 3 #reduceActionForExponentiationExpression2: 14918661 false ) 
	#(156 3 #reduceActionForExponentiationExpression2: 14918663 false ) 
	#(156 3 #reduceActionForExponentiationExpression2: 14918662 false ) 
	#(157 3 #reduceActionForExponentiationExpression2: 15656962 false ) 
	#(157 3 #reduceActionForExponentiationExpression2: 15656964 false ) 
	#(157 3 #reduceActionForExponentiationExpression2: 15656963 false ) 
	#(157 3 #reduceActionForExponentiationExpression2: 15656965 false ) 
	#(158 3 #reduceActionForExponentiationExpression2: 16187394 false ) 
	#(159 3 #reduceActionForExponentiationExpression2: 16351234 false ) 
	#(160 3 #reduceActionForExponentiationExpression2: 16519170 false ) 
	#(161 3 #reduceActionForExponentiationExpression2: 16686082 false ) 
	#(162 3 #reduceActionForExponentiationExpression2: 16856066 false ) 
	#(167 3 #reduceActionForExpression2: 18969602 false ) 
	#(180 2 #reduceActionForSingleNameBinding1: 20162561 false ) 
	#(177 3 #reduceActionForLexicalDeclaration1: 19943425 false ) 
	#(180 2 #reduceActionForVariableDeclaration2: 20162562 false ) 
	#(232 1 #reduceActionForConciseBody1: 27868161 false ) 
	#(230 3 #reduceActionForArrowFunction1: 27700225 false ) 
	#(304 0 #reduceActionForSwitchToDefault1: 35759105 true ) 
	#(295 1 #reduceActionForModuleBodyopt2: 35178497 false ) 
	#(282 1 #reduceActionForJSXElementName1: 34034689 false ) 
	#(282 1 #liftFirstValue: 34034690 false ) 
	#(282 1 #liftFirstValue: 34034691 false ) 
	#(286 1 #reduceActionFor__JSXIdentifier___identifier___period___periodToken___1: 34361345 false ) 
	#(185 3 #reduceActionForObjectBindingPattern2: 20776962 false ) 
	#(189 2 #reduceActionForBindingElisionElement1: 21634049 false ) 
	#(193 1 #liftFirstValue: 22005762 false ) 
	#(186 3 #reduceActionForArrayBindingPattern2: 21032962 false ) 
	#(135 2 #reduceActionForInitializer1: 10309633 false ) 
	#(120 3 #reduceActionForParameterList2: 8334338 false ) 
	#(132 3 #reduceActionForComputedPropertyName1: 10072065 false ) 
	#(127 4 #reduceActionForObjectLiteral3: 9315331 false ) 
	#(128 3 #reduceActionForParameterList2: 9572354 false ) 
	#(227 1 #liftFirstValue: 27579393 false ) 
	#(226 1 #liftFirstValue: 27533313 false ) 
	#(222 1 #reduceActionForModuleBodyopt2: 27190273 false ) 
	#(223 1 #reduceActionForModuleBodyopt2: 27235330 false ) 
	#(224 1 #reduceActionForFormalParameterList2: 27279362 false ) 
	#(224 1 #reduceActionForFormalParameterList1: 27279361 false ) 
	#(225 1 #reduceActionForParameterList1: 27427841 false ) 
	#(129 3 #reduceActionForPropertyDefinition3: 9707523 false ) 
	#(122 4 #reduceActionForArrayLiteral3: 8623107 false ) 
	#(126 2 #reduceActionForSpreadElement1: 9217025 false ) 
	#(202 4 #reduceActionForBreakStatement1: 24975361 false ) 
	#(245 2 #reduceActionForInitializer1: 29765633 false ) 
	#(246 0 #reduceActionForModuleBodyopt1: 29846529 false ) 
	#(201 4 #reduceActionForContinueStatement1: 24862721 false ) 
	#(269 3 #reduceActionForExportClause2: 32396290 false ) 
	#(263 2 #reduceActionForInitializer1: 31277057 false ) 
	#(268 4 #reduceActionForExportDeclaration1: 31635457 false ) 
	#(241 3 #reduceActionForClassExpression1: 29451265 false ) 
	#(268 4 #reduceActionForExportDeclaration6: 31635462 false ) 
	#(268 4 #reduceActionForExportDeclaration2: 31635458 false ) 
	#(200 1 #liftFirstValue: 24815617 false ) 
	#(200 1 #liftFirstValue: 24815618 false ) 
	#(199 2 #reduceActionForInitializer1: 24751105 false ) 
	#(262 3 #reduceActionForNamedImports2: 31045634 false ) 
	#(261 3 #reduceActionForNameSpaceImport1: 30964737 false ) 
	#(258 4 #reduceActionForImportDeclaration1: 30495745 false ) 
	#(259 3 #reduceActionForImportClause4: 30667780 false ) 
	#(259 3 #reduceActionForImportClause4: 30667781 false ) 
	#(204 4 #reduceActionForReturnStatement1: 25113601 false ) 
	#(148 2 #reduceActionForArgumentList2: 12502018 false ) 
	#(147 3 #reduceActionForArguments2: 12316674 false ) 
	#(141 4 #reduceActionForSuperProperty1: 11295745 false ) 
	#(217 2 #reduceActionForInitializer1: 26565633 false ) 
	#(215 4 #reduceActionForTryStatement3: 26269699 false ) 
	#(182 3 #reduceActionForParameterList2: 20414466 false ) 
	#(138 1 #reduceActionForParameterList1: 10563585 false ) 
	#(136 4 #reduceActionForTemplateLiteral2: 10374146 false ) 
	#(140 4 #reduceActionForMemberExpression2: 10793986 false ) 
	#(145 4 #reduceActionForCallExpression4: 11782148 false ) 
	#(179 3 #reduceActionForParameterList2: 20064258 false ) 
	#(229 1 #reduceActionForModuleBodyopt2: 27656193 false ) 
	#(228 1 #reduceActionForModuleBodyopt2: 27615233 false ) 
	#(277 4 #reduceActionForJSXElement2: 33208322 false ) 
	#(297 1 #reduceActionForJSXChild1: 35213313 false ) 
	#(297 1 #liftFirstValue: 35213314 false ) 
	#(296 2 #reduceActionForModuleItemList2: 35192834 false ) 
	#(285 2 #reduceActionForInitializer1: 34361345 false ) 
	#(302 0 #reduceActionForSwitchToJSXTextOrDefault11: 35625985 true ) 
	#(292 1 #reduceActionForJSXElementName1: 34785281 false ) 
	#(292 1 #liftFirstValue: 34785282 false ) 
	#(289 1 #reduceActionForModuleItemList1: 34488321 false ) 
	#(287 1 #reduceActionForModuleBodyopt2: 34471937 false ) 
	#(288 1 #liftFirstValue: 34488321 false ) 
	#(288 1 #liftFirstValue: 34488322 false ) 
	#(291 1 #reduceActionForJSXAttribute1: 34702337 false ) 
	#(284 2 #reduceActionForJSXMemberExpression1: 34338817 false ) 
	#(286 2 #reduceActionFor__JSXIdentifier___identifier___period___periodToken___2: 34361346 false ) 
	#(190 3 #reduceActionForBindingProperty2: 21697538 false ) 
	#(185 4 #reduceActionForObjectBindingPattern3: 20776963 false ) 
	#(187 3 #reduceActionForParameterList2: 21406722 false ) 
	#(194 2 #reduceActionForBindingRestElement1: 22053889 false ) 
	#(194 2 #reduceActionForBindingRestElement1: 22053890 false ) 
	#(186 4 #reduceActionForArrayBindingPattern1: 21032961 false ) 
	#(188 3 #reduceActionForBindingElementList2: 21525506 false ) 
	#(234 1 #liftFirstValue: 28549121 false ) 
	#(123 4 #reduceActionForElementList4: 8886276 false ) 
	#(123 4 #reduceActionForElementList4: 8886275 false ) 
	#(249 1 #reduceActionForEmptyStatement1: 29996035 false ) 
	#(249 1 #liftFirstValue: 29996033 false ) 
	#(246 1 #reduceActionForModuleBodyopt2: 29846530 false ) 
	#(247 1 #reduceActionForModuleBodyopt2: 29876225 false ) 
	#(248 1 #reduceActionForModuleItemList1: 29907969 false ) 
	#(271 3 #reduceActionForExportSpecifier2: 32716802 false ) 
	#(269 4 #reduceActionForExportClause3: 32396291 false ) 
	#(270 3 #reduceActionForParameterList2: 32612354 false ) 
	#(197 5 #reduceActionForIfStatement2: 22366210 false ) 
	#(265 3 #reduceActionForImportSpecifier2: 31432706 false ) 
	#(262 4 #reduceActionForNamedImports3: 31045635 false ) 
	#(264 3 #reduceActionForParameterList2: 31328258 false ) 
	#(147 4 #reduceActionForArguments3: 12316675 false ) 
	#(148 3 #reduceActionForArgumentList3: 12502019 false ) 
	#(208 0 #reduceActionForModuleBodyopt1: 25674753 false ) 
	#(206 5 #reduceActionForSwitchStatement1: 25358337 false ) 
	#(218 1 #liftFirstValue: 26626049 false ) 
	#(218 1 #liftFirstValue: 26626050 false ) 
	#(198 5 #reduceActionForIterationStatement2: 22657026 false ) 
	#(205 5 #reduceActionForWithStatement1: 25226241 false ) 
	#(139 2 #reduceActionForTemplateMiddleList1: 10648577 false ) 
	#(138 2 #reduceActionForTemplateSpans2: 10563586 false ) 
	#(163 5 #reduceActionForConditionalExpression2: 17026050 false ) 
	#(232 3 #reduceActionForConciseBody2: 27868162 false ) 
	#(283 3 #reduceActionForJSXNamespacedName1: 34214913 false ) 
	#(289 2 #reduceActionForModuleItemList2: 34488322 false ) 
	#(291 2 #reduceActionForJSXAttribute2: 34702338 false ) 
	#(279 5 #reduceActionForJSXOpeningElement1: 33542145 false ) 
	#(118 6 #reduceActionForCoverParenthesizedExpressionAndArrowParameterList2: 7671810 false ) 
	#(118 6 #reduceActionForCoverParenthesizedExpressionAndArrowParameterList2: 7671811 false ) 
	#(224 3 #reduceActionForFormalParameterList3: 27279363 false ) 
	#(225 3 #reduceActionForParameterList2: 27427842 false ) 
	#(249 2 #reduceActionForClassElement2: 29996034 false ) 
	#(243 4 #reduceActionForClassTail1: 29631489 false ) 
	#(248 2 #reduceActionForModuleItemList2: 29907970 false ) 
	#(148 4 #reduceActionForArgumentList4: 12502020 false ) 
	#(208 1 #reduceActionForModuleBodyopt2: 25674754 false ) 
	#(209 1 #reduceActionForModuleItemList1: 25708545 false ) 
	#(139 3 #reduceActionForTemplateMiddleList2: 10648578 false ) 
	#(298 1 #liftFirstValue: 35445762 false ) 
	#(298 1 #liftFirstValue: 35445761 false ) 
	#(278 6 #reduceActionForJSXSelfClosingElement1: 33358849 false ) 
	#(279 6 #reduceActionForJSXOpeningElement2: 33542146 false ) 
	#(294 1 #reduceActionForLiteral4: 34950145 false ) 
	#(294 1 #liftFirstValue: 34950147 false ) 
	#(294 1 #liftFirstValue: 34950148 false ) 
	#(293 2 #reduceActionForInitializer1: 34876417 false ) 
	#(186 6 #reduceActionForArrayBindingPattern3: 21032963 false ) 
	#(198 7 #reduceActionForIterationStatement1: 22657025 false ) 
	#(198 7 #reduceActionForIterationStatement6: 22657030 false ) 
	#(198 7 #reduceActionForIterationStatement9: 22657033 false ) 
	#(198 7 #reduceActionForIterationStatement8: 22657032 false ) 
	#(198 7 #reduceActionForIterationStatement11: 22657035 false ) 
	#(197 7 #reduceActionForIfStatement1: 22366209 false ) 
	#(207 3 #reduceActionForCaseBlock1: 25484289 false ) 
	#(209 2 #reduceActionForModuleItemList2: 25708546 false ) 
	#(216 5 #reduceActionForCatch1: 26440705 false ) 
	#(303 0 #reduceActionForSwitchToJSXTextOrDefault21: 35692545 true ) 
	#(297 4 #reduceActionForJSXChild3: 35213315 false ) 
	#(278 7 #reduceActionForJSXSelfClosingElement2: 33358850 false ) 
	#(238 1 #reduceActionForModuleBodyopt2: 29299713 false ) 
	#(233 7 #reduceActionForMethodDefinition3: 27988995 false ) 
	#(233 7 #reduceActionForMethodDefinition1: 27988993 false ) 
	#(198 8 #reduceActionForIterationStatement10: 22657034 false ) 
	#(198 8 #reduceActionForIterationStatement7: 22657031 false ) 
	#(198 8 #reduceActionForIterationStatement5: 22657029 false ) 
	#(221 8 #reduceActionForFunctionExpression1: 26977281 false ) 
	#(297 5 #reduceActionForJSXChild4: 35213316 false ) 
	#(290 5 #reduceActionForJSXSpreadAttribute1: 34552833 false ) 
	#(235 8 #reduceActionForGeneratorMethod1: 28607489 false ) 
	#(233 8 #reduceActionForMethodDefinition4: 27988996 false ) 
	#(220 8 #reduceActionForFunctionExpression1: 26763265 false ) 
	#(198 9 #reduceActionForIterationStatement3: 22657027 false ) 
	#(237 9 #reduceActionForGeneratorExpression1: 29062145 false ) 
	#(210 4 #reduceActionForCaseClause1: 25781249 false ) 
	#(211 3 #reduceActionForDefaultClause1: 25889793 false ) 
	#(207 5 #reduceActionForCaseBlock2: 25484290 false ) 
	#(281 9 #reduceActionForJSXFragment1: 33846273 false ) 
	#(280 6 #reduceActionForJSXClosingElement1: 33686529 false ) 
	#(236 9 #reduceActionForGeneratorExpression1: 28823553 false ) 
	#(198 10 #reduceActionForIterationStatement4: 22657028 false ) 
	#(294 5 #reduceActionForJSXChild4: 34950146 false )
	).
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

{ #category : #generated }
JSParser class >> symbolNames [
	^ #('<leftParen>' '<rightParen>' '<leftBrace>' '<rightBrace>' '<leftBracket>' '<rightBracket>' '<semicolon>' '<slash>' '<slashEqual>' '<lt>' '<ltLt>' '<ltLtEq>' '<gt>' '<gtGt>' '<gtGtEq>' '<gtGtGtEq>' '<gtGtGt>' '<eqGt>' '<ltEq>' '<gtEq>' '<period>' '<eq>' '<eqEq>' '<eqEqEq>' '<star>' '<starStar>' '<starEq>' '<percentEq>' '<ampEq>' '<upEq>' '<barEq>' '<minusEq>' '<plusEq>' '<plus>' '<plusPlus>' '<minus>' '<minusMinus>' '<tilde>' '<amp>' '<ampAmp>' '<question>' '<percent>' '<bar>' '<barBar>' '<up>' '<bang>' '<bangEq>' '<bangEqEq>' '<as>' '<break>' '<case>' '<catch>' '<class>' '<const>' '<continue>' '<debugger>' '<default>' '<delete>' '<do>' '<else>' '<export>' '<extends>' '<false>' '<finally>' '<for>' '<from>' '<function>' '<get>' '<if>' '<import>' '<in>' '<instanceof>' '<let>' '<new>' '<null>' '<of>' '<return>' '<set>' '<static>' '<super>' '<switch>' '<target>' '<this>' '<throw>' '<true>' '<try>' '<typeof>' '<var>' '<void>' '<while>' '<with>' '<yield>' '<dotDotDot>' '<comma>' '<colon>' '<comment>' '<identifier>' '<identifierName>' '<whitespace>' '<string>' '<numeric>' '<regular_expression>' '<patternToken>' '<no_substitution_template>' '<template_head>' '<template_middle>' '<template_end>' '<jsxLT>' '<JSXIdentifier>' '<JSXText>' 'B e g i n' 'goal' 'Identifieropt' 'Identifier' 'IdentifierName' 'PrimaryExpression' 'ParenthesizedExpression' 'CoverParenthesizedExpressionAndArrowParameterList' 'ParameterListopt' 'ParameterList' 'Literal' 'ArrayLiteral' 'ElementList' 'Elisionopt' 'Elision' 'SpreadElement' 'ObjectLiteral' 'PropertyDefinitionList' 'PropertyDefinition' 'PropertyName' 'LiteralPropertyName' 'ComputedPropertyName' 'CoverInitializedName' 'Initializeropt' 'Initializer' 'TemplateLiteral' 'StartTemplateLiteral' 'TemplateSpans' 'TemplateMiddleList' 'MemberExpression' 'SuperProperty' 'MetaProperty' 'NewTarget' 'NewExpression' 'CallExpression' 'SuperCall' 'Arguments' 'ArgumentList' 'LeftHandSideExpression' 'UpdateExpression' 'UnaryExpression' 'ExponentiationExpression' 'MultiplicativeExpression' 'AdditiveExpression' 'ShiftExpression' 'RelationalExpression' 'EqualityExpression' 'BitwiseANDExpression' 'BitwiseXORExpression' 'BitwiseORExpression' 'LogicalANDExpression' 'LogicalORExpression' 'ConditionalExpression' 'AssignmentExpression' 'AssignmentOperator' 'Expressionopt' 'Expression' 'Statement' 'Declaration' 'HoistableDeclaration' 'BreakableStatement' 'BlockStatement' 'Block' 'StatementListopt' 'StatementList' 'StatementListItem' 'LexicalDeclaration' 'LetOrConst' 'BindingList' 'LexicalBinding' 'VariableStatement' 'VariableDeclarationList' 'VariableDeclaration' 'BindingPattern' 'ObjectBindingPattern' 'ArrayBindingPattern' 'BindingPropertyList' 'BindingElementList' 'BindingElisionElement' 'BindingProperty' 'BindingElement' 'SingleNameBinding' 'BindingRestElementopt' 'BindingRestElement' 'EmptyStatement' 'ExpressionStatement' 'IfStatement' 'IterationStatement' 'ForDeclaration' 'ForBinding' 'ContinueStatement' 'BreakStatement' 'CheckEOL' 'ReturnStatement' 'WithStatement' 'SwitchStatement' 'CaseBlock' 'CaseClausesopt' 'CaseClauses' 'CaseClause' 'DefaultClause' 'LabelledStatement' 'LabeledItem' 'ThrowStatement' 'TryStatement' 'Catch' 'Finally' 'CatchParameter' 'DebuggerStatement' 'FunctionDeclaration' 'FunctionExpression' 'StrictFormalParameters' 'FormalParameters' 'FormalParameterList' 'FormalsList' 'FunctionRestParameter' 'FormalParameter' 'FunctionBody' 'FunctionStatementList' 'ArrowFunction' 'ArrowParameters' 'ConciseBody' 'MethodDefinition' 'PropertySetParameterList' 'GeneratorMethod' 'GeneratorDeclaration' 'GeneratorExpression' 'GeneratorBody' 'YieldExpression' 'staropt' 'ClassDeclaration' 'ClassExpression' 'ClassTail' 'ClassHeritageopt' 'ClassHeritage' 'ClassBodyopt' 'ClassBody' 'ClassElementList' 'ClassElement' 'Script' 'ScriptBodyopt' 'ScriptBody' 'Module' 'ModuleBodyopt' 'ModuleBody' 'ModuleItemList' 'ModuleItem' 'ImportDeclaration' 'ImportClause' 'ImportedDefaultBinding' 'NameSpaceImport' 'NamedImports' 'FromClause' 'ImportsList' 'ImportSpecifier' 'ModuleSpecifier' 'ImportedBinding' 'ExportDeclaration' 'ExportClause' 'ExportsList' 'ExportSpecifier' 'NullLiteral' 'BooleanLiteral' 'StringLiteral' 'NumericLiteral' 'RegularExpressionLiteral' 'JSXElement' 'JSXSelfClosingElement' 'JSXOpeningElement' 'JSXClosingElement' 'JSXFragment' 'JSXElementName' 'JSXNamespacedName' 'JSXMemberExpression' '(<JSXIdentifier> ''identifier'' <period> ''periodToken'')' '(<JSXIdentifier> ''identifier'' <period> ''periodToken'')+' 'JSXAttributes' '(JSXSpreadAttribute ''attribute'' | JSXAttribute ''attribute'')' '(JSXSpreadAttribute ''attribute'' | JSXAttribute ''attribute'')+' 'JSXSpreadAttribute' 'JSXAttribute' 'JSXAttributeName' 'JSXAttributeInitializer' 'JSXAttributeValue' 'JSXChildren' 'JSXChild ''item'' *' 'JSXChild' 'JSXChildExpression' 'SwitchToJSX' 'SwitchToJSXText' 'StartJSXText' 'SwitchToJSXTextOrDefault1' 'SwitchToJSXTextOrDefault2' 'SwitchToDefault' 'E O F' 'error')
]

{ #category : #generated }
JSParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #JSModuleNode #JSModuleNode #JSNameExpressionNode #JSNameExpressionNode #JSNameExpressionNode #JSExpressionNode #JSExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #JSLiteralNode #JSArrayLiteralNode #OrderedCollection #OrderedCollection #OrderedCollection #JSSpreadExpressionNode #JSObjectLiteralNode #OrderedCollection #JSProgramNode #JSProgramNode #JSNameExpressionNode #JSComputedPropertyNameNode #JSPropertyAssignmentNode #OrderedCollection #OrderedCollection #JSTemplateLiteralNode #ByteSymbol #OrderedCollection #OrderedCollection #JSExpressionNode #JSExpressionNode #JSNewTargetExpressionNode #JSNewTargetExpressionNode #JSExpressionNode #JSExpressionNode #JSSuperCallExpressionNode #OrderedCollection #OrderedCollection #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #JSExpressionNode #SmaCCToken #JSExpressionNode #JSExpressionNode #JSStatementNode #JSProgramNode #JSFunctionNode #JSStatementNode #JSBlockStatementNode #JSBlockStatementNode #OrderedCollection #OrderedCollection #JSStatementNode #JSLexicalDeclarationNode #SmaCCToken #OrderedCollection #JSProgramNode #JSVariableStatementNode #OrderedCollection #JSProgramNode #JSProgramNode #JSObjectBindingPatternNode #JSArrayBindingPatternNode #OrderedCollection #OrderedCollection #OrderedCollection #JSProgramNode #JSVariableDeclarationNode #JSVariableDeclarationNode #JSRestVariableDeclarationNode #JSRestVariableDeclarationNode #JSEmptyStatementNode #JSExpressionStatementNode #JSIfStatementNode #JSStatementNode #OrderedCollection #JSProgramNode #JSContinueStatementNode #JSBreakStatementNode nil #JSReturnStatementNode #JSWithStatementNode #JSSwitchStatementNode #OrderedCollection #OrderedCollection #OrderedCollection #JSCaseClauseNode #JSDefaultClauseNode #JSLabelledStatementNode #JSStatementNode #JSThrowStatementNode #JSTryStatementNode #OrderedCollection #OrderedCollection #JSProgramNode #JSDebuggerStatementNode #JSFunctionNode #JSFunctionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JSRestVariableDeclarationNode #JSVariableDeclarationNode #OrderedCollection #OrderedCollection #JSArrowFunctionNode #OrderedCollection #OrderedCollection #JSMethodDefinitionNode #JSVariableDeclarationNode #JSGeneratorMethodDefinitionNode #JSGeneratorFunctionNode #JSGeneratorFunctionNode #OrderedCollection #JSYieldExpressionNode #SmaCCToken #JSClassExpressionNode #JSClassExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JSProgramNode #JSScriptNode #OrderedCollection #OrderedCollection #JSModuleNode #OrderedCollection #OrderedCollection #OrderedCollection #JSProgramNode #JSImportDeclarationNode #OrderedCollection #JSNameExpressionNode #JSNameSpaceImportNode #JSNamedImportsNode #OrderedCollection #OrderedCollection #JSImportSpecifierNode #SmaCCToken #JSNameExpressionNode #JSExportDeclarationNode #OrderedCollection #OrderedCollection #JSExportSpecifierNode #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #JSRegularExpressionLiteralNode #JSExpressionNode #JSXSelfClosingElementNode #JSXOpeningElementNode #JSXClosingElementNode #JSXFragmentNode #JSProgramNode #JSXNamespacedNameNode #JSXMemberExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #JSProgramNode #OrderedCollection #JSXSpreadAttributeNode #JSXAttributeNode #JSProgramNode #OrderedCollection #JSExpressionNode #OrderedCollection #OrderedCollection #JSExpressionNode #JSExpressionNode nil nil #ByteSymbol #Object #Object #ByteSymbol #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
JSParser class >> transitionTable [
^#(
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 0 93 0 61 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 113 0 70 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 205 0 112 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 1 209 0 168 1 209 0 171 1 209 0 172 1 209 0 173 1 209 0 176 1 209 0 177 1 109 0 178 1 209 0 181 1 209 0 195 1 209 0 196 1 209 0 197 1 209 0 198 1 209 0 201 1 209 0 202 1 209 0 204 1 209 0 205 1 209 0 206 1 209 0 212 1 209 0 214 1 209 0 215 1 209 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 0 205 0 253 1 197 0 254 1 201 0 255 1 205 1 0 1 209 1 1 1 209 1 2 1 209 1 12 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43 0 14 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 2 13 0 163 2 13 0 164 2 13 0 167 0 245 0 221 2 13 0 230 1 177 0 231 0 245 0 237 2 13 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 17 0 168 2 17 0 171 2 17 0 172 2 17 0 173 2 17 0 181 2 17 0 195 2 17 0 196 2 17 0 197 2 17 0 198 2 17 0 201 2 17 0 202 2 17 0 204 2 17 0 205 2 17 0 206 2 17 0 212 2 17 0 214 2 17 0 215 2 17 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 2 21 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 2 29 0 250 2 33 0 251 2 37 0 252 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43 0 18 1 49] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 0 93 0 61 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 113 0 70 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 1 209 0 168 1 209 0 171 1 209 0 172 1 209 0 173 1 209 0 176 1 209 0 177 1 109 0 178 1 209 0 181 1 209 0 195 1 209 0 196 1 209 0 197 1 209 0 198 1 209 0 201 1 209 0 202 1 209 0 204 1 209 0 205 1 209 0 206 1 209 0 212 1 209 0 214 1 209 0 215 1 209 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 2 41 0 253 1 197 0 254 1 201 0 255 1 205 1 0 1 209 1 1 1 209 1 2 1 209 1 12 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43 0 14 1 49] 
#[1 0 25 0 1 0 22 0 2 2 45 0 3 2 49 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 0 22 0 94 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 2 53 0 114 0 245 0 116 0 245 0 117 0 221 0 118 2 57 0 119 2 61 0 120 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 2 65 0 163 2 65 0 164 2 65 0 167 2 69 0 184 2 69 0 185 2 69 0 186 2 81 0 191 2 81 0 192 0 245 0 221 2 65 0 230 1 177 0 231 0 245 0 237 2 65 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 11 0 4 2 93 0 5 0 37 0 7 2 97 0 25 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 2 101 0 68 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 2 105 0 78 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 2 109 0 98 2 161 0 100 2 165 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 2 113 0 114 2 129 0 115 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 2 121 0 128 2 125 0 129 2 129 0 130 2 129 0 131 2 129 0 132 2 125 0 133 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 2 145 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 1 81 0 230 1 177 0 231 2 125 0 233 2 125 0 235 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 2 161 1 18 2 165 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 30 0 1 0 30 0 3 0 30 0 5 0 30 0 6 0 30 0 34 0 30 0 35 0 30 0 36 0 30 0 37 0 30 0 38 0 30 0 46 0 30 0 53 0 30 0 58 0 30 0 63 0 30 0 67 0 30 0 74 0 30 0 75 0 30 0 80 0 30 0 83 0 30 0 85 0 30 0 87 0 30 0 89 0 30 0 92 0 30 0 93 2 169 0 94 0 30 0 97 0 30 0 100 0 30 0 101 0 30 0 102 0 30 0 104 0 30 0 105 0 30 0 108 2 173 0 123 2 177 0 124 2 181 0 125] 
#[0 0 34 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 2 197 0 150 2 197 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 2 201 0 150 2 201 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 2 205 0 150 2 205 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 2 209 0 150 2 209 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 2 213 0 150 2 213 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 2 217 0 150 2 217 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 38 0 7 0 38 0 97 2 221 0 203] 
#[1 0 42 0 3 0 42 0 62 2 9 0 97 2 225 0 113 2 225 0 114] 
#[0 0 46 0 3 0 5 0 97] 
#[1 0 38 0 7 0 38 0 97 2 233 0 203] 
#[0 2 237 0 7] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 2 241 0 150 2 241 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 245 0 168 2 245 0 171 2 245 0 172 2 245 0 173 2 245 0 181 2 245 0 195 2 245 0 196 2 245 0 197 2 245 0 198 2 245 0 201 2 245 0 202 2 245 0 204 2 245 0 205 2 245 0 206 2 245 0 212 2 245 0 214 2 245 0 215 2 245 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 249 0 3 2 253 0 25 3 1 0 53 1 109 0 54 3 5 0 57 3 9 0 67 1 109 0 73 0 161 0 88 3 13 0 169 3 13 0 170 3 13 0 177 1 109 0 178 3 25 0 181 3 13 0 220 3 13 0 236 3 13 0 241 3 41 1 13] 
#[0 0 50 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 3 45 0 1] 
#[1 0 42 0 1 3 49 0 25 2 9 0 97 3 53 0 113 3 53 0 114] 
#[0 3 57 0 1] 
#[1 3 61 0 3 3 65 0 25 2 9 0 97 3 89 0 100 3 77 0 114 3 73 1 3 3 77 1 4 3 81 1 5 3 85 1 6 3 89 1 10 3 77 1 11 3 89 1 18] 
#[0 0 54 0 3 0 5 0 97] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 3 101 0 21 0 69 0 53 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 3 105 0 80 0 141 0 83 1 225 0 85 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 3 109 0 114 3 109 0 116 3 109 0 117 3 109 0 121 3 109 0 122 3 109 0 127 3 109 0 136 0 241 0 137 3 109 0 140 3 109 0 141 3 109 0 142 3 109 0 143 3 113 0 144 3 109 0 221 3 109 0 237 3 109 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 3 109 1 20 3 109 1 21 3 109 1 22 1 249 1 23 3 109 1 25 2 1 1 43] 
#[0 0 58 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 38 0 1 0 38 0 3 0 38 0 5 0 38 0 7 0 38 0 34 0 38 0 35 0 38 0 36 0 38 0 37 0 38 0 38 0 38 0 46 0 38 0 53 0 38 0 58 0 38 0 63 0 38 0 67 0 38 0 74 0 38 0 75 0 38 0 80 0 38 0 83 0 38 0 85 0 38 0 87 0 38 0 89 0 38 0 92 0 38 0 97 0 38 0 100 0 38 0 101 0 38 0 102 0 38 0 104 0 38 0 105 0 38 0 108 3 117 0 203] 
#[1 3 121 0 1 3 125 0 5 3 129 0 21 3 133 0 147] 
#[0 3 137 0 1] 
#[0 0 62 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 3 141 0 163 3 141 0 164 3 141 0 167 0 245 0 221 3 141 0 230 1 177 0 231 0 245 0 237 3 141 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 0 66 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 3 145 0 3 3 149 0 173] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 3 153 0 150 3 153 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 3 165 0 114 3 169 0 182 3 173 0 183 3 177 0 184 3 177 0 185 3 177 0 186] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 3 181 0 150 3 181 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 3 185 0 1] 
#[0 3 189 0 1] 
#[1 0 70 0 1 0 70 0 3 0 70 0 5 3 197 0 25 0 70 0 34 0 70 0 35 0 70 0 36 0 70 0 37 0 70 0 38 0 70 0 46 0 70 0 53 0 70 0 58 0 70 0 63 0 70 0 67 0 70 0 74 0 70 0 75 0 70 0 80 0 70 0 83 0 70 0 85 0 70 0 87 0 70 0 89 0 70 0 92 0 70 0 97 0 70 0 100 0 70 0 101 0 70 0 102 0 70 0 104 0 70 0 105 0 70 0 108 3 197 0 240] 
#[1 0 74 0 1 0 74 0 4 0 74 0 5 0 74 0 7 0 74 0 8 0 74 0 9 0 74 0 10 0 74 0 11 0 74 0 12 0 74 0 13 0 74 0 14 0 74 0 15 0 74 0 16 0 74 0 17 0 74 0 18 0 74 0 19 0 74 0 20 0 74 0 21 0 74 0 22 0 74 0 23 0 74 0 24 0 74 0 25 0 74 0 26 0 74 0 27 0 74 0 28 0 74 0 29 0 74 0 30 0 74 0 31 0 74 0 32 0 74 0 33 0 74 0 34 0 74 0 35 0 74 0 36 0 74 0 37 0 74 0 39 0 74 0 40 0 74 0 41 0 74 0 42 0 74 0 43 0 74 0 44 0 74 0 45 0 74 0 47 0 74 0 48 0 74 0 71 0 74 0 72 0 74 0 94 3 201 0 95 0 74 0 104 0 74 0 105] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 0 109 1 49] 
#[0 0 82 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 90 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 94 0 13 3 205 1 44] 
#[0 0 0 1 49] 
#[1 0 98 0 1 0 98 0 2 0 98 0 4 0 98 0 5 0 98 0 6 0 98 0 7 0 98 0 8 0 98 0 9 0 98 0 10 0 98 0 11 0 98 0 12 0 98 0 13 0 98 0 14 0 98 0 15 0 98 0 16 0 98 0 17 0 102 0 18 0 98 0 19 0 98 0 20 0 98 0 21 0 98 0 22 0 98 0 23 0 98 0 24 0 98 0 25 0 98 0 26 0 98 0 27 0 98 0 28 0 98 0 29 0 98 0 30 0 98 0 31 0 98 0 32 0 98 0 33 0 98 0 34 0 98 0 35 0 98 0 36 0 98 0 37 0 98 0 39 0 98 0 40 0 98 0 41 0 98 0 42 0 98 0 43 0 98 0 44 0 98 0 45 0 98 0 47 0 98 0 48 0 98 0 71 0 98 0 72 0 98 0 76 0 98 0 94 0 98 0 95 0 98 0 104 0 98 0 105 0 98 0 106 0 98 0 107 0 98 1 49] 
#[0 0 106 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 110 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 114 0 18] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 122 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 130 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 3 209 0 105] 
#[1 3 121 0 1 0 134 0 2 0 134 0 3 0 134 0 4 3 213 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 13 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 17 0 134 0 19 0 134 0 20 3 217 0 21 0 134 0 22 0 134 0 23 0 134 0 24 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 0 134 0 43 0 134 0 44 0 134 0 45 0 134 0 47 0 134 0 48 0 134 0 71 0 134 0 72 0 134 0 76 0 134 0 94 0 134 0 95 0 197 0 104 0 6 0 105 0 134 0 106 0 134 0 107 3 221 0 136 0 241 0 137 3 225 0 147 0 134 1 49] 
#[0 0 138 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 146 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 0 150 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 3 121 0 1 0 154 0 2 0 154 0 3 0 154 0 4 3 229 0 5 0 154 0 6 0 154 0 7 0 154 0 8 0 154 0 9 0 154 0 10 0 154 0 11 0 154 0 12 0 154 0 13 0 154 0 14 0 154 0 15 0 154 0 16 0 154 0 17 0 154 0 19 0 154 0 20 3 233 0 21 0 154 0 22 0 154 0 23 0 154 0 24 0 154 0 25 0 154 0 26 0 154 0 27 0 154 0 28 0 154 0 29 0 154 0 30 0 154 0 31 0 154 0 32 0 154 0 33 0 154 0 34 0 154 0 35 0 154 0 36 0 154 0 37 0 154 0 39 0 154 0 40 0 154 0 41 0 154 0 42 0 154 0 43 0 154 0 44 0 154 0 45 0 154 0 47 0 154 0 48 0 154 0 71 0 154 0 72 0 154 0 76 0 154 0 94 0 154 0 95 0 197 0 104 0 6 0 105 0 154 0 106 0 154 0 107 3 237 0 136 0 241 0 137 3 241 0 147 0 154 1 49] 
#[0 0 158 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 162 0 2 0 162 0 4 0 162 0 6 0 162 0 7 0 162 0 8 4 45 0 9 0 162 0 10 0 162 0 11 4 45 0 12 0 162 0 13 0 162 0 14 4 45 0 15 4 45 0 16 0 162 0 17 0 162 0 19 0 162 0 20 4 45 0 22 0 162 0 23 0 162 0 24 0 162 0 25 0 162 0 26 4 45 0 27 4 45 0 28 4 45 0 29 4 45 0 30 4 45 0 31 4 45 0 32 4 45 0 33 0 162 0 34 4 37 0 35 0 162 0 36 4 41 0 37 0 162 0 39 0 162 0 40 0 162 0 41 0 162 0 42 0 162 0 43 0 162 0 44 0 162 0 45 0 162 0 47 0 162 0 48 0 162 0 71 0 162 0 72 0 162 0 76 0 162 0 94 0 162 0 95 0 162 0 106 0 162 0 107 4 45 0 165 0 162 1 49] 
#[0 0 166 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 0 170 0 2 0 170 0 4 0 170 0 6 0 170 0 7 0 170 0 8 0 170 0 10 0 170 0 11 0 170 0 13 0 170 0 14 0 170 0 17 0 170 0 19 0 170 0 20 0 170 0 23 0 170 0 24 0 170 0 25 4 49 0 26 0 170 0 34 0 170 0 36 0 170 0 39 0 170 0 40 0 170 0 41 0 170 0 42 0 170 0 43 0 170 0 44 0 170 0 45 0 170 0 47 0 170 0 48 0 170 0 71 0 170 0 72 0 170 0 76 0 170 0 94 0 170 0 95 0 170 0 106 0 170 0 107 0 170 1 49] 
#[0 0 174 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 0 178 0 2 0 178 0 4 0 178 0 6 0 178 0 7 4 53 0 8 0 178 0 10 0 178 0 11 0 178 0 13 0 178 0 14 0 178 0 17 0 178 0 19 0 178 0 20 0 178 0 23 0 178 0 24 4 57 0 25 0 178 0 34 0 178 0 36 0 178 0 39 0 178 0 40 0 178 0 41 4 61 0 42 0 178 0 43 0 178 0 44 0 178 0 45 0 178 0 47 0 178 0 48 0 178 0 71 0 178 0 72 0 178 0 76 0 178 0 94 0 178 0 95 0 178 0 106 0 178 0 107 0 178 1 49] 
#[1 0 182 0 2 0 182 0 4 0 182 0 6 0 182 0 7 0 182 0 10 0 182 0 11 0 182 0 13 0 182 0 14 0 182 0 17 0 182 0 19 0 182 0 20 0 182 0 23 0 182 0 24 4 65 0 34 4 69 0 36 0 182 0 39 0 182 0 40 0 182 0 41 0 182 0 43 0 182 0 44 0 182 0 45 0 182 0 47 0 182 0 48 0 182 0 71 0 182 0 72 0 182 0 76 0 182 0 94 0 182 0 95 0 182 0 106 0 182 0 107 0 182 1 49] 
#[1 0 186 0 2 0 186 0 4 0 186 0 6 0 186 0 7 0 186 0 10 4 73 0 11 0 186 0 13 4 77 0 14 4 81 0 17 0 186 0 19 0 186 0 20 0 186 0 23 0 186 0 24 0 186 0 39 0 186 0 40 0 186 0 41 0 186 0 43 0 186 0 44 0 186 0 45 0 186 0 47 0 186 0 48 0 186 0 71 0 186 0 72 0 186 0 76 0 186 0 94 0 186 0 95 0 186 0 106 0 186 0 107 0 186 1 49] 
#[1 0 190 0 2 0 190 0 4 0 190 0 6 0 190 0 7 4 85 0 10 4 89 0 13 4 93 0 19 4 97 0 20 0 190 0 23 0 190 0 24 0 190 0 39 0 190 0 40 0 190 0 41 0 190 0 43 0 190 0 44 0 190 0 45 0 190 0 47 0 190 0 48 4 101 0 71 4 105 0 72 0 190 0 76 0 190 0 94 0 190 0 95 0 190 0 106 0 190 0 107 0 190 1 49] 
#[1 0 194 0 2 0 194 0 4 0 194 0 6 0 194 0 7 4 109 0 23 4 113 0 24 0 194 0 39 0 194 0 40 0 194 0 41 0 194 0 43 0 194 0 44 0 194 0 45 4 117 0 47 4 121 0 48 0 194 0 76 0 194 0 94 0 194 0 95 0 194 0 106 0 194 0 107 0 194 1 49] 
#[1 0 198 0 2 0 198 0 4 0 198 0 6 0 198 0 7 4 125 0 39 0 198 0 40 0 198 0 41 0 198 0 43 0 198 0 44 0 198 0 45 0 198 0 76 0 198 0 94 0 198 0 95 0 198 0 106 0 198 0 107 0 198 1 49] 
#[1 0 202 0 2 0 202 0 4 0 202 0 6 0 202 0 7 0 202 0 40 0 202 0 41 0 202 0 43 0 202 0 44 4 129 0 45 0 202 0 76 0 202 0 94 0 202 0 95 0 202 0 106 0 202 0 107 0 202 1 49] 
#[1 0 206 0 2 0 206 0 4 0 206 0 6 0 206 0 7 0 206 0 40 0 206 0 41 4 133 0 43 0 206 0 44 0 206 0 76 0 206 0 94 0 206 0 95 0 206 0 106 0 206 0 107 0 206 1 49] 
#[1 0 210 0 2 0 210 0 4 0 210 0 6 0 210 0 7 4 137 0 40 0 210 0 41 0 210 0 44 0 210 0 76 0 210 0 94 0 210 0 95 0 210 0 106 0 210 0 107 0 210 1 49] 
#[1 0 214 0 2 0 214 0 4 0 214 0 6 0 214 0 7 4 141 0 41 4 145 0 44 0 214 0 76 0 214 0 94 0 214 0 95 0 214 0 106 0 214 0 107 0 214 1 49] 
#[0 0 218 0 2 0 4 0 6 0 7 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 0 222 0 2 0 6 0 7 0 94 0 95 0 106 0 107 1 49] 
#[1 4 149 0 7 4 153 0 94] 
#[0 0 226 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 0 230 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 0 234 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 0 238 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 0 242 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 0 246 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 4 157 0 114 4 161 0 179 4 165 0 180 4 169 0 184 4 169 0 185 4 169 0 186] 
#[0 0 250 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 0 254 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 2 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 6 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 10 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 14 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 18 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 22 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 26 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 30 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 34 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 38 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 42 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 46 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 50 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 1 54 0 2 0 4 0 6 0 7 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 4 173 0 18] 
#[0 1 58 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 1 62 0 2 0 4 0 6 0 7 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 1 66 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 1 70 1 49] 
#[0 1 74 1 49] 
#[0 1 78 1 49] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 0 93 0 61 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 113 0 70 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 4 177 0 168 4 177 0 171 4 177 0 172 4 177 0 173 4 177 0 176 4 177 0 177 1 109 0 178 4 177 0 181 4 177 0 195 4 177 0 196 4 177 0 197 4 177 0 198 4 177 0 201 4 177 0 202 4 177 0 204 4 177 0 205 4 177 0 206 4 177 0 212 4 177 0 214 4 177 0 215 4 177 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 4 177 1 1 4 177 1 2 4 177 1 12 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43 1 82 1 49] 
#[0 1 86 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 90 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 94 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 1 98 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 1 102 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 1 106 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 1 110 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 1 114 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 1 118 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 1 122 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 0 108 0 109 0 110 1 49] 
#[1 1 126 0 3 1 126 0 108 1 126 0 110 4 181 1 45] 
#[0 1 130 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 4 185 0 108] 
#[1 2 89 0 4 4 189 0 5 2 97 0 25 2 101 0 68 2 105 0 78 2 9 0 97 2 109 0 98 4 197 0 100 4 201 0 101 4 193 0 114 2 129 0 115 2 121 0 128 2 125 0 129 2 129 0 130 2 129 0 131 2 129 0 132 2 125 0 133 2 125 0 233 2 125 0 235 4 197 1 18 4 201 1 19] 
#[0 0 74 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 62 0 66 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 4 153 0 94 0 0 1 49] 
#[0 0 0 1 49] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 4 205 0 168 4 205 0 171 4 205 0 172 4 205 0 173 4 205 0 176 4 205 0 177 1 109 0 178 4 205 0 181 4 205 0 195 4 205 0 196 4 205 0 197 4 205 0 198 4 205 0 201 4 205 0 202 4 205 0 204 4 205 0 205 4 205 0 206 4 205 0 212 4 205 0 214 4 205 0 215 4 205 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43 1 134 1 49] 
#[0 1 138 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 63 0 65 0 67 0 69 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 0 0 1 49] 
#[0 1 142 1 49] 
#[0 1 146 1 49] 
#[0 0 0 1 49] 
#[1 4 209 0 4 4 189 0 5 2 97 0 25 2 101 0 68 2 105 0 78 2 9 0 97 2 109 0 98 4 197 0 100 4 201 0 101 4 213 0 114 4 217 0 115 2 121 0 128 2 125 0 129 4 217 0 130 4 217 0 131 4 217 0 132 2 125 0 133 4 221 0 187 4 225 0 190 4 225 0 192 2 125 0 233 2 125 0 235 4 197 1 18 4 201 1 19] 
#[1 0 30 0 1 0 30 0 3 0 30 0 5 0 30 0 6 0 30 0 34 0 30 0 35 0 30 0 36 0 30 0 37 0 30 0 38 0 30 0 46 0 30 0 53 0 30 0 58 0 30 0 63 0 30 0 67 0 30 0 74 0 30 0 75 0 30 0 80 0 30 0 83 0 30 0 85 0 30 0 87 0 30 0 89 0 30 0 92 0 30 0 93 2 169 0 94 0 30 0 97 0 30 0 100 0 30 0 101 0 30 0 102 0 30 0 104 0 30 0 105 0 30 0 108 2 173 0 123 4 233 0 124 2 181 0 125 4 237 0 188 4 241 0 189] 
#[1 0 98 0 1 0 15 0 2 0 15 0 4 0 98 0 5 0 15 0 6 0 98 0 8 0 98 0 9 0 98 0 10 0 98 0 11 0 98 0 12 0 98 0 13 0 98 0 14 0 98 0 15 0 98 0 16 0 98 0 17 0 102 0 18 0 98 0 19 0 98 0 20 0 98 0 21 0 19 0 22 0 98 0 23 0 98 0 24 0 98 0 25 0 98 0 26 0 98 0 27 0 98 0 28 0 98 0 29 0 98 0 30 0 98 0 31 0 98 0 32 0 98 0 33 0 98 0 34 0 98 0 35 0 98 0 36 0 98 0 37 0 98 0 39 0 98 0 40 0 98 0 41 0 98 0 42 0 98 0 43 0 98 0 44 0 98 0 45 0 98 0 47 0 98 0 48 0 98 0 71 0 98 0 72 0 15 0 94 0 98 0 104 0 98 0 105 4 249 0 134 4 253 0 135] 
#[1 5 1 0 2 5 5 0 94] 
#[1 1 154 0 2 0 23 0 94] 
#[1 5 13 0 2 4 153 0 94] 
#[1 1 150 0 2 1 150 0 4 1 150 0 6 4 245 0 22 1 150 0 94 5 17 0 134 4 253 0 135] 
#[0 1 158 0 2 0 4 0 6 0 22 0 71 0 76 0 94] 
#[0 1 162 0 2 0 4 0 6 0 22 0 71 0 76 0 94] 
#[0 1 166 0 2 0 94] 
#[0 1 170 0 2 0 4 0 6 0 94] 
#[0 1 174 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 27 0 1 0 31 0 3 0 35 0 5 0 30 0 6 0 39 0 34 0 43 0 35 0 47 0 36 0 51 0 37 0 55 0 38 0 59 0 46 0 63 0 53 0 67 0 58 0 71 0 63 0 75 0 67 0 79 0 74 0 83 0 75 0 87 0 80 0 91 0 83 0 95 0 85 0 99 0 87 0 103 0 89 0 107 0 92 0 30 0 93 2 169 0 94 0 111 0 97 0 115 0 100 0 119 0 101 0 123 0 102 0 127 0 104 0 131 0 105 0 135 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 2 173 0 123 2 177 0 124 2 181 0 125 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 21 0 163 5 21 0 164 0 245 0 221 5 21 0 230 1 177 0 231 0 245 0 237 5 21 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 4 189 0 5 2 109 0 98 4 197 0 100 4 201 0 101 5 25 0 115 5 25 0 130 5 25 0 131 5 25 0 132 4 197 1 18 4 201 1 19] 
#[1 4 189 0 5 2 109 0 98 4 197 0 100 4 201 0 101 5 29 0 115 5 29 0 130 5 29 0 131 5 29 0 132 4 197 1 18 4 201 1 19] 
#[1 4 189 0 5 2 109 0 98 4 197 0 100 4 201 0 101 5 33 0 115 5 33 0 130 5 33 0 131 5 33 0 132 4 197 1 18 4 201 1 19] 
#[0 1 178 0 1 0 95] 
#[1 0 98 0 1 1 182 0 4 0 98 0 5 0 98 0 7 0 98 0 8 0 98 0 9 0 98 0 10 0 98 0 11 0 98 0 12 0 98 0 13 0 98 0 14 0 98 0 15 0 98 0 16 0 98 0 17 0 102 0 18 0 98 0 19 0 98 0 20 0 98 0 21 0 19 0 22 0 98 0 23 0 98 0 24 0 98 0 25 0 98 0 26 0 98 0 27 0 98 0 28 0 98 0 29 0 98 0 30 0 98 0 31 0 98 0 32 0 98 0 33 0 98 0 34 0 98 0 35 0 98 0 36 0 98 0 37 0 98 0 39 0 98 0 40 0 98 0 41 0 98 0 42 0 98 0 43 0 98 0 44 0 98 0 45 0 98 0 47 0 98 0 48 0 98 0 71 0 98 0 72 0 139 0 94 0 98 0 104 0 98 0 105 5 37 0 135] 
#[0 1 186 0 1 0 95] 
#[1 5 41 0 4 5 45 0 94] 
#[0 1 190 0 4 0 94] 
#[1 5 49 0 1 5 53 0 95] 
#[0 1 194 0 1 0 95] 
#[0 1 198 0 1 0 95] 
#[0 1 202 0 4 0 94] 
#[0 5 57 0 4] 
#[1 0 25 0 1 0 29 0 3 1 206 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 1 206 0 51 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 1 206 0 57 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 4 205 0 168 4 205 0 171 4 205 0 172 4 205 0 173 4 205 0 176 4 205 0 177 1 109 0 178 4 205 0 181 4 205 0 195 4 205 0 196 4 205 0 197 4 205 0 198 4 205 0 201 4 205 0 202 4 205 0 204 4 205 0 205 4 205 0 206 4 205 0 212 4 205 0 214 4 205 0 215 4 205 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 1 210 0 4 0 94] 
#[0 1 214 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 94 0 98 0 100 0 101] 
#[1 0 143 0 1 1 106 0 5 1 106 0 7 1 106 0 8 1 106 0 9 1 106 0 10 1 106 0 11 1 106 0 12 1 106 0 13 1 106 0 14 1 106 0 15 1 106 0 16 1 106 0 17 1 106 0 19 1 106 0 20 1 106 0 21 1 106 0 22 1 106 0 23 1 106 0 24 1 106 0 25 1 106 0 26 1 106 0 27 1 106 0 28 1 106 0 29 1 106 0 30 1 106 0 31 1 106 0 32 1 106 0 33 1 106 0 34 1 106 0 35 1 106 0 36 1 106 0 37 1 106 0 39 1 106 0 40 1 106 0 41 1 106 0 42 1 106 0 43 1 106 0 44 1 106 0 45 1 106 0 47 1 106 0 48 1 106 0 71 1 106 0 72 1 106 0 94 1 218 0 95 1 106 0 104 1 106 0 105] 
#[1 0 147 0 1 1 110 0 5 1 110 0 7 1 110 0 8 1 110 0 9 1 110 0 10 1 110 0 11 1 110 0 12 1 110 0 13 1 110 0 14 1 110 0 15 1 110 0 16 1 110 0 17 1 110 0 19 1 110 0 20 1 110 0 21 1 110 0 22 1 110 0 23 1 110 0 24 1 110 0 25 1 110 0 26 1 110 0 27 1 110 0 28 1 110 0 29 1 110 0 30 1 110 0 31 1 110 0 32 1 110 0 33 1 110 0 34 1 110 0 35 1 110 0 36 1 110 0 37 1 110 0 39 1 110 0 40 1 110 0 41 1 110 0 42 1 110 0 43 1 110 0 44 1 110 0 45 1 110 0 47 1 110 0 48 1 110 0 71 1 110 0 72 1 110 0 94 1 222 0 95 1 110 0 104 1 110 0 105] 
#[0 1 226 0 1 0 3 0 5 0 6 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 93 0 94 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[1 5 61 0 6 5 65 0 94 5 69 0 125] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 5 73 0 6 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 5 77 0 93 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 5 81 0 126 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 85 0 163 5 85 0 164 0 245 0 221 5 85 0 230 1 177 0 231 0 245 0 237 5 85 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 1 230 0 1 1 230 0 3 1 230 0 5 1 230 0 6 1 230 0 34 1 230 0 35 1 230 0 36 1 230 0 37 1 230 0 38 1 230 0 46 1 230 0 53 1 230 0 58 1 230 0 63 1 230 0 67 1 230 0 74 1 230 0 75 1 230 0 80 1 230 0 83 1 230 0 85 1 230 0 87 1 230 0 89 1 230 0 92 1 230 0 93 5 89 0 94 1 230 0 97 1 230 0 100 1 230 0 101 1 230 0 102 1 230 0 104 1 230 0 105 1 230 0 108] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 2 65 0 163 2 65 0 164 2 65 0 167 0 245 0 221 2 65 0 230 1 177 0 231 0 245 0 237 2 65 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 0 98 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 162 0 2 0 162 0 4 0 162 0 6 0 162 0 7 0 162 0 8 0 162 0 10 0 162 0 11 0 162 0 13 0 162 0 14 0 162 0 17 0 162 0 19 0 162 0 20 0 162 0 23 0 162 0 24 0 162 0 25 0 162 0 26 0 162 0 34 4 37 0 35 0 162 0 36 4 41 0 37 0 162 0 39 0 162 0 40 0 162 0 41 0 162 0 42 0 162 0 43 0 162 0 44 0 162 0 45 0 162 0 47 0 162 0 48 0 162 0 71 0 162 0 72 0 162 0 76 0 162 0 94 0 162 0 95 0 162 0 106 0 162 0 107 0 162 1 49] 
#[0 1 234 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 1 238 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 1 242 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 1 246 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 1 250 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 1 254 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 0 42 0 7 2 9 0 97 5 93 0 113 5 93 0 114] 
#[1 2 2 0 3 5 97 0 62 5 101 0 243 5 105 0 244 5 109 0 245] 
#[0 2 6 0 1 0 3 0 7 0 62] 
#[1 0 42 0 7 2 9 0 97 5 113 0 113 5 113 0 114] 
#[0 2 10 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 2 14 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 5 117 0 90] 
#[1 5 121 0 4 5 125 0 98 5 129 1 14 5 133 1 15] 
#[1 5 137 0 66 5 141 1 7] 
#[1 0 42 0 3 0 42 0 62 2 9 0 97 5 145 0 113 5 145 0 114] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 149 0 163 5 149 0 164 0 245 0 221 5 149 0 230 1 177 0 231 0 245 0 237 5 149 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 42 0 1 5 153 0 25 2 9 0 97 5 157 0 113 5 157 0 114] 
#[0 2 18 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 2 22 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 2 26 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 2 30 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 2 34 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 2 38 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 2 42 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 5 161 0 7 5 137 0 66 5 165 1 7] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 2 46 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 5 189 0 54 0 85 0 58 1 225 0 63 0 105 0 67 5 189 0 73 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 5 169 0 88 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 5 173 0 144 1 9 0 145 1 9 0 146 5 173 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 181 0 163 5 181 0 164 5 177 0 166 5 181 0 167 5 185 0 177 5 189 0 178 5 193 0 199 0 245 0 221 5 181 0 230 1 177 0 231 0 245 0 237 5 181 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 42 0 1 2 9 0 97 5 197 0 113 5 197 0 114] 
#[0 5 201 0 1] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 205 0 163 5 205 0 164 5 205 0 167 0 245 0 221 5 205 0 230 1 177 0 231 0 245 0 237 5 205 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 5 209 0 4 2 9 0 97 5 213 0 98 5 225 0 114 5 217 1 8 5 221 1 9 5 225 1 11] 
#[0 5 229 0 49] 
#[0 2 50 0 4 0 66 0 94] 
#[1 5 137 0 66 5 233 1 7] 
#[1 2 54 0 66 5 237 0 94] 
#[0 2 58 0 66] 
#[0 2 62 0 66] 
#[0 5 241 0 7] 
#[0 2 66 0 66 0 94] 
#[0 2 70 0 7] 
#[0 5 245 0 82] 
#[1 3 125 0 5 3 129 0 21] 
#[1 3 121 0 1 0 134 0 2 0 134 0 3 0 134 0 4 3 213 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 13 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 17 0 134 0 19 0 134 0 20 3 217 0 21 0 134 0 22 0 134 0 23 0 134 0 24 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 0 134 0 43 0 134 0 44 0 134 0 45 0 134 0 47 0 134 0 48 0 134 0 71 0 134 0 72 0 134 0 76 0 134 0 94 0 134 0 95 0 197 0 104 0 6 0 105 0 134 0 106 0 134 0 107 3 221 0 136 0 241 0 137 5 249 0 147 0 134 1 49] 
#[0 2 74 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 2 46 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 181 0 163 5 181 0 164 5 253 0 166 5 181 0 167 0 245 0 221 5 181 0 230 1 177 0 231 0 245 0 237 5 181 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 6 1 0 2 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 6 5 0 93 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 6 9 0 148 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 13 0 163 6 13 0 164 0 245 0 221 6 13 0 230 1 177 0 231 0 245 0 237 6 13 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 17 0 163 6 17 0 164 6 17 0 167 0 245 0 221 6 17 0 230 1 177 0 231 0 245 0 237 6 17 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 6 21 0 98] 
#[0 2 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 25 0 163 6 25 0 164 6 25 0 167 0 245 0 221 6 25 0 230 1 177 0 231 0 245 0 237 6 25 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 6 29 0 7 4 153 0 94] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 2 145 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 6 33 0 52 6 37 0 64 6 41 0 216 6 45 0 217] 
#[0 2 82 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 6 49 0 4 4 189 0 5 2 9 0 97 2 109 0 98 4 197 0 100 4 201 0 101 6 53 0 114 6 57 0 115 6 57 0 130 6 57 0 131 6 57 0 132 4 221 0 187 4 225 0 190 4 225 0 192 4 197 1 18 4 201 1 19] 
#[1 0 30 0 3 0 30 0 5 0 30 0 6 0 30 0 93 2 169 0 94 0 30 0 97 6 61 0 124 2 181 0 125 4 237 0 188 4 241 0 189] 
#[1 1 150 0 7 4 245 0 22 1 150 0 94 6 65 0 134 4 253 0 135] 
#[1 6 69 0 7 6 73 0 94] 
#[0 2 86 0 7 0 94] 
#[1 4 245 0 22 6 77 0 135] 
#[0 2 90 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 81 0 163 6 81 0 164 6 81 0 167 0 245 0 221 6 81 0 230 1 177 0 231 0 245 0 237 6 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 85 0 163 6 85 0 164 6 85 0 167 0 245 0 221 6 85 0 230 1 177 0 231 0 245 0 237 6 85 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 2 94 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 89 0 163 6 89 0 164 0 245 0 221 6 89 0 230 1 177 0 231 0 245 0 237 6 89 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 6 97 0 168 6 97 0 171 6 97 0 172 6 97 0 173 6 97 0 181 6 97 0 195 6 97 0 196 6 97 0 197 6 97 0 198 6 97 0 201 6 97 0 202 6 97 0 204 6 97 0 205 6 97 0 206 6 97 0 212 6 97 0 213 6 97 0 214 6 97 0 215 6 97 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 6 101 0 13] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 105 0 163 6 105 0 164 6 105 0 167 0 245 0 221 6 105 0 230 1 177 0 231 0 245 0 237 6 105 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 109 0 163 6 109 0 164 6 109 0 167 0 245 0 221 6 109 0 230 1 177 0 231 0 245 0 237 6 109 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 6 113 0 98] 
#[0 2 98 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 2 102 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 117 0 163 6 117 0 164 6 117 0 167 0 245 0 221 6 117 0 230 1 177 0 231 0 245 0 237 6 117 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 6 121 0 98] 
#[0 2 106 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 2 110 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 2 114 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 118 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 122 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 126 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 130 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 134 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 138 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 142 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 146 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 150 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 154 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 158 0 1 0 3 0 5 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 2 162 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 2 166 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 26 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 125 0 163 6 125 0 164 0 245 0 221 6 125 0 230 1 177 0 231 0 245 0 237 6 125 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 6 129 0 152 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 6 133 0 150 6 133 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 6 137 0 150 6 137 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 6 141 0 150 6 141 0 151 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 6 145 0 152 6 145 0 153 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 6 149 0 152 6 149 0 153 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 6 153 0 154 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 6 157 0 154 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 6 161 0 154 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 6 165 0 155 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 6 169 0 155 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 6 173 0 155 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 6 177 0 155 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 6 181 0 155 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 6 185 0 155 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 6 189 0 156 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 6 193 0 156 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 6 197 0 156 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 6 201 0 156 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 6 205 0 157 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 6 209 0 158 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 6 213 0 159 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 6 217 0 160 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 221 0 163 6 221 0 164 0 245 0 221 6 221 0 230 1 177 0 231 0 245 0 237 6 221 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 2 193 0 144 1 9 0 145 1 9 0 146 2 193 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 6 225 0 161 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 2 170 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 229 0 163 6 229 0 164 0 245 0 221 6 229 0 230 1 177 0 231 0 245 0 237 6 229 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 1 150 0 7 4 245 0 22 1 150 0 94 6 233 0 134 4 253 0 135] 
#[1 6 237 0 7 6 241 0 94] 
#[0 2 174 0 7 0 94] 
#[1 4 245 0 22 6 245 0 135] 
#[1 0 25 0 1 6 249 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 6 253 0 163 6 253 0 164 0 245 0 221 6 253 0 230 1 177 0 231 7 1 0 232 0 245 0 237 6 253 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 2 178 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 2 182 0 3 2 182 0 108 2 182 0 110 7 5 1 39 7 9 1 40] 
#[1 7 13 0 109 7 17 1 26 7 17 1 27 7 17 1 28 7 29 1 29 7 33 1 30] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 21 0 163 5 21 0 164 0 245 0 221 5 21 0 230 1 177 0 231 0 245 0 237 5 21 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 1 182 0 4 4 245 0 22 1 182 0 94 5 37 0 135] 
#[0 1 218 0 1 0 95] 
#[0 1 222 0 1 0 95] 
#[0 2 186 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 63 0 65 0 67 0 69 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 1 174 0 1 0 151 0 2 0 151 0 4 1 174 0 5 0 151 0 6 1 174 0 8 1 174 0 9 1 174 0 10 1 174 0 11 1 174 0 12 1 174 0 13 1 174 0 14 1 174 0 15 1 174 0 16 1 174 0 17 1 174 0 19 1 174 0 20 1 174 0 21 0 151 0 22 1 174 0 23 1 174 0 24 1 174 0 25 1 174 0 26 1 174 0 27 1 174 0 28 1 174 0 29 1 174 0 30 1 174 0 31 1 174 0 32 1 174 0 33 1 174 0 34 1 174 0 35 1 174 0 36 1 174 0 37 1 174 0 39 1 174 0 40 1 174 0 41 1 174 0 42 1 174 0 43 1 174 0 44 1 174 0 45 1 174 0 47 1 174 0 48 1 174 0 71 1 174 0 72 0 151 0 94 1 174 0 104 1 174 0 105] 
#[1 0 155 0 4 4 245 0 22 0 155 0 94 4 249 0 134 7 37 0 135] 
#[1 5 49 0 1 7 41 0 95] 
#[1 7 45 0 4 7 49 0 94] 
#[0 2 194 0 4 0 94] 
#[0 2 198 0 4 0 94] 
#[1 0 25 0 1 2 45 0 3 2 49 0 5 0 159 0 6 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 7 53 0 93 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 2 53 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 5 81 0 126 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 85 0 163 5 85 0 164 2 69 0 184 2 69 0 185 2 69 0 186 7 57 0 191 7 57 0 192 7 61 0 193 7 61 0 194 0 245 0 221 5 85 0 230 1 177 0 231 0 245 0 237 5 85 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 7 69 0 6 7 73 0 94] 
#[0 2 206 0 6 0 94] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 7 77 0 163 7 77 0 164 0 245 0 221 7 77 0 230 1 177 0 231 0 245 0 237 7 77 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 2 210 0 2 0 4 0 6 0 94] 
#[0 2 214 0 2 0 4 0 6 0 7 0 76 0 94] 
#[0 2 218 0 18] 
#[0 7 81 0 93] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 7 85 0 191 7 85 0 192] 
#[0 2 222 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 2 226 0 2 0 4 0 6 0 94] 
#[0 7 89 0 6] 
#[0 7 93 0 1] 
#[0 7 97 0 1] 
#[0 7 101 0 1] 
#[0 2 230 0 4 0 94] 
#[0 2 234 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 7 105 0 4 4 189 0 5 2 97 0 25 2 101 0 68 2 105 0 78 2 9 0 97 2 109 0 98 4 197 0 100 4 201 0 101 4 193 0 114 2 129 0 115 7 109 0 129 2 129 0 130 2 129 0 131 2 129 0 132 7 109 0 133 7 109 0 233 7 109 0 235 4 197 1 18 4 201 1 19] 
#[1 2 238 0 2 3 157 0 3 3 161 0 5 7 113 0 93 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 7 145 0 191 7 145 0 192 7 141 0 194 7 125 0 222 7 129 0 223 7 133 0 224 7 137 0 225 7 141 0 226 7 145 0 227] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 7 149 0 163 7 149 0 164 0 245 0 221 7 149 0 230 1 177 0 231 0 245 0 237 7 149 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 2 242 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 64 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 2 246 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 30 0 1 0 30 0 3 0 30 0 5 1 226 0 6 0 30 0 34 0 30 0 35 0 30 0 36 0 30 0 37 0 30 0 38 0 30 0 46 0 30 0 53 0 30 0 58 0 30 0 63 0 30 0 67 0 30 0 74 0 30 0 75 0 30 0 80 0 30 0 83 0 30 0 85 0 30 0 87 0 30 0 89 0 30 0 92 0 30 0 93 0 163 0 94 0 30 0 97 0 30 0 100 0 30 0 101 0 30 0 102 0 30 0 104 0 30 0 105 0 30 0 108 7 153 0 124 2 181 0 125] 
#[1 7 157 0 6 5 89 0 94] 
#[0 2 250 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 7 161 0 163 7 161 0 164 0 245 0 221 7 161 0 230 1 177 0 231 0 245 0 237 7 161 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 2 254 0 6 0 94] 
#[0 3 2 0 6 0 94] 
#[0 3 6 0 1 0 3 0 5 0 6 0 34 0 35 0 36 0 37 0 38 0 46 0 53 0 58 0 63 0 67 0 74 0 75 0 80 0 83 0 85 0 87 0 89 0 92 0 93 0 94 0 97 0 100 0 101 0 102 0 104 0 105 0 108] 
#[0 7 165 0 7] 
#[1 2 185 0 1 2 5 0 3 0 33 0 5 0 69 0 53 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 245 0 114 0 245 0 116 0 245 0 117 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 7 169 0 144 1 9 0 145 1 9 0 146 7 169 0 149 0 245 0 221 0 245 0 237 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 3 10 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 7 173 0 3] 
#[0 3 14 0 3] 
#[0 7 177 0 7] 
#[0 7 181 0 1] 
#[0 3 18 0 7 0 66] 
#[1 3 22 0 4 7 185 0 49 3 22 0 94] 
#[1 7 189 0 4 7 193 0 94] 
#[0 3 26 0 4 0 94] 
#[0 7 197 0 100 1 10 1 18] 
#[0 7 201 0 7] 
#[1 2 2 0 3 5 97 0 62 7 205 0 243 5 105 0 244 5 109 0 245] 
#[0 7 209 0 7] 
#[1 0 42 0 1 2 9 0 97 7 213 0 113 7 213 0 114] 
#[0 7 217 0 1] 
#[0 3 30 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 7 221 0 7] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 7 225 0 114 7 229 0 182 7 233 0 183 7 237 0 184 7 237 0 185 7 237 0 186 7 241 0 200] 
#[1 0 162 0 7 0 162 0 8 4 45 0 9 0 162 0 10 0 162 0 11 4 45 0 12 0 162 0 13 0 162 0 14 4 45 0 15 4 45 0 16 0 162 0 17 0 162 0 19 0 162 0 20 4 45 0 22 0 162 0 23 0 162 0 24 0 162 0 25 0 162 0 26 4 45 0 27 4 45 0 28 4 45 0 29 4 45 0 30 4 45 0 31 4 45 0 32 4 45 0 33 0 162 0 34 4 37 0 35 0 162 0 36 4 41 0 37 0 162 0 39 0 162 0 40 0 162 0 41 0 162 0 42 0 162 0 43 0 162 0 44 0 162 0 45 0 162 0 47 0 162 0 48 0 167 0 71 0 162 0 72 7 249 0 76 0 162 0 94 4 45 0 165] 
#[0 7 253 0 7] 
#[1 3 34 0 2 3 34 0 7 4 153 0 94] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 2 46 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 181 0 163 5 181 0 164 8 1 0 166 5 181 0 167 0 245 0 221 5 181 0 230 1 177 0 231 0 245 0 237 5 181 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 8 5 0 114 4 161 0 179 4 165 0 180 8 9 0 184 8 9 0 185 8 9 0 186 8 13 0 200] 
#[1 8 17 0 71 8 21 0 76] 
#[0 8 25 0 1] 
#[1 2 238 0 2 3 157 0 3 3 161 0 5 7 113 0 93 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 7 145 0 191 7 145 0 192 7 141 0 194 8 29 0 223 7 133 0 224 7 137 0 225 7 141 0 226 7 145 0 227] 
#[1 8 33 0 2 4 153 0 94] 
#[0 3 38 0 66] 
#[0 8 37 0 49] 
#[1 8 41 0 4 8 45 0 94] 
#[0 3 42 0 4 0 94] 
#[0 3 46 0 4 0 94] 
#[1 2 9 0 97 8 49 0 114 8 49 1 11] 
#[0 8 53 0 7] 
#[1 3 61 0 3 3 65 0 25 8 57 1 5 8 61 1 6] 
#[0 3 50 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 3 54 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 3 58 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 8 65 0 7] 
#[0 3 62 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 8 69 0 163 8 69 0 164 0 245 0 221 8 69 0 230 1 177 0 231 0 245 0 237 8 69 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 8 73 0 2 8 77 0 94] 
#[0 3 66 0 2 0 94] 
#[1 8 81 0 6 4 153 0 94] 
#[0 3 70 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 8 85 0 2 4 153 0 94] 
#[0 3 74 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 8 89 0 1] 
#[1 3 145 0 3 8 93 0 173] 
#[1 3 78 0 1 3 78 0 3 3 78 0 4 3 78 0 5 3 78 0 7 3 78 0 34 3 78 0 35 3 78 0 36 3 78 0 37 3 78 0 38 3 78 0 46 3 78 0 50 3 78 0 51 3 78 0 53 3 78 0 54 3 78 0 55 3 78 0 56 3 78 0 57 3 78 0 58 3 78 0 59 3 78 0 60 3 78 0 61 3 78 0 63 6 37 0 64 3 78 0 65 3 78 0 67 3 78 0 69 3 78 0 70 3 78 0 73 3 78 0 74 3 78 0 75 3 78 0 77 3 78 0 80 3 78 0 81 3 78 0 83 3 78 0 84 3 78 0 85 3 78 0 86 3 78 0 87 3 78 0 88 3 78 0 89 3 78 0 90 3 78 0 91 3 78 0 92 3 78 0 97 3 78 0 100 3 78 0 101 3 78 0 102 3 78 0 104 3 78 0 105 3 78 0 108 8 97 0 217 3 78 1 49] 
#[0 3 82 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 2 190 0 2 0 4 0 6 0 22 0 71 0 76 0 94] 
#[1 1 150 0 2 1 150 0 4 1 150 0 6 4 245 0 22 1 150 0 94 4 249 0 134 4 253 0 135] 
#[0 8 101 0 95] 
#[1 3 157 0 3 3 161 0 5 2 202 0 6 7 113 0 93 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 7 57 0 191 7 57 0 192 7 61 0 193 7 61 0 194] 
#[0 3 86 0 7 0 76 0 94] 
#[0 3 90 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 3 165 0 114 8 105 0 183 3 177 0 184 3 177 0 185 3 177 0 186] 
#[0 3 94 0 7 0 76 0 94] 
#[1 8 109 0 2 4 153 0 94] 
#[1 8 113 0 2 4 153 0 94] 
#[0 3 98 0 2 0 4 0 6 0 7 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 3 102 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 3 106 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 1 126 0 3 1 126 0 108 1 126 0 110 8 117 1 45] 
#[1 4 153 0 94 8 121 0 106 8 125 0 107 8 129 0 138 8 133 0 139] 
#[1 8 137 0 6 4 153 0 94] 
#[0 3 110 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 8 141 0 6 4 153 0 94] 
#[0 3 114 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 3 118 0 2 0 4 0 6 0 7 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 3 122 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 3 126 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 3 130 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 3 134 0 2 0 4 0 6 0 7 0 8 0 10 0 11 0 13 0 14 0 17 0 19 0 20 0 23 0 24 0 25 0 34 0 36 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 3 138 0 2 3 138 0 4 3 138 0 6 3 138 0 7 4 53 0 8 3 138 0 10 3 138 0 11 3 138 0 13 3 138 0 14 3 138 0 17 3 138 0 19 3 138 0 20 3 138 0 23 3 138 0 24 4 57 0 25 3 138 0 34 3 138 0 36 3 138 0 39 3 138 0 40 3 138 0 41 4 61 0 42 3 138 0 43 3 138 0 44 3 138 0 45 3 138 0 47 3 138 0 48 3 138 0 71 3 138 0 72 3 138 0 76 3 138 0 94 3 138 0 95 3 138 0 106 3 138 0 107 3 138 1 49] 
#[1 3 142 0 2 3 142 0 4 3 142 0 6 3 142 0 7 4 53 0 8 3 142 0 10 3 142 0 11 3 142 0 13 3 142 0 14 3 142 0 17 3 142 0 19 3 142 0 20 3 142 0 23 3 142 0 24 4 57 0 25 3 142 0 34 3 142 0 36 3 142 0 39 3 142 0 40 3 142 0 41 4 61 0 42 3 142 0 43 3 142 0 44 3 142 0 45 3 142 0 47 3 142 0 48 3 142 0 71 3 142 0 72 3 142 0 76 3 142 0 94 3 142 0 95 3 142 0 106 3 142 0 107 3 142 1 49] 
#[1 3 146 0 2 3 146 0 4 3 146 0 6 3 146 0 7 3 146 0 10 3 146 0 11 3 146 0 13 3 146 0 14 3 146 0 17 3 146 0 19 3 146 0 20 3 146 0 23 3 146 0 24 4 65 0 34 4 69 0 36 3 146 0 39 3 146 0 40 3 146 0 41 3 146 0 43 3 146 0 44 3 146 0 45 3 146 0 47 3 146 0 48 3 146 0 71 3 146 0 72 3 146 0 76 3 146 0 94 3 146 0 95 3 146 0 106 3 146 0 107 3 146 1 49] 
#[1 3 150 0 2 3 150 0 4 3 150 0 6 3 150 0 7 3 150 0 10 3 150 0 11 3 150 0 13 3 150 0 14 3 150 0 17 3 150 0 19 3 150 0 20 3 150 0 23 3 150 0 24 4 65 0 34 4 69 0 36 3 150 0 39 3 150 0 40 3 150 0 41 3 150 0 43 3 150 0 44 3 150 0 45 3 150 0 47 3 150 0 48 3 150 0 71 3 150 0 72 3 150 0 76 3 150 0 94 3 150 0 95 3 150 0 106 3 150 0 107 3 150 1 49] 
#[1 3 154 0 2 3 154 0 4 3 154 0 6 3 154 0 7 3 154 0 10 3 154 0 11 3 154 0 13 3 154 0 14 3 154 0 17 3 154 0 19 3 154 0 20 3 154 0 23 3 154 0 24 4 65 0 34 4 69 0 36 3 154 0 39 3 154 0 40 3 154 0 41 3 154 0 43 3 154 0 44 3 154 0 45 3 154 0 47 3 154 0 48 3 154 0 71 3 154 0 72 3 154 0 76 3 154 0 94 3 154 0 95 3 154 0 106 3 154 0 107 3 154 1 49] 
#[1 3 158 0 2 3 158 0 4 3 158 0 6 3 158 0 7 3 158 0 10 4 73 0 11 3 158 0 13 4 77 0 14 4 81 0 17 3 158 0 19 3 158 0 20 3 158 0 23 3 158 0 24 3 158 0 39 3 158 0 40 3 158 0 41 3 158 0 43 3 158 0 44 3 158 0 45 3 158 0 47 3 158 0 48 3 158 0 71 3 158 0 72 3 158 0 76 3 158 0 94 3 158 0 95 3 158 0 106 3 158 0 107 3 158 1 49] 
#[1 3 162 0 2 3 162 0 4 3 162 0 6 3 162 0 7 3 162 0 10 4 73 0 11 3 162 0 13 4 77 0 14 4 81 0 17 3 162 0 19 3 162 0 20 3 162 0 23 3 162 0 24 3 162 0 39 3 162 0 40 3 162 0 41 3 162 0 43 3 162 0 44 3 162 0 45 3 162 0 47 3 162 0 48 3 162 0 71 3 162 0 72 3 162 0 76 3 162 0 94 3 162 0 95 3 162 0 106 3 162 0 107 3 162 1 49] 
#[1 3 166 0 2 3 166 0 4 3 166 0 6 3 166 0 7 3 166 0 10 4 73 0 11 3 166 0 13 4 77 0 14 4 81 0 17 3 166 0 19 3 166 0 20 3 166 0 23 3 166 0 24 3 166 0 39 3 166 0 40 3 166 0 41 3 166 0 43 3 166 0 44 3 166 0 45 3 166 0 47 3 166 0 48 3 166 0 71 3 166 0 72 3 166 0 76 3 166 0 94 3 166 0 95 3 166 0 106 3 166 0 107 3 166 1 49] 
#[1 3 170 0 2 3 170 0 4 3 170 0 6 3 170 0 7 3 170 0 10 4 73 0 11 3 170 0 13 4 77 0 14 4 81 0 17 3 170 0 19 3 170 0 20 3 170 0 23 3 170 0 24 3 170 0 39 3 170 0 40 3 170 0 41 3 170 0 43 3 170 0 44 3 170 0 45 3 170 0 47 3 170 0 48 3 170 0 71 3 170 0 72 3 170 0 76 3 170 0 94 3 170 0 95 3 170 0 106 3 170 0 107 3 170 1 49] 
#[1 3 174 0 2 3 174 0 4 3 174 0 6 3 174 0 7 3 174 0 10 4 73 0 11 3 174 0 13 4 77 0 14 4 81 0 17 3 174 0 19 3 174 0 20 3 174 0 23 3 174 0 24 3 174 0 39 3 174 0 40 3 174 0 41 3 174 0 43 3 174 0 44 3 174 0 45 3 174 0 47 3 174 0 48 3 174 0 71 3 174 0 72 3 174 0 76 3 174 0 94 3 174 0 95 3 174 0 106 3 174 0 107 3 174 1 49] 
#[1 3 178 0 2 3 178 0 4 3 178 0 6 3 178 0 7 3 178 0 10 4 73 0 11 3 178 0 13 4 77 0 14 4 81 0 17 3 178 0 19 3 178 0 20 3 178 0 23 3 178 0 24 3 178 0 39 3 178 0 40 3 178 0 41 3 178 0 43 3 178 0 44 3 178 0 45 3 178 0 47 3 178 0 48 3 178 0 71 3 178 0 72 3 178 0 76 3 178 0 94 3 178 0 95 3 178 0 106 3 178 0 107 3 178 1 49] 
#[1 3 182 0 2 3 182 0 4 3 182 0 6 3 182 0 7 4 85 0 10 4 89 0 13 4 93 0 19 4 97 0 20 3 182 0 23 3 182 0 24 3 182 0 39 3 182 0 40 3 182 0 41 3 182 0 43 3 182 0 44 3 182 0 45 3 182 0 47 3 182 0 48 4 101 0 71 4 105 0 72 3 182 0 76 3 182 0 94 3 182 0 95 3 182 0 106 3 182 0 107 3 182 1 49] 
#[1 3 186 0 2 3 186 0 4 3 186 0 6 3 186 0 7 4 85 0 10 4 89 0 13 4 93 0 19 4 97 0 20 3 186 0 23 3 186 0 24 3 186 0 39 3 186 0 40 3 186 0 41 3 186 0 43 3 186 0 44 3 186 0 45 3 186 0 47 3 186 0 48 4 101 0 71 4 105 0 72 3 186 0 76 3 186 0 94 3 186 0 95 3 186 0 106 3 186 0 107 3 186 1 49] 
#[1 3 190 0 2 3 190 0 4 3 190 0 6 3 190 0 7 4 85 0 10 4 89 0 13 4 93 0 19 4 97 0 20 3 190 0 23 3 190 0 24 3 190 0 39 3 190 0 40 3 190 0 41 3 190 0 43 3 190 0 44 3 190 0 45 3 190 0 47 3 190 0 48 4 101 0 71 4 105 0 72 3 190 0 76 3 190 0 94 3 190 0 95 3 190 0 106 3 190 0 107 3 190 1 49] 
#[1 3 194 0 2 3 194 0 4 3 194 0 6 3 194 0 7 4 85 0 10 4 89 0 13 4 93 0 19 4 97 0 20 3 194 0 23 3 194 0 24 3 194 0 39 3 194 0 40 3 194 0 41 3 194 0 43 3 194 0 44 3 194 0 45 3 194 0 47 3 194 0 48 4 101 0 71 4 105 0 72 3 194 0 76 3 194 0 94 3 194 0 95 3 194 0 106 3 194 0 107 3 194 1 49] 
#[1 3 198 0 2 3 198 0 4 3 198 0 6 3 198 0 7 4 109 0 23 4 113 0 24 3 198 0 39 3 198 0 40 3 198 0 41 3 198 0 43 3 198 0 44 3 198 0 45 4 117 0 47 4 121 0 48 3 198 0 76 3 198 0 94 3 198 0 95 3 198 0 106 3 198 0 107 3 198 1 49] 
#[1 3 202 0 2 3 202 0 4 3 202 0 6 3 202 0 7 4 125 0 39 3 202 0 40 3 202 0 41 3 202 0 43 3 202 0 44 3 202 0 45 3 202 0 76 3 202 0 94 3 202 0 95 3 202 0 106 3 202 0 107 3 202 1 49] 
#[1 3 206 0 2 3 206 0 4 3 206 0 6 3 206 0 7 3 206 0 40 3 206 0 41 3 206 0 43 3 206 0 44 4 129 0 45 3 206 0 76 3 206 0 94 3 206 0 95 3 206 0 106 3 206 0 107 3 206 1 49] 
#[1 3 210 0 2 3 210 0 4 3 210 0 6 3 210 0 7 3 210 0 40 3 210 0 41 4 133 0 43 3 210 0 44 3 210 0 76 3 210 0 94 3 210 0 95 3 210 0 106 3 210 0 107 3 210 1 49] 
#[0 8 145 0 95] 
#[1 3 214 0 2 3 214 0 4 3 214 0 6 3 214 0 7 4 137 0 40 3 214 0 41 3 214 0 44 3 214 0 76 3 214 0 94 3 214 0 95 3 214 0 106 3 214 0 107 3 214 1 49] 
#[0 3 218 0 2 0 6 0 7 0 94 0 95 0 106 0 107 1 49] 
#[0 3 222 0 7 0 94] 
#[0 3 226 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 4 157 0 114 8 149 0 180 4 169 0 184 4 169 0 185 4 169 0 186] 
#[0 3 230 0 7 0 94] 
#[1 0 25 0 1 0 29 0 3 0 11 0 4 2 93 0 5 0 37 0 7 2 97 0 25 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 2 101 0 68 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 2 105 0 78 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 2 109 0 98 2 161 0 100 2 165 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 2 113 0 114 2 129 0 115 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 2 121 0 128 2 125 0 129 2 129 0 130 2 129 0 131 2 129 0 132 2 125 0 133 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 8 153 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 8 157 0 228 8 161 0 229 1 81 0 230 1 177 0 231 2 125 0 233 2 125 0 235 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 2 161 1 18 2 165 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 3 234 0 2 0 4 0 6 0 7 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 3 238 0 2 0 4 0 6 0 7 0 76 0 94 0 95 0 106 0 107 1 49] 
#[1 0 10 0 108 8 165 1 24 8 169 1 43] 
#[1 3 242 0 3 0 171 0 108 8 173 0 110 8 181 1 21 8 181 1 22 1 249 1 23 8 181 1 41 2 1 1 43 8 185 1 48] 
#[1 3 250 0 3 3 250 0 8 3 250 0 13 8 189 0 21 8 193 0 95 3 250 0 109] 
#[1 3 242 0 3 8 197 0 8 0 94 0 13 8 201 0 109 8 229 1 27 8 209 1 31 8 213 1 32 8 217 1 33 8 213 1 34 8 213 1 35 8 229 1 36 8 233 1 44 8 237 1 48] 
#[0 3 254 0 3 0 8 0 13 0 109] 
#[0 4 2 0 3 0 8 0 13 0 109] 
#[0 4 6 0 109] 
#[1 8 241 0 109 8 245 1 29] 
#[0 0 175 0 4 0 94] 
#[1 0 25 0 1 2 45 0 3 2 49 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 2 53 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 7 149 0 163 7 149 0 164 2 69 0 184 2 69 0 185 2 69 0 186 8 249 0 191 8 249 0 192 0 245 0 221 7 149 0 230 1 177 0 231 0 245 0 237 7 149 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 4 10 0 2 0 4 0 6 0 22 0 71 0 76 0 94] 
#[1 8 253 0 4 4 189 0 5 2 9 0 97 2 109 0 98 4 197 0 100 4 201 0 101 6 53 0 114 6 57 0 115 6 57 0 130 6 57 0 131 6 57 0 132 9 1 0 190 9 1 0 192 4 197 1 18 4 201 1 19] 
#[1 0 25 0 1 2 45 0 3 2 49 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 9 5 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 7 161 0 163 7 161 0 164 9 9 0 184 9 9 0 185 9 9 0 186 0 245 0 221 7 161 0 230 1 177 0 231 0 245 0 237 7 161 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 4 14 0 6 0 94] 
#[0 9 13 0 6] 
#[0 4 18 0 6] 
#[0 4 22 0 2 0 4 0 6 0 22 0 71 0 76 0 94] 
#[1 0 30 0 3 0 30 0 5 0 30 0 6 0 30 0 93 2 169 0 94 0 30 0 97 9 17 0 124 2 181 0 125 9 21 0 189] 
#[0 4 26 0 2 0 4 0 6 0 7 0 76 0 94] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 9 25 0 114 9 29 0 184 9 29 0 185 9 29 0 186] 
#[0 4 30 0 2 0 94] 
#[0 4 34 0 1 0 95] 
#[1 2 238 0 2 3 157 0 3 3 161 0 5 7 113 0 93 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 7 145 0 191 7 145 0 192 7 141 0 194 9 33 0 222 7 129 0 223 7 133 0 224 7 137 0 225 7 141 0 226 7 145 0 227] 
#[0 9 37 0 2] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 9 45 0 191 9 45 0 192 9 45 0 227 9 45 0 234] 
#[0 4 38 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 4 42 0 4 0 94] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 9 49 0 114 9 9 0 184 9 9 0 185 9 9 0 186] 
#[0 4 46 0 2 0 94] 
#[0 4 50 0 2] 
#[0 9 53 0 2] 
#[0 4 54 0 2] 
#[0 4 58 0 2] 
#[1 4 62 0 2 9 57 0 94] 
#[0 4 66 0 2] 
#[0 4 70 0 2 0 94] 
#[0 4 74 0 4 0 94] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 5 77 0 93 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 9 61 0 126 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 9 65 0 163 9 65 0 164 0 245 0 221 9 65 0 230 1 177 0 231 0 245 0 237 9 65 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 4 78 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 4 82 0 4 0 6 0 94] 
#[0 4 86 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 4 90 0 3] 
#[1 4 94 0 4 4 189 0 5 9 69 0 7 2 97 0 25 2 101 0 68 2 105 0 78 9 73 0 79 2 109 0 98 4 197 0 100 4 201 0 101 9 77 0 115 9 77 0 130 9 77 0 131 9 77 0 132 9 97 0 233 9 97 0 235 9 85 0 246 9 89 0 247 9 93 0 248 9 97 0 249 4 197 1 18 4 201 1 19] 
#[0 4 98 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 9 101 0 163 9 101 0 164 9 101 0 167 0 245 0 221 9 101 0 230 1 177 0 231 0 245 0 237 9 101 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 9 105 0 98] 
#[0 4 102 0 7 0 66] 
#[1 9 109 0 4 5 125 0 98 9 113 1 15] 
#[0 4 106 0 7] 
#[0 4 110 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 4 114 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 4 118 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 9 117 0 1] 
#[1 2 238 0 2 3 157 0 3 3 161 0 5 7 113 0 93 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 7 145 0 191 7 145 0 192 7 141 0 194 9 121 0 223 7 133 0 224 7 137 0 225 7 141 0 226 7 145 0 227] 
#[0 4 122 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 1 150 0 7 4 245 0 22 4 126 0 71 1 150 0 76 1 150 0 94 6 65 0 134 4 253 0 135] 
#[1 9 125 0 7 6 73 0 94] 
#[1 2 86 0 7 9 129 0 76 2 86 0 94] 
#[1 4 245 0 22 4 130 0 71 6 77 0 135] 
#[0 9 133 0 71] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 9 137 0 163 9 137 0 164 9 137 0 167 0 245 0 221 9 137 0 230 1 177 0 231 0 245 0 237 9 137 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 9 141 0 163 9 141 0 164 9 141 0 167 0 245 0 221 9 141 0 230 1 177 0 231 0 245 0 237 9 141 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 2 46 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 181 0 163 5 181 0 164 9 145 0 166 5 181 0 167 0 245 0 221 5 181 0 230 1 177 0 231 0 245 0 237 5 181 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 9 149 0 7] 
#[1 1 150 0 7 4 245 0 22 4 126 0 71 4 126 0 76 1 150 0 94 6 233 0 134 4 253 0 135] 
#[1 4 245 0 22 4 130 0 71 4 130 0 76 6 245 0 135] 
#[0 4 134 0 71 0 76] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 9 153 0 163 9 153 0 164 9 153 0 167 0 245 0 221 9 153 0 230 1 177 0 231 0 245 0 237 9 153 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 9 157 0 163 9 157 0 164 9 157 0 167 0 245 0 221 9 157 0 230 1 177 0 231 0 245 0 237 9 157 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 238 0 2 3 157 0 3 3 161 0 5 7 113 0 93 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 7 145 0 191 7 145 0 192 7 141 0 194 9 161 0 223 7 133 0 224 7 137 0 225 7 141 0 226 7 145 0 227] 
#[0 9 165 0 2] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 9 169 0 168 9 169 0 171 9 169 0 172 9 169 0 173 9 169 0 181 9 169 0 195 9 169 0 196 9 169 0 197 9 169 0 198 9 169 0 201 9 169 0 202 9 169 0 204 9 169 0 205 9 169 0 206 9 169 0 212 9 169 0 214 9 169 0 215 9 169 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 9 0 97 9 173 0 114 9 173 1 11] 
#[0 4 138 0 66] 
#[1 9 177 0 4 2 9 0 97 5 213 0 98 5 225 0 114 9 181 1 9 5 225 1 11] 
#[0 4 142 0 66] 
#[0 4 146 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 4 150 0 66] 
#[0 4 154 0 66] 
#[0 4 158 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 4 162 0 2 0 94] 
#[0 4 166 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 25 0 1 9 185 0 2 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 9 189 0 93 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 9 193 0 163 9 193 0 164 0 245 0 221 9 193 0 230 1 177 0 231 0 245 0 237 9 193 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 4 170 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 9 197 0 3 9 201 0 207] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 9 213 0 114 9 213 0 184 9 213 0 185 9 213 0 186 9 213 0 218] 
#[0 4 174 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 4 178 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 3 157 0 3 3 161 0 5 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 8 249 0 191 8 249 0 192] 
#[0 4 182 0 7 0 94] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 9 217 0 168 9 217 0 171 9 217 0 172 9 217 0 173 9 217 0 181 9 217 0 195 9 217 0 196 9 217 0 197 9 217 0 198 9 217 0 201 9 217 0 202 9 217 0 204 9 217 0 205 9 217 0 206 9 217 0 212 9 217 0 214 9 217 0 215 9 217 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 9 221 0 168 9 221 0 171 9 221 0 172 9 221 0 173 9 221 0 181 9 221 0 195 9 221 0 196 9 221 0 197 9 221 0 198 9 221 0 201 9 221 0 202 9 221 0 204 9 221 0 205 9 221 0 206 9 221 0 212 9 221 0 214 9 221 0 215 9 221 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 2 182 0 3 2 182 0 108 2 182 0 110 9 225 1 39 7 9 1 40] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 9 229 0 163 9 229 0 164 9 229 0 167 0 245 0 221 9 229 0 230 1 177 0 231 0 245 0 237 9 229 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 4 186 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 4 190 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 9 233 0 106 9 237 0 107] 
#[0 4 194 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 4 198 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 9 241 0 163 9 241 0 164 0 245 0 221 9 241 0 230 1 177 0 231 0 245 0 237 9 241 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 4 202 0 7 0 94] 
#[0 4 206 0 4] 
#[0 9 245 0 4] 
#[0 4 210 0 4] 
#[0 4 214 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 0 108 0 109 0 110 1 49] 
#[0 9 249 0 108] 
#[0 4 218 0 3 0 108 0 110] 
#[0 4 222 0 3 0 108 0 110] 
#[0 4 226 0 3 0 108 0 110] 
#[0 9 253 0 3] 
#[0 4 230 0 109] 
#[0 10 1 0 109] 
#[1 4 234 0 13 10 5 1 46] 
#[1 4 238 0 3 4 238 0 8 4 238 0 13 4 238 0 22 8 193 0 95 4 238 0 109] 
#[0 4 242 0 3 0 8 0 13 0 22 0 109] 
#[1 10 9 0 8 0 94 0 13 10 13 1 44] 
#[0 4 246 0 3 0 8 0 13 0 109] 
#[1 3 242 0 3 4 250 0 8 4 250 0 13 8 201 0 109 8 229 1 27 10 17 1 32 10 17 1 34 10 17 1 35 8 229 1 36 8 237 1 48] 
#[0 4 254 0 3 0 8 0 13 0 109] 
#[0 5 2 0 3 0 8 0 13 0 109] 
#[1 5 6 0 3 5 6 0 8 5 6 0 13 10 21 0 22 5 6 0 109 10 25 1 37] 
#[0 10 29 0 13] 
#[0 10 33 0 3] 
#[1 5 10 0 3 5 10 0 8 5 10 0 13 8 189 0 21 5 10 0 109] 
#[0 5 14 0 109] 
#[0 5 18 0 4 0 94] 
#[0 5 22 0 2 0 4 0 6 0 22 0 71 0 76 0 94] 
#[0 5 26 0 4 0 94] 
#[1 0 98 0 1 0 98 0 5 0 179 0 6 0 98 0 8 0 98 0 9 0 98 0 10 0 98 0 11 0 98 0 12 0 98 0 13 0 98 0 14 0 98 0 15 0 98 0 16 0 98 0 17 0 102 0 18 0 98 0 19 0 98 0 20 0 98 0 21 0 98 0 22 0 98 0 23 0 98 0 24 0 98 0 25 0 98 0 26 0 98 0 27 0 98 0 28 0 98 0 29 0 98 0 30 0 98 0 31 0 98 0 32 0 98 0 33 0 98 0 34 0 98 0 35 0 98 0 36 0 98 0 37 0 98 0 39 0 98 0 40 0 98 0 41 0 98 0 42 0 98 0 43 0 98 0 44 0 98 0 45 0 98 0 47 0 98 0 48 0 98 0 71 0 98 0 72 0 98 0 94 0 98 0 104 0 98 0 105] 
#[0 5 34 0 2 0 6] 
#[0 5 38 0 2 0 4 0 6 0 22 0 71 0 76 0 94] 
#[1 3 157 0 3 3 161 0 5 2 202 0 6 7 113 0 93 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 7 57 0 191 7 57 0 192 10 37 0 193 10 37 0 194] 
#[0 5 42 0 6 0 94] 
#[0 10 41 0 2] 
#[0 10 45 0 2] 
#[0 10 49 0 2] 
#[0 10 53 0 3] 
#[0 5 46 0 2] 
#[0 10 57 0 2] 
#[0 5 30 0 2 0 6] 
#[0 10 61 0 3] 
#[1 3 157 0 3 3 161 0 5 7 113 0 93 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 10 69 0 191 10 69 0 192 10 65 0 194 10 65 0 226 10 69 0 227] 
#[0 5 50 0 6 0 94] 
#[0 5 54 0 6 0 94] 
#[0 5 58 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 98 0 100 0 101] 
#[1 4 189 0 5 2 97 0 25 2 101 0 68 2 105 0 78 2 109 0 98 4 197 0 100 4 201 0 101 9 77 0 115 9 77 0 130 9 77 0 131 9 77 0 132 10 73 0 233 10 73 0 235 4 197 1 18 4 201 1 19] 
#[0 5 49 0 1] 
#[0 5 62 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 98 0 100 0 101] 
#[0 10 77 0 4] 
#[0 5 66 0 4] 
#[1 5 70 0 4 4 189 0 5 9 69 0 7 2 97 0 25 2 101 0 68 2 105 0 78 9 73 0 79 2 109 0 98 4 197 0 100 4 201 0 101 9 77 0 115 9 77 0 130 9 77 0 131 9 77 0 132 10 81 0 233 10 81 0 235 10 81 0 249 4 197 1 18 4 201 1 19] 
#[0 5 74 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 98 0 100 0 101] 
#[1 10 85 0 2 4 153 0 94] 
#[0 5 78 0 4 0 94] 
#[0 5 82 0 7 0 66] 
#[0 5 86 0 4 0 94] 
#[1 2 238 0 2 3 157 0 3 3 161 0 5 7 113 0 93 2 9 0 97 6 53 0 114 2 69 0 184 2 69 0 185 2 69 0 186 7 145 0 191 7 145 0 192 7 141 0 194 10 89 0 223 7 133 0 224 7 137 0 225 7 141 0 226 7 145 0 227] 
#[0 10 93 0 2] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 2 46 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 181 0 163 5 181 0 164 10 97 0 166 5 181 0 167 0 245 0 221 5 181 0 230 1 177 0 231 0 245 0 237 5 181 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 10 101 0 163 10 101 0 164 10 101 0 167 0 245 0 221 10 101 0 230 1 177 0 231 0 245 0 237 10 101 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 10 105 0 163 10 105 0 164 10 105 0 167 0 245 0 221 10 105 0 230 1 177 0 231 0 245 0 237 10 105 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 10 109 0 2 4 153 0 94] 
#[1 10 113 0 2 4 153 0 94] 
#[0 10 117 0 7] 
#[1 0 25 0 1 2 46 0 2 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 181 0 163 5 181 0 164 10 121 0 166 5 181 0 167 0 245 0 221 5 181 0 230 1 177 0 231 0 245 0 237 5 181 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 10 125 0 2 4 153 0 94] 
#[1 10 129 0 2 4 153 0 94] 
#[0 10 133 0 2] 
#[0 10 137 0 3] 
#[1 5 90 0 1 5 90 0 3 5 90 0 4 5 90 0 5 5 90 0 7 5 90 0 34 5 90 0 35 5 90 0 36 5 90 0 37 5 90 0 38 5 90 0 46 5 90 0 50 5 90 0 51 5 90 0 53 5 90 0 54 5 90 0 55 5 90 0 56 5 90 0 57 5 90 0 58 5 90 0 59 10 141 0 60 5 90 0 61 5 90 0 63 5 90 0 65 5 90 0 67 5 90 0 69 5 90 0 70 5 90 0 73 5 90 0 74 5 90 0 75 5 90 0 77 5 90 0 80 5 90 0 81 5 90 0 83 5 90 0 84 5 90 0 85 5 90 0 86 5 90 0 87 5 90 0 88 5 90 0 89 5 90 0 90 5 90 0 91 5 90 0 92 5 90 0 97 5 90 0 100 5 90 0 101 5 90 0 102 5 90 0 104 5 90 0 105 5 90 0 108 5 90 1 49] 
#[0 5 94 0 4 0 94] 
#[0 5 98 0 66] 
#[0 5 102 0 4 0 94] 
#[0 5 106 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 10 145 0 163 10 145 0 164 0 245 0 221 10 145 0 230 1 177 0 231 0 245 0 237 10 145 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 5 110 0 2 0 94] 
#[1 5 114 0 4 10 149 0 51 5 114 0 57 10 153 0 208 10 157 0 209 10 161 0 210] 
#[0 5 118 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 5 122 0 2] 
#[0 5 126 0 2] 
#[0 10 165 0 2] 
#[0 5 130 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 5 134 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 10 169 0 108] 
#[1 4 153 0 94 5 138 0 106 5 138 0 107] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 10 173 0 163 10 173 0 164 10 173 0 167 0 245 0 221 10 173 0 230 1 177 0 231 0 245 0 237 10 173 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 5 142 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 5 146 0 2 0 4 0 6 0 7 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 5 150 0 2 0 4 0 6 0 7 0 76 0 94 0 95 0 106 0 107 1 49] 
#[0 10 177 0 8] 
#[1 0 25 0 1 2 5 0 3 0 94 0 4 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 5 77 0 93 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 10 189 0 126 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 10 189 0 163 10 189 0 164 0 245 0 221 10 189 0 230 1 177 0 231 0 245 0 237 10 189 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 10 189 1 42 2 1 1 43 10 193 1 44] 
#[0 5 154 0 3 0 8 0 13 0 22 0 109] 
#[0 10 197 0 13] 
#[1 4 234 0 13 10 201 1 46] 
#[0 10 205 0 13] 
#[0 5 158 0 3 0 8 0 13 0 109] 
#[1 3 242 0 3 10 209 0 100 0 7 0 108 10 209 1 18 10 221 1 21 10 221 1 22 1 249 1 23 10 221 1 25 10 221 1 38 2 1 1 43 10 225 1 48] 
#[0 5 162 0 3 0 8 0 13 0 109] 
#[0 5 166 0 3 0 108 0 110] 
#[1 5 77 0 93 10 229 0 126] 
#[0 10 233 0 6] 
#[0 5 170 0 18] 
#[0 5 174 0 18] 
#[0 10 237 0 3] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 8 153 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 10 241 0 228 8 161 0 229 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 10 245 0 3] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 8 153 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 10 249 0 228 8 161 0 229 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 5 178 0 2] 
#[0 5 182 0 2 0 94] 
#[0 5 186 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 98 0 100 0 101] 
#[0 5 190 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 95 0 97 0 100 0 101 0 102 0 104 0 105 0 106 0 107 0 108 1 49] 
#[0 5 194 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 98 0 100 0 101] 
#[0 10 253 0 7] 
#[0 11 1 0 2] 
#[0 11 5 0 3] 
#[0 11 9 0 7] 
#[1 11 13 0 2 4 153 0 94] 
#[1 11 17 0 2 4 153 0 94] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 21 0 168 11 21 0 171 11 21 0 172 11 21 0 173 11 21 0 181 11 21 0 195 11 21 0 196 11 21 0 197 11 21 0 198 11 21 0 201 11 21 0 202 11 21 0 204 11 21 0 205 11 21 0 206 11 21 0 212 11 21 0 214 11 21 0 215 11 21 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 25 0 168 11 25 0 171 11 25 0 172 11 25 0 173 11 25 0 181 11 25 0 195 11 25 0 196 11 25 0 197 11 25 0 198 11 25 0 201 11 25 0 202 11 25 0 204 11 25 0 205 11 25 0 206 11 25 0 212 11 25 0 214 11 25 0 215 11 25 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 46 0 2 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 181 0 163 5 181 0 164 11 29 0 166 5 181 0 167 0 245 0 221 5 181 0 230 1 177 0 231 0 245 0 237 5 181 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 11 33 0 2] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 37 0 168 11 37 0 171 11 37 0 172 11 37 0 173 11 37 0 181 11 37 0 195 11 37 0 196 11 37 0 197 11 37 0 198 11 37 0 201 11 37 0 202 11 37 0 204 11 37 0 205 11 37 0 206 11 37 0 212 11 37 0 214 11 37 0 215 11 37 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 41 0 168 11 41 0 171 11 41 0 172 11 41 0 173 11 41 0 181 11 41 0 195 11 41 0 196 11 41 0 197 11 41 0 198 11 41 0 201 11 41 0 202 11 41 0 204 11 41 0 205 11 41 0 206 11 41 0 212 11 41 0 214 11 41 0 215 11 41 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 11 45 0 3] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 8 153 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 11 49 0 228 8 161 0 229 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 53 0 168 11 53 0 171 11 53 0 172 11 53 0 173 11 53 0 181 11 53 0 195 11 53 0 196 11 53 0 197 11 53 0 198 11 53 0 201 11 53 0 202 11 53 0 204 11 53 0 205 11 53 0 206 11 53 0 212 11 53 0 214 11 53 0 215 11 53 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 5 198 0 2 0 94] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 11 57 0 163 11 57 0 164 11 57 0 167 0 245 0 221 11 57 0 230 1 177 0 231 0 245 0 237 11 57 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 11 61 0 4 11 65 0 57 11 69 0 211] 
#[1 5 202 0 4 10 149 0 51 5 202 0 57 11 73 0 210] 
#[0 5 206 0 4 0 51 0 57] 
#[1 3 145 0 3 11 77 0 173] 
#[0 11 81 0 8] 
#[1 4 153 0 94 5 210 0 106 5 210 0 107] 
#[1 7 13 0 109 11 85 1 26 11 85 1 27 11 85 1 28 7 29 1 29 7 33 1 30] 
#[0 5 214 0 4] 
#[0 5 218 0 4] 
#[1 0 94 0 4 11 89 1 44] 
#[0 11 93 0 4] 
#[0 5 222 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 0 108 0 109 0 110 1 49] 
#[0 11 97 0 13] 
#[0 5 226 0 3 0 108 0 110] 
#[0 5 230 0 3 0 8 0 13 0 109] 
#[0 5 234 0 3 0 8 0 13 0 109] 
#[0 5 238 0 3 0 8 0 13 0 109] 
#[0 5 242 0 3 0 8 0 13 0 109] 
#[0 11 101 0 3] 
#[1 0 10 0 4 11 105 1 43] 
#[0 5 246 0 2 0 4 0 6 0 22 0 71 0 76 0 94] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 8 153 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 11 109 0 228 8 161 0 229 1 81 0 230 1 177 0 231 0 245 0 237 11 113 0 238 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 11 117 0 4] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 8 153 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 11 121 0 228 8 161 0 229 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 11 125 0 4] 
#[0 5 250 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 11 129 0 3] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 8 153 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 11 133 0 228 8 161 0 229 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 2 46 0 2 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 5 181 0 163 5 181 0 164 11 137 0 166 5 181 0 167 0 245 0 221 5 181 0 230 1 177 0 231 0 245 0 237 5 181 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 141 0 168 11 141 0 171 11 141 0 172 11 141 0 173 11 141 0 181 11 141 0 195 11 141 0 196 11 141 0 197 11 141 0 198 11 141 0 201 11 141 0 202 11 141 0 204 11 141 0 205 11 141 0 206 11 141 0 212 11 141 0 214 11 141 0 215 11 141 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 145 0 168 11 145 0 171 11 145 0 172 11 145 0 173 11 145 0 181 11 145 0 195 11 145 0 196 11 145 0 197 11 145 0 198 11 145 0 201 11 145 0 202 11 145 0 204 11 145 0 205 11 145 0 206 11 145 0 212 11 145 0 214 11 145 0 215 11 145 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 5 254 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 6 2 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 11 149 0 2] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 153 0 168 11 153 0 171 11 153 0 172 11 153 0 173 11 153 0 181 11 153 0 195 11 153 0 196 11 153 0 197 11 153 0 198 11 153 0 201 11 153 0 202 11 153 0 204 11 153 0 205 11 153 0 206 11 153 0 212 11 153 0 214 11 153 0 215 11 153 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 6 6 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 6 10 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 8 153 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 11 109 0 228 8 161 0 229 1 81 0 230 1 177 0 231 0 245 0 237 11 157 0 238 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 11 161 0 4] 
#[0 6 14 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 4 153 0 94 11 165 0 95] 
#[0 6 18 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 11 169 0 95] 
#[1 5 114 0 4 10 149 0 51 11 173 0 208 10 157 0 209 10 161 0 210] 
#[0 6 22 0 4 0 51 0 57] 
#[0 6 26 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 64 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 6 30 0 13 11 177 1 47] 
#[1 6 30 0 13 11 181 1 47] 
#[0 11 185 0 4] 
#[0 6 34 0 3 0 108 0 110] 
#[0 6 38 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 0 108 0 109 0 110 1 49] 
#[1 0 25 0 1 2 5 0 3 0 33 0 5 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 69 0 53 0 85 0 58 1 225 0 63 0 105 0 67 0 121 0 74 1 221 0 75 0 133 0 80 0 141 0 83 1 225 0 85 0 157 0 87 0 165 0 89 0 177 0 92 2 9 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 11 189 0 163 11 189 0 164 0 245 0 221 11 189 0 230 1 177 0 231 0 245 0 237 11 189 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 11 193 0 4] 
#[0 6 42 0 4] 
#[0 11 197 0 4] 
#[0 6 46 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 94 0 98 0 100 0 101] 
#[0 11 201 0 4] 
#[0 6 50 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 94 0 98 0 100 0 101] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 8 153 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 11 109 0 228 8 161 0 229 1 81 0 230 1 177 0 231 0 245 0 237 11 205 0 238 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 11 209 0 4] 
#[0 11 213 0 2] 
#[0 6 54 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 6 58 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 217 0 168 11 217 0 171 11 217 0 172 11 217 0 173 11 217 0 181 11 217 0 195 11 217 0 196 11 217 0 197 11 217 0 198 11 217 0 201 11 217 0 202 11 217 0 204 11 217 0 205 11 217 0 206 11 217 0 212 11 217 0 214 11 217 0 215 11 217 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 6 62 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 11 221 0 4] 
#[0 6 66 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 26 0 51 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 26 0 57 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 11 225 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[1 0 25 0 1 0 29 0 3 0 26 0 4 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 26 0 51 0 69 0 53 1 109 0 54 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 1 109 0 73 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 2 25 0 168 2 25 0 171 2 25 0 172 2 25 0 173 11 229 0 174 2 149 0 175 2 25 0 176 2 25 0 177 1 109 0 178 2 25 0 181 2 25 0 195 2 25 0 196 2 25 0 197 2 25 0 198 2 25 0 201 2 25 0 202 2 25 0 204 2 25 0 205 2 25 0 206 2 25 0 212 2 25 0 214 2 25 0 215 2 25 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 11 233 0 4] 
#[0 11 237 0 13] 
#[0 11 241 0 13] 
#[0 6 70 0 3 0 108 0 110] 
#[1 0 10 0 4 11 245 1 43] 
#[0 6 74 0 3 0 8 0 13 0 109] 
#[0 6 78 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 94 0 98 0 100 0 101] 
#[0 6 82 0 4 0 5 0 7 0 25 0 68 0 78 0 79 0 94 0 98 0 100 0 101] 
#[0 11 249 0 4] 
#[0 6 86 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[1 0 25 0 1 0 29 0 3 0 33 0 5 0 37 0 7 0 41 0 34 0 45 0 35 0 49 0 36 0 53 0 37 0 57 0 38 0 61 0 46 0 65 0 50 0 69 0 53 0 77 0 55 0 81 0 56 0 85 0 58 0 89 0 59 1 225 0 63 0 101 0 65 0 105 0 67 0 109 0 69 0 121 0 74 1 221 0 75 0 129 0 77 0 133 0 80 0 137 0 81 0 141 0 83 0 145 0 84 1 225 0 85 0 153 0 86 0 157 0 87 0 161 0 88 0 165 0 89 0 169 0 90 0 173 0 91 0 177 0 92 0 181 0 97 1 229 0 100 1 233 0 101 0 193 0 102 0 197 0 104 0 6 0 105 0 7 0 108 0 209 0 114 0 245 0 116 0 245 0 117 0 221 0 118 0 245 0 121 0 245 0 122 0 245 0 127 0 245 0 136 0 241 0 137 0 245 0 140 0 245 0 141 0 245 0 142 0 245 0 143 1 17 0 144 1 9 0 145 1 9 0 146 1 17 0 149 1 25 0 150 1 25 0 151 1 33 0 152 1 33 0 153 1 37 0 154 1 41 0 155 1 45 0 156 1 49 0 157 1 53 0 158 1 57 0 159 1 61 0 160 1 65 0 161 1 69 0 162 1 81 0 163 1 81 0 164 1 81 0 167 11 253 0 168 11 253 0 171 11 253 0 172 11 253 0 173 11 253 0 181 11 253 0 195 11 253 0 196 11 253 0 197 11 253 0 198 11 253 0 201 11 253 0 202 11 253 0 204 11 253 0 205 11 253 0 206 11 253 0 212 11 253 0 214 11 253 0 215 11 253 0 219 0 245 0 221 1 81 0 230 1 177 0 231 0 245 0 237 1 81 0 239 0 245 0 242 1 221 1 16 1 225 1 17 1 229 1 18 1 233 1 19 0 245 1 20 0 245 1 21 0 245 1 22 1 249 1 23 0 245 1 25 2 1 1 43] 
#[0 6 90 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 6 94 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 1 49] 
#[0 6 98 0 4 0 51 0 57] 
#[0 6 102 0 4 0 51] 
#[0 6 106 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 6 110 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 0 109 1 49] 
#[0 6 114 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 71 0 72 0 76 0 94 0 95 0 104 0 105 0 106 0 107 0 108 0 109 0 110 1 49] 
#[0 12 1 0 4] 
#[0 6 118 0 1 0 3 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 53 0 54 0 55 0 56 0 58 0 59 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 6 122 0 1 0 3 0 4 0 5 0 7 0 34 0 35 0 36 0 37 0 38 0 46 0 50 0 51 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 63 0 65 0 67 0 69 0 70 0 73 0 74 0 75 0 77 0 80 0 81 0 83 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 97 0 100 0 101 0 102 0 104 0 105 0 108 1 49] 
#[0 6 126 0 3 0 8 0 13 0 109]
	).
]

{ #category : #private }
JSParser >> actionsForCurrentToken [
	| actions |
	actions := super actionsForCurrentToken.
	(currentToken ids first ~= scanner identifierId and: [ (currentToken ids includes: scanner identifierId) and: [ (self keywords includes: currentToken value) not ] ])
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
JSParser >> defaultScope [
	^ #jsx
]

{ #category : #private }
JSParser >> handleError: anInteger [
	(currentToken value = ';' and: [ currentToken startPosition isNil ])
		ifTrue: [ currentToken := nil.
			self getNextToken ].
	^ super handleError: anInteger
]

{ #category : #private }
JSParser >> isJSX [
	^ true
]

{ #category : #private }
JSParser >> keywords [
	^ self class keywords
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
JSParser >> reduceActionForArguments3: nodes [
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
	self add: (nodes at: 3) to: (result at: 6).
	result at: 2 put: (nodes at: 4).
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
	result addNodes: ((nodes at: 2) at: 1) to: result imports.
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
	result from: (nodes at: 2).
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
JSParser >> reduceActionForJSXAttribute1: nodes [
	| result |
	result := JSXAttributeNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXAttribute2: nodes [
	| result |
	result := JSXAttributeNode new.
	result name: (nodes at: 1).
	result equalToken: ((nodes at: 2) at: 1).
	result value: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXChild1: nodes [
	| result |
	result := JSXTextNode new.
	result value: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXChild3: nodes [
	| result |
	result := JSXCodeExpressionNode new.
	result leftBrace: (nodes at: 2).
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXChild4: nodes [
	| result |
	result := JSXCodeExpressionNode new.
	result leftBrace: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBrace: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXClosingElement1: nodes [
	| result |
	result := JSXClosingElementNode new.
	result ltToken: (nodes at: 2).
	result slashToken: (nodes at: 3).
	result name: (nodes at: 4).
	result gtToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXElement2: nodes [
	| result |
	result := JSXElementNode new.
	result openingElement: (nodes at: 1).
	result addNodes: (nodes at: 3) to: result items.
	result closingElement: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXElementName1: nodes [
	| result |
	result := JSXElementNameNode new.
	result identifier: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXFragment1: nodes [
	| result |
	result := JSXFragmentNode new.
	result addToken: (nodes at: 1) to: result ltTokens.
	result addToken: (nodes at: 3) to: result gtTokens.
	result addNodes: (nodes at: 5) to: result items.
	result addToken: (nodes at: 6) to: result ltTokens.
	result slashToken: (nodes at: 7).
	result addToken: (nodes at: 9) to: result gtTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXMemberExpression1: nodes [
	| result |
	result := JSXMemberExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifiers.
	result addTokens: ((nodes at: 1) at: 2) to: result periodTokens.
	result addToken: (nodes at: 2) to: result identifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXNamespacedName1: nodes [
	| result |
	result := JSXNamespacedNameNode new.
	result addToken: (nodes at: 1) to: result identifiers.
	result colonToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXOpeningElement1: nodes [
	| result |
	result := JSXOpeningElementNode new.
	result ltToken: (nodes at: 2).
	result name: (nodes at: 3).
	result gtToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXOpeningElement2: nodes [
	| result |
	result := JSXOpeningElementNode new.
	result ltToken: (nodes at: 2).
	result name: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result _attributes.
	result gtToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXSelfClosingElement1: nodes [
	| result |
	result := JSXSelfClosingElementNode new.
	result ltToken: (nodes at: 2).
	result name: (nodes at: 3).
	result slashToken: (nodes at: 4).
	result gtToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXSelfClosingElement2: nodes [
	| result |
	result := JSXSelfClosingElementNode new.
	result ltToken: (nodes at: 2).
	result name: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result _attributes.
	result slashToken: (nodes at: 5).
	result gtToken: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForJSXSpreadAttribute1: nodes [
	| result |
	result := JSXSpreadAttributeNode new.
	result leftBrace: (nodes at: 2).
	result element: (nodes at: 3).
	result rightBrace: (nodes at: 5).
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
JSParser >> reduceActionForStartJSXText1: nodes [
	^ #jsxText
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
JSParser >> reduceActionForSwitchToDefault1: nodes [
	self scope: #default.
	^ #default
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSwitchToJSX1: nodes [
	self scope: #jsx.
	^ nil
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSwitchToJSXText1: nodes [
	self scope: #jsxText.
	^ nil
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSwitchToJSXTextOrDefault11: nodes [
	^ self switchToJSXTextOrDefault: 1
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionForSwitchToJSXTextOrDefault21: nodes [
	^ self switchToJSXTextOrDefault: 2
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
JSParser >> reduceActionForUnaryExpression5: nodes [
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

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionFor__JSXIdentifier___identifier___period___periodToken___1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JSParser >> reduceActionFor__JSXIdentifier___identifier___period___periodToken___2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #private }
JSParser >> switchToJSXTextOrDefault: anInteger [
	| count i value |
	i := nodeStack size.
	count := 0.
	[ i > 0 and: [ count < anInteger ] ]
		whileTrue: [ value := nodeStack at: i.
			value == #default
				ifTrue: [ ^ self scope: #default ].
			value == #jsxText
				ifTrue: [ count := count + 1 ].
			i := i - 1 ].
	self
		scope:
			(count >= anInteger
				ifTrue: [ #jsxText ]
				ifFalse: [ #default ])
]
