Class {
	#name : #CSharpParser,
	#superclass : #SmaCCGLRParser,
	#classInstVars : [
		'keywords'
	],
	#category : #'SmaCC_CSharp'
}

{ #category : #'generated-accessing' }
CSharpParser class >> cacheId [
	^'2018-03-19T12:39:54.789096-05:00'
]

{ #category : #generated }
CSharpParser class >> definitionComment [
"%glr;
%id <Identifier> <gt> <gtgt> <rightBrace>;

%scopes default interpolatedString interpolatedVerbatimString;

%start compilation_unit namespace_member_declaration statement expression block class_member_declaration;

%ignore_variables commaToken _leftParen _rightParen semicolonToken;

%root Program;
%prefix CS;
%suffix Node;

%annotate_tokens;

%hierarchy TypeParameterList (
	VariantTypeParameterList
);
%hierarchy UsingDirective (
	UsingAliasDirective
	UsingNamespaceDirective
	UsingStaticDirective
);
%hierarchy Declaration (
	ClassDeclaration
	ConstantDeclaration
	ConstructorDeclaration
	DelegateDeclaration
	DestructorDeclaration
	EnumDeclaration
	EventDeclaration
	FieldDeclaration
	FixedSizeBufferDeclaration
	IndexerDeclaration
	InterfaceDeclaration
	InterfaceEventDeclaration
	InterfaceIndexerDeclaration
	InterfaceMethodDeclaration
	InterfacePropertyDeclaration
	LocalConstantDeclaration
	LocalVariableDeclaration
	MethodDeclaration
	NamespaceDeclaration
	OperatorDeclaration
	PropertyDeclaration
	StaticConstructorDeclaration
	StructDeclaration
);
%hierarchy Statement (
	BlockStatement
	BreakStatement
	CheckedStatement
	ContinueStatement
	DeclarationStatement
	DoStatement
	EmptyStatement
	ExpressionStatement
	FixedStatement
	ForeachStatement
	ForStatement
	GotoStatement
	IfStatement
	LabeledStatement
	LockStatement
	ReturnStatement
	SwitchStatement
	ThrowStatement
	TryStatement
	UncheckedStatement
	UnsafeStatement
	UsingStatement
	WhileStatement
	YieldStatement
);
%hierarchy Expression (
	AnonymousMethodExpression
	AnonymousObjectCreationExpression
	ArrayCreationExpression
	Assignment
	AwaitExpression
	BaseAccess
	BaseExpression
	BinaryExpression
	CastExpression
	CheckedExpression
	ConditionalExpression
	DefaultValueExpression
	DelegateCreationExpression
	ElementAccess
	InterpolatedStringExpression
	InvocationExpression
	LambdaExpression
	LiteralExpression
	MemberAccess
	NamedEntity
	NameofExpression
	NullConditionalExpression
	ObjectCreationExpression
	PrefixExpression
	PointerElementAccess
	PointerMemberAccess
	PostExpression
	QueryExpression
	SimpleName
	SizeofExpression
	ThisAccess
	TypeExpression
	TypeofExpression
	UncheckedExpression
);
%hierarchy ElementAccess (
	NullConditionalElementAccess
);
%hierarchy InvocationExpression (
	NullConditionalInvocationExpression
);
%hierarchy MemberAccess (
	NullConditionalMemberAccess
);
%hierarchy Type (
	ArrayType
	NullableType
	PointerType
	QualifiedAliasMember
	SimpleType
	TypeName
	VarType
	VoidType
);

default <gt>
	: \>
	;
default <gtgt>
	: <gt> <gt>
	;
default <rightBrace>
	: \}
	;
<LineTerminator>
	: \r
	| \n
	| \r\n
#	| \x85
#	| \x2028
#	| \x2029
	;
default <comment>
	: \/\/ [^\r\n]*
	| (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
<Identifier>
	: (<isLetter> | _) (<isLetter> | <isDigit> | _)*
	| \@ (<isLetter> | _) (<isLetter> | <isDigit> | _)*
	;
<IntegerSuffix>
	: [Uu]
	| [Ll]
	| [Uu][Ll]
	| [Ll][Uu]
	;
default <IntegerLiteral>
	: \d+ <IntegerSuffix>?
	| 0[Xx] [0-9A-Fa-f]+ <IntegerSuffix>?
	;
<ExponentPart>
	: [Ee] [\+\-]? \d+
	;
<RealSuffix>
	: [Ff]
	| [Dd]
	| [Mm]
	;
default <RealLiteral>
	: \d* \. \d+ <ExponentPart>? <RealSuffix>?
	| \d+ <ExponentPart>? <RealSuffix>?
	| \d+ <RealSuffix>
	;
<SimpleEscapeSequence>
	: \\\'
	| \\\""
	| \\\\
	| \\0
	| \\a
	| \\b
	| \\f
	| \\n
	| \\r
	| \\t
	| \\v
	;
<HexadecimalEscapeSequence>
	: \\x [0-9A-Fa-f]{1,4}
	;
<UnicodeCharacterEscapeSequence>
	: \\[Uu] ([0-9A-Fa-f]{4,4}){1,2}
	;
<Character>
	: [^\'\\\n]
	| <SimpleEscapeSequence>
	| <HexadecimalEscapeSequence>
	| <UnicodeCharacterEscapeSequence>
	;
default <CharacterLiteral>
	: \' <Character> \'
	;
<SingleRegularStringLiteralCharacter>
	: [^\""\\\n]
	;
<RegularStringLiteralCharacter>
	: <SingleRegularStringLiteralCharacter>
	| <SimpleEscapeSequence>
	| <HexadecimalEscapeSequence>
	| <UnicodeCharacterEscapeSequence>
	;
<RegularStringLiteral>
	: \"" <RegularStringLiteralCharacter>* \""
	;
<InterpolatedSingleRegularStringLiteralCharacter>
	: [^\""\\\n\{]
	;
<InterpolatedRegularStringLiteralCharacter>
	: <InterpolatedSingleRegularStringLiteralCharacter>
	| <SimpleEscapeSequence>
	| <HexadecimalEscapeSequence>
	| <UnicodeCharacterEscapeSequence>
	| \{ \{
	;
default <InterpolatedRegularStringWhole>
	: \$\"" <InterpolatedRegularStringLiteralCharacter>* \""
	;
default <InterpolatedRegularStringStart>
	: \$\"" <InterpolatedRegularStringLiteralCharacter>* \{ 
	;
interpolatedString <InterpolatedRegularStringEnd>
	: \} <InterpolatedRegularStringLiteralCharacter>* \""
	;
interpolatedString <InterpolatedRegularStringMid>
	: \} <InterpolatedRegularStringLiteralCharacter>* \{
	;
<VerbatimStringLiteralCharacter>
	: [^\""]
	| \""\""
	;
<VerbatimStringLiteral>
	: \@\"" <VerbatimStringLiteralCharacter>* \""
	;
<InterpolatedVerbatimStringLiteralCharacter>
	: [^\""\{]
	| \""\""
	| \{ \{
	;
default <InterpolatedVerbatimStringLiteral>
	: \$\@\"" <InterpolatedVerbatimStringLiteralCharacter>* \""
	;
default <InterpolatedVerbatimStringStart>
	: \$\@\"" <InterpolatedVerbatimStringLiteralCharacter>* \{
	;
interpolatedVerbatimString <InterpolatedVerbatimStringEnd>
	: \} <InterpolatedVerbatimStringLiteralCharacter>* \""
	;
interpolatedVerbatimString <InterpolatedVerbatimStringMid>
	: \} <InterpolatedVerbatimStringLiteralCharacter>* \{
	;
default <StringLiteral>
	: <RegularStringLiteral>
	| <VerbatimStringLiteral>
	;
default <NullLiteral>
	: null
	;
default <whitespace>
	: \s+
	| \# [^\r\n]*
	;


<patternToken>
	: (\`  [^\`]* \`)+
	;

# B.2

# B.2.6 Namespaces
compilation_unit
	: _extern_alias_directives _using_directives _global_attributes _namespace_member_declarations {{}}
	;
namespace_declaration
	: ""namespace"" qualified_identifier 'identifier' namespace_body _semicolon {{}}
	;
qualified_identifier
	: <Identifier> 'name' {{}}
	| qualified_identifier ""."" <Identifier> 'name' {{}}
	;
namespace_body
	: ""{"" _extern_alias_directives _using_directives _namespace_member_declarations <rightBrace>
	;
_extern_alias_directives
	:
	| extern_alias_directives
	;
extern_alias_directives
	: extern_alias_directive 'directive'
	| extern_alias_directives extern_alias_directive 'directive'
	;
extern_alias_directive
	: ""extern"" ""alias"" <Identifier> "";"" {{}}
	;
_using_directives
	:
	| using_directives
	;
using_directives
	: using_directive 'directive'
	| using_directives using_directive 'directive'
	;
using_directive
	: using_alias_directive
	| using_namespace_directive
	| using_static_directive
	;
using_alias_directive
	: ""using"" <Identifier> 'name' ""="" namespace_or_type_name 'namespace' "";"" {{}}
	;
using_namespace_directive
	: ""using"" namespace_name 'namespace' "";"" {{}}
	;
using_static_directive
	: ""using"" ""static"" type_name 'namespace' "";"" {{}}
	;
_namespace_member_declarations
	: 
	| namespace_member_declarations
	;
namespace_member_declarations
	: namespace_member_declaration 'declaration'
	| namespace_member_declarations namespace_member_declaration 'declaration'
	;
namespace_member_declaration
	: namespace_declaration
	| type_declaration
	;
type_declaration
	: class_declaration
	| struct_declaration
	| interface_declaration
	| enum_declaration
	| delegate_declaration
	;
qualified_alias_member
	: <Identifier> 'global' ""::"" <Identifier> 'name' _type_argument_list 'typeArguments' {{}}
	;

# B.2.1
namespace_name
	: namespace_or_type_name
	;
type_name
	: namespace_or_type_name
	;
namespace_or_type_name
	: <Identifier> 'name' _type_argument_list 'typeArguments' {{TypeName}}
	| namespace_or_type_name 'namespace' ""."" <Identifier> 'name' _type_argument_list 'typeArguments' {{TypeName}}
	| qualified_alias_member 
	;

# B.2.2
_type
	:
	| type 'type'
	;
type
	: value_type
	| reference_type
	| type_parameter
	;
value_type
	: struct_type
	| enum_type
	;
struct_type
	: type_name
	| simple_type
	| nullable_type
	;
simple_type
	: numeric_type 'token' {{}}
	| ""bool"" 'token' {{}}
	;
numeric_type
	: integral_type
	| floating_point_type
	| ""decimal""
	;
integral_type
	: ""sbyte""
	| ""byte""
	| ""short""
	| ""ushort""
	| ""int""
	| ""uint""
	| ""long""
	| ""ulong""
	| ""char""
	;
floating_point_type
	: ""float""
	| ""double""
	;
nullable_type
	: non_nullable_value_type 'type' ""?"" {{}}
	;
non_nullable_value_type
	: type
	;
enum_type
	: type_name
	;
reference_type
	: class_type
	| interface_type
	| array_type
	| delegate_type
	;
class_type
	: type_name
	| ""object"" 'token' {{SimpleType}}
	| ""string"" 'token' {{SimpleType}}
	;
interface_type
	: type_name
	;
array_type
	: non_array_type 'type' rank_specifiers {{}}
	;
non_array_type
	: type
	;
_rank_specifiers
	: 
	| rank_specifiers
	;
rank_specifiers
	: rank_specifier 'rankSpecifier'
	| rank_specifiers rank_specifier 'rankSpecifier'
	;
rank_specifier
	: ""["" _dim_separators ""]"" {{}}
	;
_dim_separators
	: 
	| dim_separators
	;
dim_separators
	: "",""
	| dim_separators "",""
	;
delegate_type
	: type_name
	;
type_argument_list
	: ""<"" type_arguments <gt> 'greaterThanToken' {{}}
	;
type_arguments
	: type_argument 'type'
	| type_arguments "","" type_argument 'type'
	;
type_argument
	: type
	;

# B.2.3 Variables
variable_reference
	: expression
	;

# B.2.4 Expressions
_argument_list
	:
	| argument_list
	;

# B.2.4
argument_list
	: argument 'argument'
	| argument_list "","" argument 'argument'
	;
argument
	: _argument_name argument_value {{}}
	;
_argument_name
	:
	| argument_name
	;
argument_name
	: <Identifier> 'identifier' "":""
	;
argument_value
	: expression 'expression' 
	| ""ref"" variable_reference 'expression' 
	| ""out"" variable_reference 'expression'
	;
primary_expression
	: primary_no_array_creation_expression
	| array_creation_expression
	;
primary_no_array_creation_expression
	: literal 
    | interpolated_string_expression
	| simple_name 
	| parenthesized_expression 
	| member_access 
	| invocation_expression 
	| element_access 
	| this_access 
	| base_access 
	| post_increment_expression 
	| post_decrement_expression 
	| object_creation_expression 
	| delegate_creation_expression 
	| anonymous_object_creation_expression 
	| typeof_expression 
	| checked_expression 
	| unchecked_expression 
	| default_value_expression 
	| nameof_expression
	| anonymous_method_expression 
	;
interpolated_string_expression
	: interpolated_regular_string {{}}
	| interpolated_verbatim_string {{}}
	;
interpolated_regular_string
	: <InterpolatedRegularStringWhole> 'stringPart'
	| StartInterpolatedString <InterpolatedRegularStringStart> 'stringPart' interpolated_regular_string_body <InterpolatedRegularStringEnd> 'stringPart'
	;
StartInterpolatedString
	: {#interpolatedString}
	;
interpolated_regular_string_body
	: interpolation 'interpolation'
	| interpolation 'interpolation' <InterpolatedRegularStringMid> 'stringPart' interpolation 'interpolation'
	;
interpolation
	: expression 'expression' {{}}
	| expression 'expression' "","" constant_expression 'constant' {{}}
	;
interpolated_verbatim_string
	: <InterpolatedVerbatimStringLiteral> 'stringPart'
	| StartInterpolatedVerbatimString <InterpolatedVerbatimStringStart> 'stringPart' interpolated_verbatim_string_body <InterpolatedVerbatimStringEnd> 'stringPart'
	;
StartInterpolatedVerbatimString
	: {#interpolatedVerbatimString}
	;
interpolated_verbatim_string_body
	: interpolation 'interpolation'
	| interpolation 'interpolation' <InterpolatedVerbatimStringMid> 'stringPart' interpolation 'interpolation'
	;
simple_name
	: <Identifier> _type_argument_list 'typeArguments' {{}}
	;
_type_argument_list
	: 
	| type_argument_list
	;
parenthesized_expression
	: ""("" '_leftParen' expression "")"" '_rightParen' {{Expression}}
	;
member_access
	: primary_expression 'expression' ""."" <Identifier> 'identifier' _type_argument_list 'typeArguments' {{}}
	| predefined_type_expression 'expression' ""."" <Identifier> 'identifier' _type_argument_list 'typeArguments' {{}}
	| qualified_alias_member_expression 'expression' ""."" <Identifier> 'identifier' {{}}
	;
qualified_alias_member_expression
	: qualified_alias_member 'type' {{TypeExpression}}
	;
predefined_type_expression
	: predefined_type 'type' {{TypeExpression}}
	;
predefined_type
	: ""bool"" 'token' {{SimpleType}}
	| ""byte"" 'token' {{SimpleType}}
	| ""char"" 'token' {{SimpleType}}
	| ""decimal"" 'token' {{SimpleType}}
	| ""double"" 'token' {{SimpleType}}
	| ""float"" 'token' {{SimpleType}}
	| ""int"" 'token' {{SimpleType}}
	| ""long"" 'token' {{SimpleType}}
	| ""object"" 'token' {{SimpleType}}
	| ""sbyte"" 'token' {{SimpleType}}
	| ""short"" 'token' {{SimpleType}}
	| ""string"" 'token' {{SimpleType}}
	| ""uint"" 'token' {{SimpleType}}
	| ""ulong"" 'token' {{SimpleType}}
	| ""ushort"" 'token' {{SimpleType}}
	;
invocation_expression
	: primary_expression 'expression' ""("" _argument_list "")"" {{}}
	;
element_access
	: primary_no_array_creation_expression 'baseExpression' ""["" expression_list ""]"" {{}}
	;
expression_list
	: expression 'expression'
	| expression_list	"","" expression 'expression'
	;
this_access
	: ""this"" {{}}
	;
base_access
	: ""base"" ""."" <Identifier> 'identifier' {{}}
	| ""base"" ""["" expression_list ""]"" {{}}
	;
post_increment_expression
	: primary_expression 'expression' ""++"" 'operator' {{PostExpression}}
	;
post_decrement_expression
	: primary_expression 'expression' ""--"" 'operator' {{PostExpression}}
	;
object_creation_expression
	: ""new"" type 'type' ""("" _argument_list "")"" _object_or_collection_initializer 'initializer' {{}}
	| ""new"" type 'type' object_or_collection_initializer 'initializer' {{}}
	;
_object_or_collection_initializer
	:
	| object_or_collection_initializer
	;
object_or_collection_initializer
	: object_initializer
	| collection_initializer
	;
object_initializer
	: ""{"" _member_initializer_list <rightBrace> {{}}
	| ""{"" member_initializer_list "","" <rightBrace> {{}}
	;
_member_initializer_list
	: 
	| member_initializer_list
	;
member_initializer_list
	: member_initializer 'initializer'
	| member_initializer_list "","" member_initializer 'initializer'
	;
member_initializer
	: initializer_target ""="" initializer_value 'value' {{}}
	;
initializer_target
	: <Identifier> 'identifier'
	| ""["" argument_list ""]""
	;
initializer_value
	: expression
	| object_or_collection_initializer
	;
collection_initializer
	: ""{"" element_initializer_list <rightBrace> {{}}
	| ""{"" element_initializer_list "","" <rightBrace> {{}}
	;
element_initializer_list
	: element_initializer 'initializer'
	| element_initializer_list "","" element_initializer 'initializer'
	;
element_initializer
	: non_assignment_expression 'expression' {{}}
	| ""{"" expression_list <rightBrace> {{}}
	;
array_creation_expression
	: ""new"" non_array_type 'type' ""["" expression_list ""]"" _rank_specifiers _array_initializer 'arrayInitializer' {{}}
	| ""new"" array_type 'type' array_initializer 'arrayInitializer' {{}}
	| ""new"" rank_specifier 'rankSpecifier' array_initializer 'arrayInitializer' {{}}
	;
delegate_creation_expression
	: ""new"" delegate_type 'type' ""("" expression 'expression' "")"" {{}}
	;
anonymous_object_creation_expression
	: ""new"" anonymous_object_initializer {{}}
	;
anonymous_object_initializer
	: ""{"" _member_declarator_list <rightBrace>
	| ""{"" member_declarator_list "","" <rightBrace>
	;
_member_declarator_list
	: 
	| member_declarator_list
	;
member_declarator_list
	: member_declarator 'declarator'
	| member_declarator_list "","" member_declarator 'declarator'
	;
member_declarator
	: simple_name 'name' {{}}
	| member_access 'access' {{}}
	| base_access 'access' {{}}
	| null_conditional_member_access 'access' {{}}
	| <Identifier> ""="" expression 'value' {{}}
	;
typeof_expression
	: ""typeof"" ""("" type 'type' "")"" {{}}
	| ""typeof"" ""("" unbound_type_name 'type' "")"" {{}}
	| ""typeof"" ""("" void_type 'type' "")"" {{}}
	;
unbound_type_name
	: <Identifier> _generic_dimension_specifier {{}}
	| <Identifier> ""::"" <Identifier> _generic_dimension_specifier {{}}
	| unbound_type_name ""."" <Identifier> _generic_dimension_specifier {{}}
	;
_generic_dimension_specifier
	: 
	| generic_dimension_specifier
	;
generic_dimension_specifier
	: ""<"" _commas <gt>
	;
_commas
	: 
	| commas
	;
commas
	: "","" 'comma'
	| commas "","" 'comma'
	;
checked_expression
	: ""checked"" ""("" expression 'expression' "")"" {{}}
	;
unchecked_expression
	: ""unchecked"" ""("" expression 'expression' "")"" {{}}
	;
default_value_expression
	: ""default"" ""("" type 'type' "")"" {{}}
	;
nameof_expression
	: ""nameof"" ""("" named_entity 'name' "")"" {{}}
	;
named_entity
	: simple_name
	| named_entity_target 'target' ""."" <Identifier> _type_argument_list 'typeArguments' {{}}
	;
named_entity_target 
	: ""this"" {{ThisAccess}}
	| ""base"" {{BaseExpression}}
	| named_entity
	| predefined_type_expression
	| qualified_alias_member_expression
	;
unary_expression
	: primary_expression
	| null_conditional_expression
	| ""+"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| ""-"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| ""!"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| ""~"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| pre_increment_expression
	| pre_decrement_expression
	| cast_expression
	| await_expression
	;
null_conditional_expression
	: primary_expression 'expression' null_conditional_operations 'nullConditionalOperation' {{}}
	;
_null_conditional_operations
	:
	| null_conditional_operations
	;
null_conditional_operations
	: _null_conditional_operations 'baseOperations' ""?"" ""."" <Identifier> _type_argument_list 'typeArguments' {{NullConditionalMemberAccess}}
	| _null_conditional_operations 'baseOperations' ""?"" ""["" argument_list ""]"" {{NullConditionalElementAccess}}
	| null_conditional_operations 'baseOperations' ""."" <Identifier> _type_argument_list 'typeArguments' {{NullConditionalMemberAccess}}
	| null_conditional_operations 'baseOperations' ""["" argument_list ""]"" {{NullConditionalElementAccess}}
	| null_conditional_operations 'baseOperations' ""("" _argument_list "")"" {{NullConditionalInvocationExpression}}
	;
null_conditional_member_access
	: primary_expression 'expression' _null_conditional_operations 'baseOperations' ""?"" ""."" <Identifier> _type_argument_list 'typeArguments' {{}}
	| primary_expression 'expression' null_conditional_operations 'baseOperations' ""."" <Identifier> _type_argument_list 'typeArguments' {{}}
	;
null_conditional_invocation_expression
	: primary_expression 'expression' null_conditional_operations 'baseOperations' ""("" _argument_list "")"" {{}}
	;
pre_increment_expression
	: ""++"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	;
pre_decrement_expression
	: ""--"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	;
cast_expression
	: ""("" type 'type' "")"" unary_expression 'expression' {{}}
	;
await_expression
	: ""await"" unary_expression 'expression' {{}}
	;
multiplicative_expression
	: unary_expression
	| multiplicative_expression 'left' ""*"" 'operator' unary_expression 'right' {{BinaryExpression}}
	| multiplicative_expression 'left' ""/"" 'operator' unary_expression 'right' {{BinaryExpression}}
	| multiplicative_expression 'left' ""%"" 'operator' unary_expression 'right' {{BinaryExpression}}
	;
additive_expression
	: multiplicative_expression
	| additive_expression 'left' ""+"" 'operator' multiplicative_expression 'right' {{BinaryExpression}}
	| additive_expression 'left' ""-"" 'operator' multiplicative_expression 'right' {{BinaryExpression}}
	;
shift_expression
	: additive_expression
	| shift_expression 'left' ""<<"" 'operator' additive_expression 'right' {{BinaryExpression}}
	| shift_expression 'left' <gtgt> 'operator' additive_expression 'right' {{BinaryExpression}}
	;
relational_expression
	: shift_expression
	| relational_expression 'left' ""<"" 'operator' shift_expression 'right' {{BinaryExpression}}
	| relational_expression 'left' <gt> 'operator' shift_expression 'right' {{BinaryExpression}}
	| relational_expression 'left' ""<="" 'operator' shift_expression 'right' {{BinaryExpression}}
	| relational_expression 'left' "">="" 'operator' shift_expression 'right' {{BinaryExpression}}
	| relational_expression 'left' ""is"" 'operator' type 'right' {{BinaryExpression}}
	| relational_expression 'left' ""as"" 'operator' type 'right' {{BinaryExpression}}
	;
equality_expression
	: relational_expression
	| equality_expression 'left' ""=="" 'operator' relational_expression 'right' {{BinaryExpression}}
	| equality_expression 'left' ""!="" 'operator' relational_expression 'right' {{BinaryExpression}}
	;
and_expression
	: equality_expression
	| and_expression 'left' ""&"" 'operator' equality_expression 'right' {{BinaryExpression}}
	;
exclusive_or_expression
	: and_expression
	| exclusive_or_expression 'left' ""^"" 'operator' and_expression 'right' {{BinaryExpression}}
	;
inclusive_or_expression
	: exclusive_or_expression
	| inclusive_or_expression 'left' ""|"" 'operator' exclusive_or_expression 'right' {{BinaryExpression}}
	;
conditional_and_expression
	: inclusive_or_expression
	| conditional_and_expression 'left' ""&&"" 'operator' inclusive_or_expression 'right' {{BinaryExpression}}
	;
conditional_or_expression
	: conditional_and_expression
	| conditional_or_expression 'left' ""||"" 'operator' conditional_and_expression 'right' {{BinaryExpression}}
	;
null_coalescing_expression
	: conditional_or_expression
	| conditional_or_expression 'left' ""??"" 'operator' null_coalescing_expression 'right' {{BinaryExpression}}
	;
conditional_expression
	: null_coalescing_expression
	| null_coalescing_expression 'booleanExpression' ""?"" expression 'trueExpression' "":"" expression 'falseExpression' {{}}
	;
lambda_expression
	: anonymous_function_signature 'signature' ""=>"" anonymous_function_body 'body' {{}}
	;
anonymous_method_expression
	: ""delegate"" _explicit_anonymous_function_signature 'signature' block 'block' {{}}
	;
anonymous_function_signature
	: explicit_anonymous_function_signature
	| implicit_anonymous_function_signature
	;
_explicit_anonymous_function_signature
	:
	| explicit_anonymous_function_signature
	;
explicit_anonymous_function_signature
	: ""("" _explicit_anonymous_function_paramenter_list "")"" {{}}
	;
_explicit_anonymous_function_paramenter_list
	: 
	| explicit_anonymous_function_paramenter_list
	;
explicit_anonymous_function_paramenter_list
	: explicit_anonymous_function_paramenter 'parameter'
	| explicit_anonymous_function_paramenter_list "","" explicit_anonymous_function_paramenter 'parameter'
	;
explicit_anonymous_function_paramenter
	: _anonymous_function_parameter_modifier type 'type' <Identifier> 'name' {{AnonymousFunctionParameter}}
	;
_anonymous_function_parameter_modifier
	: 
	| anonymous_function_parameter_modifier 'modifier'
	;
anonymous_function_parameter_modifier
	: ""ref""
	| ""out""
	;
implicit_anonymous_function_signature
	: ""("" _implicit_anonymous_function_parameter_list "")"" {{}}
	| implicit_anonymous_function_parameter 'name' {{}}
	;
_implicit_anonymous_function_parameter_list
	: 
	| implicit_anonymous_function_parameter_list
	;
implicit_anonymous_function_parameter_list
	: implicit_anonymous_function_parameter 'name'
	| implicit_anonymous_function_parameter_list "","" implicit_anonymous_function_parameter 'name'
	;
implicit_anonymous_function_parameter
	: <Identifier>
	;
anonymous_function_body
	: expression
	| block
	;
query_expression
	: from_clause query_body {{}}
	;
from_clause
	: ""from"" _type <Identifier> ""in"" expression 'expression'
	;
query_body
	: _query_body_clauses select_or_group_clause _query_continuation
	;
_query_body_clauses
	: 
	| query_body_clauses
	;
query_body_clauses
	: query_body_clause
	| query_body_clauses query_body_clause
	;
query_body_clause
	: from_clause
	| let_clause
	| where_clause
	| join_clause
	| join_into_clause
	| orderby_clause
	;
let_clause
	: ""let"" <Identifier> ""="" expression 'expression'
	;
where_clause
	: ""where"" boolean_expression 'expression'
	;
join_clause
	: ""join"" _type <Identifier> ""in"" expression 'joinInExpression'""on"" expression 'joinOnExpression' ""equals"" expression 'joinEqualsExpression'
	;
join_into_clause
	: ""join"" _type <Identifier> ""in"" expression 'joinInExpression' ""on"" expression 'joinOnExpression' ""equals"" expression 'joinEqualsExpression' ""into"" <Identifier>
	;
orderby_clause
	: ""orderby"" orderings
	;
orderings
	: ordering
	| orderings "","" ordering
	;
ordering
	: expression 'expression' _ordering_direction
	;
_ordering_direction
	: 
	| ordering_direction
	;
ordering_direction
	: ""ascending""
	| ""descending""
	;
select_or_group_clause
	: select_clause
	| group_clause
	;
select_clause
	: ""select"" expression 'expression'
	;
group_clause
	: ""group"" expression 'groupExpression' ""by"" expression 'groupByExpression'
	;
_query_continuation
	: 
	| query_continuation
	;
query_continuation
	: ""into"" <Identifier> query_body
	;
assignment
	: unary_expression 'lhs' assignment_operator 'operator' expression 'rhs' {{}}
	;
assignment_operator
	: ""=""
	| ""+=""
	| ""-=""
	| ""*=""
	| ""/=""
	| ""%=""
	| ""&=""
	| ""|=""
	| ""^=""
	| ""<<=""
	| "">>=""
	;
_expression
	:
	| expression 'expression'
	;
expression
	: non_assignment_expression 
	| assignment 
	;
non_assignment_expression
	: conditional_expression 
	| lambda_expression 
	| query_expression 
	;
constant_expression
	: expression
	;
boolean_expression
	: expression
	;

# B.2.5 Statements
statement
	: labeled_statement
	| declaration_statement
	| embedded_statement
	;
embedded_statement
	: block
	| empty_statement
	| expression_statement
	| selection_statement
	| iteration_statement
	| jump_statement
	| try_statement
	| checked_statement
	| unchecked_statement
	| lock_statement
	| using_statement
	| yield_statement
	;
block
	: ""{"" _statement_list <rightBrace> {{BlockStatement}}
	;
_statement_list
	: 
	| statement_list
	;
statement_list
	: statement 'statement'
	| statement_list statement 'statement'
	;
empty_statement
	: "";"" {{}}
	;
labeled_statement
	: <Identifier> "":"" statement 'statement' {{}}
	;
declaration_statement
	: local_variable_declaration 'declaration' "";"" {{}}
	| local_constant_declaration 'declaration' "";"" {{}}
	;
local_variable_declaration
	: local_variable_type 'type' local_variable_declarators {{}}
	;
local_variable_type
	: type
	| ""var"" {{VarType}}
	;
local_variable_declarators
	: local_variable_declarator 'declarator'
	| local_variable_declarators "","" local_variable_declarator 'declarator'
	;
local_variable_declarator
#	: <Identifier> 'name' {{}}
#	| <Identifier> 'name' ""="" local_variable_initializer 'expression' {{}}
	: _local_variable_declarator_name 'name' {{}}
	| _local_variable_declarator_name 'name' ""="" local_variable_initializer 'expression' {{}}
	;
_local_variable_declarator_name	# Here to create a parse node
	: <Identifier> {{SimpleName}}
	;
local_variable_initializer
	: expression
	| array_initializer
	;
local_constant_declaration
	: ""const"" type 'type' const_declarators {{}}
	;
const_declarators
	: const_declarator 'declarator' 
	| const_declarators "","" const_declarator 'declarator'
	;
const_declarator
	: <Identifier> 'name' ""="" constant_expression 'expression' {{}}
	;
expression_statement
	: statement_expression 'expression' "";"" {{}}
	;
statement_expression
	: invocation_expression
	| null_conditional_invocation_expression
	| object_creation_expression
	| assignment
	| post_increment_expression
	| post_decrement_expression
	| pre_increment_expression
	| pre_decrement_expression
	| await_expression
	;
selection_statement
	: if_statement
	| switch_statement
	;
if_statement
	: ""if"" ""("" boolean_expression 'expression' "")"" embedded_statement 'thenStatement' {{}}
	| ""if"" ""("" boolean_expression 'expression' "")"" embedded_statement 'thenStatement' ""else"" embedded_statement 'elseStatement' {{}}
	;
switch_statement
	: ""switch"" ""("" expression 'expression' "")"" switch_block {{}}
	;
switch_block
	: ""{"" _switch_sections <rightBrace>
	;
_switch_sections
	:
	| switch_sections
	;
switch_sections
	: switch_section 'section'
	| switch_sections switch_section 'section'
	;
switch_section
	: switch_labels statement_list {{}}
	;
switch_labels
	: switch_label 'label'
	| switch_labels switch_label 'label'
	;
switch_label
	: ""case"" constant_expression 'expression' "":"" {{}}
	| ""default"" "":"" {{}}
	;
iteration_statement
	: while_statement
	| do_statement
	| for_statement
	| foreach_statement
	;
while_statement
	: ""while"" ""("" boolean_expression 'expression' "")"" embedded_statement 'statement' {{}}
	;
do_statement
	: ""do"" embedded_statement 'statement' ""while"" ""("" boolean_expression 'expression' "")"" "";"" {{}}
	;
for_statement
	: ""for"" ""("" _for_initializer "";"" _for_condition "";"" _for_iterator "")"" embedded_statement 'statement' {{}}
	;
_for_initializer
	: 
	| for_initializer 'initializer'
	;
for_initializer
	: local_variable_declaration
	| statement_expression_list {{StatementList}}
	;
_for_condition
	:
	| for_condition 'condition'
	;
for_condition
	: boolean_expression
	;
_for_iterator
	: 
	| for_iterator 'iterator'
	;
for_iterator
	: statement_expression_list {{StatementList}}
	;
statement_expression_list
	: statement_expression 'expression'
	| statement_expression_list "","" statement_expression 'expression'
	;
foreach_statement
	: ""foreach"" ""("" local_variable_type 'type' <Identifier> 'name' ""in"" expression 'expression' "")"" embedded_statement 'statement' {{}}
	;
jump_statement
	: break_statement
	| continue_statement
	| goto_statement
	| return_statement
	| throw_statement
	;
break_statement
	: ""break"" "";"" {{}}
	;
continue_statement
	: ""continue"" "";"" {{}}
	;
goto_statement
	: ""goto"" <Identifier> "";"" {{}}
	| ""goto"" ""case"" constant_expression 'expression' "";"" {{}}
	| ""goto"" ""default"" "";"" {{}}
	;
return_statement
	: ""return"" _expression "";"" {{}}
	;
throw_statement
	: ""throw"" _expression "";"" {{}}
	;
try_statement
	: ""try"" block 'block' catch_clauses {{}}
	| ""try"" block 'block' finally_clause 'finally' {{}}
	| ""try"" block 'block' catch_clauses finally_clause 'finally' {{}}
	;
catch_clauses
	: catch_clause 'clause'
	| catch_clauses catch_clause 'clause'
	;
catch_clause
	: ""catch"" _exception_specifier _exception_filter block 'block' {{}}
	;
_exception_specifier
	:
	| exception_specifier
	;
exception_specifier
	: ""("" type 'type' _identifier "")""
	;
_exception_filter
	:
	| exception_filter 'filter'
	;
exception_filter
	: ""when"" ""("" expression 'expression' "")"" {{}}
	;
finally_clause
	: ""finally"" block 'block' {{}}
	;
checked_statement
	: ""checked"" block 'block' {{}}
	;
unchecked_statement
	: ""unchecked"" block 'block' {{}}
	;
lock_statement
	: ""lock"" ""("" expression 'expression' "")"" embedded_statement 'statement' {{}}
	;
using_statement
	: ""using"" ""("" resource_acquisition 'expression' "")"" embedded_statement 'statement' {{}}
	;
resource_acquisition
	: local_variable_declaration
	| expression
	;
yield_statement
	: ""yield"" ""return"" expression 'expression' "";"" {{}}
	| ""yield"" ""break"" "";"" {{}}
	;


# B.2.7 Classes
class_declaration
	: _attributes _class_modifiers _partial ""class"" <Identifier> 'name' _type_parameter_list _class_base _type_parameter_constraints_clauses class_body _semicolon {{}}
	;
_class_modifiers
	:
	| class_modifiers
	;
class_modifiers
	: class_modifier 'modifier'
	| class_modifiers class_modifier 'modifier'
	;
class_modifier
	: ""new"" 
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""abstract""
	| ""sealed""
	| ""static""
	;
_type_parameter_list
	: 
	| type_parameter_list 'typeParameters'
	;
type_parameter_list
	: ""<"" 'lessThan' type_parameters <gt> 'greaterThan' {{}}
	;
type_parameters
	: _attributes type_parameter 'parameter'
	| type_parameters "","" _attributes type_parameter 'parameter'
	;
type_parameter
	: <Identifier> 'name'  {{TypeName}}
	;
_class_base
	: 
	| class_base
	;
class_base
	: "":"" class_type 'supertype'
	| "":"" interface_type_list
	| "":"" class_type 'supertype' "","" interface_type_list
	;
interface_type_list
	: interface_type 'supertype'
	| interface_type_list "","" 'comma' interface_type 'supertype'
	;
_type_parameter_constraints_clauses
	: 
	| type_parameter_constraints_clauses
	;
type_parameter_constraints_clauses
	: type_parameter_constraints_clause 'constraintClause'
	| type_parameter_constraints_clauses type_parameter_constraints_clause 'constraintClause'
	;
type_parameter_constraints_clause
	: ""where"" 'whereToken' type_parameter 'parameter' "":"" 'colon' type_parameter_constraints {{}}
	;
type_parameter_constraints
	: primary_constraint  'constraint'
	| secondary_constraints
	| constructor_constraint 'constraint'
	| primary_constraint 'constraint' "","" secondary_constraints
	| primary_constraint 'constraint' "","" constructor_constraint 'constraint'
	| secondary_constraints "","" constructor_constraint 'constraint'
	| primary_constraint 'constraint' "","" secondary_constraints "","" constructor_constraint 'constraint'
	;
primary_constraint
	: class_type 'type' {{TypeConstraint}}
	| ""class"" {{}}
	| ""struct"" {{}}
	;
secondary_constraints
	: interface_type_constraint 'constraint'
	| type_parameter 'constraint'
	| secondary_constraints "","" interface_type_constraint 'constraint'
	| secondary_constraints "","" type_parameter 'constraint'
	;
## added Interface_type_constraint
interface_type_constraint
	: interface_type 'type' {{TypeConstraint}}
	;
constructor_constraint
	: ""new"" ""("" "")"" {{}}
	;
class_body
	: ""{"" _class_member_declarations <rightBrace>
	;
_class_member_declarations
	: 
	| class_member_declarations
	;
class_member_declarations
	: class_member_declaration 'declaration'
	| class_member_declarations class_member_declaration 'declaration'
	;
class_member_declaration
	: constant_declaration
	| field_declaration
	| method_declaration
	| property_declaration
	| event_declaration
	| indexer_declaration
	| operator_declaration
	| constructor_declaration
	| destructor_declaration
	| static_constructor_declaration
	| type_declaration
	;
constant_declaration
	: _attributes _constant_modifiers ""const"" type 'type' constant_declarators "";"" {{}}
	;
_constant_modifiers
	: 
	| constant_modifers
	;
constant_modifers
	: constant_modifer 'modifier'
	| constant_modifers constant_modifer 'modifier'
	;
constant_modifer
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;
constant_declarators
	: constant_declarator 'declarator'
	| constant_declarators "","" constant_declarator 'declarator'
	;
constant_declarator
	: <Identifier> ""="" constant_expression 'expression' {{}}
	;
field_declaration
	: _attributes _field_modifiers type 'type' variable_declarators "";"" {{}}
	;
_field_modifiers
	: 
	| field_modifiers
	;
field_modifiers
	: field_modifier 'modifier'
	| field_modifiers field_modifier 'modifier'
	;
field_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""static""
	| ""readonly""
	| ""volatile""
	;
variable_declarators
	: variable_declarator 'declarator'
	| variable_declarators "","" variable_declarator 'declarator'
	;
variable_declarator
	: <Identifier> {{}}
	| <Identifier> ""="" variable_initializer 'initializer' {{}}
	;
variable_initializer
	: expression
	| array_initializer
	;
method_declaration
	: method_header 'header' method_body 'body' {{}}
	;
method_header
	: _attributes _method_modifiers _partial return_type 'returnType' member_name _type_parameter_list ""("" _formal_parameters_list "")"" _type_parameter_constraints_clauses {{}}
	;
_method_modifiers
	: 
	| method_modifiers
	;
method_modifiers
	: method_modifier 'modifier'
	| method_modifiers method_modifier 'modifier'
	;
method_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""static""
	| ""virtual""
	| ""sealed""
	| ""override""
	| ""abstract""
	| ""extern""
	;
return_type
	: type
	| void_type
	;
member_name
	: <Identifier> 'name'
	| interface_type 'interface' ""."" <Identifier> 'name'
	;
method_body
	: block 'block' {{}}
	| ""=>"" expression 'expression' "";"" {{}}
	| "";"" {{}}
	;
_formal_parameters_list
	: 
	| formal_parameters_list
	;
formal_parameters_list
	: fixed_parameters
	| fixed_parameters "","" 'comma' parameter_array 'parameter'
	| parameter_array 'parameter'
	;
fixed_parameters
	: fixed_parameter 'parameter'
	| fixed_parameters "","" 'comma' fixed_parameter 'parameter'
	;
fixed_parameter
	: _attributes _parameter_modifier type 'type' <Identifier> 'name' _default_argument {{FixedParameter}}
	;
_default_argument
	:
	| default_argument
	;
default_argument
	: ""="" expression 'expression'
	;
_parameter_modifier
	:
	| parameter_modifier 'modifier'
	;
parameter_modifier
	: ""ref"" 
	| ""out""
	| ""this""
	;
parameter_array
	: _attributes ""params"" 'paramsToken' array_type 'type' <Identifier> 'name' {{ArrayParameter}}
	;
property_declaration
	: _attributes _property_modifiers type 'type' member_name property_body {{}}
	;
_property_modifiers
	:
	| property_modifiers
	;
property_modifiers
	: property_modifier 'modifier'
	| property_modifiers property_modifier 'modifier'
	;
property_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""static""
	| ""virtual""
	| ""sealed""
	| ""override""
	| ""abstract""
	| ""extern""
	;
property_body
	: ""{"" accessor_declarations <rightBrace> _property_initializer
	| ""=>"" expression 'expression'
	;
_property_initializer
	:
	| property_initializer
	;
property_initializer
	: ""="" variable_initializer 'initializer'
	;
accessor_declarations
	: get_accessor_declaration 'getAccessor' _set_accessor_declaration 'setAccessor'
	| set_accessor_declaration 'setAccessor' _get_accessor_declaration 'getAccessor'
	;
_get_accessor_declaration
	:
	| get_accessor_declaration
	;
get_accessor_declaration
	: _attributes _accessor_modifiers ""get"" accessor_body {{}}
	;
_set_accessor_declaration
	:
	| set_accessor_declaration
	;
set_accessor_declaration
	: _attributes _accessor_modifiers ""set"" accessor_body {{}}
	;
_accessor_modifiers
	:
	| accessor_modifiers
	;
accessor_modifiers
	: ""protected"" 'modifier'
	| ""internal"" 'modifier'
	| ""private"" 'modifier'
	| ""protected"" 'modifier' ""internal"" 'modifier'
	| ""internal"" 'modifier' ""protected"" 'modifier'
	;
accessor_body
	: block 'body'
	| "";""
	;
event_declaration
	: _attributes _event_modifiers ""event"" type 'type' variable_declarators "";"" {{}}
	| _attributes _event_modifiers ""event"" type 'type' member_name ""{"" event_accessor_declarations <rightBrace> {{}}
	;
_event_modifiers
	:
	| event_modifiers
	;
event_modifiers
	: event_modifier 'modifier'
	| event_modifiers event_modifier 'modifier'
	;
event_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""static""
	| ""virtual""
	| ""sealed""
	| ""override""
	| ""abstract""
	| ""extern""
	;
event_accessor_declarations
	: add_accessor_declaration 'addDeclaration' remove_accessor_declaration 'removeDeclaration'
	| remove_accessor_declaration 'removeDeclaration' add_accessor_declaration 'addDeclaration'
	;
add_accessor_declaration
	: _attributes ""add"" block 'block' {{}}
	;
remove_accessor_declaration
	: _attributes ""remove"" block 'block' {{}}
	;
indexer_declaration
	: _attributes _indexer_modifiers indexer_declarator indexer_body {{}}
	;
_indexer_modifiers
	:
	| indexer_modifiers
	;
indexer_modifiers
	: indexer_modifier 'modifier'
	| indexer_modifiers indexer_modifier 'modifier'
	;
indexer_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""virtual""
	| ""sealed""
	| ""override""
	| ""abstract""
	| ""extern""
	;
indexer_declarator
	: type 'returnType' ""this"" ""["" formal_parameters_list ""]""
	| type 'returnType' interface_type 'type' ""."" ""this"" ""["" formal_parameters_list ""]""
	;
indexer_body
	: ""{"" accessor_declarations <rightBrace>
	| ""=>"" expression 'expression' "";""
	;
operator_declaration
	: _attributes operator_modifiers operator_declarator operator_body 'body' {{}}
	;
operator_modifiers
	: operator_modifier 'modifier'
	| operator_modifiers operator_modifier 'modifier'
	;
operator_modifier
	: ""public""
	| ""static""
	| ""extern""
	;
operator_declarator
	: unary_operator_declarator
	| binary_operator_declarator
	| conversion_operator_declarator
	;
unary_operator_declarator
	: type 'returnType' ""operator"" overloadable_unary_operator 'operator' ""("" type 'type' <Identifier> 'argument' "")""
	;
overloadable_unary_operator
	: ""+""
	| ""-""
	| ""!""
	| ""~""
	| ""++""
	| ""--""
	| ""true""
	| ""false""
	;
binary_operator_declarator
	: type 'returnType' ""operator"" overloadable_binary_operator 'operator' ""("" type 'type' <Identifier> 'argument' "","" type 'type' <Identifier> 'argument' "")""
	;
overloadable_binary_operator
	: ""+""
	| ""-""
	| ""*""
	| ""/""
	| ""%""
	| ""&""
	| ""|""
	| ""^""
	| ""<<""
	| <gtgt>
	| ""==""
	| ""!=""
	| <gt>
	| ""<""
	| "">=""
	| ""<=""
	;
conversion_operator_declarator
	: ""implicit"" ""operator"" type 'returnType' ""("" type 'type' <Identifier> 'argument' "")""
	| ""explicit"" ""operator"" type 'returnType' ""("" type 'type' <Identifier> 'argument' "")""
	;
operator_body
	: block 'block' {{MethodBody}}
	| ""=>"" expression 'expression' "";"" {{MethodBody}}
	| "";"" {{MethodBody}}
	;
constructor_declaration
	: _attributes _constructor_modifiers constructor_declarator constructor_body {{}}
	;
_constructor_modifiers
	: 
	| constructor_modifiers
	;
constructor_modifiers
	: constructor_modifier 'modifier'
	| constructor_modifiers constructor_modifier 'modifier'
	;
constructor_modifier
	: ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""extern""
	;
constructor_declarator
	: <Identifier> ""("" _formal_parameters_list "")"" _constructor_initializer
	;
_constructor_initializer
	: 
	| constructor_initializer 'initializer'
	;
constructor_initializer
	: "":"" ""base"" ""("" _argument_list "")"" {{}}
	| "":"" ""this"" ""("" _argument_list "")"" {{}}
	;
constructor_body
	: block 'block'
	| "";""
	;
static_constructor_declaration
	: _attributes static_constructor_modifiers <Identifier> ""("" "")"" static_constructor_body {{}}
	;
# redefined in the unsafe section
static_constructor_modifiers
	: _extern ""static""
	| ""static"" _extern
	;
static_constructor_body
	: block 'block'
	| "";""
	;
# redefined in the unsafe section
#destructor_declaration
#	: _attributes _extern ""~"" <Identifier> ""("" "")"" destructor_body
#	;
#destructor_body
#	: block
#	| "";""
#	;

# B.2.8 Structs
struct_declaration
	: _attributes _struct_modifiers _partial ""struct"" <Identifier> _type_parameter_list _struct_interfaces _type_parameter_constraints_clauses struct_body _semicolon {{}}
	;
_struct_modifiers
	: 
	| struct_modifiers
	;
struct_modifiers
	: struct_modifier 'modifier'
	| struct_modifiers struct_modifier 'modifier'
	;
struct_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;
_struct_interfaces
	:
	| struct_interfaces
	;
struct_interfaces
	: "":"" interface_type_list
	;
struct_body
	: ""{"" _struct_member_declarations <rightBrace>
	;
_struct_member_declarations
	: 
	| struct_member_declarations
	;
struct_member_declarations
	: struct_member_declaration 'declaration'
	| struct_member_declarations struct_member_declaration 'declaration'
	;
struct_member_declaration
	: constant_declaration
	| field_declaration
	| method_declaration
	| property_declaration
	| event_declaration
	| indexer_declaration
	| operator_declaration
	| constructor_declaration
	| static_constructor_declaration
	| type_declaration
	;

# B.2.9 Arrays
_array_initializer
	:
	| array_initializer
	;
array_initializer
	: ""{"" _variable_initializer_list <rightBrace> {{}}
	| ""{"" variable_initializer_list "","" <rightBrace> {{}}
	;
_variable_initializer_list
	:
	| variable_initializer_list
	;
variable_initializer_list
	: variable_initializer 'initializer'
	| variable_initializer_list "","" variable_initializer 'initializer'
	;
variable_initializer
	: expression
	| array_initializer
	;

# B.2.10 Interfaces
interface_declaration
	: _attributes _interface_modifiers _partial ""interface"" 'interfaceToken' <Identifier> 'name' _variant_type_parameter_list _interface_base _type_parameter_constraints_clauses interface_body _semicolon {{}}
	;
_interface_modifiers
	:
	| interface_modifiers
	;
interface_modifiers
	: interface_modifier 'modifier'
	| interface_modifiers interface_modifier 'modifier'
	;
interface_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;
_variant_type_parameter_list
	:
	| variant_type_parameter_list 'typeParameters'
	;
variant_type_parameter_list
	: ""<"" 'lessThan' variant_type_parameters <gt> 'greaterThan' {{}}
	;
variant_type_parameters
	: _attributes _variance_annotation type_parameter 'parameter'
	| variant_type_parameters "","" _attributes _variance_annotation type_parameter 'parameter'
	;
_variance_annotation
	:
	| variance_annotation 'annotation'
	;
variance_annotation
	: ""in""
	| ""out""
	;
_interface_base
	: 
	| interface_base
	;
interface_base
	: "":"" 'colon' interface_type_list
	;
interface_body
	: ""{"" 'leftBrace' _interface_member_declarations <rightBrace> 'rightBrace'
	;
_interface_member_declarations
	:
	| interface_member_declarations
	;
interface_member_declarations
	: interface_member_declaration 'declaration'
	| interface_member_declarations interface_member_declaration 'declaration'
	;
interface_member_declaration
	: interface_method_declaration
	| interface_property_declaration
	| interface_event_declaration
	| interface_indexer_declaration
	;
interface_method_declaration
	: _attributes _new 'modifier' return_type 'type' <Identifier> 'name' _type_parameter_list ""("" 'leftParen' _formal_parameters_list "")"" 'rightParen' _type_parameter_constraints_clauses "";"" 'semicolon' {{}}
	;
interface_property_declaration
	: _attributes _new 'modifier' type 'type' <Identifier> 'name' ""{"" 'leftBrace' interface_accessors <rightBrace> 'rightBrace' {{}}
	;
interface_accessors	#This was changed to use the interface_(g/s)et_accessor
	: interface_get_accessor 'getAccessor'
	| interface_set_accessor 'setAccessor'
	| interface_get_accessor 'getAccessor' interface_set_accessor 'setAccessor'
	| interface_set_accessor 'setAccessor' interface_get_accessor 'getAccessor'
	;
interface_get_accessor
	: _attributes ""get"" 'accessorType' "";"" 'semicolon' {{InterfacePropertyAccessor}}
	;
interface_set_accessor
	: _attributes ""set"" 'accessorType' "";"" 'semicolon' {{InterfacePropertyAccessor}}
	;
interface_event_declaration
	: _attributes _new 'modifier' ""event"" 'eventToken' type 'type' <Identifier> 'name' "";"" 'semicolon' {{}}
	;
interface_indexer_declaration
	: _attributes _new 'modifier' type 'type' ""this"" 'thisToken' ""["" 'leftBracket' formal_parameters_list ""]"" 'rightBracket' ""{"" 'leftBrace' interface_accessors <rightBrace> 'rightBrace' {{}}
	;

# B.2.11 Enums
enum_declaration
	: _attributes _enum_modifers ""enum"" 'enumToken' <Identifier> 'name' _enum_base enum_body _semicolon {{}}
	;
_enum_base
	:
	| enum_base
	;
enum_base
	: "":"" integral_type 'type'
	;
enum_body
	: ""{"" 'leftBrace' _enum_member_declarations <rightBrace> 'rightBrace'
	| ""{"" 'leftBrace' enum_member_declarations "","" 'comma' <rightBrace> 'rightBrace'
	;
_enum_modifers
	:
	| enum_modifers
	;
enum_modifers
	: enum_modifer 'modifier'
	| enum_modifers enum_modifer 'modifier'
	;
enum_modifer
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;
_enum_member_declarations
	:
	| enum_member_declarations
	;
enum_member_declarations
	: enum_member_declaration 'declaration'
	| enum_member_declarations "","" 'comma' enum_member_declaration 'declaration'
	;
enum_member_declaration
	: _attributes <Identifier> 'name' {{EnumDeclaration}}
	| _attributes <Identifier> 'name' ""="" 'equal' constant_expression 'value' {{EnumDeclaration}}
	;

# B.2.12 Delegates
delegate_declaration
	: _attributes _delegate_modifiers ""delegate"" 'delegateToken' return_type 'type' <Identifier> 'name' _variant_type_parameter_list ""("" 'leftParen' _formal_parameters_list "")"" 'rightParen' _type_parameter_constraints_clauses "";"" 'semicolon' {{}}
	;
_delegate_modifiers
	:
	| delegate_modifiers
	;
delegate_modifiers
	: delegate_modifier 'modifier'
	| delegate_modifiers delegate_modifier 'modifier'
	;
delegate_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;

# B.2.13 Attributes
_global_attributes
	:
	| global_attributes
	;
global_attributes
	: global_attribute_sections
	;
global_attribute_sections
	: global_attribute_section 'attribute'
	| global_attribute_sections global_attribute_section 'attribute'
	;
global_attribute_section
	: ""["" 'leftBracket' global_attribute_target_specifier attribute_list ""]"" 'rightBracket' {{Attribute}}
	| ""["" 'leftBracket' global_attribute_target_specifier attribute_list "","" 'comma' ""]"" 'rightBracket' {{Attribute}}
	;
global_attribute_target_specifier
	: global_attribute_target 'target' "":"" 'colon'
	;
global_attribute_target
	: ""assembly""
	| ""module""
	;
_attributes
	:
	| attributes
	;
attributes
	: attribute_sections
	;
attribute_sections
	: attribute_section 'attribute'
	| attribute_sections attribute_section 'attribute'
	;
attribute_section
	: ""["" 'leftBracket' _attribute_target_specifier attribute_list ""]"" 'rightBracket' {{Attribute}}
	| ""["" 'leftBracket' _attribute_target_specifier attribute_list "","" 'comma' ""]"" 'rightBracket' {{Attribute}}
	;
_attribute_target_specifier
	: 
	| attribute_target_specifier
	;
attribute_target_specifier
	: attribute_target 'target' "":"" 'colon'
	;
attribute_target
	: ""field""
	| ""event""
	| ""method""
	| ""param""
	| ""property""
	| ""return""
	| ""type""
	;
attribute_list
	: attribute 'attributeValue'
	| attribute_list "","" 'comma' attribute 'attributeValue'
	;
attribute
	: attribute_name 'name' _attribute_arguments {{AttributeValue}}
	;
attribute_name
	: type_name
	;
_attribute_arguments
	: 
	| attribute_arguments
	;
attribute_arguments
	: ""("" 'leftParen' _positional_argument_list "")"" 'rightParen'
	| ""("" 'leftParen' positional_argument_list "","" 'comma' named_argument_list "")"" 'rightParen'
	| ""("" 'leftParen' named_argument_list "")"" 'rightParen'
	;
_positional_argument_list
	:
	| positional_argument_list
	;
positional_argument_list
	: positional_argument 'argument'
	| positional_argument_list "","" 'comma' positional_argument 'argument'
	;
positional_argument
	: attribute_argument_expression
	;
named_argument_list
	: named_argument 'argument'
	| named_argument_list "","" 'comma' named_argument 'argument'
	;
named_argument
	: <Identifier> 'name' ""="" 'equal' attribute_argument_expression 'value' {{NamedArgument}}
	;
attribute_argument_expression
	: expression
	;

# B.1.8 Literals
literal
	: boolean_literal 'token' {{LiteralExpression}}
	| <IntegerLiteral> 'token' {{LiteralExpression}}
	| <RealLiteral> 'token' {{LiteralExpression}}
	| <CharacterLiteral> 'token' {{LiteralExpression}}
	| <StringLiteral> 'token' {{LiteralExpression}}
	| <NullLiteral> 'token' {{LiteralExpression}}
	;
boolean_literal
	: ""true""
	| ""false""
	;

# Misc
_semicolon
	:
	| "";"" 'semicolon'
	;
_new
	:
	| ""new""
	;
_partial
	:
	| ""partial"" 'partialToken'
	;
_extern
	:
	| ""extern"" 'modifier'
	;
_identifier
	:
	| <Identifier> 'name'
	;

# B.3 Unsafe code
class_modifier
	: ""unsafe""
	;
struct_modifier
	: ""unsafe""
	;
interface_modifier
	: ""unsafe""
	;
delegate_modifier
	: ""unsafe""
	;
field_modifier
	: ""unsafe""
	;
method_modifier
	: ""unsafe""
	;
property_modifier
	: ""unsafe""
	;
event_modifier
	: ""unsafe""
	;
indexer_modifier
	: ""unsafe""
	;
operator_modifier
	: ""unsafe""
	;
constructor_modifier
	: ""unsafe""
	;
destructor_declaration	# Changed from destructor_body to method_body since they are the same
	: _attributes _extern _unsafe ""~"" <Identifier> ""("" "")"" method_body 'body' {{}}
	| _attributes _unsafe _extern ""~"" <Identifier> ""("" "")"" method_body 'body' {{}}
	;
_unsafe
	:
	| ""unsafe"" 'modifier'
	;
static_constructor_modifiers
	: _extern _unsafe ""static""
	| _unsafe _extern ""static""
	| _extern ""static"" ""unsafe""
	| _unsafe ""static"" _extern
	| ""static"" _extern _unsafe
	| ""static"" _unsafe _extern
	;
embedded_statement
	: unsafe_statement
	;
unsafe_statement
	: ""unsafe"" block 'block' {{UnsafeStatement}}
	;
type
	: pointer_type
	;
pointer_type
	: unmanaged_type 'type' ""*"" {{}}
	| void_type 'type' ""*"" {{}}
	;
unmanaged_type
	: type
	;
primary_no_array_creation_expression
	: pointer_member_access
	| pointer_element_access
	| sizeof_expression
	;
unary_expression
	: pointer_indirection_expression
	| addressof_expression
	;
pointer_indirection_expression
	: ""*"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	;
pointer_member_access
	: primary_expression 'expression' ""->"" 'arrowToken' <Identifier> 'name' {{}}
	;
pointer_element_access
	: primary_no_array_creation_expression 'expression' ""["" expression 'indexExpression' ""]"" {{}}
	;
addressof_expression
	: ""&"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	;
sizeof_expression
	: ""sizeof"" ""("" unmanaged_type 'type' "")"" {{}}
	;
embedded_statement
	: fixed_statement
	;
fixed_statement
	: ""fixed"" ""("" pointer_type 'type' fixed_pointer_declarators "")"" embedded_statement 'statement' {{}}
	;
fixed_pointer_declarators
	: fixed_pointer_declarator 'declarator'
	| fixed_pointer_declarators "","" fixed_pointer_declarator 'declarator'
	;
fixed_pointer_declarator
	: <Identifier> ""="" fixed_pointer_initializer {{}}
	;
fixed_pointer_initializer
	: ""&"" variable_reference 'expression'
	| expression 'expression'
	;
struct_member_declaration
	: fixed_size_buffer_declaration
	;
fixed_size_buffer_declaration
	: _attributes _fixed_size_buffer_modifiers ""fixed"" buffer_element_type 'type' fixed_size_buffer_declarators "";"" {{}}
	;
_fixed_size_buffer_modifiers
	: 
	| fixed_size_buffer_modifiers
	;
fixed_size_buffer_modifiers
	: fixed_size_buffer_modifier 'modifier'
	| fixed_size_buffer_modifiers fixed_size_buffer_modifier 'modifier'
	;
fixed_size_buffer_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""unsafe""
	;
buffer_element_type
	: type
	;
fixed_size_buffer_declarators
	: fixed_size_buffer_declarator 'declarator'
	| fixed_size_buffer_declarators fixed_size_buffer_declarator 'declarator'
	;
fixed_size_buffer_declarator
	: <Identifier> 'name' ""["" constant_expression 'expression' ""]"" {{}}
	;
local_variable_initializer
	: stackalloc_initializer
	;
stackalloc_initializer
	: ""stackalloc"" unmanaged_type 'type' ""["" expression 'expression' ""]"" {{}}
	;
# Additions
void_type
	: ""void"" {{}}
	;"
]

{ #category : #'file types' }
CSharpParser class >> fileExtension [
	^ '.cs'
]

{ #category : #'file types' }
CSharpParser class >> fileExtensionType [
	^ 'C# files'
]

{ #category : #private }
CSharpParser class >> keywords [
	^ keywords
		ifNil:
			[ keywords := #('abstract' 'as' 'base' 'bool' 'break' 'byte' 'case' 'catch' 'char' 'checked' 'class' 'const' 'continue' 'decimal' 'default' 'delegate' 'do' 'double' 'else' 'enum' 'event' 'explicit' 'extern' 'false' 'finally' 'fixed' 'float' 'for' 'foreach' 'goto' 'if' 'implicit' 'in' 'int' 'interface' 'internal' 'is' 'lock' 'long' 'namespace' 'new' 'null' 'object' 'operator' 'out' 'override' 'params' 'private' 'protected' 'public' 'readonly' 'ref' 'return' 'sbyte' 'sealed' 'short' 'sizeof' 'stackalloc' 'static' 'string' 'struct' 'switch' 'this' 'throw' 'true' 'try' 'typeof' 'uint' 'ulong' 'unchecked' 'unsafe' 'ushort' 'using' 'virtual' 'void' 'volatile' 'while')
				asSet ]
]

{ #category : #accessing }
CSharpParser class >> parseBlock: aString onError: aBlock [
	^ self
		parse: aString
		startingAt: self startingStateForblock
		onError: aBlock
]

{ #category : #'generated-accessing' }
CSharpParser class >> scannerClass [
	^CSharpScanner
]

{ #category : #generated }
CSharpParser class >> startingStateForblock [
	^ 5
]

{ #category : #generated }
CSharpParser class >> startingStateForclass_member_declaration [
	^ 6
]

{ #category : #generated }
CSharpParser class >> startingStateForcompilation_unit [
	^ 1
]

{ #category : #generated }
CSharpParser class >> startingStateForexpression [
	^ 4
]

{ #category : #generated }
CSharpParser class >> startingStateFornamespace_member_declaration [
	^ 2
]

{ #category : #generated }
CSharpParser class >> startingStateForstatement [
	^ 3
]

{ #category : #private }
CSharpParser >> actionsForCurrentToken [
	| actions |
	actions := super actionsForCurrentToken.
	actions isEmpty
		ifTrue: [ (currentToken ids includes: scanner rightBraceId)
				ifTrue: [ | i scannerState stackItem |
					i := nodeStack size.
					scannerState := nil.
					[ i > 0 and: [ scannerState isNil ] ]
						whileTrue: [ stackItem := nodeStack at: i.
							(stackItem = #interpolatedString or: [ stackItem = #interpolatedVerbatimString ])
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
							^ self actionsForCurrentToken ] ].
			(currentToken ids includes: scanner gtgtId)
				ifTrue: [ currentToken := currentToken class value: '>' start: currentToken startPosition ids: (Array with: scanner gtId).
					self position: currentToken startPosition.
					actions := super actionsForCurrentToken ] ].
	^ actions
]

{ #category : #generated }
CSharpParser >> ambiguousTransitions [
^#(
#[ 0 46 0 58 0 62] 
#[ 0 134 0 138] 
#[ 0 154 0 158] 
#[ 0 162 0 166 0 170 0 174 0 178] 
#[ 0 182 6 13] 
#[ 0 222 6 57] 
#[ 1 6 1 10] 
#[ 0 149 1 14] 
#[ 0 157 1 14] 
#[ 0 161 1 14] 
#[ 0 177 1 14] 
#[ 0 193 1 14] 
#[ 0 205 1 14] 
#[ 0 225 1 14] 
#[ 0 233 1 14] 
#[ 0 245 1 14] 
#[ 0 253 1 14] 
#[ 1 1 1 14] 
#[ 1 9 1 14] 
#[ 1 14 1 37] 
#[ 1 14 1 41] 
#[ 1 14 1 53] 
#[ 1 14 1 65] 
#[ 1 14 4 213] 
#[ 1 18 5 73] 
#[ 0 134 6 1] 
#[ 0 214 0 218] 
#[ 1 98 1 102 1 106 1 110] 
#[ 1 122 7 129] 
#[ 0 46 0 58 0 62 1 110] 
#[ 1 122 1 126 7 165] 
#[ 1 126 7 169] 
#[ 1 122 1 126] 
#[ 1 98 1 102 1 106 1 110 1 130] 
#[ 1 134 8 49] 
#[ 1 166 1 170 1 174 1 178 1 182] 
#[ 1 166 1 178 1 182] 
#[ 1 166 1 170 1 178 1 182] 
#[ 0 134 0 138 1 22] 
#[ 0 134 0 138 6 1] 
#[ 0 210 9 229] 
#[ 0 210 9 245] 
#[ 2 58 2 62] 
#[ 2 70 5 145] 
#[ 2 78 10 109] 
#[ 2 94 2 98] 
#[ 2 94 10 153] 
#[ 1 166 2 210 2 214 2 218 2 222] 
#[ 2 210 2 214 2 218] 
#[ 2 210 2 214 2 218 2 222] 
#[ 1 166 2 214] 
#[ 1 166 2 210 2 214 2 222] 
#[ 2 210 2 214 2 218 2 226] 
#[ 2 210 2 214 2 218 2 222 2 226 2 230] 
#[ 2 210 2 214 2 218 2 222 2 230] 
#[ 2 210 2 214 2 222 2 226 2 234] 
#[ 2 210 2 214 2 218 2 222 2 226 2 230 2 234] 
#[ 2 210 2 214 2 218 2 226 2 230] 
#[ 2 210 2 214 2 218 2 238] 
#[ 1 166 1 170 1 174 1 178 1 182 2 210 2 214 2 218 2 222 2 230 2 238 2 242] 
#[ 1 166 1 170 1 174 1 178 1 182 2 210 2 214 2 218 2 222 2 238 2 242] 
#[ 1 166 1 178 1 182 2 214] 
#[ 1 166 2 210 2 214 2 222 2 238] 
#[ 1 166 1 170 1 178 1 182 2 210 2 214 2 218 2 222 2 230 2 238] 
#[ 2 210 2 214 2 218 2 230 2 238] 
#[ 1 166 1 170 1 178 1 182 2 210 2 214 2 218 2 222 2 238] 
#[ 2 210 2 214 2 222] 
#[ 2 210 2 214 2 218 2 226 2 238] 
#[ 1 166 1 170 1 174 1 178 1 182 2 210 2 214 2 218 2 222 2 226 2 230 2 238 2 242] 
#[ 1 166 2 210 2 214 2 222 2 226 2 238] 
#[ 1 166 1 170 1 178 1 182 2 210 2 214 2 218 2 222 2 226 2 230 2 238] 
#[ 2 210 2 214 2 218 2 226 2 230 2 238] 
#[ 2 210 2 214 2 226 2 238] 
#[ 1 122 2 210 2 214 2 222 2 226 11 133] 
#[ 1 126 1 166 2 210 2 214 2 222 2 226 2 238 11 137] 
#[ 1 122 1 126 2 210 2 214 2 226 2 238] 
#[ 2 210 2 214 2 218 2 222 2 226 2 230 2 246] 
#[ 1 166 2 210 2 214 2 222 2 226 2 238 2 246] 
#[ 1 122 13 13] 
#[ 1 126 13 21] 
#[ 3 66 8 49] 
#[ 0 186 0 194] 
#[ 0 134 0 138 4 10] 
#[ 0 134 4 10] 
#[ 3 130 14 213] 
#[ 0 190 4 102] 
#[ 0 194 4 102] 
#[ 4 158 15 73] 
#[ 1 122 4 174] 
#[ 6 1 6 18] 
#[ 0 134 18 61] 
#[ 6 142 18 161] 
#[ 5 145 6 178] 
#[ 7 50 7 54] 
#[ 5 145 7 194] 
#[ 1 26 1 238] 
#[ 1 238 6 77] 
#[ 1 238 6 81] 
#[ 1 238 6 85] 
#[ 1 238 6 89] 
#[ 1 238 6 93] 
#[ 1 238 6 97] 
#[ 1 238 6 101] 
#[ 1 238 6 105] 
#[ 1 238 6 109] 
#[ 1 238 6 113] 
#[ 1 238 6 117] 
#[ 0 181 8 174] 
#[ 0 166 0 174] 
#[ 1 126 23 157] 
#[ 1 166 1 170 1 174 1 178 1 182 2 210 2 214 2 218 2 222 2 230 2 238 2 242 10 34] 
#[ 1 166 1 170 1 174 1 178 1 182 2 210 2 214 2 218 2 222 2 238 2 242 10 34] 
#[ 1 166 1 170 1 178 1 182 2 210 2 214 2 218 2 222 2 230 2 238 10 34] 
#[ 1 166 1 170 1 178 1 182 2 210 2 214 2 218 2 222 2 238 10 34] 
#[ 1 166 1 170 1 174 1 178 1 182 2 210 2 214 2 218 2 222 2 226 2 230 2 238 2 242 10 34] 
#[ 1 166 1 170 1 178 1 182 2 210 2 214 2 218 2 222 2 226 2 230 2 238 10 34] 
#[ 5 30 24 77]
	).
]

{ #category : #private }
CSharpParser >> performReduceMethod: aSymbol with: items [
	^ (states size > 1 and: [ items isEmpty and: [ aSymbol beginsWith: 'reduceActionForStartInterpolated' ] ])
		ifTrue: [ self perform: aSymbol with: items ]
		ifFalse: [ super performReduceMethod: aSymbol with: items ]
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForStartInterpolatedString1: nodes [
	^ #interpolatedString
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForStartInterpolatedVerbatimString1: nodes [
	^ #interpolatedVerbatimString
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_attribute_arguments1: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_attribute_arguments2: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 4).
	result at: 2 put: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_attribute_target_specifier1: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_class_base1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_exception_specifier1: nodes [
	| result |
	result := Array new: 4.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_explicit_anonymous_function_paramenter_list1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_extern_alias_directives1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_extern_alias_directives2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_generic_dimension_specifier1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_local_variable_declarator_name1: nodes [
	| result |
	result := CSSimpleNameNode new.
	result identifierToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_query_body_clauses1: nodes [
	| result |
	result := Array new: 19.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_query_continuation1: nodes [
	| result |
	result := Array new: 24.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_struct_interfaces1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForaccessor_declarations2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	result at: 1 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForaccessor_modifiers5: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForadd_accessor_declaration1: nodes [
	| result |
	result := CSAddAccessorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addToken: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForanonymous_method_expression1: nodes [
	| result |
	result := CSAnonymousMethodExpressionNode new.
	result delegateToken: (nodes at: 1).
	result signature: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForanonymous_object_creation_expression1: nodes [
	| result |
	result := CSAnonymousObjectCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result leftBraceToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result declarators.
	result addTokens: ((nodes at: 2) at: 3) to: result commaTokens.
	result rightBraceToken: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForanonymous_object_initializer1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForanonymous_object_initializer2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForargument1: nodes [
	| result |
	result := CSArgumentNode new.
	result identifier: ((nodes at: 1) at: 1).
	result colonToken: ((nodes at: 1) at: 2).
	result expression: ((nodes at: 2) at: 1).
	result refToken: ((nodes at: 2) at: 2).
	result outToken: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForargument_value1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForargument_value2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (nodes at: 1).
	result at: 1 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForargument_value3: nodes [
	| result |
	result := Array new: 3.
	result at: 3 put: (nodes at: 1).
	result at: 1 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_creation_expression1: nodes [
	| result |
	result := CSArrayCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result rankSpecifiers.
	result arrayInitializer: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_creation_expression2: nodes [
	| result |
	result := CSArrayCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result arrayInitializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_creation_expression3: nodes [
	| result |
	result := CSArrayCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result addNode: (nodes at: 2) to: result rankSpecifiers.
	result arrayInitializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_initializer1: nodes [
	| result |
	result := CSArrayInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_initializer2: nodes [
	| result |
	result := CSArrayInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: (nodes at: 3) to: result commaTokens.
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_type1: nodes [
	| result |
	result := CSArrayTypeNode new.
	result type: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result rankSpecifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForassignment1: nodes [
	| result |
	result := CSAssignmentNode new.
	result lhs: (nodes at: 1).
	result operator: (nodes at: 2).
	result rhs: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute1: nodes [
	| result |
	result := CSAttributeValueNode new.
	result name: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result rightParen: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 2) at: 3) to: result arguments.
	result addTokens: ((nodes at: 2) at: 4) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute_arguments2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute_section1: nodes [
	| result |
	result := CSAttributeNode new.
	result leftBracket: (nodes at: 1).
	result target: ((nodes at: 2) at: 1).
	result colon: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result attributeValues.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute_section2: nodes [
	| result |
	result := CSAttributeNode new.
	result leftBracket: (nodes at: 1).
	result target: ((nodes at: 2) at: 1).
	result colon: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result attributeValues.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result addToken: (nodes at: 4) to: result commas.
	result rightBracket: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute_target_specifier1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForawait_expression1: nodes [
	| result |
	result := CSAwaitExpressionNode new.
	result awaitToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForbase_access1: nodes [
	| result |
	result := CSBaseAccessNode new.
	result baseToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifier: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForbase_access2: nodes [
	| result |
	result := CSBaseAccessNode new.
	result baseToken: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForbinary_operator_declarator1: nodes [
	| result |
	result := Array new: 8.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	self add: (nodes at: 5) to: (result at: 5).
	self add: (nodes at: 6) to: (result at: 6).
	result at: 7 put: (nodes at: 7).
	self add: (nodes at: 8) to: (result at: 5).
	self add: (nodes at: 9) to: (result at: 6).
	result at: 8 put: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForblock1: nodes [
	| result |
	result := CSBlockStatementNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForbreak_statement1: nodes [
	| result |
	result := CSBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcast_expression1: nodes [
	| result |
	result := CSCastExpressionNode new.
	result leftParenToken: (nodes at: 1).
	result type: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	result expression: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcatch_clause1: nodes [
	| result |
	result := CSCatchClauseNode new.
	result catchToken: (nodes at: 1).
	result leftParenToken: ((nodes at: 2) at: 1).
	result type: ((nodes at: 2) at: 2).
	result name: ((nodes at: 2) at: 3).
	result rightParenToken: ((nodes at: 2) at: 4).
	result filter: (nodes at: 3).
	result block: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForchecked_expression1: nodes [
	| result |
	result := CSCheckedExpressionNode new.
	result checkedToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForchecked_statement1: nodes [
	| result |
	result := CSCheckedStatementNode new.
	result checkedToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForclass_base1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForclass_base2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForclass_base3: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	result at: 4 put: (nodes at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForclass_declaration1: nodes [
	| result |
	result := CSClassDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result partialToken: (nodes at: 3).
	result classToken: (nodes at: 4).
	result name: (nodes at: 5).
	result typeParameters: (nodes at: 6).
	result colonToken: ((nodes at: 7) at: 1).
	result addNodes: ((nodes at: 7) at: 2) to: result supertypes.
	result addTokens: ((nodes at: 7) at: 3) to: result commas.
	result commaToken: ((nodes at: 7) at: 4).
	result addNodes: (nodes at: 8) to: result constraintClauses.
	result leftBraceToken: ((nodes at: 9) at: 1).
	result addNodes: ((nodes at: 9) at: 2) to: result declarations.
	result rightBraceToken: ((nodes at: 9) at: 3).
	result semicolon: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcollection_initializer1: nodes [
	| result |
	result := CSCollectionInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcollection_initializer2: nodes [
	| result |
	result := CSCollectionInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: (nodes at: 3) to: result commaTokens.
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcompilation_unit1: nodes [
	| result |
	result := CSCompilationUnitNode new.
	result addNodes: (nodes at: 1) to: result directives.
	result addNodes: (nodes at: 2) to: result directives.
	result addNodes: (nodes at: 3) to: result _attributes.
	result addNodes: (nodes at: 4) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconditional_expression2: nodes [
	| result |
	result := CSConditionalExpressionNode new.
	result booleanExpression: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result trueExpression: (nodes at: 3).
	result colonToken: (nodes at: 4).
	result falseExpression: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconst_declarator1: nodes [
	| result |
	result := CSConstDeclaratorNode new.
	result name: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstant_declaration1: nodes [
	| result |
	result := CSConstantDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result constToken: (nodes at: 3).
	result type: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result declarators.
	result addTokens: ((nodes at: 5) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstant_declarator1: nodes [
	| result |
	result := CSConstantDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_constraint1: nodes [
	| result |
	result := CSConstructorConstraintNode new.
	result newToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_declaration1: nodes [
	| result |
	result := CSConstructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result identifierToken: ((nodes at: 3) at: 1).
	result leftParenToken: ((nodes at: 3) at: 2).
	result addNodes: ((nodes at: 3) at: 3) to: result parameters.
	result addTokens: ((nodes at: 3) at: 4) to: result commas.
	result rightParenToken: ((nodes at: 3) at: 5).
	result initializer: ((nodes at: 3) at: 6).
	result block: ((nodes at: 4) at: 1).
	result semicolonToken: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_declarator1: nodes [
	| result |
	result := Array new: 6.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	result at: 5 put: (nodes at: 4).
	result at: 6 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_initializer1: nodes [
	| result |
	result := CSConstructorInitializerNode new.
	result colonToken: (nodes at: 1).
	result baseToken: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_initializer2: nodes [
	| result |
	result := CSConstructorInitializerNode new.
	result colonToken: (nodes at: 1).
	result thisToken: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcontinue_statement1: nodes [
	| result |
	result := CSContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconversion_operator_declarator1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconversion_operator_declarator2: nodes [
	| result |
	result := Array new: 8.
	result at: 8 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordeclaration_statement1: nodes [
	| result |
	result := CSDeclarationStatementNode new.
	result declaration: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordefault_value_expression1: nodes [
	| result |
	result := CSDefaultValueExpressionNode new.
	result defaultToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordelegate_creation_expression1: nodes [
	| result |
	result := CSDelegateCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result expression: (nodes at: 4).
	result rightParenToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordelegate_declaration1: nodes [
	| result |
	result := CSDelegateDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result delegateToken: (nodes at: 3).
	result type: (nodes at: 4).
	result name: (nodes at: 5).
	result typeParameters: (nodes at: 6).
	result leftParen: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result parameters.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParen: (nodes at: 9).
	result addNodes: (nodes at: 10) to: result constraintClauses.
	result semicolon: (nodes at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordestructor_declaration1: nodes [
	| result |
	result := CSDestructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addToken: (nodes at: 2) to: result modifiers.
	result addToken: (nodes at: 3) to: result modifiers.
	result tildeToken: (nodes at: 4).
	result identifierToken: (nodes at: 5).
	result leftParenToken: (nodes at: 6).
	result rightParenToken: (nodes at: 7).
	result body: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordo_statement1: nodes [
	| result |
	result := CSDoStatementNode new.
	result doToken: (nodes at: 1).
	result statement: (nodes at: 2).
	result whileToken: (nodes at: 3).
	result leftParenToken: (nodes at: 4).
	result expression: (nodes at: 5).
	result rightParenToken: (nodes at: 6).
	result semicolonToken: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForelement_access1: nodes [
	| result |
	result := CSElementAccessNode new.
	result baseExpression: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForelement_initializer1: nodes [
	| result |
	result := CSElementInitializerNode new.
	result addNode: (nodes at: 1) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForelement_initializer2: nodes [
	| result |
	result := CSElementInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForempty_statement1: nodes [
	| result |
	result := CSEmptyStatementNode new.
	result semicolonToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForenum_declaration1: nodes [
	| result |
	result := CSEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result enumToken: (nodes at: 3).
	result name: (nodes at: 4).
	result colonToken: ((nodes at: 5) at: 1).
	result type: ((nodes at: 5) at: 2).
	result leftBrace: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result rightBrace: ((nodes at: 6) at: 4).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForenum_member_declaration1: nodes [
	| result |
	result := CSEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForenum_member_declaration2: nodes [
	| result |
	result := CSEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result name: (nodes at: 2).
	result equal: (nodes at: 3).
	result value: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForevent_declaration1: nodes [
	| result |
	result := CSEventDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result eventToken: (nodes at: 3).
	result type: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result declarators.
	result addTokens: ((nodes at: 5) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForevent_declaration2: nodes [
	| result |
	result := CSEventDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result eventToken: (nodes at: 3).
	result type: (nodes at: 4).
	result name: ((nodes at: 5) at: 1).
	result interface: ((nodes at: 5) at: 2).
	result periodToken: ((nodes at: 5) at: 3).
	result leftBraceToken: (nodes at: 6).
	result addDeclaration: ((nodes at: 7) at: 1).
	result removeDeclaration: ((nodes at: 7) at: 2).
	result rightBraceToken: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForexception_filter1: nodes [
	| result |
	result := CSExceptionFilterNode new.
	result whenToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForexplicit_anonymous_function_paramenter1: nodes [
	| result |
	result := CSAnonymousFunctionParameterNode new.
	result modifier: (nodes at: 1).
	result type: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForexplicit_anonymous_function_signature1: nodes [
	| result |
	result := CSExplicitAnonymousFunctionSignatureNode new.
	result leftParenToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result parameters.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForexpression_statement1: nodes [
	| result |
	result := CSExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForextern_alias_directive1: nodes [
	| result |
	result := CSExternAliasDirectiveNode new.
	result externToken: (nodes at: 1).
	result aliasToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForextern_alias_directives1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForextern_alias_directives2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfield_declaration1: nodes [
	| result |
	result := CSFieldDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result type: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result declarators.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfinally_clause1: nodes [
	| result |
	result := CSFinallyClauseNode new.
	result finallyToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_parameter1: nodes [
	| result |
	result := CSFixedParameterNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result equalToken: ((nodes at: 5) at: 1).
	result expression: ((nodes at: 5) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_pointer_declarator1: nodes [
	| result |
	result := CSFixedPointerDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result andToken: ((nodes at: 3) at: 1).
	result expression: ((nodes at: 3) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_size_buffer_declaration1: nodes [
	| result |
	result := CSFixedSizeBufferDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result fixedToken: (nodes at: 3).
	result type: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result declarators.
	result semicolonToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_size_buffer_declarator1: nodes [
	| result |
	result := CSFixedSizeBufferDeclaratorNode new.
	result name: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_statement1: nodes [
	| result |
	result := CSFixedStatementNode new.
	result fixedToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result declarators.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	result statement: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfor_initializer2: nodes [
	| result |
	result := CSStatementListNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result expressions.
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfor_statement1: nodes [
	| result |
	result := CSForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result initializer: (nodes at: 3).
	result addToken: (nodes at: 4) to: result semicolonTokens.
	result condition: (nodes at: 5).
	result addToken: (nodes at: 6) to: result semicolonTokens.
	result iterator: (nodes at: 7).
	result rightParenToken: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForforeach_statement1: nodes [
	| result |
	result := CSForeachStatementNode new.
	result foreachToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result inToken: (nodes at: 5).
	result expression: (nodes at: 6).
	result rightParenToken: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfrom_clause1: nodes [
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
CSharpParser >> reduceActionForgeneric_dimension_specifier1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForget_accessor_declaration1: nodes [
	| result |
	result := CSGetAccessorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result getToken: (nodes at: 3).
	result body: ((nodes at: 4) at: 1).
	result semicolonToken: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForgoto_statement1: nodes [
	| result |
	result := CSGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result identifierToken: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForgoto_statement2: nodes [
	| result |
	result := CSGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result caseToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForgoto_statement3: nodes [
	| result |
	result := CSGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result defaultToken: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForif_statement1: nodes [
	| result |
	result := CSIfStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result thenStatement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForif_statement2: nodes [
	| result |
	result := CSIfStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result thenStatement: (nodes at: 5).
	result elseToken: (nodes at: 6).
	result elseStatement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForimplicit_anonymous_function_signature1: nodes [
	| result |
	result := CSImplicitAnonymousFunctionSignatureNode new.
	result leftParenToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForimplicit_anonymous_function_signature2: nodes [
	| result |
	result := CSImplicitAnonymousFunctionSignatureNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_body1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_body2: nodes [
	| result |
	result := Array new: 7.
	result at: 5 put: (nodes at: 1).
	result at: 6 put: (nodes at: 2).
	result at: 7 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_declaration1: nodes [
	| result |
	result := CSIndexerDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result returnType: ((nodes at: 3) at: 1).
	result thisToken: ((nodes at: 3) at: 2).
	result leftBracketToken: ((nodes at: 3) at: 3).
	result addNodes: ((nodes at: 3) at: 4) to: result parameters.
	result addTokens: ((nodes at: 3) at: 5) to: result commas.
	result rightBracketToken: ((nodes at: 3) at: 6).
	result type: ((nodes at: 3) at: 7).
	result periodToken: ((nodes at: 3) at: 8).
	result leftBraceToken: ((nodes at: 4) at: 1).
	result getAccessor: ((nodes at: 4) at: 2).
	result setAccessor: ((nodes at: 4) at: 3).
	result rightBraceToken: ((nodes at: 4) at: 4).
	result equalGreaterThanToken: ((nodes at: 4) at: 5).
	result expression: ((nodes at: 4) at: 6).
	result semicolonToken: ((nodes at: 4) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_declarator1: nodes [
	| result |
	result := Array new: 8.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 5).
	result at: 6 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_declarator2: nodes [
	| result |
	result := Array new: 8.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 7 put: (nodes at: 2).
	result at: 8 put: (nodes at: 3).
	result at: 2 put: (nodes at: 4).
	result at: 3 put: (nodes at: 5).
	self addAll: ((nodes at: 6) at: 1) to: (result at: 4).
	self addAll: ((nodes at: 6) at: 2) to: (result at: 5).
	result at: 6 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinitializer_target1: nodes [
	| result |
	result := Array new: 5.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinitializer_target2: nodes [
	| result |
	result := Array new: 5.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	result at: 5 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_declaration1: nodes [
	| result |
	result := CSInterfaceDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result partialToken: (nodes at: 3).
	result interfaceToken: (nodes at: 4).
	result name: (nodes at: 5).
	result typeParameters: (nodes at: 6).
	result colon: ((nodes at: 7) at: 1).
	result addNodes: ((nodes at: 7) at: 2) to: result supertypes.
	result addTokens: ((nodes at: 7) at: 3) to: result commas.
	result addNodes: (nodes at: 8) to: result constraintClauses.
	result leftBrace: ((nodes at: 9) at: 1).
	result addNodes: ((nodes at: 9) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 9) at: 3).
	result semicolon: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_event_declaration1: nodes [
	| result |
	result := CSInterfaceEventDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result eventToken: (nodes at: 3).
	result type: (nodes at: 4).
	result name: (nodes at: 5).
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_get_accessor1: nodes [
	| result |
	result := CSInterfacePropertyAccessorNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result accessorType: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_indexer_declaration1: nodes [
	| result |
	result := CSInterfaceIndexerDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result thisToken: (nodes at: 4).
	result leftBracket: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result parameters.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result rightBracket: (nodes at: 7).
	result leftBrace: (nodes at: 8).
	result getAccessor: ((nodes at: 9) at: 1).
	result setAccessor: ((nodes at: 9) at: 2).
	result rightBrace: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_method_declaration1: nodes [
	| result |
	result := CSInterfaceMethodDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result typeParameters: (nodes at: 5).
	result leftParen: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result parameters.
	result addTokens: ((nodes at: 7) at: 2) to: result commas.
	result rightParen: (nodes at: 8).
	result addNodes: (nodes at: 9) to: result constraintClauses.
	result semicolon: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_property_declaration1: nodes [
	| result |
	result := CSInterfacePropertyDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result leftBrace: (nodes at: 5).
	result getAccessor: ((nodes at: 6) at: 1).
	result setAccessor: ((nodes at: 6) at: 2).
	result rightBrace: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_regular_string1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_regular_string2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 2) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self add: ((nodes at: 3) at: 2) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_regular_string_body1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_regular_string_body2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_string_expression1: nodes [
	| result |
	result := CSInterpolatedStringExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result stringParts.
	result addNodes: ((nodes at: 1) at: 2) to: result interpolations.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolation1: nodes [
	| result |
	result := CSInterpolationNode new.
	result expression: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolation2: nodes [
	| result |
	result := CSInterpolationNode new.
	result expression: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result constant: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinvocation_expression1: nodes [
	| result |
	result := CSInvocationExpressionNode new.
	result expression: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForjoin_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	result at: 8 put: (nodes at: 8).
	result at: 9 put: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForjoin_into_clause1: nodes [
	| result |
	result := Array new: 10.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	result at: 8 put: (nodes at: 8).
	result at: 9 put: (nodes at: 9).
	result at: 10 put: (nodes at: 10).
	self add: (nodes at: 11) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlabeled_statement1: nodes [
	| result |
	result := CSLabeledStatementNode new.
	result identifierToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlambda_expression1: nodes [
	| result |
	result := CSLambdaExpressionNode new.
	result signature: (nodes at: 1).
	result equalGreaterThanToken: (nodes at: 2).
	result body: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlet_clause1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForliteral2: nodes [
	| result |
	result := CSLiteralExpressionNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_constant_declaration1: nodes [
	| result |
	result := CSLocalConstantDeclarationNode new.
	result constToken: (nodes at: 1).
	result type: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result declarators.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_declaration1: nodes [
	| result |
	result := CSLocalVariableDeclarationNode new.
	result type: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result declarators.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_declarator1: nodes [
	| result |
	result := CSLocalVariableDeclaratorNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_declarator2: nodes [
	| result |
	result := CSLocalVariableDeclaratorNode new.
	result name: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_declarators2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_type2: nodes [
	| result |
	result := CSVarTypeNode new.
	result varToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlock_statement1: nodes [
	| result |
	result := CSLockStatementNode new.
	result lockToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_access1: nodes [
	| result |
	result := CSMemberAccessNode new.
	result expression: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifier: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_access3: nodes [
	| result |
	result := CSMemberAccessNode new.
	result expression: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifier: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_declarator1: nodes [
	| result |
	result := CSMemberDeclaratorNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_declarator2: nodes [
	| result |
	result := CSMemberDeclaratorNode new.
	result access: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_declarator5: nodes [
	| result |
	result := CSMemberDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_initializer1: nodes [
	| result |
	result := CSMemberInitializerNode new.
	result identifier: ((nodes at: 1) at: 1).
	result leftBracketToken: ((nodes at: 1) at: 2).
	result addNodes: ((nodes at: 1) at: 3) to: result arguments.
	result addTokens: ((nodes at: 1) at: 4) to: result commaTokens.
	result rightBracketToken: ((nodes at: 1) at: 5).
	result equalToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_name2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (nodes at: 1).
	result at: 3 put: (nodes at: 2).
	result at: 1 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_body1: nodes [
	| result |
	result := CSMethodBodyNode new.
	result block: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_body2: nodes [
	| result |
	result := CSMethodBodyNode new.
	result equalGreaterThanToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_body3: nodes [
	| result |
	result := CSMethodBodyNode new.
	result semicolonToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_declaration1: nodes [
	| result |
	result := CSMethodDeclarationNode new.
	result header: (nodes at: 1).
	result body: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_header1: nodes [
	| result |
	result := CSMethodHeaderNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result partialToken: (nodes at: 3).
	result returnType: (nodes at: 4).
	result name: ((nodes at: 5) at: 1).
	result interface: ((nodes at: 5) at: 2).
	result periodToken: ((nodes at: 5) at: 3).
	result typeParameters: (nodes at: 6).
	result leftParenToken: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result parameters.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParenToken: (nodes at: 9).
	result addNodes: (nodes at: 10) to: result constraintClauses.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormultiplicative_expression4: nodes [
	| result |
	result := CSBinaryExpressionNode new.
	result left: (nodes at: 1).
	result operator: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamed_argument1: nodes [
	| result |
	result := CSNamedArgumentNode new.
	result name: (nodes at: 1).
	result equal: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamed_entity2: nodes [
	| result |
	result := CSNamedEntityNode new.
	result target: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamed_entity_target2: nodes [
	| result |
	result := CSBaseExpressionNode new.
	result baseToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornameof_expression1: nodes [
	| result |
	result := CSNameofExpressionNode new.
	result nameofToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result name: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamespace_body1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	self addAll: (nodes at: 3) to: (result at: 2).
	self addAll: (nodes at: 4) to: (result at: 3).
	result at: 4 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamespace_declaration1: nodes [
	| result |
	result := CSNamespaceDeclarationNode new.
	result namespaceToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result leftBraceToken: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result directives.
	result addNodes: ((nodes at: 3) at: 3) to: result declarations.
	result rightBraceToken: ((nodes at: 3) at: 4).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamespace_or_type_name1: nodes [
	| result |
	result := CSTypeNameNode new.
	result name: (nodes at: 1).
	result typeArguments: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamespace_or_type_name2: nodes [
	| result |
	result := CSTypeNameNode new.
	result namespace: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_expression1: nodes [
	| result |
	result := CSNullConditionalExpressionNode new.
	result expression: (nodes at: 1).
	result nullConditionalOperation: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_invocation_expression1: nodes [
	| result |
	result := CSNullConditionalInvocationExpressionNode new.
	result expression: (nodes at: 1).
	result baseOperations: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_member_access1: nodes [
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result expression: (nodes at: 1).
	result baseOperations: (nodes at: 2).
	result questionMarkToken: (nodes at: 3).
	result periodToken: (nodes at: 4).
	result identifierToken: (nodes at: 5).
	result typeArguments: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_member_access2: nodes [
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result expression: (nodes at: 1).
	result baseOperations: (nodes at: 2).
	result periodToken: (nodes at: 3).
	result identifierToken: (nodes at: 4).
	result typeArguments: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations1: nodes [
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result baseOperations: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result periodToken: (nodes at: 3).
	result identifierToken: (nodes at: 4).
	result typeArguments: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations2: nodes [
	| result |
	result := CSNullConditionalElementAccessNode new.
	result baseOperations: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations3: nodes [
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result baseOperations: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations4: nodes [
	| result |
	result := CSNullConditionalElementAccessNode new.
	result baseOperations: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations5: nodes [
	| result |
	result := CSNullConditionalInvocationExpressionNode new.
	result baseOperations: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornullable_type1: nodes [
	| result |
	result := CSNullableTypeNode new.
	result type: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForobject_creation_expression1: nodes [
	| result |
	result := CSObjectCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	result initializer: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForobject_creation_expression2: nodes [
	| result |
	result := CSObjectCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result initializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForobject_initializer1: nodes [
	| result |
	result := CSObjectInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForobject_initializer2: nodes [
	| result |
	result := CSObjectInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: (nodes at: 3) to: result commaTokens.
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForoperator_declaration1: nodes [
	| result |
	result := CSOperatorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result returnType: ((nodes at: 3) at: 1).
	result operatorToken: ((nodes at: 3) at: 2).
	result operator: ((nodes at: 3) at: 3).
	result leftParenToken: ((nodes at: 3) at: 4).
	result addNodes: ((nodes at: 3) at: 5) to: result types.
	result addTokens: ((nodes at: 3) at: 6) to: result arguments.
	result rightParenToken: ((nodes at: 3) at: 7).
	result commaToken: ((nodes at: 3) at: 8).
	result implicitToken: ((nodes at: 3) at: 9).
	result explicitToken: ((nodes at: 3) at: 10).
	result body: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForoperator_declarator1: nodes [
	| result |
	result := Array new: 10.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 6).
	result at: 7 put: ((nodes at: 1) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForoperator_declarator2: nodes [
	| result |
	result := Array new: 10.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	result at: 8 put: ((nodes at: 1) at: 7).
	result at: 7 put: ((nodes at: 1) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForoperator_declarator3: nodes [
	| result |
	result := Array new: 10.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 9 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 1 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 6).
	result at: 7 put: ((nodes at: 1) at: 7).
	result at: 10 put: ((nodes at: 1) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFororderby_clause1: nodes [
	| result |
	result := Array new: 5.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForordering1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForordering_direction1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForordering_direction2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFororderings1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFororderings2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self add: ((nodes at: 3) at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForparameter_array1: nodes [
	| result |
	result := CSArrayParameterNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result paramsToken: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForparenthesized_expression1: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result _leftParens.
	result addToken: (nodes at: 3) to: result _rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForpointer_element_access1: nodes [
	| result |
	result := CSPointerElementAccessNode new.
	result expression: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result indexExpression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForpointer_member_access1: nodes [
	| result |
	result := CSPointerMemberAccessNode new.
	result expression: (nodes at: 1).
	result arrowToken: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForpointer_type1: nodes [
	| result |
	result := CSPointerTypeNode new.
	result type: (nodes at: 1).
	result timesToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForpost_increment_expression1: nodes [
	| result |
	result := CSPostExpressionNode new.
	result expression: (nodes at: 1).
	result operator: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForprimary_constraint1: nodes [
	| result |
	result := CSTypeConstraintNode new.
	result type: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForprimary_constraint2: nodes [
	| result |
	result := CSPrimaryConstraintNode new.
	result classToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForprimary_constraint3: nodes [
	| result |
	result := CSPrimaryConstraintNode new.
	result structToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForproperty_body1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: (nodes at: 3).
	result at: 5 put: ((nodes at: 4) at: 1).
	result at: 6 put: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForproperty_body2: nodes [
	| result |
	result := Array new: 8.
	result at: 7 put: (nodes at: 1).
	result at: 8 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForproperty_declaration1: nodes [
	| result |
	result := CSPropertyDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result type: (nodes at: 3).
	result name: ((nodes at: 4) at: 1).
	result interface: ((nodes at: 4) at: 2).
	result periodToken: ((nodes at: 4) at: 3).
	result leftBraceToken: ((nodes at: 5) at: 1).
	result getAccessor: ((nodes at: 5) at: 2).
	result setAccessor: ((nodes at: 5) at: 3).
	result rightBraceToken: ((nodes at: 5) at: 4).
	result equalToken: ((nodes at: 5) at: 5).
	result initializer: ((nodes at: 5) at: 6).
	result equalGreaterThanToken: ((nodes at: 5) at: 7).
	result expression: ((nodes at: 5) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForqualified_alias_member1: nodes [
	| result |
	result := CSQualifiedAliasMemberNode new.
	result global: (nodes at: 1).
	result colonColonToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForqualified_alias_member_expression1: nodes [
	| result |
	result := CSTypeExpressionNode new.
	result type: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForqualified_identifier1: nodes [
	| result |
	result := CSQualifiedIdentifierNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForqualified_identifier2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body1: nodes [
	| result |
	result := Array new: 24.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self add: ((nodes at: 2) at: 1) to: (result at: 20).
	self add: ((nodes at: 2) at: 2) to: (result at: 5).
	self add: ((nodes at: 2) at: 3) to: (result at: 21).
	self add: ((nodes at: 2) at: 4) to: (result at: 22).
	self add: ((nodes at: 2) at: 5) to: (result at: 23).
	self add: ((nodes at: 2) at: 6) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause1: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause2: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 6 put: ((nodes at: 1) at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 3).
	result at: 7 put: ((nodes at: 1) at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause3: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 8 put: ((nodes at: 1) at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause4: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 9 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	result at: 10 put: ((nodes at: 1) at: 5).
	result at: 11 put: ((nodes at: 1) at: 6).
	result at: 12 put: ((nodes at: 1) at: 7).
	result at: 13 put: ((nodes at: 1) at: 8).
	result at: 14 put: ((nodes at: 1) at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause5: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 9 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	result at: 10 put: ((nodes at: 1) at: 5).
	result at: 11 put: ((nodes at: 1) at: 6).
	result at: 12 put: ((nodes at: 1) at: 7).
	result at: 13 put: ((nodes at: 1) at: 8).
	result at: 14 put: ((nodes at: 1) at: 9).
	result at: 15 put: ((nodes at: 1) at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause6: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 16 put: ((nodes at: 1) at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 19).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clauses1: nodes [
	| result |
	result := Array new: 19.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 6).
	self add: ((nodes at: 1) at: 7) to: (result at: 7).
	self add: ((nodes at: 1) at: 8) to: (result at: 8).
	self add: ((nodes at: 1) at: 9) to: (result at: 9).
	self add: ((nodes at: 1) at: 10) to: (result at: 10).
	self add: ((nodes at: 1) at: 11) to: (result at: 11).
	self add: ((nodes at: 1) at: 12) to: (result at: 12).
	self add: ((nodes at: 1) at: 13) to: (result at: 13).
	self add: ((nodes at: 1) at: 14) to: (result at: 14).
	self add: ((nodes at: 1) at: 15) to: (result at: 15).
	self add: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clauses2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self add: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self add: ((nodes at: 2) at: 6) to: (result at: 6).
	self add: ((nodes at: 2) at: 7) to: (result at: 7).
	self add: ((nodes at: 2) at: 8) to: (result at: 8).
	self add: ((nodes at: 2) at: 9) to: (result at: 9).
	self add: ((nodes at: 2) at: 10) to: (result at: 10).
	self add: ((nodes at: 2) at: 11) to: (result at: 11).
	self add: ((nodes at: 2) at: 12) to: (result at: 12).
	self add: ((nodes at: 2) at: 13) to: (result at: 13).
	self add: ((nodes at: 2) at: 14) to: (result at: 14).
	self add: ((nodes at: 2) at: 15) to: (result at: 15).
	self add: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_continuation1: nodes [
	| result |
	result := Array new: 24.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_expression1: nodes [
	| result |
	result := CSQueryExpressionNode new.
	result addToken: ((nodes at: 1) at: 1) to: result fromTokens.
	result addNode: ((nodes at: 1) at: 2) to: result types.
	result addToken: ((nodes at: 1) at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 1) at: 4) to: result inTokens.
	result addNode: ((nodes at: 1) at: 5) to: result expressions.
	result addTokens: ((nodes at: 2) at: 1) to: result fromTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result types.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result inTokens.
	result addNodes: ((nodes at: 2) at: 5) to: result expressions.
	result addTokens: ((nodes at: 2) at: 6) to: result letTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result equalTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result whereTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result joinTokens.
	result addNodes: ((nodes at: 2) at: 10) to: result joinInExpressions.
	result addTokens: ((nodes at: 2) at: 11) to: result onTokens.
	result addNodes: ((nodes at: 2) at: 12) to: result joinOnExpressions.
	result addTokens: ((nodes at: 2) at: 13) to: result equalsTokens.
	result
		addNodes: ((nodes at: 2) at: 14)
		to: result joinEqualsExpressions.
	result addTokens: ((nodes at: 2) at: 15) to: result intoTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result orderbyTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result ascendingTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result descendingTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result selectTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result groupTokens.
	result addNodes: ((nodes at: 2) at: 22) to: result groupExpressions.
	result addTokens: ((nodes at: 2) at: 23) to: result byTokens.
	result addNodes: ((nodes at: 2) at: 24) to: result groupByExpressions.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForrank_specifier1: nodes [
	| result |
	result := CSRankSpecifierNode new.
	result leftBracketToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForremove_accessor_declaration1: nodes [
	| result |
	result := CSRemoveAccessorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result removeToken: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForreturn_statement1: nodes [
	| result |
	result := CSReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForselect_or_group_clause1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForselect_or_group_clause2: nodes [
	| result |
	result := Array new: 6.
	result at: 3 put: ((nodes at: 1) at: 1).
	result at: 4 put: ((nodes at: 1) at: 2).
	result at: 5 put: ((nodes at: 1) at: 3).
	result at: 6 put: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForset_accessor_declaration1: nodes [
	| result |
	result := CSSetAccessorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result setToken: (nodes at: 3).
	result body: ((nodes at: 4) at: 1).
	result semicolonToken: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForsimple_name1: nodes [
	| result |
	result := CSSimpleNameNode new.
	result identifierToken: (nodes at: 1).
	result typeArguments: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForsimple_type2: nodes [
	| result |
	result := CSSimpleTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForsizeof_expression1: nodes [
	| result |
	result := CSSizeofExpressionNode new.
	result sizeofToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstackalloc_initializer1: nodes [
	| result |
	result := CSStackallocInitializerNode new.
	result stackallocToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result expression: (nodes at: 4).
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_declaration1: nodes [
	| result |
	result := CSStaticConstructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result staticToken: ((nodes at: 2) at: 2).
	result unsafeToken: ((nodes at: 2) at: 3).
	result identifierToken: (nodes at: 3).
	result leftParenToken: (nodes at: 4).
	result rightParenToken: (nodes at: 5).
	result block: ((nodes at: 6) at: 1).
	result semicolonToken: ((nodes at: 6) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers3: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 1).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers5: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers6: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers7: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstruct_declaration1: nodes [
	| result |
	result := CSStructDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result partialToken: (nodes at: 3).
	result structToken: (nodes at: 4).
	result identifierToken: (nodes at: 5).
	result typeParameters: (nodes at: 6).
	result colonToken: ((nodes at: 7) at: 1).
	result addNodes: ((nodes at: 7) at: 2) to: result supertypes.
	result addTokens: ((nodes at: 7) at: 3) to: result commas.
	result addNodes: (nodes at: 8) to: result constraintClauses.
	result leftBraceToken: ((nodes at: 9) at: 1).
	result addNodes: ((nodes at: 9) at: 2) to: result declarations.
	result rightBraceToken: ((nodes at: 9) at: 3).
	result semicolon: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstruct_interfaces1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForswitch_label1: nodes [
	| result |
	result := CSSwitchLabelNode new.
	result caseToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result colonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForswitch_label2: nodes [
	| result |
	result := CSSwitchLabelNode new.
	result defaultToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForswitch_section1: nodes [
	| result |
	result := CSSwitchSectionNode new.
	result addNodes: (nodes at: 1) to: result labels.
	result addNodes: (nodes at: 2) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForswitch_statement1: nodes [
	| result |
	result := CSSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result leftBraceToken: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result sections.
	result rightBraceToken: ((nodes at: 5) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForthis_access1: nodes [
	| result |
	result := CSThisAccessNode new.
	result thisToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForthrow_statement1: nodes [
	| result |
	result := CSThrowStatementNode new.
	result throwToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortry_statement1: nodes [
	| result |
	result := CSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result clauses.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortry_statement2: nodes [
	| result |
	result := CSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result finally: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortry_statement3: nodes [
	| result |
	result := CSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result clauses.
	result finally: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_argument_list1: nodes [
	| result |
	result := CSTypeArgumentListNode new.
	result lessThanToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result types.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result greaterThanToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter1: nodes [
	| result |
	result := CSTypeNameNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_constraints4: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_constraints5: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_constraints7: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 4) to: (result at: 2).
	self add: (nodes at: 5) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_constraints_clause1: nodes [
	| result |
	result := CSTypeParameterConstraintsClauseNode new.
	result whereToken: (nodes at: 1).
	result parameter: (nodes at: 2).
	result colon: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result constraints.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_list1: nodes [
	| result |
	result := CSTypeParameterListNode new.
	result lessThan: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result _attributes.
	result addNodes: ((nodes at: 2) at: 2) to: result parameters.
	result addTokens: ((nodes at: 2) at: 3) to: result commaTokens.
	result greaterThan: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameters1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameters2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	self addAll: (nodes at: 3) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortypeof_expression1: nodes [
	| result |
	result := CSTypeofExpressionNode new.
	result typeofToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunary_expression5: nodes [
	| result |
	result := CSPrefixExpressionNode new.
	result operator: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunary_operator_declarator1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunbound_type_name1: nodes [
	| result |
	result := CSUnboundTypeNameNode new.
	result addToken: (nodes at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: ((nodes at: 2) at: 3) to: result gtTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunbound_type_name2: nodes [
	| result |
	result := CSUnboundTypeNameNode new.
	result addToken: (nodes at: 1) to: result identifierTokens.
	result colonColonToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: ((nodes at: 4) at: 3) to: result gtTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunbound_type_name3: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: ((nodes at: 4) at: 3) to: result gtTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunchecked_expression1: nodes [
	| result |
	result := CSUncheckedExpressionNode new.
	result uncheckedToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunchecked_statement1: nodes [
	| result |
	result := CSUncheckedStatementNode new.
	result uncheckedToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunsafe_statement1: nodes [
	| result |
	result := CSUnsafeStatementNode new.
	result unsafeToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForusing_alias_directive1: nodes [
	| result |
	result := CSUsingAliasDirectiveNode new.
	result usingToken: (nodes at: 1).
	result name: (nodes at: 2).
	result equalToken: (nodes at: 3).
	result namespace: (nodes at: 4).
	result semicolonToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForusing_namespace_directive1: nodes [
	| result |
	result := CSUsingNamespaceDirectiveNode new.
	result usingToken: (nodes at: 1).
	result namespace: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForusing_statement1: nodes [
	| result |
	result := CSUsingStatementNode new.
	result usingToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForusing_static_directive1: nodes [
	| result |
	result := CSUsingStaticDirectiveNode new.
	result usingToken: (nodes at: 1).
	result staticToken: (nodes at: 2).
	result namespace: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariable_declarator1: nodes [
	| result |
	result := CSVariableDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariable_declarator2: nodes [
	| result |
	result := CSVariableDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result initializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariant_type_parameter_list1: nodes [
	| result |
	result := CSVariantTypeParameterListNode new.
	result lessThan: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 2) to: result annotations.
	result addNodes: ((nodes at: 2) at: 3) to: result parameters.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result greaterThan: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariant_type_parameters1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariant_type_parameters2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	self addAll: (nodes at: 3) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 2).
	self add: (nodes at: 5) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvoid_type1: nodes [
	| result |
	result := CSVoidTypeNode new.
	result voidToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForwhile_statement1: nodes [
	| result |
	result := CSWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForyield_statement1: nodes [
	| result |
	result := CSYieldStatementNode new.
	result yieldToken: (nodes at: 1).
	result returnToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForyield_statement2: nodes [
	| result |
	result := CSYieldStatementNode new.
	result yieldToken: (nodes at: 1).
	result breakToken: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #generated }
CSharpParser >> reduceTable [
^#(
	#(178 0 #reduceActionFor_extern_alias_directives1:) 
	#(564 0 #reduceActionFor_extern_alias_directives1:) 
	#(231 0 #reduceActionForStartInterpolatedString1:) 
	#(235 0 #reduceActionForStartInterpolatedVerbatimString1:) 
	#(181 0 #reduceActionFor_extern_alias_directives1:) 
	#(178 1 #reduceActionFor_extern_alias_directives2:) 
	#(179 1 #reduceActionForextern_alias_directives1:) 
	#(568 0 #reduceActionFor_attribute_target_specifier1:) 
	#(189 1 #liftFirstValue:) 
	#(190 1 #liftFirstValue:) 
	#(407 0 #reduceActionFor_extern_alias_directives1:) 
	#(555 0 #reduceActionFor_extern_alias_directives1:) 
	#(548 0 #reduceActionFor_extern_alias_directives1:) 
	#(523 0 #reduceActionFor_extern_alias_directives1:) 
	#(509 0 #reduceActionFor_extern_alias_directives1:) 
	#(564 1 #reduceActionFor_extern_alias_directives2:) 
	#(565 1 #reduceActionFor_extern_alias_directives2:) 
	#(566 1 #reduceActionForextern_alias_directives1:) 
	#(351 1 #reduceActionForempty_statement1:) 
	#(199 1 #reduceActionForsimple_type2:) 
	#(243 1 #reduceActionForsimple_type2:) 
	#(201 1 #liftFirstValue:) 
	#(200 1 #liftFirstValue:) 
	#(307 0 #nil) 
	#(202 1 #liftFirstValue:) 
	#(583 1 #liftFirstValue:) 
	#(207 1 #reduceActionForsimple_type2:) 
	#(341 0 #nil) 
	#(247 1 #reduceActionForthis_access1:) 
	#(355 1 #reduceActionForlocal_variable_type2:) 
	#(611 1 #reduceActionForvoid_type1:) 
	#(349 0 #reduceActionFor_extern_alias_directives1:) 
	#(238 0 #nil) 
	#(413 1 #reduceActionFortype_parameter1:) 
	#(582 1 #reduceActionForliteral2:) 
	#(230 1 #reduceActionForinterpolated_regular_string1:) 
	#(234 1 #reduceActionForinterpolated_regular_string1:) 
	#(194 1 #liftFirstValue:) 
	#(241 1 #reduceActionForqualified_alias_member_expression1:) 
	#(198 1 #liftFirstValue:) 
	#(207 1 #liftFirstValue:) 
	#(205 1 #liftFirstValue:) 
	#(208 1 #liftFirstValue:) 
	#(216 1 #liftFirstValue:) 
	#(193 1 #liftFirstValue:) 
	#(593 1 #liftFirstValue:) 
	#(204 1 #liftFirstValue:) 
	#(210 1 #liftFirstValue:) 
	#(355 1 #liftFirstValue:) 
	#(196 1 #liftFirstValue:) 
	#(197 1 #liftFirstValue:) 
	#(206 1 #liftFirstValue:) 
	#(282 1 #liftFirstValue:) 
	#(284 0 #nil) 
	#(227 1 #liftFirstValue:) 
	#(228 1 #liftFirstValue:) 
	#(229 1 #reduceActionForinterpolated_string_expression1:) 
	#(242 1 #reduceActionForqualified_alias_member_expression1:) 
	#(364 1 #liftFirstValue:) 
	#(346 1 #liftFirstValue:) 
	#(347 1 #liftFirstValue:) 
	#(365 1 #liftFirstValue:) 
	#(374 1 #liftFirstValue:) 
	#(386 1 #liftFirstValue:) 
	#(309 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(315 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(312 0 #nil) 
	#(195 0 #nil) 
	#(317 1 #liftFirstValue:) 
	#(292 1 #liftFirstValue:) 
	#(293 1 #liftFirstValue:) 
	#(294 1 #liftFirstValue:) 
	#(295 1 #liftFirstValue:) 
	#(296 1 #liftFirstValue:) 
	#(297 1 #liftFirstValue:) 
	#(298 1 #liftFirstValue:) 
	#(299 1 #liftFirstValue:) 
	#(300 1 #liftFirstValue:) 
	#(301 1 #liftFirstValue:) 
	#(302 1 #liftFirstValue:) 
	#(303 1 #liftFirstValue:) 
	#(343 1 #liftFirstValue:) 
	#(306 1 #liftFirstValue:) 
	#(314 1 #reduceActionForimplicit_anonymous_function_signature2:) 
	#(322 0 #reduceActionFor_query_body_clauses1:) 
	#(342 1 #liftFirstValue:) 
	#(428 1 #liftFirstValue:) 
	#(436 0 #reduceActionFor_extern_alias_directives1:) 
	#(482 0 #reduceActionFor_extern_alias_directives1:) 
	#(460 0 #reduceActionFor_extern_alias_directives1:) 
	#(444 0 #reduceActionFor_extern_alias_directives1:) 
	#(430 0 #reduceActionFor_extern_alias_directives1:) 
	#(475 0 #reduceActionFor_extern_alias_directives1:) 
	#(590 0 #nil) 
	#(587 0 #nil) 
	#(498 0 #reduceActionFor_extern_alias_directives1:) 
	#(558 0 #reduceActionFor_extern_alias_directives1:) 
	#(181 1 #reduceActionFor_extern_alias_directives2:) 
	#(182 1 #reduceActionForextern_alias_directives1:) 
	#(183 1 #liftFirstValue:) 
	#(179 2 #reduceActionForextern_alias_directives2:) 
	#(570 1 #liftFirstValue:) 
	#(568 1 #reduceActionFor_extern_alias_directives2:) 
	#(176 1 #reduceActionForqualified_identifier1:) 
	#(409 1 #liftFirstValue:) 
	#(557 1 #liftFirstValue:) 
	#(550 1 #liftFirstValue:) 
	#(525 1 #liftFirstValue:) 
	#(511 1 #liftFirstValue:) 
	#(586 0 #nil) 
	#(407 1 #reduceActionFor_extern_alias_directives2:) 
	#(408 1 #reduceActionForextern_alias_directives1:) 
	#(509 1 #reduceActionFor_extern_alias_directives2:) 
	#(510 1 #reduceActionForextern_alias_directives1:) 
	#(523 1 #reduceActionFor_extern_alias_directives2:) 
	#(524 1 #reduceActionForextern_alias_directives1:) 
	#(548 1 #reduceActionFor_extern_alias_directives2:) 
	#(549 1 #reduceActionForextern_alias_directives1:) 
	#(555 1 #reduceActionFor_extern_alias_directives2:) 
	#(556 1 #reduceActionForextern_alias_directives1:) 
	#(566 2 #reduceActionForextern_alias_directives2:) 
	#(282 2 #reduceActionForunary_expression5:) 
	#(597 2 #reduceActionForunary_expression5:) 
	#(594 2 #reduceActionForunary_expression5:) 
	#(288 2 #reduceActionForunary_expression5:) 
	#(289 2 #reduceActionForunary_expression5:) 
	#(291 2 #reduceActionForawait_expression1:) 
	#(387 2 #reduceActionForbreak_statement1:) 
	#(400 2 #reduceActionForchecked_statement1:) 
	#(388 2 #reduceActionForcontinue_statement1:) 
	#(307 1 #liftFirstValue:) 
	#(378 0 #nil) 
	#(214 0 #reduceActionFor_extern_alias_directives1:) 
	#(267 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(265 2 #reduceActionForanonymous_object_creation_expression1:) 
	#(341 1 #liftFirstValue:) 
	#(401 2 #reduceActionForunchecked_statement1:) 
	#(591 2 #reduceActionForunsafe_statement1:) 
	#(350 1 #reduceActionForextern_alias_directives1:) 
	#(349 1 #reduceActionFor_extern_alias_directives2:) 
	#(238 1 #liftFirstValue:) 
	#(237 2 #reduceActionForsimple_name1:) 
	#(194 2 #reduceActionFornamespace_or_type_name1:) 
	#(203 2 #reduceActionFornullable_type1:) 
	#(209 2 #reduceActionForarray_type1:) 
	#(212 1 #reduceActionForextern_alias_directives1:) 
	#(224 0 #reduceActionFor_attribute_target_specifier1:) 
	#(221 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(249 2 #reduceActionForpost_increment_expression1:) 
	#(250 2 #reduceActionForpost_increment_expression1:) 
	#(283 2 #reduceActionFornull_conditional_expression1:) 
	#(284 1 #liftFirstValue:) 
	#(340 1 #liftFirstValue:) 
	#(353 2 #reduceActionFordeclaration_statement1:) 
	#(358 1 #reduceActionFor_local_variable_declarator_name1:) 
	#(354 2 #reduceActionForlocal_variable_declaration1:) 
	#(356 1 #reduceActionForinterpolated_regular_string1:) 
	#(357 1 #reduceActionForlocal_variable_declarator1:) 
	#(363 2 #reduceActionForexpression_statement1:) 
	#(592 2 #reduceActionForpointer_type1:) 
	#(313 1 #liftFirstValue:) 
	#(309 1 #reduceActionFor_extern_alias_directives2:) 
	#(310 1 #reduceActionForinterpolated_regular_string1:) 
	#(312 1 #liftFirstValue:) 
	#(315 1 #reduceActionFor_extern_alias_directives2:) 
	#(316 1 #reduceActionForinterpolated_regular_string1:) 
	#(195 1 #liftFirstValue:) 
	#(324 1 #reduceActionForquery_body_clause1:) 
	#(319 2 #reduceActionForquery_expression1:) 
	#(322 1 #reduceActionFor_extern_alias_directives2:) 
	#(323 1 #reduceActionForquery_body_clauses1:) 
	#(324 1 #reduceActionForquery_body_clause2:) 
	#(324 1 #reduceActionForquery_body_clause3:) 
	#(324 1 #reduceActionForquery_body_clause4:) 
	#(324 1 #reduceActionForquery_body_clause5:) 
	#(324 1 #reduceActionForquery_body_clause6:) 
	#(449 1 #reduceActionFormethod_body3:) 
	#(449 1 #reduceActionFormethod_body1:) 
	#(442 2 #reduceActionFormethod_declaration1:) 
	#(462 1 #liftFirstValue:) 
	#(446 1 #liftFirstValue:) 
	#(484 1 #liftFirstValue:) 
	#(477 1 #liftFirstValue:) 
	#(489 1 #liftFirstValue:) 
	#(500 1 #liftFirstValue:) 
	#(587 1 #liftFirstValue:) 
	#(438 1 #liftFirstValue:) 
	#(432 1 #liftFirstValue:) 
	#(590 1 #liftFirstValue:) 
	#(430 1 #reduceActionFor_extern_alias_directives2:) 
	#(431 1 #reduceActionForextern_alias_directives1:) 
	#(436 1 #reduceActionFor_extern_alias_directives2:) 
	#(437 1 #reduceActionForextern_alias_directives1:) 
	#(444 1 #reduceActionFor_extern_alias_directives2:) 
	#(445 1 #reduceActionForextern_alias_directives1:) 
	#(460 1 #reduceActionFor_extern_alias_directives2:) 
	#(461 1 #reduceActionForextern_alias_directives1:) 
	#(475 1 #reduceActionFor_extern_alias_directives2:) 
	#(476 1 #reduceActionForextern_alias_directives1:) 
	#(482 1 #reduceActionFor_extern_alias_directives2:) 
	#(483 1 #reduceActionForextern_alias_directives1:) 
	#(488 1 #reduceActionForextern_alias_directives1:) 
	#(498 1 #reduceActionFor_extern_alias_directives2:) 
	#(499 1 #reduceActionForextern_alias_directives1:) 
	#(192 1 #liftFirstValue:) 
	#(187 0 #reduceActionFor_extern_alias_directives1:) 
	#(558 1 #reduceActionFor_extern_alias_directives2:) 
	#(559 1 #reduceActionFor_extern_alias_directives2:) 
	#(560 1 #reduceActionForextern_alias_directives1:) 
	#(182 2 #reduceActionForextern_alias_directives2:) 
	#(573 1 #liftFirstValue:) 
	#(571 1 #reduceActionForinterpolated_regular_string1:) 
	#(574 0 #reduceActionFor_attribute_arguments1:) 
	#(569 2 #reduceActionForattribute_target_specifier1:) 
	#(584 0 #nil) 
	#(586 1 #liftFirstValue:) 
	#(408 2 #reduceActionForextern_alias_directives2:) 
	#(510 2 #reduceActionForextern_alias_directives2:) 
	#(524 2 #reduceActionForextern_alias_directives2:) 
	#(549 2 #reduceActionForextern_alias_directives2:) 
	#(556 2 #reduceActionForextern_alias_directives2:) 
	#(239 3 #reduceActionForparenthesized_expression1:) 
	#(248 3 #reduceActionForbase_access1:) 
	#(246 1 #reduceActionForinterpolated_regular_string1:) 
	#(360 3 #reduceActionForlocal_constant_declaration1:) 
	#(361 1 #reduceActionForinterpolated_regular_string1:) 
	#(305 3 #reduceActionForanonymous_method_expression1:) 
	#(379 1 #liftFirstValue:) 
	#(384 1 #reduceActionForinterpolated_regular_string1:) 
	#(378 1 #liftFirstValue:) 
	#(379 1 #reduceActionForfor_initializer2:) 
	#(344 1 #liftFirstValue:) 
	#(389 3 #reduceActionForgoto_statement3:) 
	#(389 3 #reduceActionForgoto_statement1:) 
	#(345 1 #liftFirstValue:) 
	#(281 1 #reduceActionFornamed_entity_target2:) 
	#(281 1 #reduceActionForthis_access1:) 
	#(280 1 #liftFirstValue:) 
	#(281 1 #liftFirstValue:) 
	#(215 1 #reduceActionForextern_alias_directives1:) 
	#(214 1 #reduceActionFor_extern_alias_directives2:) 
	#(269 1 #reduceActionFormember_declarator1:) 
	#(269 1 #reduceActionFormember_declarator2:) 
	#(267 1 #reduceActionFor_extern_alias_directives2:) 
	#(268 1 #reduceActionForinterpolated_regular_string1:) 
	#(255 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(251 3 #reduceActionForobject_creation_expression2:) 
	#(253 1 #liftFirstValue:) 
	#(520 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(263 3 #reduceActionForarray_creation_expression2:) 
	#(263 3 #reduceActionForarray_creation_expression3:) 
	#(390 3 #reduceActionForreturn_statement1:) 
	#(391 3 #reduceActionForthrow_statement1:) 
	#(395 0 #reduceActionFor_exception_specifier1:) 
	#(392 3 #reduceActionFortry_statement1:) 
	#(393 1 #reduceActionForextern_alias_directives1:) 
	#(392 3 #reduceActionFortry_statement2:) 
	#(272 0 #reduceActionFor_generic_dimension_specifier1:) 
	#(404 1 #liftFirstValue:) 
	#(405 3 #reduceActionForyield_statement2:) 
	#(348 3 #reduceActionForblock1:) 
	#(350 2 #reduceActionForextern_alias_directives2:) 
	#(352 3 #reduceActionForlabeled_statement1:) 
	#(219 1 #liftFirstValue:) 
	#(218 1 #reduceActionForinterpolated_regular_string1:) 
	#(212 2 #reduceActionForextern_alias_directives2:) 
	#(221 1 #reduceActionFor_extern_alias_directives2:) 
	#(222 1 #reduceActionForinterpolated_regular_string1:) 
	#(224 1 #reduceActionFor_extern_alias_directives2:) 
	#(595 3 #reduceActionForpointer_member_access1:) 
	#(232 1 #reduceActionForinterpolated_regular_string_body1:) 
	#(233 1 #reduceActionForinterpolation1:) 
	#(236 1 #reduceActionForinterpolated_regular_string_body1:) 
	#(240 3 #reduceActionFormember_access3:) 
	#(339 3 #reduceActionForassignment1:) 
	#(308 3 #reduceActionForexplicit_anonymous_function_signature1:) 
	#(314 3 #reduceActionForimplicit_anonymous_function_signature1:) 
	#(292 3 #reduceActionFormultiplicative_expression4:) 
	#(293 3 #reduceActionFormultiplicative_expression4:) 
	#(294 3 #reduceActionFormultiplicative_expression4:) 
	#(295 3 #reduceActionFormultiplicative_expression4:) 
	#(296 3 #reduceActionFormultiplicative_expression4:) 
	#(297 3 #reduceActionFormultiplicative_expression4:) 
	#(298 3 #reduceActionFormultiplicative_expression4:) 
	#(299 3 #reduceActionFormultiplicative_expression4:) 
	#(300 3 #reduceActionFormultiplicative_expression4:) 
	#(302 3 #reduceActionFormultiplicative_expression4:) 
	#(301 3 #reduceActionFormultiplicative_expression4:) 
	#(304 3 #reduceActionForlambda_expression1:) 
	#(318 1 #liftFirstValue:) 
	#(329 2 #reduceActionFororderby_clause1:) 
	#(330 1 #reduceActionFororderings1:) 
	#(332 0 #reduceActionFor_attribute_target_specifier1:) 
	#(326 2 #reduceActionForattribute_target_specifier1:) 
	#(337 0 #reduceActionFor_query_continuation1:) 
	#(334 1 #reduceActionForselect_or_group_clause1:) 
	#(334 1 #reduceActionForselect_or_group_clause2:) 
	#(323 2 #reduceActionForquery_body_clauses2:) 
	#(506 2 #reduceActionForstatic_constructor_modifiers2:) 
	#(431 2 #reduceActionForextern_alias_directives2:) 
	#(437 2 #reduceActionForextern_alias_directives2:) 
	#(445 2 #reduceActionForextern_alias_directives2:) 
	#(461 2 #reduceActionForextern_alias_directives2:) 
	#(476 2 #reduceActionForextern_alias_directives2:) 
	#(483 2 #reduceActionForextern_alias_directives2:) 
	#(488 2 #reduceActionForextern_alias_directives2:) 
	#(490 1 #reduceActionForoperator_declarator1:) 
	#(490 1 #reduceActionForoperator_declarator2:) 
	#(490 1 #reduceActionForoperator_declarator3:) 
	#(499 2 #reduceActionForextern_alias_directives2:) 
	#(506 2 #reduceActionForstatic_constructor_modifiers1:) 
	#(180 4 #reduceActionForextern_alias_directive1:) 
	#(185 3 #reduceActionForusing_namespace_directive1:) 
	#(563 1 #liftFirstValue:) 
	#(174 4 #reduceActionForcompilation_unit1:) 
	#(187 1 #reduceActionFor_extern_alias_directives2:) 
	#(188 1 #reduceActionForextern_alias_directives1:) 
	#(560 2 #reduceActionForextern_alias_directives2:) 
	#(567 4 #reduceActionForattribute_section1:) 
	#(576 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(572 2 #reduceActionForattribute1:) 
	#(574 1 #reduceActionFor_attribute_arguments2:) 
	#(176 3 #reduceActionForqualified_identifier2:) 
	#(584 1 #liftFirstValue:) 
	#(175 4 #reduceActionFornamespace_declaration1:) 
	#(545 0 #reduceActionFor_attribute_target_specifier1:) 
	#(447 1 #liftFirstValue:) 
	#(290 4 #reduceActionForcast_expression1:) 
	#(248 4 #reduceActionForbase_access2:) 
	#(276 4 #reduceActionForchecked_expression1:) 
	#(278 4 #reduceActionFordefault_value_expression1:) 
	#(600 1 #reduceActionForinterpolated_regular_string1:) 
	#(380 0 #nil) 
	#(389 4 #reduceActionForgoto_statement2:) 
	#(279 4 #reduceActionFornameof_expression1:) 
	#(213 3 #reduceActionForrank_specifier1:) 
	#(215 2 #reduceActionForextern_alias_directives2:) 
	#(266 3 #reduceActionForanonymous_object_initializer1:) 
	#(258 1 #reduceActionForinitializer_target1:) 
	#(255 1 #reduceActionFor_extern_alias_directives2:) 
	#(256 1 #reduceActionForinterpolated_regular_string1:) 
	#(261 1 #reduceActionForinterpolated_regular_string1:) 
	#(262 1 #reduceActionForelement_initializer1:) 
	#(441 1 #liftFirstValue:) 
	#(521 1 #reduceActionForinterpolated_regular_string1:) 
	#(520 1 #reduceActionFor_extern_alias_directives2:) 
	#(598 4 #reduceActionForsizeof_expression1:) 
	#(397 0 #nil) 
	#(395 1 #reduceActionFor_extern_alias_directives2:) 
	#(399 2 #reduceActionForfinally_clause1:) 
	#(393 2 #reduceActionForextern_alias_directives2:) 
	#(392 4 #reduceActionFortry_statement3:) 
	#(274 0 #reduceActionFor_extern_alias_directives1:) 
	#(271 2 #reduceActionForunbound_type_name1:) 
	#(272 1 #reduceActionFor_extern_alias_directives2:) 
	#(270 4 #reduceActionFortypeof_expression1:) 
	#(277 4 #reduceActionForunchecked_expression1:) 
	#(405 4 #reduceActionForyield_statement1:) 
	#(191 4 #reduceActionForqualified_alias_member1:) 
	#(217 3 #reduceActionFortype_argument_list1:) 
	#(194 4 #reduceActionFornamespace_or_type_name2:) 
	#(225 2 #reduceActionForattribute_target_specifier1:) 
	#(244 4 #reduceActionForinvocation_expression1:) 
	#(223 2 #reduceActionForargument1:) 
	#(226 1 #reduceActionForargument_value1:) 
	#(240 4 #reduceActionFormember_access1:) 
	#(245 4 #reduceActionForelement_access1:) 
	#(596 4 #reduceActionForpointer_element_access1:) 
	#(230 4 #reduceActionForinterpolated_regular_string2:) 
	#(234 4 #reduceActionForinterpolated_regular_string2:) 
	#(356 3 #reduceActionForlocal_variable_declarators2:) 
	#(359 1 #liftFirstValue:) 
	#(357 3 #reduceActionForlocal_variable_declarator2:) 
	#(310 3 #reduceActionForlocal_variable_declarators2:) 
	#(311 3 #reduceActionForexplicit_anonymous_function_paramenter1:) 
	#(316 3 #reduceActionForlocal_variable_declarators2:) 
	#(333 1 #reduceActionForordering_direction1:) 
	#(333 1 #reduceActionForordering_direction2:) 
	#(331 2 #reduceActionForordering1:) 
	#(332 1 #reduceActionFor_extern_alias_directives2:) 
	#(335 2 #reduceActionForattribute_target_specifier1:) 
	#(321 3 #reduceActionForquery_body1:) 
	#(337 1 #reduceActionFor_extern_alias_directives2:) 
	#(449 3 #reduceActionFormethod_body2:) 
	#(506 3 #reduceActionForstatic_constructor_modifiers7:) 
	#(440 1 #reduceActionForvariable_declarator1:) 
	#(439 1 #reduceActionForinterpolated_regular_string1:) 
	#(448 1 #reduceActionForargument_value1:) 
	#(481 4 #reduceActionForindexer_declaration1:) 
	#(496 1 #reduceActionFormethod_body3:) 
	#(496 1 #reduceActionFormethod_body1:) 
	#(487 4 #reduceActionForoperator_declaration1:) 
	#(450 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(504 1 #reduceActionForordering_direction2:) 
	#(504 1 #reduceActionForordering_direction1:) 
	#(497 4 #reduceActionForconstructor_declaration1:) 
	#(506 3 #reduceActionForstatic_constructor_modifiers5:) 
	#(506 3 #reduceActionForstatic_constructor_modifiers3:) 
	#(506 3 #reduceActionForstatic_constructor_modifiers6:) 
	#(186 4 #reduceActionForusing_static_directive1:) 
	#(562 2 #reduceActionForattribute_target_specifier1:) 
	#(188 2 #reduceActionForextern_alias_directives2:) 
	#(567 5 #reduceActionForattribute_section2:) 
	#(571 3 #reduceActionForlocal_variable_declarators2:) 
	#(581 1 #liftFirstValue:) 
	#(576 1 #reduceActionFor_extern_alias_directives2:) 
	#(577 1 #reduceActionForinterpolated_regular_string1:) 
	#(579 1 #reduceActionForinterpolated_regular_string1:) 
	#(578 1 #liftFirstValue:) 
	#(410 0 #nil) 
	#(526 0 #nil) 
	#(545 1 #reduceActionFor_extern_alias_directives2:) 
	#(246 3 #reduceActionForlocal_variable_declarators2:) 
	#(362 3 #reduceActionForconst_declarator1:) 
	#(361 3 #reduceActionForlocal_variable_declarators2:) 
	#(381 1 #liftFirstValue:) 
	#(380 1 #liftFirstValue:) 
	#(384 3 #reduceActionForlocal_variable_declarators2:) 
	#(366 5 #reduceActionForif_statement1:) 
	#(402 5 #reduceActionForlock_statement1:) 
	#(269 3 #reduceActionFormember_declarator5:) 
	#(266 4 #reduceActionForanonymous_object_initializer2:) 
	#(268 3 #reduceActionForlocal_variable_declarators2:) 
	#(252 0 #nil) 
	#(254 3 #reduceActionForobject_initializer1:) 
	#(260 3 #reduceActionForcollection_initializer1:) 
	#(519 3 #reduceActionForarray_initializer1:) 
	#(211 0 #reduceActionFor_extern_alias_directives1:) 
	#(264 5 #reduceActionFordelegate_creation_expression1:) 
	#(369 0 #reduceActionFor_extern_alias_directives1:) 
	#(367 5 #reduceActionForswitch_statement1:) 
	#(588 0 #nil) 
	#(397 1 #liftFirstValue:) 
	#(275 1 #reduceActionForextern_alias_directives1:) 
	#(274 1 #reduceActionFor_extern_alias_directives2:) 
	#(403 5 #reduceActionForusing_statement1:) 
	#(375 5 #reduceActionForwhile_statement1:) 
	#(218 3 #reduceActionForlocal_variable_declarators2:) 
	#(222 3 #reduceActionForlocal_variable_declarators2:) 
	#(226 2 #reduceActionForargument_value3:) 
	#(220 1 #liftFirstValue:) 
	#(226 2 #reduceActionForargument_value2:) 
	#(285 4 #reduceActionFornull_conditional_operations5:) 
	#(287 5 #reduceActionFornull_conditional_invocation_expression1:) 
	#(285 4 #reduceActionFornull_conditional_operations3:) 
	#(285 4 #reduceActionFornull_conditional_operations4:) 
	#(232 3 #reduceActionForinterpolated_regular_string_body2:) 
	#(233 3 #reduceActionForinterpolation2:) 
	#(236 3 #reduceActionForinterpolated_regular_string_body2:) 
	#(320 5 #reduceActionForfrom_clause1:) 
	#(303 5 #reduceActionForconditional_expression2:) 
	#(325 4 #reduceActionForlet_clause1:) 
	#(330 3 #reduceActionFororderings2:) 
	#(433 1 #reduceActionForinterpolated_regular_string1:) 
	#(435 5 #reduceActionForfield_declaration1:) 
	#(459 5 #reduceActionForproperty_declaration1:) 
	#(469 0 #nil) 
	#(467 0 #nil) 
	#(471 0 #reduceActionFor_extern_alias_directives1:) 
	#(492 1 #liftFirstValue:) 
	#(494 1 #liftFirstValue:) 
	#(450 1 #reduceActionFor_extern_alias_directives2:) 
	#(451 1 #reduceActionFor_extern_alias_directives2:) 
	#(452 1 #reduceActionForinterpolated_regular_string1:) 
	#(451 1 #reduceActionForinterpolated_regular_string1:) 
	#(456 0 #nil) 
	#(184 5 #reduceActionForusing_alias_directive1:) 
	#(561 4 #reduceActionForattribute_section1:) 
	#(575 3 #reduceActionForanonymous_object_initializer1:) 
	#(414 0 #reduceActionFor_class_base1:) 
	#(410 1 #liftFirstValue:) 
	#(512 0 #reduceActionFor_struct_interfaces1:) 
	#(531 0 #reduceActionFor_struct_interfaces1:) 
	#(526 1 #liftFirstValue:) 
	#(546 2 #reduceActionForattribute_target_specifier1:) 
	#(551 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(602 1 #reduceActionForordering_direction2:) 
	#(601 3 #reduceActionForfixed_pointer_declarator1:) 
	#(599 6 #reduceActionForfixed_statement1:) 
	#(600 3 #reduceActionForlocal_variable_declarators2:) 
	#(382 0 #nil) 
	#(280 4 #reduceActionFornamed_entity2:) 
	#(251 6 #reduceActionForobject_creation_expression1:) 
	#(252 1 #liftFirstValue:) 
	#(258 3 #reduceActionForinitializer_target2:) 
	#(262 3 #reduceActionForelement_initializer2:) 
	#(254 4 #reduceActionForobject_initializer2:) 
	#(256 3 #reduceActionForlocal_variable_declarators2:) 
	#(259 1 #liftFirstValue:) 
	#(257 3 #reduceActionFormember_initializer1:) 
	#(260 4 #reduceActionForcollection_initializer2:) 
	#(261 3 #reduceActionForlocal_variable_declarators2:) 
	#(519 4 #reduceActionForarray_initializer2:) 
	#(521 3 #reduceActionForlocal_variable_declarators2:) 
	#(518 0 #nil) 
	#(211 1 #reduceActionFor_extern_alias_directives2:) 
	#(369 1 #reduceActionFor_extern_alias_directives2:) 
	#(370 1 #reduceActionForextern_alias_directives1:) 
	#(372 1 #reduceActionForextern_alias_directives1:) 
	#(588 1 #liftFirstValue:) 
	#(394 4 #reduceActionForcatch_clause1:) 
	#(271 4 #reduceActionForunbound_type_name2:) 
	#(273 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(275 2 #reduceActionForextern_alias_directives2:) 
	#(271 4 #reduceActionForunbound_type_name3:) 
	#(285 5 #reduceActionFornull_conditional_operations1:) 
	#(285 5 #reduceActionFornull_conditional_operations2:) 
	#(336 4 #reduceActionForlet_clause1:) 
	#(338 3 #reduceActionForquery_continuation1:) 
	#(429 6 #reduceActionForconstant_declaration1:) 
	#(440 3 #reduceActionForvariable_declarator2:) 
	#(439 3 #reduceActionForlocal_variable_declarators2:) 
	#(448 3 #reduceActionFormember_name2:) 
	#(463 2 #reduceActionForproperty_body2:) 
	#(474 6 #reduceActionForevent_declaration1:) 
	#(486 3 #reduceActionForindexer_body2:) 
	#(486 3 #reduceActionForindexer_body1:) 
	#(466 2 #reduceActionForattribute_target_specifier1:) 
	#(469 1 #liftFirstValue:) 
	#(466 2 #reduceActionForaccessor_declarations2:) 
	#(467 1 #liftFirstValue:) 
	#(472 1 #reduceActionForextern_alias_directives1:) 
	#(471 1 #reduceActionFor_extern_alias_directives2:) 
	#(496 3 #reduceActionFormethod_body2:) 
	#(502 0 #nil) 
	#(457 1 #liftFirstValue:) 
	#(456 1 #liftFirstValue:) 
	#(507 1 #reduceActionForordering_direction2:) 
	#(507 1 #reduceActionForordering_direction1:) 
	#(505 6 #reduceActionForstatic_constructor_declaration1:) 
	#(561 5 #reduceActionForattribute_section2:) 
	#(580 3 #reduceActionFornamed_argument1:) 
	#(577 3 #reduceActionForlocal_variable_declarators2:) 
	#(579 3 #reduceActionForlocal_variable_declarators2:) 
	#(177 5 #reduceActionFornamespace_body1:) 
	#(417 0 #reduceActionFor_extern_alias_directives1:) 
	#(414 1 #reduceActionFor_extern_alias_directives2:) 
	#(512 1 #reduceActionFor_extern_alias_directives2:) 
	#(529 0 #nil) 
	#(531 1 #reduceActionFor_extern_alias_directives2:) 
	#(551 1 #reduceActionFor_extern_alias_directives2:) 
	#(552 1 #reduceActionForinterpolated_regular_string1:) 
	#(544 7 #reduceActionForenum_declaration1:) 
	#(376 7 #reduceActionFordo_statement1:) 
	#(602 2 #reduceActionForattribute_target_specifier1:) 
	#(382 1 #liftFirstValue:) 
	#(383 1 #reduceActionForfor_initializer2:) 
	#(366 7 #reduceActionForif_statement2:) 
	#(286 5 #reduceActionFornull_conditional_member_access2:) 
	#(263 7 #reduceActionForarray_creation_expression1:) 
	#(518 1 #liftFirstValue:) 
	#(373 2 #reduceActionForswitch_label2:) 
	#(368 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(370 2 #reduceActionForextern_alias_directives2:) 
	#(371 2 #reduceActionForswitch_section1:) 
	#(372 2 #reduceActionForextern_alias_directives2:) 
	#(396 4 #reduceActionForlet_clause1:) 
	#(434 3 #reduceActionForconstant_declarator1:) 
	#(433 3 #reduceActionForlocal_variable_declarators2:) 
	#(464 0 #reduceActionFor_attribute_target_specifier1:) 
	#(485 5 #reduceActionForindexer_declarator1:) 
	#(472 2 #reduceActionForaccessor_modifiers5:) 
	#(501 5 #reduceActionForconstructor_declarator1:) 
	#(502 1 #liftFirstValue:) 
	#(452 3 #reduceActionForlocal_variable_declarators2:) 
	#(451 3 #reduceActionForlocal_variable_declarators2:) 
	#(575 5 #reduceActionForattribute_arguments2:) 
	#(411 3 #reduceActionFortype_parameter_list1:) 
	#(412 2 #reduceActionFortype_parameters1:) 
	#(415 2 #reduceActionForclass_base1:) 
	#(416 1 #reduceActionForinterpolated_regular_string1:) 
	#(415 2 #reduceActionForclass_base2:) 
	#(417 1 #reduceActionFor_extern_alias_directives2:) 
	#(418 1 #reduceActionForextern_alias_directives1:) 
	#(513 2 #reduceActionForstruct_interfaces1:) 
	#(527 3 #reduceActionForvariant_type_parameter_list1:) 
	#(530 1 #liftFirstValue:) 
	#(529 1 #liftFirstValue:) 
	#(532 2 #reduceActionForstruct_interfaces1:) 
	#(547 3 #reduceActionForanonymous_object_initializer1:) 
	#(553 2 #reduceActionForenum_member_declaration1:) 
	#(385 8 #reduceActionForforeach_statement1:) 
	#(286 6 #reduceActionFornull_conditional_member_access1:) 
	#(373 3 #reduceActionForswitch_label1:) 
	#(398 4 #reduceActionForexception_filter1:) 
	#(610 5 #reduceActionForstackalloc_initializer1:) 
	#(463 4 #reduceActionForproperty_body1:) 
	#(464 1 #reduceActionFor_extern_alias_directives2:) 
	#(474 8 #reduceActionForevent_declaration2:) 
	#(478 2 #reduceActionForattribute_target_specifier1:) 
	#(478 2 #reduceActionForaccessor_declarations2:) 
	#(473 1 #reduceActionForordering_direction2:) 
	#(473 1 #reduceActionForordering_direction1:) 
	#(468 4 #reduceActionForget_accessor_declaration1:) 
	#(470 4 #reduceActionForset_accessor_declaration1:) 
	#(458 4 #reduceActionForparameter_array1:) 
	#(454 0 #reduceActionFor_attribute_target_specifier1:) 
	#(589 8 #reduceActionFordestructor_declaration1:) 
	#(426 0 #reduceActionFor_extern_alias_directives1:) 
	#(418 2 #reduceActionForextern_alias_directives2:) 
	#(515 0 #reduceActionFor_extern_alias_directives1:) 
	#(528 3 #reduceActionForvariant_type_parameters1:) 
	#(534 0 #reduceActionFor_extern_alias_directives1:) 
	#(547 4 #reduceActionForanonymous_object_initializer2:) 
	#(552 3 #reduceActionForlocal_variable_declarators2:) 
	#(377 9 #reduceActionForfor_statement1:) 
	#(465 2 #reduceActionForattribute_target_specifier1:) 
	#(479 3 #reduceActionForadd_accessor_declaration1:) 
	#(480 3 #reduceActionForremove_accessor_declaration1:) 
	#(485 7 #reduceActionForindexer_declarator2:) 
	#(495 7 #reduceActionForconversion_operator_declarator2:) 
	#(495 7 #reduceActionForconversion_operator_declarator1:) 
	#(491 7 #reduceActionForunary_operator_declarator1:) 
	#(453 5 #reduceActionForfixed_parameter1:) 
	#(454 1 #reduceActionFor_extern_alias_directives2:) 
	#(412 4 #reduceActionFortype_parameters2:) 
	#(415 4 #reduceActionForclass_base3:) 
	#(416 3 #reduceActionForlocal_variable_declarators2:) 
	#(426 1 #reduceActionFor_extern_alias_directives2:) 
	#(427 1 #reduceActionForextern_alias_directives1:) 
	#(406 10 #reduceActionForclass_declaration1:) 
	#(517 1 #liftFirstValue:) 
	#(515 1 #reduceActionFor_extern_alias_directives2:) 
	#(516 1 #reduceActionForextern_alias_directives1:) 
	#(604 0 #reduceActionFor_extern_alias_directives1:) 
	#(508 10 #reduceActionForstruct_declaration1:) 
	#(534 1 #reduceActionFor_extern_alias_directives2:) 
	#(535 1 #reduceActionForextern_alias_directives1:) 
	#(536 1 #liftFirstValue:) 
	#(585 0 #nil) 
	#(522 10 #reduceActionForinterface_declaration1:) 
	#(553 4 #reduceActionForenum_member_declaration2:) 
	#(327 9 #reduceActionForjoin_clause1:) 
	#(443 10 #reduceActionFormethod_header1:) 
	#(455 2 #reduceActionForattribute_target_specifier1:) 
	#(421 1 #reduceActionForprimary_constraint2:) 
	#(421 1 #reduceActionForprimary_constraint3:) 
	#(421 1 #reduceActionForprimary_constraint1:) 
	#(423 1 #reduceActionForprimary_constraint1:) 
	#(422 1 #reduceActionForinterpolated_regular_string1:) 
	#(419 4 #reduceActionFortype_parameter_constraints_clause1:) 
	#(420 1 #reduceActionForinterpolated_regular_string1:) 
	#(420 1 #reduceActionFor_extern_alias_directives2:) 
	#(425 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(427 2 #reduceActionForextern_alias_directives2:) 
	#(514 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(516 2 #reduceActionForextern_alias_directives2:) 
	#(606 1 #liftFirstValue:) 
	#(604 1 #reduceActionFor_extern_alias_directives2:) 
	#(605 1 #reduceActionForextern_alias_directives1:) 
	#(528 5 #reduceActionForvariant_type_parameters2:) 
	#(533 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(535 2 #reduceActionForextern_alias_directives2:) 
	#(585 1 #liftFirstValue:) 
	#(554 11 #reduceActionFordelegate_declaration1:) 
	#(503 5 #reduceActionForconstructor_initializer1:) 
	#(503 5 #reduceActionForconstructor_initializer2:) 
	#(605 2 #reduceActionForextern_alias_directives2:) 
	#(328 11 #reduceActionForjoin_into_clause1:) 
	#(493 10 #reduceActionForbinary_operator_declarator1:) 
	#(424 3 #reduceActionForconstructor_constraint1:) 
	#(420 3 #reduceActionFortype_parameter_constraints4:) 
	#(420 3 #reduceActionFortype_parameter_constraints5:) 
	#(422 3 #reduceActionForlocal_variable_declarators2:) 
	#(420 3 #reduceActionForlocal_variable_declarators2:) 
	#(607 1 #liftFirstValue:) 
	#(608 1 #reduceActionForextern_alias_directives1:) 
	#(420 5 #reduceActionFortype_parameter_constraints7:) 
	#(603 6 #reduceActionForfixed_size_buffer_declaration1:) 
	#(608 2 #reduceActionForextern_alias_directives2:) 
	#(542 6 #reduceActionForinterface_event_declaration1:) 
	#(539 1 #reduceActionForordering_direction1:) 
	#(539 1 #reduceActionForordering_direction2:) 
	#(538 7 #reduceActionForinterface_property_declaration1:) 
	#(539 2 #reduceActionForattribute_target_specifier1:) 
	#(539 2 #reduceActionForaccessor_declarations2:) 
	#(609 4 #reduceActionForfixed_size_buffer_declarator1:) 
	#(540 3 #reduceActionForinterface_get_accessor1:) 
	#(541 3 #reduceActionForinterface_get_accessor1:) 
	#(543 10 #reduceActionForinterface_indexer_declaration1:) 
	#(537 10 #reduceActionForinterface_method_declaration1:)
	).
]

{ #category : #generated }
CSharpParser >> symbolNames [
	^ #('"!"' '"!="' '"%"' '"%="' '"&"' '"&&"' '"&="' '"("' '")"' '"*"' '"*="' '"+"' '"++"' '"+="' '","' '"-"' '"--"' '"-="' '"->"' '"."' '"/"' '"/="' '":"' '"::"' '";"' '"<"' '"<<"' '"<<="' '"<="' '"="' '"=="' '"=>"' '">="' '">>="' '"?"' '"??"' '"["' '"]"' '"^"' '"^="' '"abstract"' '"add"' '"alias"' '"as"' '"ascending"' '"assembly"' '"await"' '"base"' '"bool"' '"break"' '"by"' '"byte"' '"case"' '"catch"' '"char"' '"checked"' '"class"' '"const"' '"continue"' '"decimal"' '"default"' '"delegate"' '"descending"' '"do"' '"double"' '"else"' '"enum"' '"equals"' '"event"' '"explicit"' '"extern"' '"false"' '"field"' '"finally"' '"fixed"' '"float"' '"for"' '"foreach"' '"from"' '"get"' '"goto"' '"group"' '"if"' '"implicit"' '"in"' '"int"' '"interface"' '"internal"' '"into"' '"is"' '"join"' '"let"' '"lock"' '"long"' '"method"' '"module"' '"nameof"' '"namespace"' '"new"' '"object"' '"on"' '"operator"' '"orderby"' '"out"' '"override"' '"param"' '"params"' '"partial"' '"private"' '"property"' '"protected"' '"public"' '"readonly"' '"ref"' '"remove"' '"return"' '"sbyte"' '"sealed"' '"select"' '"set"' '"short"' '"sizeof"' '"stackalloc"' '"static"' '"string"' '"struct"' '"switch"' '"this"' '"throw"' '"true"' '"try"' '"type"' '"typeof"' '"uint"' '"ulong"' '"unchecked"' '"unsafe"' '"ushort"' '"using"' '"var"' '"virtual"' '"void"' '"volatile"' '"when"' '"where"' '"while"' '"yield"' '"{"' '"|"' '"|="' '"||"' '"~"' '<gt>' '<gtgt>' '<rightBrace>' '<comment>' '<Identifier>' '<IntegerLiteral>' '<RealLiteral>' '<CharacterLiteral>' '<InterpolatedRegularStringWhole>' '<InterpolatedRegularStringStart>' '<InterpolatedRegularStringEnd>' '<InterpolatedRegularStringMid>' '<InterpolatedVerbatimStringLiteral>' '<InterpolatedVerbatimStringStart>' '<InterpolatedVerbatimStringEnd>' '<InterpolatedVerbatimStringMid>' '<StringLiteral>' '<NullLiteral>' '<whitespace>' '<patternToken>' 'B e g i n' 'compilation_unit' 'namespace_declaration' 'qualified_identifier' 'namespace_body' '_extern_alias_directives' 'extern_alias_directives' 'extern_alias_directive' '_using_directives' 'using_directives' 'using_directive' 'using_alias_directive' 'using_namespace_directive' 'using_static_directive' '_namespace_member_declarations' 'namespace_member_declarations' 'namespace_member_declaration' 'type_declaration' 'qualified_alias_member' 'namespace_name' 'type_name' 'namespace_or_type_name' '_type' 'type' 'value_type' 'struct_type' 'simple_type' 'numeric_type' 'integral_type' 'floating_point_type' 'nullable_type' 'non_nullable_value_type' 'enum_type' 'reference_type' 'class_type' 'interface_type' 'array_type' 'non_array_type' '_rank_specifiers' 'rank_specifiers' 'rank_specifier' '_dim_separators' 'dim_separators' 'delegate_type' 'type_argument_list' 'type_arguments' 'type_argument' 'variable_reference' '_argument_list' 'argument_list' 'argument' '_argument_name' 'argument_name' 'argument_value' 'primary_expression' 'primary_no_array_creation_expression' 'interpolated_string_expression' 'interpolated_regular_string' 'StartInterpolatedString' 'interpolated_regular_string_body' 'interpolation' 'interpolated_verbatim_string' 'StartInterpolatedVerbatimString' 'interpolated_verbatim_string_body' 'simple_name' '_type_argument_list' 'parenthesized_expression' 'member_access' 'qualified_alias_member_expression' 'predefined_type_expression' 'predefined_type' 'invocation_expression' 'element_access' 'expression_list' 'this_access' 'base_access' 'post_increment_expression' 'post_decrement_expression' 'object_creation_expression' '_object_or_collection_initializer' 'object_or_collection_initializer' 'object_initializer' '_member_initializer_list' 'member_initializer_list' 'member_initializer' 'initializer_target' 'initializer_value' 'collection_initializer' 'element_initializer_list' 'element_initializer' 'array_creation_expression' 'delegate_creation_expression' 'anonymous_object_creation_expression' 'anonymous_object_initializer' '_member_declarator_list' 'member_declarator_list' 'member_declarator' 'typeof_expression' 'unbound_type_name' '_generic_dimension_specifier' 'generic_dimension_specifier' '_commas' 'commas' 'checked_expression' 'unchecked_expression' 'default_value_expression' 'nameof_expression' 'named_entity' 'named_entity_target' 'unary_expression' 'null_conditional_expression' '_null_conditional_operations' 'null_conditional_operations' 'null_conditional_member_access' 'null_conditional_invocation_expression' 'pre_increment_expression' 'pre_decrement_expression' 'cast_expression' 'await_expression' 'multiplicative_expression' 'additive_expression' 'shift_expression' 'relational_expression' 'equality_expression' 'and_expression' 'exclusive_or_expression' 'inclusive_or_expression' 'conditional_and_expression' 'conditional_or_expression' 'null_coalescing_expression' 'conditional_expression' 'lambda_expression' 'anonymous_method_expression' 'anonymous_function_signature' '_explicit_anonymous_function_signature' 'explicit_anonymous_function_signature' '_explicit_anonymous_function_paramenter_list' 'explicit_anonymous_function_paramenter_list' 'explicit_anonymous_function_paramenter' '_anonymous_function_parameter_modifier' 'anonymous_function_parameter_modifier' 'implicit_anonymous_function_signature' '_implicit_anonymous_function_parameter_list' 'implicit_anonymous_function_parameter_list' 'implicit_anonymous_function_parameter' 'anonymous_function_body' 'query_expression' 'from_clause' 'query_body' '_query_body_clauses' 'query_body_clauses' 'query_body_clause' 'let_clause' 'where_clause' 'join_clause' 'join_into_clause' 'orderby_clause' 'orderings' 'ordering' '_ordering_direction' 'ordering_direction' 'select_or_group_clause' 'select_clause' 'group_clause' '_query_continuation' 'query_continuation' 'assignment' 'assignment_operator' '_expression' 'expression' 'non_assignment_expression' 'constant_expression' 'boolean_expression' 'statement' 'embedded_statement' 'block' '_statement_list' 'statement_list' 'empty_statement' 'labeled_statement' 'declaration_statement' 'local_variable_declaration' 'local_variable_type' 'local_variable_declarators' 'local_variable_declarator' '_local_variable_declarator_name' 'local_variable_initializer' 'local_constant_declaration' 'const_declarators' 'const_declarator' 'expression_statement' 'statement_expression' 'selection_statement' 'if_statement' 'switch_statement' 'switch_block' '_switch_sections' 'switch_sections' 'switch_section' 'switch_labels' 'switch_label' 'iteration_statement' 'while_statement' 'do_statement' 'for_statement' '_for_initializer' 'for_initializer' '_for_condition' 'for_condition' '_for_iterator' 'for_iterator' 'statement_expression_list' 'foreach_statement' 'jump_statement' 'break_statement' 'continue_statement' 'goto_statement' 'return_statement' 'throw_statement' 'try_statement' 'catch_clauses' 'catch_clause' '_exception_specifier' 'exception_specifier' '_exception_filter' 'exception_filter' 'finally_clause' 'checked_statement' 'unchecked_statement' 'lock_statement' 'using_statement' 'resource_acquisition' 'yield_statement' 'class_declaration' '_class_modifiers' 'class_modifiers' 'class_modifier' '_type_parameter_list' 'type_parameter_list' 'type_parameters' 'type_parameter' '_class_base' 'class_base' 'interface_type_list' '_type_parameter_constraints_clauses' 'type_parameter_constraints_clauses' 'type_parameter_constraints_clause' 'type_parameter_constraints' 'primary_constraint' 'secondary_constraints' 'interface_type_constraint' 'constructor_constraint' 'class_body' '_class_member_declarations' 'class_member_declarations' 'class_member_declaration' 'constant_declaration' '_constant_modifiers' 'constant_modifers' 'constant_modifer' 'constant_declarators' 'constant_declarator' 'field_declaration' '_field_modifiers' 'field_modifiers' 'field_modifier' 'variable_declarators' 'variable_declarator' 'variable_initializer' 'method_declaration' 'method_header' '_method_modifiers' 'method_modifiers' 'method_modifier' 'return_type' 'member_name' 'method_body' '_formal_parameters_list' 'formal_parameters_list' 'fixed_parameters' 'fixed_parameter' '_default_argument' 'default_argument' '_parameter_modifier' 'parameter_modifier' 'parameter_array' 'property_declaration' '_property_modifiers' 'property_modifiers' 'property_modifier' 'property_body' '_property_initializer' 'property_initializer' 'accessor_declarations' '_get_accessor_declaration' 'get_accessor_declaration' '_set_accessor_declaration' 'set_accessor_declaration' '_accessor_modifiers' 'accessor_modifiers' 'accessor_body' 'event_declaration' '_event_modifiers' 'event_modifiers' 'event_modifier' 'event_accessor_declarations' 'add_accessor_declaration' 'remove_accessor_declaration' 'indexer_declaration' '_indexer_modifiers' 'indexer_modifiers' 'indexer_modifier' 'indexer_declarator' 'indexer_body' 'operator_declaration' 'operator_modifiers' 'operator_modifier' 'operator_declarator' 'unary_operator_declarator' 'overloadable_unary_operator' 'binary_operator_declarator' 'overloadable_binary_operator' 'conversion_operator_declarator' 'operator_body' 'constructor_declaration' '_constructor_modifiers' 'constructor_modifiers' 'constructor_modifier' 'constructor_declarator' '_constructor_initializer' 'constructor_initializer' 'constructor_body' 'static_constructor_declaration' 'static_constructor_modifiers' 'static_constructor_body' 'struct_declaration' '_struct_modifiers' 'struct_modifiers' 'struct_modifier' '_struct_interfaces' 'struct_interfaces' 'struct_body' '_struct_member_declarations' 'struct_member_declarations' 'struct_member_declaration' '_array_initializer' 'array_initializer' '_variable_initializer_list' 'variable_initializer_list' 'interface_declaration' '_interface_modifiers' 'interface_modifiers' 'interface_modifier' '_variant_type_parameter_list' 'variant_type_parameter_list' 'variant_type_parameters' '_variance_annotation' 'variance_annotation' '_interface_base' 'interface_base' 'interface_body' '_interface_member_declarations' 'interface_member_declarations' 'interface_member_declaration' 'interface_method_declaration' 'interface_property_declaration' 'interface_accessors' 'interface_get_accessor' 'interface_set_accessor' 'interface_event_declaration' 'interface_indexer_declaration' 'enum_declaration' '_enum_base' 'enum_base' 'enum_body' '_enum_modifers' 'enum_modifers' 'enum_modifer' '_enum_member_declarations' 'enum_member_declarations' 'enum_member_declaration' 'delegate_declaration' '_delegate_modifiers' 'delegate_modifiers' 'delegate_modifier' '_global_attributes' 'global_attributes' 'global_attribute_sections' 'global_attribute_section' 'global_attribute_target_specifier' 'global_attribute_target' '_attributes' 'attributes' 'attribute_sections' 'attribute_section' '_attribute_target_specifier' 'attribute_target_specifier' 'attribute_target' 'attribute_list' 'attribute' 'attribute_name' '_attribute_arguments' 'attribute_arguments' '_positional_argument_list' 'positional_argument_list' 'positional_argument' 'named_argument_list' 'named_argument' 'attribute_argument_expression' 'literal' 'boolean_literal' '_semicolon' '_new' '_partial' '_extern' '_identifier' 'destructor_declaration' '_unsafe' 'unsafe_statement' 'pointer_type' 'unmanaged_type' 'pointer_indirection_expression' 'pointer_member_access' 'pointer_element_access' 'addressof_expression' 'sizeof_expression' 'fixed_statement' 'fixed_pointer_declarators' 'fixed_pointer_declarator' 'fixed_pointer_initializer' 'fixed_size_buffer_declaration' '_fixed_size_buffer_modifiers' 'fixed_size_buffer_modifiers' 'fixed_size_buffer_modifier' 'buffer_element_type' 'fixed_size_buffer_declarators' 'fixed_size_buffer_declarator' 'stackalloc_initializer' 'void_type' 'E O F' 'error')
]

{ #category : #generated }
CSharpParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #CSCompilationUnitNode #CSCompilationUnitNode #CSNamespaceDeclarationNode #CSQualifiedIdentifierNode #OrderedCollection #OrderedCollection #OrderedCollection #CSExternAliasDirectiveNode #OrderedCollection #OrderedCollection #CSUsingDirectiveNode #CSUsingAliasDirectiveNode #CSUsingNamespaceDirectiveNode #CSUsingStaticDirectiveNode #OrderedCollection #OrderedCollection #CSDeclarationNode #CSDeclarationNode #CSQualifiedAliasMemberNode #CSTypeNode #CSTypeNode #CSTypeNode #CSTypeNode #CSTypeNode #CSTypeNode #CSTypeNode #CSSimpleTypeNode #SmaCCToken #SmaCCToken #SmaCCToken #CSNullableTypeNode #CSTypeNode #CSTypeNode #CSTypeNode #CSTypeNode #CSTypeNode #CSArrayTypeNode #CSTypeNode #OrderedCollection #OrderedCollection #CSRankSpecifierNode #OrderedCollection #OrderedCollection #CSTypeNode #CSTypeArgumentListNode #OrderedCollection #CSTypeNode #CSExpressionNode #OrderedCollection #OrderedCollection #CSArgumentNode #OrderedCollection #OrderedCollection #OrderedCollection #CSExpressionNode #CSExpressionNode #CSInterpolatedStringExpressionNode #OrderedCollection #ByteSymbol #OrderedCollection #CSInterpolationNode #OrderedCollection #ByteSymbol #OrderedCollection #CSSimpleNameNode #CSTypeArgumentListNode #CSExpressionNode #CSMemberAccessNode #CSTypeExpressionNode #CSTypeExpressionNode #CSSimpleTypeNode #CSInvocationExpressionNode #CSElementAccessNode #OrderedCollection #CSThisAccessNode #CSBaseAccessNode #CSPostExpressionNode #CSPostExpressionNode #CSObjectCreationExpressionNode #CSProgramNode #CSProgramNode #CSObjectInitializerNode #OrderedCollection #OrderedCollection #CSMemberInitializerNode #OrderedCollection #CSProgramNode #CSCollectionInitializerNode #OrderedCollection #CSElementInitializerNode #CSArrayCreationExpressionNode #CSDelegateCreationExpressionNode #CSAnonymousObjectCreationExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #CSMemberDeclaratorNode #CSTypeofExpressionNode #CSUnboundTypeNameNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSCheckedExpressionNode #CSUncheckedExpressionNode #CSDefaultValueExpressionNode #CSNameofExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSNullConditionalExpressionNode #CSExpressionNode #CSExpressionNode #CSNullConditionalMemberAccessNode #CSNullConditionalInvocationExpressionNode #CSPrefixExpressionNode #CSPrefixExpressionNode #CSCastExpressionNode #CSAwaitExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSLambdaExpressionNode #CSAnonymousMethodExpressionNode #CSProgramNode #CSExplicitAnonymousFunctionSignatureNode #CSExplicitAnonymousFunctionSignatureNode #OrderedCollection #OrderedCollection #CSAnonymousFunctionParameterNode #SmaCCToken #SmaCCToken #CSImplicitAnonymousFunctionSignatureNode #OrderedCollection #OrderedCollection #SmaCCToken #CSProgramNode #CSQueryExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSAssignmentNode #SmaCCToken #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSStatementNode #CSStatementNode #CSBlockStatementNode #OrderedCollection #OrderedCollection #CSEmptyStatementNode #CSLabeledStatementNode #CSDeclarationStatementNode #CSLocalVariableDeclarationNode #CSTypeNode #OrderedCollection #CSLocalVariableDeclaratorNode #CSSimpleNameNode #CSProgramNode #CSLocalConstantDeclarationNode #OrderedCollection #CSConstDeclaratorNode #CSExpressionStatementNode #CSExpressionNode #CSStatementNode #CSIfStatementNode #CSSwitchStatementNode #OrderedCollection #OrderedCollection #OrderedCollection #CSSwitchSectionNode #OrderedCollection #CSSwitchLabelNode #CSStatementNode #CSWhileStatementNode #CSDoStatementNode #CSForStatementNode #CSProgramNode #CSProgramNode #CSExpressionNode #CSExpressionNode #CSStatementListNode #CSStatementListNode #OrderedCollection #CSForeachStatementNode #CSStatementNode #CSBreakStatementNode #CSContinueStatementNode #CSGotoStatementNode #CSReturnStatementNode #CSThrowStatementNode #CSTryStatementNode #OrderedCollection #CSCatchClauseNode #OrderedCollection #OrderedCollection #CSExceptionFilterNode #CSExceptionFilterNode #CSFinallyClauseNode #CSCheckedStatementNode #CSUncheckedStatementNode #CSLockStatementNode #CSUsingStatementNode #CSProgramNode #CSYieldStatementNode #CSClassDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #CSTypeParameterListNode #CSTypeParameterListNode #OrderedCollection #CSTypeNameNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSTypeParameterConstraintsClauseNode #OrderedCollection #CSProgramNode #OrderedCollection #CSTypeConstraintNode #CSConstructorConstraintNode #OrderedCollection #OrderedCollection #OrderedCollection #CSDeclarationNode #CSConstantDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #CSConstantDeclaratorNode #CSFieldDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #CSVariableDeclaratorNode #CSProgramNode #CSMethodDeclarationNode #CSMethodHeaderNode #OrderedCollection #OrderedCollection #SmaCCToken #CSTypeNode #OrderedCollection #CSMethodBodyNode #OrderedCollection #OrderedCollection #OrderedCollection #CSFixedParameterNode #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #CSArrayParameterNode #CSPropertyDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSGetAccessorDeclarationNode #CSGetAccessorDeclarationNode #CSSetAccessorDeclarationNode #CSSetAccessorDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #CSEventDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #CSAddAccessorDeclarationNode #CSRemoveAccessorDeclarationNode #CSIndexerDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #CSOperatorDeclarationNode #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #SmaCCToken #OrderedCollection #CSMethodBodyNode #CSConstructorDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #CSConstructorInitializerNode #CSConstructorInitializerNode #OrderedCollection #CSStaticConstructorDeclarationNode #OrderedCollection #OrderedCollection #CSStructDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSDeclarationNode #CSArrayInitializerNode #CSArrayInitializerNode #OrderedCollection #OrderedCollection #CSInterfaceDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #CSVariantTypeParameterListNode #CSVariantTypeParameterListNode #OrderedCollection #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSDeclarationNode #CSInterfaceMethodDeclarationNode #CSInterfacePropertyDeclarationNode #OrderedCollection #CSInterfacePropertyAccessorNode #CSInterfacePropertyAccessorNode #CSInterfaceEventDeclarationNode #CSInterfaceIndexerDeclarationNode #CSEnumDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #CSEnumDeclarationNode #CSDelegateDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #CSAttributeNode #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #CSAttributeNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #CSAttributeValueNode #CSTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSExpressionNode #OrderedCollection #CSNamedArgumentNode #CSExpressionNode #CSLiteralExpressionNode #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #CSDestructorDeclarationNode #SmaCCToken #CSUnsafeStatementNode #CSPointerTypeNode #CSTypeNode #CSPrefixExpressionNode #CSPointerMemberAccessNode #CSPointerElementAccessNode #CSPrefixExpressionNode #CSSizeofExpressionNode #CSFixedStatementNode #OrderedCollection #CSFixedPointerDeclaratorNode #OrderedCollection #CSFixedSizeBufferDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #CSTypeNode #OrderedCollection #CSFixedSizeBufferDeclaratorNode #CSStackallocInitializerNode #CSVoidTypeNode #SmaCCToken #SmaCCToken)
]

{ #category : #generated }
CSharpParser >> transitionTable [
^#(
#[1 0 6 0 37 0 6 0 41 0 6 0 57 0 6 0 62 0 6 0 67 0 29 0 71 0 6 0 87 0 6 0 88 0 6 0 98 0 6 0 99 0 6 0 108 0 6 0 109 0 6 0 111 0 6 0 112 0 6 0 118 0 6 0 124 0 6 0 126 0 6 0 137 0 6 0 139 0 33 0 174 0 37 0 178 0 41 0 179 0 45 0 180 0 6 2 100] 
#[1 0 49 0 37 0 10 0 41 0 10 0 57 0 10 0 62 0 10 0 67 0 10 0 87 0 10 0 88 0 53 0 98 0 10 0 99 0 10 0 108 0 10 0 109 0 10 0 111 0 10 0 112 0 10 0 118 0 10 0 124 0 10 0 126 0 10 0 137 0 61 0 175 0 61 0 189 0 61 0 190 0 61 1 150 0 61 1 252 0 61 2 10 0 61 2 32 0 61 2 42 0 89 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 0 149 0 49 0 153 0 50 0 157 0 52 0 161 0 55 0 165 0 56 0 169 0 58 0 173 0 59 0 177 0 60 0 181 0 61 0 185 0 62 0 189 0 64 0 193 0 65 2 217 0 72 0 201 0 75 0 205 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 0 225 0 86 0 229 0 93 0 233 0 94 0 237 0 97 0 241 0 99 0 245 0 100 0 249 0 116 0 253 0 117 1 1 0 121 1 5 0 122 1 9 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 1 37 0 134 1 41 0 135 1 45 0 136 1 49 0 137 1 53 0 138 1 57 0 139 1 61 0 140 1 65 0 142 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 1 85 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 1 129 0 196 1 129 0 197 1 129 0 198 1 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 1 129 0 203 1 161 0 204 1 129 0 205 1 129 0 206 1 129 0 207 1 129 0 208 1 129 0 209 1 185 0 210 1 129 0 216 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 2 85 1 90 2 85 1 91 2 85 1 92 2 85 1 95 2 85 1 96 2 85 1 97 2 109 1 98 2 113 1 99 2 117 1 104 2 85 1 107 2 125 1 108 2 85 1 109 2 85 1 110 2 85 1 111 2 85 1 118 2 85 1 119 2 85 1 120 2 85 1 121 2 85 1 129 2 85 1 130 2 85 1 131 2 85 1 132 2 85 1 133 2 85 1 134 2 85 1 135 2 85 1 136 2 85 1 144 2 85 1 145 2 85 1 146 2 85 1 147 2 85 1 149 1 129 1 157 1 197 2 70 2 217 2 71 2 85 2 79 1 129 2 80 2 229 2 81 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 2 85 2 87 3 1 2 99] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 3 205 1 47 3 205 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 3 205 1 63 3 197 1 64 3 205 1 83 3 205 1 86 3 205 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 1 77 0 148 3 213 1 92] 
#[1 0 49 0 37 0 10 0 41 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 57 0 10 0 58 0 10 0 60 0 10 0 62 0 10 0 65 0 10 0 67 0 10 0 69 0 10 0 71 0 10 0 76 0 10 0 86 0 10 0 87 0 10 0 88 0 10 0 94 0 10 0 99 0 10 0 100 0 10 0 105 0 10 0 108 0 10 0 109 0 10 0 111 0 10 0 112 0 10 0 113 0 10 0 117 0 10 0 118 0 10 0 121 0 10 0 124 0 10 0 125 0 10 0 126 0 10 0 134 0 10 0 135 0 10 0 137 0 10 0 138 0 10 0 141 0 10 0 142 0 10 0 143 0 10 0 152 0 10 0 157 3 221 0 190 3 221 1 150 3 221 1 172 3 221 1 173 3 221 1 179 3 221 1 186 3 237 1 187 3 221 1 203 3 221 1 218 3 221 1 225 3 221 1 231 3 221 1 241 3 221 1 249 3 221 1 252 3 221 2 10 3 221 2 32 3 221 2 42 4 9 2 52 0 93 2 53 0 97 2 54 0 101 2 55 3 221 2 77] 
#[0 4 17 0 43] 
#[0 0 0 2 100] 
#[1 0 22 0 37 0 22 0 41 0 22 0 57 0 22 0 62 0 22 0 67 0 22 0 87 0 22 0 88 0 22 0 98 0 22 0 99 0 22 0 108 0 22 0 109 0 22 0 111 0 22 0 112 0 22 0 118 0 22 0 124 0 22 0 126 0 22 0 137 4 21 0 139 4 25 0 181 4 29 0 182 4 33 0 183 4 33 0 184 4 33 0 185 4 33 0 186 0 22 2 100] 
#[1 0 26 0 37 0 26 0 41 0 26 0 57 0 26 0 62 0 26 0 67 0 29 0 71 0 26 0 87 0 26 0 88 0 26 0 98 0 26 0 99 0 26 0 108 0 26 0 109 0 26 0 111 0 26 0 112 0 26 0 118 0 26 0 124 0 26 0 126 0 26 0 137 0 26 0 139 0 26 0 155 4 49 0 180 0 26 2 100] 
#[0 0 30 0 37 0 41 0 57 0 62 0 67 0 71 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[1 4 89 0 69 4 89 0 73 4 89 0 95 4 89 0 106 4 89 0 110 4 89 0 116 4 89 0 132 0 34 0 157 4 81 2 56 4 85 2 57 4 89 2 58] 
#[1 4 93 0 157 4 97 0 176] 
#[0 0 38 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 155 2 100] 
#[0 0 0 2 100] 
#[0 0 38 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 155 2 100] 
#[0 0 42 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 0 42 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 0 42 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 0 42 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 0 42 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 4 145 0 41 0 46 0 57 0 50 0 62 0 54 0 67 0 58 0 87 4 105 0 88 4 109 0 99 0 7 0 108 4 113 0 109 4 117 0 111 4 121 0 112 4 145 0 118 4 145 0 124 0 62 0 126 4 133 0 137 4 137 1 151 4 141 1 152 4 145 1 153 4 149 1 253 4 153 1 254 4 157 1 255 4 161 2 11 4 165 2 12 4 169 2 13 4 173 2 36 4 177 2 37 4 181 2 38 4 185 2 43 4 189 2 44 4 193 2 45] 
#[0 0 66 0 41 0 42 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 80 0 85 0 86 0 87 0 88 0 94 0 99 0 100 0 104 0 105 0 107 0 108 0 109 0 111 0 112 0 113 0 114 0 115 0 117 0 118 0 120 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 157] 
#[1 0 49 0 37 0 70 0 41 0 70 0 42 0 70 0 49 0 70 0 52 0 70 0 55 0 70 0 57 0 70 0 58 0 70 0 60 0 70 0 62 0 70 0 65 0 70 0 67 0 70 0 69 0 70 0 71 0 70 0 75 0 70 0 76 0 70 0 80 0 70 0 85 0 70 0 86 0 70 0 87 0 70 0 88 0 70 0 94 0 70 0 99 0 70 0 100 0 70 0 104 0 70 0 105 0 70 0 107 0 70 0 108 0 70 0 109 0 70 0 111 0 70 0 112 0 70 0 113 0 70 0 114 0 70 0 115 0 70 0 117 0 70 0 118 0 70 0 120 0 70 0 121 0 70 0 124 0 70 0 125 0 70 0 126 0 70 0 128 0 70 0 134 0 70 0 135 0 70 0 137 0 70 0 138 0 70 0 141 0 70 0 142 0 70 0 143 0 70 0 152 0 70 0 157 4 197 2 55] 
#[0 0 74 0 37 0 41 0 42 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 80 0 85 0 86 0 87 0 88 0 94 0 99 0 100 0 104 0 105 0 107 0 108 0 109 0 111 0 112 0 113 0 114 0 115 0 117 0 118 0 120 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 157] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 4 205 1 26 4 205 1 27 4 205 1 32 4 205 1 33 4 205 1 34 4 205 1 35 1 197 1 49 1 197 2 70 2 217 2 71 4 205 2 82 1 197 2 83 1 197 2 84 4 205 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 4 209 1 26 4 209 1 27 4 209 1 32 4 209 1 33 4 209 1 34 4 209 1 35 1 197 1 49 1 197 2 70 2 217 2 71 4 209 2 82 1 197 2 83 1 197 2 84 4 209 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 0 149 0 49 0 157 0 52 0 161 0 55 3 21 0 56 0 177 0 60 0 181 0 61 0 185 0 62 0 193 0 65 2 217 0 72 0 205 0 76 3 37 0 79 0 225 0 86 0 233 0 94 0 237 0 97 0 241 0 99 0 245 0 100 0 253 0 117 1 1 0 121 1 5 0 122 1 9 0 125 1 17 0 128 2 217 0 130 1 33 0 133 1 37 0 134 1 41 0 135 3 73 0 136 1 53 0 138 1 65 0 142 1 81 0 152 4 213 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 4 217 0 196 4 217 0 197 4 217 0 198 4 217 0 199 1 145 0 200 1 145 0 201 1 145 0 202 4 217 0 203 1 161 0 204 4 217 0 205 4 217 0 206 4 217 0 207 4 217 0 208 4 217 0 209 1 185 0 210 4 217 0 216 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 4 221 1 47 4 221 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 4 221 1 63 3 197 1 64 4 221 1 83 4 221 1 86 4 221 1 87 4 217 1 157 1 197 2 70 2 217 2 71 4 217 2 80 2 229 2 81 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86 3 1 2 99] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 4 225 1 26 4 225 1 27 4 225 1 32 4 225 1 33 4 225 1 34 4 225 1 35 1 197 1 49 1 197 2 70 2 217 2 71 4 225 2 82 1 197 2 83 1 197 2 84 4 225 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 4 229 1 26 4 229 1 27 4 229 1 32 4 229 1 33 4 229 1 34 4 229 1 35 1 197 1 49 1 197 2 70 2 217 2 71 4 229 2 82 1 197 2 83 1 197 2 84 4 229 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 4 233 1 26 4 233 1 27 4 233 1 32 4 233 1 33 4 233 1 34 4 233 1 35 1 197 1 49 1 197 2 70 2 217 2 71 4 233 2 82 1 197 2 83 1 197 2 84 4 233 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 4 237 1 26 4 237 1 27 4 237 1 32 4 237 1 33 4 237 1 34 4 237 1 35 1 197 1 49 1 197 2 70 2 217 2 71 4 237 2 82 1 197 2 83 1 197 2 84 4 237 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 4 241 1 26 4 241 1 27 4 241 1 32 4 241 1 33 4 241 1 34 4 241 1 35 1 197 1 49 1 197 2 70 2 217 2 71 4 241 2 82 1 197 2 83 1 197 2 84 4 241 2 85 1 197 2 86] 
#[0 0 78 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 4 245 1 26 4 245 1 27 4 245 1 32 4 245 1 33 4 245 1 34 4 245 1 35 1 197 1 49 1 197 2 70 2 217 2 71 4 245 2 82 1 197 2 83 1 197 2 84 4 245 2 85 1 197 2 86] 
#[1 4 249 0 20 4 253 0 37] 
#[1 0 82 0 9 0 82 0 10 0 86 0 20 0 82 0 35 0 82 0 37 0 82 0 157] 
#[0 5 1 0 25] 
#[1 0 90 0 9 0 90 0 10 0 86 0 20 0 90 0 35 0 90 0 37 0 90 0 157] 
#[1 0 90 0 9 0 90 0 10 0 86 0 20 0 90 0 35 0 90 0 37 0 90 0 157] 
#[1 5 5 0 8 1 77 0 148 5 9 1 92] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 5 81 0 196 5 81 0 197 5 81 0 198 5 81 0 199 1 145 0 200 1 145 0 201 1 145 0 202 5 81 0 203 1 161 0 204 5 81 0 205 5 81 0 206 5 81 0 207 5 81 0 208 5 81 0 209 1 185 0 210 5 81 0 216 5 81 1 157 5 81 2 80 2 229 2 81 3 1 2 99] 
#[0 5 85 0 25] 
#[1 0 94 0 9 0 94 0 10 0 86 0 20 0 94 0 35 0 94 0 37 0 94 0 157] 
#[0 5 89 0 8] 
#[1 5 93 0 8 0 98 0 148 5 97 1 51 5 97 1 52] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 3 9 0 49 0 153 0 50 3 13 0 52 3 17 0 55 0 165 0 56 0 173 0 59 3 25 0 60 0 181 0 61 0 185 0 62 0 189 0 64 3 29 0 65 2 217 0 72 0 201 0 75 3 33 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 3 41 0 86 0 229 0 93 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 0 249 0 116 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 3 65 0 134 3 69 0 135 1 45 0 136 1 49 0 137 3 77 0 138 1 57 0 139 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 5 105 1 91 5 105 1 92 5 105 1 95 5 105 1 107 2 125 1 108 5 105 1 109 5 105 1 110 5 105 1 111 5 105 1 118 5 105 1 119 5 105 1 120 5 105 1 121 5 105 1 129 5 105 1 130 5 105 1 131 5 105 1 132 5 105 1 133 5 105 1 134 5 105 1 135 5 105 1 136 5 105 1 144 5 105 1 145 5 105 1 146 5 105 1 147 5 105 1 149 1 197 2 70 2 217 2 71 5 105 2 79 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 5 105 2 87] 
#[1 0 102 0 9 0 102 0 10 0 86 0 20 0 102 0 35 0 102 0 37 0 102 0 157] 
#[0 0 106 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 109 0 8] 
#[1 0 102 0 9 0 102 0 10 0 86 0 20 0 102 0 35 0 102 0 37 0 102 0 157] 
#[0 5 113 0 8] 
#[0 5 117 0 8] 
#[1 5 121 0 53 5 125 0 61 5 129 0 157] 
#[0 5 133 0 8] 
#[1 0 90 0 9 0 90 0 10 0 86 0 20 0 90 0 35 0 90 0 37 0 90 0 157] 
#[0 5 137 0 8] 
#[1 0 90 0 9 0 90 0 10 0 86 0 20 0 90 0 35 0 90 0 37 0 90 0 157] 
#[0 5 141 0 8] 
#[1 5 145 0 37 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 149 0 148 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 5 153 0 196 5 153 0 197 5 153 0 198 5 153 0 199 1 145 0 200 1 145 0 201 1 145 0 202 5 153 0 203 1 161 0 204 5 153 0 205 5 153 0 206 5 153 0 207 5 153 0 208 5 157 0 209 5 161 0 210 5 165 0 213 5 169 0 216 5 173 1 10 5 153 1 157 5 153 2 80 2 229 2 81 3 1 2 99] 
#[1 0 110 0 9 0 110 0 10 0 86 0 20 0 110 0 35 0 110 0 37 0 110 0 157] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 114 0 25 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 5 177 1 47 5 177 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 5 177 1 63 3 197 1 64 5 177 1 83 5 177 1 85 5 177 1 86 5 177 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 90 0 9 0 90 0 10 0 86 0 20 0 90 0 35 0 90 0 37 0 90 0 157] 
#[1 0 90 0 9 0 90 0 10 0 86 0 20 0 90 0 35 0 90 0 37 0 90 0 157] 
#[0 5 185 0 8] 
#[1 0 110 0 9 0 110 0 10 0 86 0 20 0 110 0 35 0 110 0 37 0 110 0 157] 
#[0 5 189 0 8] 
#[0 0 118 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 114 0 25 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 5 193 1 47 5 193 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 5 193 1 63 3 197 1 64 5 193 1 83 5 193 1 85 5 193 1 86 5 193 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 0 106 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 1 77 0 148 5 197 1 92] 
#[0 5 201 0 8] 
#[1 0 90 0 9 0 90 0 10 0 86 0 20 0 90 0 35 0 90 0 37 0 90 0 157] 
#[1 0 90 0 9 0 90 0 10 0 86 0 20 0 90 0 35 0 90 0 37 0 90 0 157] 
#[1 5 205 0 8 1 77 0 148 5 209 1 92] 
#[1 1 77 0 148 5 213 1 92] 
#[1 0 90 0 9 0 90 0 10 0 86 0 20 0 90 0 35 0 90 0 37 0 90 0 157] 
#[0 5 217 0 8] 
#[0 0 122 0 157] 
#[0 0 126 0 9 0 10 0 157] 
#[0 5 221 0 8] 
#[1 5 225 0 50 5 229 0 116] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 0 149 0 49 0 153 0 50 0 157 0 52 0 161 0 55 0 165 0 56 0 169 0 58 0 173 0 59 0 177 0 60 0 181 0 61 0 185 0 62 0 189 0 64 0 193 0 65 2 217 0 72 0 201 0 75 0 205 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 0 225 0 86 0 229 0 93 0 233 0 94 0 237 0 97 0 241 0 99 0 245 0 100 0 249 0 116 0 253 0 117 1 1 0 121 1 5 0 122 1 9 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 1 37 0 134 1 41 0 135 1 45 0 136 1 49 0 137 1 53 0 138 1 57 0 139 1 61 0 140 1 65 0 142 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 0 130 0 155 1 85 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 1 129 0 196 1 129 0 197 1 129 0 198 1 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 1 129 0 203 1 161 0 204 1 129 0 205 1 129 0 206 1 129 0 207 1 129 0 208 1 129 0 209 1 185 0 210 1 129 0 216 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 5 233 1 90 5 233 1 91 5 233 1 92 5 237 1 93 5 241 1 94 5 233 1 95 5 233 1 96 5 233 1 97 2 109 1 98 2 113 1 99 2 117 1 104 5 233 1 107 2 125 1 108 5 233 1 109 5 233 1 110 5 233 1 111 5 233 1 118 5 233 1 119 5 233 1 120 5 233 1 121 5 233 1 129 5 233 1 130 5 233 1 131 5 233 1 132 5 233 1 133 5 233 1 134 5 233 1 135 5 233 1 136 5 233 1 144 5 233 1 145 5 233 1 146 5 233 1 147 5 233 1 149 1 129 1 157 1 197 2 70 2 217 2 71 5 233 2 79 1 129 2 80 2 229 2 81 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 5 233 2 87 3 1 2 99] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 5 245 1 26 5 245 1 27 5 245 1 32 5 245 1 33 5 245 1 34 5 245 1 35 1 197 1 49 1 197 2 70 2 217 2 71 5 245 2 82 1 197 2 83 1 197 2 84 5 245 2 85 1 197 2 86] 
#[1 0 134 0 4 0 134 0 7 0 134 0 8 0 11 0 10 0 134 0 11 0 134 0 13 0 134 0 14 0 134 0 17 0 134 0 18 0 134 0 19 0 134 0 20 0 134 0 22 5 249 0 23 5 253 0 24 6 1 0 26 0 134 0 28 0 134 0 30 0 134 0 34 0 11 0 35 0 11 0 37 0 134 0 40 0 134 0 150 0 11 0 157 6 9 0 217 6 9 0 238] 
#[0 0 142 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 142 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 142 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 146 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 150 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 142 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 142 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 154 0 9 0 154 0 10 0 15 0 20 0 154 0 35 0 154 0 37 0 154 0 157] 
#[0 0 19 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 182 0 2 0 182 0 5 0 182 0 6 0 182 0 8 0 182 0 9 0 182 0 10 0 182 0 15 0 23 0 20 0 182 0 23 0 182 0 25 0 182 0 26 0 182 0 29 0 182 0 31 0 182 0 32 0 182 0 33 0 182 0 35 0 182 0 36 0 182 0 37 0 182 0 38 0 182 0 39 0 182 0 41 0 182 0 44 0 182 0 45 0 182 0 49 0 182 0 51 0 182 0 52 0 182 0 55 0 182 0 57 0 182 0 58 0 182 0 60 0 182 0 62 0 182 0 63 0 182 0 65 0 182 0 67 0 182 0 68 0 182 0 69 0 182 0 71 0 182 0 75 0 182 0 76 0 182 0 79 0 182 0 82 0 182 0 86 0 182 0 87 0 182 0 88 0 182 0 89 0 182 0 90 0 182 0 91 0 182 0 92 0 182 0 94 0 182 0 99 0 182 0 100 0 182 0 101 0 182 0 102 0 182 0 103 0 182 0 105 0 182 0 108 0 182 0 109 0 182 0 111 0 182 0 112 0 182 0 113 0 182 0 117 0 182 0 118 0 182 0 119 0 182 0 121 0 182 0 124 0 182 0 125 0 182 0 126 0 182 0 128 0 182 0 134 0 182 0 135 0 182 0 137 0 182 0 138 0 182 0 141 0 182 0 142 0 182 0 143 0 182 0 145 0 182 0 148 0 182 0 149 0 182 0 151 0 182 0 152 0 182 0 153 0 182 0 155 0 182 0 157 0 182 0 163 0 182 0 164 0 182 0 167 0 182 0 168 0 182 2 100] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 0 198 0 157] 
#[0 0 202 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 206 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 162 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 82 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 94 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 94 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 162 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 17 0 35] 
#[0 0 206 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 202 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 210 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 210 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 210 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 5 145 0 37 6 21 0 212 6 25 0 213] 
#[0 0 210 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 214 0 4 0 214 0 7 6 29 0 8 0 214 0 11 6 33 0 13 0 214 0 14 6 37 0 17 0 214 0 18 6 41 0 19 6 45 0 20 0 214 0 22 0 214 0 28 0 214 0 30 0 214 0 34 0 218 0 35 0 214 0 40 0 214 0 150 6 49 1 28 6 53 1 29] 
#[1 0 222 0 2 0 222 0 3 0 222 0 4 0 222 0 5 0 222 0 6 0 222 0 7 0 222 0 8 0 222 0 9 0 222 0 10 0 222 0 11 0 222 0 12 0 222 0 13 0 222 0 14 0 222 0 15 0 222 0 16 0 222 0 17 0 222 0 18 0 222 0 19 0 222 0 20 0 222 0 21 0 222 0 22 0 222 0 23 0 222 0 25 0 222 0 26 0 222 0 27 0 222 0 28 0 222 0 29 0 222 0 30 0 222 0 31 0 222 0 33 0 222 0 34 0 222 0 35 0 222 0 36 0 27 0 37 0 222 0 38 0 222 0 39 0 222 0 40 0 222 0 41 0 222 0 44 0 222 0 45 0 222 0 49 0 222 0 51 0 222 0 52 0 222 0 55 0 222 0 57 0 222 0 58 0 222 0 60 0 222 0 62 0 222 0 63 0 222 0 65 0 222 0 67 0 222 0 68 0 222 0 69 0 222 0 71 0 222 0 75 0 222 0 76 0 222 0 79 0 222 0 82 0 222 0 86 0 222 0 87 0 222 0 88 0 222 0 89 0 222 0 90 0 222 0 91 0 222 0 92 0 222 0 94 0 222 0 99 0 222 0 100 0 222 0 101 0 222 0 103 0 222 0 105 0 222 0 108 0 222 0 109 0 222 0 111 0 222 0 112 0 222 0 113 0 222 0 117 0 222 0 118 0 222 0 119 0 222 0 121 0 222 0 124 0 222 0 125 0 222 0 126 0 222 0 134 0 222 0 135 0 222 0 137 0 222 0 138 0 222 0 141 0 222 0 142 0 222 0 143 0 222 0 145 0 222 0 149 0 222 0 150 0 222 0 151 0 222 0 152 0 222 0 153 0 222 0 154 0 222 0 155 0 222 0 157 0 222 0 163 0 222 0 164 0 222 0 167 0 222 0 168 0 222 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 230 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 61 0 162] 
#[0 0 230 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 65 0 166] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 69 0 20] 
#[0 6 73 0 20] 
#[0 0 234 0 20] 
#[1 0 226 0 4 0 226 0 7 0 226 0 8 0 238 0 9 0 226 0 11 0 226 0 13 0 226 0 14 0 238 0 15 0 226 0 17 0 226 0 18 0 226 0 19 0 226 0 20 0 226 0 22 0 238 0 25 0 226 0 28 0 226 0 30 0 226 0 34 0 226 0 35 0 226 0 37 0 226 0 40 0 226 0 150] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 226 0 4 0 226 0 7 0 226 0 8 0 238 0 9 0 226 0 11 0 226 0 13 0 226 0 14 0 238 0 15 0 226 0 17 0 226 0 18 0 226 0 19 0 226 0 20 0 226 0 22 0 238 0 25 0 226 0 28 0 226 0 30 0 226 0 34 0 226 0 35 0 226 0 37 0 226 0 40 0 226 0 150] 
#[1 0 226 0 4 0 226 0 7 0 226 0 8 0 238 0 9 0 226 0 11 0 226 0 13 0 226 0 14 0 238 0 15 0 226 0 17 0 226 0 18 0 226 0 19 0 226 0 20 0 226 0 22 0 238 0 25 0 226 0 28 0 226 0 30 0 226 0 34 0 226 0 35 0 226 0 37 0 226 0 40 0 226 0 150] 
#[1 0 226 0 4 0 226 0 7 0 226 0 8 0 238 0 9 0 226 0 11 0 226 0 13 0 226 0 14 0 238 0 15 0 226 0 17 0 226 0 18 0 226 0 19 0 226 0 20 0 226 0 22 0 238 0 25 0 226 0 28 0 226 0 30 0 226 0 34 0 226 0 35 0 226 0 37 0 226 0 40 0 226 0 150] 
#[0 0 222 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 121 0 4 0 7 0 11 0 14 0 18 0 22 0 28 0 30 0 34 0 40 0 150 1 84] 
#[0 0 214 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 238 0 9 0 15 0 25] 
#[1 0 214 0 4 0 214 0 7 0 238 0 9 0 214 0 11 0 214 0 14 0 238 0 15 0 214 0 18 0 214 0 22 0 238 0 25 0 214 0 28 0 214 0 30 0 214 0 34 0 214 0 40 0 214 0 150] 
#[1 0 214 0 4 0 214 0 7 0 238 0 9 0 214 0 11 0 214 0 14 0 238 0 15 0 214 0 18 0 214 0 22 0 238 0 25 0 214 0 28 0 214 0 30 0 214 0 34 0 214 0 40 0 214 0 150] 
#[0 0 214 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 214 0 4 0 214 0 7 0 238 0 9 0 214 0 11 0 214 0 14 0 238 0 15 0 214 0 18 0 214 0 22 0 238 0 25 0 214 0 28 0 214 0 30 0 214 0 34 0 214 0 40 0 214 0 150] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 238 0 9 0 15 0 25] 
#[0 0 0 2 100] 
#[0 0 242 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 242 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 242 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 6 125 0 25] 
#[1 6 129 0 157 6 133 1 100 6 137 1 101 6 141 1 102] 
#[0 6 145 0 25] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 6 149 0 25] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 250 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 250 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 254 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 254 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 254 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 254 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 1 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 1 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 1 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 1 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 1 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 202 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 142 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 202 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 153 0 10] 
#[0 0 214 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 214 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 6 157 0 10] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 31 0 9 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 0 35 0 49 0 39 0 52 0 43 0 55 3 21 0 56 0 47 0 60 0 181 0 61 0 185 0 62 0 51 0 65 2 217 0 72 0 55 0 76 3 37 0 79 0 59 0 86 0 63 0 94 0 237 0 97 0 241 0 99 0 67 0 100 6 181 0 104 6 181 0 114 0 71 0 117 0 75 0 121 1 5 0 122 0 79 0 125 1 17 0 128 2 217 0 130 1 33 0 133 0 83 0 134 0 87 0 135 3 73 0 136 0 91 0 138 0 95 0 142 1 81 0 152 0 99 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 4 217 0 196 4 217 0 197 4 217 0 198 4 217 0 199 1 145 0 200 1 145 0 201 1 145 0 202 4 217 0 203 1 161 0 204 4 217 0 205 4 217 0 206 4 217 0 207 4 217 0 208 4 217 0 209 1 185 0 210 4 217 0 216 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 4 221 1 47 4 221 1 48 1 197 1 49 3 177 1 50 3 177 1 52 6 169 1 53 6 173 1 54 6 177 1 55 6 181 1 56 6 181 1 57 3 177 1 58 6 189 1 59 6 193 1 60 6 197 1 61 4 221 1 63 3 197 1 64 4 221 1 83 4 221 1 86 4 221 1 87 4 217 1 157 1 197 2 70 2 217 2 71 4 217 2 80 2 229 2 81 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86 3 1 2 99] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 5 5 0 8] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 0 103 0 157 1 125 0 191 1 121 0 193 1 125 0 194 6 201 0 195 6 205 0 196 6 205 0 197 6 205 0 198 6 205 0 199 1 145 0 200 1 145 0 201 1 145 0 202 6 205 0 203 1 161 0 204 6 205 0 205 6 205 0 206 6 205 0 207 6 205 0 208 6 205 0 209 1 185 0 210 6 205 0 216 6 205 1 157 6 205 2 80 2 229 2 81 3 1 2 99] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 0 86 0 20] 
#[0 5 205 0 8] 
#[0 0 86 0 20] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 13 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 17 0 134 0 18 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 23 5 253 0 24 0 134 0 25 0 107 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 1 22 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 44 0 134 0 45 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 55 0 134 0 57 0 134 0 58 0 134 0 60 0 134 0 62 0 134 0 63 0 134 0 65 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 71 0 134 0 75 0 134 0 76 0 134 0 79 0 134 0 82 0 134 0 86 0 134 0 87 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 92 0 134 0 94 0 134 0 99 0 134 0 100 0 134 0 101 0 134 0 103 0 134 0 105 0 134 0 108 0 134 0 109 0 134 0 111 0 134 0 112 0 134 0 113 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 121 0 134 0 124 0 134 0 125 0 134 0 126 0 134 0 134 0 134 0 135 0 134 0 137 0 134 0 138 0 134 0 141 0 134 0 142 0 134 0 143 0 134 0 145 0 134 0 149 0 134 0 150 0 134 0 151 0 134 0 152 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 6 209 0 217 6 209 0 238 0 134 2 100] 
#[0 0 158 0 20] 
#[1 0 214 0 2 0 214 0 3 0 214 0 4 0 214 0 5 0 214 0 6 0 214 0 7 6 29 0 8 0 214 0 9 0 214 0 10 0 214 0 11 0 214 0 12 6 33 0 13 0 214 0 14 0 214 0 15 0 214 0 16 6 37 0 17 0 214 0 18 6 41 0 19 6 45 0 20 0 214 0 21 0 214 0 22 0 214 0 23 0 214 0 25 0 214 0 26 0 214 0 27 0 214 0 28 0 214 0 29 0 214 0 30 0 214 0 31 0 214 0 33 0 214 0 34 0 111 0 35 0 214 0 36 0 214 0 37 0 214 0 38 0 214 0 39 0 214 0 40 0 214 0 41 0 214 0 44 0 214 0 45 0 214 0 49 0 214 0 51 0 214 0 52 0 214 0 55 0 214 0 57 0 214 0 58 0 214 0 60 0 214 0 62 0 214 0 63 0 214 0 65 0 214 0 67 0 214 0 68 0 214 0 69 0 214 0 71 0 214 0 75 0 214 0 76 0 214 0 79 0 214 0 82 0 214 0 86 0 214 0 87 0 214 0 88 0 214 0 89 0 214 0 90 0 214 0 91 0 214 0 92 0 214 0 94 0 214 0 99 0 214 0 100 0 214 0 101 0 214 0 103 0 214 0 105 0 214 0 108 0 214 0 109 0 214 0 111 0 214 0 112 0 214 0 113 0 214 0 117 0 214 0 118 0 214 0 119 0 214 0 121 0 214 0 124 0 214 0 125 0 214 0 126 0 214 0 134 0 214 0 135 0 214 0 137 0 214 0 138 0 214 0 141 0 214 0 142 0 214 0 143 0 214 0 145 0 214 0 149 0 214 0 150 0 214 0 151 0 214 0 152 0 214 0 153 0 214 0 154 0 214 0 155 0 214 0 157 0 214 0 163 0 214 0 164 0 214 0 167 0 214 0 168 6 49 1 28 6 213 1 29 0 214 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 1 26 0 2 1 26 0 3 6 121 0 4 1 26 0 5 1 26 0 6 6 121 0 7 1 26 0 9 1 26 0 10 6 121 0 11 1 26 0 12 6 121 0 14 1 26 0 15 1 26 0 16 6 121 0 18 1 26 0 21 6 121 0 22 1 26 0 23 1 26 0 25 1 26 0 26 1 26 0 27 6 121 0 28 1 26 0 29 6 121 0 30 1 26 0 31 1 26 0 33 6 121 0 34 1 26 0 35 1 26 0 36 1 26 0 37 1 26 0 38 1 26 0 39 6 121 0 40 1 26 0 41 1 26 0 44 1 26 0 45 1 26 0 49 1 26 0 51 1 26 0 52 1 26 0 55 1 26 0 57 1 26 0 58 1 26 0 60 1 26 0 62 1 26 0 63 1 26 0 65 1 26 0 67 1 26 0 68 1 26 0 69 1 26 0 71 1 26 0 75 1 26 0 76 1 26 0 79 1 26 0 82 1 26 0 86 1 26 0 87 1 26 0 88 1 26 0 89 1 26 0 90 1 26 0 91 1 26 0 92 1 26 0 94 1 26 0 99 1 26 0 100 1 26 0 101 1 26 0 103 1 26 0 105 1 26 0 108 1 26 0 109 1 26 0 111 1 26 0 112 1 26 0 113 1 26 0 117 1 26 0 118 1 26 0 119 1 26 0 121 1 26 0 124 1 26 0 125 1 26 0 126 1 26 0 134 1 26 0 135 1 26 0 137 1 26 0 138 1 26 0 141 1 26 0 142 1 26 0 143 1 26 0 145 1 26 0 149 6 121 0 150 1 26 0 151 1 26 0 152 1 26 0 153 1 26 0 154 1 26 0 155 1 26 0 157 1 26 0 163 1 26 0 164 1 26 0 167 1 26 0 168 6 121 1 84 1 26 2 100] 
#[0 0 214 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 214 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 214 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 1 30 0 2 6 217 0 3 1 30 0 5 1 30 0 6 1 30 0 9 6 221 0 10 1 30 0 12 1 30 0 15 1 30 0 16 6 225 0 21 1 30 0 23 1 30 0 25 1 30 0 26 1 30 0 27 1 30 0 29 1 30 0 31 1 30 0 33 1 30 0 35 1 30 0 36 1 30 0 37 1 30 0 38 1 30 0 39 1 30 0 41 1 30 0 44 1 30 0 45 1 30 0 49 1 30 0 51 1 30 0 52 1 30 0 55 1 30 0 57 1 30 0 58 1 30 0 60 1 30 0 62 1 30 0 63 1 30 0 65 1 30 0 67 1 30 0 68 1 30 0 69 1 30 0 71 1 30 0 75 1 30 0 76 1 30 0 79 1 30 0 82 1 30 0 86 1 30 0 87 1 30 0 88 1 30 0 89 1 30 0 90 1 30 0 91 1 30 0 92 1 30 0 94 1 30 0 99 1 30 0 100 1 30 0 101 1 30 0 103 1 30 0 105 1 30 0 108 1 30 0 109 1 30 0 111 1 30 0 112 1 30 0 113 1 30 0 117 1 30 0 118 1 30 0 119 1 30 0 121 1 30 0 124 1 30 0 125 1 30 0 126 1 30 0 134 1 30 0 135 1 30 0 137 1 30 0 138 1 30 0 141 1 30 0 142 1 30 0 143 1 30 0 145 1 30 0 149 1 30 0 151 1 30 0 152 1 30 0 153 1 30 0 154 1 30 0 155 1 30 0 157 1 30 0 163 1 30 0 164 1 30 0 167 1 30 0 168 1 30 2 100] 
#[1 1 34 0 2 1 34 0 5 1 34 0 6 1 34 0 9 6 229 0 12 1 34 0 15 6 233 0 16 1 34 0 23 1 34 0 25 1 34 0 26 1 34 0 27 1 34 0 29 1 34 0 31 1 34 0 33 1 34 0 35 1 34 0 36 1 34 0 37 1 34 0 38 1 34 0 39 1 34 0 41 1 34 0 44 1 34 0 45 1 34 0 49 1 34 0 51 1 34 0 52 1 34 0 55 1 34 0 57 1 34 0 58 1 34 0 60 1 34 0 62 1 34 0 63 1 34 0 65 1 34 0 67 1 34 0 68 1 34 0 69 1 34 0 71 1 34 0 75 1 34 0 76 1 34 0 79 1 34 0 82 1 34 0 86 1 34 0 87 1 34 0 88 1 34 0 89 1 34 0 90 1 34 0 91 1 34 0 92 1 34 0 94 1 34 0 99 1 34 0 100 1 34 0 101 1 34 0 103 1 34 0 105 1 34 0 108 1 34 0 109 1 34 0 111 1 34 0 112 1 34 0 113 1 34 0 117 1 34 0 118 1 34 0 119 1 34 0 121 1 34 0 124 1 34 0 125 1 34 0 126 1 34 0 134 1 34 0 135 1 34 0 137 1 34 0 138 1 34 0 141 1 34 0 142 1 34 0 143 1 34 0 145 1 34 0 149 1 34 0 151 1 34 0 152 1 34 0 153 1 34 0 154 1 34 0 155 1 34 0 157 1 34 0 163 1 34 0 164 1 34 0 167 1 34 0 168 1 34 2 100] 
#[1 1 38 0 2 1 38 0 5 1 38 0 6 1 38 0 9 1 38 0 15 1 38 0 23 1 38 0 25 1 38 0 26 6 237 0 27 1 38 0 29 1 38 0 31 1 38 0 33 1 38 0 35 1 38 0 36 1 38 0 37 1 38 0 38 1 38 0 39 1 38 0 41 1 38 0 44 1 38 0 45 1 38 0 49 1 38 0 51 1 38 0 52 1 38 0 55 1 38 0 57 1 38 0 58 1 38 0 60 1 38 0 62 1 38 0 63 1 38 0 65 1 38 0 67 1 38 0 68 1 38 0 69 1 38 0 71 1 38 0 75 1 38 0 76 1 38 0 79 1 38 0 82 1 38 0 86 1 38 0 87 1 38 0 88 1 38 0 89 1 38 0 90 1 38 0 91 1 38 0 92 1 38 0 94 1 38 0 99 1 38 0 100 1 38 0 101 1 38 0 103 1 38 0 105 1 38 0 108 1 38 0 109 1 38 0 111 1 38 0 112 1 38 0 113 1 38 0 117 1 38 0 118 1 38 0 119 1 38 0 121 1 38 0 124 1 38 0 125 1 38 0 126 1 38 0 134 1 38 0 135 1 38 0 137 1 38 0 138 1 38 0 141 1 38 0 142 1 38 0 143 1 38 0 145 1 38 0 149 1 38 0 151 1 38 0 152 1 38 0 153 6 241 0 154 1 38 0 155 1 38 0 157 1 38 0 163 1 38 0 164 1 38 0 167 1 38 0 168 1 38 2 100] 
#[1 1 42 0 2 1 42 0 5 1 42 0 6 1 42 0 9 1 42 0 15 1 42 0 23 1 42 0 25 6 245 0 26 6 249 0 29 1 42 0 31 6 253 0 33 1 42 0 35 1 42 0 36 1 42 0 37 1 42 0 38 1 42 0 39 1 42 0 41 7 1 0 44 1 42 0 45 1 42 0 49 1 42 0 51 1 42 0 52 1 42 0 55 1 42 0 57 1 42 0 58 1 42 0 60 1 42 0 62 1 42 0 63 1 42 0 65 1 42 0 67 1 42 0 68 1 42 0 69 1 42 0 71 1 42 0 75 1 42 0 76 1 42 0 79 1 42 0 82 1 42 0 86 1 42 0 87 1 42 0 88 1 42 0 89 7 5 0 90 1 42 0 91 1 42 0 92 1 42 0 94 1 42 0 99 1 42 0 100 1 42 0 101 1 42 0 103 1 42 0 105 1 42 0 108 1 42 0 109 1 42 0 111 1 42 0 112 1 42 0 113 1 42 0 117 1 42 0 118 1 42 0 119 1 42 0 121 1 42 0 124 1 42 0 125 1 42 0 126 1 42 0 134 1 42 0 135 1 42 0 137 1 42 0 138 1 42 0 141 1 42 0 142 1 42 0 143 1 42 0 145 1 42 0 149 1 42 0 151 1 42 0 152 7 9 0 153 1 42 0 155 1 42 0 157 1 42 0 163 1 42 0 164 1 42 0 167 1 42 0 168 1 42 2 100] 
#[1 7 13 0 2 1 46 0 5 1 46 0 6 1 46 0 9 1 46 0 15 1 46 0 23 1 46 0 25 7 17 0 31 1 46 0 35 1 46 0 36 1 46 0 37 1 46 0 38 1 46 0 39 1 46 0 41 1 46 0 45 1 46 0 49 1 46 0 51 1 46 0 52 1 46 0 55 1 46 0 57 1 46 0 58 1 46 0 60 1 46 0 62 1 46 0 63 1 46 0 65 1 46 0 67 1 46 0 68 1 46 0 69 1 46 0 71 1 46 0 75 1 46 0 76 1 46 0 79 1 46 0 82 1 46 0 86 1 46 0 87 1 46 0 88 1 46 0 89 1 46 0 91 1 46 0 92 1 46 0 94 1 46 0 99 1 46 0 100 1 46 0 101 1 46 0 103 1 46 0 105 1 46 0 108 1 46 0 109 1 46 0 111 1 46 0 112 1 46 0 113 1 46 0 117 1 46 0 118 1 46 0 119 1 46 0 121 1 46 0 124 1 46 0 125 1 46 0 126 1 46 0 134 1 46 0 135 1 46 0 137 1 46 0 138 1 46 0 141 1 46 0 142 1 46 0 143 1 46 0 145 1 46 0 149 1 46 0 151 1 46 0 152 1 46 0 155 1 46 0 157 1 46 0 163 1 46 0 164 1 46 0 167 1 46 0 168 1 46 2 100] 
#[1 7 21 0 5 1 50 0 6 1 50 0 9 1 50 0 15 1 50 0 23 1 50 0 25 1 50 0 35 1 50 0 36 1 50 0 37 1 50 0 38 1 50 0 39 1 50 0 41 1 50 0 45 1 50 0 49 1 50 0 51 1 50 0 52 1 50 0 55 1 50 0 57 1 50 0 58 1 50 0 60 1 50 0 62 1 50 0 63 1 50 0 65 1 50 0 67 1 50 0 68 1 50 0 69 1 50 0 71 1 50 0 75 1 50 0 76 1 50 0 79 1 50 0 82 1 50 0 86 1 50 0 87 1 50 0 88 1 50 0 89 1 50 0 91 1 50 0 92 1 50 0 94 1 50 0 99 1 50 0 100 1 50 0 101 1 50 0 103 1 50 0 105 1 50 0 108 1 50 0 109 1 50 0 111 1 50 0 112 1 50 0 113 1 50 0 117 1 50 0 118 1 50 0 119 1 50 0 121 1 50 0 124 1 50 0 125 1 50 0 126 1 50 0 134 1 50 0 135 1 50 0 137 1 50 0 138 1 50 0 141 1 50 0 142 1 50 0 143 1 50 0 145 1 50 0 149 1 50 0 151 1 50 0 152 1 50 0 155 1 50 0 157 1 50 0 163 1 50 0 164 1 50 0 167 1 50 0 168 1 50 2 100] 
#[1 1 54 0 6 1 54 0 9 1 54 0 15 1 54 0 23 1 54 0 25 1 54 0 35 1 54 0 36 1 54 0 37 1 54 0 38 7 25 0 39 1 54 0 41 1 54 0 45 1 54 0 49 1 54 0 51 1 54 0 52 1 54 0 55 1 54 0 57 1 54 0 58 1 54 0 60 1 54 0 62 1 54 0 63 1 54 0 65 1 54 0 67 1 54 0 68 1 54 0 69 1 54 0 71 1 54 0 75 1 54 0 76 1 54 0 79 1 54 0 82 1 54 0 86 1 54 0 87 1 54 0 88 1 54 0 89 1 54 0 91 1 54 0 92 1 54 0 94 1 54 0 99 1 54 0 100 1 54 0 101 1 54 0 103 1 54 0 105 1 54 0 108 1 54 0 109 1 54 0 111 1 54 0 112 1 54 0 113 1 54 0 117 1 54 0 118 1 54 0 119 1 54 0 121 1 54 0 124 1 54 0 125 1 54 0 126 1 54 0 134 1 54 0 135 1 54 0 137 1 54 0 138 1 54 0 141 1 54 0 142 1 54 0 143 1 54 0 145 1 54 0 149 1 54 0 151 1 54 0 152 1 54 0 155 1 54 0 157 1 54 0 163 1 54 0 164 1 54 0 167 1 54 0 168 1 54 2 100] 
#[1 1 58 0 6 1 58 0 9 1 58 0 15 1 58 0 23 1 58 0 25 1 58 0 35 1 58 0 36 1 58 0 37 1 58 0 38 1 58 0 41 1 58 0 45 1 58 0 49 1 58 0 51 1 58 0 52 1 58 0 55 1 58 0 57 1 58 0 58 1 58 0 60 1 58 0 62 1 58 0 63 1 58 0 65 1 58 0 67 1 58 0 68 1 58 0 69 1 58 0 71 1 58 0 75 1 58 0 76 1 58 0 79 1 58 0 82 1 58 0 86 1 58 0 87 1 58 0 88 1 58 0 89 1 58 0 91 1 58 0 92 1 58 0 94 1 58 0 99 1 58 0 100 1 58 0 101 1 58 0 103 1 58 0 105 1 58 0 108 1 58 0 109 1 58 0 111 1 58 0 112 1 58 0 113 1 58 0 117 1 58 0 118 1 58 0 119 1 58 0 121 1 58 0 124 1 58 0 125 1 58 0 126 1 58 0 134 1 58 0 135 1 58 0 137 1 58 0 138 1 58 0 141 1 58 0 142 1 58 0 143 1 58 0 145 7 29 0 149 1 58 0 151 1 58 0 152 1 58 0 155 1 58 0 157 1 58 0 163 1 58 0 164 1 58 0 167 1 58 0 168 1 58 2 100] 
#[1 7 33 0 6 1 62 0 9 1 62 0 15 1 62 0 23 1 62 0 25 1 62 0 35 1 62 0 36 1 62 0 37 1 62 0 38 1 62 0 41 1 62 0 45 1 62 0 49 1 62 0 51 1 62 0 52 1 62 0 55 1 62 0 57 1 62 0 58 1 62 0 60 1 62 0 62 1 62 0 63 1 62 0 65 1 62 0 67 1 62 0 68 1 62 0 69 1 62 0 71 1 62 0 75 1 62 0 76 1 62 0 79 1 62 0 82 1 62 0 86 1 62 0 87 1 62 0 88 1 62 0 89 1 62 0 91 1 62 0 92 1 62 0 94 1 62 0 99 1 62 0 100 1 62 0 101 1 62 0 103 1 62 0 105 1 62 0 108 1 62 0 109 1 62 0 111 1 62 0 112 1 62 0 113 1 62 0 117 1 62 0 118 1 62 0 119 1 62 0 121 1 62 0 124 1 62 0 125 1 62 0 126 1 62 0 134 1 62 0 135 1 62 0 137 1 62 0 138 1 62 0 141 1 62 0 142 1 62 0 143 1 62 0 145 1 62 0 151 1 62 0 152 1 62 0 155 1 62 0 157 1 62 0 163 1 62 0 164 1 62 0 167 1 62 0 168 1 62 2 100] 
#[1 1 66 0 9 1 66 0 15 1 66 0 23 1 66 0 25 1 66 0 35 7 37 0 36 1 66 0 37 1 66 0 38 1 66 0 41 1 66 0 45 1 66 0 49 1 66 0 51 1 66 0 52 1 66 0 55 1 66 0 57 1 66 0 58 1 66 0 60 1 66 0 62 1 66 0 63 1 66 0 65 1 66 0 67 1 66 0 68 1 66 0 69 1 66 0 71 1 66 0 75 1 66 0 76 1 66 0 79 1 66 0 82 1 66 0 86 1 66 0 87 1 66 0 88 1 66 0 89 1 66 0 91 1 66 0 92 1 66 0 94 1 66 0 99 1 66 0 100 1 66 0 101 1 66 0 103 1 66 0 105 1 66 0 108 1 66 0 109 1 66 0 111 1 66 0 112 1 66 0 113 1 66 0 117 1 66 0 118 1 66 0 119 1 66 0 121 1 66 0 124 1 66 0 125 1 66 0 126 1 66 0 134 1 66 0 135 1 66 0 137 1 66 0 138 1 66 0 141 1 66 0 142 1 66 0 143 1 66 0 145 7 41 0 151 1 66 0 152 1 66 0 155 1 66 0 157 1 66 0 163 1 66 0 164 1 66 0 167 1 66 0 168 1 66 2 100] 
#[1 1 70 0 9 1 70 0 15 1 70 0 23 1 70 0 25 7 45 0 35 1 70 0 37 1 70 0 38 1 70 0 41 1 70 0 45 1 70 0 49 1 70 0 51 1 70 0 52 1 70 0 55 1 70 0 57 1 70 0 58 1 70 0 60 1 70 0 62 1 70 0 63 1 70 0 65 1 70 0 67 1 70 0 68 1 70 0 69 1 70 0 71 1 70 0 75 1 70 0 76 1 70 0 79 1 70 0 82 1 70 0 86 1 70 0 87 1 70 0 88 1 70 0 89 1 70 0 91 1 70 0 92 1 70 0 94 1 70 0 99 1 70 0 100 1 70 0 101 1 70 0 103 1 70 0 105 1 70 0 108 1 70 0 109 1 70 0 111 1 70 0 112 1 70 0 113 1 70 0 117 1 70 0 118 1 70 0 119 1 70 0 121 1 70 0 124 1 70 0 125 1 70 0 126 1 70 0 134 1 70 0 135 1 70 0 137 1 70 0 138 1 70 0 141 1 70 0 142 1 70 0 143 1 70 0 145 1 70 0 152 1 70 0 155 1 70 0 157 1 70 0 163 1 70 0 164 1 70 0 167 1 70 0 168 1 70 2 100] 
#[0 1 74 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 1 74 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 7 49 0 32] 
#[0 1 78 0 32] 
#[0 1 78 0 32] 
#[0 1 82 0 32] 
#[0 1 74 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 3 37 0 79 1 86 0 82 7 53 0 91 7 57 0 92 7 61 0 103 1 86 0 119 7 65 0 145 7 69 1 64 7 73 1 65 7 77 1 66 7 81 1 67 7 85 1 68 7 89 1 69 7 93 1 70 7 97 1 71 7 101 1 72 7 105 1 73] 
#[0 1 90 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 0 2 100] 
#[0 1 90 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 0 2 100] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 0 0 2 100] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 7 109 0 25 7 113 0 32 1 77 0 148 7 117 1 92 7 121 1 193] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 7 125 0 41 0 115 0 49 0 115 0 52 0 115 0 55 0 46 0 57 1 114 0 58 0 115 0 60 0 50 0 62 0 115 0 65 0 54 0 67 1 118 0 69 0 119 0 71 0 115 0 76 0 115 0 86 0 58 0 87 7 133 0 88 0 115 0 94 7 137 0 99 0 115 0 100 7 141 0 105 0 123 0 108 7 145 0 109 7 149 0 111 7 153 0 112 7 201 0 113 0 115 0 117 7 161 0 118 0 115 0 121 0 127 0 124 0 115 0 125 0 62 0 126 0 115 0 134 0 115 0 135 0 131 0 137 0 115 0 138 7 173 0 141 0 115 0 142 7 201 0 143 0 135 0 152 0 139 0 157 4 137 1 151 4 141 1 152 4 145 1 153 7 181 1 174 7 185 1 175 7 189 1 176 7 193 1 180 7 197 1 181 7 201 1 182 7 205 1 188 7 209 1 189 7 213 1 190 7 217 1 204 7 221 1 205 7 225 1 206 7 229 1 219 7 233 1 220 7 237 1 221 7 241 1 226 7 245 1 227 7 249 1 228 7 253 1 232 8 1 1 233 8 5 1 242 8 9 1 243 8 13 1 244 8 17 1 250 4 149 1 253 4 153 1 254 4 157 1 255 4 161 2 11 4 165 2 12 4 169 2 13 4 173 2 36 4 177 2 37 4 181 2 38 4 185 2 43 4 189 2 44 4 193 2 45 8 21 2 75 8 25 2 78] 
#[0 1 94 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 8 29 0 157] 
#[1 8 33 0 124 8 37 0 157 8 45 0 191 8 41 0 192 8 45 0 194] 
#[1 0 143 0 37 1 134 0 41 1 134 0 57 1 134 0 62 1 134 0 67 1 134 0 87 1 134 0 88 1 134 0 98 1 134 0 99 1 134 0 108 1 134 0 109 1 134 0 111 1 134 0 112 1 134 0 118 1 134 0 124 1 134 0 126 1 134 0 137 8 53 2 46 8 57 2 47 8 61 2 48 8 65 2 49 1 134 2 100] 
#[1 1 138 0 37 1 138 0 41 1 138 0 57 1 138 0 62 1 138 0 67 1 138 0 87 1 138 0 88 1 138 0 98 1 138 0 99 1 138 0 108 1 138 0 109 1 138 0 111 1 138 0 112 1 138 0 118 1 138 0 124 1 138 0 126 1 138 0 137 4 21 0 139 1 138 0 155 8 69 0 183 8 69 0 184 8 69 0 185 8 69 0 186 1 138 2 100] 
#[0 1 142 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[0 1 146 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[0 1 146 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[0 1 146 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[0 1 150 0 37 0 41 0 57 0 62 0 67 0 71 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[0 1 154 0 23] 
#[0 1 154 0 23] 
#[0 1 154 0 23] 
#[0 1 154 0 23] 
#[0 1 154 0 23] 
#[0 1 154 0 23] 
#[0 1 154 0 23] 
#[1 8 73 0 157 1 125 0 191 8 89 0 193 1 125 0 194 8 81 2 59 8 85 2 60 8 89 2 61] 
#[0 1 158 0 157] 
#[0 8 93 0 23] 
#[0 1 162 0 20 0 148] 
#[1 8 97 0 20 8 101 0 148 8 105 0 177] 
#[0 1 166 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[1 1 166 0 41 1 166 0 57 1 170 0 62 1 174 0 67 1 178 0 87 0 147 0 88 0 147 0 99 0 151 0 108 0 147 0 109 0 147 0 111 0 147 0 112 1 166 0 118 1 166 0 124 1 182 0 126 0 155 0 137] 
#[1 1 166 0 41 1 166 0 57 1 170 0 62 1 174 0 67 1 178 0 87 0 147 0 88 0 147 0 99 0 151 0 108 0 147 0 109 0 147 0 111 0 147 0 112 1 166 0 118 1 166 0 124 1 182 0 126 0 155 0 137] 
#[1 1 166 0 41 1 166 0 57 1 170 0 62 1 174 0 67 1 178 0 87 0 147 0 88 0 147 0 99 0 151 0 108 0 147 0 109 0 147 0 111 0 147 0 112 1 166 0 118 1 166 0 124 1 182 0 126 0 155 0 137] 
#[1 1 166 0 41 1 166 0 57 1 170 0 62 1 174 0 67 1 178 0 87 0 147 0 88 0 147 0 99 0 151 0 108 0 147 0 109 0 147 0 111 0 147 0 112 1 166 0 118 1 166 0 124 1 182 0 126 0 155 0 137] 
#[1 1 166 0 41 1 166 0 57 1 170 0 62 1 174 0 67 1 178 0 87 0 147 0 88 0 147 0 99 0 151 0 108 0 147 0 109 0 147 0 111 0 147 0 112 1 166 0 118 1 166 0 124 1 182 0 126 0 155 0 137] 
#[0 1 166 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[0 1 166 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[1 1 166 0 41 1 166 0 57 1 170 0 62 1 178 0 87 0 155 0 88 0 155 0 99 0 151 0 108 0 155 0 109 0 155 0 111 0 155 0 112 1 166 0 118 1 166 0 124 1 182 0 126 0 155 0 137] 
#[1 1 186 0 57 8 113 0 108 8 113 2 74] 
#[1 8 141 0 41 1 190 0 57 8 141 0 88 8 141 0 99 1 190 0 108 8 141 0 109 8 141 0 111 8 141 0 112 8 141 0 118 8 141 0 124 8 141 0 137 8 141 1 153] 
#[0 1 194 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[1 8 145 0 108 1 186 0 126 8 145 2 74] 
#[1 8 173 0 88 8 173 0 99 1 198 0 108 8 173 0 109 8 173 0 111 8 173 0 112 1 198 0 126 8 173 0 137 8 173 1 255] 
#[0 1 202 0 88 0 99 0 108 0 109 0 111 0 112 0 126 0 137] 
#[1 1 186 0 87 8 177 0 108 8 177 2 74] 
#[1 1 206 0 87 8 205 0 88 8 205 0 99 1 206 0 108 8 205 0 109 8 205 0 111 8 205 0 112 8 205 0 137 8 205 2 13] 
#[0 1 210 0 87 0 88 0 99 0 108 0 109 0 111 0 112 0 137] 
#[0 8 209 0 67] 
#[1 1 214 0 67 8 233 0 88 8 233 0 99 8 233 0 109 8 233 0 111 8 233 0 112 8 233 2 38] 
#[0 1 218 0 67 0 88 0 99 0 109 0 111 0 112] 
#[0 8 237 0 62] 
#[1 1 222 0 62 9 9 0 88 9 9 0 99 9 9 0 109 9 9 0 111 9 9 0 112 9 9 0 137 9 9 2 45] 
#[0 1 226 0 62 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 1 230 0 37 0 41 0 42 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 80 0 85 0 86 0 87 0 88 0 94 0 99 0 100 0 104 0 105 0 107 0 108 0 109 0 111 0 112 0 113 0 114 0 115 0 117 0 118 0 120 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 157] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 13 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 17 0 134 0 18 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 23 5 253 0 24 0 134 0 25 0 107 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 44 0 134 0 45 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 55 0 134 0 57 0 134 0 58 0 134 0 60 0 134 0 62 0 134 0 63 0 134 0 65 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 71 0 134 0 75 0 134 0 76 0 134 0 79 0 134 0 82 0 134 0 86 0 134 0 87 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 92 0 134 0 94 0 134 0 99 0 134 0 100 0 134 0 101 0 134 0 103 0 134 0 105 0 134 0 108 0 134 0 109 0 134 0 111 0 134 0 112 0 134 0 113 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 121 0 134 0 124 0 134 0 125 0 134 0 126 0 134 0 134 0 134 0 135 0 134 0 137 0 134 0 138 0 134 0 141 0 134 0 142 0 134 0 143 0 134 0 145 0 134 0 149 0 134 0 150 0 134 0 151 0 134 0 152 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 6 209 0 217 6 209 0 238 0 134 2 100] 
#[0 1 234 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 1 238 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 159 0 9 0 11 0 10 0 134 0 11 0 134 0 12 0 134 0 13 0 134 0 14 1 22 0 15 0 134 0 16 0 134 0 17 0 134 0 18 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 5 253 0 24 0 107 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 1 22 0 32 0 134 0 33 0 134 0 34 0 11 0 35 0 134 0 36 0 11 0 37 0 134 0 39 0 134 0 40 0 134 0 44 0 134 0 90 0 134 0 149 0 134 0 150 0 134 0 151 0 134 0 153 0 134 0 154 0 11 0 157 6 9 0 217 6 9 0 238] 
#[1 9 13 0 9 0 186 0 10 0 190 0 35 0 194 0 37] 
#[0 9 17 0 9] 
#[0 1 242 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 1 234 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 1 246 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 1 234 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 1 250 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 1 254 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 9 21 0 157] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 9 25 0 246 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 9 29 1 47 9 29 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 9 29 1 63 3 197 1 64 9 29 1 83 9 29 1 86 9 29 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 2 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 9 33 1 47 9 33 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 9 33 1 63 3 197 1 64 9 33 1 83 9 33 1 86 9 33 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 2 6 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 0 82 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 90 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 90 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 94 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 102 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 102 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 90 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 90 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 110 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 90 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 90 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 110 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 90 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 90 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 0 90 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 11 0 2 0 11 0 5 0 11 0 6 0 11 0 8 0 11 0 9 0 11 0 10 0 11 0 15 0 134 0 20 0 11 0 23 5 253 0 24 0 11 0 25 0 163 0 26 0 11 0 29 0 11 0 31 0 11 0 32 0 11 0 33 0 11 0 35 0 11 0 36 0 11 0 37 0 11 0 38 0 11 0 39 0 11 0 41 0 11 0 44 0 11 0 45 0 11 0 49 0 11 0 51 0 11 0 52 0 11 0 55 0 11 0 57 0 11 0 58 0 11 0 60 0 11 0 62 0 11 0 63 0 11 0 65 0 11 0 67 0 11 0 68 0 11 0 69 0 11 0 71 0 11 0 75 0 11 0 76 0 11 0 79 0 11 0 82 0 11 0 86 0 11 0 87 0 11 0 88 0 11 0 89 0 11 0 90 0 11 0 91 0 11 0 92 0 11 0 94 0 11 0 99 0 11 0 100 0 11 0 101 0 11 0 102 0 11 0 103 0 11 0 105 0 11 0 108 0 11 0 109 0 11 0 111 0 11 0 112 0 11 0 113 0 11 0 117 0 11 0 118 0 11 0 119 0 11 0 121 0 11 0 124 0 11 0 125 0 11 0 126 0 11 0 128 0 11 0 134 0 11 0 135 0 11 0 137 0 11 0 138 0 11 0 141 0 11 0 142 0 11 0 143 0 11 0 145 0 11 0 148 0 11 0 149 0 11 0 151 0 11 0 152 0 11 0 153 0 11 0 155 0 11 0 157 0 11 0 163 0 11 0 164 0 11 0 167 0 11 0 168 9 37 0 217 9 37 0 238 0 11 2 100] 
#[0 0 154 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 20 0 23 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 9 41 0 157 9 45 1 105 9 49 1 106] 
#[0 2 10 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 9 53 0 196 9 53 0 197 9 53 0 198 9 53 0 199 1 145 0 200 1 145 0 201 1 145 0 202 9 53 0 203 1 161 0 204 9 53 0 205 9 53 0 206 9 53 0 207 9 53 0 208 9 53 0 209 1 185 0 210 9 53 0 216 9 53 1 157 9 53 2 80 2 229 2 81 3 1 2 99] 
#[1 1 6 0 9 1 14 0 49 1 14 0 52 1 14 0 55 1 14 0 60 1 14 0 65 1 14 0 76 1 14 0 86 1 14 0 94 1 14 0 100 6 181 0 104 6 181 0 114 1 14 0 117 1 14 0 121 1 14 0 125 1 14 0 134 1 14 0 135 1 14 0 138 1 14 0 142 1 14 0 157 6 169 1 53 6 173 1 54 6 177 1 55 6 181 1 56 6 181 1 57] 
#[1 1 77 0 148 9 57 1 92] 
#[0 2 14 0 148] 
#[0 9 61 0 146] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 9 65 0 196 9 65 0 197 9 65 0 198 9 65 0 199 1 145 0 200 1 145 0 201 1 145 0 202 9 65 0 203 1 161 0 204 9 65 0 205 9 65 0 206 9 65 0 207 9 65 0 208 9 65 0 209 1 185 0 210 9 65 0 216 9 65 1 157 9 69 2 80 2 229 2 81 3 1 2 99] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 2 18 0 25 0 141 0 47 0 145 0 48 0 149 0 49 0 157 0 52 0 161 0 55 3 21 0 56 0 177 0 60 0 181 0 61 0 185 0 62 0 193 0 65 2 217 0 72 0 205 0 76 0 225 0 86 0 233 0 94 0 237 0 97 0 241 0 99 0 245 0 100 0 253 0 117 1 1 0 121 1 5 0 122 1 9 0 125 1 17 0 128 2 217 0 130 1 33 0 133 1 37 0 134 1 41 0 135 3 73 0 136 1 53 0 138 1 61 0 140 1 65 0 142 1 81 0 152 9 73 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 1 129 0 196 1 129 0 197 1 129 0 198 1 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 1 129 0 203 1 161 0 204 1 129 0 205 1 129 0 206 1 129 0 207 1 129 0 208 1 129 0 209 1 185 0 210 1 129 0 216 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 9 81 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 9 81 1 83 9 85 1 98 2 113 1 99 9 81 1 108 9 85 1 122 9 85 1 123 9 93 1 128 1 129 1 157 1 197 2 70 2 217 2 71 1 129 2 80 2 229 2 81 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 3 1 2 99] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 61 0 140 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 1 129 0 196 1 129 0 197 1 129 0 198 1 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 1 129 0 203 1 161 0 204 1 129 0 205 1 129 0 206 1 129 0 207 1 129 0 208 1 129 0 209 1 185 0 210 1 129 0 216 9 97 1 99 1 129 1 157 1 129 2 80 2 229 2 81 3 1 2 99] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 9 105 1 47 9 105 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 9 105 1 63 3 197 1 64 9 105 1 83 9 105 1 86 9 105 1 87 9 105 1 88 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 9 109 0 25] 
#[0 9 113 0 25] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 9 121 1 47 9 121 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 9 121 1 63 3 197 1 64 9 121 1 83 9 121 1 86 9 121 1 87 9 121 1 89 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 9 125 1 47 9 125 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 9 125 1 63 3 197 1 64 9 125 1 83 9 125 1 86 9 125 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 9 129 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 25 0 60 3 29 0 65 3 33 0 76 3 41 0 86 3 45 0 94 3 49 0 100 3 53 0 117 3 57 0 121 3 61 0 125 9 133 0 128 3 65 0 134 3 69 0 135 3 77 0 138 4 201 0 157 3 85 0 191 9 149 0 237 9 153 0 241 9 153 0 242 1 241 0 243 9 149 1 24 9 153 1 25] 
#[1 9 157 0 15 2 22 0 38 9 161 0 214 9 165 0 215] 
#[1 9 169 0 8 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 2 26 0 155 9 173 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 9 177 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 9 181 0 237 1 197 0 239 9 185 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 9 189 0 248 1 197 0 249 1 197 0 250 1 197 0 251 9 177 1 7 1 197 1 8 1 197 1 9 9 193 1 11 9 197 1 12 9 201 1 13 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 9 205 1 30 1 197 1 49 1 197 2 70 2 217 2 71 1 197 2 83 1 197 2 84 1 197 2 86] 
#[1 9 209 0 8 0 186 0 10 0 190 0 35 0 194 0 37 9 213 0 148 9 217 0 253 9 217 0 254 9 217 1 4] 
#[1 0 210 0 8 0 210 0 10 0 210 0 35 0 210 0 37 0 167 0 148 9 233 2 7] 
#[1 9 237 0 37 6 21 0 212 6 25 0 213] 
#[1 9 229 0 148 9 241 2 7] 
#[1 0 171 0 8 0 210 0 10 0 210 0 35 0 210 0 37 0 210 0 148] 
#[0 2 30 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 9 249 0 25] 
#[0 2 34 0 25] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 9 65 0 196 9 65 0 197 9 65 0 198 9 65 0 199 1 145 0 200 1 145 0 201 1 145 0 202 9 65 0 203 1 161 0 204 9 65 0 205 9 65 0 206 9 65 0 207 9 65 0 208 9 65 0 209 1 185 0 210 9 65 0 216 9 65 1 157 9 65 2 80 9 253 2 81 3 1 2 99] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 1 1 47 10 1 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 1 1 63 3 197 1 64 10 1 1 83 10 1 1 86 10 1 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 10 5 0 25] 
#[1 10 9 0 54 10 13 0 74 10 17 1 137 10 21 1 138 10 25 1 143] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 10 29 0 157 1 125 0 191 1 121 0 193 1 125 0 194 10 33 0 196 10 33 0 197 10 33 0 198 10 33 0 199 1 145 0 200 1 145 0 201 1 145 0 202 10 33 0 203 1 161 0 204 10 33 0 205 10 33 0 206 10 33 0 207 10 33 0 208 10 33 0 209 1 185 0 210 10 33 0 216 10 37 1 15 10 33 1 157 10 33 2 80 2 229 2 81 10 41 2 99] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 45 1 47 10 45 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 45 1 63 3 197 1 64 10 45 1 83 10 45 1 86 10 45 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 2 38 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 2 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 0 149 0 49 0 157 0 52 0 161 0 55 3 21 0 56 0 177 0 60 0 181 0 61 0 185 0 62 0 193 0 65 2 217 0 72 0 205 0 76 3 37 0 79 0 225 0 86 0 233 0 94 0 237 0 97 0 241 0 99 0 245 0 100 0 253 0 117 1 1 0 121 1 5 0 122 1 9 0 125 1 17 0 128 2 217 0 130 1 33 0 133 1 37 0 134 1 41 0 135 3 73 0 136 1 53 0 138 1 61 0 140 1 65 0 142 1 81 0 152 4 213 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 1 129 0 196 1 129 0 197 1 129 0 198 1 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 1 129 0 203 1 161 0 204 1 129 0 205 1 129 0 206 1 129 0 207 1 129 0 208 1 129 0 209 1 185 0 210 1 129 0 216 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 57 1 47 10 57 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 57 1 63 3 197 1 64 10 57 1 83 10 57 1 86 10 57 1 87 10 57 1 98 2 113 1 99 10 57 1 148 1 129 1 157 1 197 2 70 2 217 2 71 1 129 2 80 2 229 2 81 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86 3 1 2 99] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 61 1 47 10 61 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 61 1 63 3 197 1 64 10 61 1 83 10 61 1 86 10 61 1 87 10 61 1 89 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 10 65 0 25] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 69 1 47 10 69 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 69 1 63 3 197 1 64 10 69 1 83 10 69 1 86 10 69 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 2 46 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 10 73 0 155] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 0 149 0 49 0 153 0 50 0 157 0 52 0 161 0 55 0 165 0 56 0 169 0 58 0 173 0 59 0 177 0 60 0 181 0 61 0 185 0 62 0 189 0 64 0 193 0 65 2 217 0 72 0 201 0 75 0 205 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 0 225 0 86 0 229 0 93 0 233 0 94 0 237 0 97 0 241 0 99 0 245 0 100 0 249 0 116 0 253 0 117 1 1 0 121 1 5 0 122 1 9 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 1 37 0 134 1 41 0 135 1 45 0 136 1 49 0 137 1 53 0 138 1 57 0 139 1 61 0 140 1 65 0 142 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 2 50 0 155 1 85 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 1 129 0 196 1 129 0 197 1 129 0 198 1 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 1 129 0 203 1 161 0 204 1 129 0 205 1 129 0 206 1 129 0 207 1 129 0 208 1 129 0 209 1 185 0 210 1 129 0 216 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 10 77 1 90 10 77 1 91 10 77 1 92 10 77 1 95 10 77 1 96 10 77 1 97 2 109 1 98 2 113 1 99 2 117 1 104 10 77 1 107 2 125 1 108 10 77 1 109 10 77 1 110 10 77 1 111 10 77 1 118 10 77 1 119 10 77 1 120 10 77 1 121 10 77 1 129 10 77 1 130 10 77 1 131 10 77 1 132 10 77 1 133 10 77 1 134 10 77 1 135 10 77 1 136 10 77 1 144 10 77 1 145 10 77 1 146 10 77 1 147 10 77 1 149 1 129 1 157 1 197 2 70 2 217 2 71 10 77 2 79 1 129 2 80 2 229 2 81 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 10 77 2 87 3 1 2 99] 
#[0 1 234 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 0 149 0 49 0 153 0 50 0 157 0 52 0 161 0 55 0 165 0 56 0 169 0 58 0 173 0 59 0 177 0 60 0 181 0 61 0 185 0 62 0 189 0 64 0 193 0 65 2 217 0 72 0 201 0 75 0 205 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 0 225 0 86 0 229 0 93 0 233 0 94 0 237 0 97 0 241 0 99 0 245 0 100 0 249 0 116 0 253 0 117 1 1 0 121 1 5 0 122 1 9 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 1 37 0 134 1 41 0 135 1 45 0 136 1 49 0 137 1 53 0 138 1 57 0 139 1 61 0 140 1 65 0 142 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 1 85 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 1 129 0 196 1 129 0 197 1 129 0 198 1 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 1 129 0 203 1 161 0 204 1 129 0 205 1 129 0 206 1 129 0 207 1 129 0 208 1 129 0 209 1 185 0 210 1 129 0 216 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 10 81 1 90 10 81 1 91 10 81 1 92 10 81 1 95 10 81 1 96 10 81 1 97 2 109 1 98 2 113 1 99 2 117 1 104 10 81 1 107 2 125 1 108 10 81 1 109 10 81 1 110 10 81 1 111 10 81 1 118 10 81 1 119 10 81 1 120 10 81 1 121 10 81 1 129 10 81 1 130 10 81 1 131 10 81 1 132 10 81 1 133 10 81 1 134 10 81 1 135 10 81 1 136 10 81 1 144 10 81 1 145 10 81 1 146 10 81 1 147 10 81 1 149 1 129 1 157 1 197 2 70 2 217 2 71 10 81 2 79 1 129 2 80 2 229 2 81 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 10 81 2 87 3 1 2 99] 
#[0 10 85 0 157] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 10 89 0 196 10 89 0 197 10 89 0 198 10 89 0 199 1 145 0 200 1 145 0 201 1 145 0 202 10 89 0 203 1 161 0 204 10 89 0 205 10 89 0 206 10 89 0 207 10 89 0 208 10 89 0 209 1 185 0 210 10 89 0 216 10 93 0 218 10 97 0 219 10 89 1 157 10 89 2 80 2 229 2 81 3 1 2 99] 
#[0 2 54 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 2 58 0 2 2 58 0 3 2 58 0 4 2 58 0 5 2 58 0 6 2 58 0 7 2 58 0 8 0 175 0 9 0 175 0 10 2 58 0 11 2 58 0 12 2 58 0 13 2 58 0 14 2 58 0 16 2 58 0 17 2 58 0 18 2 58 0 19 0 175 0 20 2 58 0 21 2 58 0 22 2 58 0 26 2 58 0 27 2 58 0 28 2 58 0 29 2 58 0 30 2 58 0 31 2 58 0 33 2 58 0 34 0 175 0 35 2 58 0 36 0 175 0 37 2 58 0 39 2 58 0 40 2 58 0 44 2 58 0 90 2 58 0 149 2 58 0 150 2 58 0 151 2 58 0 153 2 58 0 154 2 62 0 157] 
#[0 10 101 0 157] 
#[0 2 66 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 2 70 0 2 2 70 0 5 2 70 0 6 2 70 0 8 2 70 0 9 2 70 0 10 2 70 0 15 2 70 0 23 2 70 0 25 2 70 0 26 2 70 0 29 2 70 0 31 2 70 0 33 2 70 0 35 2 70 0 36 0 179 0 37 2 70 0 38 2 70 0 39 2 70 0 41 2 70 0 44 2 70 0 45 2 70 0 49 2 70 0 51 2 70 0 52 2 70 0 55 2 70 0 57 2 70 0 58 2 70 0 60 2 70 0 62 2 70 0 63 2 70 0 65 2 70 0 67 2 70 0 68 2 70 0 69 2 70 0 71 2 70 0 75 2 70 0 76 2 70 0 79 2 70 0 82 2 70 0 86 2 70 0 87 2 70 0 88 2 70 0 89 2 70 0 90 2 70 0 91 2 70 0 92 2 70 0 94 2 70 0 99 2 70 0 100 2 70 0 101 2 70 0 102 2 70 0 103 2 70 0 105 2 70 0 108 2 70 0 109 2 70 0 111 2 70 0 112 2 70 0 113 2 70 0 117 2 70 0 118 2 70 0 119 2 70 0 121 2 70 0 124 2 70 0 125 2 70 0 126 2 70 0 128 2 70 0 134 2 70 0 135 2 70 0 137 2 70 0 138 2 70 0 141 2 70 0 142 2 70 0 143 2 70 0 145 2 70 0 148 2 70 0 149 2 70 0 151 2 70 0 152 2 70 0 153 2 70 0 155 2 70 0 157 2 70 0 163 2 70 0 164 2 70 0 167 2 70 0 168 10 105 0 213 2 70 2 100] 
#[0 2 74 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 82 0 9 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 10 113 0 221 10 117 0 222 10 121 0 223 10 125 0 224 10 129 0 225] 
#[0 2 86 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 2 90 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 10 133 0 157] 
#[0 10 137 0 157] 
#[0 10 141 0 35] 
#[1 2 94 0 4 2 94 0 7 10 145 0 8 2 94 0 11 2 94 0 14 2 94 0 18 10 149 0 20 2 94 0 22 2 94 0 28 2 94 0 30 2 94 0 34 2 98 0 35 10 153 0 37 2 94 0 40 2 94 0 150] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 10 157 0 246 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 161 1 47 10 161 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 161 1 63 3 197 1 64 10 161 1 83 10 161 1 86 10 161 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 10 165 0 232 10 169 0 233 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 173 1 47 10 173 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 173 1 63 3 197 1 64 10 173 1 83 10 173 1 86 10 173 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 10 177 0 233 1 213 0 234 1 217 0 235 10 181 0 236 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 173 1 47 10 173 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 173 1 63 3 197 1 64 10 173 1 83 10 173 1 86 10 173 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 10 185 0 157] 
#[0 10 189 0 157] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 193 1 47 10 193 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 193 1 63 3 197 1 64 10 193 1 83 10 193 1 86 10 193 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 2 106 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 2 110 0 9 0 15 0 25 0 30] 
#[1 2 114 0 9 10 197 0 15 2 114 0 25] 
#[0 2 118 0 9 0 15 0 25] 
#[1 2 122 0 9 2 122 0 15 2 122 0 25 10 201 0 30] 
#[0 2 106 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 2 126 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 2 130 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 2 130 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 23 0 25 0 26 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 2 134 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 94 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 157] 
#[0 2 134 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 94 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 157] 
#[0 10 205 0 9] 
#[1 2 138 0 9 10 209 0 15] 
#[0 2 142 0 9 0 15] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 10 213 0 196 10 213 0 197 10 213 0 198 10 213 0 199 1 145 0 200 1 145 0 201 1 145 0 202 10 213 0 203 1 161 0 204 10 213 0 205 10 213 0 206 10 213 0 207 10 213 0 208 10 213 0 209 1 185 0 210 10 213 0 216 10 213 1 157 10 213 2 80 2 229 2 81 3 1 2 99] 
#[0 2 146 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 94 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 157] 
#[0 10 217 0 9] 
#[1 2 150 0 9 10 221 0 15] 
#[1 2 154 0 9 2 154 0 15 1 82 0 32] 
#[0 10 225 0 157] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 2 158 0 157] 
#[0 2 58 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 2 94 0 2 2 94 0 3 2 94 0 4 2 94 0 5 2 94 0 6 2 94 0 7 10 229 0 8 2 94 0 9 2 94 0 10 2 94 0 11 2 94 0 12 2 94 0 14 2 94 0 15 2 94 0 16 2 94 0 18 10 149 0 20 2 94 0 21 2 94 0 22 2 94 0 23 2 94 0 25 2 94 0 26 2 94 0 27 2 94 0 28 2 94 0 29 2 94 0 30 2 94 0 31 2 94 0 33 2 94 0 34 0 187 0 35 2 94 0 36 0 191 0 37 2 94 0 38 2 94 0 39 2 94 0 40 2 94 0 41 2 94 0 44 2 94 0 45 2 94 0 49 2 94 0 51 2 94 0 52 2 94 0 55 2 94 0 57 2 94 0 58 2 94 0 60 2 94 0 62 2 94 0 63 2 94 0 65 2 94 0 67 2 94 0 68 2 94 0 69 2 94 0 71 2 94 0 75 2 94 0 76 2 94 0 79 2 94 0 82 2 94 0 86 2 94 0 87 2 94 0 88 2 94 0 89 2 94 0 90 2 94 0 91 2 94 0 92 2 94 0 94 2 94 0 99 2 94 0 100 2 94 0 101 2 94 0 103 2 94 0 105 2 94 0 108 2 94 0 109 2 94 0 111 2 94 0 112 2 94 0 113 2 94 0 117 2 94 0 118 2 94 0 119 2 94 0 121 2 94 0 124 2 94 0 125 2 94 0 126 2 94 0 134 2 94 0 135 2 94 0 137 2 94 0 138 2 94 0 141 2 94 0 142 2 94 0 143 2 94 0 145 2 94 0 149 2 94 0 150 2 94 0 151 2 94 0 152 2 94 0 153 2 94 0 154 2 94 0 155 2 94 0 157 2 94 0 163 2 94 0 164 2 94 0 167 2 94 0 168 2 94 2 100] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 10 233 1 26 10 233 1 27 10 233 1 32 10 233 1 33 10 233 1 34 10 233 1 35 1 197 1 49 1 197 2 70 2 217 2 71 10 233 2 82 1 197 2 83 1 197 2 84 10 233 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 10 237 1 26 10 237 1 27 10 237 1 32 10 237 1 33 10 237 1 34 10 237 1 35 1 197 1 49 1 197 2 70 2 217 2 71 10 237 2 82 1 197 2 83 1 197 2 84 10 237 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 10 241 1 26 10 241 1 27 10 241 1 32 10 241 1 33 10 241 1 34 10 241 1 35 1 197 1 49 1 197 2 70 2 217 2 71 10 241 2 82 1 197 2 83 1 197 2 84 10 241 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 10 249 1 26 10 249 1 27 10 249 1 32 10 249 1 33 10 249 1 34 10 249 1 35 10 249 1 36 1 197 1 49 1 197 2 70 2 217 2 71 10 249 2 82 1 197 2 83 1 197 2 84 10 249 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 10 253 1 26 10 253 1 27 10 253 1 32 10 253 1 33 10 253 1 34 10 253 1 35 10 253 1 36 1 197 1 49 1 197 2 70 2 217 2 71 10 253 2 82 1 197 2 83 1 197 2 84 10 253 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 11 1 1 37 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 11 5 1 37 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 11 9 1 38 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 11 13 1 38 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 11 17 1 38 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 11 21 0 196 11 21 0 197 11 21 0 198 11 21 0 199 1 145 0 200 1 145 0 201 1 145 0 202 11 21 0 203 1 161 0 204 11 21 0 205 11 21 0 206 11 21 0 207 11 21 0 208 11 21 0 209 1 185 0 210 11 21 0 216 11 21 1 157 11 21 2 80 2 229 2 81 3 1 2 99] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 11 25 0 196 11 25 0 197 11 25 0 198 11 25 0 199 1 145 0 200 1 145 0 201 1 145 0 202 11 25 0 203 1 161 0 204 11 25 0 205 11 25 0 206 11 25 0 207 11 25 0 208 11 25 0 209 1 185 0 210 11 25 0 216 11 25 1 157 11 25 2 80 2 229 2 81 3 1 2 99] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 11 29 1 38 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 11 33 1 39 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 11 37 1 39 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 11 41 1 40 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 11 45 1 41 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 11 49 1 42 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 11 53 1 43 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 11 57 1 46 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 11 61 1 44 1 197 1 49 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 11 65 1 47 11 65 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 11 65 1 63 3 197 1 64 11 65 1 83 11 65 1 86 11 65 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 77 0 148 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 11 69 1 47 11 69 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 11 69 1 62 11 69 1 63 3 197 1 64 11 69 1 83 11 69 1 86 11 69 1 87 11 69 1 92 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 0 103 0 157 1 125 0 191 1 121 0 193 1 125 0 194 11 81 0 195 6 205 0 196 6 205 0 197 6 205 0 198 6 205 0 199 1 145 0 200 1 145 0 201 1 145 0 202 6 205 0 203 1 161 0 204 6 205 0 205 6 205 0 206 6 205 0 207 6 205 0 208 6 205 0 209 1 185 0 210 6 205 0 216 6 205 1 157 6 205 2 80 2 229 2 81 3 1 2 99] 
#[0 11 85 0 157] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 11 97 1 47 11 97 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 11 97 1 63 3 197 1 64 11 89 1 74 11 93 1 75 11 97 1 83 11 97 1 86 11 97 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 11 101 1 47 11 101 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 11 101 1 63 3 197 1 64 11 101 1 83 11 101 1 86 11 101 1 87 11 101 1 89 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 2 162 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 2 166 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 11 105 0 82 11 109 0 119 11 113 1 78 11 117 1 79 11 121 1 80] 
#[1 3 37 0 79 2 170 0 82 7 53 0 91 7 57 0 92 7 61 0 103 2 170 0 119 7 65 0 145 7 69 1 64 11 125 1 68 7 89 1 69 7 93 1 70 7 97 1 71 7 101 1 72 7 105 1 73] 
#[0 2 174 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 2 178 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 2 182 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 2 186 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 2 190 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 2 194 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 2 198 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 11 129 1 47 11 129 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 11 129 1 63 3 197 1 64 11 129 1 83 11 129 1 86 11 129 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 2 202 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 2 206 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 0 195 0 41 0 199 0 49 0 199 0 52 0 199 0 55 1 166 0 57 0 199 0 60 0 199 0 65 2 222 0 69 0 203 0 71 0 199 0 76 0 199 0 86 0 195 0 88 0 199 0 94 0 195 0 99 0 199 0 100 0 203 0 105 0 207 0 108 0 195 0 109 0 195 0 111 0 195 0 112 0 199 0 117 0 195 0 118 0 199 0 121 0 211 0 124 0 199 0 125 0 199 0 134 0 199 0 135 0 195 0 137 0 199 0 138 0 203 0 141 0 199 0 142 0 199 0 157] 
#[1 0 203 0 41 0 215 0 49 0 215 0 52 0 215 0 55 0 215 0 60 0 215 0 65 2 222 0 69 2 226 0 70 0 219 0 71 0 215 0 76 2 226 0 84 0 215 0 86 0 223 0 88 0 215 0 94 0 203 0 99 0 215 0 100 0 203 0 105 2 214 0 108 0 223 0 109 0 223 0 111 0 219 0 112 0 215 0 117 0 203 0 118 0 215 0 121 0 227 0 124 0 215 0 125 0 215 0 134 0 215 0 135 0 231 0 137 0 215 0 138 0 203 0 141 0 215 0 142 2 234 0 152 0 235 0 157] 
#[1 0 195 0 41 0 239 0 49 0 239 0 52 0 239 0 55 1 166 0 57 2 242 0 58 0 239 0 60 1 170 0 62 0 239 0 65 1 174 0 67 2 222 0 69 0 223 0 71 0 239 0 76 0 239 0 86 1 178 0 87 0 243 0 88 0 239 0 94 0 247 0 99 0 239 0 100 0 203 0 105 0 251 0 108 0 243 0 109 0 243 0 111 0 243 0 112 2 238 0 113 0 239 0 117 0 195 0 118 0 239 0 121 0 255 0 124 0 239 0 125 1 182 0 126 0 239 0 134 0 239 0 135 1 3 0 137 0 239 0 138 0 203 0 141 0 239 0 142 2 238 0 143 1 7 0 157] 
#[1 0 195 0 41 0 239 0 49 0 239 0 52 0 239 0 55 1 166 0 57 2 242 0 58 0 239 0 60 1 170 0 62 0 239 0 65 1 174 0 67 2 222 0 69 0 203 0 71 0 239 0 76 0 239 0 86 1 178 0 87 0 247 0 88 0 239 0 94 0 247 0 99 0 239 0 100 0 203 0 105 0 251 0 108 0 247 0 109 0 247 0 111 0 247 0 112 2 238 0 113 0 239 0 117 0 195 0 118 0 239 0 121 0 255 0 124 0 239 0 125 1 182 0 126 0 239 0 134 0 239 0 135 1 11 0 137 0 239 0 138 0 203 0 141 0 239 0 142 2 238 0 143 0 239 0 157] 
#[1 0 203 0 41 0 199 0 49 0 199 0 52 0 199 0 55 0 199 0 60 0 199 0 65 2 222 0 69 0 203 0 71 0 199 0 76 0 199 0 86 0 203 0 88 0 199 0 94 0 203 0 99 0 199 0 100 0 203 0 105 2 214 0 108 0 203 0 109 0 203 0 111 0 203 0 112 0 199 0 117 0 203 0 118 0 199 0 121 1 15 0 124 0 199 0 125 0 199 0 134 0 199 0 135 0 203 0 137 0 199 0 138 0 203 0 141 0 199 0 142 0 199 0 157] 
#[1 0 195 0 41 0 239 0 49 0 239 0 52 0 239 0 55 1 166 0 57 2 242 0 58 0 239 0 60 1 170 0 62 0 239 0 65 1 174 0 67 2 222 0 69 0 223 0 71 0 239 0 76 0 239 0 86 1 178 0 87 0 243 0 88 0 239 0 94 0 247 0 99 0 239 0 100 0 203 0 105 0 251 0 108 0 243 0 109 0 243 0 111 0 243 0 112 2 238 0 113 0 239 0 117 0 195 0 118 0 239 0 121 0 255 0 124 0 239 0 125 1 182 0 126 0 239 0 134 0 239 0 135 1 3 0 137 0 239 0 138 0 203 0 141 0 239 0 142 2 238 0 143 1 7 0 157] 
#[1 0 195 0 41 0 239 0 49 0 239 0 52 0 239 0 55 1 166 0 57 2 242 0 58 0 239 0 60 1 170 0 62 0 239 0 65 1 174 0 67 2 222 0 69 0 223 0 71 0 239 0 76 0 239 0 86 1 178 0 87 0 243 0 88 0 239 0 94 0 247 0 99 0 239 0 100 0 203 0 105 0 251 0 108 0 243 0 109 0 243 0 111 0 243 0 112 2 238 0 113 0 239 0 117 0 195 0 118 0 239 0 121 0 255 0 124 0 239 0 125 1 182 0 126 0 239 0 134 0 239 0 135 1 3 0 137 0 239 0 138 0 203 0 141 0 239 0 142 2 238 0 143 1 7 0 157] 
#[1 0 195 0 41 1 19 0 49 1 19 0 52 1 19 0 55 1 166 0 57 2 242 0 58 1 19 0 60 1 170 0 62 1 19 0 65 1 174 0 67 2 222 0 69 2 226 0 70 0 219 0 71 1 19 0 76 2 226 0 84 1 19 0 86 1 178 0 87 0 243 0 88 1 19 0 94 0 247 0 99 1 19 0 100 0 203 0 105 0 251 0 108 0 243 0 109 0 243 0 111 1 23 0 112 2 238 0 113 1 19 0 117 0 195 0 118 1 19 0 121 1 27 0 124 1 19 0 125 1 182 0 126 1 19 0 134 1 19 0 135 1 31 0 137 1 19 0 138 0 203 0 141 1 19 0 142 2 238 0 143 1 35 0 157] 
#[0 2 238 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[1 0 195 0 41 0 199 0 49 0 199 0 52 0 199 0 55 1 166 0 57 0 199 0 60 0 199 0 65 2 222 0 69 0 203 0 71 0 199 0 76 0 199 0 86 0 195 0 88 0 199 0 94 0 195 0 99 0 199 0 100 0 203 0 105 0 207 0 108 0 195 0 109 0 195 0 111 0 195 0 112 0 199 0 117 0 195 0 118 0 199 0 121 0 211 0 124 0 199 0 125 0 199 0 134 0 199 0 135 0 195 0 137 0 199 0 138 0 203 0 141 0 199 0 142 0 199 0 157] 
#[1 0 211 0 41 1 39 0 49 1 39 0 52 1 39 0 55 1 166 0 57 1 39 0 60 1 39 0 65 2 222 0 69 2 226 0 70 1 43 0 71 1 39 0 76 2 226 0 84 1 39 0 86 0 255 0 88 1 39 0 94 0 255 0 99 1 39 0 100 1 15 0 105 0 207 0 108 0 255 0 109 0 255 0 111 1 27 0 112 2 238 0 113 1 39 0 117 0 211 0 118 1 39 0 121 1 27 0 124 1 39 0 125 1 39 0 134 1 39 0 135 1 47 0 137 1 39 0 138 1 15 0 141 1 39 0 142 2 238 0 143 1 51 0 157 11 141 2 75 11 145 2 78] 
#[1 0 195 0 41 1 19 0 49 1 19 0 52 1 19 0 55 1 166 0 57 1 19 0 60 1 170 0 62 1 19 0 65 2 222 0 69 2 226 0 70 1 55 0 71 1 19 0 76 2 226 0 84 1 19 0 86 1 178 0 87 1 3 0 88 1 19 0 94 1 11 0 99 1 19 0 100 0 203 0 105 0 251 0 108 1 3 0 109 1 3 0 111 1 31 0 112 2 238 0 113 1 19 0 117 0 195 0 118 1 19 0 121 1 59 0 124 1 19 0 125 1 182 0 126 1 19 0 134 1 19 0 135 1 31 0 137 1 19 0 138 0 203 0 141 1 19 0 142 2 238 0 143 2 246 0 152 1 35 0 157] 
#[1 0 203 0 41 0 199 0 49 0 199 0 52 0 199 0 55 0 199 0 60 0 199 0 65 2 222 0 69 0 203 0 71 0 199 0 76 0 199 0 86 0 203 0 88 0 199 0 94 0 203 0 99 0 199 0 100 0 203 0 105 2 214 0 108 0 203 0 109 0 203 0 111 0 203 0 112 0 199 0 117 0 203 0 118 0 199 0 121 1 15 0 124 0 199 0 125 0 199 0 134 0 199 0 135 0 203 0 137 0 199 0 138 0 203 0 141 0 199 0 142 0 199 0 157] 
#[0 2 238 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[0 11 149 0 58] 
#[1 2 250 0 58 11 173 0 88 11 173 0 99 11 173 0 109 11 173 0 111 11 173 0 112 11 173 1 176] 
#[0 2 254 0 58 0 88 0 99 0 109 0 111 0 112] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 11 177 0 196 11 177 0 197 11 177 0 198 11 177 0 199 1 145 0 200 1 145 0 201 1 145 0 202 11 177 0 203 1 161 0 204 11 177 0 205 11 177 0 206 11 177 0 207 11 177 0 208 11 177 0 209 1 185 0 210 11 177 0 216 11 177 1 157 11 177 2 80 2 229 2 81 3 1 2 99] 
#[1 3 2 0 49 3 2 0 52 3 2 0 55 3 2 0 60 3 2 0 65 3 2 0 76 3 2 0 86 11 209 0 88 3 2 0 94 11 209 0 99 3 2 0 100 11 209 0 109 11 209 0 111 11 209 0 112 11 209 0 113 3 2 0 117 3 2 0 121 11 209 0 124 3 2 0 125 3 2 0 134 3 2 0 135 11 209 0 137 3 2 0 138 3 2 0 142 11 209 0 143 3 2 0 157 11 209 1 182] 
#[0 3 6 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[1 1 186 0 49 1 186 0 52 1 186 0 55 1 186 0 60 1 186 0 65 1 186 0 76 1 186 0 86 1 186 0 94 1 186 0 100 11 213 0 108 1 186 0 117 1 186 0 121 1 186 0 125 1 186 0 134 1 186 0 135 1 186 0 138 1 186 0 142 1 186 0 157 11 213 2 74] 
#[1 12 9 0 41 3 10 0 49 3 10 0 52 3 10 0 55 3 10 0 60 3 10 0 65 12 9 0 71 3 10 0 76 3 10 0 86 12 9 0 88 3 10 0 94 12 9 0 99 3 10 0 100 12 9 0 105 3 10 0 108 12 9 0 109 12 9 0 111 12 9 0 112 3 10 0 117 12 9 0 118 3 10 0 121 12 9 0 124 3 10 0 125 3 10 0 134 3 10 0 135 12 9 0 137 3 10 0 138 12 9 0 141 3 10 0 142 3 10 0 157 12 9 1 190] 
#[0 3 14 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 12 13 0 196 12 13 0 197 12 13 0 198 12 13 0 199 1 145 0 200 1 145 0 201 1 145 0 202 12 13 0 203 1 161 0 204 12 13 0 205 12 13 0 206 12 13 0 207 12 13 0 208 12 13 0 209 1 185 0 210 12 13 0 216 12 13 1 157 12 13 2 80 2 229 2 81 3 1 2 99] 
#[1 12 65 0 41 3 18 0 49 3 18 0 52 3 18 0 55 3 18 0 60 3 18 0 65 12 65 0 71 3 18 0 76 3 18 0 86 12 65 0 88 3 18 0 94 12 65 0 99 3 18 0 100 12 65 0 105 12 65 0 109 12 65 0 111 12 65 0 112 3 18 0 117 12 65 0 118 3 18 0 121 12 65 0 124 3 18 0 125 3 18 0 134 3 18 0 135 12 65 0 137 3 18 0 138 12 65 0 141 3 18 0 142 3 18 0 157 12 65 1 206] 
#[0 3 22 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 12 69 0 69] 
#[1 12 121 0 41 3 26 0 69 12 121 0 71 12 121 0 88 12 121 0 99 12 121 0 105 12 121 0 109 12 121 0 111 12 121 0 112 12 121 0 118 12 121 0 124 12 121 0 137 12 121 0 141 12 121 1 221] 
#[0 3 30 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 12 125 0 196 12 125 0 197 12 125 0 198 12 125 0 199 1 145 0 200 1 145 0 201 1 145 0 202 12 125 0 203 1 161 0 204 12 125 0 205 12 125 0 206 12 125 0 207 12 125 0 208 12 125 0 209 1 185 0 210 12 125 0 216 12 125 1 157 12 129 1 229 12 125 2 80 2 229 2 81 3 1 2 99] 
#[1 12 177 0 41 3 34 0 49 3 34 0 52 3 34 0 55 3 34 0 60 3 34 0 65 12 177 0 71 3 34 0 76 3 34 0 86 12 177 0 88 3 34 0 94 12 177 0 99 3 34 0 100 12 177 0 105 12 177 0 109 12 177 0 111 12 177 0 112 3 34 0 117 12 177 0 118 3 34 0 121 3 34 0 125 3 34 0 134 3 34 0 135 12 177 0 137 3 34 0 138 12 177 0 141 3 34 0 142 3 34 0 157 12 177 1 228] 
#[0 3 38 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 12 181 0 70 12 209 0 71 1 145 0 76 12 189 0 84 1 145 0 86 1 145 0 94 5 45 0 100 12 209 0 112 1 145 0 117 1 145 0 121 12 209 0 124 5 57 0 125 1 145 0 134 1 145 0 135 12 209 0 137 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 12 205 0 196 12 205 0 197 12 205 0 198 12 205 0 199 1 145 0 200 1 145 0 201 1 145 0 202 12 205 0 203 1 161 0 204 12 205 0 205 12 205 0 206 12 205 0 207 12 205 0 208 12 205 0 209 1 185 0 210 12 205 0 216 12 205 1 157 12 209 1 233 12 213 1 234 12 217 1 235 12 221 1 237 12 225 1 239 12 205 2 80 2 229 2 81 3 1 2 99] 
#[0 3 42 0 49 0 52 0 55 0 60 0 65 0 70 0 71 0 76 0 84 0 86 0 94 0 100 0 112 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 157] 
#[1 12 229 0 157 12 233 1 245] 
#[1 13 5 0 71 13 5 0 88 13 5 0 109 13 5 0 111 13 5 0 112 13 5 0 137 3 46 0 157 13 5 1 244] 
#[0 3 50 0 71 0 88 0 109 0 111 0 112 0 137 0 157] 
#[0 13 9 0 157] 
#[1 1 63 0 124 13 17 0 137 1 122 0 152 13 17 2 78] 
#[1 13 25 0 71 1 67 0 124 1 126 0 152 13 25 2 75] 
#[0 13 29 0 25] 
#[1 8 73 0 157 1 125 0 191 13 33 0 193 1 125 0 194] 
#[1 0 134 0 20 5 253 0 24 0 134 0 25 6 1 0 26 13 37 0 30 9 37 0 217 9 37 0 238] 
#[0 13 41 0 25] 
#[1 6 13 0 20 3 54 0 25] 
#[1 13 57 0 46 13 57 0 96 13 53 2 50 13 57 2 51] 
#[1 0 49 0 37 0 10 0 41 0 10 0 57 0 10 0 62 0 10 0 67 0 10 0 87 0 10 0 88 0 53 0 98 0 10 0 99 0 10 0 108 0 10 0 109 0 10 0 111 0 10 0 112 0 10 0 118 0 10 0 124 0 10 0 126 0 10 0 137 13 69 0 175 13 61 0 187 13 65 0 188 13 69 0 189 13 69 0 190 13 69 1 150 13 69 1 252 13 69 2 10 13 69 2 32 13 69 2 42 0 89 2 52 0 93 2 53 0 97 2 54 0 101 2 55 3 58 2 100] 
#[0 3 62 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 2 100] 
#[1 1 71 0 37 3 66 0 41 3 66 0 57 3 66 0 62 3 66 0 67 3 66 0 87 3 66 0 88 3 66 0 98 3 66 0 99 3 66 0 108 3 66 0 109 3 66 0 111 3 66 0 112 3 66 0 118 3 66 0 124 3 66 0 126 3 66 0 137 13 73 2 49 3 66 2 100] 
#[0 3 70 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 2 100] 
#[0 3 74 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[1 0 134 0 8 0 134 0 15 0 134 0 20 5 253 0 24 0 134 0 25 6 1 0 26 0 134 0 38 0 134 0 145 0 134 0 148 9 37 0 217 9 37 0 238] 
#[0 3 78 0 8 0 15 0 38] 
#[1 13 77 0 15 13 81 0 38] 
#[0 3 82 0 15 0 38] 
#[1 13 85 0 8 3 86 0 15 3 86 0 38 13 89 2 62 13 93 2 63] 
#[0 3 90 0 157] 
#[0 13 97 0 157] 
#[1 0 6 0 37 0 6 0 41 0 6 0 57 0 6 0 62 0 6 0 67 0 29 0 71 0 6 0 87 0 6 0 88 0 6 0 98 0 6 0 99 0 6 0 108 0 6 0 109 0 6 0 111 0 6 0 112 0 6 0 118 0 6 0 124 0 6 0 126 0 6 0 137 0 6 0 139 0 6 0 155 13 101 0 178 0 41 0 179 0 45 0 180] 
#[1 13 109 0 25 3 94 0 37 3 94 0 41 3 94 0 57 3 94 0 62 3 94 0 67 3 94 0 87 3 94 0 88 3 94 0 98 3 94 0 99 3 94 0 108 3 94 0 109 3 94 0 111 3 94 0 112 3 94 0 118 3 94 0 124 3 94 0 126 3 94 0 137 3 94 0 155 13 109 2 72 3 94 2 100] 
#[0 3 98 0 49 0 52 0 55 0 57 0 60 0 65 0 76 0 86 0 87 0 94 0 100 0 117 0 121 0 125 0 126 0 134 0 135 0 138 0 142 0 157] 
#[0 13 113 0 57] 
#[0 1 166 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[0 1 166 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[0 1 166 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[0 1 166 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[0 1 166 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[0 1 166 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[0 3 102 0 41 0 57 0 88 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 137] 
#[0 13 117 0 126] 
#[0 1 182 0 88 0 99 0 108 0 109 0 111 0 112 0 126 0 137] 
#[0 1 182 0 88 0 99 0 108 0 109 0 111 0 112 0 126 0 137] 
#[0 1 182 0 88 0 99 0 108 0 109 0 111 0 112 0 126 0 137] 
#[0 1 182 0 88 0 99 0 108 0 109 0 111 0 112 0 126 0 137] 
#[0 1 182 0 88 0 99 0 108 0 109 0 111 0 112 0 126 0 137] 
#[0 1 182 0 88 0 99 0 108 0 109 0 111 0 112 0 126 0 137] 
#[0 3 106 0 88 0 99 0 108 0 109 0 111 0 112 0 126 0 137] 
#[0 13 121 0 87] 
#[0 1 178 0 87 0 88 0 99 0 108 0 109 0 111 0 112 0 137] 
#[0 1 178 0 87 0 88 0 99 0 108 0 109 0 111 0 112 0 137] 
#[0 1 178 0 87 0 88 0 99 0 108 0 109 0 111 0 112 0 137] 
#[0 1 178 0 87 0 88 0 99 0 108 0 109 0 111 0 112 0 137] 
#[0 1 178 0 87 0 88 0 99 0 108 0 109 0 111 0 112 0 137] 
#[0 1 178 0 87 0 88 0 99 0 108 0 109 0 111 0 112 0 137] 
#[0 3 110 0 87 0 88 0 99 0 108 0 109 0 111 0 112 0 137] 
#[0 13 125 0 157] 
#[0 1 174 0 67 0 88 0 99 0 109 0 111 0 112] 
#[0 1 174 0 67 0 88 0 99 0 109 0 111 0 112] 
#[0 1 174 0 67 0 88 0 99 0 109 0 111 0 112] 
#[0 1 174 0 67 0 88 0 99 0 109 0 111 0 112] 
#[0 1 174 0 67 0 88 0 99 0 109 0 111 0 112] 
#[0 3 114 0 67 0 88 0 99 0 109 0 111 0 112] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 13 129 0 196 13 129 0 197 13 129 0 198 13 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 13 129 0 203 1 161 0 204 13 129 0 205 13 129 0 206 13 129 0 207 13 129 0 208 13 129 0 209 1 185 0 210 13 129 0 216 13 129 1 157 13 133 1 191 13 129 2 80 2 229 2 81 13 137 2 99] 
#[0 1 170 0 62 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 1 170 0 62 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 1 170 0 62 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 1 170 0 62 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 1 170 0 62 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 1 170 0 62 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 3 118 0 62 0 88 0 99 0 109 0 111 0 112 0 137] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 13 141 1 26 13 141 1 27 13 141 1 32 13 141 1 33 13 141 1 34 13 141 1 35 1 197 1 49 1 197 2 70 2 217 2 71 13 141 2 82 1 197 2 83 1 197 2 84 13 141 2 85 1 197 2 86] 
#[0 3 122 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 3 126 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 13 145 0 15 13 149 0 38] 
#[0 3 130 0 15 0 38 0 155] 
#[0 13 153 0 9] 
#[0 2 62 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 20 0 23 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 13 157 0 30] 
#[1 13 161 0 15 3 134 0 25] 
#[0 3 138 0 15 0 25] 
#[1 13 165 0 9 0 186 0 10 0 190 0 35 0 194 0 37] 
#[0 3 142 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 13 169 0 8] 
#[1 0 186 0 9 0 186 0 10 0 190 0 35 1 75 0 37] 
#[1 0 202 0 10 0 202 0 35 0 202 0 37 13 173 0 157 13 177 2 88 13 181 2 89] 
#[1 0 134 0 4 0 134 0 7 0 134 0 8 0 11 0 10 0 134 0 11 0 134 0 13 0 134 0 14 0 134 0 17 0 134 0 18 0 134 0 19 0 134 0 20 0 134 0 22 5 253 0 24 6 1 0 26 0 134 0 28 0 134 0 30 0 134 0 34 0 11 0 35 0 11 0 37 0 134 0 40 0 134 0 150 0 11 0 157 6 9 0 217 6 9 0 238] 
#[0 3 146 0 25] 
#[0 3 150 0 9 0 15 0 25] 
#[0 13 185 0 25] 
#[0 3 154 0 25] 
#[1 13 189 0 15 3 158 0 25] 
#[0 13 193 0 157] 
#[0 3 162 0 15 0 23 0 25 0 38 0 155 0 163 0 164 0 167 0 168] 
#[0 13 197 0 25] 
#[0 3 166 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 3 170 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 3 174 0 9 0 25 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 13 201 0 9] 
#[0 13 205 0 9] 
#[0 3 178 0 20] 
#[0 3 182 0 20] 
#[0 3 186 0 9 0 20] 
#[0 3 190 0 20] 
#[0 3 190 0 20] 
#[1 13 209 0 9 3 190 0 20] 
#[0 13 213 0 20] 
#[0 3 194 0 15 0 38] 
#[0 13 217 0 38] 
#[1 13 221 0 15 3 198 0 38] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 4 221 1 47 4 221 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 4 221 1 63 3 197 1 64 4 221 1 83 4 221 1 86 4 221 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 134 0 8 0 134 0 13 0 134 0 15 0 134 0 17 0 134 0 19 0 134 0 20 5 253 0 24 6 1 0 26 13 225 0 30 0 134 0 35 0 134 0 37 0 134 0 155 6 209 0 217 6 209 0 238] 
#[1 6 29 0 8 6 33 0 13 6 37 0 17 6 41 0 19 6 45 0 20 0 218 0 35 13 229 1 28 13 233 1 29] 
#[1 0 226 0 8 0 226 0 13 3 202 0 15 0 226 0 17 0 226 0 19 0 226 0 20 0 226 0 35 0 226 0 37 3 202 0 155] 
#[1 0 226 0 8 0 226 0 13 3 206 0 15 0 226 0 17 0 226 0 19 0 226 0 20 0 226 0 35 0 226 0 37 3 206 0 155] 
#[1 0 226 0 8 0 226 0 13 3 206 0 15 0 226 0 17 0 226 0 19 0 226 0 20 0 226 0 35 0 226 0 37 3 206 0 155] 
#[0 13 237 0 155] 
#[1 13 241 0 15 3 210 0 155] 
#[0 3 214 0 15 0 155] 
#[0 3 206 0 15 0 155] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 82 0 9 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 13 245 0 221 10 117 0 222 10 121 0 223 10 125 0 224 10 129 0 225] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 13 249 0 37 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 13 253 0 148 1 81 0 152 3 218 0 155 14 1 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 14 5 0 255 14 9 1 0 14 13 1 1 14 17 1 2 14 21 1 5 14 25 1 6 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 14 29 1 47 14 29 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 14 29 1 63 3 197 1 64 14 29 1 87 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[0 3 222 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 3 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 3 226 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 9 229 0 148 1 81 0 152 3 230 0 155 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 14 37 1 47 14 37 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 14 37 1 63 3 197 1 64 14 37 1 83 14 37 1 86 14 37 1 87 14 37 1 185 14 37 2 7 14 45 2 8 14 49 2 9 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 3 234 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 9 157 0 15 0 129 0 16 0 133 0 17 2 22 0 38 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 9 161 0 214 9 165 0 215 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 14 53 0 246 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 9 29 1 47 9 29 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 9 29 1 63 3 197 1 64 9 29 1 83 9 29 1 86 9 29 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 3 238 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 14 57 1 47 14 57 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 14 57 1 63 3 197 1 64 14 57 1 83 14 57 1 86 14 57 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 3 242 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 14 61 0 9 6 153 0 10] 
#[0 14 65 0 9] 
#[0 3 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 14 69 0 8 3 250 0 144 3 250 0 148 14 73 1 139 14 77 1 140] 
#[1 1 77 0 148 14 81 1 92] 
#[1 3 254 0 1 3 254 0 5 3 254 0 8 3 254 0 10 3 254 0 12 3 254 0 13 3 254 0 16 3 254 0 17 3 254 0 25 3 254 0 47 3 254 0 48 3 254 0 49 3 254 0 50 3 254 0 52 3 254 0 53 10 9 0 54 3 254 0 55 3 254 0 56 3 254 0 58 3 254 0 59 3 254 0 60 3 254 0 61 3 254 0 62 3 254 0 64 3 254 0 65 3 254 0 66 3 254 0 72 10 13 0 74 3 254 0 75 3 254 0 76 3 254 0 77 3 254 0 78 3 254 0 81 3 254 0 83 3 254 0 86 3 254 0 93 3 254 0 94 3 254 0 97 3 254 0 99 3 254 0 100 3 254 0 116 3 254 0 117 3 254 0 121 3 254 0 122 3 254 0 125 3 254 0 127 3 254 0 128 3 254 0 129 3 254 0 130 3 254 0 131 3 254 0 133 3 254 0 134 3 254 0 135 3 254 0 136 3 254 0 137 3 254 0 138 3 254 0 139 3 254 0 140 3 254 0 142 3 254 0 146 3 254 0 147 3 254 0 148 3 254 0 152 3 254 0 155 3 254 0 157 3 254 0 158 3 254 0 159 3 254 0 160 3 254 0 161 3 254 0 162 3 254 0 165 3 254 0 166 3 254 0 169 3 254 0 170 14 85 1 138 14 89 1 143 3 254 2 100] 
#[0 4 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 74 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 4 6 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 1 79 0 9 0 11 0 10 1 83 0 20 14 93 0 24 14 97 0 26 0 11 0 35 0 11 0 37 9 37 0 217 9 37 0 238 14 101 1 16 14 105 1 17] 
#[1 14 109 0 9 0 186 0 10 0 190 0 35 0 194 0 37] 
#[1 14 113 0 9 14 117 0 20] 
#[1 14 121 0 9 6 157 0 10] 
#[0 14 125 0 9] 
#[0 4 14 0 9] 
#[0 4 14 0 9] 
#[0 14 129 0 9] 
#[0 14 133 0 9] 
#[0 4 18 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 14 137 0 25] 
#[0 4 22 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 71 0 72 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 93 0 94 0 97 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 115 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 124 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 141 0 142 0 143 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 163 0 164 0 165 0 166 0 167 0 168 0 169 0 170 2 100] 
#[0 4 26 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 4 30 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 0 134 0 2 0 134 0 5 0 134 0 6 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 15 0 134 0 20 0 134 0 23 0 134 0 25 0 107 0 26 0 134 0 29 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 41 0 134 0 44 0 134 0 45 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 55 0 134 0 57 0 134 0 58 0 134 0 60 0 134 0 62 0 134 0 63 0 134 0 65 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 71 0 134 0 75 0 134 0 76 0 134 0 79 0 134 0 82 0 134 0 86 0 134 0 87 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 92 0 134 0 94 0 134 0 99 0 134 0 100 0 134 0 101 0 134 0 102 0 134 0 103 0 134 0 105 0 134 0 108 0 134 0 109 0 134 0 111 0 134 0 112 0 134 0 113 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 121 0 134 0 124 0 134 0 125 0 134 0 126 0 134 0 128 0 134 0 134 0 134 0 135 0 134 0 137 0 134 0 138 0 134 0 141 0 134 0 142 0 134 0 143 0 134 0 145 0 134 0 148 0 134 0 149 0 134 0 151 0 134 0 152 0 134 0 153 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 14 141 0 217 14 141 0 238 0 134 2 100] 
#[1 0 186 0 10 4 34 0 15 0 190 0 35 0 194 0 37 4 34 0 153] 
#[1 14 145 0 15 14 149 0 153] 
#[0 4 38 0 15 0 153] 
#[1 0 134 0 2 0 134 0 5 0 134 0 6 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 15 0 134 0 20 0 134 0 23 0 134 0 25 0 107 0 26 0 134 0 29 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 41 0 134 0 44 0 134 0 45 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 55 0 134 0 57 0 134 0 58 0 134 0 60 0 134 0 62 0 134 0 63 0 134 0 65 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 71 0 134 0 75 0 134 0 76 0 134 0 79 0 134 0 82 0 134 0 86 0 134 0 87 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 92 0 134 0 94 0 134 0 99 0 134 0 100 0 134 0 101 0 134 0 102 0 134 0 103 0 134 0 105 0 134 0 108 0 134 0 109 0 134 0 111 0 134 0 112 0 134 0 113 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 121 0 134 0 124 0 134 0 125 0 134 0 126 0 134 0 128 0 134 0 134 0 134 0 135 0 134 0 137 0 134 0 138 0 134 0 141 0 134 0 142 0 134 0 143 0 134 0 145 0 134 0 148 0 134 0 149 0 134 0 151 0 134 0 152 0 134 0 153 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 14 153 0 217 14 153 0 238 0 134 2 100] 
#[0 4 42 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 14 157 0 23] 
#[0 14 161 0 9] 
#[1 4 46 0 9 14 165 0 15] 
#[0 4 50 0 9 0 15 0 38] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 14 169 0 104 14 173 0 114 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 14 177 0 226 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 14 181 1 47 14 181 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 14 181 1 63 3 197 1 64 14 181 1 83 14 181 1 86 14 181 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 4 54 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 104 0 114 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 4 58 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 13 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 17 0 134 0 18 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 23 0 134 0 25 0 107 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 44 0 134 0 45 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 55 0 134 0 57 0 134 0 58 0 134 0 60 0 134 0 62 0 134 0 63 0 134 0 65 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 71 0 134 0 75 0 134 0 76 0 134 0 79 0 134 0 82 0 134 0 86 0 134 0 87 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 92 0 134 0 94 0 134 0 99 0 134 0 100 0 134 0 101 0 134 0 103 0 134 0 105 0 134 0 108 0 134 0 109 0 134 0 111 0 134 0 112 0 134 0 113 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 121 0 134 0 124 0 134 0 125 0 134 0 126 0 134 0 134 0 134 0 135 0 134 0 137 0 134 0 138 0 134 0 141 0 134 0 142 0 134 0 143 0 134 0 145 0 134 0 149 0 134 0 150 0 134 0 151 0 134 0 152 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 14 185 0 217 14 185 0 238 0 134 2 100] 
#[1 14 189 0 20 14 193 0 37] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 82 0 9 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 14 197 0 221 10 117 0 222 10 121 0 223 10 125 0 224 10 129 0 225] 
#[0 14 201 0 157] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 14 205 0 222 10 121 0 223 10 125 0 224 10 129 0 225] 
#[1 13 145 0 15 14 209 0 38] 
#[1 3 130 0 15 1 87 0 38] 
#[0 14 217 0 163] 
#[1 4 62 0 163 14 221 0 164] 
#[1 14 225 0 15 4 66 0 163 4 66 0 164 4 66 0 167 4 66 0 168] 
#[1 4 70 0 167 14 229 0 168] 
#[0 14 233 0 167] 
#[0 4 74 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 13 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 17 0 134 0 18 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 23 0 134 0 25 0 107 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 44 0 134 0 45 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 55 0 134 0 57 0 134 0 58 0 134 0 60 0 134 0 62 0 134 0 63 0 134 0 65 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 71 0 134 0 75 0 134 0 76 0 134 0 79 0 134 0 82 0 134 0 86 0 134 0 87 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 92 0 134 0 94 0 134 0 99 0 134 0 100 0 134 0 101 0 134 0 103 0 134 0 105 0 134 0 108 0 134 0 109 0 134 0 111 0 134 0 112 0 134 0 113 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 121 0 134 0 124 0 134 0 125 0 134 0 126 0 134 0 134 0 134 0 135 0 134 0 137 0 134 0 138 0 134 0 141 0 134 0 142 0 134 0 143 0 134 0 145 0 134 0 149 0 134 0 150 0 134 0 151 0 134 0 152 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 14 237 0 217 14 237 0 238 0 134 2 100] 
#[0 4 78 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 6 129 0 157 14 241 1 101 6 141 1 102] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 14 245 0 123 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 9 229 0 148 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 14 253 1 47 14 253 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 14 253 1 63 3 197 1 64 14 253 1 83 14 253 1 86 14 253 1 87 14 253 1 103 14 253 2 7 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86 14 253 2 98] 
#[0 4 82 0 32 0 148] 
#[1 1 14 0 49 1 14 0 52 1 14 0 55 1 14 0 60 1 14 0 65 1 14 0 76 1 14 0 86 1 14 0 94 1 14 0 100 6 181 0 104 6 181 0 114 1 14 0 117 1 14 0 121 1 14 0 125 1 14 0 134 1 14 0 135 1 14 0 138 1 14 0 142 1 14 0 157 15 9 1 55 6 181 1 56 6 181 1 57] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 15 13 0 157] 
#[0 4 86 0 32] 
#[0 15 21 0 157 1 61] 
#[0 15 25 0 85] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 82 0 9 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 15 29 0 221 10 117 0 222 10 121 0 223 10 125 0 224 10 129 0 225] 
#[0 4 90 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 25 0 26 0 27 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 4 90 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 25 0 26 0 27 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 4 90 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 25 0 26 0 27 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 1 26 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 25 0 26 0 27 0 29 0 31 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 4 94 0 2 6 217 0 3 4 94 0 5 4 94 0 6 4 94 0 9 6 221 0 10 4 94 0 12 4 94 0 15 4 94 0 16 6 225 0 21 4 94 0 23 4 94 0 25 4 94 0 26 4 94 0 27 4 94 0 29 4 94 0 31 4 94 0 33 4 94 0 35 4 94 0 36 4 94 0 37 4 94 0 38 4 94 0 39 4 94 0 41 4 94 0 44 4 94 0 45 4 94 0 49 4 94 0 51 4 94 0 52 4 94 0 55 4 94 0 57 4 94 0 58 4 94 0 60 4 94 0 62 4 94 0 63 4 94 0 65 4 94 0 67 4 94 0 68 4 94 0 69 4 94 0 71 4 94 0 75 4 94 0 76 4 94 0 79 4 94 0 82 4 94 0 86 4 94 0 87 4 94 0 88 4 94 0 89 4 94 0 90 4 94 0 91 4 94 0 92 4 94 0 94 4 94 0 99 4 94 0 100 4 94 0 101 4 94 0 103 4 94 0 105 4 94 0 108 4 94 0 109 4 94 0 111 4 94 0 112 4 94 0 113 4 94 0 117 4 94 0 118 4 94 0 119 4 94 0 121 4 94 0 124 4 94 0 125 4 94 0 126 4 94 0 134 4 94 0 135 4 94 0 137 4 94 0 138 4 94 0 141 4 94 0 142 4 94 0 143 4 94 0 145 4 94 0 149 4 94 0 151 4 94 0 152 4 94 0 153 4 94 0 154 4 94 0 155 4 94 0 157 4 94 0 163 4 94 0 164 4 94 0 167 4 94 0 168 4 94 2 100] 
#[1 4 94 0 2 6 217 0 3 4 94 0 5 4 94 0 6 4 94 0 9 6 221 0 10 4 94 0 12 4 94 0 15 4 94 0 16 6 225 0 21 4 94 0 23 4 94 0 25 4 94 0 26 4 94 0 27 4 94 0 29 4 94 0 31 4 94 0 33 4 94 0 35 4 94 0 36 4 94 0 37 4 94 0 38 4 94 0 39 4 94 0 41 4 94 0 44 4 94 0 45 4 94 0 49 4 94 0 51 4 94 0 52 4 94 0 55 4 94 0 57 4 94 0 58 4 94 0 60 4 94 0 62 4 94 0 63 4 94 0 65 4 94 0 67 4 94 0 68 4 94 0 69 4 94 0 71 4 94 0 75 4 94 0 76 4 94 0 79 4 94 0 82 4 94 0 86 4 94 0 87 4 94 0 88 4 94 0 89 4 94 0 90 4 94 0 91 4 94 0 92 4 94 0 94 4 94 0 99 4 94 0 100 4 94 0 101 4 94 0 103 4 94 0 105 4 94 0 108 4 94 0 109 4 94 0 111 4 94 0 112 4 94 0 113 4 94 0 117 4 94 0 118 4 94 0 119 4 94 0 121 4 94 0 124 4 94 0 125 4 94 0 126 4 94 0 134 4 94 0 135 4 94 0 137 4 94 0 138 4 94 0 141 4 94 0 142 4 94 0 143 4 94 0 145 4 94 0 149 4 94 0 151 4 94 0 152 4 94 0 153 4 94 0 154 4 94 0 155 4 94 0 157 4 94 0 163 4 94 0 164 4 94 0 167 4 94 0 168 4 94 2 100] 
#[1 4 98 0 2 4 98 0 5 4 98 0 6 4 98 0 9 6 229 0 12 4 98 0 15 6 233 0 16 4 98 0 23 4 98 0 25 4 98 0 26 4 98 0 27 4 98 0 29 4 98 0 31 4 98 0 33 4 98 0 35 4 98 0 36 4 98 0 37 4 98 0 38 4 98 0 39 4 98 0 41 4 98 0 44 4 98 0 45 4 98 0 49 4 98 0 51 4 98 0 52 4 98 0 55 4 98 0 57 4 98 0 58 4 98 0 60 4 98 0 62 4 98 0 63 4 98 0 65 4 98 0 67 4 98 0 68 4 98 0 69 4 98 0 71 4 98 0 75 4 98 0 76 4 98 0 79 4 98 0 82 4 98 0 86 4 98 0 87 4 98 0 88 4 98 0 89 4 98 0 90 4 98 0 91 4 98 0 92 4 98 0 94 4 98 0 99 4 98 0 100 4 98 0 101 4 98 0 103 4 98 0 105 4 98 0 108 4 98 0 109 4 98 0 111 4 98 0 112 4 98 0 113 4 98 0 117 4 98 0 118 4 98 0 119 4 98 0 121 4 98 0 124 4 98 0 125 4 98 0 126 4 98 0 134 4 98 0 135 4 98 0 137 4 98 0 138 4 98 0 141 4 98 0 142 4 98 0 143 4 98 0 145 4 98 0 149 4 98 0 151 4 98 0 152 4 98 0 153 4 98 0 154 4 98 0 155 4 98 0 157 4 98 0 163 4 98 0 164 4 98 0 167 4 98 0 168 4 98 2 100] 
#[1 4 98 0 2 4 98 0 5 4 98 0 6 4 98 0 9 6 229 0 12 4 98 0 15 6 233 0 16 4 98 0 23 4 98 0 25 4 98 0 26 4 98 0 27 4 98 0 29 4 98 0 31 4 98 0 33 4 98 0 35 4 98 0 36 4 98 0 37 4 98 0 38 4 98 0 39 4 98 0 41 4 98 0 44 4 98 0 45 4 98 0 49 4 98 0 51 4 98 0 52 4 98 0 55 4 98 0 57 4 98 0 58 4 98 0 60 4 98 0 62 4 98 0 63 4 98 0 65 4 98 0 67 4 98 0 68 4 98 0 69 4 98 0 71 4 98 0 75 4 98 0 76 4 98 0 79 4 98 0 82 4 98 0 86 4 98 0 87 4 98 0 88 4 98 0 89 4 98 0 90 4 98 0 91 4 98 0 92 4 98 0 94 4 98 0 99 4 98 0 100 4 98 0 101 4 98 0 103 4 98 0 105 4 98 0 108 4 98 0 109 4 98 0 111 4 98 0 112 4 98 0 113 4 98 0 117 4 98 0 118 4 98 0 119 4 98 0 121 4 98 0 124 4 98 0 125 4 98 0 126 4 98 0 134 4 98 0 135 4 98 0 137 4 98 0 138 4 98 0 141 4 98 0 142 4 98 0 143 4 98 0 145 4 98 0 149 4 98 0 151 4 98 0 152 4 98 0 153 4 98 0 154 4 98 0 155 4 98 0 157 4 98 0 163 4 98 0 164 4 98 0 167 4 98 0 168 4 98 2 100] 
#[1 4 102 0 2 4 102 0 5 4 102 0 6 4 102 0 9 4 102 0 15 4 102 0 23 4 102 0 25 4 102 0 26 6 237 0 27 4 102 0 29 4 102 0 31 4 102 0 33 4 102 0 35 4 102 0 36 4 102 0 37 4 102 0 38 4 102 0 39 4 102 0 41 4 102 0 44 4 102 0 45 4 102 0 49 4 102 0 51 4 102 0 52 4 102 0 55 4 102 0 57 4 102 0 58 4 102 0 60 4 102 0 62 4 102 0 63 4 102 0 65 4 102 0 67 4 102 0 68 4 102 0 69 4 102 0 71 4 102 0 75 4 102 0 76 4 102 0 79 4 102 0 82 4 102 0 86 4 102 0 87 4 102 0 88 4 102 0 89 4 102 0 90 4 102 0 91 4 102 0 92 4 102 0 94 4 102 0 99 4 102 0 100 4 102 0 101 4 102 0 103 4 102 0 105 4 102 0 108 4 102 0 109 4 102 0 111 4 102 0 112 4 102 0 113 4 102 0 117 4 102 0 118 4 102 0 119 4 102 0 121 4 102 0 124 4 102 0 125 4 102 0 126 4 102 0 134 4 102 0 135 4 102 0 137 4 102 0 138 4 102 0 141 4 102 0 142 4 102 0 143 4 102 0 145 4 102 0 149 4 102 0 151 4 102 0 152 4 102 0 153 6 241 0 154 4 102 0 155 4 102 0 157 4 102 0 163 4 102 0 164 4 102 0 167 4 102 0 168 4 102 2 100] 
#[1 4 102 0 2 4 102 0 5 4 102 0 6 4 102 0 9 4 102 0 15 4 102 0 23 4 102 0 25 4 102 0 26 6 237 0 27 4 102 0 29 4 102 0 31 4 102 0 33 4 102 0 35 4 102 0 36 4 102 0 37 4 102 0 38 4 102 0 39 4 102 0 41 4 102 0 44 4 102 0 45 4 102 0 49 4 102 0 51 4 102 0 52 4 102 0 55 4 102 0 57 4 102 0 58 4 102 0 60 4 102 0 62 4 102 0 63 4 102 0 65 4 102 0 67 4 102 0 68 4 102 0 69 4 102 0 71 4 102 0 75 4 102 0 76 4 102 0 79 4 102 0 82 4 102 0 86 4 102 0 87 4 102 0 88 4 102 0 89 4 102 0 90 4 102 0 91 4 102 0 92 4 102 0 94 4 102 0 99 4 102 0 100 4 102 0 101 4 102 0 103 4 102 0 105 4 102 0 108 4 102 0 109 4 102 0 111 4 102 0 112 4 102 0 113 4 102 0 117 4 102 0 118 4 102 0 119 4 102 0 121 4 102 0 124 4 102 0 125 4 102 0 126 4 102 0 134 4 102 0 135 4 102 0 137 4 102 0 138 4 102 0 141 4 102 0 142 4 102 0 143 4 102 0 145 4 102 0 149 4 102 0 151 4 102 0 152 4 102 0 153 6 241 0 154 4 102 0 155 4 102 0 157 4 102 0 163 4 102 0 164 4 102 0 167 4 102 0 168 4 102 2 100] 
#[1 4 102 0 2 4 102 0 5 4 102 0 6 4 102 0 9 4 102 0 15 4 102 0 23 4 102 0 25 4 102 0 26 6 237 0 27 4 102 0 29 4 102 0 31 4 102 0 33 4 102 0 35 4 102 0 36 4 102 0 37 4 102 0 38 4 102 0 39 4 102 0 41 4 102 0 44 4 102 0 45 4 102 0 49 4 102 0 51 4 102 0 52 4 102 0 55 4 102 0 57 4 102 0 58 4 102 0 60 4 102 0 62 4 102 0 63 4 102 0 65 4 102 0 67 4 102 0 68 4 102 0 69 4 102 0 71 4 102 0 75 4 102 0 76 4 102 0 79 4 102 0 82 4 102 0 86 4 102 0 87 4 102 0 88 4 102 0 89 4 102 0 90 4 102 0 91 4 102 0 92 4 102 0 94 4 102 0 99 4 102 0 100 4 102 0 101 4 102 0 103 4 102 0 105 4 102 0 108 4 102 0 109 4 102 0 111 4 102 0 112 4 102 0 113 4 102 0 117 4 102 0 118 4 102 0 119 4 102 0 121 4 102 0 124 4 102 0 125 4 102 0 126 4 102 0 134 4 102 0 135 4 102 0 137 4 102 0 138 4 102 0 141 4 102 0 142 4 102 0 143 4 102 0 145 4 102 0 149 4 102 0 151 4 102 0 152 4 102 0 153 6 241 0 154 4 102 0 155 4 102 0 157 4 102 0 163 4 102 0 164 4 102 0 167 4 102 0 168 4 102 2 100] 
#[1 4 102 0 2 4 102 0 5 4 102 0 6 4 102 0 9 0 186 0 10 4 102 0 15 4 102 0 23 4 102 0 25 4 102 0 26 4 102 0 29 4 102 0 31 4 102 0 33 1 91 0 35 4 102 0 36 1 95 0 37 4 102 0 38 4 102 0 39 4 102 0 41 4 102 0 44 4 102 0 45 4 102 0 49 4 102 0 51 4 102 0 52 4 102 0 55 4 102 0 57 4 102 0 58 4 102 0 60 4 102 0 62 4 102 0 63 4 102 0 65 4 102 0 67 4 102 0 68 4 102 0 69 4 102 0 71 4 102 0 75 4 102 0 76 4 102 0 79 4 102 0 82 4 102 0 86 4 102 0 87 4 102 0 88 4 102 0 89 4 102 0 90 4 102 0 91 4 102 0 92 4 102 0 94 4 102 0 99 4 102 0 100 4 102 0 101 4 102 0 103 4 102 0 105 4 102 0 108 4 102 0 109 4 102 0 111 4 102 0 112 4 102 0 113 4 102 0 117 4 102 0 118 4 102 0 119 4 102 0 121 4 102 0 124 4 102 0 125 4 102 0 126 4 102 0 134 4 102 0 135 4 102 0 137 4 102 0 138 4 102 0 141 4 102 0 142 4 102 0 143 4 102 0 145 4 102 0 149 4 102 0 151 4 102 0 152 4 102 0 153 4 102 0 155 4 102 0 157 4 102 0 163 4 102 0 164 4 102 0 167 4 102 0 168 4 102 2 100] 
#[1 4 102 0 2 4 102 0 5 4 102 0 6 4 102 0 9 0 186 0 10 4 102 0 15 4 102 0 23 4 102 0 25 4 102 0 26 4 102 0 29 4 102 0 31 4 102 0 33 1 91 0 35 4 102 0 36 1 95 0 37 4 102 0 38 4 102 0 39 4 102 0 41 4 102 0 44 4 102 0 45 4 102 0 49 4 102 0 51 4 102 0 52 4 102 0 55 4 102 0 57 4 102 0 58 4 102 0 60 4 102 0 62 4 102 0 63 4 102 0 65 4 102 0 67 4 102 0 68 4 102 0 69 4 102 0 71 4 102 0 75 4 102 0 76 4 102 0 79 4 102 0 82 4 102 0 86 4 102 0 87 4 102 0 88 4 102 0 89 4 102 0 90 4 102 0 91 4 102 0 92 4 102 0 94 4 102 0 99 4 102 0 100 4 102 0 101 4 102 0 103 4 102 0 105 4 102 0 108 4 102 0 109 4 102 0 111 4 102 0 112 4 102 0 113 4 102 0 117 4 102 0 118 4 102 0 119 4 102 0 121 4 102 0 124 4 102 0 125 4 102 0 126 4 102 0 134 4 102 0 135 4 102 0 137 4 102 0 138 4 102 0 141 4 102 0 142 4 102 0 143 4 102 0 145 4 102 0 149 4 102 0 151 4 102 0 152 4 102 0 153 4 102 0 155 4 102 0 157 4 102 0 163 4 102 0 164 4 102 0 167 4 102 0 168 4 102 2 100] 
#[1 4 102 0 2 4 102 0 5 4 102 0 6 4 102 0 9 4 102 0 15 4 102 0 23 4 102 0 25 4 102 0 26 6 237 0 27 4 102 0 29 4 102 0 31 4 102 0 33 4 102 0 35 4 102 0 36 4 102 0 37 4 102 0 38 4 102 0 39 4 102 0 41 4 102 0 44 4 102 0 45 4 102 0 49 4 102 0 51 4 102 0 52 4 102 0 55 4 102 0 57 4 102 0 58 4 102 0 60 4 102 0 62 4 102 0 63 4 102 0 65 4 102 0 67 4 102 0 68 4 102 0 69 4 102 0 71 4 102 0 75 4 102 0 76 4 102 0 79 4 102 0 82 4 102 0 86 4 102 0 87 4 102 0 88 4 102 0 89 4 102 0 90 4 102 0 91 4 102 0 92 4 102 0 94 4 102 0 99 4 102 0 100 4 102 0 101 4 102 0 103 4 102 0 105 4 102 0 108 4 102 0 109 4 102 0 111 4 102 0 112 4 102 0 113 4 102 0 117 4 102 0 118 4 102 0 119 4 102 0 121 4 102 0 124 4 102 0 125 4 102 0 126 4 102 0 134 4 102 0 135 4 102 0 137 4 102 0 138 4 102 0 141 4 102 0 142 4 102 0 143 4 102 0 145 4 102 0 149 4 102 0 151 4 102 0 152 4 102 0 153 6 241 0 154 4 102 0 155 4 102 0 157 4 102 0 163 4 102 0 164 4 102 0 167 4 102 0 168 4 102 2 100] 
#[1 4 106 0 2 4 106 0 5 4 106 0 6 4 106 0 9 4 106 0 15 4 106 0 23 4 106 0 25 6 245 0 26 6 249 0 29 4 106 0 31 6 253 0 33 4 106 0 35 4 106 0 36 4 106 0 37 4 106 0 38 4 106 0 39 4 106 0 41 7 1 0 44 4 106 0 45 4 106 0 49 4 106 0 51 4 106 0 52 4 106 0 55 4 106 0 57 4 106 0 58 4 106 0 60 4 106 0 62 4 106 0 63 4 106 0 65 4 106 0 67 4 106 0 68 4 106 0 69 4 106 0 71 4 106 0 75 4 106 0 76 4 106 0 79 4 106 0 82 4 106 0 86 4 106 0 87 4 106 0 88 4 106 0 89 7 5 0 90 4 106 0 91 4 106 0 92 4 106 0 94 4 106 0 99 4 106 0 100 4 106 0 101 4 106 0 103 4 106 0 105 4 106 0 108 4 106 0 109 4 106 0 111 4 106 0 112 4 106 0 113 4 106 0 117 4 106 0 118 4 106 0 119 4 106 0 121 4 106 0 124 4 106 0 125 4 106 0 126 4 106 0 134 4 106 0 135 4 106 0 137 4 106 0 138 4 106 0 141 4 106 0 142 4 106 0 143 4 106 0 145 4 106 0 149 4 106 0 151 4 106 0 152 7 9 0 153 4 106 0 155 4 106 0 157 4 106 0 163 4 106 0 164 4 106 0 167 4 106 0 168 4 106 2 100] 
#[1 4 106 0 2 4 106 0 5 4 106 0 6 4 106 0 9 4 106 0 15 4 106 0 23 4 106 0 25 6 245 0 26 6 249 0 29 4 106 0 31 6 253 0 33 4 106 0 35 4 106 0 36 4 106 0 37 4 106 0 38 4 106 0 39 4 106 0 41 7 1 0 44 4 106 0 45 4 106 0 49 4 106 0 51 4 106 0 52 4 106 0 55 4 106 0 57 4 106 0 58 4 106 0 60 4 106 0 62 4 106 0 63 4 106 0 65 4 106 0 67 4 106 0 68 4 106 0 69 4 106 0 71 4 106 0 75 4 106 0 76 4 106 0 79 4 106 0 82 4 106 0 86 4 106 0 87 4 106 0 88 4 106 0 89 7 5 0 90 4 106 0 91 4 106 0 92 4 106 0 94 4 106 0 99 4 106 0 100 4 106 0 101 4 106 0 103 4 106 0 105 4 106 0 108 4 106 0 109 4 106 0 111 4 106 0 112 4 106 0 113 4 106 0 117 4 106 0 118 4 106 0 119 4 106 0 121 4 106 0 124 4 106 0 125 4 106 0 126 4 106 0 134 4 106 0 135 4 106 0 137 4 106 0 138 4 106 0 141 4 106 0 142 4 106 0 143 4 106 0 145 4 106 0 149 4 106 0 151 4 106 0 152 7 9 0 153 4 106 0 155 4 106 0 157 4 106 0 163 4 106 0 164 4 106 0 167 4 106 0 168 4 106 2 100] 
#[1 7 13 0 2 4 110 0 5 4 110 0 6 4 110 0 9 4 110 0 15 4 110 0 23 4 110 0 25 7 17 0 31 4 110 0 35 4 110 0 36 4 110 0 37 4 110 0 38 4 110 0 39 4 110 0 41 4 110 0 45 4 110 0 49 4 110 0 51 4 110 0 52 4 110 0 55 4 110 0 57 4 110 0 58 4 110 0 60 4 110 0 62 4 110 0 63 4 110 0 65 4 110 0 67 4 110 0 68 4 110 0 69 4 110 0 71 4 110 0 75 4 110 0 76 4 110 0 79 4 110 0 82 4 110 0 86 4 110 0 87 4 110 0 88 4 110 0 89 4 110 0 91 4 110 0 92 4 110 0 94 4 110 0 99 4 110 0 100 4 110 0 101 4 110 0 103 4 110 0 105 4 110 0 108 4 110 0 109 4 110 0 111 4 110 0 112 4 110 0 113 4 110 0 117 4 110 0 118 4 110 0 119 4 110 0 121 4 110 0 124 4 110 0 125 4 110 0 126 4 110 0 134 4 110 0 135 4 110 0 137 4 110 0 138 4 110 0 141 4 110 0 142 4 110 0 143 4 110 0 145 4 110 0 149 4 110 0 151 4 110 0 152 4 110 0 155 4 110 0 157 4 110 0 163 4 110 0 164 4 110 0 167 4 110 0 168 4 110 2 100] 
#[1 7 21 0 5 4 114 0 6 4 114 0 9 4 114 0 15 4 114 0 23 4 114 0 25 4 114 0 35 4 114 0 36 4 114 0 37 4 114 0 38 4 114 0 39 4 114 0 41 4 114 0 45 4 114 0 49 4 114 0 51 4 114 0 52 4 114 0 55 4 114 0 57 4 114 0 58 4 114 0 60 4 114 0 62 4 114 0 63 4 114 0 65 4 114 0 67 4 114 0 68 4 114 0 69 4 114 0 71 4 114 0 75 4 114 0 76 4 114 0 79 4 114 0 82 4 114 0 86 4 114 0 87 4 114 0 88 4 114 0 89 4 114 0 91 4 114 0 92 4 114 0 94 4 114 0 99 4 114 0 100 4 114 0 101 4 114 0 103 4 114 0 105 4 114 0 108 4 114 0 109 4 114 0 111 4 114 0 112 4 114 0 113 4 114 0 117 4 114 0 118 4 114 0 119 4 114 0 121 4 114 0 124 4 114 0 125 4 114 0 126 4 114 0 134 4 114 0 135 4 114 0 137 4 114 0 138 4 114 0 141 4 114 0 142 4 114 0 143 4 114 0 145 4 114 0 149 4 114 0 151 4 114 0 152 4 114 0 155 4 114 0 157 4 114 0 163 4 114 0 164 4 114 0 167 4 114 0 168 4 114 2 100] 
#[1 4 118 0 6 4 118 0 9 4 118 0 15 4 118 0 23 4 118 0 25 4 118 0 35 4 118 0 36 4 118 0 37 4 118 0 38 7 25 0 39 4 118 0 41 4 118 0 45 4 118 0 49 4 118 0 51 4 118 0 52 4 118 0 55 4 118 0 57 4 118 0 58 4 118 0 60 4 118 0 62 4 118 0 63 4 118 0 65 4 118 0 67 4 118 0 68 4 118 0 69 4 118 0 71 4 118 0 75 4 118 0 76 4 118 0 79 4 118 0 82 4 118 0 86 4 118 0 87 4 118 0 88 4 118 0 89 4 118 0 91 4 118 0 92 4 118 0 94 4 118 0 99 4 118 0 100 4 118 0 101 4 118 0 103 4 118 0 105 4 118 0 108 4 118 0 109 4 118 0 111 4 118 0 112 4 118 0 113 4 118 0 117 4 118 0 118 4 118 0 119 4 118 0 121 4 118 0 124 4 118 0 125 4 118 0 126 4 118 0 134 4 118 0 135 4 118 0 137 4 118 0 138 4 118 0 141 4 118 0 142 4 118 0 143 4 118 0 145 4 118 0 149 4 118 0 151 4 118 0 152 4 118 0 155 4 118 0 157 4 118 0 163 4 118 0 164 4 118 0 167 4 118 0 168 4 118 2 100] 
#[1 4 122 0 6 4 122 0 9 4 122 0 15 4 122 0 23 4 122 0 25 4 122 0 35 4 122 0 36 4 122 0 37 4 122 0 38 4 122 0 41 4 122 0 45 4 122 0 49 4 122 0 51 4 122 0 52 4 122 0 55 4 122 0 57 4 122 0 58 4 122 0 60 4 122 0 62 4 122 0 63 4 122 0 65 4 122 0 67 4 122 0 68 4 122 0 69 4 122 0 71 4 122 0 75 4 122 0 76 4 122 0 79 4 122 0 82 4 122 0 86 4 122 0 87 4 122 0 88 4 122 0 89 4 122 0 91 4 122 0 92 4 122 0 94 4 122 0 99 4 122 0 100 4 122 0 101 4 122 0 103 4 122 0 105 4 122 0 108 4 122 0 109 4 122 0 111 4 122 0 112 4 122 0 113 4 122 0 117 4 122 0 118 4 122 0 119 4 122 0 121 4 122 0 124 4 122 0 125 4 122 0 126 4 122 0 134 4 122 0 135 4 122 0 137 4 122 0 138 4 122 0 141 4 122 0 142 4 122 0 143 4 122 0 145 7 29 0 149 4 122 0 151 4 122 0 152 4 122 0 155 4 122 0 157 4 122 0 163 4 122 0 164 4 122 0 167 4 122 0 168 4 122 2 100] 
#[0 4 126 0 9 0 15 0 23 0 25 0 35 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 7 33 0 6 4 130 0 9 4 130 0 15 4 130 0 23 4 130 0 25 4 130 0 35 4 130 0 36 4 130 0 37 4 130 0 38 4 130 0 41 4 130 0 45 4 130 0 49 4 130 0 51 4 130 0 52 4 130 0 55 4 130 0 57 4 130 0 58 4 130 0 60 4 130 0 62 4 130 0 63 4 130 0 65 4 130 0 67 4 130 0 68 4 130 0 69 4 130 0 71 4 130 0 75 4 130 0 76 4 130 0 79 4 130 0 82 4 130 0 86 4 130 0 87 4 130 0 88 4 130 0 89 4 130 0 91 4 130 0 92 4 130 0 94 4 130 0 99 4 130 0 100 4 130 0 101 4 130 0 103 4 130 0 105 4 130 0 108 4 130 0 109 4 130 0 111 4 130 0 112 4 130 0 113 4 130 0 117 4 130 0 118 4 130 0 119 4 130 0 121 4 130 0 124 4 130 0 125 4 130 0 126 4 130 0 134 4 130 0 135 4 130 0 137 4 130 0 138 4 130 0 141 4 130 0 142 4 130 0 143 4 130 0 145 4 130 0 151 4 130 0 152 4 130 0 155 4 130 0 157 4 130 0 163 4 130 0 164 4 130 0 167 4 130 0 168 4 130 2 100] 
#[0 15 33 0 23] 
#[0 4 134 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 4 138 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 4 138 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 15 37 0 157] 
#[0 15 41 0 30] 
#[1 15 45 0 15 4 142 0 79 4 142 0 82 4 142 0 91 4 142 0 92 4 142 0 103 4 142 0 119 4 142 0 145] 
#[0 4 146 0 15 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[1 4 150 0 15 15 49 0 45 15 53 0 63 4 150 0 79 4 150 0 82 4 150 0 91 4 150 0 92 4 150 0 103 4 150 0 119 4 150 0 145 15 57 1 76 15 61 1 77] 
#[0 4 154 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 15 65 1 47 15 65 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 15 65 1 63 3 197 1 64 15 65 1 83 15 65 1 86 15 65 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 15 69 1 47 15 69 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 15 69 1 63 3 197 1 64 15 69 1 83 15 69 1 86 15 69 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 4 158 0 9 4 158 0 15 4 158 0 23 4 158 0 25 4 158 0 37 4 158 0 38 4 158 0 41 4 158 0 45 4 158 0 49 4 158 0 51 4 158 0 52 4 158 0 55 4 158 0 57 4 158 0 58 4 158 0 60 4 158 0 62 4 158 0 63 4 158 0 65 4 158 0 67 4 158 0 68 4 158 0 69 4 158 0 71 4 158 0 75 4 158 0 76 4 158 0 79 4 158 0 82 4 158 0 86 4 158 0 87 4 158 0 88 1 99 0 89 4 158 0 91 4 158 0 92 4 158 0 94 4 158 0 99 4 158 0 100 4 158 0 101 4 158 0 103 4 158 0 105 4 158 0 108 4 158 0 109 4 158 0 111 4 158 0 112 4 158 0 113 4 158 0 117 4 158 0 118 4 158 0 119 4 158 0 121 4 158 0 124 4 158 0 125 4 158 0 126 4 158 0 134 4 158 0 135 4 158 0 137 4 158 0 138 4 158 0 141 4 158 0 142 4 158 0 143 4 158 0 145 4 158 0 152 4 158 0 155 4 158 0 157 4 158 0 163 4 158 0 164 4 158 0 167 4 158 0 168 15 77 1 81 15 81 1 82 4 158 2 100] 
#[0 4 162 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 4 166 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 4 170 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 15 85 0 25] 
#[0 2 234 0 124 0 137 0 152 0 157] 
#[0 2 246 0 71 0 124 0 152 0 157] 
#[1 15 89 0 137 1 103 0 157 15 89 2 78] 
#[1 15 93 0 71 1 126 0 157 15 93 2 75] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 15 97 0 196 15 97 0 197 15 97 0 198 15 97 0 199 1 145 0 200 1 145 0 201 1 145 0 202 15 97 0 203 1 161 0 204 15 97 0 205 15 97 0 206 15 97 0 207 15 97 0 208 15 97 0 209 1 185 0 210 15 97 0 216 15 97 1 157 15 97 2 80 2 229 2 81 3 1 2 99] 
#[0 2 242 0 58 0 88 0 99 0 109 0 111 0 112] 
#[0 2 242 0 58 0 88 0 99 0 109 0 111 0 112] 
#[0 2 242 0 58 0 88 0 99 0 109 0 111 0 112] 
#[0 2 242 0 58 0 88 0 99 0 109 0 111 0 112] 
#[0 2 242 0 58 0 88 0 99 0 109 0 111 0 112] 
#[0 4 178 0 58 0 88 0 99 0 109 0 111 0 112] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 15 101 0 157 15 105 1 183 15 109 1 184] 
#[0 2 238 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[0 2 238 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[0 2 238 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[0 2 238 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[0 2 238 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[0 2 238 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[0 2 238 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[0 4 182 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 88 0 94 0 99 0 100 0 109 0 111 0 112 0 113 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 143 0 157] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 13 129 0 196 13 129 0 197 13 129 0 198 13 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 13 129 0 203 1 161 0 204 13 129 0 205 13 129 0 206 13 129 0 207 13 129 0 208 13 129 0 209 1 185 0 210 13 129 0 216 13 129 1 157 15 113 1 191 13 129 2 80 2 229 2 81 13 137 2 99] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 214 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 4 186 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 15 117 0 157 1 125 0 191 15 125 0 193 1 125 0 194 15 125 0 208 15 129 1 192] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 210 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 4 190 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 15 133 0 196 15 133 0 197 15 133 0 198 15 133 0 199 1 145 0 200 1 145 0 201 1 145 0 202 15 133 0 203 1 161 0 204 15 133 0 205 15 133 0 206 15 133 0 207 15 133 0 208 15 133 0 209 1 185 0 210 15 133 0 216 15 133 1 157 15 133 2 80 2 229 2 81 3 1 2 99] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 2 222 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[0 4 194 0 41 0 69 0 71 0 88 0 99 0 105 0 109 0 111 0 112 0 118 0 124 0 137 0 141] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 15 137 0 128 8 73 0 157 1 125 0 191 15 141 0 193 1 125 0 194 15 141 0 208] 
#[1 15 145 0 32 15 149 0 148 15 153 1 230] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 2 218 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 4 198 0 41 0 49 0 52 0 55 0 60 0 65 0 71 0 76 0 86 0 88 0 94 0 99 0 100 0 105 0 109 0 111 0 112 0 117 0 118 0 121 0 125 0 134 0 135 0 137 0 138 0 141 0 142 0 157] 
#[0 15 157 0 102] 
#[0 2 226 0 49 0 52 0 55 0 60 0 65 0 70 0 71 0 76 0 84 0 86 0 94 0 100 0 112 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 157] 
#[0 15 161 0 102] 
#[0 2 226 0 49 0 52 0 55 0 60 0 65 0 70 0 71 0 76 0 84 0 86 0 94 0 100 0 112 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 157] 
#[0 2 226 0 49 0 52 0 55 0 60 0 65 0 70 0 71 0 76 0 84 0 86 0 94 0 100 0 112 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 157] 
#[0 2 226 0 49 0 52 0 55 0 60 0 65 0 70 0 71 0 76 0 84 0 86 0 94 0 100 0 112 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 157] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 15 165 0 102] 
#[0 4 202 0 49 0 52 0 55 0 60 0 65 0 70 0 71 0 76 0 84 0 86 0 94 0 100 0 112 0 117 0 121 0 124 0 125 0 134 0 135 0 137 0 138 0 142 0 157] 
#[1 15 169 0 25 15 173 0 32 1 77 0 148 15 177 1 92 15 181 1 240] 
#[0 4 206 0 25 0 32 0 148] 
#[0 4 210 0 25 0 32 0 148] 
#[0 4 214 0 25 0 32 0 148] 
#[0 15 185 0 8] 
#[1 15 189 0 25 1 77 0 148 15 193 1 92 15 197 1 248] 
#[0 2 230 0 71 0 88 0 109 0 111 0 112 0 137 0 157] 
#[0 2 230 0 71 0 88 0 109 0 111 0 112 0 137 0 157] 
#[0 2 230 0 71 0 88 0 109 0 111 0 112 0 137 0 157] 
#[0 2 230 0 71 0 88 0 109 0 111 0 112 0 137 0 157] 
#[0 2 230 0 71 0 88 0 109 0 111 0 112 0 137 0 157] 
#[0 2 230 0 71 0 88 0 109 0 111 0 112 0 137 0 157] 
#[0 4 218 0 71 0 88 0 109 0 111 0 112 0 137 0 157] 
#[0 15 201 0 8] 
#[1 15 205 0 137 4 222 0 157] 
#[1 15 209 0 124 15 213 0 152] 
#[1 15 217 0 71 1 126 0 157 15 217 2 75] 
#[1 15 221 0 124 15 225 0 152] 
#[0 4 226 0 37 0 41 0 57 0 62 0 67 0 71 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[0 15 229 0 25] 
#[1 8 73 0 157 15 233 0 191 15 233 0 194] 
#[0 4 230 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[0 4 234 0 23] 
#[0 4 234 0 23] 
#[1 8 73 0 157 1 125 0 191 8 89 0 193 1 125 0 194 15 237 2 59 8 85 2 60 8 89 2 61] 
#[0 15 241 0 23] 
#[0 4 238 2 100] 
#[1 0 49 0 37 0 10 0 41 0 10 0 57 0 10 0 62 0 10 0 67 0 10 0 87 0 10 0 88 0 53 0 98 0 10 0 99 0 10 0 108 0 10 0 109 0 10 0 111 0 10 0 112 0 10 0 118 0 10 0 124 0 10 0 126 0 10 0 137 4 242 0 155 15 245 0 175 15 245 0 189 15 245 0 190 15 245 1 150 15 245 1 252 15 245 2 10 15 245 2 32 15 245 2 42 0 89 2 52 0 93 2 53 0 97 2 54 0 101 2 55 4 242 2 100] 
#[0 4 246 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 155 2 100] 
#[0 4 250 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 2 100] 
#[1 15 249 0 38 8 73 0 157 1 125 0 191 8 89 0 193 1 125 0 194 15 253 2 60 8 89 2 61] 
#[0 4 254 0 37 0 41 0 42 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 80 0 85 0 86 0 87 0 88 0 94 0 99 0 100 0 104 0 105 0 107 0 108 0 109 0 111 0 112 0 113 0 114 0 115 0 117 0 118 0 120 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 157] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 5 2 0 9 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 16 1 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 16 17 1 47 16 17 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 16 17 1 63 3 197 1 64 16 17 1 83 16 17 1 86 16 17 1 87 16 9 2 64 16 13 2 65 16 17 2 66 16 21 2 67 16 25 2 68 16 17 2 69 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 5 6 0 15 0 38] 
#[0 5 10 0 15 0 38] 
#[0 5 14 0 20 0 148] 
#[1 0 22 0 37 0 22 0 41 0 22 0 57 0 22 0 62 0 22 0 67 0 22 0 87 0 22 0 88 0 22 0 98 0 22 0 99 0 22 0 108 0 22 0 109 0 22 0 111 0 22 0 112 0 22 0 118 0 22 0 124 0 22 0 126 0 22 0 137 4 21 0 139 0 22 0 155 16 33 0 181 4 29 0 182 4 33 0 183 4 33 0 184 4 33 0 185 4 33 0 186] 
#[0 5 18 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 5 22 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 155 2 100] 
#[0 16 37 0 157] 
#[0 16 41 0 157] 
#[0 16 45 0 157] 
#[1 16 49 0 23 5 26 0 148 16 53 2 33 16 57 2 34] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 5 30 0 157] 
#[0 16 61 0 157] 
#[1 6 157 0 10 5 30 0 157] 
#[0 5 34 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 16 65 1 47 16 65 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 16 65 1 63 3 197 1 64 16 65 1 83 16 65 1 86 16 65 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 5 38 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 42 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 16 69 1 47 16 69 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 16 69 1 63 3 197 1 64 16 69 1 83 16 69 1 86 16 69 1 87 16 69 1 88 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 9 41 0 157 16 73 1 106] 
#[0 5 46 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 16 77 1 47 16 77 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 16 77 1 63 3 197 1 64 16 77 1 83 16 77 1 86 16 77 1 87 16 77 1 89 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 16 81 0 30] 
#[1 16 85 0 9 16 89 0 15] 
#[0 5 50 0 9 0 15] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 5 54 0 25 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 16 97 1 47 16 97 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 16 97 1 63 3 197 1 64 16 97 1 83 16 97 1 86 16 97 1 87 16 97 1 89 16 97 1 124 16 97 1 125 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 16 105 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 16 105 1 83 16 105 1 108 1 197 2 70 2 217 2 71 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86] 
#[0 16 109 0 85] 
#[0 5 58 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 3 9 0 49 0 153 0 50 3 13 0 52 3 17 0 55 0 165 0 56 0 173 0 59 3 25 0 60 0 181 0 61 0 185 0 62 0 189 0 64 3 29 0 65 2 217 0 72 0 201 0 75 3 33 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 3 41 0 86 0 229 0 93 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 0 249 0 116 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 3 65 0 134 3 69 0 135 1 45 0 136 1 49 0 137 3 77 0 138 1 57 0 139 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 16 113 1 91 16 113 1 92 16 113 1 95 16 113 1 107 2 125 1 108 16 113 1 109 16 113 1 110 16 113 1 111 16 113 1 118 16 113 1 119 16 113 1 120 16 113 1 121 16 113 1 129 16 113 1 130 16 113 1 131 16 113 1 132 16 113 1 133 16 113 1 134 16 113 1 135 16 113 1 136 16 113 1 144 16 113 1 145 16 113 1 146 16 113 1 147 16 113 1 149 1 197 2 70 2 217 2 71 16 113 2 79 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 16 113 2 87] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 3 9 0 49 0 153 0 50 3 13 0 52 3 17 0 55 0 165 0 56 0 173 0 59 3 25 0 60 0 181 0 61 0 185 0 62 0 189 0 64 3 29 0 65 2 217 0 72 0 201 0 75 3 33 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 3 41 0 86 0 229 0 93 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 0 249 0 116 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 3 65 0 134 3 69 0 135 1 45 0 136 1 49 0 137 3 77 0 138 1 57 0 139 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 16 117 1 91 16 117 1 92 16 117 1 95 16 117 1 107 2 125 1 108 16 117 1 109 16 117 1 110 16 117 1 111 16 117 1 118 16 117 1 119 16 117 1 120 16 117 1 121 16 117 1 129 16 117 1 130 16 117 1 131 16 117 1 132 16 117 1 133 16 117 1 134 16 117 1 135 16 117 1 136 16 117 1 144 16 117 1 145 16 117 1 146 16 117 1 147 16 117 1 149 1 197 2 70 2 217 2 71 16 117 2 79 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 16 117 2 87] 
#[0 5 62 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 16 121 0 157] 
#[0 5 66 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 70 0 15 0 38] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 16 125 1 47 16 125 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 16 125 1 63 3 197 1 64 16 125 1 83 16 125 1 86 16 125 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 16 129 0 35] 
#[1 10 229 0 8 16 133 0 20 2 98 0 35 10 153 0 37] 
#[0 5 74 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 9 169 0 8 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 16 137 0 155 9 173 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 9 177 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 9 181 0 237 1 197 0 239 9 185 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 9 189 0 248 1 197 0 249 1 197 0 250 1 197 0 251 9 177 1 7 1 197 1 8 1 197 1 9 16 141 1 13 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 9 205 1 30 1 197 1 49 1 197 2 70 2 217 2 71 1 197 2 83 1 197 2 84 1 197 2 86] 
#[0 16 145 0 9] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 16 149 0 222 10 121 0 223 10 125 0 224 10 129 0 225] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 16 153 0 246 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 9 29 1 47 9 29 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 9 29 1 63 3 197 1 64 9 29 1 83 9 29 1 86 9 29 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 134 0 2 0 134 0 3 0 134 0 5 0 134 0 6 0 134 0 8 0 134 0 10 0 134 0 12 0 134 0 13 0 134 0 15 0 134 0 16 0 134 0 17 0 134 0 19 0 134 0 20 0 134 0 21 5 253 0 24 0 107 0 26 0 134 0 27 0 134 0 29 5 78 0 30 0 134 0 31 1 22 0 32 0 134 0 33 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 39 0 134 0 44 0 134 0 90 0 134 0 149 0 134 0 151 0 134 0 153 0 134 0 154 0 134 0 155 6 209 0 217 6 209 0 238] 
#[0 16 157 0 155] 
#[1 16 161 0 15 5 82 0 155] 
#[0 5 86 0 15 0 155] 
#[0 16 165 0 30] 
#[1 16 169 0 15 16 173 0 155] 
#[0 5 90 0 15 0 155] 
#[0 5 94 0 15 0 155] 
#[0 5 98 0 15 0 25 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 5 102 0 15 0 155] 
#[0 5 98 0 15 0 25 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 16 177 0 155] 
#[1 16 181 0 15 5 106 0 155] 
#[1 13 145 0 15 16 185 0 38] 
#[0 16 189 0 9] 
#[0 5 110 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 16 193 0 148 16 197 1 112] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 16 201 0 196 16 201 0 197 16 201 0 198 16 201 0 199 1 145 0 200 1 145 0 201 1 145 0 202 16 201 0 203 1 161 0 204 16 201 0 205 16 201 0 206 16 201 0 207 16 201 0 208 16 201 0 209 1 185 0 210 16 201 0 216 16 201 1 157 16 201 2 80 2 229 2 81 3 1 2 99] 
#[1 16 205 0 144 5 114 0 148 16 209 1 141 16 209 1 142] 
#[0 5 118 0 144 0 148] 
#[0 5 122 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 5 126 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 74 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 5 130 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 16 217 0 157] 
#[1 16 221 0 15 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 134 0 153 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 10 89 0 196 10 89 0 197 10 89 0 198 10 89 0 199 1 145 0 200 1 145 0 201 1 145 0 202 10 89 0 203 1 161 0 204 10 89 0 205 10 89 0 206 10 89 0 207 10 89 0 208 10 89 0 209 1 185 0 210 10 89 0 216 10 93 0 218 10 97 0 219 16 225 1 18 16 229 1 19 10 89 1 157 10 89 2 80 2 229 2 81 3 1 2 99] 
#[0 5 138 0 9 0 20] 
#[0 5 142 0 9 0 20] 
#[0 5 146 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 146 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 16 233 0 157] 
#[0 5 146 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 150 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 3 9 0 49 0 153 0 50 3 13 0 52 3 17 0 55 0 165 0 56 0 173 0 59 3 25 0 60 0 181 0 61 0 185 0 62 0 189 0 64 3 29 0 65 2 217 0 72 0 201 0 75 3 33 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 3 41 0 86 0 229 0 93 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 0 249 0 116 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 3 65 0 134 3 69 0 135 1 45 0 136 1 49 0 137 3 77 0 138 1 57 0 139 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 16 237 1 91 16 237 1 92 16 237 1 95 16 237 1 107 2 125 1 108 16 237 1 109 16 237 1 110 16 237 1 111 16 237 1 118 16 237 1 119 16 237 1 120 16 237 1 121 16 237 1 129 16 237 1 130 16 237 1 131 16 237 1 132 16 237 1 133 16 237 1 134 16 237 1 135 16 237 1 136 16 237 1 144 16 237 1 145 16 237 1 146 16 237 1 147 16 237 1 149 1 197 2 70 2 217 2 71 16 237 2 79 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 16 237 2 87] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 3 9 0 49 0 153 0 50 3 13 0 52 3 17 0 55 0 165 0 56 0 173 0 59 3 25 0 60 0 181 0 61 0 185 0 62 0 189 0 64 3 29 0 65 2 217 0 72 0 201 0 75 3 33 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 3 41 0 86 0 229 0 93 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 0 249 0 116 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 3 65 0 134 3 69 0 135 1 45 0 136 1 49 0 137 3 77 0 138 1 57 0 139 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 16 241 1 91 16 241 1 92 16 241 1 95 16 241 1 107 2 125 1 108 16 241 1 109 16 241 1 110 16 241 1 111 16 241 1 118 16 241 1 119 16 241 1 120 16 241 1 121 16 241 1 129 16 241 1 130 16 241 1 131 16 241 1 132 16 241 1 133 16 241 1 134 16 241 1 135 16 241 1 136 16 241 1 144 16 241 1 145 16 241 1 146 16 241 1 147 16 241 1 149 1 197 2 70 2 217 2 71 16 241 2 79 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 16 241 2 87] 
#[0 5 154 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 5 158 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 20 0 23 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 10 89 0 196 10 89 0 197 10 89 0 198 10 89 0 199 1 145 0 200 1 145 0 201 1 145 0 202 10 89 0 203 1 161 0 204 10 89 0 205 10 89 0 206 10 89 0 207 10 89 0 208 10 89 0 209 1 185 0 210 10 89 0 216 16 245 0 219 10 89 1 157 10 89 2 80 2 229 2 81 3 1 2 99] 
#[0 5 162 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 166 0 2 0 5 0 6 0 8 0 9 0 10 0 15 0 20 0 23 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 102 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 148 0 149 0 151 0 152 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 170 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 47 0 48 0 49 0 52 0 55 0 56 0 60 0 61 0 62 0 65 0 72 0 76 0 79 0 86 0 94 0 97 0 99 0 100 0 104 0 114 0 117 0 121 0 122 0 125 0 128 0 130 0 133 0 134 0 135 0 136 0 138 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 5 174 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 16 249 0 223 10 125 0 224 10 129 0 225] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 16 253 0 220 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 16 253 1 47 16 253 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 16 253 1 63 3 197 1 64 16 253 1 83 16 253 1 86 16 253 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 17 5 0 220 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 17 5 1 47 17 5 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 17 5 1 63 3 197 1 64 17 5 1 83 17 5 1 86 17 5 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 5 178 0 9 0 15 0 38] 
#[0 5 182 0 9 0 15 0 38] 
#[0 5 186 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 17 9 0 157] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 17 13 0 222 10 121 0 223 10 125 0 224 10 129 0 225] 
#[0 17 17 0 9] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 18 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 23 0 134 0 25 0 107 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 44 0 134 0 45 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 55 0 134 0 57 0 134 0 58 0 134 0 60 0 134 0 62 0 134 0 63 0 134 0 65 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 71 0 134 0 75 0 134 0 76 0 134 0 79 0 134 0 82 0 134 0 86 0 134 0 87 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 92 0 134 0 94 0 134 0 99 0 134 0 100 0 134 0 101 0 134 0 103 0 134 0 105 0 134 0 108 0 134 0 109 0 134 0 111 0 134 0 112 0 134 0 113 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 121 0 134 0 124 0 134 0 125 0 134 0 126 0 134 0 134 0 134 0 135 0 134 0 137 0 134 0 138 0 134 0 141 0 134 0 142 0 134 0 143 0 134 0 145 0 134 0 149 0 134 0 150 0 134 0 151 0 134 0 152 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 17 21 0 217 17 21 0 238 0 134 2 100] 
#[1 14 165 0 15 17 25 0 38] 
#[0 5 190 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 194 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 198 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 17 29 0 233 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 173 1 47 10 173 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 173 1 63 3 197 1 64 10 173 1 83 10 173 1 86 10 173 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 17 33 1 47 17 33 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 17 33 1 63 3 197 1 64 17 33 1 83 17 33 1 86 17 33 1 87 17 33 1 88 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 17 37 0 233 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 10 173 1 47 10 173 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 10 173 1 63 3 197 1 64 10 173 1 83 10 173 1 86 10 173 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 5 202 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 186 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 206 0 9 0 15 0 25] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 9 65 0 196 9 65 0 197 9 65 0 198 9 65 0 199 1 145 0 200 1 145 0 201 1 145 0 202 9 65 0 203 1 161 0 204 9 65 0 205 9 65 0 206 9 65 0 207 9 65 0 208 9 65 0 209 1 185 0 210 9 65 0 216 9 65 1 157 9 65 2 80 17 41 2 81 3 1 2 99] 
#[0 5 210 0 9 0 15 0 25] 
#[0 5 214 0 9 0 15 0 25] 
#[0 5 210 0 9 0 15 0 25] 
#[0 5 210 0 9 0 15 0 25] 
#[0 5 218 0 9 0 15] 
#[0 5 222 0 9 0 15] 
#[0 1 22 0 9 0 15] 
#[0 5 226 0 9 0 15] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 17 45 1 47 17 45 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 17 45 1 63 3 197 1 64 17 45 1 83 17 45 1 86 17 45 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 17 49 0 9] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 17 53 1 47 17 53 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 17 53 1 63 3 197 1 64 17 53 1 83 17 53 1 86 17 53 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 17 57 0 85] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 17 61 1 47 17 61 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 17 61 1 63 3 197 1 64 17 61 1 83 17 61 1 86 17 61 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 11 97 1 47 11 97 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 11 97 1 63 3 197 1 64 17 65 1 75 11 97 1 83 11 97 1 86 11 97 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 5 230 0 15 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 5 234 0 15 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 5 238 0 15 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 5 242 0 15 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 17 69 0 51] 
#[0 5 246 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 17 73 0 157] 
#[0 5 250 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 254 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 2 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 6 6 0 157] 
#[0 6 6 0 157] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 17 77 0 157 17 81 1 177 17 85 1 178] 
#[1 6 10 0 15 6 10 0 25 17 89 0 30] 
#[1 17 93 0 15 17 97 0 25] 
#[0 6 14 0 15 0 25] 
#[1 15 117 0 157 1 125 0 191 15 125 0 193 1 125 0 194 15 125 0 208 17 101 1 192] 
#[1 6 18 0 8 0 134 0 20 5 253 0 24 1 107 0 26 6 18 0 32 6 18 0 148 9 37 0 217 9 37 0 238] 
#[0 0 174 0 15 0 20 0 25 0 32 0 145 0 148] 
#[0 17 105 0 20] 
#[1 17 109 0 32 17 113 0 148 17 117 1 207] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 17 121 0 157 1 125 0 191 15 125 0 193 1 125 0 194 15 125 0 208 17 125 1 183 15 109 1 184 17 129 1 192] 
#[0 17 133 0 37] 
#[0 17 137 0 20] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 17 141 1 47 17 141 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 17 141 1 63 3 197 1 64 17 141 1 83 17 141 1 86 17 141 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 49 0 37 0 10 0 80 0 10 0 88 0 10 0 109 0 10 0 111 0 10 0 120 17 145 1 210 17 149 1 212 17 153 1 214 17 157 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 6 22 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 17 161 0 196 17 161 0 197 17 161 0 198 17 161 0 199 1 145 0 200 1 145 0 201 1 145 0 202 17 161 0 203 1 161 0 204 17 161 0 205 17 161 0 206 17 161 0 207 17 161 0 208 17 161 0 209 1 185 0 210 17 161 0 216 17 161 1 157 17 161 2 80 2 229 2 81 3 1 2 99] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 17 165 0 196 17 165 0 197 17 165 0 198 17 165 0 199 1 145 0 200 1 145 0 201 1 145 0 202 17 165 0 203 1 161 0 204 17 165 0 205 17 165 0 206 17 165 0 207 17 165 0 208 17 165 0 209 1 185 0 210 17 165 0 216 17 165 1 157 17 165 2 80 2 229 2 81 3 1 2 99] 
#[1 18 1 0 1 18 5 0 2 18 5 0 3 18 5 0 5 18 5 0 10 17 189 0 12 18 1 0 13 17 197 0 16 18 1 0 17 18 5 0 21 18 5 0 26 18 5 0 27 18 5 0 29 18 5 0 31 18 5 0 33 18 5 0 39 18 1 0 72 18 1 0 130 18 5 0 149 18 1 0 152 18 5 0 153 18 5 0 154 18 1 1 236 18 5 1 238] 
#[0 6 26 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 18 9 1 47 18 9 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 18 9 1 63 3 197 1 64 18 9 1 83 18 9 1 86 18 9 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 6 30 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 6 34 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 6 38 0 9 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 100 0 10 0 104 0 10 0 107 0 10 0 114 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 128 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 0 10 0 157 18 13 1 194 18 17 1 195 18 21 1 196 18 25 1 197 18 29 1 202 18 33 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 6 42 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 6 46 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 6 50 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 18 37 0 9] 
#[0 6 54 0 157] 
#[0 6 58 0 157] 
#[0 18 41 0 157] 
#[0 6 62 0 157] 
#[0 6 58 0 157] 
#[0 18 45 0 157] 
#[0 6 66 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[1 6 13 0 20 18 49 0 25] 
#[1 18 53 0 15 18 57 0 38] 
#[0 6 70 0 157] 
#[0 6 74 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 155 2 100] 
#[0 6 78 0 37 0 41 0 42 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 80 0 85 0 86 0 87 0 88 0 94 0 99 0 100 0 104 0 105 0 107 0 108 0 109 0 111 0 112 0 113 0 114 0 115 0 117 0 118 0 120 0 121 0 124 0 125 0 126 0 128 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 157] 
#[0 6 82 0 15 0 38] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 13 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 17 0 134 0 18 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 5 253 0 24 0 107 0 26 0 134 0 27 0 134 0 28 0 134 0 29 1 111 0 30 0 134 0 31 1 22 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 39 0 134 0 40 0 134 0 44 0 134 0 90 0 134 0 149 0 134 0 150 0 134 0 151 0 134 0 153 0 134 0 154 6 209 0 217 6 209 0 238] 
#[0 6 86 0 9 0 15] 
#[0 18 65 0 9] 
#[1 6 90 0 9 18 69 0 15] 
#[0 6 94 0 9 0 15] 
#[1 18 73 0 9 18 77 0 15] 
#[0 6 98 0 9 0 15] 
#[0 6 102 0 9 0 15] 
#[1 0 49 0 37 0 10 0 41 0 10 0 57 0 10 0 62 0 10 0 67 0 10 0 87 0 10 0 88 0 53 0 98 0 10 0 99 0 10 0 108 0 10 0 109 0 10 0 111 0 10 0 112 0 10 0 118 0 10 0 124 0 10 0 126 0 10 0 137 3 58 0 155 13 69 0 175 18 81 0 187 13 65 0 188 13 69 0 189 13 69 0 190 13 69 1 150 13 69 1 252 13 69 2 10 13 69 2 32 13 69 2 42 0 89 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 6 106 0 23 18 85 0 26 6 106 0 145 6 106 0 148 18 89 1 154 18 89 1 155] 
#[1 6 106 0 23 18 85 0 26 6 106 0 145 6 106 0 148 18 97 1 154 18 97 1 155] 
#[1 6 110 0 23 18 101 0 26 6 110 0 145 6 110 0 148 18 105 2 14 18 105 2 15] 
#[0 18 113 0 52 0 55 0 86 0 94 0 117 0 121 0 134 0 135 0 138 0 201] 
#[1 18 117 0 148 18 121 2 35] 
#[0 6 114 0 148] 
#[1 6 110 0 8 18 101 0 26 18 125 2 14 18 125 2 15] 
#[0 6 118 0 15 0 38 0 155] 
#[0 6 122 0 15 0 25] 
#[0 6 126 0 15 0 25] 
#[0 18 129 0 9] 
#[1 0 105 0 1 18 133 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 18 137 1 47 18 137 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 18 137 1 63 3 197 1 64 18 137 1 83 18 137 1 86 18 137 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86 18 141 2 90] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 3 9 0 49 0 153 0 50 3 13 0 52 3 17 0 55 0 165 0 56 0 173 0 59 3 25 0 60 0 181 0 61 0 185 0 62 0 189 0 64 3 29 0 65 2 217 0 72 0 201 0 75 3 33 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 3 41 0 86 0 229 0 93 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 0 249 0 116 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 3 65 0 134 3 69 0 135 1 45 0 136 1 49 0 137 3 77 0 138 1 57 0 139 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 18 145 1 91 18 145 1 92 18 145 1 95 18 145 1 107 2 125 1 108 18 145 1 109 18 145 1 110 18 145 1 111 18 145 1 118 18 145 1 119 18 145 1 120 18 145 1 121 18 145 1 129 18 145 1 130 18 145 1 131 18 145 1 132 18 145 1 133 18 145 1 134 18 145 1 135 18 145 1 136 18 145 1 144 18 145 1 145 18 145 1 146 18 145 1 147 18 145 1 149 1 197 2 70 2 217 2 71 18 145 2 79 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 18 145 2 87] 
#[1 13 173 0 157 18 149 2 89] 
#[0 6 130 0 25] 
#[0 18 153 0 25] 
#[0 6 134 0 25] 
#[0 6 138 0 9 0 15 0 25] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 18 157 1 47 18 157 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 18 157 1 63 3 197 1 64 18 157 1 83 18 157 1 86 18 157 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 6 142 0 1 6 142 0 5 6 142 0 8 6 142 0 10 6 142 0 12 6 142 0 13 6 142 0 16 6 142 0 17 6 142 0 25 6 142 0 47 6 142 0 48 6 142 0 49 6 142 0 50 6 142 0 52 6 142 0 53 6 142 0 55 6 142 0 56 6 142 0 58 6 142 0 59 6 142 0 60 6 142 0 61 6 142 0 62 6 142 0 64 6 142 0 65 1 115 0 66 6 142 0 72 6 142 0 75 6 142 0 76 6 142 0 77 6 142 0 78 6 142 0 81 6 142 0 83 6 142 0 86 6 142 0 93 6 142 0 94 6 142 0 97 6 142 0 99 6 142 0 100 6 142 0 116 6 142 0 117 6 142 0 121 6 142 0 122 6 142 0 125 6 142 0 127 6 142 0 128 6 142 0 129 6 142 0 130 6 142 0 131 6 142 0 133 6 142 0 134 6 142 0 135 6 142 0 136 6 142 0 137 6 142 0 138 6 142 0 139 6 142 0 140 6 142 0 142 6 142 0 146 6 142 0 147 6 142 0 148 6 142 0 152 6 142 0 155 6 142 0 157 6 142 0 158 6 142 0 159 6 142 0 160 6 142 0 161 6 142 0 162 6 142 0 165 6 142 0 166 6 142 0 169 6 142 0 170 6 142 2 100] 
#[0 6 146 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 0 134 0 9 0 134 0 20 6 1 0 26 18 165 0 217 18 165 0 238] 
#[0 6 150 0 15 0 155] 
#[1 18 169 0 20 14 193 0 37] 
#[0 18 173 0 157] 
#[0 6 154 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 158 0 15 0 155] 
#[1 6 162 0 2 6 162 0 3 6 162 0 4 6 162 0 5 6 162 0 6 6 162 0 7 6 162 0 8 6 162 0 9 6 162 0 10 6 162 0 11 6 162 0 12 6 162 0 13 6 162 0 14 6 162 0 15 6 162 0 16 6 162 0 17 6 162 0 18 6 162 0 19 6 162 0 20 6 162 0 21 6 162 0 22 6 162 0 23 6 162 0 25 6 162 0 26 6 162 0 27 6 162 0 28 6 162 0 29 6 162 0 30 6 162 0 31 6 162 0 33 6 162 0 34 6 162 0 35 6 162 0 36 6 162 0 37 6 162 0 38 6 162 0 39 6 162 0 40 6 162 0 41 6 162 0 44 6 162 0 45 6 162 0 49 6 162 0 51 6 162 0 52 6 162 0 55 6 162 0 57 6 162 0 58 6 162 0 60 6 162 0 62 6 162 0 63 6 162 0 65 6 162 0 67 6 162 0 68 6 162 0 69 6 162 0 71 6 162 0 75 6 162 0 76 6 162 0 79 6 162 0 82 6 162 0 86 6 162 0 87 6 162 0 88 6 162 0 89 6 162 0 90 6 162 0 91 6 162 0 92 6 162 0 94 6 162 0 99 6 162 0 100 6 162 0 101 6 162 0 103 6 162 0 105 6 162 0 108 6 162 0 109 6 162 0 111 6 162 0 112 6 162 0 113 6 162 0 117 6 162 0 118 6 162 0 119 6 162 0 121 6 162 0 124 6 162 0 125 6 162 0 126 6 162 0 134 6 162 0 135 6 162 0 137 6 162 0 138 6 162 0 141 6 162 0 142 6 162 0 143 6 162 0 145 9 213 0 148 6 162 0 149 6 162 0 150 6 162 0 151 6 162 0 152 6 162 0 153 6 162 0 154 6 162 0 155 6 162 0 157 6 162 0 163 6 162 0 164 6 162 0 167 6 162 0 168 18 177 0 252 18 177 0 253 18 177 0 254 18 177 1 4 6 162 2 100] 
#[1 14 165 0 15 18 185 0 38] 
#[1 13 145 0 15 18 189 0 155] 
#[0 6 166 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 13 249 0 37 18 193 0 155 18 197 0 157 18 201 1 1 14 17 1 2] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 9 213 0 148 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 18 209 0 253 18 209 0 254 18 209 1 3 18 209 1 4 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 18 209 1 47 18 209 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 18 209 1 63 3 197 1 64 18 209 1 83 18 209 1 86 18 209 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 13 253 0 148 1 81 0 152 18 217 0 155 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 18 221 1 6 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 125 1 26 3 125 1 27 3 125 1 32 3 125 1 33 3 125 1 34 3 125 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 14 29 1 47 14 29 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 14 29 1 63 3 197 1 64 14 29 1 87 1 197 2 70 2 217 2 71 3 125 2 82 1 197 2 83 1 197 2 84 3 125 2 85 1 197 2 86] 
#[0 6 170 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 174 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 9 229 0 148 1 81 0 152 18 225 0 155 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 18 229 1 47 18 229 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 18 229 1 63 3 197 1 64 18 229 1 83 18 229 1 86 18 229 1 87 18 229 1 185 18 229 2 7 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 6 178 0 2 6 178 0 3 6 178 0 4 6 178 0 5 6 178 0 6 6 178 0 7 6 178 0 8 6 178 0 9 6 178 0 10 6 178 0 11 6 178 0 12 6 178 0 13 6 178 0 14 6 178 0 15 6 178 0 16 6 178 0 17 6 178 0 18 6 178 0 19 6 178 0 20 6 178 0 21 6 178 0 22 6 178 0 23 6 178 0 25 6 178 0 26 6 178 0 27 6 178 0 28 6 178 0 29 6 178 0 30 6 178 0 31 6 178 0 33 6 178 0 34 6 178 0 35 6 178 0 36 1 119 0 37 6 178 0 38 6 178 0 39 6 178 0 40 6 178 0 41 6 178 0 44 6 178 0 45 6 178 0 49 6 178 0 51 6 178 0 52 6 178 0 55 6 178 0 57 6 178 0 58 6 178 0 60 6 178 0 62 6 178 0 63 6 178 0 65 6 178 0 67 6 178 0 68 6 178 0 69 6 178 0 71 6 178 0 75 6 178 0 76 6 178 0 79 6 178 0 82 6 178 0 86 6 178 0 87 6 178 0 88 6 178 0 89 6 178 0 90 6 178 0 91 6 178 0 92 6 178 0 94 6 178 0 99 6 178 0 100 6 178 0 101 6 178 0 103 6 178 0 105 6 178 0 108 6 178 0 109 6 178 0 111 6 178 0 112 6 178 0 113 6 178 0 117 6 178 0 118 6 178 0 119 6 178 0 121 6 178 0 124 6 178 0 125 6 178 0 126 6 178 0 134 6 178 0 135 6 178 0 137 6 178 0 138 6 178 0 141 6 178 0 142 6 178 0 143 6 178 0 145 6 178 0 148 6 178 0 149 6 178 0 150 6 178 0 151 6 178 0 152 6 178 0 153 6 178 0 154 6 178 0 155 6 178 0 157 6 178 0 163 6 178 0 164 6 178 0 167 6 178 0 168 18 233 0 211 18 237 0 212 6 25 0 213 6 178 2 100] 
#[0 6 182 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 18 241 0 53 18 245 0 61 6 186 0 155 18 249 1 113 18 253 1 114 19 1 1 115 19 5 1 116 19 9 1 117] 
#[0 6 190 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 6 194 0 9 0 186 0 10 0 190 0 35 0 194 0 37 19 17 0 157 19 17 2 76] 
#[0 19 21 0 8] 
#[1 1 77 0 148 19 25 1 92] 
#[0 6 198 0 148] 
#[1 1 83 0 9 0 134 0 10 1 83 0 20 14 97 0 26 0 134 0 35 0 134 0 37 14 141 0 217 14 141 0 238 19 29 1 16 14 105 1 17] 
#[0 6 202 0 15 0 153] 
#[0 19 33 0 153] 
#[1 19 37 0 15 6 206 0 153] 
#[1 4 10 0 9 4 10 0 20 19 41 0 26 19 45 1 16 14 105 1 17] 
#[0 6 210 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 6 214 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 6 218 0 15 0 153] 
#[0 6 222 0 9 0 15 0 38] 
#[0 6 226 0 9 0 15 0 38] 
#[0 6 230 0 9 0 15 0 38] 
#[0 6 234 0 9 0 15 0 38] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 18 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 23 0 134 0 25 0 107 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 44 0 134 0 45 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 55 0 134 0 57 0 134 0 58 0 134 0 60 0 134 0 62 0 134 0 63 0 134 0 65 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 71 0 134 0 75 0 134 0 76 0 134 0 79 0 134 0 82 0 134 0 86 0 134 0 87 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 92 0 134 0 94 0 134 0 99 0 134 0 100 0 134 0 101 0 134 0 103 0 134 0 105 0 134 0 108 0 134 0 109 0 134 0 111 0 134 0 112 0 134 0 113 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 121 0 134 0 124 0 134 0 125 0 134 0 126 0 134 0 134 0 134 0 135 0 134 0 137 0 134 0 138 0 134 0 141 0 134 0 142 0 134 0 143 0 134 0 145 0 134 0 149 0 134 0 150 0 134 0 151 0 134 0 152 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 19 49 0 217 19 49 0 238 0 134 2 100] 
#[1 14 165 0 15 19 53 0 38] 
#[1 6 238 0 4 6 238 0 7 6 238 0 8 6 242 0 9 6 238 0 11 6 238 0 14 6 242 0 15 6 238 0 18 6 238 0 20 6 238 0 22 6 242 0 25 6 238 0 28 6 238 0 30 6 238 0 34 6 238 0 35 6 238 0 37 6 238 0 40 6 238 0 150] 
#[0 6 246 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 250 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 6 254 0 163] 
#[0 7 2 0 163 0 164 0 167 0 168] 
#[0 7 6 0 167] 
#[1 6 153 0 10 19 57 0 37] 
#[0 7 10 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 6 238 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 7 14 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 19 61 1 47 19 61 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 19 61 1 63 3 197 1 64 19 61 1 83 19 61 1 86 19 61 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 7 18 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 7 22 0 15 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 19 65 1 47 19 65 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 19 65 1 63 3 197 1 64 19 65 1 83 19 65 1 86 19 65 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 3 37 0 79 1 86 0 82 7 53 0 91 7 57 0 92 7 61 0 103 1 86 0 119 7 65 0 145 7 69 1 64 19 69 1 65 7 77 1 66 7 81 1 67 7 85 1 68 7 89 1 69 7 93 1 70 7 97 1 71 7 101 1 72 7 105 1 73] 
#[0 19 73 0 30] 
#[1 19 77 0 15 19 81 0 25] 
#[0 7 26 0 15 0 25] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 9 229 0 148 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 19 85 1 47 19 85 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 19 85 1 63 3 197 1 64 19 85 1 83 19 85 1 86 19 85 1 87 19 85 1 185 19 85 2 7 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 15 101 0 157 19 89 1 184] 
#[0 7 30 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 6 106 0 8 18 85 0 26 19 93 1 154 19 93 1 155] 
#[0 19 97 0 157] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 19 101 1 47 19 101 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 19 101 1 63 3 197 1 64 19 101 1 83 19 101 1 86 19 101 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 0 49 0 37 0 10 0 80 0 10 0 88 0 10 0 109 0 10 0 111 0 10 0 120 19 105 1 210 17 149 1 212 17 153 1 214 17 157 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 7 34 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 6 10 0 15 0 134 0 20 5 253 0 24 6 10 0 25 6 1 0 26 17 89 0 30 6 18 0 148 9 37 0 217 9 37 0 238] 
#[1 17 93 0 15 19 109 0 25] 
#[0 19 113 0 148] 
#[1 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 100 0 10 0 104 0 10 0 107 0 10 0 114 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 128 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 0 10 0 157 19 117 1 195 18 21 1 196 18 25 1 197 18 29 1 202 18 33 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 19 121 0 128] 
#[0 19 125 0 25] 
#[0 19 129 0 155] 
#[1 0 49 0 37 0 10 0 88 0 10 0 109 0 10 0 111 0 10 0 120 7 38 0 155 19 133 1 213 19 133 1 214 19 141 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 0 49 0 37 0 10 0 80 0 10 0 88 0 10 0 109 0 10 0 111 7 42 0 155 19 145 1 211 19 145 1 212 19 153 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 7 46 0 80 19 157 0 88 19 161 0 109 19 165 0 111 7 46 0 120 19 169 1 215 19 173 1 216] 
#[1 19 177 0 8 0 186 0 10 0 190 0 35 0 194 0 37] 
#[1 19 181 0 8 0 186 0 10 0 190 0 35 0 194 0 37] 
#[0 7 50 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 1 123 0 8] 
#[0 7 50 0 8] 
#[0 1 123 0 8] 
#[0 7 50 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 7 50 0 8] 
#[0 7 50 0 8] 
#[0 7 54 0 8] 
#[0 7 50 0 8] 
#[0 7 54 0 8] 
#[0 7 54 0 8] 
#[0 19 185 0 8] 
#[0 19 189 0 8] 
#[0 19 193 0 25] 
#[0 19 197 0 9] 
#[0 7 58 0 9] 
#[1 7 62 0 9 19 201 0 15 7 62 0 38] 
#[0 7 66 0 9 0 15 0 38] 
#[0 7 70 0 9 0 38] 
#[1 7 74 0 49 7 74 0 52 7 74 0 55 7 74 0 60 7 74 0 65 7 74 0 76 7 74 0 86 7 74 0 94 7 74 0 100 19 221 0 104 19 209 0 107 19 221 0 114 7 74 0 117 7 74 0 121 7 74 0 125 19 221 0 128 7 74 0 134 7 74 0 135 7 74 0 138 7 74 0 142 7 74 0 157 19 221 1 200 19 221 1 201] 
#[1 19 229 0 25 1 77 0 148 19 233 1 92 19 237 1 251] 
#[0 19 241 0 8] 
#[0 19 245 0 8] 
#[0 7 78 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 139 0 155 2 100] 
#[1 19 249 0 38 8 73 0 157 1 125 0 191 8 89 0 193 1 125 0 194 15 253 2 60 8 89 2 61] 
#[0 7 82 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 19 253 1 47 19 253 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 19 253 1 63 3 197 1 64 19 253 1 83 19 253 1 86 19 253 1 87 19 253 2 69 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 7 86 0 15 0 38] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 16 1 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 20 1 1 47 20 1 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 20 1 1 63 3 197 1 64 20 1 1 83 20 1 1 86 20 1 1 87 20 1 2 66 20 5 2 67 16 25 2 68 20 1 2 69 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 7 86 0 15 0 38] 
#[1 20 9 0 157 20 13 2 68] 
#[0 20 17 0 155] 
#[1 0 49 0 37 0 10 0 157 20 21 1 156 20 25 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 20 29 0 23 7 90 0 145 7 90 0 148 20 33 1 158 20 37 1 159] 
#[0 7 94 0 8 0 23 0 145 0 148] 
#[1 20 41 0 23 7 98 0 145 7 98 0 148 20 45 2 0 20 49 2 1] 
#[1 0 49 0 37 0 10 0 85 0 10 0 104 0 10 0 157 20 53 2 16 20 57 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 20 61 0 23 7 102 0 145 7 102 0 148 20 65 2 19 20 69 2 20] 
#[0 7 106 0 8 0 23 0 145 0 148] 
#[0 7 110 0 148] 
#[1 0 49 0 37 7 114 0 155 0 10 0 157 20 73 2 39 20 77 2 40 20 81 2 41 20 85 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 20 89 0 25 3 94 0 37 3 94 0 41 3 94 0 49 3 94 0 52 3 94 0 55 3 94 0 57 3 94 0 58 3 94 0 60 3 94 0 62 3 94 0 65 3 94 0 67 3 94 0 69 3 94 0 71 3 94 0 75 3 94 0 76 3 94 0 86 3 94 0 87 3 94 0 88 3 94 0 94 3 94 0 98 3 94 0 99 3 94 0 100 3 94 0 105 3 94 0 108 3 94 0 109 3 94 0 111 3 94 0 112 3 94 0 113 3 94 0 117 3 94 0 118 3 94 0 121 3 94 0 124 3 94 0 125 3 94 0 126 3 94 0 134 3 94 0 135 3 94 0 137 3 94 0 138 3 94 0 141 3 94 0 142 3 94 0 143 3 94 0 152 3 94 0 155 3 94 0 157 20 89 2 72 3 94 2 100] 
#[0 20 93 0 8] 
#[0 20 97 0 25] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 20 101 0 220 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 20 105 1 26 20 105 1 27 20 105 1 32 20 105 1 33 20 105 1 34 20 105 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 20 101 1 47 20 101 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 20 101 1 63 3 197 1 64 20 101 1 83 20 101 1 86 20 101 1 87 1 197 2 70 2 217 2 71 20 105 2 82 1 197 2 83 1 197 2 84 20 105 2 85 1 197 2 86] 
#[0 7 118 0 9 0 15] 
#[0 7 122 0 9 0 15] 
#[0 7 126 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 7 130 0 9 0 15] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 7 134 0 9 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 9 81 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 9 81 1 83 9 81 1 108 20 109 1 126 20 109 1 127 20 117 1 128 1 197 2 70 2 217 2 71 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86] 
#[0 20 121 0 9] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 3 9 0 49 0 153 0 50 3 13 0 52 3 17 0 55 0 165 0 56 0 173 0 59 3 25 0 60 0 181 0 61 0 185 0 62 0 189 0 64 3 29 0 65 2 217 0 72 0 201 0 75 3 33 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 3 41 0 86 0 229 0 93 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 0 249 0 116 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 3 65 0 134 3 69 0 135 1 45 0 136 1 49 0 137 3 77 0 138 1 57 0 139 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 20 125 1 91 20 125 1 92 20 125 1 95 20 125 1 107 2 125 1 108 20 125 1 109 20 125 1 110 20 125 1 111 20 125 1 118 20 125 1 119 20 125 1 120 20 125 1 121 20 125 1 129 20 125 1 130 20 125 1 131 20 125 1 132 20 125 1 133 20 125 1 134 20 125 1 135 20 125 1 136 20 125 1 144 20 125 1 145 20 125 1 146 20 125 1 147 20 125 1 149 1 197 2 70 2 217 2 71 20 125 2 79 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 20 125 2 87] 
#[0 7 138 0 9 0 20] 
#[0 20 129 0 157] 
#[1 0 134 0 8 0 134 0 15 0 134 0 20 6 1 0 26 0 134 0 35 0 134 0 37 0 134 0 155 20 133 0 217 20 133 0 238] 
#[0 7 142 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 7 146 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 7 150 0 30] 
#[0 7 154 0 15 0 155] 
#[0 7 158 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 5 78 0 30] 
#[0 7 162 0 15 0 155] 
#[0 7 166 0 15 0 155] 
#[0 7 170 0 15 0 155] 
#[0 7 166 0 15 0 155] 
#[0 7 174 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 7 178 0 15 0 155] 
#[0 7 182 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 7 186 0 15 0 155] 
#[1 7 190 0 2 7 190 0 3 7 190 0 4 7 190 0 5 7 190 0 6 7 190 0 7 7 190 0 8 7 190 0 9 7 190 0 10 7 190 0 11 7 190 0 12 7 190 0 13 7 190 0 14 7 190 0 15 7 190 0 16 7 190 0 17 7 190 0 18 7 190 0 19 7 190 0 20 7 190 0 21 7 190 0 22 7 190 0 23 7 190 0 25 7 190 0 26 7 190 0 27 7 190 0 28 7 190 0 29 7 190 0 30 7 190 0 31 7 190 0 33 7 190 0 34 7 190 0 35 7 190 0 36 7 190 0 37 7 190 0 38 7 190 0 39 7 190 0 40 7 190 0 41 7 190 0 44 7 190 0 45 7 190 0 49 7 190 0 51 7 190 0 52 7 190 0 55 7 190 0 57 7 190 0 58 7 190 0 60 7 190 0 62 7 190 0 63 7 190 0 65 7 190 0 67 7 190 0 68 7 190 0 69 7 190 0 71 7 190 0 75 7 190 0 76 7 190 0 79 7 190 0 82 7 190 0 86 7 190 0 87 7 190 0 88 7 190 0 89 7 190 0 90 7 190 0 91 7 190 0 92 7 190 0 94 7 190 0 99 7 190 0 100 7 190 0 101 7 190 0 103 7 190 0 105 7 190 0 108 7 190 0 109 7 190 0 111 7 190 0 112 7 190 0 113 7 190 0 117 7 190 0 118 7 190 0 119 7 190 0 121 7 190 0 124 7 190 0 125 7 190 0 126 7 190 0 134 7 190 0 135 7 190 0 137 7 190 0 138 7 190 0 141 7 190 0 142 7 190 0 143 7 190 0 145 9 229 0 148 7 190 0 149 7 190 0 150 7 190 0 151 7 190 0 152 7 190 0 153 7 190 0 154 7 190 0 155 7 190 0 157 7 190 0 163 7 190 0 164 7 190 0 167 7 190 0 168 20 137 2 6 20 137 2 7 7 190 2 100] 
#[1 7 194 0 2 7 194 0 3 7 194 0 4 7 194 0 5 7 194 0 6 7 194 0 7 7 194 0 8 7 194 0 9 7 194 0 10 7 194 0 11 7 194 0 12 7 194 0 13 7 194 0 14 7 194 0 15 7 194 0 16 7 194 0 17 7 194 0 18 7 194 0 19 7 194 0 20 7 194 0 21 7 194 0 22 7 194 0 23 7 194 0 25 7 194 0 26 7 194 0 27 7 194 0 28 7 194 0 29 7 194 0 30 7 194 0 31 7 194 0 33 7 194 0 34 7 194 0 35 7 194 0 36 1 127 0 37 7 194 0 38 7 194 0 39 7 194 0 40 7 194 0 41 7 194 0 44 7 194 0 45 7 194 0 49 7 194 0 51 7 194 0 52 7 194 0 55 7 194 0 57 7 194 0 58 7 194 0 60 7 194 0 62 7 194 0 63 7 194 0 65 7 194 0 67 7 194 0 68 7 194 0 69 7 194 0 71 7 194 0 75 7 194 0 76 7 194 0 79 7 194 0 82 7 194 0 86 7 194 0 87 7 194 0 88 7 194 0 89 7 194 0 90 7 194 0 91 7 194 0 92 7 194 0 94 7 194 0 99 7 194 0 100 7 194 0 101 7 194 0 103 7 194 0 105 7 194 0 108 7 194 0 109 7 194 0 111 7 194 0 112 7 194 0 113 7 194 0 117 7 194 0 118 7 194 0 119 7 194 0 121 7 194 0 124 7 194 0 125 7 194 0 126 7 194 0 134 7 194 0 135 7 194 0 137 7 194 0 138 7 194 0 141 7 194 0 142 7 194 0 143 7 194 0 145 7 194 0 148 7 194 0 149 7 194 0 150 7 194 0 151 7 194 0 152 7 194 0 153 7 194 0 154 7 194 0 155 7 194 0 157 7 194 0 163 7 194 0 164 7 194 0 167 7 194 0 168 10 105 0 213 7 194 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 20 145 1 47 20 145 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 20 145 1 63 3 197 1 64 20 145 1 83 20 145 1 86 20 145 1 87 20 145 1 88 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 20 149 0 23] 
#[0 20 153 0 155] 
#[1 18 241 0 53 18 245 0 61 7 198 0 155 20 157 1 115 19 5 1 116 19 9 1 117] 
#[0 7 202 0 53 0 61 0 155] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 0 149 0 49 0 153 0 50 0 157 0 52 18 241 0 53 0 161 0 55 0 165 0 56 0 169 0 58 0 173 0 59 0 177 0 60 20 161 0 61 0 185 0 62 0 189 0 64 0 193 0 65 2 217 0 72 0 201 0 75 0 205 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 0 225 0 86 0 229 0 93 0 233 0 94 0 237 0 97 0 241 0 99 0 245 0 100 0 249 0 116 0 253 0 117 1 1 0 121 1 5 0 122 1 9 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 1 37 0 134 1 41 0 135 1 45 0 136 1 49 0 137 1 53 0 138 1 57 0 139 1 61 0 140 1 65 0 142 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 1 85 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 1 129 0 196 1 129 0 197 1 129 0 198 1 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 1 129 0 203 1 161 0 204 1 129 0 205 1 129 0 206 1 129 0 207 1 129 0 208 1 129 0 209 1 185 0 210 1 129 0 216 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 5 233 1 90 5 233 1 91 5 233 1 92 20 165 1 94 5 233 1 95 5 233 1 96 5 233 1 97 2 109 1 98 2 113 1 99 2 117 1 104 5 233 1 107 2 125 1 108 5 233 1 109 5 233 1 110 5 233 1 111 20 169 1 117 5 233 1 118 5 233 1 119 5 233 1 120 5 233 1 121 5 233 1 129 5 233 1 130 5 233 1 131 5 233 1 132 5 233 1 133 5 233 1 134 5 233 1 135 5 233 1 136 5 233 1 144 5 233 1 145 5 233 1 146 5 233 1 147 5 233 1 149 1 129 1 157 1 197 2 70 2 217 2 71 5 233 2 79 1 129 2 80 2 229 2 81 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 5 233 2 87 3 1 2 99] 
#[0 7 206 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 7 210 0 9] 
#[0 20 173 0 9] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 20 177 1 47 20 177 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 20 177 1 63 3 197 1 64 20 177 1 83 20 177 1 86 20 177 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 7 214 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 74 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 7 218 0 9 0 20] 
#[0 7 222 0 9 0 20] 
#[0 7 226 0 15 0 153] 
#[1 16 221 0 15 5 134 0 153 16 225 1 18 16 229 1 19] 
#[0 7 230 0 9 0 20] 
#[0 7 234 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 7 238 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 20 181 1 47 20 181 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 20 181 1 63 3 197 1 64 20 181 1 83 20 181 1 86 20 181 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 20 185 0 101] 
#[0 7 242 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 7 246 0 9 0 15 0 23 0 25 0 37 0 38 0 41 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 152 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 20 189 1 47 20 189 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 20 189 1 63 3 197 1 64 20 189 1 83 20 189 1 86 20 189 1 87 20 189 1 88 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 17 77 0 157 20 193 1 178] 
#[0 7 250 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 7 254 0 15 0 25] 
#[0 8 2 0 15 0 25] 
#[0 20 197 0 8] 
#[0 8 6 0 8 0 26 0 32 0 148] 
#[0 8 10 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 20 201 0 155] 
#[0 8 14 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 0 49 0 37 0 10 0 42 0 10 0 115 20 205 1 222 20 209 1 223 20 213 1 224 20 217 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 20 221 0 38] 
#[0 20 225 0 37] 
#[0 8 18 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 8 22 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 8 26 0 155] 
#[0 8 30 0 155] 
#[1 19 157 0 88 19 161 0 109 19 165 0 111 7 46 0 120 20 229 1 215 19 173 1 216] 
#[0 8 34 0 155] 
#[0 8 38 0 155] 
#[1 7 46 0 80 19 157 0 88 19 161 0 109 19 165 0 111 20 233 1 215 19 173 1 216] 
#[1 8 42 0 80 20 237 0 111 8 42 0 120] 
#[0 8 42 0 80 0 120] 
#[1 8 42 0 80 20 241 0 88 8 42 0 120] 
#[1 20 245 0 80 20 249 0 120] 
#[0 8 46 0 80 0 120] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 20 253 0 196 20 253 0 197 20 253 0 198 20 253 0 199 1 145 0 200 1 145 0 201 1 145 0 202 20 253 0 203 1 161 0 204 20 253 0 205 20 253 0 206 20 253 0 207 20 253 0 208 20 253 0 209 1 185 0 210 20 253 0 216 20 253 1 157 20 253 2 80 2 229 2 81 3 1 2 99] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 21 1 0 196 21 1 0 197 21 1 0 198 21 1 0 199 1 145 0 200 1 145 0 201 1 145 0 202 21 1 0 203 1 161 0 204 21 1 0 205 21 1 0 206 21 1 0 207 21 1 0 208 21 1 0 209 1 185 0 210 21 1 0 216 21 1 1 157 21 1 2 80 2 229 2 81 3 1 2 99] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 21 5 0 196 21 5 0 197 21 5 0 198 21 5 0 199 1 145 0 200 1 145 0 201 1 145 0 202 21 5 0 203 1 161 0 204 21 5 0 205 21 5 0 206 21 5 0 207 21 5 0 208 21 5 0 209 1 185 0 210 21 5 0 216 21 5 1 157 21 5 2 80 2 229 2 81 3 1 2 99] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 21 9 0 196 21 9 0 197 21 9 0 198 21 9 0 199 1 145 0 200 1 145 0 201 1 145 0 202 21 9 0 203 1 161 0 204 21 9 0 205 21 9 0 206 21 9 0 207 21 9 0 208 21 9 0 209 1 185 0 210 21 9 0 216 21 9 1 157 21 9 2 80 2 229 2 81 3 1 2 99] 
#[0 8 50 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 21 13 0 23 8 54 0 25 8 54 0 148 21 17 1 246 21 17 1 247] 
#[1 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 100 0 10 0 104 0 10 0 107 0 10 0 114 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 128 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 0 10 0 157 21 25 1 197 21 29 1 202 18 33 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 8 58 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 94 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 157] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 9 65 0 196 9 65 0 197 9 65 0 198 9 65 0 199 1 145 0 200 1 145 0 201 1 145 0 202 9 65 0 203 1 161 0 204 9 65 0 205 9 65 0 206 9 65 0 207 9 65 0 208 21 33 0 209 1 185 0 210 9 65 0 216 9 65 1 157 9 65 2 80 2 229 2 81 3 1 2 99] 
#[0 8 58 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 94 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 157] 
#[0 8 58 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 94 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 157] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 21 37 0 196 21 37 0 197 21 37 0 198 21 37 0 199 1 145 0 200 1 145 0 201 1 145 0 202 21 37 0 203 1 161 0 204 21 37 0 205 21 37 0 206 21 37 0 207 21 37 0 208 21 37 0 209 1 185 0 210 21 37 0 216 21 37 1 157 21 37 2 80 2 229 2 81 3 1 2 99] 
#[0 8 62 0 49 0 52 0 55 0 60 0 65 0 76 0 86 0 94 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 157] 
#[0 8 66 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 8 70 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 8 74 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 21 41 0 9] 
#[0 21 45 0 9] 
#[0 8 78 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 2 100] 
#[0 8 82 0 9 0 15] 
#[0 8 86 0 9 0 15] 
#[1 21 49 0 9 18 77 0 15] 
#[0 18 61 0 30] 
#[0 8 90 0 9 0 15] 
#[0 8 94 0 25 0 37 0 41 0 57 0 62 0 67 0 87 0 88 0 98 0 99 0 108 0 109 0 111 0 112 0 118 0 124 0 126 0 137 0 155 2 100] 
#[1 21 53 0 15 21 57 0 153] 
#[1 21 61 0 157 21 65 1 157] 
#[1 5 45 0 100 5 57 0 125 8 73 0 157 1 125 0 191 21 69 0 193 1 125 0 194 21 73 0 207 21 77 0 208 21 81 1 160] 
#[1 21 85 0 145 8 98 0 148 21 89 1 161 21 93 1 162 21 97 1 163] 
#[0 8 102 0 145 0 148] 
#[1 8 73 0 157 1 125 0 191 21 77 0 193 1 125 0 194 21 77 0 208 21 101 1 160] 
#[1 21 85 0 145 8 98 0 148 21 105 1 161 21 93 1 162 21 97 1 163] 
#[0 8 106 0 145 0 148] 
#[1 21 109 0 15 21 113 0 153] 
#[1 21 125 0 85 21 125 0 104 8 110 0 157 21 125 2 17 21 125 2 18] 
#[1 8 73 0 157 1 125 0 191 21 77 0 193 1 125 0 194 21 77 0 208 21 133 1 160] 
#[1 21 85 0 145 8 98 0 148 21 137 1 161 21 93 1 162 21 97 1 163] 
#[0 8 114 0 145 0 148] 
#[0 21 141 0 155] 
#[1 21 145 0 15 8 118 0 155] 
#[0 8 122 0 15 0 155] 
#[0 21 149 0 157] 
#[0 8 126 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 6 38 0 9 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 100 0 10 0 104 0 10 0 107 0 10 0 114 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 128 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 0 10 0 157 21 153 1 194 18 17 1 195 18 21 1 196 18 25 1 197 18 29 1 202 18 33 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 8 130 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 8 134 0 9 0 15] 
#[1 1 131 0 2 1 131 0 3 1 135 0 4 1 131 0 5 1 131 0 6 1 139 0 7 1 131 0 9 1 131 0 10 1 143 0 11 1 131 0 12 1 147 0 14 1 131 0 15 1 131 0 16 1 151 0 18 1 131 0 21 1 155 0 22 1 131 0 26 1 131 0 27 1 159 0 28 1 131 0 29 1 163 0 30 1 131 0 31 1 131 0 33 1 167 0 34 1 131 0 35 1 131 0 36 1 131 0 39 1 171 0 40 1 131 0 44 1 131 0 90 1 131 0 149 1 175 0 150 1 131 0 151 1 131 0 153 1 131 0 154 6 121 1 84] 
#[0 21 157 0 9] 
#[0 8 138 0 9] 
#[1 8 142 0 9 13 189 0 15] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 3 9 0 49 0 153 0 50 3 13 0 52 3 17 0 55 0 165 0 56 0 173 0 59 3 25 0 60 0 181 0 61 0 185 0 62 0 189 0 64 3 29 0 65 2 217 0 72 0 201 0 75 3 33 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 3 41 0 86 0 229 0 93 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 0 249 0 116 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 3 65 0 134 3 69 0 135 1 45 0 136 1 49 0 137 3 77 0 138 1 57 0 139 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 21 161 1 91 21 161 1 92 21 161 1 95 21 161 1 107 2 125 1 108 21 161 1 109 21 161 1 110 21 161 1 111 21 161 1 118 21 161 1 119 21 161 1 120 21 161 1 121 21 161 1 129 21 161 1 130 21 161 1 131 21 161 1 132 21 161 1 133 21 161 1 134 21 161 1 135 21 161 1 136 21 161 1 144 21 161 1 145 21 161 1 146 21 161 1 147 21 161 1 149 1 197 2 70 2 217 2 71 21 161 2 79 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 21 161 2 87] 
#[0 8 146 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 0 134 0 8 0 134 0 15 0 134 0 20 6 1 0 26 0 134 0 35 0 134 0 37 0 134 0 155 21 165 0 217 21 165 0 238] 
#[1 6 246 0 8 8 150 0 15 6 246 0 20 6 246 0 35 6 246 0 37 8 150 0 155] 
#[0 8 154 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 8 158 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 44 0 45 0 49 0 51 0 52 0 55 0 57 0 58 0 60 0 62 0 63 0 65 0 67 0 68 0 69 0 71 0 75 0 76 0 79 0 82 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 94 0 99 0 100 0 101 0 103 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 119 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 145 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 100] 
#[0 21 169 0 23] 
#[0 8 162 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 8 166 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[0 8 170 0 53 0 61 0 155] 
#[1 5 89 0 8 20 149 0 23] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 0 149 0 49 0 153 0 50 0 157 0 52 8 174 0 53 0 161 0 55 0 165 0 56 0 169 0 58 0 173 0 59 0 177 0 60 1 179 0 61 0 185 0 62 0 189 0 64 0 193 0 65 2 217 0 72 0 201 0 75 0 205 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 0 225 0 86 0 229 0 93 0 233 0 94 0 237 0 97 0 241 0 99 0 245 0 100 0 249 0 116 0 253 0 117 1 1 0 121 1 5 0 122 1 9 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 1 37 0 134 1 41 0 135 1 45 0 136 1 49 0 137 1 53 0 138 1 57 0 139 1 61 0 140 1 65 0 142 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 8 174 0 155 1 85 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 1 117 0 191 1 121 0 193 1 125 0 194 1 129 0 196 1 129 0 197 1 129 0 198 1 129 0 199 1 145 0 200 1 145 0 201 1 145 0 202 1 129 0 203 1 161 0 204 1 129 0 205 1 129 0 206 1 129 0 207 1 129 0 208 1 129 0 209 1 185 0 210 1 129 0 216 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 10 77 1 90 10 77 1 91 10 77 1 92 10 77 1 95 10 77 1 96 10 77 1 97 2 109 1 98 2 113 1 99 2 117 1 104 10 77 1 107 2 125 1 108 10 77 1 109 10 77 1 110 10 77 1 111 10 77 1 118 10 77 1 119 10 77 1 120 10 77 1 121 10 77 1 129 10 77 1 130 10 77 1 131 10 77 1 132 10 77 1 133 10 77 1 134 10 77 1 135 10 77 1 136 10 77 1 144 10 77 1 145 10 77 1 146 10 77 1 147 10 77 1 149 1 129 1 157 1 197 2 70 2 217 2 71 10 77 2 79 1 129 2 80 2 229 2 81 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 10 77 2 87 3 1 2 99] 
#[0 8 178 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 8 182 0 144 0 148] 
#[0 21 173 0 9] 
#[0 21 177 0 38] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 21 181 1 47 21 181 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 21 181 1 63 3 197 1 64 21 181 1 83 21 181 1 86 21 181 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 8 186 0 15 0 25] 
#[0 8 190 0 15 0 25] 
#[1 6 38 0 9 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 100 0 10 0 104 0 10 0 107 0 10 0 114 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 128 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 0 10 0 157 21 185 1 194 18 17 1 195 18 21 1 196 18 25 1 197 18 29 1 202 18 33 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 21 189 0 30 8 194 0 37 8 194 0 41 8 194 0 49 8 194 0 52 8 194 0 55 8 194 0 57 8 194 0 58 8 194 0 60 8 194 0 62 8 194 0 65 8 194 0 67 8 194 0 69 8 194 0 71 8 194 0 75 8 194 0 76 8 194 0 86 8 194 0 87 8 194 0 88 8 194 0 94 8 194 0 99 8 194 0 100 8 194 0 105 8 194 0 108 8 194 0 109 8 194 0 111 8 194 0 112 8 194 0 113 8 194 0 117 8 194 0 118 8 194 0 121 8 194 0 124 8 194 0 125 8 194 0 126 8 194 0 134 8 194 0 135 8 194 0 137 8 194 0 138 8 194 0 141 8 194 0 142 8 194 0 143 8 194 0 152 8 194 0 155 8 194 0 157 21 193 1 208 21 197 1 209 8 194 2 100] 
#[0 21 201 0 155] 
#[1 0 49 0 37 0 10 0 115 21 205 1 224 21 209 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 0 49 0 37 0 10 0 42 21 213 1 223 21 217 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 21 221 0 42 21 225 0 115] 
#[0 8 198 0 32 0 148] 
#[1 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 100 0 10 0 104 0 10 0 107 0 10 0 114 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 128 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 0 10 0 157 21 229 1 195 18 21 1 196 18 25 1 197 18 29 1 202 18 33 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 20 249 0 120] 
#[0 20 245 0 80] 
#[0 8 202 0 80 0 120] 
#[0 8 202 0 80 0 120] 
#[1 21 233 0 25 1 77 0 148 21 237 1 92 21 241 1 217] 
#[1 21 233 0 25 1 77 0 148 21 237 1 92 21 245 1 217] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 21 249 0 157] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 21 253 0 157] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 22 1 0 157] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 22 5 0 157] 
#[1 22 9 0 48 22 13 0 128] 
#[0 8 206 0 25 0 148] 
#[0 8 210 0 25 0 148] 
#[0 8 214 0 9 0 15 0 38] 
#[0 8 218 0 9 0 38] 
#[1 0 210 0 10 0 210 0 35 0 210 0 37 22 17 0 157] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 22 21 0 157] 
#[1 7 109 0 25 7 113 0 32 1 77 0 148 7 117 1 92 22 25 1 193] 
#[1 7 109 0 25 7 113 0 32 1 77 0 148 7 117 1 92 22 29 1 193] 
#[0 8 222 0 15 0 38] 
#[1 0 49 0 37 0 10 0 157 22 33 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 8 226 0 8 0 23 0 145 0 148] 
#[0 0 138 0 15 0 23 0 153] 
#[0 8 230 0 15 0 153] 
#[0 1 183 0 15 0 25 0 32 0 145 0 148] 
#[1 22 37 0 15 8 234 0 145 8 234 0 148] 
#[0 8 238 0 15 0 145 0 148] 
#[1 22 41 0 15 8 242 0 145 8 242 0 148] 
#[1 21 61 0 157 22 45 1 157] 
#[1 22 49 0 148 22 53 1 169] 
#[1 8 246 0 25 8 246 0 32 21 85 0 145 8 246 0 148 22 57 1 163] 
#[0 8 250 0 25 0 32 0 145 0 148] 
#[1 22 41 0 15 8 254 0 145 8 254 0 148] 
#[1 22 61 0 148 22 65 2 2] 
#[1 0 49 0 37 0 10 0 85 0 10 0 104 0 10 0 157 22 69 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 9 2 0 8 0 23 0 145 0 148] 
#[0 9 6 0 157] 
#[0 9 6 0 157] 
#[1 21 61 0 157 22 73 1 157] 
#[0 9 10 0 157] 
#[1 22 41 0 15 9 14 0 145 9 14 0 148] 
#[1 22 77 0 148 22 81 2 21] 
#[0 9 18 0 25 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 0 49 0 37 22 85 0 155 0 10 0 157 22 89 2 41 20 85 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 9 22 0 15 22 93 0 30 9 22 0 155] 
#[0 22 97 0 9] 
#[1 0 105 0 1 0 109 0 5 0 113 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 137 0 25 0 141 0 47 0 145 0 48 3 9 0 49 0 153 0 50 3 13 0 52 3 17 0 55 0 165 0 56 0 173 0 59 3 25 0 60 0 181 0 61 0 185 0 62 0 189 0 64 3 29 0 65 2 217 0 72 0 201 0 75 3 33 0 76 0 209 0 77 0 213 0 78 0 217 0 81 0 221 0 83 3 41 0 86 0 229 0 93 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 0 249 0 116 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 13 0 127 1 17 0 128 1 21 0 129 2 217 0 130 1 29 0 131 1 33 0 133 3 65 0 134 3 69 0 135 1 45 0 136 1 49 0 137 3 77 0 138 1 57 0 139 1 69 0 146 1 73 0 147 1 77 0 148 1 81 0 152 4 201 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 1 193 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 245 0 244 1 197 0 245 1 197 0 247 1 197 0 248 2 5 0 249 2 9 0 250 2 13 0 251 1 193 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 2 49 1 26 2 49 1 27 2 125 1 31 2 61 1 32 2 65 1 33 2 49 1 34 2 73 1 35 1 197 1 49 2 125 1 83 22 101 1 91 22 101 1 92 22 101 1 95 22 101 1 107 2 125 1 108 22 101 1 109 22 101 1 110 22 101 1 111 22 101 1 118 22 101 1 119 22 101 1 120 22 101 1 121 22 101 1 129 22 101 1 130 22 101 1 131 22 101 1 132 22 101 1 133 22 101 1 134 22 101 1 135 22 101 1 136 22 101 1 144 22 101 1 145 22 101 1 146 22 101 1 147 22 101 1 149 1 197 2 70 2 217 2 71 22 101 2 79 2 49 2 82 1 197 2 83 1 197 2 84 2 49 2 85 1 197 2 86 22 101 2 87] 
#[0 9 26 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 7 234 0 8 9 30 0 15 7 234 0 20 7 234 0 35 7 234 0 37 9 30 0 155] 
#[0 9 34 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 9 38 0 148] 
#[0 9 42 0 9 0 15 0 25] 
#[0 22 105 0 68] 
#[0 22 109 0 9] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 9 229 0 148 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 22 113 1 47 22 113 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 22 113 1 63 3 197 1 64 22 113 1 83 22 113 1 86 22 113 1 87 22 113 1 185 22 113 2 7 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 9 46 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 9 50 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 9 54 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 9 58 0 155] 
#[0 21 225 0 115] 
#[0 9 62 0 155] 
#[0 21 221 0 42] 
#[1 1 77 0 148 22 117 1 92] 
#[1 1 77 0 148 22 121 1 92] 
#[0 22 125 0 38] 
#[0 9 66 0 37 0 80 0 88 0 109 0 111 0 120 0 155] 
#[0 9 70 0 37 0 80 0 88 0 109 0 111 0 120 0 155] 
#[0 9 74 0 37 0 88 0 109 0 111 0 120 0 155] 
#[0 9 78 0 37 0 80 0 88 0 109 0 111 0 155] 
#[0 22 129 0 9] 
#[0 22 133 0 9] 
#[0 22 137 0 9] 
#[0 22 141 0 15] 
#[0 22 145 0 8] 
#[0 22 149 0 8] 
#[0 9 82 0 9 0 38] 
#[1 9 86 0 9 9 86 0 15 22 153 0 30 9 86 0 38 22 157 1 198 22 161 1 199] 
#[0 9 90 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 9 90 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 21 61 0 157 22 165 1 157] 
#[1 8 73 0 157 1 125 0 191 21 77 0 193 1 125 0 194 21 77 0 208 22 169 1 160] 
#[1 8 73 0 157 1 125 0 191 22 173 0 193 1 125 0 194 22 173 0 208] 
#[0 22 177 0 23] 
#[1 0 49 0 37 0 10 0 41 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 57 0 10 0 58 0 10 0 60 0 10 0 62 0 10 0 65 0 10 0 67 0 10 0 69 0 10 0 71 0 10 0 76 0 10 0 86 0 10 0 87 0 10 0 88 0 10 0 94 0 10 0 99 0 10 0 100 0 10 0 105 0 10 0 108 0 10 0 109 0 10 0 111 0 10 0 112 0 10 0 113 0 10 0 117 0 10 0 118 0 10 0 121 0 10 0 124 0 10 0 125 0 10 0 126 0 10 0 134 0 10 0 135 0 10 0 137 0 10 0 138 0 10 0 141 0 10 0 142 0 10 0 143 0 10 0 152 9 94 0 155 0 10 0 157 22 189 0 190 22 189 1 150 22 181 1 170 22 185 1 171 22 189 1 172 22 189 1 173 22 189 1 179 22 189 1 186 3 237 1 187 22 189 1 203 22 189 1 218 22 189 1 225 22 189 1 231 22 189 1 241 22 189 1 249 22 189 1 252 22 189 2 10 22 189 2 32 22 189 2 42 4 9 2 52 0 93 2 53 0 97 2 54 0 101 2 55 22 189 2 77] 
#[1 22 193 0 25 3 94 0 37 3 94 0 41 3 94 0 49 3 94 0 52 3 94 0 55 3 94 0 57 3 94 0 58 3 94 0 60 3 94 0 62 3 94 0 65 3 94 0 67 3 94 0 69 3 94 0 71 3 94 0 75 3 94 0 76 3 94 0 86 3 94 0 87 3 94 0 88 3 94 0 94 3 94 0 98 3 94 0 99 3 94 0 100 3 94 0 105 3 94 0 108 3 94 0 109 3 94 0 111 3 94 0 112 3 94 0 113 3 94 0 117 3 94 0 118 3 94 0 121 3 94 0 124 3 94 0 125 3 94 0 126 3 94 0 134 3 94 0 135 3 94 0 137 3 94 0 138 3 94 0 141 3 94 0 142 3 94 0 143 3 94 0 152 3 94 0 155 3 94 0 157 22 193 2 72 3 94 2 100] 
#[0 9 98 0 25 0 32 0 145 0 148] 
#[1 0 49 0 37 0 10 0 41 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 57 0 10 0 58 0 10 0 60 0 10 0 62 0 10 0 65 0 10 0 67 0 10 0 69 0 10 0 71 0 10 0 75 0 10 0 76 0 10 0 86 0 10 0 87 0 10 0 88 0 10 0 94 0 10 0 99 0 10 0 100 0 10 0 105 0 10 0 108 0 10 0 109 0 10 0 111 0 10 0 112 0 10 0 113 0 10 0 117 0 10 0 118 0 10 0 121 0 10 0 124 0 10 0 125 0 10 0 126 0 10 0 134 0 10 0 135 0 10 0 137 0 10 0 138 0 10 0 141 0 10 0 142 0 10 0 143 9 102 0 155 0 10 0 157 22 245 0 190 22 245 1 150 22 245 1 173 22 245 1 179 22 245 1 186 3 237 1 187 22 245 1 203 22 245 1 218 22 245 1 225 22 245 1 231 22 245 1 241 22 245 1 249 22 245 1 252 22 237 2 3 22 241 2 4 22 245 2 5 22 245 2 10 22 245 2 32 22 245 2 42 22 249 2 52 0 93 2 53 0 97 2 54 0 101 2 55 22 245 2 91] 
#[1 23 1 0 25 3 94 0 37 3 94 0 41 3 94 0 49 3 94 0 52 3 94 0 55 3 94 0 57 3 94 0 58 3 94 0 60 3 94 0 62 3 94 0 65 3 94 0 67 3 94 0 69 3 94 0 71 3 94 0 75 3 94 0 76 3 94 0 86 3 94 0 87 3 94 0 88 3 94 0 94 3 94 0 98 3 94 0 99 3 94 0 100 3 94 0 105 3 94 0 108 3 94 0 109 3 94 0 111 3 94 0 112 3 94 0 113 3 94 0 117 3 94 0 118 3 94 0 121 3 94 0 124 3 94 0 125 3 94 0 126 3 94 0 134 3 94 0 135 3 94 0 137 3 94 0 138 3 94 0 141 3 94 0 142 3 94 0 143 3 94 0 152 3 94 0 155 3 94 0 157 23 1 2 72 3 94 2 100] 
#[1 23 5 0 85 23 5 0 104 8 110 0 157 23 5 2 17 23 5 2 18] 
#[0 9 106 0 15 0 153] 
#[1 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 69 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 99 0 10 0 100 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 9 110 0 155 0 10 0 157 23 9 2 22 23 13 2 23 23 17 2 24 23 17 2 25 23 17 2 26 23 17 2 30 23 17 2 31 23 37 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 23 41 0 25 3 94 0 37 3 94 0 41 3 94 0 49 3 94 0 52 3 94 0 55 3 94 0 57 3 94 0 58 3 94 0 60 3 94 0 62 3 94 0 65 3 94 0 67 3 94 0 69 3 94 0 71 3 94 0 75 3 94 0 76 3 94 0 86 3 94 0 87 3 94 0 88 3 94 0 94 3 94 0 98 3 94 0 99 3 94 0 100 3 94 0 105 3 94 0 108 3 94 0 109 3 94 0 111 3 94 0 112 3 94 0 113 3 94 0 117 3 94 0 118 3 94 0 121 3 94 0 124 3 94 0 125 3 94 0 126 3 94 0 134 3 94 0 135 3 94 0 137 3 94 0 138 3 94 0 141 3 94 0 142 3 94 0 143 3 94 0 152 3 94 0 155 3 94 0 157 23 41 2 72 3 94 2 100] 
#[0 9 114 0 25 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 9 118 0 15 0 155] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 23 45 1 47 23 45 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 23 45 1 63 3 197 1 64 23 45 1 83 23 45 1 86 23 45 1 87 23 45 1 88 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 8 98 0 25 21 85 0 145 23 49 1 161 21 93 1 162 21 97 1 163] 
#[0 9 122 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 25 0 47 0 48 0 49 0 50 0 52 0 53 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 64 0 65 0 66 0 72 0 75 0 76 0 77 0 78 0 81 0 83 0 86 0 93 0 94 0 97 0 99 0 100 0 116 0 117 0 121 0 122 0 125 0 127 0 128 0 129 0 130 0 131 0 133 0 134 0 135 0 136 0 137 0 138 0 139 0 140 0 142 0 146 0 147 0 148 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 100] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 23 53 1 47 23 53 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 23 53 1 63 3 197 1 64 23 53 1 83 23 53 1 86 23 53 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[1 8 98 0 25 8 98 0 32 21 85 0 145 8 98 0 148 23 57 1 161 21 93 1 162 21 97 1 163] 
#[0 9 126 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 9 130 0 37 0 115 0 155] 
#[0 9 134 0 37 0 42 0 155] 
#[0 9 138 0 32 0 148] 
#[0 9 142 0 25 0 32 0 148] 
#[0 9 146 0 25 0 32 0 148] 
#[0 9 150 0 25 0 32 0 148] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 23 61 0 196 23 61 0 197 23 61 0 198 23 61 0 199 1 145 0 200 1 145 0 201 1 145 0 202 23 61 0 203 1 161 0 204 23 61 0 205 23 61 0 206 23 61 0 207 23 61 0 208 23 61 0 209 1 185 0 210 23 61 0 216 23 61 1 157 23 61 2 80 2 229 2 81 3 1 2 99] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 82 0 9 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 23 65 0 221 10 117 0 222 10 121 0 223 10 125 0 224 10 129 0 225] 
#[1 2 78 0 1 2 78 0 5 2 78 0 8 2 82 0 9 2 78 0 10 2 78 0 12 2 78 0 13 2 78 0 16 2 78 0 17 2 78 0 47 2 78 0 48 2 78 0 49 2 78 0 52 2 78 0 55 2 78 0 56 2 78 0 60 2 78 0 61 2 78 0 62 2 78 0 65 2 78 0 72 2 78 0 76 2 78 0 79 2 78 0 86 2 78 0 94 2 78 0 97 2 78 0 99 2 78 0 100 2 78 0 104 2 78 0 114 2 78 0 117 2 78 0 121 2 78 0 122 2 78 0 125 2 78 0 128 2 78 0 130 2 78 0 133 2 78 0 134 2 78 0 135 2 78 0 136 2 78 0 138 2 78 0 152 0 183 0 157 2 78 0 158 2 78 0 159 2 78 0 160 2 78 0 161 2 78 0 162 2 78 0 165 2 78 0 166 2 78 0 169 2 78 0 170 23 69 0 221 10 117 0 222 10 121 0 223 10 125 0 224 10 129 0 225] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 23 73 1 47 23 73 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 23 73 1 63 3 197 1 64 23 73 1 83 23 73 1 86 23 73 1 87 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 9 154 0 9 0 15 0 38] 
#[0 9 158 0 9 0 15 0 38] 
#[0 9 162 0 15 0 153] 
#[1 22 41 0 15 9 166 0 145 9 166 0 148] 
#[0 9 170 0 15 0 145 0 148] 
#[1 23 77 0 57 23 81 0 99 5 45 0 100 5 57 0 125 23 85 0 126 5 73 0 157 1 125 0 191 21 69 0 193 1 125 0 194 23 89 0 207 23 93 0 208 23 97 1 157 23 101 1 164 23 105 1 165 23 109 1 166 23 113 1 167 23 117 1 168] 
#[0 23 121 0 155] 
#[1 0 49 0 37 0 10 0 41 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 57 0 10 0 58 0 10 0 60 0 10 0 62 0 10 0 65 0 10 0 67 0 10 0 69 0 10 0 71 0 10 0 76 0 10 0 86 0 10 0 87 0 10 0 88 0 10 0 94 0 10 0 99 0 10 0 100 0 10 0 105 0 10 0 108 0 10 0 109 0 10 0 111 0 10 0 112 0 10 0 113 0 10 0 117 0 10 0 118 0 10 0 121 0 10 0 124 0 10 0 125 0 10 0 126 0 10 0 134 0 10 0 135 0 10 0 137 0 10 0 138 0 10 0 141 0 10 0 142 0 10 0 143 0 10 0 152 9 174 0 155 0 10 0 157 23 125 0 190 23 125 1 150 23 125 1 172 23 125 1 173 23 125 1 179 23 125 1 186 3 237 1 187 23 125 1 203 23 125 1 218 23 125 1 225 23 125 1 231 23 125 1 241 23 125 1 249 23 125 1 252 23 125 2 10 23 125 2 32 23 125 2 42 4 9 2 52 0 93 2 53 0 97 2 54 0 101 2 55 23 125 2 77] 
#[0 9 178 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157] 
#[0 9 182 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 23 129 0 155] 
#[1 0 49 0 37 0 10 0 41 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 57 0 10 0 58 0 10 0 60 0 10 0 62 0 10 0 65 0 10 0 67 0 10 0 69 0 10 0 71 0 10 0 75 0 10 0 76 0 10 0 86 0 10 0 87 0 10 0 88 0 10 0 94 0 10 0 99 0 10 0 100 0 10 0 105 0 10 0 108 0 10 0 109 0 10 0 111 0 10 0 112 0 10 0 113 0 10 0 117 0 10 0 118 0 10 0 121 0 10 0 124 0 10 0 125 0 10 0 126 0 10 0 134 0 10 0 135 0 10 0 137 0 10 0 138 0 10 0 141 0 10 0 142 0 10 0 143 9 190 0 155 0 10 0 157 23 133 0 190 23 133 1 150 23 133 1 173 23 133 1 179 23 133 1 186 3 237 1 187 23 133 1 203 23 133 1 218 23 133 1 225 23 133 1 231 23 133 1 241 23 133 1 249 23 133 1 252 23 133 2 5 23 133 2 10 23 133 2 32 23 133 2 42 22 249 2 52 0 93 2 53 0 97 2 54 0 101 2 55 23 133 2 91] 
#[0 9 194 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[1 7 125 0 41 0 115 0 49 0 115 0 52 0 115 0 55 0 46 0 57 1 114 0 58 0 115 0 60 0 50 0 62 0 115 0 65 0 54 0 67 1 118 0 69 0 119 0 71 9 198 0 75 0 115 0 76 0 115 0 86 0 58 0 87 23 137 0 88 0 115 0 94 23 141 0 99 0 115 0 100 7 141 0 105 0 123 0 108 23 145 0 109 23 149 0 111 23 153 0 112 7 201 0 113 0 115 0 117 7 161 0 118 0 115 0 121 0 127 0 124 0 115 0 125 0 62 0 126 0 115 0 134 0 115 0 135 1 187 0 137 0 115 0 138 7 173 0 141 0 115 0 142 7 201 0 143 0 139 0 157 4 137 1 151 4 141 1 152 4 145 1 153 7 181 1 174 7 185 1 175 7 189 1 176 7 193 1 180 7 197 1 181 7 201 1 182 7 205 1 188 7 209 1 189 7 213 1 190 7 217 1 204 7 221 1 205 7 225 1 206 7 229 1 219 7 233 1 220 7 237 1 221 7 241 1 226 7 245 1 227 7 249 1 228 7 253 1 232 8 1 1 233 8 5 1 242 8 9 1 243 8 13 1 244 8 17 1 250 4 149 1 253 4 153 1 254 4 157 1 255 4 161 2 11 4 165 2 12 4 169 2 13 4 173 2 36 4 177 2 37 4 181 2 38 4 185 2 43 4 189 2 44 4 193 2 45 23 161 2 75 23 165 2 78 23 169 2 92 23 173 2 93 23 177 2 94] 
#[0 9 186 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 9 202 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[1 21 61 0 157 23 181 1 157] 
#[0 23 185 0 155] 
#[1 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 69 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 99 0 10 0 100 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 9 206 0 155 0 10 0 157 23 189 2 24 23 189 2 25 23 189 2 26 23 189 2 30 23 189 2 31 23 37 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 9 210 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157] 
#[0 9 214 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157] 
#[0 9 214 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157] 
#[0 9 214 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157] 
#[0 9 214 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157] 
#[1 9 218 0 49 9 218 0 52 9 218 0 55 9 218 0 60 9 218 0 65 9 218 0 69 9 218 0 76 9 218 0 86 9 218 0 94 23 197 0 99 9 218 0 100 9 218 0 117 9 218 0 121 9 218 0 125 9 218 0 134 9 218 0 135 9 218 0 138 9 218 0 142 9 218 0 157 23 197 2 73] 
#[0 9 222 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 9 226 0 15 0 155] 
#[0 23 201 0 25] 
#[1 9 230 0 79 9 230 0 82 23 205 0 89 9 230 0 91 9 230 0 92 9 230 0 103 9 230 0 119 9 230 0 145] 
#[0 9 234 0 25 0 32 0 148] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 23 209 0 157] 
#[0 23 213 0 9] 
#[0 23 217 0 9] 
#[0 9 238 0 9 0 15 0 38] 
#[0 9 242 0 15 0 25 0 32 0 145 0 148] 
#[0 23 221 0 8] 
#[0 9 246 0 15 0 25 0 32 0 145 0 148] 
#[0 9 250 0 15 0 25 0 32 0 145 0 148] 
#[0 9 254 0 15 0 25 0 32 0 145 0 148] 
#[0 10 2 0 15 0 25 0 32 0 145 0 148] 
#[0 10 6 0 25 0 32 0 145 0 148] 
#[1 23 225 0 15 10 10 0 25 10 10 0 32 10 10 0 145 10 10 0 148] 
#[1 23 229 0 15 10 14 0 25 10 14 0 32 10 14 0 145 10 14 0 148] 
#[0 10 2 0 15 0 25 0 32 0 145 0 148] 
#[0 10 10 0 25 0 32 0 145 0 148] 
#[0 10 18 0 25 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 10 22 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157] 
#[0 10 26 0 25 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 10 30 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[1 0 195 0 41 0 239 0 49 0 239 0 52 0 239 0 55 1 166 0 57 2 242 0 58 0 239 0 60 1 170 0 62 0 239 0 65 1 174 0 67 2 222 0 69 0 223 0 71 10 34 0 75 0 239 0 76 0 239 0 86 1 178 0 87 1 191 0 88 0 239 0 94 1 195 0 99 0 239 0 100 0 203 0 105 0 251 0 108 1 191 0 109 1 191 0 111 1 191 0 112 2 238 0 113 0 239 0 117 0 195 0 118 0 239 0 121 0 255 0 124 0 239 0 125 1 182 0 126 0 239 0 134 0 239 0 135 1 199 0 137 0 239 0 138 0 203 0 141 0 239 0 142 2 238 0 143 1 7 0 157] 
#[1 0 195 0 41 0 239 0 49 0 239 0 52 0 239 0 55 1 166 0 57 2 242 0 58 0 239 0 60 1 170 0 62 0 239 0 65 1 174 0 67 2 222 0 69 0 203 0 71 10 34 0 75 0 239 0 76 0 239 0 86 1 178 0 87 1 195 0 88 0 239 0 94 1 195 0 99 0 239 0 100 0 203 0 105 0 251 0 108 1 195 0 109 1 195 0 111 1 195 0 112 2 238 0 113 0 239 0 117 0 195 0 118 0 239 0 121 0 255 0 124 0 239 0 125 1 182 0 126 0 239 0 134 0 239 0 135 1 203 0 137 0 239 0 138 0 203 0 141 0 239 0 142 2 238 0 143 0 239 0 157] 
#[1 0 195 0 41 0 239 0 49 0 239 0 52 0 239 0 55 1 166 0 57 2 242 0 58 0 239 0 60 1 170 0 62 0 239 0 65 1 174 0 67 2 222 0 69 0 223 0 71 10 34 0 75 0 239 0 76 0 239 0 86 1 178 0 87 1 191 0 88 0 239 0 94 1 195 0 99 0 239 0 100 0 203 0 105 0 251 0 108 1 191 0 109 1 191 0 111 1 191 0 112 2 238 0 113 0 239 0 117 0 195 0 118 0 239 0 121 0 255 0 124 0 239 0 125 1 182 0 126 0 239 0 134 0 239 0 135 1 199 0 137 0 239 0 138 0 203 0 141 0 239 0 142 2 238 0 143 1 7 0 157] 
#[1 0 195 0 41 0 239 0 49 0 239 0 52 0 239 0 55 1 166 0 57 2 242 0 58 0 239 0 60 1 170 0 62 0 239 0 65 1 174 0 67 2 222 0 69 0 223 0 71 10 34 0 75 0 239 0 76 0 239 0 86 1 178 0 87 1 191 0 88 0 239 0 94 1 195 0 99 0 239 0 100 0 203 0 105 0 251 0 108 1 191 0 109 1 191 0 111 1 191 0 112 2 238 0 113 0 239 0 117 0 195 0 118 0 239 0 121 0 255 0 124 0 239 0 125 1 182 0 126 0 239 0 134 0 239 0 135 1 199 0 137 0 239 0 138 0 203 0 141 0 239 0 142 2 238 0 143 1 7 0 157] 
#[1 0 195 0 41 1 19 0 49 1 19 0 52 1 19 0 55 1 166 0 57 2 242 0 58 1 19 0 60 1 170 0 62 1 19 0 65 1 174 0 67 2 222 0 69 2 226 0 70 0 219 0 71 10 34 0 75 1 19 0 76 2 226 0 84 1 19 0 86 1 178 0 87 1 191 0 88 1 19 0 94 1 195 0 99 1 19 0 100 0 203 0 105 0 251 0 108 1 191 0 109 1 191 0 111 1 207 0 112 2 238 0 113 1 19 0 117 0 195 0 118 1 19 0 121 1 27 0 124 1 19 0 125 1 182 0 126 1 19 0 134 1 19 0 135 1 211 0 137 1 19 0 138 0 203 0 141 1 19 0 142 2 238 0 143 1 35 0 157] 
#[1 0 195 0 41 1 19 0 49 1 19 0 52 1 19 0 55 1 166 0 57 1 19 0 60 1 170 0 62 1 19 0 65 2 222 0 69 2 226 0 70 1 55 0 71 10 34 0 75 1 19 0 76 2 226 0 84 1 19 0 86 1 178 0 87 1 199 0 88 1 19 0 94 1 203 0 99 1 19 0 100 0 203 0 105 0 251 0 108 1 199 0 109 1 199 0 111 1 211 0 112 2 238 0 113 1 19 0 117 0 195 0 118 1 19 0 121 1 59 0 124 1 19 0 125 1 182 0 126 1 19 0 134 1 19 0 135 1 211 0 137 1 19 0 138 0 203 0 141 1 19 0 142 2 238 0 143 1 35 0 157] 
#[1 1 63 0 124 23 233 0 137 23 233 2 78] 
#[1 23 237 0 71 1 67 0 124 23 237 2 75] 
#[0 23 241 0 75] 
#[1 10 38 0 75 24 13 0 88 24 13 0 99 24 13 0 109 24 13 0 111 24 13 0 112 24 13 0 137 24 13 2 94] 
#[0 10 42 0 75 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 10 46 0 15 0 153] 
#[0 10 50 0 25 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 10 54 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157] 
#[0 10 58 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 157] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 24 17 0 69 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 24 21 0 196 24 21 0 197 24 21 0 198 24 21 0 199 1 145 0 200 1 145 0 201 1 145 0 202 24 21 0 203 1 161 0 204 24 21 0 205 24 21 0 206 24 21 0 207 24 21 0 208 24 21 0 209 1 185 0 210 24 21 0 216 24 21 1 157 24 25 1 191 24 21 2 80 2 229 2 81 13 137 2 99] 
#[0 10 62 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 98 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 152 0 155 0 157 2 100] 
#[0 24 29 0 157] 
#[0 24 33 0 9] 
#[0 10 66 0 25 0 148] 
#[0 10 70 0 25 0 148] 
#[0 24 37 0 9] 
#[1 23 81 0 99 5 73 0 157 1 125 0 191 23 93 0 193 1 125 0 194 23 93 0 208 23 97 1 157 24 41 1 166 23 113 1 167 24 45 1 168] 
#[1 23 81 0 99 5 73 0 157 1 125 0 191 23 93 0 193 1 125 0 194 23 93 0 208 24 49 1 157 24 53 1 167 24 57 1 168] 
#[0 15 209 0 124] 
#[0 15 221 0 124] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 24 61 0 196 24 61 0 197 24 61 0 198 24 61 0 199 1 145 0 200 1 145 0 201 1 145 0 202 24 61 0 203 1 161 0 204 24 61 0 205 24 61 0 206 24 61 0 207 24 61 0 208 24 61 0 209 1 185 0 210 24 61 0 216 24 61 1 157 24 61 2 80 2 229 2 81 24 65 2 95 3 1 2 99] 
#[0 10 34 0 75 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 10 34 0 75 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 10 34 0 75 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 10 34 0 75 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 10 34 0 75 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 10 34 0 75 0 88 0 99 0 109 0 111 0 112 0 137] 
#[0 10 74 0 75 0 88 0 99 0 109 0 111 0 112 0 137] 
#[1 5 13 0 49 1 145 0 52 1 145 0 55 1 145 0 60 1 145 0 65 1 145 0 76 1 145 0 86 1 145 0 94 5 45 0 100 1 145 0 117 1 145 0 121 5 57 0 125 1 145 0 134 1 145 0 135 1 145 0 138 1 65 0 142 5 73 0 157 1 125 0 191 1 121 0 193 1 125 0 194 24 69 0 196 24 69 0 197 24 69 0 198 24 69 0 199 1 145 0 200 1 145 0 201 1 145 0 202 24 69 0 203 1 161 0 204 24 69 0 205 24 69 0 206 24 69 0 207 24 69 0 208 24 69 0 209 1 185 0 210 24 69 0 216 24 69 1 157 24 69 2 80 2 229 2 81 3 1 2 99] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 24 73 0 128 1 215 0 157] 
#[0 24 81 0 157] 
#[0 10 78 0 79 0 82 0 91 0 92 0 103 0 119 0 145] 
#[0 10 82 0 25 0 32 0 148] 
#[0 10 86 0 25 0 32 0 145 0 148] 
#[1 24 85 0 15 10 90 0 25 10 90 0 32 10 90 0 145 10 90 0 148] 
#[0 10 94 0 25 0 32 0 145 0 148] 
#[0 10 98 0 15 0 25 0 32 0 145 0 148] 
#[0 10 98 0 15 0 25 0 32 0 145 0 148] 
#[0 10 102 0 25 0 32 0 145 0 148] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 10 106 0 157] 
#[1 24 89 0 157 24 93 2 96 24 97 2 97] 
#[1 0 186 0 10 0 190 0 35 0 194 0 37 24 101 0 157] 
#[0 24 105 0 37] 
#[0 24 109 0 148] 
#[1 6 106 0 8 18 85 0 26 24 113 1 154 24 113 1 155] 
#[1 23 81 0 99 5 73 0 157 1 125 0 191 23 93 0 193 1 125 0 194 23 93 0 208 24 49 1 157 24 53 1 167 24 117 1 168] 
#[0 24 121 0 37] 
#[1 24 125 0 25 24 89 0 157 24 129 2 97] 
#[0 10 110 0 25 0 157] 
#[0 24 133 0 25] 
#[1 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 100 0 10 0 104 0 10 0 107 0 10 0 114 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 128 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 0 10 0 157 24 137 1 195 18 21 1 196 18 25 1 197 18 29 1 202 18 33 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 0 49 0 37 0 10 0 80 0 10 0 120 24 141 2 27 24 145 2 28 24 149 2 29 24 153 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 24 157 0 8] 
#[0 10 114 0 25 0 32 0 145 0 148] 
#[1 0 105 0 1 0 109 0 5 3 5 0 8 0 117 0 10 0 121 0 12 0 125 0 13 0 129 0 16 0 133 0 17 0 141 0 47 0 145 0 48 3 9 0 49 3 13 0 52 3 17 0 55 3 21 0 56 3 25 0 60 0 181 0 61 0 185 0 62 3 29 0 65 2 217 0 72 3 33 0 76 3 37 0 79 3 41 0 86 3 45 0 94 0 237 0 97 0 241 0 99 3 49 0 100 3 53 0 117 3 57 0 121 1 5 0 122 3 61 0 125 1 17 0 128 2 217 0 130 1 33 0 133 3 65 0 134 3 69 0 135 3 73 0 136 3 77 0 138 1 81 0 152 3 81 0 157 1 89 0 158 1 93 0 159 1 97 0 160 1 101 0 161 0 14 0 162 1 105 0 165 0 18 0 166 1 109 0 169 1 113 0 170 3 85 0 191 3 89 0 227 1 197 0 228 1 197 0 229 1 205 0 230 1 209 0 231 1 213 0 234 1 217 0 235 1 197 0 237 1 197 0 239 1 197 0 240 1 233 0 241 1 237 0 242 1 241 0 243 1 197 0 244 1 197 0 245 1 197 0 247 1 197 0 248 1 197 0 249 1 197 0 250 1 197 0 251 3 89 1 7 1 197 1 8 1 197 1 9 1 197 1 14 1 197 1 20 1 197 1 21 1 197 1 22 1 197 1 23 3 109 1 26 3 109 1 27 3 109 1 32 3 109 1 33 3 109 1 34 3 109 1 35 3 125 1 36 3 129 1 37 3 133 1 38 3 137 1 39 3 141 1 40 3 145 1 41 3 149 1 42 3 153 1 43 3 157 1 44 3 161 1 45 3 165 1 46 24 161 1 47 24 161 1 48 1 197 1 49 3 177 1 50 3 177 1 52 3 177 1 58 3 189 1 61 24 161 1 63 3 197 1 64 24 161 1 83 24 161 1 86 24 161 1 87 24 161 1 88 1 197 2 70 2 217 2 71 3 109 2 82 1 197 2 83 1 197 2 84 3 109 2 85 1 197 2 86] 
#[0 10 118 0 37 0 41 0 49 0 52 0 55 0 57 0 58 0 60 0 62 0 65 0 67 0 69 0 71 0 75 0 76 0 86 0 87 0 88 0 94 0 99 0 100 0 105 0 108 0 109 0 111 0 112 0 113 0 117 0 118 0 121 0 124 0 125 0 126 0 134 0 135 0 137 0 138 0 141 0 142 0 143 0 155 0 157] 
#[0 10 122 0 25 0 157] 
#[0 10 126 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157] 
#[0 24 165 0 38] 
#[0 24 169 0 155] 
#[1 0 49 0 37 0 10 0 120 10 130 0 155 24 173 2 29 24 177 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 0 49 0 37 0 10 0 80 10 134 0 155 24 181 2 28 24 185 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[1 24 189 0 80 24 193 0 120] 
#[1 6 38 0 9 0 49 0 37 0 10 0 49 0 10 0 52 0 10 0 55 0 10 0 60 0 10 0 65 0 10 0 76 0 10 0 86 0 10 0 94 0 10 0 100 0 10 0 104 0 10 0 107 0 10 0 114 0 10 0 117 0 10 0 121 0 10 0 125 0 10 0 128 0 10 0 134 0 10 0 135 0 10 0 138 0 10 0 142 0 10 0 157 24 197 1 194 18 17 1 195 18 21 1 196 18 25 1 197 18 29 1 202 18 33 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 24 201 0 38] 
#[0 24 205 0 148] 
#[0 10 138 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157] 
#[0 10 142 0 155] 
#[0 24 193 0 120] 
#[0 10 146 0 155] 
#[0 24 189 0 80] 
#[0 24 209 0 25] 
#[0 24 213 0 25] 
#[0 24 217 0 9] 
#[0 10 150 0 25 0 157] 
#[1 0 49 0 37 0 10 0 80 0 10 0 120 24 221 2 27 24 145 2 28 24 149 2 29 24 153 2 52 0 93 2 53 0 97 2 54 0 101 2 55] 
#[0 10 154 0 37 0 120 0 155] 
#[0 10 158 0 37 0 80 0 155] 
#[1 8 98 0 25 21 85 0 145 24 225 1 161 21 93 1 162 21 97 1 163] 
#[0 24 229 0 155] 
#[0 24 233 0 25] 
#[0 10 162 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157] 
#[0 10 166 0 37 0 49 0 52 0 55 0 60 0 65 0 69 0 76 0 86 0 94 0 99 0 100 0 117 0 121 0 125 0 134 0 135 0 138 0 142 0 155 0 157]
	).
]

{ #category : #private }
CSharpParser >> tryAllTokens [
	| id ids |
	id := scanner IdentifierId.
	ids := currentToken ids.
	^ (ids includes: id)
		ifTrue:
			[ ids first = id
				ifTrue: [ ^ false ].
			^ (self class keywords includes: currentToken value) not ]
		ifFalse: [ ^ false ]
]
