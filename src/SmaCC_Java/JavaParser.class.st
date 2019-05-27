Class {
	#name : #JavaParser,
	#superclass : #SmaCCGLRParser,
	#classInstVars : [
		'keywords'
	],
	#category : #'SmaCC_Java'
}

{ #category : #generated }
JavaParser class >> ambiguousTransitions [
^#(
#[ 0 6 0 33] 
#[ 0 14 0 185] 
#[ 0 14 0 193] 
#[ 0 14 0 201] 
#[ 0 14 0 205] 
#[ 0 14 0 217] 
#[ 0 14 0 49] 
#[ 0 14 0 221] 
#[ 0 14 0 233] 
#[ 0 14 0 237] 
#[ 0 14 0 249] 
#[ 0 14 0 18 1 57] 
#[ 0 18 2 69] 
#[ 0 22 0 193] 
#[ 0 22 0 201] 
#[ 0 22 0 205] 
#[ 0 22 0 217] 
#[ 0 22 0 221] 
#[ 0 22 0 233] 
#[ 0 22 0 237] 
#[ 0 22 0 249] 
#[ 0 22 2 213] 
#[ 0 18 3 105] 
#[ 0 18 1 57] 
#[ 0 18 0 198] 
#[ 0 206 4 1] 
#[ 0 242 4 21] 
#[ 1 90 4 41] 
#[ 1 166 4 113] 
#[ 0 14 0 18 2 69] 
#[ 0 18 0 198 1 182] 
#[ 0 198 1 182] 
#[ 0 181 0 198] 
#[ 1 222 4 201] 
#[ 1 222 4 205] 
#[ 1 222 4 209] 
#[ 1 226 4 213] 
#[ 1 226 4 217] 
#[ 1 230 4 221] 
#[ 1 230 4 225] 
#[ 1 230 4 229] 
#[ 1 234 4 233] 
#[ 1 234 4 237] 
#[ 1 234 4 241] 
#[ 1 234 4 245] 
#[ 1 234 4 249] 
#[ 1 238 4 253] 
#[ 1 238 5 1] 
#[ 1 242 5 5] 
#[ 1 246 5 9] 
#[ 1 250 5 13] 
#[ 1 254 5 17] 
#[ 2 2 5 21] 
#[ 2 2 5 25] 
#[ 2 14 2 18] 
#[ 0 18 0 181] 
#[ 0 14 0 18 3 105] 
#[ 0 18 6 41] 
#[ 0 18 7 173] 
#[ 0 14 5 69] 
#[ 3 226 4 201] 
#[ 3 226 4 205] 
#[ 3 226 4 209] 
#[ 3 230 4 201] 
#[ 3 230 4 205] 
#[ 3 230 4 209] 
#[ 3 234 4 213] 
#[ 3 234 4 217] 
#[ 3 238 4 213] 
#[ 3 238 4 217] 
#[ 3 242 4 213] 
#[ 3 242 4 217] 
#[ 3 246 4 221] 
#[ 3 246 4 225] 
#[ 3 246 4 229] 
#[ 3 250 4 221] 
#[ 3 250 4 225] 
#[ 3 250 4 229] 
#[ 3 254 4 221] 
#[ 3 254 4 225] 
#[ 3 254 4 229] 
#[ 4 6 4 221] 
#[ 4 6 4 225] 
#[ 4 6 4 229] 
#[ 4 10 4 233] 
#[ 4 10 4 237] 
#[ 4 10 4 241] 
#[ 4 10 4 245] 
#[ 4 10 4 249] 
#[ 4 14 4 233] 
#[ 4 14 4 237] 
#[ 4 14 4 241] 
#[ 4 14 4 245] 
#[ 4 14 4 249] 
#[ 4 18 4 253] 
#[ 4 18 5 1] 
#[ 4 22 5 5] 
#[ 4 26 5 9] 
#[ 4 30 5 13] 
#[ 4 34 5 17] 
#[ 1 90 9 109] 
#[ 0 198 9 177] 
#[ 2 189 4 138] 
#[ 0 33 4 138] 
#[ 0 37 4 138] 
#[ 0 22 0 193 4 138] 
#[ 0 22 0 201 4 138] 
#[ 0 22 0 205 4 138] 
#[ 0 22 0 217 4 138] 
#[ 0 49 4 138] 
#[ 0 22 0 221 4 138] 
#[ 0 22 0 233 4 138] 
#[ 0 22 0 237 4 138] 
#[ 0 61 4 138] 
#[ 0 65 4 138] 
#[ 0 69 4 138] 
#[ 0 73 4 138] 
#[ 0 22 0 249 4 138] 
#[ 0 77 4 138] 
#[ 0 81 4 138] 
#[ 0 85 4 138] 
#[ 0 89 4 138] 
#[ 0 22 4 138] 
#[ 0 93 4 138] 
#[ 0 22 2 213 4 138] 
#[ 0 18 10 213]
	).
]

{ #category : #'generated-accessing' }
JavaParser class >> cacheId [
	^'2019-05-27T15:17:27.223606-05:00'
]

{ #category : #generated }
JavaParser class >> definitionComment [
"%start goal block_statement expression type_declaration method_declaration class_body_declaration;
%glr;
%right ""else"";

%id <UNSIGNED_RIGHT_SHIFT> <SIGNED_RIGHT_SHIFT> <GREATER_THAN>;

%ignore_variables semicolon comma leftParen rightParen _leftParen _rightParen lt gt leftBracket rightBracket leftBrace rightBrace;

%prefix Java ;
%suffix Node ;
%root Program ;

%hierarchy IfStatement (IfElseStatement);
%hierarchy New (NewClass);
%hierarchy Literal (IntegerLiteral FloatLiteral BooleanLiteral CharacterLiteral StringLiteral Null);
%hierarchy PrimitiveType (BooleanType ByteType ShortType IntType LongType CharType FloatType DoubleType) ;
%hierarchy Type (PrimitiveType ClassType ArrayType) ;
%hierarchy Statement (Block LocalVariableDeclarationStatement EmptyStatement LabeledStatement
					ExpressionStatement IfStatement SwitchStatement WhileStatement DoWhileStatement
					ForStatement ForEachStatement BreakStatement ContinueStatement ReturnStatement ThrowStatement
					SynchronizedStatement TryStatement AssertStatement ThisConstructorInvocation SuperConstructorInvocation);
%hierarchy Expression (UnaryExpression BinaryExpression ConditionalExpression Assignment 
					ClassExpression FieldAccess MethodInvocation ArrayAccess OuterThis
					New Literal Name NewArray LambdaExpression MethodReference);
%hierarchy Name (QualifiedName) ;
%hierarchy SingleTypeImportDeclaration (TypeImportOnDemandDeclaration);
%hierarchy VariableDeclaration (InitializedVariableDeclaration) ;
%hierarchy Parameter (VariableArgumentParameter);
%hierarchy AbstractMethodDeclaration (AnnotationMethodDeclaration);
%hierarchy Declaration ( AbstractMethodDeclaration  ClassDeclaration 
						ConstructorDeclaration EmptyDeclaration
						EnumDeclaration FieldDeclaration InterfaceDeclaration
						LocalVariableDeclaration MethodDeclaration 
						PackageDeclaration SingleTypeImportDeclaration 
						VariableDeclaration );
%hierarchy UnaryExpression (CastExpression PostDecrementExpression PostIncrementExpression
						PreDecrementExpression PreIncrementExpression UnaryAddition
						UnaryBitInvert UnaryNot UnarySubtraction);
%hierarchy TypeName (QualifiedTypeName);
%hierarchy Initializer (StaticInitializer);

<GREATER_THAN>
	: >
	;
<SIGNED_RIGHT_SHIFT>
	: >>
	;
<UNSIGNED_RIGHT_SHIFT>
	: >>>
	;
<DECIMAL_INTEGER>
	: 0 | [1-9] [0-9]*	
	;
<HEX_INTEGER>
	: 0[xX][0-9a-fA-F]+	
	;
<OCTAL_INTEGER>
	: 0[0-7]+	
	;
<EXPONENT>
	: [eE] [\-\+]? [0-9]+ 	
	;
<FLOAT_TYPE>
	: [fFdD]	
	;
<ESCAPE_SEQUENCE>
	: \\ ([btnfr\""\'\\] | ([0-3] [0-7]{0,2} | [4-7][0-7]?) | (u [0-9a-fA-F]{4,4}))	
	;
<INTEGER_LITERAL>
	: (<DECIMAL_INTEGER> | <HEX_INTEGER> | <OCTAL_INTEGER>) [lL]?	
	;
<FLOATING_POINT_LITERAL>
	: [0-9]+ \. [0-9]* <EXPONENT>? <FLOAT_TYPE>? 
	| \. [0-9]+ <EXPONENT>? <FLOAT_TYPE>? 
	| [0-9]+ <EXPONENT> <FLOAT_TYPE>? 
	| [0-9]+ <FLOAT_TYPE>	
	| <HEX_INTEGER> \. [0-9a-fA-F]+ [pP] [\-\+]? [0-9]+ <FLOAT_TYPE>?
	;
<BOOLEAN_LITERAL>
	: true 
	| false	
	;
<CHARACTER_LITERAL>
	: \' ([^\\\'] | <ESCAPE_SEQUENCE> ) \'	
	;
<STRING_LITERAL>
	: \"" ([^\\\""] | <ESCAPE_SEQUENCE> )* \""	
	;
<NULL_LITERAL>
	: null	
	;
<IDENTIFIER>
	: (<isLetter> | [a-zA-Z_$]) (<isLetter>|\w|$)*	
	;

<eol>
	: \r 
	| \n 
	| \r\n
	;
<whitespace>
	: \s+
	;
<comment>
	: \/\/ [^\r\n]* 
	| /\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/
 	;
<patternToken>
	: (\`  [^\`]* \`)+
	;

goal 
	: compilation_unit 
	;
# 19.3) Lexical Structure.
literal 
	: <INTEGER_LITERAL> 'token' {{IntegerLiteral}}
	| <FLOATING_POINT_LITERAL> 'token' {{FloatLiteral}}
	| <BOOLEAN_LITERAL> 'token' {{BooleanLiteral}}
	| <CHARACTER_LITERAL> 'token' {{CharacterLiteral}}
	| <STRING_LITERAL> 'token' {{StringLiteral}}
	| <NULL_LITERAL> 'token' {{Null}}
	;
# 19.4) Types, Values, and Variables
type
	: primitive_type 
	| reference_type 
	;
primitive_type 
	: numeric_type 
	| ""boolean"" 'token' {{BooleanType}}
	;
numeric_type
	: integral_type 
	| floating_point_type 
	;
integral_type 
	: ""byte"" 'token' {{ByteType}}
	| ""short"" 'token' {{ShortType}}
	| ""int"" 'token' {{IntType}}
	| ""long"" 'token' {{LongType}}
	| ""char"" 'token' {{CharType}}
	;
floating_point_type 
	: ""float"" 'token' {{FloatType}}
	| ""double"" 'token' {{DoubleType}}
	;
reference_type 
	: class_or_interface_type 
	| array_type 
	;
class_or_interface_type 
	: type_name 'name' {{ClassType}}
	;
class_type 
	: class_or_interface_type 
	;
interface_type 
	: class_or_interface_type 
	;		
array_type 
	: primitive_type 'baseType' dims {{ArrayType}}
	| type_name 'baseType' dims {{ArrayType}}
	;
# 19.5) Names
name
	: simple_name 
	| qualified_name 
	;
simple_name 
	: <IDENTIFIER> 'name' {{Name}}
	;
qualified_name 
	: name 'nspace' ""."" 'period' <IDENTIFIER> 'name' {{QualifiedName}}
	;
# 19.6) ""package""s
compilation_unit 
	: package_declaration 'packageDeclaration'?
		import_declarations? 
		type_declarations? {{ProgramFile}}
	;
import_declarations 
	: import_declaration 'import' 
	| import_declarations import_declaration 'import'
	;
type_declarations 
	: type_declaration 'typeDeclaration' 
	| type_declarations type_declaration 'typeDeclaration' 
	;
package_declaration 
	: annotations ""package"" 'packageToken' name 'name' "";"" 'semicolon' {{PackageDeclaration}}
	;
import_declaration 
	: single_type_import_declaration 
	| type_import_on_demand_declaration 
	;
single_type_import_declaration 
	: ""import"" 'importToken' ""static"" 'staticToken'? name 'name' "";"" 'semicolon' {{SingleTypeImportDeclaration}}
	;
type_import_on_demand_declaration 
	: ""import"" 'importToken' ""static"" 'staticToken'? name 'name' ""."" 'period' ""*"" 'star' "";"" 'semicolon' {{TypeImportOnDemandDeclaration}}
	;
type_declaration 
	: class_declaration 
	| interface_declaration 
	| annotation_interface_declaration
	| "";"" 'semicolon' {{EmptyDeclaration}}
	;
# 19.7) Productions used only in the LALR(1) grammar

modifiers 
	: modifier 'modifier'
	| modifiers modifier 'modifier'
	;
modifier 
	: ""public"" 'token' {{Modifier}}
	| ""protected"" 'token' {{Modifier}}
	| ""private"" 'token' {{Modifier}}
	| ""static"" 'token' {{Modifier}}
	| ""abstract"" 'token' {{Modifier}}
	| ""final"" 'token' {{Modifier}}
	| ""native"" 'token' {{Modifier}}
	| ""synchronized"" 'token' {{Modifier}}
	| ""transient"" 'token' {{Modifier}}
	| ""volatile"" 'token' {{Modifier}}
	| ""strictfp"" 'token' {{Modifier}} # note that semantic analysis must check that the
	                 # context of the modifier allows strictfp.
	| annotation
	;
# 19.8) Classes
# 19.8.1) Class Declaration:
class_declaration 
	: modifiers? ""class"" 'classToken' <IDENTIFIER> 'name' type_parameters_opt 'typeParameters' super? interfaces? class_body {{ClassDeclaration}}
	| enum_declaration
	;
super 
	: ""extends"" 'extendsToken' class_type 'superclass'
	;
interfaces 
	: ""implements"" 'implementsToken' interface_type_list
	;
interface_type_list 
	: interface_type 'interface' 
	| interface_type_list "","" 'comma' interface_type 'interface' 
	;
class_body 
	: ""{"" 'leftBrace' class_body_declarations? ""}"" 'rightBrace'
	;
class_body_declarations 
	: class_body_declaration 'declaration' 
	| class_body_declarations class_body_declaration 'declaration' 
	;
class_body_declaration 
	: class_member_declaration 
	| static_initializer 
	| constructor_declaration 
	| block 'block' {{Initializer}}
	;
class_member_declaration 
	: field_declaration 
	| method_declaration 
	| type_declaration
	;
# 19.8.2) Field Declarations
field_declaration 
	: modifiers? type 'type' variable_declarators "";"" 'semicolon' {{FieldDeclaration}}
	;
variable_declarators 
	: variable_declarator 'variableDeclaration' 
	| variable_declarators "","" 'comma' variable_declarator 'variableDeclaration'
	;
variable_declarator 
	: variable_declarator_id 'variable' {{VariableDeclaration}}
	| initialized_variable_declarator
	;
initialized_variable_declarator
	: variable_declarator_id 'variable' ""="" 'equals' variable_initializer 'initializer' {{InitializedVariableDeclaration}}
	;
variable_declarator_id 
	: <IDENTIFIER> 'name' {{VariableName}}
	| variable_declarator_id 'variable' ""["" 'leftBracket' ""]"" 'rightBracket' {{ArrayVariableName}}
	;
variable_initializer 
	: expression 
	| array_initializer 
	;
# 19.8.3) Method Declarations
method_declaration 
	: method_header method_body 'body' {{MethodDeclaration}}
	;
method_header 
	: modifiers? type_parameters_opt 'typeParameters' type 'type' method_declarator 'declarator' throws 'throws'?
	| modifiers? type_parameters_opt 'typeParameters' void 'type' method_declarator 'declarator' throws 'throws'?
	;
####
void 
	: ""void"" 'voidToken' {{VoidType}} 
	;
####
method_declarator 
	: <IDENTIFIER> 'name' ""("" 'leftParen' formal_parameter_list? "")"" 'rightParen' {{MethodDeclarator}}
	| method_declarator 'declarator' ""["" 'leftBracket' ""]"" 'rightBracket' {{ArrayMethodDeclarator}} # deprecated
	# be careful; the above production also allows 'void foo() []'
	;
formal_parameter_list 
	: formal_parameter 'parameter' 
	| formal_parameter_list "","" 'comma' formal_parameter 'parameter' 
	;
formal_parameter 
	: variable_modifiers type 'type' variable_declarator_id 'variable' {{Parameter}}
	| variable_modifiers type 'type' ""..."" 'varArgsToken' variable_declarator_id 'variable' {{VariableArgumentParameter}}
	;
throws 
	: ""throws"" 'throwsToken' class_type_list {{Throws}}
	;
class_type_list 
	: class_type 'classType'
	| class_type_list "","" 'comma' class_type 'classType' 
	;
method_body 
	: block 
	| "";"" 'semicolon' {{EmptyMethodBody}}
	;
# 19.8.4) Static Initializers
static_initializer 
	: ""static"" 'staticToken' block 'block' {{StaticInitializer}}
	;
# 19.8.5) Constructor Declarations
constructor_declaration 
	: modifiers? constructor_declarator throws 'throws'?
			constructor_body 'body' {{ConstructorDeclaration}}
	;
constructor_declarator 
	: type_parameters_opt 'typeParameters' simple_name 'name' ""("" 'leftParen' formal_parameter_list? "")"" 'rightParen'
	;
constructor_body 
	: ""{"" 'leftBrace' explicit_constructor_invocation 'statement'
			block_statements ""}"" 'rightBrace' {{Block}}
	| ""{"" 'leftBrace' explicit_constructor_invocation 'statement' ""}"" 'rightBrace' {{Block}}
	| ""{"" 'leftBrace' block_statements ""}"" 'rightBrace' {{Block}}
	| ""{"" 'leftBrace' ""}"" 'rightBrace' {{Block}}
	;
explicit_constructor_invocation 
	: ""this"" 'thisToken' ""("" 'leftParen' argument_list? "")"" 'rightParen' "";"" 'semicolon' {{ThisConstructorInvocation}}
	| ""super"" 'superToken' ""("" 'leftParen' argument_list? "")"" 'rightParen' "";"" 'semicolon' {{SuperConstructorInvocation}}
	| primary 'primary' ""."" 'period' ""this"" 'thisToken' ""("" 'leftParen' argument_list? "")"" 'rightParen' "";"" 'semicolon' {{ThisConstructorInvocation}}
	| primary 'primary' ""."" 'period' ""super"" 'superToken' ""("" 'leftParen' argument_list? "")"" 'rightParen' "";"" 'semicolon' {{SuperConstructorInvocation}}
	;
# 19.9) Interfaces
# 19.9.1) Interface Declarations
interface_declaration 
	: modifiers? ""interface"" 'interfaceToken' <IDENTIFIER> 'name' type_parameters_opt 'typeParameters' extends_interfaces? 
			interface_body {{InterfaceDeclaration}}
	;
annotation_interface_declaration
	: modifiers? ""@"" 'atToken' ""interface"" 'interfaceToken' <IDENTIFIER> 'name' annotation_interface_body {{AnnotationInterface}}
	;
annotation_interface_body
	: ""{"" 'leftBrace' annotation_interface_member_declarations? ""}"" 'rightBrace'
	;
annotation_interface_member_declarations
	: annotation_interface_member_declaration 'declaration'
	| annotation_interface_member_declarations annotation_interface_member_declaration 'declaration'
	;
annotation_interface_member_declaration
	: annotation_method_declaration
	| type_declaration
	| field_declaration
	;
annotation_method_declaration
	: abstract_method_declaration
	| method_header ""default"" 'defaultToken' variable_initializer 'value' "";"" 'semicolon' {{AnnotationMethodDeclaration}}
	| method_header ""default"" 'defaultToken' annotation 'value' "";"" 'semicolon' {{AnnotationMethodDeclaration}}
	;
extends_interfaces 
	: ""extends"" 'extendsToken' interface_type 'interfaceType' 
	| extends_interfaces "","" 'comma' interface_type 'interfaceType' 
	;
interface_body 
	: ""{"" 'leftBrace' interface_member_declarations? ""}"" 'rightBrace'
	;
interface_member_declarations 
	: interface_member_declaration 'declaration'
	| interface_member_declarations interface_member_declaration 'declaration'
	;
interface_member_declaration 
	: constant_declaration 
	| abstract_method_declaration 
	| interface_method_declaration
	| type_declaration
	;
constant_declaration 
	: field_declaration 
	# need to semantically check that modifiers of field declaration
	# include only PUBLIC, ""static"", or ""final"". Other modifiers are
	# disallowed.
	;
interface_method_declaration 
	: interface_method_header block 'body' {{MethodDeclaration}}
	;	
interface_method_header 
	: interface_modifier* type_parameters_opt 'typeParameters' type 'type' method_declarator 'declarator' throws 'throws'?
	| interface_modifier* type_parameters_opt 'typeParameters' void 'type' method_declarator 'declarator' throws 'throws'?
	;
interface_modifier
	: modifier 'modifier'
	| default_modifier 'modifier'
	;
default_modifier 
	: ""default"" 'token' {{Modifier}}
	;
abstract_method_declaration 
	: method_header "";"" 'semicolon' {{AbstractMethodDeclaration}}
	;
# 19.10) Arrays
array_initializer 
	: ""{"" 'leftBrace' variable_initializers "","" 'comma' ""}"" 'rightBrace' {{ArrayInitializer}}
	| ""{"" 'leftBrace' variable_initializers ""}"" 'rightBrace' {{ArrayInitializer}}
	| ""{"" 'leftBrace' "","" 'comma' ""}"" 'rightBrace' {{ArrayInitializer}}
	| ""{"" 'leftBrace' ""}"" 'rightBrace' {{ArrayInitializer}}
	;
variable_initializers 
	: variable_initializer 'initializer' 
	| variable_initializers "","" 'comma' variable_initializer 'initializer'
	;
# 19.11) Blocks and Statements
block 
	:	""{"" 'leftBrace' block_statements? ""}"" 'rightBrace' {{Block}}
	;
block_statements 
	: block_statement 'statement' 
	| block_statements block_statement 'statement' 
	;
block_statement 
	: local_variable_declaration_statement 
	| statement 
	| class_declaration 
	| interface_declaration 
	;
local_variable_declaration_statement 
	: local_variable_declaration 'declaration' "";"" 'semicolon' {{LocalVariableDeclarationStatement}}
	;
local_variable_declaration 
	: variable_modifiers type 'type' variable_declarators {{LocalVariableDeclaration}}
	;
statement 
	: statement_without_trailing_substatement 
	| labeled_statement 
	| if_then_statement 
	| if_then_else_statement 
	| while_statement 
	| for_statement
	| foreach_statement
	;
statement_without_trailing_substatement 
	: block 
	| empty_statement 
	| expression_statement 
	| switch_statement 
	| do_statement 
	| break_statement 
	| continue_statement 
	| return_statement 
	| synchronized_statement 
	| throw_statement 
	| try_statement 
	| assert_statement
	;
empty_statement 
	: "";"" 'semicolon' {{EmptyStatement}}
	;
labeled_statement 
	: <IDENTIFIER> 'identifier' "":"" 'colon' statement 'statement' {{LabeledStatement}}
	;
expression_statement 
	: statement_expression 'expression' "";"" 'semicolon' {{ExpressionStatement}}
	;
statement_expression 
	: assignment 
	| preincrement_expression 
	| predecrement_expression 
	| postincrement_expression 
	| postdecrement_expression 
	| method_invocation 
	| class_instance_creation_expression 
	;
if_then_statement 
	: ""if"" 'ifToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' statement 'trueStatement' {{IfStatement}}
	;
if_then_else_statement 
	: ""if"" 'ifToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' statement 'trueStatement'
			""else"" 'elseToken' statement 'falseStatement' {{IfElseStatement}}
	;
switch_statement 
	: ""switch"" 'switchToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' switch_block 'block' {{SwitchStatement}}
	;
switch_block 
	: ""{"" 'leftBrace' switch_block_statement_groups switch_labels ""}"" 'rightBrace' {{SwitchBlock}}
	| ""{"" 'leftBrace' switch_block_statement_groups ""}"" 'rightBrace' {{SwitchBlock}}
	| ""{"" 'leftBrace' switch_labels ""}"" 'rightBrace' {{SwitchBlock}}
	| ""{"" 'leftBrace' ""}"" 'rightBrace' {{SwitchBlock}}
	;
switch_block_statement_groups 
	: switch_block_statement_group 'statementGroup' 
	| switch_block_statement_groups switch_block_statement_group 'statementGroup' 
	;
switch_block_statement_group 
	: switch_labels block_statements {{SwitchBlockStatementGroup}}
	;
switch_labels 
	: switch_label 'label' 
	| switch_labels switch_label 'label'
	;
switch_label 
	: ""case"" 'caseToken' constant_expression 'constant' "":"" 'colon' {{SwitchLabel}}
	| ""default"" 'defaultToken' "":"" 'colon' {{DefaultLabel}}
	;
while_statement 
	: ""while"" 'whileToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' statement 'statement' {{WhileStatement}}
	;
do_statement 
	: ""do"" 'doToken' statement 'statement' ""while"" 'whileToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' "";"" 'semicolon' {{DoWhileStatement}}
	;
for_statement 
	: ""for"" 'forToken' ""("" 'leftParen' for_init 'initial'? "";"" 'firstSemicolon' expression 'test'? "";"" 'secondSemicolon'
			for_update 'update'? "")"" 'rightParen' statement 'statement' {{ForStatement}}
	;
for_init 
	: statement_expression_list 
	| local_variable_declaration 
	;
for_update 
	: statement_expression_list 
	;
statement_expression_list 
	: statement_expression 'expression' {{StatementExpressionList}}
	| statement_expression_list "","" 'comma' statement_expression 'expression' {{StatementExpressionList}}
	;
break_statement 
	: ""break"" 'breakToken' <IDENTIFIER> 'identifier'? "";"" 'semicolon' {{BreakStatement}}
	;
continue_statement 
	: ""continue"" 'continueToken' <IDENTIFIER> 'identifier'? "";"" 'semicolon' {{ContinueStatement}}
	;
return_statement 
	: ""return"" 'returnToken' expression 'expression'? "";"" 'semicolon' {{ReturnStatement}}
	;
throw_statement 
	: ""throw"" 'throwToken' expression 'expression' "";"" 'semicolon' {{ThrowStatement}}
	;
synchronized_statement 
	: ""synchronized"" 'synchronizedToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' block 'block' {{SynchronizedStatement}}
	;
try_statement 
	: ""try"" 'tryToken' try_resources? block 'block' catches {{TryStatement}}
	| ""try"" 'tryToken' try_resources? block 'block' catches? finally 'finally' {{TryStatement}}
	| ""try"" 'tryToken' try_resources block 'block' {{TryStatement}}
	;
try_resources
	: ""("" 'leftParen' try_resources_list "";"" 'semicolon'? "")"" 'rightParen'
	;
try_resources_list
	: try_resource 'resource'
	| try_resources_list "";"" 'semicolon' try_resource 'resource' 
	;
try_resource
	: variable_modifiers type 'type' initialized_variable_declarator 'variableDeclaration' {{LocalVariableDeclaration}}
	;
catches 
	: catch_clause 'catch'
	| catches catch_clause 'catch'
	;
catch_clause 
	: ""catch"" 'catchToken' ""("" 'leftParen' catch_parameter 'parameter' "")"" 'rightParen' block 'block' {{CatchClause}}
	;
catch_parameter
	: variable_modifiers catch_types variable_declarator_id 'variable'  {{CatchParameter}}
	;
catch_types
	: type 'type'
	| catch_types ""|"" 'bar' type 'type'
	;
finally 
	: ""finally"" 'finallyToken' block 'block' {{FinallyClause}}
	;
assert_statement
	: ""assert"" 'assertToken' expression 'testExpression' "";"" 'semicolon' {{AssertStatement}}
	| ""assert"" 'assertToken' expression 'testExpression' "":"" 'colon' expression 'messageExpression' "";"" 'semicolon' {{AssertStatement}}
	;
# 19.12) Expressions
primary 
	: primary_no_new_array 
	| array_creation_expression 
	;
primary_no_new_array 
	: literal 
	| ""this"" 'name' {{Name}}
	| ""("" '_leftParen' expression "")"" '_rightParen' {{Expression}}
	| class_instance_creation_expression 
	| field_access 
	| method_invocation 
	| array_access 
	| primitive_type 'type' ""."" 'period' ""class"" 'classToken' {{ClassExpression}}
	| void 'type' ""."" 'period' ""class"" 'classToken' {{ClassExpression}}
	| type 'type' ""."" 'period' ""class"" 'classToken' {{ClassExpression}}
	| name 'name' ""."" 'period' ""this"" 'thisToken' {{OuterThis}}
	| method_reference_expression
	;
lambda_expression
	: lambda_parameters ""->"" 'arrowToken' lambda_function {{LambdaExpression}}
	;
lambda_parameters
	: ""("" 'leftParen' lambda_parameter_list? "")"" 'rightParen' 
	| untyped_lambda_parameter 'parameter'
	;
lambda_parameter_list
	: lambda_parameter 'parameter'
	| lambda_parameter_list "","" 'comma' lambda_parameter 'parameter'
	;
lambda_parameter
	: formal_parameter
	| untyped_lambda_parameter
	;
untyped_lambda_parameter
	: variable_declarator_id 'variable' {{Parameter}}
	;
lambda_function
	: block 'value'
	| expression 'value'
	;
method_reference_expression
	: primary_or_name 'receiver' ""::"" 'colonColonToken' <IDENTIFIER> 'name' {{MethodReference}}
	| reference_type 'receiver' ""::"" 'colonColonToken' ""new"" 'name' {{MethodReference}}
	;
class_instance_creation_expression 
	: ""new"" 'newToken' class_type 'type' ""("" 'leftParen' argument_list? "")"" 'rightParen' {{New}}
	| ""new"" 'newToken' class_type 'type' ""("" 'leftParen' argument_list? "")"" 'rightParen' class_body {{NewClass}}
	| primary_or_name 'primary' ""."" 'period' ""new"" 'newToken' type_arguments_opt <IDENTIFIER> 'name' 
			type_arguments_or_diamond_opt ""("" 'leftParen' argument_list? "")"" 'rightParen' {{New}}
	| primary_or_name 'primary' ""."" 'period' ""new"" 'newToken' type_arguments_opt <IDENTIFIER> 'name' 
			type_arguments_or_diamond_opt ""("" 'leftParen' argument_list? "")"" 'rightParen' class_body {{NewClass}}
	;
argument_list 
	: expression 'expression' 
	| argument_list "","" 'comma' expression 'expression'
	;
array_creation_expression 
	: ""new"" 'newToken' primitive_type 'type' dim_exprs dims? {{NewArray}}
	| ""new"" 'newToken' class_or_interface_type 'type' dim_exprs dims? {{NewArray}}
	| ""new"" 'newToken' primitive_type 'type' dims array_initializer 'initializer' {{NewArray}}
	| ""new"" 'newToken' class_or_interface_type 'type' dims array_initializer 'initializer' {{NewArray}}
	;
dim_exprs 
	: dim_expr 'dimExpression' 
	| dim_exprs dim_expr 'dimExpression' 
	;
dim_expr 
	: ""["" 'leftBracket' expression 'expression' ""]"" 'rightBracket' {{DimensionExpression}}
	;
dims 
	: empty_dim_expr
	| dims empty_dim_expr
	;
empty_dim_expr
	: ""["" 'leftBracket' ""]"" 'rightBracket'
	;
field_access 
	: primary 'receiver' ""."" 'period' <IDENTIFIER> 'name' {{FieldAccess}}
	| ""super"" 'superToken' ""."" 'period' <IDENTIFIER> 'name' {{FieldAccess}}
	| name 'receiver' ""."" 'superPeriod' ""super"" 'superToken' ""."" 'period' <IDENTIFIER> 'name' {{FieldAccess}}###???
	;
method_invocation 
	: type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list? "")"" 'rightParen' {{MethodInvocation}}
	| primary_or_name 'receiver' ""."" 'period' type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list? "")"" 'rightParen' {{MethodInvocation}}
	| ""super"" 'superToken' ""."" 'period' type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list? "")"" 'rightParen' {{MethodInvocation}}
	| name 'receiver' ""."" 'superPeriod' ""super"" 'superToken' ""."" 'period' type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list? "")"" 'rightParen' {{MethodInvocation}}
	;
array_access 
	: name 'array' ""["" 'leftBracket' expression 'expression' ""]"" 'rightBracket' {{ArrayAccess}}
	| primary_no_new_array 'array' ""["" 'leftBracket' expression 'expression' ""]"" 'rightBracket' {{ArrayAccess}}
	;
postfix_expression 
	: primary 
	| name 
	| postincrement_expression 
	| postdecrement_expression 
	;
postincrement_expression 
	: postfix_expression 'expression' ""++"" 'plusPlus' {{PostIncrementExpression}}
	;
postdecrement_expression 
	: postfix_expression 'expression' ""--"" 'minusMinus' {{PostDecrementExpression}}
	;
unary_expression 
	: preincrement_expression 
	| predecrement_expression 
	| ""+"" 'plus' unary_expression 'expression' {{UnaryAddition}}
	| ""-"" 'minus' unary_expression 'expression' {{UnarySubtraction}}
	| unary_expression_not_plus_minus 
| assignment # HACK for VAGEN
	;
preincrement_expression 
	: ""++"" 'plusPlus' unary_expression 'expression' {{PreIncrementExpression}}
	;
predecrement_expression 
	: ""--"" 'minusMinus' unary_expression 'expression' {{PreDecrementExpression}}
	;
unary_expression_not_plus_minus 
	: postfix_expression 
	| ""~"" 'tilde' unary_expression 'expression' {{UnaryBitInvert}}
	| ""!"" 'bang' unary_expression 'expression' {{UnaryNot}}
	| cast_expression 
	;
cast_expression 
	: ""("" 'leftParen' primitive_type 'type' "")"" 'rightParen' unary_expression 'expression' {{CastExpression}}
	| ""("" 'leftParen' reference_type 'type' ( ""&"" 'ampToken' interface_type 'interfaceType' )? "")"" 'rightParen' unary_expression_not_plus_minus 'expression' {{CastExpression}}
	| ""("" 'leftParen' reference_type 'type' ( ""&"" 'ampToken' interface_type 'interfaceType' )? "")"" 'rightParen' lambda_expression 'expression' {{CastExpression}}
	;
multiplicative_expression 
	: unary_expression 
	| multiplicative_expression 'leftExpression' ""*"" 'op' unary_expression 'rightExpression' {{BinaryExpression}}
	| multiplicative_expression 'leftExpression' ""/"" 'op' unary_expression 'rightExpression' {{BinaryExpression}}
	| multiplicative_expression 'leftExpression' ""%"" 'op' unary_expression 'rightExpression' {{BinaryExpression}}
	;
additive_expression 
	: multiplicative_expression 
	| additive_expression 'leftExpression' ""+"" 'op' multiplicative_expression 'rightExpression' {{BinaryExpression}}
	| additive_expression 'leftExpression' ""-"" 'op' multiplicative_expression 'rightExpression' {{BinaryExpression}}
	;
shift_expression 
	: additive_expression 
	| shift_expression 'leftExpression' ""<<"" 'op' additive_expression 'rightExpression' {{BinaryExpression}}
	| shift_expression 'leftExpression' <SIGNED_RIGHT_SHIFT> 'op' additive_expression 'rightExpression' {{BinaryExpression}}
	| shift_expression 'leftExpression' <UNSIGNED_RIGHT_SHIFT> 'op' additive_expression 'rightExpression' {{BinaryExpression}}
	;
relational_expression 
	: shift_expression 
	| relational_expression 'leftExpression' ""<"" 'op' shift_expression 'rightExpression' {{BinaryExpression}}
	| relational_expression 'leftExpression' <GREATER_THAN> 'op' shift_expression 'rightExpression' {{BinaryExpression}}
	| relational_expression 'leftExpression' ""<="" 'op' shift_expression 'rightExpression' {{BinaryExpression}}
	| relational_expression 'leftExpression' "">="" 'op' shift_expression 'rightExpression' {{BinaryExpression}}
	| relational_expression 'leftExpression' ""instanceof"" 'op' reference_type 'rightExpression' {{BinaryExpression}}
	;
equality_expression 
	: relational_expression 
	| equality_expression 'leftExpression' ""=="" 'op' relational_expression 'rightExpression' {{BinaryExpression}}
	| equality_expression 'leftExpression' ""!="" 'op' relational_expression 'rightExpression' {{BinaryExpression}}
	;
and_expression 
	: equality_expression 
	| and_expression 'leftExpression' ""&"" 'op' equality_expression 'rightExpression' {{BinaryExpression}}
	;
exclusive_or_expression 
	: and_expression 
	| exclusive_or_expression 'leftExpression' ""^"" 'op' and_expression 'rightExpression' {{BinaryExpression}}
	;
inclusive_or_expression 
	: exclusive_or_expression 
	| inclusive_or_expression 'leftExpression' ""|"" 'op' exclusive_or_expression 'rightExpression' {{BinaryExpression}}
	;
conditional_and_expression 
	: inclusive_or_expression 
	| conditional_and_expression 'leftExpression' ""&&"" 'op' inclusive_or_expression 'rightExpression' {{BinaryExpression}}
	;
conditional_or_expression 
	: conditional_and_expression 
	| conditional_or_expression 'leftExpression' ""||"" 'op' conditional_and_expression 'rightExpression' {{BinaryExpression}}
	;
conditional_expression 
	: conditional_or_expression 
	| conditional_or_expression 'testExpression' ""?"" 'questionMark' expression 'trueExpression'
			"":"" 'colon' conditional_expression 'falseExpression' {{ConditionalExpression}}
	;
assignment_expression 
	: conditional_expression 
	| assignment 
	;
assignment 
	: left_hand_side 'variable' assignment_operator 'op' expression 'value' {{Assignment}}
	;
left_hand_side 
	: name 
	| field_access 
	| array_access 
	;
assignment_operator 
	: ""="" 
	| ""*="" 
	| ""/="" 
	| ""%="" 
	| ""+="" 
	| ""-="" 
	| ""<<="" 
	| "">>="" 
	| "">>>="" 
	| ""&="" 
	| ""^="" 
	| ""|="" 
	;
expression 
	: assignment_expression 
	| lambda_expression
	;
constant_expression 
	: expression 
	;
####
annotations
	:
	| annotations annotation 'annotation'
	;
annotation
	: ""@"" 'at' name 'name' ( ""("" 'leftParen' annotation_args "")"" 'rightParen' )? {{Annotation}}
	;
annotation_args
	: 
	| elementValuePairs
	| elementValue 'value'
	;
elementValuePairs
	: elementValuePair 'value'
	| elementValuePairs "","" 'comma' elementValuePair 'value'
	;
elementValuePair
	: <IDENTIFIER> 'name' ""="" 'equals' elementValue 'value' {{ElementValuePair}}
	;
elementValue
	: conditional_expression
	| annotation
	| elementValueArrayInitializer
	;
elementValueArrayInitializer
	: ""{"" 'leftBrace' elementValues? "","" 'comma'? ""}"" 'rightBrace' {{ElementArrayInitializer}}
	;
elementValues
	: elementValue 'value'
	| elementValues "","" 'comma' elementValue 'value'
	;
enum_declaration
	: modifiers? ""enum"" 'enumToken' <IDENTIFIER> 'name' interfaces? enum_body {{EnumDeclaration}}
	;
enum_body
	: ""{"" 'leftBrace' enum_constants? "","" 'comma'? enum_body_declarations? ""}"" 'rightBrace'
	;
enum_constants
	: enum_constant 'constant'
	| enum_constants "","" 'comma' enum_constant 'constant'
	;
enum_constant
	: annotations <IDENTIFIER> 'name' ( ""("" 'leftParen' argument_list? "")"" 'rightParen' )? class_body? {{EnumConstant}}
	;
enum_body_declarations
	: "";"" 'semicolon' class_body_declarations?
	;
type_parameters_opt
	:
	| ""<"" 'lt' type_parameters <GREATER_THAN> 'gt' {{TypeParameters}}
	;
type_parameters
	: type_parameter 'parameter'
	| type_parameters "","" 'comma' type_parameter 'parameter'
	;
type_parameter
	: <IDENTIFIER> 'name' ( ""extends"" 'extendsToken' type_bound )? {{TypeParameter}}
	;
type_bound
	: type 'type'
	| type_bound ""&"" 'amp' type 'type'
	;
type_arguments_or_diamond_opt
	:
	| ""<"" 'typeArgLeft' type_arguments <GREATER_THAN> 'typeArgRight'
	| ""<"" 'typeArgLeft'  <GREATER_THAN> 'typeArgRight'
	;
type_arguments_opt
	:
	| ""<"" 'lt' type_arguments <GREATER_THAN> 'gt'
	| ""<"" 'lt'  <GREATER_THAN> 'gt'
	;
type_arguments
	: type_argument 'argument'
	| type_arguments "","" 'comma' type_argument 'argument'
	;
type_argument
	: type 'type' {{TypeArgument}}
	| ""?"" 'questionMark' type_argument_type {{TypeArgument}}
	;
type_argument_type
	: ""extends"" 'token' type 'type'
	| ""super"" 'token' type 'type'
	|
	;
type_name
	: simple_type_name 
	| qualified_type_name 
	;
simple_type_name 
	: <IDENTIFIER> 'name' type_arguments_opt {{TypeName}}
	;
qualified_type_name 
	: type_name 'nspace' ""."" 'period' <IDENTIFIER> 'name' type_arguments_opt {{QualifiedTypeName}}
	;
foreach_statement 
	: ""for"" 'forToken' ""("" 'leftParen' variable_modifiers type 'type' variable_declarator_id 'name' "":"" 'colon' expression 'expression' "")"" 'rightParen' statement 'statement' {{ForEachStatement}}
	;
variable_modifiers
	: 
	| variable_modifiers variable_modifier 'modifier'
	;
variable_modifier
	: ""final"" 'token' {{Modifier}}
	| annotation
	;
primary_or_name
	: primary
	| name
	;"
]

{ #category : #'file types' }
JavaParser class >> fileExtension [
	^ '.java'
]

{ #category : #'file types' }
JavaParser class >> fileExtensionType [
	^ 'Java files'
]

{ #category : #private }
JavaParser class >> keywords [
	^ keywords
		ifNil: [ keywords := (Set new: 100)
				addAll:
					#('abstract' 'assert' 'boolean' 'break' 'byte' 'case' 'catch' 'char' 'class' 'const' 'continue' 'default' 'do' 'double' 'else' 'enum' 'extends' 'final' 'finally' 'float' 'for' 'goto' 'if' 'implements' 'import' 'instanceof' 'int' 'interface' 'long' 'native' 'new' 'package' 'private' 'protected' 'public' 'return' 'short' 'static' 'strictfp' 'super' 'switch' 'synchronized' 'this' 'throw' 'throws' 'transient' 'try' 'void' 'volatile' 'while');
				yourself ]
]

{ #category : #generated }
JavaParser class >> reduceTable [
^#(
	#(266 0 #reduceActionForannotations1: 28608513 false ) 
	#(125 0 #reduceActionForcompilation_unit1: 4802561 false ) 
	#(292 0 #reduceActionForannotations1: 31324161 false ) 
	#(284 0 #reduceActionFortype_arguments_opt1: 30432257 false ) 
	#(279 0 #nil 29900801 false ) 
	#(132 1 #reduceActionFortype_declaration4: 5705732 false ) 
	#(134 1 #reduceActionFormodifier5: 5981189 false ) 
	#(134 1 #reduceActionFormodifier5: 5981190 false ) 
	#(134 1 #reduceActionFormodifier5: 5981191 false ) 
	#(134 1 #reduceActionFormodifier5: 5981187 false ) 
	#(134 1 #reduceActionFormodifier5: 5981186 false ) 
	#(134 1 #reduceActionFormodifier5: 5981185 false ) 
	#(134 1 #reduceActionFormodifier5: 5981188 false ) 
	#(134 1 #reduceActionFormodifier5: 5981195 false ) 
	#(134 1 #reduceActionFormodifier5: 5981192 false ) 
	#(134 1 #reduceActionFormodifier5: 5981193 false ) 
	#(134 1 #reduceActionFormodifier5: 5981194 false ) 
	#(110 1 #liftFirstValue: 3406849 false ) 
	#(125 1 #reduceActionForcompilation_unit3: 4802563 false ) 
	#(125 1 #reduceActionForcompilation_unit2: 4802562 false ) 
	#(125 1 #reduceActionForcompilation_unit5: 4802565 false ) 
	#(126 1 #reduceActionForimport_declarations1: 4932609 false ) 
	#(129 1 #liftFirstValue: 5280769 false ) 
	#(129 1 #liftFirstValue: 5280770 false ) 
	#(127 1 #reduceActionForimport_declarations1: 5042177 false ) 
	#(133 1 #reduceActionForimport_declarations1: 5909505 false ) 
	#(132 1 #liftFirstValue: 5705729 false ) 
	#(132 1 #liftFirstValue: 5705730 false ) 
	#(132 1 #liftFirstValue: 5705731 false ) 
	#(134 1 #liftFirstValue: 5981196 false ) 
	#(135 1 #liftFirstValue: 6558729 false ) 
	#(189 1 #reduceActionForempty_statement1: 14989313 false ) 
	#(113 1 #reduceActionForprimitive_type2: 3851266 false ) 
	#(115 1 #reduceActionForintegral_type1: 3985409 false ) 
	#(115 1 #reduceActionForintegral_type5: 3985413 false ) 
	#(116 1 #reduceActionForfloating_point_type2: 4162562 false ) 
	#(116 1 #reduceActionForfloating_point_type1: 4162561 false ) 
	#(115 1 #reduceActionForintegral_type3: 3985411 false ) 
	#(115 1 #reduceActionForintegral_type4: 3985412 false ) 
	#(115 1 #reduceActionForintegral_type2: 3985410 false ) 
	#(223 1 #reduceActionForprimary_no_new_array2: 19676162 false ) 
	#(151 1 #reduceActionForvoid1: 8625153 false ) 
	#(111 1 #reduceActionForliteral1: 3465217 false ) 
	#(111 1 #reduceActionForliteral2: 3465218 false ) 
	#(111 1 #reduceActionForliteral3: 3465219 false ) 
	#(111 1 #reduceActionForliteral4: 3465220 false ) 
	#(111 1 #reduceActionForliteral5: 3465221 false ) 
	#(111 1 #reduceActionForliteral6: 3465222 false ) 
	#(123 1 #reduceActionForprimary_no_new_array2: 4644865 false ) 
	#(223 1 #liftFirstValue: 19676161 false ) 
	#(112 1 #liftFirstValue: 3804161 false ) 
	#(113 1 #liftFirstValue: 3851265 false ) 
	#(114 1 #liftFirstValue: 3926017 false ) 
	#(114 1 #liftFirstValue: 3926018 false ) 
	#(112 1 #liftFirstValue: 3804162 false ) 
	#(117 1 #liftFirstValue: 4256769 false ) 
	#(117 1 #liftFirstValue: 4256770 false ) 
	#(241 1 #liftFirstValue: 23553026 false ) 
	#(262 1 #liftFirstValue: 28298241 false ) 
	#(294 1 #liftFirstValue: 31471618 false ) 
	#(122 1 #liftFirstValue: 4600833 false ) 
	#(122 1 #liftFirstValue: 4600834 false ) 
	#(184 1 #liftFirstValue: 14118915 false ) 
	#(184 1 #liftFirstValue: 14118916 false ) 
	#(188 1 #liftFirstValue: 14696449 false ) 
	#(184 1 #liftFirstValue: 14118913 false ) 
	#(184 1 #liftFirstValue: 14118914 false ) 
	#(187 1 #liftFirstValue: 14504961 false ) 
	#(188 1 #liftFirstValue: 14696450 false ) 
	#(187 1 #liftFirstValue: 14504962 false ) 
	#(188 1 #liftFirstValue: 14696451 false ) 
	#(187 1 #liftFirstValue: 14504963 false ) 
	#(187 1 #liftFirstValue: 14504964 false ) 
	#(188 1 #liftFirstValue: 14696452 false ) 
	#(187 1 #liftFirstValue: 14504965 false ) 
	#(188 1 #liftFirstValue: 14696453 false ) 
	#(187 1 #liftFirstValue: 14504966 false ) 
	#(188 1 #liftFirstValue: 14696454 false ) 
	#(188 1 #liftFirstValue: 14696455 false ) 
	#(188 1 #liftFirstValue: 14696456 false ) 
	#(188 1 #liftFirstValue: 14696458 false ) 
	#(188 1 #liftFirstValue: 14696457 false ) 
	#(188 1 #liftFirstValue: 14696459 false ) 
	#(188 1 #liftFirstValue: 14696460 false ) 
	#(241 1 #liftFirstValue: 23553025 false ) 
	#(294 1 #liftFirstValue: 31471617 false ) 
	#(222 1 #liftFirstValue: 19607553 false ) 
	#(223 1 #liftFirstValue: 19676172 false ) 
	#(192 1 #liftFirstValue: 15261703 false ) 
	#(223 1 #liftFirstValue: 19676164 false ) 
	#(222 1 #liftFirstValue: 19607554 false ) 
	#(223 1 #liftFirstValue: 19676165 false ) 
	#(262 1 #liftFirstValue: 28298242 false ) 
	#(192 1 #liftFirstValue: 15261702 false ) 
	#(223 1 #liftFirstValue: 19676166 false ) 
	#(223 1 #liftFirstValue: 19676167 false ) 
	#(262 1 #liftFirstValue: 28298243 false ) 
	#(192 1 #liftFirstValue: 15261700 false ) 
	#(241 1 #liftFirstValue: 23553027 false ) 
	#(192 1 #liftFirstValue: 15261701 false ) 
	#(241 1 #liftFirstValue: 23553028 false ) 
	#(192 1 #liftFirstValue: 15261698 false ) 
	#(192 1 #liftFirstValue: 15261699 false ) 
	#(192 1 #liftFirstValue: 15261697 false ) 
	#(118 1 #reduceActionForclass_or_interface_type1: 4320257 false ) 
	#(288 1 #liftFirstValue: 30843905 false ) 
	#(288 1 #liftFirstValue: 30843906 false ) 
	#(187 1 #liftFirstValue: 14504967 false ) 
	#(147 1 #reduceActionForvariable_declarator_id1: 8030209 false ) 
	#(228 1 #reduceActionForuntyped_lambda_parameter1: 20638721 false ) 
	#(264 1 #liftFirstValue: 28499970 false ) 
	#(225 1 #reduceActionForlambda_parameters3: 20319235 false ) 
	#(247 1 #liftFirstValue: 24373249 false ) 
	#(249 1 #liftFirstValue: 25048065 false ) 
	#(244 1 #liftFirstValue: 23880705 false ) 
	#(244 1 #liftFirstValue: 23880706 false ) 
	#(244 1 #liftFirstValue: 23880709 false ) 
	#(247 1 #liftFirstValue: 24373252 false ) 
	#(250 1 #liftFirstValue: 25441281 false ) 
	#(251 1 #liftFirstValue: 25730049 false ) 
	#(252 1 #liftFirstValue: 26136577 false ) 
	#(253 1 #liftFirstValue: 26753025 false ) 
	#(254 1 #liftFirstValue: 27031553 false ) 
	#(255 1 #liftFirstValue: 27181057 false ) 
	#(256 1 #liftFirstValue: 27338753 false ) 
	#(257 1 #liftFirstValue: 27514881 false ) 
	#(258 1 #liftFirstValue: 27698177 false ) 
	#(259 1 #liftFirstValue: 27885569 false ) 
	#(260 1 #liftFirstValue: 28123137 false ) 
	#(264 1 #liftFirstValue: 28499969 false ) 
	#(244 1 #liftFirstValue: 23880710 false ) 
	#(260 1 #liftFirstValue: 28123138 false ) 
	#(142 1 #liftFirstValue: 7361539 false ) 
	#(141 1 #liftFirstValue: 7218177 false ) 
	#(142 1 #liftFirstValue: 7361537 false ) 
	#(142 1 #liftFirstValue: 7361538 false ) 
	#(141 1 #liftFirstValue: 7218178 false ) 
	#(141 1 #liftFirstValue: 7218179 false ) 
	#(141 1 #reduceActionForclass_body_declaration4: 7218180 false ) 
	#(267 2 #reduceActionForannotation1: 28666881 false ) 
	#(125 2 #reduceActionForcompilation_unit4: 4802564 false ) 
	#(126 2 #reduceActionForimport_declarations2: 4932610 false ) 
	#(127 2 #reduceActionForimport_declarations2: 5042178 false ) 
	#(125 2 #reduceActionForcompilation_unit7: 4802567 false ) 
	#(125 2 #reduceActionForcompilation_unit6: 4802566 false ) 
	#(133 2 #reduceActionForimport_declarations2: 5909506 false ) 
	#(266 2 #reduceActionForimport_declarations2: 28608514 false ) 
	#(245 2 #reduceActionForpreincrement_expression1: 24158209 false ) 
	#(246 2 #reduceActionForpredecrement_expression1: 24264705 false ) 
	#(287 0 #reduceActionFortype_argument_type3: 30752771 false ) 
	#(284 2 #reduceActionFortype_arguments_opt3: 30432259 false ) 
	#(286 1 #reduceActionFortype_argument1: 30643201 false ) 
	#(285 1 #reduceActionFortype_arguments1: 30539777 false ) 
	#(207 2 #reduceActionForbreak_statement1: 17671169 false ) 
	#(208 2 #reduceActionForcontinue_statement1: 17779713 false ) 
	#(119 1 #liftFirstValue: 4383745 false ) 
	#(209 2 #reduceActionForreturn_statement1: 17900545 false ) 
	#(182 2 #reduceActionForblock1: 13938689 false ) 
	#(183 1 #reduceActionForimport_declarations1: 14014465 false ) 
	#(289 2 #reduceActionForsimple_type_name1: 30903297 false ) 
	#(121 2 #reduceActionForarray_type1: 4477953 false ) 
	#(236 1 #reduceActionFordims1: 22315009 false ) 
	#(185 2 #reduceActionForlocal_variable_declaration_statement1: 14244865 false ) 
	#(191 2 #reduceActionForexpression_statement1: 15157249 false ) 
	#(242 2 #reduceActionForpostincrement_expression1: 23657473 false ) 
	#(243 2 #reduceActionForpostdecrement_expression1: 23768065 false ) 
	#(263 1 #liftFirstValue: 28361732 false ) 
	#(263 1 #liftFirstValue: 28361738 false ) 
	#(263 1 #liftFirstValue: 28361730 false ) 
	#(263 1 #liftFirstValue: 28361733 false ) 
	#(263 1 #liftFirstValue: 28361734 false ) 
	#(263 1 #liftFirstValue: 28361731 false ) 
	#(263 1 #liftFirstValue: 28361735 false ) 
	#(263 1 #liftFirstValue: 28361729 false ) 
	#(263 1 #liftFirstValue: 28361736 false ) 
	#(263 1 #liftFirstValue: 28361737 false ) 
	#(263 1 #liftFirstValue: 28361739 false ) 
	#(263 1 #liftFirstValue: 28361740 false ) 
	#(121 2 #reduceActionForarray_type1: 4477954 false ) 
	#(293 1 #reduceActionFormodifier5: 31403009 false ) 
	#(293 1 #liftFirstValue: 31403010 false ) 
	#(292 2 #reduceActionForimport_declarations2: 31324162 false ) 
	#(247 2 #reduceActionForunary_expression_not_plus_minus3: 24373251 false ) 
	#(225 2 #reduceActionForlambda_parameters1: 20319233 false ) 
	#(227 1 #liftFirstValue: 20569089 false ) 
	#(226 1 #reduceActionFortype_arguments1: 20443137 false ) 
	#(227 1 #liftFirstValue: 20569090 false ) 
	#(244 2 #reduceActionForunary_expression3: 23880707 false ) 
	#(244 2 #reduceActionForunary_expression4: 23880708 false ) 
	#(247 2 #reduceActionForunary_expression_not_plus_minus2: 24373250 false ) 
	#(281 1 #reduceActionFortype_parameter1: 30105601 false ) 
	#(280 1 #reduceActionFortype_arguments1: 29996033 false ) 
	#(157 1 #reduceActionFormethod_body2: 9504770 false ) 
	#(149 2 #reduceActionFormethod_declaration1: 8291329 false ) 
	#(157 1 #liftFirstValue: 9504769 false ) 
	#(158 2 #reduceActionForstatic_initializer1: 9602049 false ) 
	#(144 1 #reduceActionFortype_arguments1: 7596033 false ) 
	#(145 1 #liftFirstValue: 7748610 false ) 
	#(145 1 #reduceActionForvariable_declarator1: 7748609 false ) 
	#(159 2 #reduceActionForconstructor_declaration1: 9724929 false ) 
	#(268 0 #reduceActionForannotation_args1: 28776449 false ) 
	#(274 3 #reduceActionForenum_declaration1: 29366273 false ) 
	#(130 3 #reduceActionForsingle_type_import_declaration1: 5379073 false ) 
	#(125 3 #reduceActionForcompilation_unit8: 4802568 false ) 
	#(223 3 #reduceActionForprimary_no_new_array3: 19676163 false ) 
	#(286 2 #reduceActionFortype_argument2: 30643202 false ) 
	#(284 3 #reduceActionFortype_arguments_opt2: 30432258 false ) 
	#(221 3 #reduceActionForassert_statement1: 19337217 false ) 
	#(207 3 #reduceActionForbreak_statement2: 17671170 false ) 
	#(208 3 #reduceActionForcontinue_statement2: 17779714 false ) 
	#(204 1 #liftFirstValue: 17346562 false ) 
	#(206 1 #reduceActionForstatement_expression_list1: 17468417 false ) 
	#(204 1 #liftFirstValue: 17346561 false ) 
	#(233 3 #reduceActionForarray_creation_expression1: 21744641 false ) 
	#(234 1 #reduceActionForimport_declarations1: 22127617 false ) 
	#(233 3 #reduceActionForarray_creation_expression1: 21744643 false ) 
	#(209 3 #reduceActionForreturn_statement2: 17900546 false ) 
	#(238 3 #reduceActionForfield_access2: 22425602 false ) 
	#(210 3 #reduceActionForthrow_statement1: 18011137 false ) 
	#(214 1 #reduceActionFortype_arguments1: 18629633 false ) 
	#(212 3 #reduceActionFortry_statement1: 18282497 false ) 
	#(216 1 #reduceActionForimport_declarations1: 18880513 false ) 
	#(212 3 #reduceActionFortry_statement3: 18282499 false ) 
	#(212 3 #reduceActionFortry_statement7: 18282503 false ) 
	#(182 3 #reduceActionForblock2: 13938690 false ) 
	#(183 2 #reduceActionForimport_declarations2: 14014466 false ) 
	#(190 3 #reduceActionForlabeled_statement1: 15048705 false ) 
	#(223 3 #reduceActionForprimary_no_new_array10: 19676170 false ) 
	#(223 3 #reduceActionForprimary_no_new_array10: 19676168 false ) 
	#(237 2 #reduceActionForempty_dim_expr1: 22366209 false ) 
	#(236 2 #reduceActionFordims2: 22315010 false ) 
	#(230 3 #reduceActionFormethod_reference_expression2: 20779010 false ) 
	#(223 3 #reduceActionForprimary_no_new_array11: 19676171 false ) 
	#(124 3 #reduceActionForqualified_name1: 4694017 false ) 
	#(223 3 #reduceActionForprimary_no_new_array10: 19676169 false ) 
	#(238 3 #reduceActionForfield_access1: 22425601 false ) 
	#(261 3 #reduceActionForassignment1: 28192769 false ) 
	#(186 3 #reduceActionForlocal_variable_declaration1: 14387201 false ) 
	#(230 3 #reduceActionFormethod_reference_expression2: 20779009 false ) 
	#(225 3 #reduceActionForlambda_parameters2: 20319234 false ) 
	#(147 3 #reduceActionForvariable_declarator_id2: 8030210 false ) 
	#(229 1 #liftFirstValue: 20719617 false ) 
	#(224 3 #reduceActionForlambda_expression1: 20219905 false ) 
	#(229 1 #liftFirstValue: 20719618 false ) 
	#(249 3 #reduceActionFormultiplicative_expression4: 25048068 false ) 
	#(249 3 #reduceActionFormultiplicative_expression4: 25048066 false ) 
	#(249 3 #reduceActionFormultiplicative_expression4: 25048067 false ) 
	#(250 3 #reduceActionFormultiplicative_expression4: 25441282 false ) 
	#(250 3 #reduceActionFormultiplicative_expression4: 25441283 false ) 
	#(251 3 #reduceActionFormultiplicative_expression4: 25730050 false ) 
	#(251 3 #reduceActionFormultiplicative_expression4: 25730051 false ) 
	#(251 3 #reduceActionFormultiplicative_expression4: 25730052 false ) 
	#(252 3 #reduceActionFormultiplicative_expression4: 26136578 false ) 
	#(252 3 #reduceActionFormultiplicative_expression4: 26136580 false ) 
	#(252 3 #reduceActionFormultiplicative_expression4: 26136581 false ) 
	#(252 3 #reduceActionFormultiplicative_expression4: 26136582 false ) 
	#(252 3 #reduceActionFormultiplicative_expression4: 26136579 false ) 
	#(253 3 #reduceActionFormultiplicative_expression4: 26753027 false ) 
	#(253 3 #reduceActionFormultiplicative_expression4: 26753026 false ) 
	#(254 3 #reduceActionFormultiplicative_expression4: 27031554 false ) 
	#(255 3 #reduceActionFormultiplicative_expression4: 27181058 false ) 
	#(256 3 #reduceActionFormultiplicative_expression4: 27338754 false ) 
	#(257 3 #reduceActionFormultiplicative_expression4: 27514882 false ) 
	#(258 3 #reduceActionFormultiplicative_expression4: 27698178 false ) 
	#(279 3 #reduceActionFortype_parameters_opt2: 29900802 false ) 
	#(150 3 #reduceActionFormethod_header1: 8374273 false ) 
	#(150 3 #reduceActionFormethod_header1: 8374277 false ) 
	#(143 3 #reduceActionForfield_declaration1: 7487489 false ) 
	#(159 3 #reduceActionForconstructor_declaration3: 9724931 false ) 
	#(156 1 #reduceActionFortype_arguments1: 9401345 false ) 
	#(155 2 #reduceActionForthrows1: 9335809 false ) 
	#(161 2 #reduceActionForblock1: 10009604 false ) 
	#(159 3 #reduceActionForconstructor_declaration2: 9724930 false ) 
	#(164 4 #reduceActionForannotation_interface_declaration1: 11176961 false ) 
	#(271 1 #liftFirstValue: 29056001 false ) 
	#(271 1 #liftFirstValue: 29056002 false ) 
	#(268 1 #reduceActionForannotation_args2: 28776450 false ) 
	#(269 1 #reduceActionFortype_arguments1: 28846081 false ) 
	#(268 1 #reduceActionFortype_arguments1: 28776451 false ) 
	#(271 1 #liftFirstValue: 29056003 false ) 
	#(135 4 #reduceActionForclass_declaration1: 6558721 false ) 
	#(120 1 #liftFirstValue: 4427777 false ) 
	#(138 1 #reduceActionFortype_arguments1: 6882305 false ) 
	#(137 2 #reduceActionForinterfaces1: 6811649 false ) 
	#(278 1 #reduceActionForenum_body_declarations1: 29829121 false ) 
	#(275 2 #reduceActionForenum_body1: 29484033 false ) 
	#(276 1 #reduceActionFortype_arguments1: 29588481 false ) 
	#(274 4 #reduceActionForenum_declaration2: 29366274 false ) 
	#(130 4 #reduceActionForsingle_type_import_declaration2: 5379074 false ) 
	#(176 0 #reduceActionForannotations1: 12947457 false ) 
	#(163 4 #reduceActionForinterface_declaration1: 10982401 false ) 
	#(274 4 #reduceActionForenum_declaration3: 29366275 false ) 
	#(128 4 #reduceActionForpackage_declaration1: 5163009 false ) 
	#(287 2 #reduceActionForempty_dim_expr1: 30752769 false ) 
	#(287 2 #reduceActionForempty_dim_expr1: 30752770 false ) 
	#(285 3 #reduceActionFortype_arguments2: 30539778 false ) 
	#(234 2 #reduceActionForimport_declarations2: 22127618 false ) 
	#(233 4 #reduceActionForarray_creation_expression2: 21744642 false ) 
	#(233 4 #reduceActionForarray_creation_expression5: 21744645 false ) 
	#(233 4 #reduceActionForarray_creation_expression2: 21744644 false ) 
	#(233 4 #reduceActionForarray_creation_expression5: 21744646 false ) 
	#(231 4 #reduceActionForclass_instance_creation_expression1: 20993025 false ) 
	#(232 1 #reduceActionFortype_arguments1: 21643265 false ) 
	#(213 3 #reduceActionFortype_arguments_opt2: 18538497 false ) 
	#(220 2 #reduceActionForfinally1: 19263489 false ) 
	#(216 2 #reduceActionForimport_declarations2: 18880514 false ) 
	#(212 4 #reduceActionFortry_statement4: 18282500 false ) 
	#(212 4 #reduceActionFortry_statement2: 18282498 false ) 
	#(212 4 #reduceActionFortry_statement5: 18282501 false ) 
	#(240 4 #reduceActionForarray_access1: 23328769 false ) 
	#(240 4 #reduceActionForarray_access1: 23328770 false ) 
	#(239 4 #reduceActionFormethod_invocation1: 22706177 false ) 
	#(290 4 #reduceActionForqualified_type_name1: 30981121 false ) 
	#(248 4 #reduceActionForcast_expression1: 24578049 false ) 
	#(248 4 #reduceActionForcast_expression1: 24578052 false ) 
	#(248 4 #reduceActionForcast_expression1: 24578050 false ) 
	#(226 3 #reduceActionFortype_arguments2: 20443138 false ) 
	#(154 3 #reduceActionForformal_parameter1: 9108481 false ) 
	#(282 1 #reduceActionFortype_arguments1: 30208001 false ) 
	#(281 3 #reduceActionFortype_parameter2: 30105602 false ) 
	#(280 3 #reduceActionFortype_arguments2: 29996034 false ) 
	#(150 4 #reduceActionFormethod_header3: 8374275 false ) 
	#(150 4 #reduceActionFormethod_header3: 8374279 false ) 
	#(150 4 #reduceActionFormethod_header2: 8374274 false ) 
	#(150 4 #reduceActionFormethod_header2: 8374278 false ) 
	#(144 3 #reduceActionFortype_arguments2: 7596034 false ) 
	#(146 3 #reduceActionForinitialized_variable_declarator1: 7871489 false ) 
	#(148 1 #liftFirstValue: 8197122 false ) 
	#(148 1 #liftFirstValue: 8197121 false ) 
	#(143 4 #reduceActionForfield_declaration2: 7487490 false ) 
	#(159 4 #reduceActionForconstructor_declaration4: 9724932 false ) 
	#(161 3 #reduceActionForconstructor_body2: 10009602 false ) 
	#(161 3 #reduceActionForblock2: 10009603 false ) 
	#(160 4 #reduceActionForconstructor_declarator1: 9864193 false ) 
	#(153 1 #reduceActionFortype_arguments1: 8979457 false ) 
	#(165 2 #reduceActionForannotation_interface_body1: 11343873 false ) 
	#(167 1 #liftFirstValue: 11657218 false ) 
	#(167 1 #liftFirstValue: 11657219 false ) 
	#(166 1 #reduceActionForimport_declarations1: 11453441 false ) 
	#(167 1 #liftFirstValue: 11657217 false ) 
	#(168 1 #liftFirstValue: 11777025 false ) 
	#(272 2 #reduceActionForelementValueArrayInitializer1: 29146113 false ) 
	#(273 1 #reduceActionFortype_arguments1: 29273089 false ) 
	#(267 5 #reduceActionForannotation2: 28666882 false ) 
	#(136 2 #reduceActionForempty_dim_expr1: 6748161 false ) 
	#(139 2 #reduceActionForannotation_interface_body1: 7003137 false ) 
	#(140 1 #reduceActionForimport_declarations1: 7080961 false ) 
	#(135 5 #reduceActionForclass_declaration3: 6558723 false ) 
	#(135 5 #reduceActionForclass_declaration2: 6558722 false ) 
	#(275 3 #reduceActionForenum_body3: 29484035 false ) 
	#(278 2 #reduceActionForenum_body_declarations2: 29829122 false ) 
	#(277 2 #reduceActionForenum_constant1: 29691905 false ) 
	#(275 3 #reduceActionForenum_body5: 29484037 false ) 
	#(275 3 #reduceActionForenum_body2: 29484034 false ) 
	#(131 5 #reduceActionFortype_import_on_demand_declaration1: 5527553 false ) 
	#(169 2 #reduceActionForextends_interfaces1: 12076033 false ) 
	#(170 2 #reduceActionForannotation_interface_body1: 12228609 false ) 
	#(172 1 #liftFirstValue: 12476420 false ) 
	#(173 1 #liftFirstValue: 12621825 false ) 
	#(171 1 #reduceActionForimport_declarations1: 12316673 false ) 
	#(172 1 #liftFirstValue: 12476417 false ) 
	#(172 1 #liftFirstValue: 12476419 false ) 
	#(172 1 #liftFirstValue: 12476418 false ) 
	#(163 5 #reduceActionForinterface_declaration2: 10982402 false ) 
	#(164 5 #reduceActionForannotation_interface_declaration2: 11176962 false ) 
	#(135 5 #reduceActionForclass_declaration5: 6558725 false ) 
	#(274 5 #reduceActionForenum_declaration4: 29366276 false ) 
	#(163 5 #reduceActionForinterface_declaration3: 10982403 false ) 
	#(221 5 #reduceActionForassert_statement2: 19337218 false ) 
	#(205 1 #liftFirstValue: 17422337 false ) 
	#(206 3 #reduceActionForstatement_expression_list2: 17468418 false ) 
	#(193 5 #reduceActionForif_then_statement1: 15481857 false ) 
	#(235 3 #reduceActionFordim_expr1: 22211585 false ) 
	#(180 2 #reduceActionForarray_initializer4: 13441028 false ) 
	#(181 1 #reduceActionFortype_arguments1: 13766657 false ) 
	#(231 5 #reduceActionForclass_instance_creation_expression3: 20993027 false ) 
	#(231 5 #reduceActionForclass_instance_creation_expression2: 20993026 false ) 
	#(195 5 #reduceActionForswitch_statement1: 15825921 false ) 
	#(211 5 #reduceActionForsynchronized_statement1: 18116609 false ) 
	#(213 4 #reduceActionFortry_resources2: 18538498 false ) 
	#(214 3 #reduceActionFortype_arguments2: 18629634 false ) 
	#(215 3 #reduceActionFortry_resource1: 18744321 false ) 
	#(212 5 #reduceActionFortry_statement6: 18282502 false ) 
	#(201 5 #reduceActionForwhile_statement1: 16803841 false ) 
	#(238 5 #reduceActionForfield_access3: 22425603 false ) 
	#(239 5 #reduceActionFormethod_invocation2: 22706178 false ) 
	#(283 0 #reduceActionFortype_arguments_opt1: 30274561 false ) 
	#(154 4 #reduceActionForformal_parameter2: 9108482 false ) 
	#(259 5 #reduceActionForconditional_expression2: 27885570 false ) 
	#(150 5 #reduceActionFormethod_header4: 8374276 false ) 
	#(150 5 #reduceActionFormethod_header4: 8374280 false ) 
	#(152 3 #reduceActionFormethod_declarator1: 8676353 false ) 
	#(152 3 #reduceActionFormethod_declarator3: 8676355 false ) 
	#(156 3 #reduceActionFortype_arguments2: 9401346 false ) 
	#(161 4 #reduceActionForconstructor_body1: 10009601 false ) 
	#(160 5 #reduceActionForconstructor_declarator2: 9864194 false ) 
	#(179 2 #reduceActionForabstract_method_declaration1: 13327361 false ) 
	#(165 3 #reduceActionForannotation_interface_body2: 11343874 false ) 
	#(166 2 #reduceActionForimport_declarations2: 11453442 false ) 
	#(272 3 #reduceActionForelementValueArrayInitializer2: 29146114 false ) 
	#(272 3 #reduceActionForelementValueArrayInitializer3: 29146115 false ) 
	#(270 3 #reduceActionForelementValuePair1: 28955649 false ) 
	#(269 3 #reduceActionFortype_arguments2: 28846082 false ) 
	#(139 3 #reduceActionForannotation_interface_body2: 7003138 false ) 
	#(140 2 #reduceActionForimport_declarations2: 7080962 false ) 
	#(135 6 #reduceActionForclass_declaration4: 6558724 false ) 
	#(138 3 #reduceActionFortype_arguments2: 6882306 false ) 
	#(275 4 #reduceActionForenum_body4: 29484036 false ) 
	#(277 3 #reduceActionForenum_constant2: 29691906 false ) 
	#(275 4 #reduceActionForenum_body7: 29484039 false ) 
	#(276 3 #reduceActionFortype_arguments2: 29588482 false ) 
	#(275 4 #reduceActionForenum_body6: 29484038 false ) 
	#(131 6 #reduceActionFortype_import_on_demand_declaration2: 5527554 false ) 
	#(170 3 #reduceActionForannotation_interface_body2: 12228610 false ) 
	#(171 2 #reduceActionForimport_declarations2: 12316674 false ) 
	#(174 2 #reduceActionForinterface_method_declaration1: 12820481 false ) 
	#(178 1 #reduceActionFormodifier5: 13271041 false ) 
	#(177 1 #liftFirstValue: 13193217 false ) 
	#(176 2 #reduceActionForimport_declarations2: 12947458 false ) 
	#(177 1 #liftFirstValue: 13193218 false ) 
	#(169 3 #reduceActionForextends_interfaces2: 12076034 false ) 
	#(135 6 #reduceActionForclass_declaration7: 6558727 false ) 
	#(135 6 #reduceActionForclass_declaration6: 6558726 false ) 
	#(163 6 #reduceActionForinterface_declaration4: 10982404 false ) 
	#(203 6 #reduceActionForfor_statement1: 17125377 false ) 
	#(180 3 #reduceActionForarray_initializer3: 13441027 false ) 
	#(180 3 #reduceActionForarray_initializer2: 13441026 false ) 
	#(231 6 #reduceActionForclass_instance_creation_expression4: 20993028 false ) 
	#(232 3 #reduceActionFortype_arguments2: 21643266 false ) 
	#(239 6 #reduceActionFormethod_invocation5: 22706181 false ) 
	#(196 2 #reduceActionForswitch_block4: 15974404 false ) 
	#(197 1 #reduceActionForimport_declarations1: 16294913 false ) 
	#(199 1 #reduceActionForimport_declarations1: 16562177 false ) 
	#(219 1 #reduceActionFortype_arguments1: 19194881 false ) 
	#(239 6 #reduceActionFormethod_invocation3: 22706179 false ) 
	#(248 6 #reduceActionForcast_expression5: 24578053 false ) 
	#(248 6 #reduceActionForcast_expression5: 24578051 false ) 
	#(282 3 #reduceActionFortype_arguments2: 30208002 false ) 
	#(152 4 #reduceActionFormethod_declarator2: 8676354 false ) 
	#(162 4 #reduceActionForexplicit_constructor_invocation3: 10347523 false ) 
	#(162 4 #reduceActionForexplicit_constructor_invocation1: 10347521 false ) 
	#(153 3 #reduceActionFortype_arguments2: 8979458 false ) 
	#(272 4 #reduceActionForelementValueArrayInitializer4: 29146116 false ) 
	#(273 3 #reduceActionFortype_arguments2: 29273090 false ) 
	#(277 4 #reduceActionForenum_constant3: 29691907 false ) 
	#(275 5 #reduceActionForenum_body8: 29484040 false ) 
	#(135 7 #reduceActionForclass_declaration8: 6558728 false ) 
	#(202 7 #reduceActionFordo_statement1: 16949249 false ) 
	#(203 7 #reduceActionForfor_statement2: 17125378 false ) 
	#(203 7 #reduceActionForfor_statement3: 17125379 false ) 
	#(203 7 #reduceActionForfor_statement5: 17125381 false ) 
	#(194 7 #reduceActionForif_then_else_statement1: 15624193 false ) 
	#(180 4 #reduceActionForarray_initializer1: 13441025 false ) 
	#(181 3 #reduceActionFortype_arguments2: 13766658 false ) 
	#(239 7 #reduceActionFormethod_invocation6: 22706182 false ) 
	#(265 1 #liftFirstValue: 28563457 false ) 
	#(200 2 #reduceActionForswitch_label2: 16645122 false ) 
	#(196 3 #reduceActionForswitch_block2: 15974402 false ) 
	#(197 2 #reduceActionForimport_declarations2: 16294914 false ) 
	#(196 3 #reduceActionForswitch_block3: 15974403 false ) 
	#(198 2 #reduceActionForswitch_block_statement_group1: 16462849 false ) 
	#(199 2 #reduceActionForimport_declarations2: 16562178 false ) 
	#(217 5 #reduceActionForcatch_clause1: 18950145 false ) 
	#(218 3 #reduceActionForcatch_parameter1: 19085313 false ) 
	#(283 2 #reduceActionFortype_arguments_opt3: 30274563 false ) 
	#(239 7 #reduceActionFormethod_invocation4: 22706180 false ) 
	#(162 5 #reduceActionForexplicit_constructor_invocation4: 10347524 false ) 
	#(162 5 #reduceActionForexplicit_constructor_invocation2: 10347522 false ) 
	#(168 4 #reduceActionForannotation_method_declaration2: 11777026 false ) 
	#(168 4 #reduceActionForannotation_method_declaration2: 11777027 false ) 
	#(277 5 #reduceActionForenum_constant4: 29691908 false ) 
	#(277 5 #reduceActionForenum_constant5: 29691909 false ) 
	#(175 4 #reduceActionForinterface_method_header1: 12918785 false ) 
	#(175 4 #reduceActionForinterface_method_header1: 12918787 false ) 
	#(203 8 #reduceActionForfor_statement4: 17125380 false ) 
	#(203 8 #reduceActionForfor_statement6: 17125382 false ) 
	#(203 8 #reduceActionForfor_statement7: 17125383 false ) 
	#(200 3 #reduceActionForswitch_label1: 16645121 false ) 
	#(196 4 #reduceActionForswitch_block1: 15974401 false ) 
	#(219 3 #reduceActionFortype_arguments2: 19194882 false ) 
	#(239 8 #reduceActionFormethod_invocation7: 22706183 false ) 
	#(283 3 #reduceActionFortype_arguments_opt2: 30274562 false ) 
	#(231 8 #reduceActionForclass_instance_creation_expression5: 20993029 false ) 
	#(162 6 #reduceActionForexplicit_constructor_invocation7: 10347527 false ) 
	#(162 6 #reduceActionForexplicit_constructor_invocation5: 10347525 false ) 
	#(277 6 #reduceActionForenum_constant6: 29691910 false ) 
	#(175 5 #reduceActionForinterface_method_header2: 12918786 false ) 
	#(175 5 #reduceActionForinterface_method_header2: 12918788 false ) 
	#(203 9 #reduceActionForfor_statement8: 17125384 false ) 
	#(291 9 #reduceActionForforeach_statement1: 31104001 false ) 
	#(239 9 #reduceActionFormethod_invocation8: 22706184 false ) 
	#(231 9 #reduceActionForclass_instance_creation_expression7: 20993031 false ) 
	#(231 9 #reduceActionForclass_instance_creation_expression6: 20993030 false ) 
	#(162 7 #reduceActionForexplicit_constructor_invocation8: 10347528 false ) 
	#(162 7 #reduceActionForexplicit_constructor_invocation6: 10347526 false ) 
	#(231 10 #reduceActionForclass_instance_creation_expression8: 20993032 false )
	).
]

{ #category : #'generated-accessing' }
JavaParser class >> scannerClass [
	^JavaScanner
]

{ #category : #generated }
JavaParser class >> startingStateForblock_statement [
	^ 2
]

{ #category : #generated }
JavaParser class >> startingStateForclass_body_declaration [
	^ 6
]

{ #category : #generated }
JavaParser class >> startingStateForexpression [
	^ 3
]

{ #category : #generated }
JavaParser class >> startingStateForgoal [
	^ 1
]

{ #category : #generated }
JavaParser class >> startingStateFormethod_declaration [
	^ 5
]

{ #category : #generated }
JavaParser class >> startingStateFortype_declaration [
	^ 4
]

{ #category : #generated }
JavaParser class >> symbolNames [
	^ #('"!"' '"!="' '"%"' '"%="' '"&"' '"&&"' '"&="' '"("' '")"' '"*"' '"*="' '"+"' '"++"' '"+="' '","' '"-"' '"--"' '"-="' '"->"' '"."' '"..."' '"/"' '"/="' '":"' '"::"' '";"' '"<"' '"<<"' '"<<="' '"<="' '"="' '"=="' '">="' '">>="' '">>>="' '"?"' '"@"' '"["' '"]"' '"^"' '"^="' '"abstract"' '"assert"' '"boolean"' '"break"' '"byte"' '"case"' '"catch"' '"char"' '"class"' '"continue"' '"default"' '"do"' '"double"' '"else"' '"enum"' '"extends"' '"final"' '"finally"' '"float"' '"for"' '"if"' '"implements"' '"import"' '"instanceof"' '"int"' '"interface"' '"long"' '"native"' '"new"' '"package"' '"private"' '"protected"' '"public"' '"return"' '"short"' '"static"' '"strictfp"' '"super"' '"switch"' '"synchronized"' '"this"' '"throw"' '"throws"' '"transient"' '"try"' '"void"' '"volatile"' '"while"' '"{"' '"|"' '"|="' '"||"' '"}"' '"~"' '<GREATER_THAN>' '<SIGNED_RIGHT_SHIFT>' '<UNSIGNED_RIGHT_SHIFT>' '<INTEGER_LITERAL>' '<FLOATING_POINT_LITERAL>' '<BOOLEAN_LITERAL>' '<CHARACTER_LITERAL>' '<STRING_LITERAL>' '<NULL_LITERAL>' '<IDENTIFIER>' '<whitespace>' '<comment>' '<patternToken>' 'B e g i n' 'goal' 'literal' 'type' 'primitive_type' 'numeric_type' 'integral_type' 'floating_point_type' 'reference_type' 'class_or_interface_type' 'class_type' 'interface_type' 'array_type' 'name' 'simple_name' 'qualified_name' 'compilation_unit' 'import_declarations' 'type_declarations' 'package_declaration' 'import_declaration' 'single_type_import_declaration' 'type_import_on_demand_declaration' 'type_declaration' 'modifiers' 'modifier' 'class_declaration' 'super' 'interfaces' 'interface_type_list' 'class_body' 'class_body_declarations' 'class_body_declaration' 'class_member_declaration' 'field_declaration' 'variable_declarators' 'variable_declarator' 'initialized_variable_declarator' 'variable_declarator_id' 'variable_initializer' 'method_declaration' 'method_header' 'void' 'method_declarator' 'formal_parameter_list' 'formal_parameter' 'throws' 'class_type_list' 'method_body' 'static_initializer' 'constructor_declaration' 'constructor_declarator' 'constructor_body' 'explicit_constructor_invocation' 'interface_declaration' 'annotation_interface_declaration' 'annotation_interface_body' 'annotation_interface_member_declarations' 'annotation_interface_member_declaration' 'annotation_method_declaration' 'extends_interfaces' 'interface_body' 'interface_member_declarations' 'interface_member_declaration' 'constant_declaration' 'interface_method_declaration' 'interface_method_header' 'interface_modifier*' 'interface_modifier' 'default_modifier' 'abstract_method_declaration' 'array_initializer' 'variable_initializers' 'block' 'block_statements' 'block_statement' 'local_variable_declaration_statement' 'local_variable_declaration' 'statement' 'statement_without_trailing_substatement' 'empty_statement' 'labeled_statement' 'expression_statement' 'statement_expression' 'if_then_statement' 'if_then_else_statement' 'switch_statement' 'switch_block' 'switch_block_statement_groups' 'switch_block_statement_group' 'switch_labels' 'switch_label' 'while_statement' 'do_statement' 'for_statement' 'for_init' 'for_update' 'statement_expression_list' 'break_statement' 'continue_statement' 'return_statement' 'throw_statement' 'synchronized_statement' 'try_statement' 'try_resources' 'try_resources_list' 'try_resource' 'catches' 'catch_clause' 'catch_parameter' 'catch_types' 'finally' 'assert_statement' 'primary' 'primary_no_new_array' 'lambda_expression' 'lambda_parameters' 'lambda_parameter_list' 'lambda_parameter' 'untyped_lambda_parameter' 'lambda_function' 'method_reference_expression' 'class_instance_creation_expression' 'argument_list' 'array_creation_expression' 'dim_exprs' 'dim_expr' 'dims' 'empty_dim_expr' 'field_access' 'method_invocation' 'array_access' 'postfix_expression' 'postincrement_expression' 'postdecrement_expression' 'unary_expression' 'preincrement_expression' 'predecrement_expression' 'unary_expression_not_plus_minus' 'cast_expression' 'multiplicative_expression' 'additive_expression' 'shift_expression' 'relational_expression' 'equality_expression' 'and_expression' 'exclusive_or_expression' 'inclusive_or_expression' 'conditional_and_expression' 'conditional_or_expression' 'conditional_expression' 'assignment_expression' 'assignment' 'left_hand_side' 'assignment_operator' 'expression' 'constant_expression' 'annotations' 'annotation' 'annotation_args' 'elementValuePairs' 'elementValuePair' 'elementValue' 'elementValueArrayInitializer' 'elementValues' 'enum_declaration' 'enum_body' 'enum_constants' 'enum_constant' 'enum_body_declarations' 'type_parameters_opt' 'type_parameters' 'type_parameter' 'type_bound' 'type_arguments_or_diamond_opt' 'type_arguments_opt' 'type_arguments' 'type_argument' 'type_argument_type' 'type_name' 'simple_type_name' 'qualified_type_name' 'foreach_statement' 'variable_modifiers' 'variable_modifier' 'primary_or_name' 'E O F' 'error')
]

{ #category : #generated }
JavaParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #JavaProgramFileNode #JavaProgramFileNode #JavaLiteralNode #JavaTypeNode #JavaPrimitiveTypeNode #JavaPrimitiveTypeNode #JavaPrimitiveTypeNode #JavaPrimitiveTypeNode #JavaTypeNode #JavaClassTypeNode #JavaClassTypeNode #JavaClassTypeNode #JavaArrayTypeNode #JavaNameNode #JavaNameNode #JavaQualifiedNameNode #JavaProgramFileNode #OrderedCollection #OrderedCollection #JavaPackageDeclarationNode #JavaSingleTypeImportDeclarationNode #JavaSingleTypeImportDeclarationNode #JavaTypeImportOnDemandDeclarationNode #JavaProgramNode #OrderedCollection #JavaProgramNode #JavaDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaProgramNode #JavaProgramNode #JavaFieldDeclarationNode #OrderedCollection #JavaVariableDeclarationNode #JavaInitializedVariableDeclarationNode #JavaProgramNode #JavaProgramNode #JavaMethodDeclarationNode #OrderedCollection #JavaVoidTypeNode #JavaProgramNode #OrderedCollection #JavaParameterNode #JavaThrowsNode #OrderedCollection #JavaProgramNode #JavaStaticInitializerNode #JavaConstructorDeclarationNode #OrderedCollection #JavaBlockNode #JavaStatementNode #JavaInterfaceDeclarationNode #JavaAnnotationInterfaceNode #OrderedCollection #OrderedCollection #JavaProgramNode #JavaAbstractMethodDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaProgramNode #JavaFieldDeclarationNode #JavaMethodDeclarationNode #OrderedCollection #OrderedCollection #JavaProgramNode #JavaModifierNode #JavaAbstractMethodDeclarationNode #JavaArrayInitializerNode #OrderedCollection #JavaBlockNode #OrderedCollection #JavaProgramNode #JavaLocalVariableDeclarationStatementNode #JavaLocalVariableDeclarationNode #JavaStatementNode #JavaStatementNode #JavaEmptyStatementNode #JavaLabeledStatementNode #JavaExpressionStatementNode #JavaExpressionNode #JavaIfStatementNode #JavaIfElseStatementNode #JavaSwitchStatementNode #JavaSwitchBlockNode #OrderedCollection #JavaSwitchBlockStatementGroupNode #OrderedCollection #JavaProgramNode #JavaWhileStatementNode #JavaDoWhileStatementNode #JavaForStatementNode #JavaProgramNode #JavaStatementExpressionListNode #JavaStatementExpressionListNode #JavaBreakStatementNode #JavaContinueStatementNode #JavaReturnStatementNode #JavaThrowStatementNode #JavaSynchronizedStatementNode #JavaTryStatementNode #OrderedCollection #OrderedCollection #JavaLocalVariableDeclarationNode #OrderedCollection #JavaCatchClauseNode #JavaCatchParameterNode #OrderedCollection #JavaFinallyClauseNode #JavaAssertStatementNode #JavaExpressionNode #JavaExpressionNode #JavaLambdaExpressionNode #OrderedCollection #OrderedCollection #JavaParameterNode #JavaParameterNode #JavaProgramNode #JavaMethodReferenceNode #JavaNewNode #OrderedCollection #JavaNewArrayNode #OrderedCollection #JavaDimensionExpressionNode #OrderedCollection #OrderedCollection #JavaFieldAccessNode #JavaMethodInvocationNode #JavaArrayAccessNode #JavaExpressionNode #JavaPostIncrementExpressionNode #JavaPostDecrementExpressionNode #JavaExpressionNode #JavaPreIncrementExpressionNode #JavaPreDecrementExpressionNode #JavaExpressionNode #JavaCastExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaAssignmentNode #JavaExpressionNode #SmaCCToken #JavaExpressionNode #JavaExpressionNode #OrderedCollection #JavaAnnotationNode #OrderedCollection #OrderedCollection #JavaElementValuePairNode #JavaProgramNode #JavaElementArrayInitializerNode #OrderedCollection #JavaEnumDeclarationNode #OrderedCollection #OrderedCollection #JavaEnumConstantNode #OrderedCollection #JavaTypeParametersNode #OrderedCollection #JavaTypeParameterNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaTypeArgumentNode #OrderedCollection #JavaTypeNameNode #JavaTypeNameNode #JavaQualifiedTypeNameNode #JavaForEachStatementNode #OrderedCollection #JavaProgramNode #JavaExpressionNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
JavaParser class >> transitionTable [
^#(
#[1 0 29 0 26 0 7 0 37 0 37 0 42 0 41 0 50 0 45 0 56 0 49 0 58 0 53 0 64 0 57 0 67 0 61 0 69 0 6 0 71 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 0 97 0 110 0 97 0 125 0 105 0 126 0 109 0 127 0 113 0 128 0 117 0 129 0 117 0 130 0 117 0 131 0 129 0 132 0 133 0 133 0 137 0 134 0 129 0 135 0 129 0 163 0 129 0 164 0 153 1 10 0 137 1 11 0 129 1 18 0 10 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 0 23 0 49 0 41 0 50 0 209 0 51 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 0 253 0 79 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 1 129 0 135 1 117 0 151 1 129 0 163 1 129 0 182 1 129 0 184 1 129 0 185 1 137 0 186 1 129 0 187 1 129 0 188 1 129 0 189 1 129 0 190 1 129 0 191 1 161 0 192 1 129 0 193 1 129 0 194 1 129 0 195 1 129 0 201 1 129 0 202 1 129 0 203 1 129 0 207 1 129 0 208 1 129 0 209 1 129 0 210 1 129 0 211 1 129 0 212 1 129 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 1 129 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 1 129 1 35 2 41 1 36 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 2 181 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 2 181 1 3 2 181 1 4 2 177 1 5 2 17 1 6 2 181 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 29 0 26 0 33 0 37 0 37 0 42 0 41 0 50 0 45 0 56 0 49 0 58 0 57 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 2 185 0 132 0 133 0 133 0 137 0 134 2 185 0 135 2 185 0 163 2 185 0 164 0 137 1 11 2 185 1 18] 
#[1 2 189 0 27 0 185 0 37 0 37 0 42 0 22 0 44 0 22 0 46 0 22 0 49 0 22 0 54 0 49 0 58 0 22 0 60 0 22 0 66 0 22 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 22 0 76 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 0 22 0 105 2 193 0 133 0 137 0 134 2 197 0 149 2 201 0 150 0 137 1 11 2 205 1 23] 
#[1 0 29 0 26 2 189 0 27 0 33 0 37 0 37 0 42 0 59 0 44 0 63 0 46 0 67 0 49 0 41 0 50 0 71 0 54 0 45 0 56 0 49 0 58 0 75 0 60 0 79 0 66 0 57 0 67 0 83 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 87 0 76 2 209 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 1 29 0 90 0 91 0 105 2 217 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 2 217 0 117 2 217 0 118 2 217 0 121 2 237 0 132 2 233 0 133 0 137 0 134 2 237 0 135 2 237 0 141 2 237 0 142 2 237 0 143 2 237 0 149 2 201 0 150 2 237 0 158 2 237 0 159 3 5 0 160 2 237 0 163 2 237 0 164 3 9 0 182 0 137 1 11 2 237 1 18 3 13 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 0 26 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 3 17 0 67 3 21 0 105 3 25 0 122 3 25 0 123 3 25 0 124] 
#[0 0 30 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 3 29 0 105] 
#[0 3 33 0 105] 
#[0 0 34 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[1 3 37 0 77 3 21 0 105 3 41 0 122 3 41 0 123 3 41 0 124] 
#[0 3 45 0 105] 
#[0 0 38 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 46 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 50 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 54 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 58 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 62 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 66 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 70 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 0 1 39] 
#[0 0 74 1 39] 
#[1 0 29 0 26 0 33 0 37 0 37 0 42 0 41 0 50 0 45 0 56 0 49 0 58 0 53 0 64 0 57 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 3 49 0 127 3 53 0 129 3 53 0 130 3 53 0 131 0 129 0 132 0 133 0 133 0 137 0 134 0 129 0 135 0 129 0 163 0 129 0 164 0 137 1 11 0 129 1 18 0 78 1 39] 
#[1 0 29 0 26 0 33 0 37 0 37 0 42 0 41 0 50 0 45 0 56 0 49 0 58 0 57 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 3 57 0 132 0 133 0 133 0 137 0 134 3 57 0 135 3 57 0 163 3 57 0 164 0 137 1 11 3 57 1 18 0 82 1 39] 
#[1 0 29 0 26 0 33 0 37 0 37 0 42 0 41 0 50 0 45 0 56 0 49 0 58 0 53 0 64 0 57 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 3 61 0 126 3 65 0 127 0 117 0 129 0 117 0 130 0 117 0 131 0 129 0 132 0 133 0 133 0 137 0 134 0 129 0 135 0 129 0 163 0 129 0 164 0 137 1 11 0 129 1 18 0 86 1 39] 
#[0 0 90 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[0 0 94 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[0 0 98 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[0 0 102 0 26 0 37 0 42 0 50 0 56 0 58 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[1 3 69 0 37 0 37 0 42 3 73 0 50 3 77 0 56 0 49 0 58 3 81 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 3 85 0 134 3 85 1 11] 
#[0 0 106 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 110 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 0 114 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 0 118 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 0 185 0 37 3 89 0 71 3 93 1 11] 
#[0 0 122 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 126 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 3 97 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 3 97 1 3 3 97 1 4 2 177 1 5 2 17 1 6 3 97 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 3 109 0 244 3 109 0 245 3 109 0 246 3 109 0 247 3 109 0 248 3 109 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 3 117 0 244 3 117 0 245 3 117 0 246 3 117 0 247 3 117 0 248 3 117 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 0 130 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 3 121 0 36 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 3 125 0 96 2 213 0 105 3 129 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 3 129 0 117 3 129 0 118 3 129 0 121 3 133 1 29 3 137 1 30 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 3 21 0 105 3 25 0 122 3 25 0 123 3 25 0 124] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 3 141 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 3 141 1 3 3 141 1 4 2 177 1 5 2 17 1 6 3 141 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 0 134 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[1 3 145 0 26 3 149 0 105] 
#[0 0 138 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 142 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[1 3 153 0 26 3 157 0 105] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 3 165 0 182 3 165 0 187 3 165 0 188 3 165 0 189 3 165 0 190 3 165 0 191 1 161 0 192 3 165 0 193 3 165 0 194 3 165 0 195 3 165 0 201 3 165 0 202 3 165 0 203 3 165 0 207 3 165 0 208 3 165 0 209 3 165 0 210 3 165 0 211 3 165 0 212 3 165 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 3 165 1 35 2 45 1 38] 
#[0 0 146 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 150 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 3 169 0 8] 
#[0 3 173 0 8] 
#[0 0 154 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 158 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 3 177 0 113 3 177 0 114 3 177 0 115 3 177 0 116 3 181 0 118 3 185 0 119 3 189 1 32 3 189 1 33 3 189 1 34] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 3 193 0 26 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 3 197 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 3 197 1 3 3 197 1 4 2 177 1 5 2 17 1 6 3 197 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 0 162 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 3 201 0 20] 
#[0 3 205 0 8] 
#[1 3 209 0 8 0 62 0 37 0 62 0 42 0 62 0 50 0 62 0 56 0 62 0 58 0 62 0 67 0 62 0 69 0 62 0 72 0 62 0 73 0 62 0 74 0 62 0 77 0 62 0 78 0 62 0 81 0 62 0 85 0 62 0 88] 
#[0 0 166 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 3 213 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 3 213 1 3 3 213 1 4 2 177 1 5 2 17 1 6 3 213 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 3 217 0 8 1 29 0 90 3 221 0 182 3 225 0 213] 
#[0 0 170 0 20 0 105] 
#[0 3 229 0 8] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 0 23 0 49 0 41 0 50 0 209 0 51 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 0 253 0 79 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 3 233 0 94 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 3 241 0 135 1 117 0 151 3 241 0 163 3 241 0 182 3 237 0 183 3 241 0 184 3 241 0 185 1 137 0 186 3 241 0 187 3 241 0 188 3 241 0 189 3 241 0 190 3 241 0 191 1 161 0 192 3 241 0 193 3 241 0 194 3 241 0 195 3 241 0 201 3 241 0 202 3 241 0 203 3 241 0 207 3 241 0 208 3 241 0 209 3 241 0 210 3 241 0 211 3 241 0 212 3 241 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 3 241 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 3 241 1 35 2 41 1 36 2 45 1 38] 
#[0 0 174 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 0 178 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 0 182 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 0 186 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 0 190 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 0 194 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 0 198 0 4 0 198 0 7 0 198 0 11 0 198 0 13 0 198 0 14 0 198 0 17 0 198 0 18 0 103 0 20 0 198 0 23 3 245 0 24 0 103 0 25 0 181 0 27 0 198 0 29 0 198 0 31 0 198 0 34 0 198 0 35 0 103 0 38 0 198 0 41 0 198 0 92 3 249 1 28] 
#[0 0 202 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 253 0 20] 
#[1 0 107 0 20 4 5 0 38 4 9 0 236 4 13 0 237] 
#[0 0 210 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 214 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 218 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[1 0 222 0 20 4 17 0 25] 
#[0 0 226 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 0 230 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[1 0 234 0 2 0 234 0 3 0 238 0 4 0 234 0 5 0 234 0 6 0 238 0 7 0 234 0 9 0 234 0 10 0 238 0 11 0 234 0 12 0 234 0 13 0 238 0 14 0 234 0 15 0 234 0 16 0 234 0 17 0 238 0 18 0 111 0 20 0 234 0 22 0 238 0 23 0 234 0 24 0 242 0 25 0 234 0 26 0 234 0 27 0 234 0 28 0 238 0 29 0 234 0 30 0 238 0 31 0 234 0 32 0 234 0 33 0 238 0 34 0 238 0 35 0 234 0 36 4 25 0 38 0 234 0 39 0 234 0 40 0 238 0 41 0 234 0 65 0 234 0 91 0 238 0 92 0 234 0 93 0 234 0 94 0 234 0 96 0 234 0 97 0 234 0 98 0 234 1 39] 
#[0 0 246 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 65 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 91 0 92 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 0 250 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 65 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 91 0 92 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[1 0 185 0 37 0 37 0 42 3 73 0 50 3 77 0 56 0 49 0 58 3 81 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 3 85 0 134 3 85 1 11] 
#[0 0 254 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 4 29 0 20] 
#[0 1 2 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 6 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 0 0 1 39] 
#[0 1 10 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 4 33 0 26] 
#[0 1 14 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 18 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 22 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 26 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 30 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 4 37 0 26] 
#[0 1 34 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 38 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 42 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 46 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 50 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 54 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 58 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 62 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 66 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 70 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 74 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 78 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 1 82 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 1 86 0 2 1 86 0 3 1 86 0 5 1 86 0 6 1 86 0 9 1 86 0 10 1 86 0 12 1 86 0 13 1 86 0 15 1 86 0 16 1 86 0 17 0 115 0 20 1 86 0 22 1 86 0 24 1 90 0 25 1 86 0 26 1 86 0 27 1 86 0 28 1 86 0 30 1 86 0 32 1 86 0 33 1 86 0 36 1 86 0 39 1 86 0 40 1 86 0 65 1 86 0 91 1 86 0 93 1 86 0 94 1 86 0 96 1 86 0 97 1 86 0 98 1 86 1 39] 
#[1 1 94 0 2 1 94 0 3 1 94 0 5 1 94 0 6 1 94 0 9 1 94 0 10 1 94 0 12 1 94 0 13 1 94 0 15 1 94 0 16 1 94 0 17 1 94 0 20 1 94 0 22 1 94 0 24 1 94 0 25 1 94 0 26 1 94 0 27 1 94 0 28 1 94 0 30 1 94 0 32 1 94 0 33 1 94 0 36 4 45 0 38 1 94 0 39 1 94 0 40 1 94 0 65 1 94 0 91 1 94 0 93 1 94 0 94 1 94 0 96 1 94 0 97 1 94 0 98 1 94 1 39] 
#[0 1 98 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 1 102 0 9 1 106 0 13 1 102 0 15 1 106 0 17 1 106 0 20 1 106 0 25 1 102 0 26 1 106 0 38] 
#[0 1 110 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 1 114 0 2 1 114 0 3 1 118 0 4 1 114 0 5 1 114 0 6 1 118 0 7 1 114 0 9 1 114 0 10 1 118 0 11 1 114 0 12 1 114 0 13 1 118 0 14 1 114 0 15 1 114 0 16 1 114 0 17 1 118 0 18 1 114 0 20 1 114 0 22 1 118 0 23 1 114 0 24 1 114 0 25 1 114 0 26 1 114 0 27 1 114 0 28 1 118 0 29 1 114 0 30 1 118 0 31 1 114 0 32 1 114 0 33 1 118 0 34 1 118 0 35 1 114 0 36 1 114 0 38 1 114 0 39 1 114 0 40 1 118 0 41 1 114 0 65 1 114 0 91 1 118 0 92 1 114 0 93 1 114 0 94 1 114 0 96 1 114 0 97 1 114 0 98 1 114 1 39] 
#[1 1 122 0 9 1 126 0 13 1 122 0 15 1 126 0 17 1 126 0 20 1 126 0 25 1 122 0 26 1 126 0 38] 
#[1 1 130 0 2 1 130 0 3 1 134 0 4 1 130 0 5 1 130 0 6 1 134 0 7 1 130 0 9 1 130 0 10 1 134 0 11 1 130 0 12 1 130 0 13 1 134 0 14 1 130 0 15 1 130 0 16 1 130 0 17 1 134 0 18 1 130 0 20 1 130 0 22 1 134 0 23 1 130 0 24 1 130 0 25 1 130 0 26 1 130 0 27 1 130 0 28 1 134 0 29 1 130 0 30 1 134 0 31 1 130 0 32 1 130 0 33 1 134 0 34 1 134 0 35 1 130 0 36 1 130 0 38 1 130 0 39 1 130 0 40 1 134 0 41 1 130 0 65 1 130 0 91 1 134 0 92 1 130 0 93 1 130 0 94 1 130 0 96 1 130 0 97 1 130 0 98 1 130 1 39] 
#[1 4 49 0 13 4 53 0 17] 
#[1 1 138 0 9 1 142 0 13 1 138 0 15 1 142 0 17 1 138 0 26] 
#[1 1 146 0 9 1 150 0 13 1 146 0 15 1 150 0 17 1 146 0 26] 
#[0 1 154 0 9 0 15 0 26] 
#[0 1 158 0 9 0 15 0 26] 
#[0 1 162 0 9 0 15 0 26] 
#[0 4 105 0 4 0 7 0 11 0 14 0 18 0 23 0 29 0 31 0 34 0 35 0 41 0 92 1 7] 
#[0 4 109 0 105] 
#[1 1 166 0 2 1 166 0 3 1 166 0 5 1 166 0 6 1 166 0 9 1 166 0 10 1 166 0 12 1 166 0 15 1 166 0 16 0 119 0 20 1 166 0 21 1 166 0 22 1 166 0 24 1 166 0 25 1 166 0 26 1 166 0 27 1 166 0 28 1 166 0 30 1 166 0 32 1 166 0 33 1 166 0 36 4 5 0 38 1 166 0 39 1 166 0 40 1 166 0 65 1 166 0 91 1 166 0 93 1 166 0 94 1 166 0 96 1 166 0 97 1 166 0 98 1 166 0 105 4 117 0 236 4 13 0 237 1 166 1 39] 
#[0 1 170 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 1 174 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 1 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 4 121 0 58 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 4 125 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 4 125 0 117 4 125 0 118 4 125 0 121 4 133 1 11 2 25 1 32 2 25 1 33 2 25 1 34 4 133 1 37] 
#[1 4 137 0 20 4 141 0 25] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 4 145 0 244 4 145 0 245 4 145 0 246 4 145 0 247 4 145 0 248 4 145 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 4 149 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 14 0 37 0 15 0 44 0 19 0 46 0 23 0 49 0 27 0 54 0 14 0 58 0 35 0 60 0 39 0 66 0 43 0 68 0 241 0 70 0 47 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 123 0 105 1 221 0 111 1 65 0 112 4 153 0 113 4 153 0 114 4 153 0 115 4 153 0 116 4 157 0 117 4 157 0 118 4 157 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 4 169 0 154 1 217 0 222 1 221 0 223 3 97 0 224 2 81 0 225 4 165 0 226 4 169 0 227 4 173 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 3 97 1 3 3 97 1 4 2 177 1 5 2 17 1 6 3 97 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 4 177 1 36 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 4 181 0 244 4 181 0 245 4 181 0 246 4 181 0 247 4 181 0 248 4 181 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 4 185 0 244 4 185 0 245 4 185 0 246 4 185 0 247 4 185 0 248 4 185 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 4 189 0 244 4 189 0 245 4 189 0 246 4 189 0 247 4 189 0 248 4 189 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 198 0 2 0 198 0 3 0 198 0 4 0 103 0 5 0 198 0 6 0 198 0 7 0 127 0 9 0 198 0 10 0 198 0 11 0 198 0 12 0 198 0 13 0 198 0 14 0 131 0 15 0 198 0 16 0 198 0 17 0 198 0 18 1 182 0 19 0 103 0 20 0 198 0 22 0 198 0 23 0 198 0 24 0 103 0 25 0 198 0 26 0 135 0 27 0 198 0 28 0 198 0 29 0 198 0 30 0 198 0 31 0 198 0 32 0 198 0 33 0 198 0 34 0 198 0 35 0 198 0 36 0 127 0 38 0 198 0 39 0 198 0 40 0 198 0 41 0 198 0 65 0 198 0 91 0 198 0 92 0 198 0 93 0 198 0 94 0 198 0 96 0 198 0 97 0 198 0 98 3 249 1 28 0 198 1 39] 
#[1 1 186 0 9 1 186 0 15 1 186 0 19 4 193 0 38] 
#[0 1 190 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 4 197 0 19] 
#[0 1 194 0 19] 
#[0 1 106 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 1 126 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 1 198 0 2 1 198 0 3 1 198 0 5 1 198 0 6 1 198 0 9 1 198 0 10 1 198 0 12 4 49 0 13 1 198 0 15 1 198 0 16 4 53 0 17 1 198 0 22 1 198 0 24 1 198 0 26 1 198 0 27 1 198 0 28 1 198 0 30 1 198 0 32 1 198 0 33 1 198 0 36 1 198 0 39 1 198 0 40 1 198 0 65 1 198 0 91 1 198 0 93 1 198 0 94 1 198 0 96 1 198 0 97 1 198 0 98 1 198 1 39] 
#[0 1 142 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 1 150 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 1 202 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 1 206 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 1 210 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 1 214 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 1 218 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 1 222 0 2 0 139 0 3 1 222 0 5 1 222 0 6 1 222 0 9 0 143 0 10 1 222 0 12 1 222 0 15 1 222 0 16 0 147 0 22 1 222 0 24 1 222 0 26 1 222 0 27 1 222 0 28 1 222 0 30 1 222 0 32 1 222 0 33 1 222 0 36 1 222 0 39 1 222 0 40 1 222 0 65 1 222 0 91 1 222 0 93 1 222 0 94 1 222 0 96 1 222 0 97 1 222 0 98 1 222 1 39] 
#[1 1 226 0 2 1 226 0 3 1 226 0 5 1 226 0 6 1 226 0 9 1 226 0 10 0 151 0 12 1 226 0 15 0 155 0 16 1 226 0 22 1 226 0 24 1 226 0 26 1 226 0 27 1 226 0 28 1 226 0 30 1 226 0 32 1 226 0 33 1 226 0 36 1 226 0 39 1 226 0 40 1 226 0 65 1 226 0 91 1 226 0 93 1 226 0 94 1 226 0 96 1 226 0 97 1 226 0 98 1 226 1 39] 
#[1 1 230 0 2 1 230 0 3 1 230 0 5 1 230 0 6 1 230 0 9 1 230 0 10 1 230 0 12 1 230 0 15 1 230 0 16 1 230 0 22 1 230 0 24 1 230 0 26 1 230 0 27 0 159 0 28 1 230 0 30 1 230 0 32 1 230 0 33 1 230 0 36 1 230 0 39 1 230 0 40 1 230 0 65 1 230 0 91 1 230 0 93 1 230 0 94 1 230 0 96 0 163 0 97 0 167 0 98 1 230 1 39] 
#[1 1 234 0 2 1 234 0 3 1 234 0 5 1 234 0 6 1 234 0 9 1 234 0 10 1 234 0 12 1 234 0 15 1 234 0 16 1 234 0 22 1 234 0 24 1 234 0 26 0 171 0 27 1 234 0 28 0 175 0 30 1 234 0 32 0 179 0 33 1 234 0 36 1 234 0 39 1 234 0 40 0 183 0 65 1 234 0 91 1 234 0 93 1 234 0 94 0 187 0 96 1 234 0 97 1 234 0 98 1 234 1 39] 
#[1 0 191 0 2 1 238 0 3 1 238 0 5 1 238 0 6 1 238 0 9 1 238 0 10 1 238 0 12 1 238 0 15 1 238 0 16 1 238 0 22 1 238 0 24 1 238 0 26 1 238 0 27 1 238 0 28 1 238 0 30 0 195 0 32 1 238 0 33 1 238 0 36 1 238 0 39 1 238 0 40 1 238 0 65 1 238 0 91 1 238 0 93 1 238 0 94 1 238 0 96 1 238 0 97 1 238 0 98 1 238 1 39] 
#[1 1 242 0 2 1 242 0 3 0 199 0 5 1 242 0 6 1 242 0 9 1 242 0 10 1 242 0 12 1 242 0 15 1 242 0 16 1 242 0 22 1 242 0 24 1 242 0 26 1 242 0 27 1 242 0 28 1 242 0 30 1 242 0 32 1 242 0 33 1 242 0 36 1 242 0 39 1 242 0 40 1 242 0 65 1 242 0 91 1 242 0 93 1 242 0 94 1 242 0 96 1 242 0 97 1 242 0 98 1 242 1 39] 
#[1 1 246 0 2 1 246 0 3 1 246 0 5 1 246 0 6 1 246 0 9 1 246 0 10 1 246 0 12 1 246 0 15 1 246 0 16 1 246 0 22 1 246 0 24 1 246 0 26 1 246 0 27 1 246 0 28 1 246 0 30 1 246 0 32 1 246 0 33 1 246 0 36 1 246 0 39 0 203 0 40 1 246 0 65 1 246 0 91 1 246 0 93 1 246 0 94 1 246 0 96 1 246 0 97 1 246 0 98 1 246 1 39] 
#[1 1 250 0 2 1 250 0 3 1 250 0 5 1 250 0 6 1 250 0 9 1 250 0 10 1 250 0 12 1 250 0 15 1 250 0 16 1 250 0 22 1 250 0 24 1 250 0 26 1 250 0 27 1 250 0 28 1 250 0 30 1 250 0 32 1 250 0 33 1 250 0 36 1 250 0 39 1 250 0 40 1 250 0 65 0 207 0 91 1 250 0 93 1 250 0 94 1 250 0 96 1 250 0 97 1 250 0 98 1 250 1 39] 
#[1 1 254 0 2 1 254 0 3 1 254 0 5 0 211 0 6 1 254 0 9 1 254 0 10 1 254 0 12 1 254 0 15 1 254 0 16 1 254 0 22 1 254 0 24 1 254 0 26 1 254 0 27 1 254 0 28 1 254 0 30 1 254 0 32 1 254 0 33 1 254 0 36 1 254 0 39 1 254 0 40 1 254 0 65 1 254 0 91 1 254 0 93 1 254 0 94 1 254 0 96 1 254 0 97 1 254 0 98 1 254 1 39] 
#[1 2 2 0 2 2 2 0 3 2 2 0 5 2 2 0 6 2 2 0 9 2 2 0 10 2 2 0 12 2 2 0 15 2 2 0 16 2 2 0 22 2 2 0 24 2 2 0 26 2 2 0 27 2 2 0 28 2 2 0 30 2 2 0 32 2 2 0 33 0 215 0 36 2 2 0 39 2 2 0 40 2 2 0 65 2 2 0 91 0 219 0 93 2 2 0 94 2 2 0 96 2 2 0 97 2 2 0 98 2 2 1 39] 
#[0 2 6 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 2 10 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 0 223 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 0 0 1 39] 
#[0 0 0 1 39] 
#[1 5 29 0 105 5 33 1 24 5 37 1 25] 
#[1 2 189 0 27 0 185 0 37 0 37 0 42 0 22 0 44 0 22 0 46 0 22 0 49 0 22 0 54 0 49 0 58 0 22 0 60 0 22 0 66 0 22 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 22 0 76 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 0 22 0 105 3 85 0 134 3 85 1 11 5 41 1 23] 
#[0 0 0 1 39] 
#[1 5 45 0 26 1 29 0 90 5 49 0 157 5 49 0 182] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 1 21 0 87 2 213 0 105 5 57 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 5 57 0 117 5 57 0 118 5 57 0 121 5 61 0 151 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 0 54 0 27 0 54 0 37 0 54 0 42 0 54 0 44 0 54 0 46 0 54 0 49 0 54 0 50 0 54 0 54 0 54 0 56 0 54 0 58 0 54 0 60 0 54 0 66 0 54 0 67 0 54 0 68 0 54 0 69 0 54 0 72 0 54 0 73 0 54 0 74 0 54 0 76 0 54 0 77 0 54 0 78 0 54 0 81 0 54 0 85 0 54 0 87 0 54 0 88 1 29 0 90 0 54 0 105 5 65 0 182] 
#[1 0 18 0 2 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 8 0 18 0 9 0 18 0 10 0 18 0 12 0 18 0 15 0 18 0 16 0 18 0 20 0 18 0 21 0 18 0 22 0 18 0 24 0 18 0 26 0 227 0 27 0 18 0 28 0 18 0 30 0 18 0 32 0 18 0 33 0 18 0 36 0 18 0 38 0 18 0 39 0 18 0 40 0 18 0 52 0 18 0 63 0 18 0 65 0 18 0 90 0 18 0 91 0 18 0 93 0 18 0 94 0 18 0 96 0 18 0 97 0 18 0 98 0 18 0 105 3 249 1 28 0 18 1 39] 
#[1 5 69 0 105 5 73 0 144 5 77 0 145 5 77 0 146 5 85 0 147] 
#[1 0 206 0 5 0 206 0 15 0 206 0 21 4 5 0 38 0 206 0 91 0 206 0 96 0 206 0 105 4 9 0 236 4 13 0 237] 
#[0 0 222 0 5 0 15 0 21 0 91 0 96 0 105] 
#[0 2 22 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 2 189 0 27 3 69 0 37 0 37 0 42 0 59 0 44 0 63 0 46 0 67 0 49 3 73 0 50 0 71 0 54 3 77 0 56 0 49 0 58 0 75 0 60 0 79 0 66 3 81 0 67 0 83 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 87 0 76 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 0 91 0 105 5 89 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 5 89 0 117 5 89 0 118 5 89 0 121 3 85 0 134 5 93 0 160 3 85 1 11 5 97 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 0 0 1 39] 
#[0 2 26 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 2 30 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 2 34 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 2 38 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 2 42 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 5 101 0 84 5 105 0 90 5 109 0 155 5 113 0 161] 
#[0 2 46 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 1 21 0 87 3 105 0 105 5 57 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 5 57 0 117 5 57 0 118 5 57 0 121 5 117 0 123 5 61 0 151 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 5 121 0 105] 
#[0 0 198 0 8 0 9 0 15 0 20 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 5 125 0 8 2 50 0 9 2 50 0 15 5 129 0 20 2 50 0 26 2 50 0 27 2 50 0 37 2 50 0 42 2 50 0 44 2 50 0 46 2 50 0 49 2 50 0 50 2 50 0 52 2 50 0 54 2 50 0 56 2 50 0 58 2 50 0 60 2 50 0 66 2 50 0 67 2 50 0 68 2 50 0 69 2 50 0 71 2 50 0 72 2 50 0 73 2 50 0 74 2 50 0 76 2 50 0 77 2 50 0 78 2 50 0 81 2 50 0 85 2 50 0 87 2 50 0 88 2 50 0 94 2 50 0 105] 
#[1 2 189 0 27 0 22 0 57 0 22 0 63 0 22 0 90 5 133 1 23] 
#[1 5 137 0 63 5 141 0 90 5 145 0 137 5 149 1 19] 
#[1 3 21 0 105 5 153 0 122 5 153 0 123 5 153 0 124] 
#[1 5 157 0 20 5 161 0 26] 
#[1 2 189 0 27 0 22 0 57 0 22 0 90 5 165 1 23] 
#[1 0 29 0 26 0 33 0 37 0 37 0 42 0 41 0 50 0 45 0 56 0 49 0 58 0 57 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 3 57 0 132 0 133 0 133 0 137 0 134 3 57 0 135 3 57 0 163 3 57 0 164 0 137 1 11 3 57 1 18 2 54 1 39] 
#[0 2 58 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[0 2 62 0 26 0 37 0 42 0 50 0 56 0 58 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[1 0 29 0 26 0 33 0 37 0 37 0 42 0 41 0 50 0 45 0 56 0 49 0 58 0 53 0 64 0 57 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 5 169 0 127 3 53 0 129 3 53 0 130 3 53 0 131 0 129 0 132 0 133 0 133 0 137 0 134 0 129 0 135 0 129 0 163 0 129 0 164 0 137 1 11 0 129 1 18 2 66 1 39] 
#[1 0 29 0 26 0 33 0 37 0 37 0 42 0 41 0 50 0 45 0 56 0 49 0 58 0 57 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 3 57 0 132 0 133 0 133 0 137 0 134 3 57 0 135 3 57 0 163 3 57 0 164 0 137 1 11 3 57 1 18 2 70 1 39] 
#[1 5 173 0 67 3 21 0 105 3 25 0 122 3 25 0 123 3 25 0 124] 
#[0 5 177 0 105] 
#[0 5 181 0 105] 
#[0 5 185 0 105] 
#[0 2 74 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[1 3 21 0 105 5 189 0 122 5 189 0 123 5 189 0 124] 
#[0 2 78 0 37 0 71 0 105] 
#[0 5 193 0 9] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 4 153 0 113 4 153 0 114 4 153 0 115 4 153 0 116 4 157 0 117 4 157 0 118 4 157 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 3 97 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 3 97 1 3 3 97 1 4 2 177 1 5 2 17 1 6 3 97 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 198 0 2 0 198 0 3 0 198 0 4 0 198 0 5 0 198 0 6 0 198 0 7 0 198 0 8 0 198 0 9 0 198 0 10 0 198 0 11 0 198 0 12 0 198 0 13 0 198 0 14 0 198 0 15 0 198 0 16 0 198 0 17 0 198 0 18 0 103 0 20 0 198 0 22 0 198 0 23 0 198 0 24 0 103 0 25 0 198 0 26 0 135 0 27 0 198 0 28 0 198 0 29 0 198 0 30 0 198 0 31 0 198 0 32 0 198 0 33 0 198 0 34 0 198 0 35 0 198 0 36 0 103 0 38 0 198 0 39 0 198 0 40 0 198 0 41 0 198 0 65 0 198 0 91 0 198 0 92 0 198 0 93 0 198 0 94 0 198 0 96 0 198 0 97 0 198 0 98 0 18 0 105 3 249 1 28 0 198 1 39] 
#[0 2 82 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 2 14 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 2 86 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 2 90 0 15 5 197 0 57 5 201 0 79 2 90 0 96 5 205 1 31] 
#[0 2 94 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 2 98 0 15 0 96] 
#[1 5 209 0 15 5 213 0 96] 
#[0 2 102 0 15 0 96] 
#[1 5 217 0 24 5 221 0 26] 
#[0 2 106 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 5 225 0 26] 
#[0 2 110 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 5 229 0 26] 
#[0 3 209 0 8] 
#[0 5 233 0 89] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 5 237 0 26 0 181 0 27 0 14 0 37 0 15 0 44 0 19 0 46 0 23 0 49 0 27 0 54 0 14 0 58 0 35 0 60 0 39 0 66 0 43 0 68 0 241 0 70 0 47 0 76 0 253 0 79 1 9 0 82 1 21 0 87 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 231 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 5 249 0 186 5 245 0 192 5 249 0 204 5 253 0 206 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 5 245 0 245 5 245 0 246 5 245 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 6 1 1 36 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 6 5 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 6 5 1 3 6 5 1 4 2 177 1 5 2 17 1 6 6 5 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 6 9 0 38 6 13 0 234 6 17 0 235 6 21 0 236 4 13 0 237] 
#[1 2 114 0 8 6 9 0 38 6 25 0 234 6 17 0 235 6 29 0 236 4 13 0 237] 
#[0 6 33 0 8] 
#[1 1 166 0 8 1 166 0 9 1 166 0 15 4 113 0 20 1 166 0 26 1 166 0 38 1 166 0 52 1 166 0 63 1 166 0 90] 
#[0 2 118 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 37 0 26] 
#[1 0 181 0 27 0 235 0 105 6 45 1 28] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 6 49 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 6 49 1 3 6 49 1 4 2 177 1 5 2 17 1 6 6 49 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 6 53 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 6 53 1 3 6 53 1 4 2 177 1 5 2 17 1 6 6 53 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 6 57 0 26] 
#[1 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 6 61 0 214 6 65 0 215 6 69 1 36] 
#[1 6 73 0 48 6 77 0 59 6 81 0 216 6 85 0 217 6 89 0 220] 
#[1 1 29 0 90 6 93 0 182] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 6 97 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 6 97 1 3 6 97 1 4 2 177 1 5 2 17 1 6 6 97 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 2 122 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 37 0 39 0 40 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 0 23 0 49 0 41 0 50 0 209 0 51 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 0 253 0 79 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 6 101 0 94 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 6 105 0 135 1 117 0 151 6 105 0 163 6 105 0 182 6 105 0 184 6 105 0 185 1 137 0 186 6 105 0 187 6 105 0 188 6 105 0 189 6 105 0 190 6 105 0 191 1 161 0 192 6 105 0 193 6 105 0 194 6 105 0 195 6 105 0 201 6 105 0 202 6 105 0 203 6 105 0 207 6 105 0 208 6 105 0 209 6 105 0 210 6 105 0 211 6 105 0 212 6 105 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 6 105 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 6 105 1 35 2 41 1 36 2 45 1 38] 
#[0 2 126 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 6 109 0 182 6 109 0 187 6 109 0 188 6 109 0 189 6 109 0 190 6 109 0 191 1 161 0 192 6 109 0 193 6 109 0 194 6 109 0 195 6 109 0 201 6 109 0 202 6 109 0 203 6 109 0 207 6 109 0 208 6 109 0 209 6 109 0 210 6 109 0 211 6 109 0 212 6 109 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 6 109 1 35 2 45 1 38] 
#[0 2 130 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 6 113 0 50] 
#[0 6 117 0 50] 
#[0 6 121 0 39] 
#[1 2 134 0 2 2 134 0 3 2 134 0 5 2 134 0 6 2 134 0 9 2 134 0 10 2 134 0 12 2 134 0 15 2 134 0 16 2 134 0 20 2 134 0 21 2 134 0 22 2 134 0 24 2 134 0 25 2 134 0 26 2 134 0 27 2 134 0 28 2 134 0 30 2 134 0 32 2 134 0 33 2 134 0 36 4 5 0 38 2 134 0 39 2 134 0 40 2 134 0 65 2 134 0 91 2 134 0 93 2 134 0 94 2 134 0 96 2 134 0 97 2 134 0 98 2 134 0 105 6 125 0 237 2 134 1 39] 
#[0 2 138 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 6 129 0 70] 
#[1 6 133 0 79 6 137 0 82 6 141 0 105] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 6 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 6 145 1 3 6 145 1 4 2 177 1 5 2 17 1 6 6 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 6 149 0 50] 
#[0 2 142 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 2 146 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 153 0 105] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 6 157 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 6 157 1 3 6 157 1 4 2 177 1 5 2 17 1 6 6 157 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 2 150 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 2 154 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 2 158 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 162 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 170 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 174 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 178 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 182 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 186 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 190 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 194 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 198 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 202 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 6 161 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 6 161 1 3 6 161 1 4 2 177 1 5 2 17 1 6 6 161 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 6 165 0 8] 
#[0 6 169 0 105] 
#[1 2 206 0 2 2 206 0 3 2 206 0 5 2 206 0 6 2 206 0 9 2 206 0 10 2 206 0 12 2 206 0 15 2 206 0 16 2 206 0 20 2 206 0 21 2 206 0 22 2 206 0 24 2 206 0 25 2 206 0 26 2 206 0 27 2 206 0 28 2 206 0 30 2 206 0 32 2 206 0 33 2 206 0 36 4 5 0 38 2 206 0 39 2 206 0 40 2 206 0 65 2 206 0 91 2 206 0 93 2 206 0 94 2 206 0 96 2 206 0 97 2 206 0 98 2 206 0 105 6 125 0 237 2 206 1 39] 
#[0 2 210 0 37 0 44 0 46 0 49 0 54 0 58 0 60 0 66 0 68 0 76 0 105] 
#[1 5 69 0 105 6 173 0 144 5 77 0 145 5 77 0 146 5 85 0 147] 
#[0 2 214 0 37 0 44 0 46 0 49 0 54 0 58 0 60 0 66 0 68 0 76 0 105] 
#[0 2 218 0 37 0 44 0 46 0 49 0 54 0 58 0 60 0 66 0 68 0 76 0 105] 
#[1 0 181 0 27 6 177 0 70 0 18 0 105 6 181 1 28] 
#[0 6 185 0 105] 
#[0 2 222 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 2 226 0 19] 
#[1 6 189 0 9 0 107 0 20 4 5 0 38 4 9 0 236 4 13 0 237] 
#[1 6 193 0 5 6 197 0 9 0 222 0 20 4 17 0 25] 
#[0 2 230 0 9 0 15] 
#[1 6 201 0 9 6 205 0 15] 
#[0 2 234 0 9 0 15] 
#[1 2 238 0 9 2 238 0 15 1 194 0 19] 
#[1 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 4 121 0 58 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 6 209 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 6 209 0 117 6 209 0 118 6 209 0 121 4 133 1 11 2 25 1 32 2 25 1 33 2 25 1 34 4 133 1 37] 
#[0 2 242 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 2 246 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 2 250 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 6 213 0 39] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 1 29 0 90 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 6 221 0 182 1 217 0 222 1 221 0 223 6 221 0 224 2 81 0 225 2 85 0 228 6 221 0 229 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 6 221 1 3 6 221 1 4 2 177 1 5 2 17 1 6 6 221 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 6 229 0 244 6 229 0 245 6 229 0 246 6 229 0 247 6 229 0 248 6 229 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 6 233 0 244 6 233 0 245 6 233 0 246 6 233 0 247 6 233 0 248 6 233 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 6 237 0 244 6 237 0 245 6 237 0 246 6 237 0 247 6 237 0 248 6 237 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 6 241 0 244 6 241 0 245 6 241 0 246 6 241 0 247 6 241 0 248 6 241 0 249 6 241 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 6 245 0 244 6 245 0 245 6 245 0 246 6 245 0 247 6 245 0 248 6 245 0 249 6 245 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 6 249 0 250 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 6 253 0 250 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 7 1 0 250 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 7 5 0 251 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 7 9 0 251 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 7 13 0 251 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 7 17 0 113 7 17 0 114 7 17 0 115 7 17 0 116 7 21 0 117 7 21 0 118 7 21 0 121 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 7 25 0 251 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 7 29 0 252 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 7 33 0 252 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 7 37 0 253 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 7 41 0 254 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 7 45 0 255 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 7 49 1 0 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 7 53 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 7 53 1 3 7 53 1 4 2 177 1 5 2 17 1 6 7 53 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 7 57 1 1 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 254 0 15 7 61 0 57 2 254 0 96] 
#[1 7 65 0 15 7 69 0 96] 
#[0 3 2 0 15 0 96] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 1 21 0 87 2 213 0 105 7 73 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 7 73 0 117 7 73 0 118 7 73 0 121 7 77 0 151 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 3 6 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 3 10 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 3 14 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 7 81 0 105 7 85 0 152] 
#[1 7 81 0 105 7 89 0 152] 
#[0 3 18 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 1 182 0 9 0 15 0 24 0 26 0 31 0 38] 
#[1 7 93 0 15 7 97 0 26] 
#[0 3 22 0 15 0 26] 
#[0 3 26 0 15 0 26] 
#[1 3 30 0 15 3 30 0 26 7 101 0 31 4 193 0 38] 
#[1 5 69 0 105 7 105 0 144 5 77 0 145 5 77 0 146 5 85 0 147] 
#[1 5 101 0 84 5 105 0 90 7 109 0 155 7 113 0 161] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 1 21 0 87 3 105 0 105 7 73 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 7 73 0 117 7 73 0 118 7 73 0 121 5 117 0 123 7 77 0 151 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 2 213 0 105 7 121 0 118 7 121 0 119 7 125 0 156 3 189 1 32 3 189 1 33 3 189 1 34] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 0 23 0 49 0 41 0 50 0 209 0 51 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 7 129 0 79 1 1 0 80 1 5 0 81 7 133 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 7 137 0 94 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 3 241 0 135 1 117 0 151 7 141 0 162 3 241 0 163 3 241 0 182 7 145 0 183 3 241 0 184 3 241 0 185 1 137 0 186 3 241 0 187 3 241 0 188 3 241 0 189 3 241 0 190 3 241 0 191 1 161 0 192 3 241 0 193 3 241 0 194 3 241 0 195 3 241 0 201 3 241 0 202 3 241 0 203 3 241 0 207 3 241 0 208 3 241 0 209 3 241 0 210 3 241 0 211 3 241 0 212 3 241 0 221 7 149 0 222 1 221 0 223 1 221 0 230 1 229 0 231 7 149 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 3 241 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 3 241 1 35 2 41 1 36 2 45 1 38] 
#[1 5 105 0 90 7 153 0 161] 
#[0 3 34 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 7 157 0 8] 
#[1 7 161 0 90 7 165 0 165] 
#[1 2 49 0 1 3 101 0 8 3 38 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 7 169 0 90 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 239 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 7 197 1 3 2 129 1 5 2 17 1 6 7 197 1 11 7 185 1 12 7 189 1 13 7 193 1 14 7 197 1 15 7 197 1 16 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 6 141 0 105] 
#[1 7 205 0 57 5 137 0 63 7 209 0 90 7 213 0 136 7 217 0 137 7 221 0 139] 
#[1 2 213 0 105 7 229 0 118 7 229 0 120 7 233 0 138 3 189 1 32 3 189 1 33 3 189 1 34] 
#[1 7 237 0 15 7 241 0 26 0 6 0 37 7 245 0 94 0 6 0 105 7 249 1 10 7 253 1 20 8 1 1 21 8 5 1 22] 
#[1 5 141 0 90 8 9 1 19] 
#[0 3 42 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 8 13 0 20 8 17 0 26] 
#[1 8 21 0 10 6 141 0 105] 
#[0 3 46 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[1 8 25 0 57 8 29 0 90 8 33 0 169 8 37 0 170] 
#[1 0 29 0 26 0 33 0 37 0 37 0 42 0 41 0 50 0 45 0 56 0 49 0 58 0 57 0 67 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 93 0 88 3 57 0 132 0 133 0 133 0 137 0 134 3 57 0 135 3 57 0 163 3 57 0 164 0 137 1 11 3 57 1 18 3 50 1 39] 
#[0 8 41 0 105] 
#[1 2 189 0 27 0 22 0 57 0 22 0 63 0 22 0 90 8 45 1 23] 
#[1 5 137 0 63 5 141 0 90 8 49 0 137 8 53 1 19] 
#[1 2 189 0 27 0 22 0 57 0 22 0 90 8 57 1 23] 
#[1 5 129 0 20 8 61 0 26] 
#[0 3 54 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 8 65 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 8 65 0 117 8 65 0 118 8 65 0 121 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 8 69 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 8 69 0 117 8 69 0 118 8 69 0 121 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 3 58 0 15 0 96] 
#[1 3 121 0 36 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 3 129 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 3 129 0 117 3 129 0 118 3 129 0 121 8 73 1 30 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 3 62 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 77 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 77 1 3 8 77 1 4 2 177 1 5 2 17 1 6 8 77 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 3 66 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 3 70 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 3 74 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 8 81 0 8] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 8 85 0 26 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 89 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 89 1 3 8 89 1 4 2 177 1 5 2 17 1 6 8 89 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 3 78 0 26] 
#[0 3 82 0 9 0 15 0 26] 
#[0 8 93 0 26] 
#[1 8 97 0 15 3 86 0 26] 
#[1 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 4 121 0 58 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 8 101 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 8 101 0 117 8 101 0 118 8 101 0 121 4 133 1 11 2 25 1 32 2 25 1 33 2 25 1 34 4 133 1 37] 
#[0 8 105 0 9] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 6 121 0 39 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 109 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 109 1 3 8 109 1 4 2 177 1 5 2 17 1 6 8 109 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 3 90 0 2 3 90 0 3 3 90 0 5 3 90 0 6 3 90 0 9 3 90 0 10 3 90 0 12 3 90 0 13 3 90 0 15 3 90 0 16 3 90 0 17 3 90 0 20 3 90 0 22 3 90 0 24 3 90 0 25 3 90 0 26 3 90 0 27 3 90 0 28 3 90 0 30 3 90 0 32 3 90 0 33 3 90 0 36 6 9 0 38 3 90 0 39 3 90 0 40 3 90 0 65 3 90 0 91 3 90 0 93 3 90 0 94 3 90 0 96 3 90 0 97 3 90 0 98 8 113 0 235 8 117 0 236 4 13 0 237 3 90 1 39] 
#[0 3 94 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 4 5 0 38 8 121 0 90 8 125 0 180 6 125 0 237] 
#[1 3 98 0 2 3 98 0 3 3 98 0 5 3 98 0 6 3 98 0 9 3 98 0 10 3 98 0 12 3 98 0 13 3 98 0 15 3 98 0 16 3 98 0 17 3 98 0 20 3 98 0 22 3 98 0 24 3 98 0 25 3 98 0 26 3 98 0 27 3 98 0 28 3 98 0 30 3 98 0 32 3 98 0 33 3 98 0 36 6 9 0 38 3 98 0 39 3 98 0 40 3 98 0 65 3 98 0 91 3 98 0 93 3 98 0 94 3 98 0 96 3 98 0 97 3 98 0 98 8 113 0 235 8 129 0 236 4 13 0 237 3 98 1 39] 
#[1 4 5 0 38 8 121 0 90 8 133 0 180 6 125 0 237] 
#[1 2 49 0 1 2 53 0 8 8 137 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 8 141 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 3 102 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 3 106 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 8 149 0 105] 
#[0 8 153 0 9] 
#[0 8 157 0 9] 
#[0 3 110 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 8 161 0 9 8 165 0 26] 
#[0 3 114 0 9 0 26] 
#[1 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 4 121 0 58 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 8 169 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 8 169 0 117 8 169 0 118 8 169 0 121 4 133 1 11 2 25 1 32 2 25 1 33 2 25 1 34 4 133 1 37] 
#[0 8 173 0 8] 
#[1 1 29 0 90 8 177 0 182] 
#[1 3 118 0 8 3 118 0 13 3 118 0 17 3 118 0 26 3 118 0 27 3 118 0 37 3 118 0 42 3 118 0 43 3 118 0 44 3 118 0 45 3 118 0 46 3 118 0 47 6 73 0 48 3 118 0 49 3 118 0 50 3 118 0 51 3 118 0 52 3 118 0 53 3 118 0 54 3 118 0 55 3 118 0 56 3 118 0 58 6 77 0 59 3 118 0 60 3 118 0 61 3 118 0 62 3 118 0 66 3 118 0 67 3 118 0 68 3 118 0 69 3 118 0 70 3 118 0 72 3 118 0 73 3 118 0 74 3 118 0 75 3 118 0 76 3 118 0 77 3 118 0 78 3 118 0 79 3 118 0 80 3 118 0 81 3 118 0 82 3 118 0 83 3 118 0 85 3 118 0 86 3 118 0 87 3 118 0 88 3 118 0 89 3 118 0 90 3 118 0 94 3 118 0 99 3 118 0 100 3 118 0 101 3 118 0 102 3 118 0 103 3 118 0 104 3 118 0 105 8 181 0 217 8 185 0 220 3 118 1 39] 
#[0 3 122 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 3 126 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 3 130 0 8 3 130 0 13 3 130 0 17 3 130 0 26 3 130 0 27 3 130 0 37 3 130 0 42 3 130 0 43 3 130 0 44 3 130 0 45 3 130 0 46 3 130 0 47 6 73 0 48 3 130 0 49 3 130 0 50 3 130 0 51 3 130 0 52 3 130 0 53 3 130 0 54 3 130 0 55 3 130 0 56 3 130 0 58 6 77 0 59 3 130 0 60 3 130 0 61 3 130 0 62 3 130 0 66 3 130 0 67 3 130 0 68 3 130 0 69 3 130 0 70 3 130 0 72 3 130 0 73 3 130 0 74 3 130 0 75 3 130 0 76 3 130 0 77 3 130 0 78 3 130 0 79 3 130 0 80 3 130 0 81 3 130 0 82 3 130 0 83 3 130 0 85 3 130 0 86 3 130 0 87 3 130 0 88 3 130 0 89 3 130 0 90 3 130 0 94 3 130 0 99 3 130 0 100 3 130 0 101 3 130 0 102 3 130 0 103 3 130 0 104 3 130 0 105 8 189 0 216 6 85 0 217 8 193 0 220 3 130 1 39] 
#[0 8 197 0 9] 
#[0 3 134 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 37 0 39 0 40 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 3 138 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 3 142 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 3 146 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 150 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 154 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 3 158 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 3 162 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 8 201 0 20] 
#[0 3 166 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 170 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 65 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 91 0 92 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 8 205 0 39] 
#[0 3 174 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 178 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 8 209 0 39] 
#[0 3 182 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 2 49 0 1 2 53 0 8 8 213 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 8 217 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 18 0 2 0 18 0 3 0 18 0 5 0 18 0 6 0 18 0 8 0 18 0 9 0 18 0 10 0 18 0 12 0 18 0 15 0 18 0 16 0 18 0 20 0 18 0 21 0 18 0 22 0 18 0 24 0 18 0 25 0 18 0 26 0 227 0 27 0 18 0 28 0 18 0 30 0 18 0 32 0 18 0 33 0 18 0 36 0 18 0 38 0 18 0 39 0 18 0 40 0 18 0 52 0 18 0 63 0 18 0 65 0 18 0 90 0 18 0 91 0 18 0 93 0 18 0 94 0 18 0 96 0 18 0 97 0 18 0 98 0 18 0 105 8 221 1 28 0 18 1 39] 
#[1 7 93 0 15 3 186 0 26] 
#[1 0 181 0 27 0 18 0 105 8 225 1 28] 
#[0 8 229 0 105] 
#[0 3 190 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 8 233 0 244 8 233 0 245 8 233 0 246 8 233 0 247 8 233 0 248 8 233 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 213 0 105 8 237 0 118 8 237 0 120 3 189 1 32 3 189 1 33 3 189 1 34] 
#[1 2 49 0 1 2 53 0 8 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 8 241 0 122 8 241 0 123 8 241 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 245 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 221 0 238 1 221 0 239 1 221 0 240 2 97 0 241 2 97 0 242 2 97 0 243 9 1 0 247 9 1 0 248 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 3 194 0 19] 
#[1 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 243 0 105 2 73 0 147 9 5 0 154 9 5 0 227 9 5 0 228 4 177 1 36] 
#[1 9 13 0 21 5 69 0 105 9 17 0 147] 
#[0 3 198 0 9 0 15 0 19 0 24 0 26 0 31 0 38] 
#[0 3 202 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 206 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 210 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 214 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 218 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 3 222 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 3 226 0 2 0 247 0 3 3 226 0 5 3 226 0 6 3 226 0 9 0 251 0 10 3 226 0 12 3 226 0 15 3 226 0 16 0 255 0 22 3 226 0 24 3 226 0 26 3 226 0 27 3 226 0 28 3 226 0 30 3 226 0 32 3 226 0 33 3 226 0 36 3 226 0 39 3 226 0 40 3 226 0 65 3 226 0 91 3 226 0 93 3 226 0 94 3 226 0 96 3 226 0 97 3 226 0 98 3 226 1 39] 
#[1 3 230 0 2 1 3 0 3 3 230 0 5 3 230 0 6 3 230 0 9 1 7 0 10 3 230 0 12 3 230 0 15 3 230 0 16 1 11 0 22 3 230 0 24 3 230 0 26 3 230 0 27 3 230 0 28 3 230 0 30 3 230 0 32 3 230 0 33 3 230 0 36 3 230 0 39 3 230 0 40 3 230 0 65 3 230 0 91 3 230 0 93 3 230 0 94 3 230 0 96 3 230 0 97 3 230 0 98 3 230 1 39] 
#[1 3 234 0 2 3 234 0 3 3 234 0 5 3 234 0 6 3 234 0 9 3 234 0 10 1 15 0 12 3 234 0 15 1 19 0 16 3 234 0 22 3 234 0 24 3 234 0 26 3 234 0 27 3 234 0 28 3 234 0 30 3 234 0 32 3 234 0 33 3 234 0 36 3 234 0 39 3 234 0 40 3 234 0 65 3 234 0 91 3 234 0 93 3 234 0 94 3 234 0 96 3 234 0 97 3 234 0 98 3 234 1 39] 
#[1 3 238 0 2 3 238 0 3 3 238 0 5 3 238 0 6 3 238 0 9 3 238 0 10 1 23 0 12 3 238 0 15 1 27 0 16 3 238 0 22 3 238 0 24 3 238 0 26 3 238 0 27 3 238 0 28 3 238 0 30 3 238 0 32 3 238 0 33 3 238 0 36 3 238 0 39 3 238 0 40 3 238 0 65 3 238 0 91 3 238 0 93 3 238 0 94 3 238 0 96 3 238 0 97 3 238 0 98 3 238 1 39] 
#[1 3 242 0 2 3 242 0 3 3 242 0 5 3 242 0 6 3 242 0 9 3 242 0 10 1 31 0 12 3 242 0 15 1 35 0 16 3 242 0 22 3 242 0 24 3 242 0 26 3 242 0 27 3 242 0 28 3 242 0 30 3 242 0 32 3 242 0 33 3 242 0 36 3 242 0 39 3 242 0 40 3 242 0 65 3 242 0 91 3 242 0 93 3 242 0 94 3 242 0 96 3 242 0 97 3 242 0 98 3 242 1 39] 
#[1 3 246 0 2 3 246 0 3 3 246 0 5 3 246 0 6 3 246 0 9 3 246 0 10 3 246 0 12 3 246 0 15 3 246 0 16 3 246 0 22 3 246 0 24 3 246 0 26 3 246 0 27 1 39 0 28 3 246 0 30 3 246 0 32 3 246 0 33 3 246 0 36 3 246 0 39 3 246 0 40 3 246 0 65 3 246 0 91 3 246 0 93 3 246 0 94 3 246 0 96 1 43 0 97 1 47 0 98 3 246 1 39] 
#[1 3 250 0 2 3 250 0 3 3 250 0 5 3 250 0 6 3 250 0 9 3 250 0 10 3 250 0 12 3 250 0 15 3 250 0 16 3 250 0 22 3 250 0 24 3 250 0 26 3 250 0 27 1 51 0 28 3 250 0 30 3 250 0 32 3 250 0 33 3 250 0 36 3 250 0 39 3 250 0 40 3 250 0 65 3 250 0 91 3 250 0 93 3 250 0 94 3 250 0 96 1 55 0 97 1 59 0 98 3 250 1 39] 
#[1 3 254 0 2 3 254 0 3 3 254 0 5 3 254 0 6 3 254 0 9 3 254 0 10 3 254 0 12 3 254 0 15 3 254 0 16 3 254 0 22 3 254 0 24 3 254 0 26 3 254 0 27 1 63 0 28 3 254 0 30 3 254 0 32 3 254 0 33 3 254 0 36 3 254 0 39 3 254 0 40 3 254 0 65 3 254 0 91 3 254 0 93 3 254 0 94 3 254 0 96 1 67 0 97 1 71 0 98 3 254 1 39] 
#[1 4 5 0 38 4 9 0 236 4 13 0 237] 
#[0 4 2 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 4 6 0 2 4 6 0 3 4 6 0 5 4 6 0 6 4 6 0 9 4 6 0 10 4 6 0 12 4 6 0 15 4 6 0 16 4 6 0 22 4 6 0 24 4 6 0 26 4 6 0 27 1 75 0 28 4 6 0 30 4 6 0 32 4 6 0 33 4 6 0 36 4 6 0 39 4 6 0 40 4 6 0 65 4 6 0 91 4 6 0 93 4 6 0 94 4 6 0 96 1 79 0 97 1 83 0 98 4 6 1 39] 
#[1 4 10 0 2 4 10 0 3 4 10 0 5 4 10 0 6 4 10 0 9 4 10 0 10 4 10 0 12 4 10 0 15 4 10 0 16 4 10 0 22 4 10 0 24 4 10 0 26 1 87 0 27 4 10 0 28 1 91 0 30 4 10 0 32 1 95 0 33 4 10 0 36 4 10 0 39 4 10 0 40 1 99 0 65 4 10 0 91 4 10 0 93 4 10 0 94 1 103 0 96 4 10 0 97 4 10 0 98 4 10 1 39] 
#[1 4 14 0 2 4 14 0 3 4 14 0 5 4 14 0 6 4 14 0 9 4 14 0 10 4 14 0 12 4 14 0 15 4 14 0 16 4 14 0 22 4 14 0 24 4 14 0 26 1 107 0 27 4 14 0 28 1 111 0 30 4 14 0 32 1 115 0 33 4 14 0 36 4 14 0 39 4 14 0 40 1 119 0 65 4 14 0 91 4 14 0 93 4 14 0 94 1 123 0 96 4 14 0 97 4 14 0 98 4 14 1 39] 
#[1 1 127 0 2 4 18 0 3 4 18 0 5 4 18 0 6 4 18 0 9 4 18 0 10 4 18 0 12 4 18 0 15 4 18 0 16 4 18 0 22 4 18 0 24 4 18 0 26 4 18 0 27 4 18 0 28 4 18 0 30 1 131 0 32 4 18 0 33 4 18 0 36 4 18 0 39 4 18 0 40 4 18 0 65 4 18 0 91 4 18 0 93 4 18 0 94 4 18 0 96 4 18 0 97 4 18 0 98 4 18 1 39] 
#[1 4 22 0 2 4 22 0 3 1 135 0 5 4 22 0 6 4 22 0 9 4 22 0 10 4 22 0 12 4 22 0 15 4 22 0 16 4 22 0 22 4 22 0 24 4 22 0 26 4 22 0 27 4 22 0 28 4 22 0 30 4 22 0 32 4 22 0 33 4 22 0 36 4 22 0 39 4 22 0 40 4 22 0 65 4 22 0 91 4 22 0 93 4 22 0 94 4 22 0 96 4 22 0 97 4 22 0 98 4 22 1 39] 
#[1 4 26 0 2 4 26 0 3 4 26 0 5 4 26 0 6 4 26 0 9 4 26 0 10 4 26 0 12 4 26 0 15 4 26 0 16 4 26 0 22 4 26 0 24 4 26 0 26 4 26 0 27 4 26 0 28 4 26 0 30 4 26 0 32 4 26 0 33 4 26 0 36 4 26 0 39 1 139 0 40 4 26 0 65 4 26 0 91 4 26 0 93 4 26 0 94 4 26 0 96 4 26 0 97 4 26 0 98 4 26 1 39] 
#[1 4 30 0 2 4 30 0 3 4 30 0 5 4 30 0 6 4 30 0 9 4 30 0 10 4 30 0 12 4 30 0 15 4 30 0 16 4 30 0 22 4 30 0 24 4 30 0 26 4 30 0 27 4 30 0 28 4 30 0 30 4 30 0 32 4 30 0 33 4 30 0 36 4 30 0 39 4 30 0 40 4 30 0 65 1 143 0 91 4 30 0 93 4 30 0 94 4 30 0 96 4 30 0 97 4 30 0 98 4 30 1 39] 
#[0 9 21 0 24] 
#[1 4 34 0 2 4 34 0 3 4 34 0 5 1 147 0 6 4 34 0 9 4 34 0 10 4 34 0 12 4 34 0 15 4 34 0 16 4 34 0 22 4 34 0 24 4 34 0 26 4 34 0 27 4 34 0 28 4 34 0 30 4 34 0 32 4 34 0 33 4 34 0 36 4 34 0 39 4 34 0 40 4 34 0 65 4 34 0 91 4 34 0 93 4 34 0 94 4 34 0 96 4 34 0 97 4 34 0 98 4 34 1 39] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 9 25 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 9 25 0 117 9 25 0 118 9 25 0 121 9 29 1 26 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 5 29 0 105 9 33 1 25] 
#[0 4 38 0 44 0 46 0 49 0 54 0 57 0 60 0 63 0 66 0 68 0 76 0 87 0 90 0 105] 
#[1 7 81 0 105 9 37 0 152] 
#[1 7 81 0 105 9 41 0 152] 
#[0 9 45 0 8] 
#[1 4 42 0 26 9 49 0 38 4 42 0 52 5 101 0 84 4 42 0 90 9 53 0 155] 
#[1 4 46 0 26 9 49 0 38 4 46 0 52 5 101 0 84 4 46 0 90 9 57 0 155] 
#[1 5 69 0 105 9 61 0 145 9 61 0 146 5 85 0 147] 
#[0 4 50 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 8 121 0 90 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 9 65 0 148 1 117 0 151 9 65 0 180 1 217 0 222 1 221 0 223 9 65 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 9 65 1 3 9 65 1 4 2 177 1 5 2 17 1 6 9 65 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 7 93 0 15 9 77 0 26] 
#[1 5 105 0 90 9 81 0 161] 
#[0 4 54 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 2 114 0 15 0 26 0 52 0 63 0 90] 
#[0 4 58 0 15 0 26 0 52 0 90] 
#[1 9 85 0 15 4 62 0 26 4 62 0 52 4 62 0 90] 
#[1 9 89 0 8 3 201 0 20] 
#[1 9 93 0 8 0 166 0 13 0 166 0 17 0 166 0 20 0 166 0 25 0 166 0 38] 
#[0 4 66 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 0 23 0 49 0 41 0 50 0 209 0 51 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 0 253 0 79 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 9 97 0 94 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 3 241 0 135 1 117 0 151 3 241 0 163 3 241 0 182 9 101 0 183 3 241 0 184 3 241 0 185 1 137 0 186 3 241 0 187 3 241 0 188 3 241 0 189 3 241 0 190 3 241 0 191 1 161 0 192 3 241 0 193 3 241 0 194 3 241 0 195 3 241 0 201 3 241 0 202 3 241 0 203 3 241 0 207 3 241 0 208 3 241 0 209 3 241 0 210 3 241 0 211 3 241 0 212 3 241 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 3 241 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 3 241 1 35 2 41 1 36 2 45 1 38] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 0 23 0 49 0 41 0 50 0 209 0 51 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 0 253 0 79 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 9 105 0 94 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 6 105 0 135 1 117 0 151 6 105 0 163 6 105 0 182 6 105 0 184 6 105 0 185 1 137 0 186 6 105 0 187 6 105 0 188 6 105 0 189 6 105 0 190 6 105 0 191 1 161 0 192 6 105 0 193 6 105 0 194 6 105 0 195 6 105 0 201 6 105 0 202 6 105 0 203 6 105 0 207 6 105 0 208 6 105 0 209 6 105 0 210 6 105 0 211 6 105 0 212 6 105 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 6 105 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 6 105 1 35 2 41 1 36 2 45 1 38] 
#[1 1 86 0 13 1 86 0 17 1 151 0 20 1 90 0 25] 
#[0 4 70 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 9 113 0 9 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 9 117 0 153 9 121 0 154 4 177 1 36] 
#[1 0 29 0 26 2 189 0 27 0 33 0 37 0 37 0 42 0 59 0 44 0 63 0 46 0 67 0 49 0 41 0 50 0 71 0 54 0 45 0 56 0 49 0 58 0 75 0 60 0 79 0 66 0 57 0 67 0 83 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 87 0 76 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 9 125 0 94 0 91 0 105 2 217 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 2 217 0 117 2 217 0 118 2 217 0 121 9 149 0 132 9 133 0 133 0 137 0 134 9 149 0 135 9 149 0 143 9 141 0 150 9 149 0 163 9 149 0 164 9 145 0 166 9 149 0 167 9 149 0 168 9 149 0 179 0 137 1 11 9 149 1 18 2 205 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 4 74 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 9 161 0 15 2 61 0 16 0 173 0 17 0 181 0 27 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 7 169 0 90 9 165 0 94 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 9 169 1 3 2 129 1 5 2 17 1 6 9 169 1 11 9 169 1 15 9 169 1 16 9 173 1 17 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 198 0 2 0 198 0 3 0 198 0 4 0 198 0 5 0 198 0 6 0 198 0 7 0 198 0 9 0 198 0 10 0 198 0 11 0 198 0 12 0 198 0 13 0 198 0 14 0 198 0 16 0 198 0 17 0 198 0 18 0 103 0 20 0 198 0 22 0 198 0 23 0 103 0 25 0 135 0 27 0 198 0 28 0 198 0 29 0 198 0 30 1 155 0 31 0 198 0 32 0 198 0 33 0 198 0 34 0 198 0 35 0 198 0 36 0 103 0 38 0 198 0 40 0 198 0 41 0 198 0 65 0 198 0 91 0 198 0 92 0 198 0 93 0 198 0 96 0 198 0 97 0 198 0 98 3 249 1 28] 
#[0 4 78 0 9 0 15 0 94] 
#[0 4 82 0 9 0 15 0 94] 
#[0 9 181 0 9] 
#[1 4 86 0 9 9 185 0 15] 
#[0 4 90 0 9 0 15] 
#[0 4 94 0 9] 
#[0 4 98 0 9 0 15 0 94] 
#[1 2 213 0 105 9 189 0 118 9 189 0 119 3 189 1 32 3 189 1 33 3 189 1 34] 
#[1 0 29 0 26 2 189 0 27 0 33 0 37 0 37 0 42 0 59 0 44 0 63 0 46 0 67 0 49 0 41 0 50 0 71 0 54 0 45 0 56 0 49 0 58 0 75 0 60 0 79 0 66 0 57 0 67 0 83 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 87 0 76 2 209 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 1 29 0 90 9 193 0 94 0 91 0 105 2 217 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 2 217 0 117 2 217 0 118 2 217 0 121 9 201 0 132 2 233 0 133 0 137 0 134 9 201 0 135 9 197 0 140 9 201 0 141 9 201 0 142 9 201 0 143 9 201 0 149 2 201 0 150 9 201 0 158 9 201 0 159 3 5 0 160 9 201 0 163 9 201 0 164 3 9 0 182 0 137 1 11 9 201 1 18 3 13 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 5 137 0 63 7 209 0 90 9 205 0 137 9 209 0 139] 
#[1 7 209 0 90 9 213 0 139] 
#[0 4 102 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 4 106 0 9 0 15 0 90] 
#[0 4 110 0 15 0 90] 
#[1 9 217 0 15 4 114 0 90] 
#[1 7 241 0 26 9 221 0 94 9 225 1 22] 
#[1 0 29 0 26 2 189 0 27 0 33 0 37 0 37 0 42 0 59 0 44 0 63 0 46 0 67 0 49 0 41 0 50 0 71 0 54 0 45 0 56 0 49 0 58 0 75 0 60 0 79 0 66 0 57 0 67 0 83 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 87 0 76 2 209 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 1 29 0 90 4 118 0 94 0 91 0 105 2 217 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 2 217 0 117 2 217 0 118 2 217 0 121 9 201 0 132 2 233 0 133 0 137 0 134 9 201 0 135 9 229 0 140 9 201 0 141 9 201 0 142 9 201 0 143 9 201 0 149 2 201 0 150 9 201 0 158 9 201 0 159 3 5 0 160 9 201 0 163 9 201 0 164 3 9 0 182 0 137 1 11 9 201 1 18 3 13 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 4 122 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 185 0 37 9 233 0 105 3 93 1 11] 
#[1 9 237 0 15 7 241 0 26 9 241 0 94 9 245 1 22] 
#[0 4 126 0 15 0 26 0 94] 
#[0 9 249 0 94] 
#[0 4 130 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 9 253 0 10 6 141 0 105] 
#[0 4 134 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[0 10 1 0 26] 
#[1 2 213 0 105 10 5 0 118 10 5 0 120 3 189 1 32 3 189 1 33 3 189 1 34] 
#[1 0 29 0 26 1 159 0 27 1 163 0 37 1 167 0 42 1 171 0 44 1 175 0 46 1 179 0 49 0 41 0 50 4 138 0 52 1 183 0 54 0 45 0 56 1 187 0 58 1 191 0 60 1 195 0 66 0 57 0 67 1 199 0 68 1 203 0 69 1 207 0 72 1 211 0 73 1 215 0 74 1 219 0 76 1 223 0 77 1 227 0 78 1 231 0 81 1 235 0 85 1 239 0 87 1 243 0 88 10 9 0 94 1 247 0 105 2 217 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 2 217 0 117 2 217 0 118 2 217 0 121 10 29 0 132 9 133 0 133 0 137 0 134 10 29 0 135 10 29 0 143 10 21 0 150 10 29 0 163 10 29 0 164 10 25 0 171 10 29 0 172 10 29 0 173 10 29 0 174 10 41 0 175 10 45 0 176 10 29 0 179 0 137 1 11 10 29 1 18 2 205 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 10 53 0 15 8 29 0 90 10 57 0 170] 
#[0 4 142 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 7 161 0 90 10 61 0 165] 
#[1 7 205 0 57 5 137 0 63 7 209 0 90 10 65 0 136 10 69 0 137 10 73 0 139] 
#[1 5 141 0 90 10 77 1 19] 
#[0 4 146 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 8 25 0 57 8 29 0 90 10 81 0 169 10 85 0 170] 
#[0 4 150 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[0 4 154 0 15 0 96] 
#[0 4 158 0 15 0 96] 
#[0 4 162 0 15 0 96] 
#[0 10 89 0 26] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 10 93 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 10 93 1 3 10 93 1 4 2 177 1 5 2 17 1 6 10 93 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 165 0 8 10 97 0 9 0 169 0 13 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 5 245 0 192 10 101 0 205 10 105 0 206 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 5 245 0 245 5 245 0 246 5 245 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 10 109 0 26] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 10 113 0 26 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 10 117 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 10 117 1 3 10 117 1 4 2 177 1 5 2 17 1 6 10 117 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 10 121 0 192 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 10 121 0 245 10 121 0 246 10 121 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 5 69 0 105 6 173 0 144 5 77 0 145 5 77 0 146 10 125 0 147] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 10 129 0 182 10 129 0 187 10 129 0 188 10 129 0 189 10 129 0 190 10 129 0 191 1 161 0 192 10 129 0 193 10 129 0 194 10 129 0 195 10 129 0 201 10 129 0 202 10 129 0 203 10 129 0 207 10 129 0 208 10 129 0 209 10 129 0 210 10 129 0 211 10 129 0 212 10 129 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 10 129 1 35 2 45 1 38] 
#[0 10 133 0 39] 
#[0 4 166 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 4 170 0 2 4 170 0 3 4 170 0 5 4 170 0 6 4 170 0 9 4 170 0 10 4 170 0 12 4 170 0 13 4 170 0 15 4 170 0 16 4 170 0 17 4 170 0 20 4 170 0 22 4 170 0 24 4 170 0 25 4 170 0 26 4 170 0 27 4 170 0 28 4 170 0 30 4 170 0 32 4 170 0 33 4 170 0 36 4 5 0 38 4 170 0 39 4 170 0 40 4 170 0 65 4 170 0 91 4 170 0 93 4 170 0 94 4 170 0 96 4 170 0 97 4 170 0 98 6 125 0 237 4 170 1 39] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 10 137 0 15 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 8 121 0 90 10 141 0 94 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 10 145 0 148 1 117 0 151 10 145 0 180 10 149 0 181 1 217 0 222 1 221 0 223 10 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 10 145 1 3 10 145 1 4 2 177 1 5 2 17 1 6 10 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 4 174 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 4 178 0 2 4 178 0 3 4 178 0 5 4 178 0 6 4 178 0 9 4 178 0 10 4 178 0 12 4 178 0 13 4 178 0 15 4 178 0 16 4 178 0 17 4 178 0 20 4 178 0 22 4 178 0 24 4 178 0 25 4 178 0 26 4 178 0 27 4 178 0 28 4 178 0 30 4 178 0 32 4 178 0 33 4 178 0 36 4 5 0 38 4 178 0 39 4 178 0 40 4 178 0 65 4 178 0 91 4 178 0 93 4 178 0 94 4 178 0 96 4 178 0 97 4 178 0 98 6 125 0 237 4 178 1 39] 
#[0 4 182 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 4 186 0 2 4 186 0 3 4 186 0 5 4 186 0 6 4 186 0 9 4 186 0 10 4 186 0 12 4 186 0 13 4 186 0 15 4 186 0 16 4 186 0 17 4 186 0 20 4 186 0 22 4 186 0 24 4 186 0 25 4 186 0 26 4 186 0 27 4 186 0 28 4 186 0 30 4 186 0 32 4 186 0 33 4 186 0 36 4 186 0 38 4 186 0 39 4 186 0 40 4 186 0 65 7 209 0 90 4 186 0 91 4 186 0 93 4 186 0 94 4 186 0 96 4 186 0 97 4 186 0 98 10 153 0 139 4 186 1 39] 
#[1 10 157 0 9 10 161 0 15] 
#[0 4 190 0 9 0 15] 
#[0 10 165 0 8] 
#[1 10 169 0 90 10 173 0 196] 
#[1 1 29 0 90 10 177 0 182] 
#[0 4 194 0 90] 
#[1 10 181 0 9 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 10 185 0 215 6 69 1 36] 
#[1 5 69 0 105 10 189 0 146 10 193 0 147] 
#[1 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 10 197 0 218 10 201 1 36] 
#[0 4 198 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 4 202 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 4 206 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 4 210 0 8 4 210 0 13 4 210 0 17 4 210 0 26 4 210 0 27 4 210 0 37 4 210 0 42 4 210 0 43 4 210 0 44 4 210 0 45 4 210 0 46 4 210 0 47 6 73 0 48 4 210 0 49 4 210 0 50 4 210 0 51 4 210 0 52 4 210 0 53 4 210 0 54 4 210 0 55 4 210 0 56 4 210 0 58 6 77 0 59 4 210 0 60 4 210 0 61 4 210 0 62 4 210 0 66 4 210 0 67 4 210 0 68 4 210 0 69 4 210 0 70 4 210 0 72 4 210 0 73 4 210 0 74 4 210 0 75 4 210 0 76 4 210 0 77 4 210 0 78 4 210 0 79 4 210 0 80 4 210 0 81 4 210 0 82 4 210 0 83 4 210 0 85 4 210 0 86 4 210 0 87 4 210 0 88 4 210 0 89 4 210 0 90 4 210 0 94 4 210 0 99 4 210 0 100 4 210 0 101 4 210 0 102 4 210 0 103 4 210 0 104 4 210 0 105 8 181 0 217 10 205 0 220 4 210 1 39] 
#[0 4 214 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 10 209 0 182 10 209 0 187 10 209 0 188 10 209 0 189 10 209 0 190 10 209 0 191 1 161 0 192 10 209 0 193 10 209 0 194 10 209 0 195 10 209 0 201 10 209 0 202 10 209 0 203 10 209 0 207 10 209 0 208 10 209 0 209 10 209 0 210 10 209 0 211 10 209 0 212 10 209 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 10 209 1 35 2 45 1 38] 
#[1 0 181 0 27 1 251 0 105 10 217 1 28] 
#[0 4 218 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 4 222 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 4 226 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 10 221 0 9 10 161 0 15] 
#[0 4 230 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 39] 
#[0 10 225 0 105] 
#[0 10 229 0 8] 
#[0 4 234 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 10 233 0 9] 
#[1 0 234 0 2 0 234 0 3 0 234 0 5 0 234 0 6 0 234 0 9 0 234 0 10 0 234 0 12 0 234 0 13 0 234 0 15 0 234 0 16 0 234 0 17 0 111 0 20 0 234 0 22 0 234 0 24 0 242 0 25 0 234 0 26 0 234 0 27 0 234 0 28 0 234 0 30 0 234 0 32 0 234 0 33 0 234 0 36 4 25 0 38 0 234 0 39 0 234 0 40 0 234 0 65 0 234 0 91 0 234 0 93 0 234 0 94 0 234 0 96 0 234 0 97 0 234 0 98 0 234 1 39] 
#[0 4 238 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 1 114 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 1 130 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 4 242 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 4 246 0 9 0 15] 
#[0 2 238 0 9 0 15] 
#[1 5 69 0 105 10 237 0 147] 
#[1 4 250 0 9 4 250 0 15 4 193 0 38] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 10 241 1 3 2 129 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 4 254 0 5 0 15 0 96] 
#[1 10 245 0 5 5 2 0 15 5 2 0 96] 
#[0 5 6 0 15 0 96] 
#[1 5 10 0 26 9 49 0 38 5 10 0 52 5 101 0 84 5 10 0 90 10 249 0 155] 
#[1 5 14 0 26 9 49 0 38 5 14 0 52 5 101 0 84 5 14 0 90 10 253 0 155] 
#[1 11 1 0 9 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 11 5 0 153 9 121 0 154 4 177 1 36] 
#[0 11 9 0 39] 
#[0 5 18 0 26 0 52 0 90] 
#[0 5 22 0 26 0 52 0 90] 
#[0 5 26 0 15 0 26] 
#[0 5 30 0 9 0 15 0 26] 
#[0 5 34 0 9 0 15 0 26 0 94] 
#[0 5 38 0 9 0 15 0 26 0 94] 
#[0 5 42 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 5 46 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 2 213 0 105 11 13 0 118 11 13 0 119 3 189 1 32 3 189 1 33 3 189 1 34] 
#[1 2 49 0 1 2 53 0 8 11 17 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 11 21 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 11 25 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 11 29 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 5 50 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 0 23 0 49 0 41 0 50 0 209 0 51 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 0 253 0 79 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 11 33 0 94 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 6 105 0 135 1 117 0 151 6 105 0 163 6 105 0 182 6 105 0 184 6 105 0 185 1 137 0 186 6 105 0 187 6 105 0 188 6 105 0 189 6 105 0 190 6 105 0 191 1 161 0 192 6 105 0 193 6 105 0 194 6 105 0 195 6 105 0 201 6 105 0 202 6 105 0 203 6 105 0 207 6 105 0 208 6 105 0 209 6 105 0 210 6 105 0 211 6 105 0 212 6 105 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 6 105 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 6 105 1 35 2 41 1 36 2 45 1 38] 
#[0 5 54 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 11 37 0 79 11 41 0 82 6 153 0 105] 
#[0 5 58 0 84 0 90] 
#[1 11 45 0 9 11 49 0 15] 
#[0 5 62 0 9 0 15] 
#[0 5 66 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 5 70 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 2 189 0 27 3 69 0 37 0 37 0 42 0 59 0 44 0 63 0 46 0 67 0 49 3 73 0 50 0 71 0 54 3 77 0 56 0 49 0 58 0 75 0 60 0 79 0 66 3 81 0 67 0 83 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 87 0 76 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 0 91 0 105 5 89 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 5 89 0 117 5 89 0 118 5 89 0 121 3 85 0 134 3 85 1 11 5 41 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 5 74 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 11 53 0 26 11 57 0 52] 
#[1 0 29 0 26 2 189 0 27 0 33 0 37 0 37 0 42 0 59 0 44 0 63 0 46 0 67 0 49 0 41 0 50 0 71 0 54 0 45 0 56 0 49 0 58 0 75 0 60 0 79 0 66 0 57 0 67 0 83 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 87 0 76 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 11 61 0 94 0 91 0 105 2 217 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 2 217 0 117 2 217 0 118 2 217 0 121 11 65 0 132 9 133 0 133 0 137 0 134 11 65 0 135 11 65 0 143 9 141 0 150 11 65 0 163 11 65 0 164 11 65 0 167 11 65 0 168 11 65 0 179 0 137 1 11 11 65 1 18 2 205 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 5 78 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 82 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 86 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 11 69 0 94] 
#[0 5 90 0 9 0 15 0 94] 
#[0 5 94 0 15 0 94] 
#[1 11 73 0 15 11 77 0 94] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 7 169 0 90 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 11 81 1 3 2 129 1 5 2 17 1 6 11 81 1 11 11 81 1 15 11 81 1 16 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 5 98 0 9 0 15 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 11 85 0 105 11 89 1 14] 
#[0 5 102 0 63 0 90] 
#[0 5 106 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 37 0 38 0 39 0 40 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 29 0 26 2 189 0 27 0 33 0 37 0 37 0 42 0 59 0 44 0 63 0 46 0 67 0 49 0 41 0 50 0 71 0 54 0 45 0 56 0 49 0 58 0 75 0 60 0 79 0 66 0 57 0 67 0 83 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 87 0 76 2 209 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 1 29 0 90 11 93 0 94 0 91 0 105 2 217 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 2 217 0 117 2 217 0 118 2 217 0 121 11 97 0 132 2 233 0 133 0 137 0 134 11 97 0 135 11 97 0 141 11 97 0 142 11 97 0 143 11 97 0 149 2 201 0 150 11 97 0 158 11 97 0 159 3 5 0 160 11 97 0 163 11 97 0 164 3 9 0 182 0 137 1 11 11 97 1 18 3 13 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 5 110 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105] 
#[1 7 209 0 90 11 101 0 139] 
#[0 5 114 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 5 118 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 2 213 0 105 11 105 0 118 11 105 0 120 3 189 1 32 3 189 1 33 3 189 1 34] 
#[0 5 122 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 11 109 0 94] 
#[1 0 29 0 26 2 189 0 27 0 33 0 37 0 37 0 42 0 59 0 44 0 63 0 46 0 67 0 49 0 41 0 50 0 71 0 54 0 45 0 56 0 49 0 58 0 75 0 60 0 79 0 66 0 57 0 67 0 83 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 87 0 76 2 209 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 1 29 0 90 5 126 0 94 0 91 0 105 2 217 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 2 217 0 117 2 217 0 118 2 217 0 121 11 97 0 132 2 233 0 133 0 137 0 134 11 97 0 135 11 97 0 141 11 97 0 142 11 97 0 143 11 97 0 149 2 201 0 150 11 97 0 158 11 97 0 159 3 5 0 160 11 97 0 163 11 97 0 164 3 9 0 182 0 137 1 11 11 97 1 18 3 13 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 11 113 0 8 5 130 0 15 5 130 0 26 7 209 0 90 5 130 0 94 11 117 0 139] 
#[1 7 241 0 26 0 6 0 37 11 121 0 94 0 6 0 105 7 249 1 10 11 125 1 21 11 129 1 22] 
#[0 5 134 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 11 133 0 94] 
#[0 5 138 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 11 137 0 26] 
#[0 5 142 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[0 5 146 0 15 0 90] 
#[0 5 150 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 5 154 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 158 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 11 53 0 26] 
#[1 0 29 0 26 1 159 0 27 1 163 0 37 1 167 0 42 1 171 0 44 1 175 0 46 1 179 0 49 0 41 0 50 4 138 0 52 1 183 0 54 0 45 0 56 1 187 0 58 1 191 0 60 1 195 0 66 0 57 0 67 1 199 0 68 1 203 0 69 1 207 0 72 1 211 0 73 1 215 0 74 1 219 0 76 1 223 0 77 1 227 0 78 1 231 0 81 1 235 0 85 1 239 0 87 1 243 0 88 11 141 0 94 1 247 0 105 2 217 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 2 217 0 117 2 217 0 118 2 217 0 121 11 145 0 132 9 133 0 133 0 137 0 134 11 145 0 135 11 145 0 143 10 21 0 150 11 145 0 163 11 145 0 164 11 145 0 172 11 145 0 173 11 145 0 174 10 41 0 175 10 45 0 176 11 145 0 179 0 137 1 11 11 145 1 18 2 205 1 23 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 5 162 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 166 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 170 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 1 29 0 90 11 149 0 182] 
#[1 2 189 0 27 0 185 0 37 0 37 0 42 0 22 0 44 0 22 0 46 0 22 0 49 11 153 0 52 0 22 0 54 0 49 0 58 0 22 0 60 0 22 0 66 0 22 0 68 0 61 0 69 0 65 0 72 0 69 0 73 0 73 0 74 0 22 0 76 0 77 0 77 0 81 0 78 0 85 0 81 0 89 0 85 0 22 0 87 0 93 0 88 0 22 0 105 11 161 0 134 11 161 0 177 11 161 0 178 11 161 1 11 11 169 1 23] 
#[0 5 174 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 2 213 0 105 11 173 0 118 11 173 0 120 3 189 1 32 3 189 1 33 3 189 1 34] 
#[0 5 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 5 182 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[1 5 137 0 63 7 209 0 90 11 177 0 137 11 181 0 139] 
#[1 7 209 0 90 11 185 0 139] 
#[0 5 186 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 5 190 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 10 53 0 15 8 29 0 90 11 189 0 170] 
#[0 5 194 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 5 198 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 11 193 0 9] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 11 197 0 182 11 197 0 187 11 197 0 188 11 197 0 189 11 197 0 190 11 197 0 191 1 161 0 192 11 197 0 193 11 197 0 194 11 197 0 195 11 197 0 201 11 197 0 202 11 197 0 203 11 197 0 207 11 197 0 208 11 197 0 209 11 197 0 210 11 197 0 211 11 197 0 212 11 197 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 11 197 1 35 2 45 1 38] 
#[0 11 201 0 9] 
#[1 5 202 0 9 8 97 0 15] 
#[1 0 165 0 8 11 205 0 9 0 169 0 13 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 5 245 0 192 11 209 0 205 10 105 0 206 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 5 245 0 245 5 245 0 246 5 245 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 165 0 8 11 213 0 9 0 169 0 13 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 5 245 0 192 11 217 0 205 10 105 0 206 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 5 245 0 245 5 245 0 246 5 245 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 11 221 0 26] 
#[0 5 206 0 9 0 15 0 26] 
#[1 3 30 0 15 11 225 0 24 3 30 0 26 7 101 0 31 4 193 0 38] 
#[1 5 210 0 8 5 210 0 13 5 210 0 17 5 210 0 26 5 210 0 27 5 210 0 37 5 210 0 42 5 210 0 43 5 210 0 44 5 210 0 45 5 210 0 46 5 210 0 47 5 210 0 49 5 210 0 50 5 210 0 51 5 210 0 52 5 210 0 53 5 210 0 54 11 229 0 55 5 210 0 56 5 210 0 58 5 210 0 60 5 210 0 61 5 210 0 62 5 210 0 66 5 210 0 67 5 210 0 68 5 210 0 69 5 210 0 70 5 210 0 72 5 210 0 73 5 210 0 74 5 210 0 75 5 210 0 76 5 210 0 77 5 210 0 78 5 210 0 79 5 210 0 80 5 210 0 81 5 210 0 82 5 210 0 83 5 210 0 85 5 210 0 86 5 210 0 87 5 210 0 88 5 210 0 89 5 210 0 90 5 210 0 94 5 210 0 99 5 210 0 100 5 210 0 101 5 210 0 102 5 210 0 103 5 210 0 104 5 210 0 105 5 210 1 39] 
#[0 5 214 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 11 233 0 94] 
#[0 5 218 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 5 222 0 15 0 94] 
#[1 11 237 0 15 11 241 0 94] 
#[0 5 226 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 5 230 0 2 5 230 0 3 5 230 0 5 5 230 0 6 5 230 0 9 5 230 0 10 5 230 0 12 5 230 0 13 5 230 0 15 5 230 0 16 5 230 0 17 5 230 0 20 5 230 0 22 5 230 0 24 5 230 0 25 5 230 0 26 5 230 0 27 5 230 0 28 5 230 0 30 5 230 0 32 5 230 0 33 5 230 0 36 5 230 0 38 5 230 0 39 5 230 0 40 5 230 0 65 7 209 0 90 5 230 0 91 5 230 0 93 5 230 0 94 5 230 0 96 5 230 0 97 5 230 0 98 11 245 0 139 5 230 1 39] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 11 249 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 11 249 1 3 11 249 1 4 2 177 1 5 2 17 1 6 11 249 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 11 253 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 12 1 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 12 5 0 47 12 9 0 52 12 13 0 94 12 17 0 197 12 21 0 198 12 25 0 199 12 29 0 200] 
#[0 5 234 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 5 238 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 5 242 0 90] 
#[0 5 246 0 9 0 26] 
#[0 5 250 0 9 0 26] 
#[1 7 101 0 31 4 193 0 38] 
#[0 12 33 0 9] 
#[1 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 4 121 0 58 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 12 37 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 12 37 0 117 12 37 0 118 12 37 0 121 12 41 0 219 4 133 1 11 2 25 1 32 2 25 1 33 2 25 1 34 4 133 1 37] 
#[0 5 254 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 2 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 6 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 12 45 0 105] 
#[0 6 10 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 6 14 0 8 12 49 0 27 12 53 1 27] 
#[1 2 49 0 1 2 53 0 8 12 57 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 12 61 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 8 241 0 122 8 241 0 123 8 241 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 12 65 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 221 0 238 1 221 0 239 1 221 0 240 2 97 0 241 2 97 0 242 2 97 0 243 12 69 0 247 12 69 0 248 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 6 18 0 9 6 18 0 15 4 193 0 38] 
#[0 6 22 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 12 73 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 12 73 0 117 12 73 0 118 12 73 0 121 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 6 26 0 26 0 52 0 90] 
#[0 6 30 0 26 0 52 0 90] 
#[0 6 34 0 26 0 38 0 52 0 84 0 90] 
#[1 12 77 0 9 11 49 0 15] 
#[0 6 38 0 26 0 38 0 52 0 84 0 90] 
#[0 6 42 0 15 0 26 0 52 0 90] 
#[0 12 81 0 26] 
#[1 12 85 0 9 10 161 0 15] 
#[0 12 89 0 26] 
#[1 12 93 0 9 10 161 0 15] 
#[0 6 46 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 12 97 0 8] 
#[0 12 101 0 8] 
#[0 6 50 0 84 0 90] 
#[1 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 12 105 0 154 4 177 1 36] 
#[0 6 54 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 8 121 0 90 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 12 109 0 148 1 117 0 151 12 109 0 180 1 217 0 222 1 221 0 223 12 109 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 12 109 1 3 12 109 1 4 2 177 1 5 2 17 1 6 12 109 1 8 12 113 1 11 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 6 58 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 39] 
#[0 6 62 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 6 66 0 9 0 15 0 94] 
#[1 2 49 0 1 3 101 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 185 0 37 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 7 169 0 90 12 117 0 94 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 1 217 0 222 1 221 0 223 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 12 121 1 3 2 129 1 5 2 17 1 6 12 121 1 11 12 121 1 15 12 121 1 16 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 6 70 0 9 0 15 0 94] 
#[0 6 74 0 9 0 15] 
#[0 9 177 0 31] 
#[0 6 78 0 9 0 15] 
#[0 6 82 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 37 0 38 0 39 0 40 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 86 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105] 
#[0 6 90 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 94 0 15 0 90] 
#[0 6 98 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 2 49 0 1 2 53 0 8 12 125 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 12 129 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 6 102 0 15 0 26 0 94] 
#[0 6 106 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 110 0 15 0 26 0 94] 
#[0 12 133 0 94] 
#[0 6 114 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 118 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 39] 
#[0 6 122 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 126 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 6 130 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 6 134 0 27 0 37 0 42 0 44 0 46 0 49 0 52 0 54 0 58 0 60 0 66 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 6 138 0 27 0 37 0 42 0 44 0 46 0 49 0 52 0 54 0 58 0 60 0 66 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 6 142 0 27 0 37 0 42 0 44 0 46 0 49 0 52 0 54 0 58 0 60 0 66 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 6 146 0 27 0 37 0 42 0 44 0 46 0 49 0 52 0 54 0 58 0 60 0 66 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 1 21 0 87 2 213 0 105 12 137 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 12 137 0 117 12 137 0 118 12 137 0 121 12 141 0 151 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 6 150 0 15 0 90] 
#[1 7 209 0 90 12 145 0 139] 
#[0 6 154 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 158 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 6 162 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 12 149 0 26] 
#[0 6 166 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 12 153 0 182 12 153 0 187 12 153 0 188 12 153 0 189 12 153 0 190 12 153 0 191 1 161 0 192 12 153 0 193 12 153 0 194 12 153 0 195 12 153 0 201 12 153 0 202 12 153 0 203 12 153 0 207 12 153 0 208 12 153 0 209 12 153 0 210 12 153 0 211 12 153 0 212 12 153 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 12 153 1 35 2 45 1 38] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 12 157 0 182 12 157 0 187 12 157 0 188 12 157 0 189 12 157 0 190 12 157 0 191 1 161 0 192 12 157 0 193 12 157 0 194 12 157 0 195 12 157 0 201 12 157 0 202 12 157 0 203 12 157 0 207 12 157 0 208 12 157 0 209 12 157 0 210 12 157 0 211 12 157 0 212 12 157 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 12 157 1 35 2 45 1 38] 
#[0 12 161 0 9] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 12 165 0 182 12 165 0 187 12 165 0 188 12 165 0 189 12 165 0 190 12 165 0 191 1 161 0 192 12 165 0 193 12 165 0 194 12 165 0 195 12 165 0 201 12 165 0 202 12 165 0 203 12 165 0 207 12 165 0 208 12 165 0 209 12 165 0 210 12 165 0 211 12 165 0 212 12 165 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 12 165 1 35 2 45 1 38] 
#[0 12 169 0 9] 
#[1 0 165 0 8 12 173 0 9 0 169 0 13 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 95 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 5 245 0 192 12 177 0 205 10 105 0 206 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 5 245 0 245 5 245 0 246 5 245 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 12 181 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 12 181 1 3 12 181 1 4 2 177 1 5 2 17 1 6 12 181 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 12 185 0 182 12 185 0 187 12 185 0 188 12 185 0 189 12 185 0 190 12 185 0 191 1 161 0 192 12 185 0 193 12 185 0 194 12 185 0 195 12 185 0 201 12 185 0 202 12 185 0 203 12 185 0 207 12 185 0 208 12 185 0 209 12 185 0 210 12 185 0 211 12 185 0 212 12 185 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 12 185 1 35 2 45 1 38] 
#[0 6 170 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 8 121 0 90 12 189 0 94 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 12 193 0 148 1 117 0 151 12 193 0 180 1 217 0 222 1 221 0 223 12 193 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 12 193 1 3 12 193 1 4 2 177 1 5 2 17 1 6 12 193 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 6 174 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 6 178 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 6 182 0 9 0 15] 
#[0 6 186 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 12 197 0 9 10 161 0 15] 
#[1 2 49 0 1 2 53 0 8 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 12 205 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 12 205 1 3 12 205 1 4 2 177 1 5 2 17 1 6 12 205 1 8 12 205 1 9 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 12 209 0 24] 
#[0 6 190 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 12 5 0 47 12 9 0 52 12 213 0 94 12 217 0 198 12 221 0 199 12 29 0 200] 
#[0 6 194 0 47 0 52 0 94] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 12 5 0 47 0 23 0 49 0 41 0 50 0 209 0 51 12 9 0 52 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 0 253 0 79 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 12 225 0 94 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 3 241 0 135 1 117 0 151 3 241 0 163 3 241 0 182 12 229 0 183 3 241 0 184 3 241 0 185 1 137 0 186 3 241 0 187 3 241 0 188 3 241 0 189 3 241 0 190 3 241 0 191 1 161 0 192 3 241 0 193 3 241 0 194 3 241 0 195 12 233 0 200 3 241 0 201 3 241 0 202 3 241 0 203 3 241 0 207 3 241 0 208 3 241 0 209 3 241 0 210 3 241 0 211 3 241 0 212 3 241 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 3 241 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 3 241 1 35 2 41 1 36 2 45 1 38] 
#[0 6 198 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[1 1 29 0 90 12 237 0 182] 
#[0 6 202 0 91 0 105] 
#[1 12 241 0 91 5 69 0 105 12 245 0 147] 
#[0 12 249 0 8] 
#[1 3 121 0 36 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 12 253 0 96 2 213 0 105 3 129 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 3 129 0 117 3 129 0 118 3 129 0 121 13 1 1 29 3 137 1 30 2 25 1 32 2 25 1 33 2 25 1 34] 
#[0 13 5 0 8] 
#[0 6 206 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 13 9 0 9 10 161 0 15] 
#[0 6 210 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 6 214 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 6 218 0 5 0 15 0 96] 
#[0 6 222 0 26 0 38 0 52 0 84 0 90] 
#[0 6 226 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 13 13 0 26] 
#[0 6 230 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 13 17 0 26] 
#[1 2 49 0 1 2 53 0 8 13 21 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 13 25 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[1 2 49 0 1 2 53 0 8 13 29 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 13 33 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 6 234 0 9 0 15] 
#[0 13 37 0 26] 
#[0 13 41 0 26] 
#[0 6 238 0 9 0 15 0 94] 
#[0 6 242 0 15 0 94] 
#[1 6 246 0 15 6 246 0 26 7 209 0 90 6 246 0 94 13 45 0 139] 
#[1 13 49 0 9 10 161 0 15] 
#[0 6 250 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 7 81 0 105 13 53 0 152] 
#[1 7 81 0 105 13 57 0 152] 
#[0 6 254 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 2 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 6 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 10 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 13 61 0 182 13 61 0 187 13 61 0 188 13 61 0 189 13 61 0 190 13 61 0 191 1 161 0 192 13 61 0 193 13 61 0 194 13 61 0 195 13 61 0 201 13 61 0 202 13 61 0 203 13 61 0 207 13 61 0 208 13 61 0 209 13 61 0 210 13 61 0 211 13 61 0 212 13 61 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 13 61 1 35 2 45 1 38] 
#[0 7 14 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 13 65 0 182 13 65 0 187 13 65 0 188 13 65 0 189 13 65 0 190 13 65 0 191 1 161 0 192 13 65 0 193 13 65 0 194 13 65 0 195 13 65 0 201 13 65 0 202 13 65 0 203 13 65 0 207 13 65 0 208 13 65 0 209 13 65 0 210 13 65 0 211 13 65 0 212 13 65 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 13 65 1 35 2 45 1 38] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 13 69 0 182 13 69 0 187 13 69 0 188 13 69 0 189 13 69 0 190 13 69 0 191 1 161 0 192 13 69 0 193 13 69 0 194 13 69 0 195 13 69 0 201 13 69 0 202 13 69 0 203 13 69 0 207 13 69 0 208 13 69 0 209 13 69 0 210 13 69 0 211 13 69 0 212 13 69 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 13 69 1 35 2 45 1 38] 
#[0 13 73 0 9] 
#[0 13 77 0 9] 
#[0 7 18 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 22 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 7 26 0 15 0 94] 
#[0 7 30 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 7 34 0 24] 
#[0 13 81 0 24] 
#[0 7 38 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 7 42 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 46 0 47 0 52 0 94] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 12 5 0 47 0 23 0 49 0 41 0 50 0 209 0 51 12 9 0 52 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 0 253 0 79 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 13 85 0 94 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 3 241 0 135 1 117 0 151 3 241 0 163 3 241 0 182 12 229 0 183 3 241 0 184 3 241 0 185 1 137 0 186 3 241 0 187 3 241 0 188 3 241 0 189 3 241 0 190 3 241 0 191 1 161 0 192 3 241 0 193 3 241 0 194 3 241 0 195 12 233 0 200 3 241 0 201 3 241 0 202 3 241 0 203 3 241 0 207 3 241 0 208 3 241 0 209 3 241 0 210 3 241 0 211 3 241 0 212 3 241 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 3 241 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 3 241 1 35 2 41 1 36 2 45 1 38] 
#[0 7 50 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 11 0 37 0 37 0 42 0 189 0 43 0 15 0 44 0 197 0 45 0 19 0 46 7 54 0 47 0 23 0 49 0 41 0 50 0 209 0 51 7 54 0 52 0 213 0 53 0 27 0 54 0 45 0 56 0 31 0 58 0 35 0 60 0 225 0 61 0 229 0 62 0 39 0 66 0 57 0 67 0 43 0 68 0 61 0 69 0 241 0 70 0 65 0 72 0 69 0 73 0 73 0 74 0 245 0 75 0 47 0 76 0 77 0 77 0 81 0 78 0 253 0 79 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 0 89 0 85 1 17 0 86 1 21 0 87 0 93 0 88 1 25 0 89 1 29 0 90 7 54 0 94 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 51 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 109 0 133 0 137 0 134 6 105 0 135 1 117 0 151 6 105 0 163 6 105 0 182 6 105 0 184 6 105 0 185 1 137 0 186 6 105 0 187 6 105 0 188 6 105 0 189 6 105 0 190 6 105 0 191 1 161 0 192 6 105 0 193 6 105 0 194 6 105 0 195 6 105 0 201 6 105 0 202 6 105 0 203 6 105 0 207 6 105 0 208 6 105 0 209 6 105 0 210 6 105 0 211 6 105 0 212 6 105 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 0 137 1 11 6 105 1 18 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 6 105 1 35 2 41 1 36 2 45 1 38] 
#[0 7 58 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 7 62 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 249 0 76 2 213 0 105 13 89 0 112 2 221 0 113 2 221 0 114 2 221 0 115 2 221 0 116 13 89 0 117 13 89 0 118 13 89 0 121 2 25 1 32 2 25 1 33 2 25 1 34] 
#[1 7 66 0 9 4 193 0 38] 
#[1 2 49 0 1 2 53 0 8 13 93 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 13 97 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 7 70 0 8] 
#[1 5 209 0 15 13 101 0 96] 
#[1 2 49 0 1 2 53 0 8 13 105 0 9 2 57 0 12 0 169 0 13 2 61 0 16 0 173 0 17 0 181 0 27 0 193 0 44 0 201 0 46 0 205 0 49 0 217 0 54 0 221 0 60 0 233 0 66 0 237 0 68 0 241 0 70 0 249 0 76 0 253 0 79 1 9 0 82 1 21 0 87 2 65 0 95 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 55 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 2 73 0 147 1 117 0 151 1 217 0 222 1 221 0 223 8 145 0 224 2 81 0 225 2 85 0 228 1 221 0 230 1 221 0 231 13 109 0 232 1 217 0 233 1 237 0 238 1 221 0 239 1 245 0 240 2 97 0 241 2 97 0 242 2 97 0 243 2 129 0 244 2 129 0 245 2 129 0 246 2 129 0 247 2 129 0 248 2 129 0 249 2 133 0 250 2 137 0 251 2 141 0 252 2 145 0 253 2 149 0 254 2 153 0 255 2 157 1 0 2 161 1 1 2 165 1 2 8 145 1 3 8 145 1 4 2 177 1 5 2 17 1 6 8 145 1 8 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 2 45 1 38] 
#[0 7 74 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 7 78 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 7 82 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 13 113 0 26] 
#[1 13 117 0 9 10 161 0 15] 
#[0 13 121 0 26] 
#[1 13 125 0 9 10 161 0 15] 
#[0 7 86 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 7 90 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 7 94 0 15 0 26 0 94] 
#[1 7 98 0 15 7 98 0 26 7 209 0 90 7 98 0 94 13 129 0 139] 
#[1 9 49 0 38 5 101 0 84 7 102 0 90 13 133 0 155] 
#[1 9 49 0 38 5 101 0 84 7 106 0 90 13 137 0 155] 
#[0 7 110 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 114 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 118 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 13 141 0 182 13 141 0 187 13 141 0 188 13 141 0 189 13 141 0 190 13 141 0 191 1 161 0 192 13 141 0 193 13 141 0 194 13 141 0 195 13 141 0 201 13 141 0 202 13 141 0 203 13 141 0 207 13 141 0 208 13 141 0 209 13 141 0 210 13 141 0 211 13 141 0 212 13 141 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 13 141 1 35 2 45 1 38] 
#[1 0 165 0 8 0 169 0 13 0 173 0 17 0 177 0 26 0 181 0 27 0 189 0 43 0 193 0 44 0 197 0 45 0 201 0 46 0 205 0 49 0 209 0 51 0 213 0 53 0 217 0 54 0 221 0 60 0 225 0 61 0 229 0 62 0 233 0 66 0 237 0 68 0 241 0 70 0 245 0 75 0 249 0 76 0 253 0 79 1 1 0 80 3 161 0 81 1 9 0 82 1 13 0 83 1 17 0 86 1 21 0 87 1 25 0 89 1 29 0 90 1 33 0 99 1 37 0 100 1 41 0 101 1 45 0 102 1 49 0 103 1 53 0 104 0 99 0 105 1 221 0 111 1 65 0 112 1 69 0 113 1 69 0 114 1 69 0 115 1 69 0 116 1 85 0 117 1 85 0 118 1 85 0 121 1 97 0 122 1 97 0 123 1 97 0 124 1 117 0 151 13 145 0 182 13 145 0 187 13 145 0 188 13 145 0 189 13 145 0 190 13 145 0 191 1 161 0 192 13 145 0 193 13 145 0 194 13 145 0 195 13 145 0 201 13 145 0 202 13 145 0 203 13 145 0 207 13 145 0 208 13 145 0 209 13 145 0 210 13 145 0 211 13 145 0 212 13 145 0 221 1 217 0 222 1 221 0 223 1 221 0 230 1 229 0 231 1 217 0 233 1 237 0 238 1 241 0 239 1 245 0 240 1 249 0 241 1 253 0 242 2 1 0 243 1 161 0 245 1 161 0 246 1 161 1 5 2 17 1 6 2 21 1 28 2 25 1 32 2 25 1 33 2 25 1 34 13 145 1 35 2 45 1 38] 
#[0 7 122 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 7 126 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 130 0 91 0 105] 
#[0 7 134 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 13 149 0 9 10 161 0 15] 
#[0 7 138 0 8] 
#[1 7 142 0 2 7 142 0 3 7 142 0 5 7 142 0 6 7 142 0 9 7 142 0 10 7 142 0 12 7 142 0 13 7 142 0 15 7 142 0 16 7 142 0 17 7 142 0 20 7 142 0 22 7 142 0 24 7 142 0 25 7 142 0 26 7 142 0 27 7 142 0 28 7 142 0 30 7 142 0 32 7 142 0 33 7 142 0 36 7 142 0 38 7 142 0 39 7 142 0 40 7 142 0 65 7 209 0 90 7 142 0 91 7 142 0 93 7 142 0 94 7 142 0 96 7 142 0 97 7 142 0 98 13 153 0 139 7 142 1 39] 
#[1 13 157 0 9 10 161 0 15] 
#[0 7 146 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 13 161 0 26] 
#[0 7 150 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 13 165 0 26] 
#[0 7 154 0 15 0 26 0 94] 
#[0 7 158 0 90] 
#[0 7 162 0 90] 
#[0 7 166 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 170 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 39] 
#[0 7 174 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[0 7 178 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39] 
#[1 7 182 0 2 7 182 0 3 7 182 0 5 7 182 0 6 7 182 0 9 7 182 0 10 7 182 0 12 7 182 0 13 7 182 0 15 7 182 0 16 7 182 0 17 7 182 0 20 7 182 0 22 7 182 0 24 7 182 0 25 7 182 0 26 7 182 0 27 7 182 0 28 7 182 0 30 7 182 0 32 7 182 0 33 7 182 0 36 7 182 0 38 7 182 0 39 7 182 0 40 7 182 0 65 7 209 0 90 7 182 0 91 7 182 0 93 7 182 0 94 7 182 0 96 7 182 0 97 7 182 0 98 13 169 0 139 7 182 1 39] 
#[0 7 186 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 7 190 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 7 194 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 39]
	).
]

{ #category : #private }
JavaParser >> performParsingStep [
	| actions scannerState token |
	(currentToken value = '>>' or: [ currentToken value = '>>>' ])
		ifTrue: [ actions := OrderedCollection new.
			self addActionsFor: scanner GREATER_THANId to: actions.
			actions notEmpty
				ifTrue: [ scannerState := scanner currentState.
					token := currentToken.
					scanner position: scanner position - (currentToken value size - 1).
					currentToken := SmaCCToken value: '>' start: currentToken startPosition ids: (Array with: scanner GREATER_THANId).
					actions do: [ :each | self splitWithAction: each ].
					currentToken := token.
					scanner restoreState: scannerState ] ].
	^ super performParsingStep
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForabstract_method_declaration1: nodes [
	| result |
	result := JavaAbstractMethodDeclarationNode new.
	result typeParameters: ((nodes at: 1) at: 1).
	result type: ((nodes at: 1) at: 2).
	result declarator: ((nodes at: 1) at: 3).
	result throws: ((nodes at: 1) at: 4).
	result addNodes: ((nodes at: 1) at: 5) to: result modifiers.
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation1: nodes [
	| result |
	result := JavaAnnotationNode new.
	result _at: (nodes at: 1).
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation2: nodes [
	| result |
	result := JavaAnnotationNode new.
	result _at: (nodes at: 1).
	result name: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result values.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_args1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_args2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_interface_body1: nodes [
	| result |
	result := Array new: 3.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_interface_body2: nodes [
	| result |
	result := Array new: 3.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 3).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_interface_declaration1: nodes [
	| result |
	result := JavaAnnotationInterfaceNode new.
	result atToken: (nodes at: 1).
	result interfaceToken: (nodes at: 2).
	result name: (nodes at: 3).
	result leftBrace: ((nodes at: 4) at: 1).
	result rightBrace: ((nodes at: 4) at: 2).
	result addNodes: ((nodes at: 4) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_interface_declaration2: nodes [
	| result |
	result := JavaAnnotationInterfaceNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result atToken: (nodes at: 2).
	result interfaceToken: (nodes at: 3).
	result name: (nodes at: 4).
	result leftBrace: ((nodes at: 5) at: 1).
	result rightBrace: ((nodes at: 5) at: 2).
	result addNodes: ((nodes at: 5) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_method_declaration2: nodes [
	| result |
	result := JavaAnnotationMethodDeclarationNode new.
	result typeParameters: ((nodes at: 1) at: 1).
	result type: ((nodes at: 1) at: 2).
	result declarator: ((nodes at: 1) at: 3).
	result throws: ((nodes at: 1) at: 4).
	result addNodes: ((nodes at: 1) at: 5) to: result modifiers.
	result defaultToken: (nodes at: 2).
	result value: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotations1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_access1: nodes [
	| result |
	result := JavaArrayAccessNode new.
	result array: (nodes at: 1).
	result leftBracket: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_creation_expression1: nodes [
	| result |
	result := JavaNewArrayNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result dimExpressions.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_creation_expression2: nodes [
	| result |
	result := JavaNewArrayNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result dimExpressions.
	result addTokens: ((nodes at: 4) at: 1) to: result leftBrackets.
	result addTokens: ((nodes at: 4) at: 2) to: result rightBrackets.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_creation_expression5: nodes [
	| result |
	result := JavaNewArrayNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result addTokens: ((nodes at: 3) at: 1) to: result leftBrackets.
	result addTokens: ((nodes at: 3) at: 2) to: result rightBrackets.
	result initializer: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_initializer1: nodes [
	| result |
	result := JavaArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_initializer2: nodes [
	| result |
	result := JavaArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_initializer3: nodes [
	| result |
	result := JavaArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addToken: (nodes at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_initializer4: nodes [
	| result |
	result := JavaArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_type1: nodes [
	| result |
	result := JavaArrayTypeNode new.
	result baseType: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result leftBrackets.
	result addTokens: ((nodes at: 2) at: 2) to: result rightBrackets.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForassert_statement1: nodes [
	| result |
	result := JavaAssertStatementNode new.
	result assertToken: (nodes at: 1).
	result testExpression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForassert_statement2: nodes [
	| result |
	result := JavaAssertStatementNode new.
	result assertToken: (nodes at: 1).
	result testExpression: (nodes at: 2).
	result colon: (nodes at: 3).
	result messageExpression: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForassignment1: nodes [
	| result |
	result := JavaAssignmentNode new.
	result variable: (nodes at: 1).
	result op: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForblock1: nodes [
	| result |
	result := JavaBlockNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForblock2: nodes [
	| result |
	result := JavaBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForbreak_statement1: nodes [
	| result |
	result := JavaBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForbreak_statement2: nodes [
	| result |
	result := JavaBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcast_expression1: nodes [
	| result |
	result := JavaCastExpressionNode new.
	result leftParen: (nodes at: 1).
	result type: (nodes at: 2).
	result rightParen: (nodes at: 3).
	result expression: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcast_expression5: nodes [
	| result |
	result := JavaCastExpressionNode new.
	result leftParen: (nodes at: 1).
	result type: (nodes at: 2).
	result ampToken: (nodes at: 3).
	result interfaceType: (nodes at: 4).
	result rightParen: (nodes at: 5).
	result expression: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcatch_clause1: nodes [
	| result |
	result := JavaCatchClauseNode new.
	result catchToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result parameter: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcatch_parameter1: nodes [
	| result |
	result := JavaCatchParameterNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result addNodes: ((nodes at: 2) at: 1) to: result types.
	result addTokens: ((nodes at: 2) at: 2) to: result bars.
	result variable: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_body_declaration4: nodes [
	| result |
	result := JavaInitializerNode new.
	result block: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration1: nodes [
	| result |
	result := JavaClassDeclarationNode new.
	result classToken: (nodes at: 1).
	result name: (nodes at: 2).
	result typeParameters: (nodes at: 3).
	result leftBrace: ((nodes at: 4) at: 1).
	result rightBrace: ((nodes at: 4) at: 2).
	result addNodes: ((nodes at: 4) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration2: nodes [
	| result |
	result := JavaClassDeclarationNode new.
	result classToken: (nodes at: 1).
	result name: (nodes at: 2).
	result typeParameters: (nodes at: 3).
	result implementsToken: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result leftBrace: ((nodes at: 5) at: 1).
	result rightBrace: ((nodes at: 5) at: 2).
	result addNodes: ((nodes at: 5) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration3: nodes [
	| result |
	result := JavaClassDeclarationNode new.
	result classToken: (nodes at: 1).
	result name: (nodes at: 2).
	result typeParameters: (nodes at: 3).
	result extendsToken: ((nodes at: 4) at: 1).
	result superclass: ((nodes at: 4) at: 2).
	result leftBrace: ((nodes at: 5) at: 1).
	result rightBrace: ((nodes at: 5) at: 2).
	result addNodes: ((nodes at: 5) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration4: nodes [
	| result |
	result := JavaClassDeclarationNode new.
	result classToken: (nodes at: 1).
	result name: (nodes at: 2).
	result typeParameters: (nodes at: 3).
	result extendsToken: ((nodes at: 4) at: 1).
	result superclass: ((nodes at: 4) at: 2).
	result implementsToken: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result leftBrace: ((nodes at: 6) at: 1).
	result rightBrace: ((nodes at: 6) at: 2).
	result addNodes: ((nodes at: 6) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration5: nodes [
	| result |
	result := JavaClassDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result classToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result leftBrace: ((nodes at: 5) at: 1).
	result rightBrace: ((nodes at: 5) at: 2).
	result addNodes: ((nodes at: 5) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration6: nodes [
	| result |
	result := JavaClassDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result classToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result implementsToken: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result leftBrace: ((nodes at: 6) at: 1).
	result rightBrace: ((nodes at: 6) at: 2).
	result addNodes: ((nodes at: 6) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration7: nodes [
	| result |
	result := JavaClassDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result classToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result extendsToken: ((nodes at: 5) at: 1).
	result superclass: ((nodes at: 5) at: 2).
	result leftBrace: ((nodes at: 6) at: 1).
	result rightBrace: ((nodes at: 6) at: 2).
	result addNodes: ((nodes at: 6) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration8: nodes [
	| result |
	result := JavaClassDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result classToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result extendsToken: ((nodes at: 5) at: 1).
	result superclass: ((nodes at: 5) at: 2).
	result implementsToken: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result leftBrace: ((nodes at: 7) at: 1).
	result rightBrace: ((nodes at: 7) at: 2).
	result addNodes: ((nodes at: 7) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression1: nodes [
	| result |
	result := JavaNewNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result rightParen: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression2: nodes [
	| result |
	result := JavaNewNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression3: nodes [
	| result |
	result := JavaNewClassNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result leftBrace: ((nodes at: 5) at: 1).
	result rightBrace: ((nodes at: 5) at: 2).
	result addNodes: ((nodes at: 5) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression4: nodes [
	| result |
	result := JavaNewClassNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	result leftBrace: ((nodes at: 6) at: 1).
	result rightBrace: ((nodes at: 6) at: 2).
	result addNodes: ((nodes at: 6) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression5: nodes [
	| result |
	result := JavaNewNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result newToken: (nodes at: 3).
	result lt: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result gt: ((nodes at: 4) at: 4).
	result name: (nodes at: 5).
	result typeArgLeft: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result arguments.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result typeArgRight: ((nodes at: 6) at: 4).
	result leftParen: (nodes at: 7).
	result rightParen: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression6: nodes [
	| result |
	result := JavaNewNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result newToken: (nodes at: 3).
	result lt: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result gt: ((nodes at: 4) at: 4).
	result name: (nodes at: 5).
	result typeArgLeft: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result arguments.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result typeArgRight: ((nodes at: 6) at: 4).
	result leftParen: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result expressions.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParen: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression7: nodes [
	| result |
	result := JavaNewClassNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result newToken: (nodes at: 3).
	result lt: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result gt: ((nodes at: 4) at: 4).
	result name: (nodes at: 5).
	result typeArgLeft: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result arguments.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result typeArgRight: ((nodes at: 6) at: 4).
	result leftParen: (nodes at: 7).
	result rightParen: (nodes at: 8).
	result leftBrace: ((nodes at: 9) at: 1).
	result rightBrace: ((nodes at: 9) at: 2).
	result addNodes: ((nodes at: 9) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression8: nodes [
	| result |
	result := JavaNewClassNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result newToken: (nodes at: 3).
	result lt: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result gt: ((nodes at: 4) at: 4).
	result name: (nodes at: 5).
	result typeArgLeft: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result arguments.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result typeArgRight: ((nodes at: 6) at: 4).
	result leftParen: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result expressions.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParen: (nodes at: 9).
	result leftBrace: ((nodes at: 10) at: 1).
	result rightBrace: ((nodes at: 10) at: 2).
	result addNodes: ((nodes at: 10) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_or_interface_type1: nodes [
	| result |
	result := JavaClassTypeNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcompilation_unit1: nodes [
	| result |
	result := JavaProgramFileNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcompilation_unit2: nodes [
	| result |
	result := JavaProgramFileNode new.
	result addNodes: (nodes at: 1) to: result typeDeclarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcompilation_unit3: nodes [
	| result |
	result := JavaProgramFileNode new.
	result addNodes: (nodes at: 1) to: result imports.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcompilation_unit4: nodes [
	| result |
	result := JavaProgramFileNode new.
	result addNodes: (nodes at: 1) to: result imports.
	result addNodes: (nodes at: 2) to: result typeDeclarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcompilation_unit5: nodes [
	| result |
	result := JavaProgramFileNode new.
	result packageDeclaration: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcompilation_unit6: nodes [
	| result |
	result := JavaProgramFileNode new.
	result packageDeclaration: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result typeDeclarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcompilation_unit7: nodes [
	| result |
	result := JavaProgramFileNode new.
	result packageDeclaration: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result imports.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcompilation_unit8: nodes [
	| result |
	result := JavaProgramFileNode new.
	result packageDeclaration: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result imports.
	result addNodes: (nodes at: 3) to: result typeDeclarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconditional_expression2: nodes [
	| result |
	result := JavaConditionalExpressionNode new.
	result testExpression: (nodes at: 1).
	result questionMark: (nodes at: 2).
	result trueExpression: (nodes at: 3).
	result colon: (nodes at: 4).
	result falseExpression: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_body1: nodes [
	| result |
	result := JavaBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNode: (nodes at: 2) to: result statements.
	result addNodes: (nodes at: 3) to: result statements.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_body2: nodes [
	| result |
	result := JavaBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNode: (nodes at: 2) to: result statements.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declaration1: nodes [
	| result |
	result := JavaConstructorDeclarationNode new.
	result typeParameters: ((nodes at: 1) at: 1).
	result name: ((nodes at: 1) at: 2).
	result leftParen: ((nodes at: 1) at: 3).
	result rightParen: ((nodes at: 1) at: 4).
	result addNodes: ((nodes at: 1) at: 5) to: result parameters.
	result addTokens: ((nodes at: 1) at: 6) to: result commas.
	result body: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declaration2: nodes [
	| result |
	result := JavaConstructorDeclarationNode new.
	result typeParameters: ((nodes at: 1) at: 1).
	result name: ((nodes at: 1) at: 2).
	result leftParen: ((nodes at: 1) at: 3).
	result rightParen: ((nodes at: 1) at: 4).
	result addNodes: ((nodes at: 1) at: 5) to: result parameters.
	result addTokens: ((nodes at: 1) at: 6) to: result commas.
	result throws: (nodes at: 2).
	result body: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declaration3: nodes [
	| result |
	result := JavaConstructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 2) at: 1).
	result name: ((nodes at: 2) at: 2).
	result leftParen: ((nodes at: 2) at: 3).
	result rightParen: ((nodes at: 2) at: 4).
	result addNodes: ((nodes at: 2) at: 5) to: result parameters.
	result addTokens: ((nodes at: 2) at: 6) to: result commas.
	result body: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declaration4: nodes [
	| result |
	result := JavaConstructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 2) at: 1).
	result name: ((nodes at: 2) at: 2).
	result leftParen: ((nodes at: 2) at: 3).
	result rightParen: ((nodes at: 2) at: 4).
	result addNodes: ((nodes at: 2) at: 5) to: result parameters.
	result addTokens: ((nodes at: 2) at: 6) to: result commas.
	result throws: (nodes at: 3).
	result body: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declarator1: nodes [
	| result |
	result := Array new: 6.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declarator2: nodes [
	| result |
	result := Array new: 6.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 5).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 6).
	result at: 4 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcontinue_statement1: nodes [
	| result |
	result := JavaContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcontinue_statement2: nodes [
	| result |
	result := JavaContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFordim_expr1: nodes [
	| result |
	result := JavaDimensionExpressionNode new.
	result leftBracket: (nodes at: 1).
	result expression: (nodes at: 2).
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFordims1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFordims2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFordo_statement1: nodes [
	| result |
	result := JavaDoWhileStatementNode new.
	result doToken: (nodes at: 1).
	result statement: (nodes at: 2).
	result whileToken: (nodes at: 3).
	result leftParen: (nodes at: 4).
	result expression: (nodes at: 5).
	result rightParen: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForelementValueArrayInitializer1: nodes [
	| result |
	result := JavaElementArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForelementValueArrayInitializer2: nodes [
	| result |
	result := JavaElementArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addToken: (nodes at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForelementValueArrayInitializer3: nodes [
	| result |
	result := JavaElementArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result values.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForelementValueArrayInitializer4: nodes [
	| result |
	result := JavaElementArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result values.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForelementValuePair1: nodes [
	| result |
	result := JavaElementValuePairNode new.
	result name: (nodes at: 1).
	result equals: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForempty_dim_expr1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForempty_statement1: nodes [
	| result |
	result := JavaEmptyStatementNode new.
	result semicolon: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body1: nodes [
	| result |
	result := Array new: 6.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body2: nodes [
	| result |
	result := Array new: 6.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 3 put: ((nodes at: 2) at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body3: nodes [
	| result |
	result := Array new: 6.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 5).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body4: nodes [
	| result |
	result := Array new: 6.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 5).
	result at: 3 put: ((nodes at: 3) at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	result at: 2 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body5: nodes [
	| result |
	result := Array new: 6.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 5).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body6: nodes [
	| result |
	result := Array new: 6.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 5).
	result at: 3 put: ((nodes at: 3) at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	result at: 2 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body7: nodes [
	| result |
	result := Array new: 6.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 5).
	self add: (nodes at: 3) to: (result at: 5).
	result at: 2 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body8: nodes [
	| result |
	result := Array new: 6.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 5).
	self add: (nodes at: 3) to: (result at: 5).
	result at: 3 put: ((nodes at: 4) at: 1).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 4).
	result at: 2 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body_declarations1: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body_declarations2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_constant1: nodes [
	| result |
	result := JavaEnumConstantNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_constant2: nodes [
	| result |
	result := JavaEnumConstantNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result name: (nodes at: 2).
	result leftBrace: ((nodes at: 3) at: 1).
	result rightBrace: ((nodes at: 3) at: 2).
	result addNodes: ((nodes at: 3) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_constant3: nodes [
	| result |
	result := JavaEnumConstantNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result name: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result rightParen: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_constant4: nodes [
	| result |
	result := JavaEnumConstantNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result name: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result leftBrace: ((nodes at: 5) at: 1).
	result rightBrace: ((nodes at: 5) at: 2).
	result addNodes: ((nodes at: 5) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_constant5: nodes [
	| result |
	result := JavaEnumConstantNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result name: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_constant6: nodes [
	| result |
	result := JavaEnumConstantNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result name: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	result leftBrace: ((nodes at: 6) at: 1).
	result rightBrace: ((nodes at: 6) at: 2).
	result addNodes: ((nodes at: 6) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_declaration1: nodes [
	| result |
	result := JavaEnumDeclarationNode new.
	result enumToken: (nodes at: 1).
	result name: (nodes at: 2).
	result leftBrace: ((nodes at: 3) at: 1).
	result rightBrace: ((nodes at: 3) at: 2).
	result semicolon: ((nodes at: 3) at: 3).
	result addNodes: ((nodes at: 3) at: 4) to: result declarations.
	result addTokens: ((nodes at: 3) at: 5) to: result commas.
	result addNodes: ((nodes at: 3) at: 6) to: result constants.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_declaration2: nodes [
	| result |
	result := JavaEnumDeclarationNode new.
	result enumToken: (nodes at: 1).
	result name: (nodes at: 2).
	result implementsToken: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result leftBrace: ((nodes at: 4) at: 1).
	result rightBrace: ((nodes at: 4) at: 2).
	result semicolon: ((nodes at: 4) at: 3).
	result addNodes: ((nodes at: 4) at: 4) to: result declarations.
	result addTokens: ((nodes at: 4) at: 5) to: result commas.
	result addNodes: ((nodes at: 4) at: 6) to: result constants.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_declaration3: nodes [
	| result |
	result := JavaEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result enumToken: (nodes at: 2).
	result name: (nodes at: 3).
	result leftBrace: ((nodes at: 4) at: 1).
	result rightBrace: ((nodes at: 4) at: 2).
	result semicolon: ((nodes at: 4) at: 3).
	result addNodes: ((nodes at: 4) at: 4) to: result declarations.
	result addTokens: ((nodes at: 4) at: 5) to: result commas.
	result addNodes: ((nodes at: 4) at: 6) to: result constants.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_declaration4: nodes [
	| result |
	result := JavaEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result enumToken: (nodes at: 2).
	result name: (nodes at: 3).
	result implementsToken: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result leftBrace: ((nodes at: 5) at: 1).
	result rightBrace: ((nodes at: 5) at: 2).
	result semicolon: ((nodes at: 5) at: 3).
	result addNodes: ((nodes at: 5) at: 4) to: result declarations.
	result addTokens: ((nodes at: 5) at: 5) to: result commas.
	result addNodes: ((nodes at: 5) at: 6) to: result constants.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation1: nodes [
	| result |
	result := JavaThisConstructorInvocationNode new.
	result thisToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result rightParen: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation2: nodes [
	| result |
	result := JavaThisConstructorInvocationNode new.
	result thisToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightParen: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation3: nodes [
	| result |
	result := JavaSuperConstructorInvocationNode new.
	result superToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result rightParen: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation4: nodes [
	| result |
	result := JavaSuperConstructorInvocationNode new.
	result superToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightParen: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation5: nodes [
	| result |
	result := JavaThisConstructorInvocationNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result thisToken: (nodes at: 3).
	result leftParen: (nodes at: 4).
	result rightParen: (nodes at: 5).
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation6: nodes [
	| result |
	result := JavaThisConstructorInvocationNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result thisToken: (nodes at: 3).
	result leftParen: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result expressions.
	result addTokens: ((nodes at: 5) at: 2) to: result commas.
	result rightParen: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation7: nodes [
	| result |
	result := JavaSuperConstructorInvocationNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result superToken: (nodes at: 3).
	result leftParen: (nodes at: 4).
	result rightParen: (nodes at: 5).
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation8: nodes [
	| result |
	result := JavaSuperConstructorInvocationNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result superToken: (nodes at: 3).
	result leftParen: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result expressions.
	result addTokens: ((nodes at: 5) at: 2) to: result commas.
	result rightParen: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexpression_statement1: nodes [
	| result |
	result := JavaExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForextends_interfaces1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForextends_interfaces2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfield_access1: nodes [
	| result |
	result := JavaFieldAccessNode new.
	result receiver: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfield_access2: nodes [
	| result |
	result := JavaFieldAccessNode new.
	result superToken: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfield_access3: nodes [
	| result |
	result := JavaFieldAccessNode new.
	result receiver: (nodes at: 1).
	result superPeriod: (nodes at: 2).
	result superToken: (nodes at: 3).
	result period: (nodes at: 4).
	result name: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfield_declaration1: nodes [
	| result |
	result := JavaFieldDeclarationNode new.
	result type: (nodes at: 1).
	result
		addNodes: ((nodes at: 2) at: 1)
		to: result variableDeclarations.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfield_declaration2: nodes [
	| result |
	result := JavaFieldDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result
		addNodes: ((nodes at: 3) at: 1)
		to: result variableDeclarations.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfinally1: nodes [
	| result |
	result := JavaFinallyClauseNode new.
	result finallyToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfloating_point_type1: nodes [
	| result |
	result := JavaFloatTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfloating_point_type2: nodes [
	| result |
	result := JavaDoubleTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfor_statement1: nodes [
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result firstSemicolon: (nodes at: 3).
	result secondSemicolon: (nodes at: 4).
	result rightParen: (nodes at: 5).
	result statement: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfor_statement2: nodes [
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result firstSemicolon: (nodes at: 3).
	result secondSemicolon: (nodes at: 4).
	result _update: (nodes at: 5).
	result rightParen: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfor_statement3: nodes [
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result firstSemicolon: (nodes at: 3).
	result test: (nodes at: 4).
	result secondSemicolon: (nodes at: 5).
	result rightParen: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfor_statement4: nodes [
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result firstSemicolon: (nodes at: 3).
	result test: (nodes at: 4).
	result secondSemicolon: (nodes at: 5).
	result _update: (nodes at: 6).
	result rightParen: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfor_statement5: nodes [
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result initial: (nodes at: 3).
	result firstSemicolon: (nodes at: 4).
	result secondSemicolon: (nodes at: 5).
	result rightParen: (nodes at: 6).
	result statement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfor_statement6: nodes [
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result initial: (nodes at: 3).
	result firstSemicolon: (nodes at: 4).
	result secondSemicolon: (nodes at: 5).
	result _update: (nodes at: 6).
	result rightParen: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfor_statement7: nodes [
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result initial: (nodes at: 3).
	result firstSemicolon: (nodes at: 4).
	result test: (nodes at: 5).
	result secondSemicolon: (nodes at: 6).
	result rightParen: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfor_statement8: nodes [
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result initial: (nodes at: 3).
	result firstSemicolon: (nodes at: 4).
	result test: (nodes at: 5).
	result secondSemicolon: (nodes at: 6).
	result _update: (nodes at: 7).
	result rightParen: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForforeach_statement1: nodes [
	| result |
	result := JavaForEachStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result modifiers.
	result type: (nodes at: 4).
	result name: (nodes at: 5).
	result colon: (nodes at: 6).
	result expression: (nodes at: 7).
	result rightParen: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForformal_parameter1: nodes [
	| result |
	result := JavaParameterNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result variable: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForformal_parameter2: nodes [
	| result |
	result := JavaVariableArgumentParameterNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result varArgsToken: (nodes at: 3).
	result variable: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForif_then_else_statement1: nodes [
	| result |
	result := JavaIfElseStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result trueStatement: (nodes at: 5).
	result elseToken: (nodes at: 6).
	result falseStatement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForif_then_statement1: nodes [
	| result |
	result := JavaIfStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result trueStatement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForimport_declarations1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForimport_declarations2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinitialized_variable_declarator1: nodes [
	| result |
	result := JavaInitializedVariableDeclarationNode new.
	result variable: (nodes at: 1).
	result equals: (nodes at: 2).
	result initializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type1: nodes [
	| result |
	result := JavaByteTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type2: nodes [
	| result |
	result := JavaShortTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type3: nodes [
	| result |
	result := JavaIntTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type4: nodes [
	| result |
	result := JavaLongTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type5: nodes [
	| result |
	result := JavaCharTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterface_declaration1: nodes [
	| result |
	result := JavaInterfaceDeclarationNode new.
	result interfaceToken: (nodes at: 1).
	result name: (nodes at: 2).
	result typeParameters: (nodes at: 3).
	result leftBrace: ((nodes at: 4) at: 1).
	result rightBrace: ((nodes at: 4) at: 2).
	result addNodes: ((nodes at: 4) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterface_declaration2: nodes [
	| result |
	result := JavaInterfaceDeclarationNode new.
	result interfaceToken: (nodes at: 1).
	result name: (nodes at: 2).
	result typeParameters: (nodes at: 3).
	result extendsToken: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result interfaceTypes.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result leftBrace: ((nodes at: 5) at: 1).
	result rightBrace: ((nodes at: 5) at: 2).
	result addNodes: ((nodes at: 5) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterface_declaration3: nodes [
	| result |
	result := JavaInterfaceDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result interfaceToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result leftBrace: ((nodes at: 5) at: 1).
	result rightBrace: ((nodes at: 5) at: 2).
	result addNodes: ((nodes at: 5) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterface_declaration4: nodes [
	| result |
	result := JavaInterfaceDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result interfaceToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result extendsToken: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result interfaceTypes.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result leftBrace: ((nodes at: 6) at: 1).
	result rightBrace: ((nodes at: 6) at: 2).
	result addNodes: ((nodes at: 6) at: 3) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterface_method_declaration1: nodes [
	| result |
	result := JavaMethodDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 1) at: 2).
	result type: ((nodes at: 1) at: 3).
	result declarator: ((nodes at: 1) at: 4).
	result throws: ((nodes at: 1) at: 5).
	result body: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterface_method_header1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterface_method_header2: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterfaces1: nodes [
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
JavaParser >> reduceActionForlabeled_statement1: nodes [
	| result |
	result := JavaLabeledStatementNode new.
	result identifier: (nodes at: 1).
	result colon: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlambda_expression1: nodes [
	| result |
	result := JavaLambdaExpressionNode new.
	result leftParen: ((nodes at: 1) at: 1).
	result rightParen: ((nodes at: 1) at: 2).
	result addNodes: ((nodes at: 1) at: 3) to: result parameters.
	result addTokens: ((nodes at: 1) at: 4) to: result commas.
	result arrowToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlambda_parameters1: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlambda_parameters2: nodes [
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
JavaParser >> reduceActionForlambda_parameters3: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral1: nodes [
	| result |
	result := JavaIntegerLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral2: nodes [
	| result |
	result := JavaFloatLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral3: nodes [
	| result |
	result := JavaBooleanLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral4: nodes [
	| result |
	result := JavaCharacterLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral5: nodes [
	| result |
	result := JavaStringLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral6: nodes [
	| result |
	result := JavaNullNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlocal_variable_declaration1: nodes [
	| result |
	result := JavaLocalVariableDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result
		addNodes: ((nodes at: 3) at: 1)
		to: result variableDeclarations.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlocal_variable_declaration_statement1: nodes [
	| result |
	result := JavaLocalVariableDeclarationStatementNode new.
	result declaration: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_body2: nodes [
	| result |
	result := JavaEmptyMethodBodyNode new.
	result semicolon: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_declaration1: nodes [
	| result |
	result := JavaMethodDeclarationNode new.
	result typeParameters: ((nodes at: 1) at: 1).
	result type: ((nodes at: 1) at: 2).
	result declarator: ((nodes at: 1) at: 3).
	result throws: ((nodes at: 1) at: 4).
	result addNodes: ((nodes at: 1) at: 5) to: result modifiers.
	result body: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_declarator1: nodes [
	| result |
	result := JavaMethodDeclaratorNode new.
	result name: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result rightParen: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_declarator2: nodes [
	| result |
	result := JavaMethodDeclaratorNode new.
	result name: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result parameters.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightParen: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_declarator3: nodes [
	| result |
	result := JavaArrayMethodDeclaratorNode new.
	result declarator: (nodes at: 1).
	result leftBracket: (nodes at: 2).
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_header1: nodes [
	| result |
	result := Array new: 5.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_header2: nodes [
	| result |
	result := Array new: 5.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_header3: nodes [
	| result |
	result := Array new: 5.
	result at: 5 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 5).
	result at: 1 put: (nodes at: 2).
	result at: 2 put: (nodes at: 3).
	result at: 3 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_header4: nodes [
	| result |
	result := Array new: 5.
	result at: 5 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 5).
	result at: 1 put: (nodes at: 2).
	result at: 2 put: (nodes at: 3).
	result at: 3 put: (nodes at: 4).
	result at: 4 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation1: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result lt: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result arguments.
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result gt: ((nodes at: 1) at: 4).
	result name: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result rightParen: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation2: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result lt: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result arguments.
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result gt: ((nodes at: 1) at: 4).
	result name: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation3: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result receiver: (nodes at: 1).
	result period: (nodes at: 2).
	result lt: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result arguments.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result gt: ((nodes at: 3) at: 4).
	result name: (nodes at: 4).
	result leftParen: (nodes at: 5).
	result rightParen: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation4: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result receiver: (nodes at: 1).
	result period: (nodes at: 2).
	result lt: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result arguments.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result gt: ((nodes at: 3) at: 4).
	result name: (nodes at: 4).
	result leftParen: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result expressions.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result rightParen: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation5: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result superToken: (nodes at: 1).
	result period: (nodes at: 2).
	result lt: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result arguments.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result gt: ((nodes at: 3) at: 4).
	result name: (nodes at: 4).
	result leftParen: (nodes at: 5).
	result rightParen: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation6: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result superToken: (nodes at: 1).
	result period: (nodes at: 2).
	result lt: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result arguments.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result gt: ((nodes at: 3) at: 4).
	result name: (nodes at: 4).
	result leftParen: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result expressions.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result rightParen: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation7: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result receiver: (nodes at: 1).
	result superPeriod: (nodes at: 2).
	result superToken: (nodes at: 3).
	result period: (nodes at: 4).
	result lt: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result arguments.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result gt: ((nodes at: 5) at: 4).
	result name: (nodes at: 6).
	result leftParen: (nodes at: 7).
	result rightParen: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation8: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result receiver: (nodes at: 1).
	result superPeriod: (nodes at: 2).
	result superToken: (nodes at: 3).
	result period: (nodes at: 4).
	result lt: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result arguments.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result gt: ((nodes at: 5) at: 4).
	result name: (nodes at: 6).
	result leftParen: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result expressions.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParen: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_reference_expression2: nodes [
	| result |
	result := JavaMethodReferenceNode new.
	result receiver: (nodes at: 1).
	result colonColonToken: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormodifier5: nodes [
	| result |
	result := JavaModifierNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormultiplicative_expression4: nodes [
	| result |
	result := JavaBinaryExpressionNode new.
	result leftExpression: (nodes at: 1).
	result op: (nodes at: 2).
	result rightExpression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpackage_declaration1: nodes [
	| result |
	result := JavaPackageDeclarationNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result packageToken: (nodes at: 2).
	result name: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpostdecrement_expression1: nodes [
	| result |
	result := JavaPostDecrementExpressionNode new.
	result expression: (nodes at: 1).
	result minusMinus: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpostincrement_expression1: nodes [
	| result |
	result := JavaPostIncrementExpressionNode new.
	result expression: (nodes at: 1).
	result plusPlus: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpredecrement_expression1: nodes [
	| result |
	result := JavaPreDecrementExpressionNode new.
	result minusMinus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpreincrement_expression1: nodes [
	| result |
	result := JavaPreIncrementExpressionNode new.
	result plusPlus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimary_no_new_array10: nodes [
	| result |
	result := JavaClassExpressionNode new.
	result type: (nodes at: 1).
	result period: (nodes at: 2).
	result classToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimary_no_new_array11: nodes [
	| result |
	result := JavaOuterThisNode new.
	result name: (nodes at: 1).
	result period: (nodes at: 2).
	result thisToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimary_no_new_array2: nodes [
	| result |
	result := JavaNameNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimary_no_new_array3: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result _leftParens.
	result addToken: (nodes at: 3) to: result _rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimitive_type2: nodes [
	| result |
	result := JavaBooleanTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForqualified_name1: nodes [
	| result |
	result := JavaQualifiedNameNode new.
	result nspace: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForqualified_type_name1: nodes [
	| result |
	result := JavaQualifiedTypeNameNode new.
	result nspace: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	result lt: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result gt: ((nodes at: 4) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForreturn_statement1: nodes [
	| result |
	result := JavaReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForreturn_statement2: nodes [
	| result |
	result := JavaReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForsimple_type_name1: nodes [
	| result |
	result := JavaTypeNameNode new.
	result name: (nodes at: 1).
	result lt: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result arguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result gt: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForsingle_type_import_declaration1: nodes [
	| result |
	result := JavaSingleTypeImportDeclarationNode new.
	result importToken: (nodes at: 1).
	result name: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForsingle_type_import_declaration2: nodes [
	| result |
	result := JavaSingleTypeImportDeclarationNode new.
	result importToken: (nodes at: 1).
	result staticToken: (nodes at: 2).
	result name: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForstatement_expression_list1: nodes [
	| result |
	result := JavaStatementExpressionListNode new.
	result addNode: (nodes at: 1) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForstatement_expression_list2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result commas.
	result addNode: (nodes at: 3) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForstatic_initializer1: nodes [
	| result |
	result := JavaStaticInitializerNode new.
	result staticToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block1: nodes [
	| result |
	result := JavaSwitchBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statementGroups.
	result addNodes: (nodes at: 3) to: result labels.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block2: nodes [
	| result |
	result := JavaSwitchBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statementGroups.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block3: nodes [
	| result |
	result := JavaSwitchBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result labels.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block4: nodes [
	| result |
	result := JavaSwitchBlockNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block_statement_group1: nodes [
	| result |
	result := JavaSwitchBlockStatementGroupNode new.
	result addNodes: (nodes at: 1) to: result labels.
	result addNodes: (nodes at: 2) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_label1: nodes [
	| result |
	result := JavaSwitchLabelNode new.
	result caseToken: (nodes at: 1).
	result constant: (nodes at: 2).
	result colon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_label2: nodes [
	| result |
	result := JavaDefaultLabelNode new.
	result defaultToken: (nodes at: 1).
	result colon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_statement1: nodes [
	| result |
	result := JavaSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForsynchronized_statement1: nodes [
	| result |
	result := JavaSynchronizedStatementNode new.
	result synchronizedToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForthrow_statement1: nodes [
	| result |
	result := JavaThrowStatementNode new.
	result throwToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForthrows1: nodes [
	| result |
	result := JavaThrowsNode new.
	result throwsToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result classTypes.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_resource1: nodes [
	| result |
	result := JavaLocalVariableDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result addNode: (nodes at: 3) to: result variableDeclarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_resources2: nodes [
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
JavaParser >> reduceActionFortry_statement1: nodes [
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result catches.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_statement2: nodes [
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result resources.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result rightParen: ((nodes at: 2) at: 4).
	result block: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result catches.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_statement3: nodes [
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result finally: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_statement4: nodes [
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result catches.
	result finally: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_statement5: nodes [
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result resources.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result rightParen: ((nodes at: 2) at: 4).
	result block: (nodes at: 3).
	result finally: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_statement6: nodes [
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result resources.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result rightParen: ((nodes at: 2) at: 4).
	result block: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result catches.
	result finally: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_statement7: nodes [
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result resources.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result rightParen: ((nodes at: 2) at: 4).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_argument1: nodes [
	| result |
	result := JavaTypeArgumentNode new.
	result type: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_argument2: nodes [
	| result |
	result := JavaTypeArgumentNode new.
	result questionMark: (nodes at: 1).
	result token: ((nodes at: 2) at: 1).
	result type: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_argument_type3: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_arguments1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_arguments2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_arguments_opt1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_arguments_opt2: nodes [
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
JavaParser >> reduceActionFortype_arguments_opt3: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 4 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_declaration4: nodes [
	| result |
	result := JavaEmptyDeclarationNode new.
	result semicolon: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_import_on_demand_declaration1: nodes [
	| result |
	result := JavaTypeImportOnDemandDeclarationNode new.
	result importToken: (nodes at: 1).
	result name: (nodes at: 2).
	result period: (nodes at: 3).
	result star: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_import_on_demand_declaration2: nodes [
	| result |
	result := JavaTypeImportOnDemandDeclarationNode new.
	result importToken: (nodes at: 1).
	result staticToken: (nodes at: 2).
	result name: (nodes at: 3).
	result period: (nodes at: 4).
	result star: (nodes at: 5).
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_parameter1: nodes [
	| result |
	result := JavaTypeParameterNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_parameter2: nodes [
	| result |
	result := JavaTypeParameterNode new.
	result name: (nodes at: 1).
	result extendsToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result types.
	result addTokens: ((nodes at: 3) at: 2) to: result amps.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_parameters_opt2: nodes [
	| result |
	result := JavaTypeParametersNode new.
	result lt: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result parameters.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result gt: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForunary_expression3: nodes [
	| result |
	result := JavaUnaryAdditionNode new.
	result plus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForunary_expression4: nodes [
	| result |
	result := JavaUnarySubtractionNode new.
	result minus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForunary_expression_not_plus_minus2: nodes [
	| result |
	result := JavaUnaryBitInvertNode new.
	result tilde: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForunary_expression_not_plus_minus3: nodes [
	| result |
	result := JavaUnaryNotNode new.
	result bang: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForuntyped_lambda_parameter1: nodes [
	| result |
	result := JavaParameterNode new.
	result variable: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForvariable_declarator1: nodes [
	| result |
	result := JavaVariableDeclarationNode new.
	result variable: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForvariable_declarator_id1: nodes [
	| result |
	result := JavaVariableNameNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForvariable_declarator_id2: nodes [
	| result |
	result := JavaArrayVariableNameNode new.
	result variable: (nodes at: 1).
	result leftBracket: (nodes at: 2).
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForvoid1: nodes [
	| result |
	result := JavaVoidTypeNode new.
	result voidToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForwhile_statement1: nodes [
	| result |
	result := JavaWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #private }
JavaParser >> tryAllTokens [
	^ (self class keywords includes: currentToken value) not
]
