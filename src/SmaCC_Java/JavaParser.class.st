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
#[ 0 6 0 10] 
#[ 0 14 0 69] 
#[ 0 14 0 81] 
#[ 0 14 0 89] 
#[ 0 14 0 93] 
#[ 0 14 0 105] 
#[ 0 14 0 109] 
#[ 0 14 0 113] 
#[ 0 14 0 125] 
#[ 0 14 0 129] 
#[ 0 14 0 157] 
#[ 0 14 0 22 0 237] 
#[ 0 22 2 9] 
#[ 0 18 0 69] 
#[ 0 22 2 245] 
#[ 0 22 0 237] 
#[ 0 22 0 126] 
#[ 0 134 3 157] 
#[ 0 158 3 177] 
#[ 0 69 0 166] 
#[ 0 158 3 213] 
#[ 0 202 4 29] 
#[ 0 14 0 22 2 9] 
#[ 0 22 0 126 0 214] 
#[ 0 126 0 214] 
#[ 0 65 0 126] 
#[ 0 242 4 117] 
#[ 0 242 4 121] 
#[ 0 242 4 125] 
#[ 0 246 4 129] 
#[ 0 246 4 133] 
#[ 0 250 4 137] 
#[ 0 250 4 141] 
#[ 0 250 4 145] 
#[ 0 254 4 149] 
#[ 0 254 4 153] 
#[ 0 254 4 157] 
#[ 0 254 4 161] 
#[ 0 254 4 165] 
#[ 1 2 4 169] 
#[ 1 2 4 173] 
#[ 1 6 4 177] 
#[ 1 10 4 181] 
#[ 1 14 4 185] 
#[ 1 18 4 189] 
#[ 1 22 4 193] 
#[ 1 22 4 197] 
#[ 0 238 1 26] 
#[ 0 81 1 38] 
#[ 0 89 1 38] 
#[ 0 93 1 38] 
#[ 0 105 1 38] 
#[ 0 113 1 38] 
#[ 0 125 1 38] 
#[ 0 129 1 38] 
#[ 0 157 1 38] 
#[ 1 38 3 13] 
#[ 0 22 0 65] 
#[ 0 14 0 22 2 245] 
#[ 0 22 5 129] 
#[ 0 209 1 122] 
#[ 0 22 6 233] 
#[ 0 14 6 1] 
#[ 2 166 4 117] 
#[ 2 166 4 121] 
#[ 2 166 4 125] 
#[ 2 170 4 129] 
#[ 2 170 4 133] 
#[ 2 174 4 137] 
#[ 2 174 4 141] 
#[ 2 174 4 145] 
#[ 2 178 4 149] 
#[ 2 178 4 153] 
#[ 2 178 4 157] 
#[ 2 178 4 161] 
#[ 2 178 4 165] 
#[ 2 182 4 169] 
#[ 2 182 4 173] 
#[ 2 186 4 177] 
#[ 2 190 4 181] 
#[ 2 194 4 185] 
#[ 2 198 4 189] 
#[ 0 126 8 37] 
#[ 0 22 8 161] 
#[ 3 114 9 89] 
#[ 0 158 10 65] 
#[ 4 78 10 205] 
#[ 4 205 4 238] 
#[ 0 81 1 38 4 238] 
#[ 0 89 1 38 4 238] 
#[ 0 93 1 38 4 238] 
#[ 0 105 1 38 4 238] 
#[ 0 113 1 38 4 238] 
#[ 0 125 1 38 4 238] 
#[ 0 129 1 38 4 238] 
#[ 0 157 1 38 4 238] 
#[ 1 38 4 238] 
#[ 1 38 3 13 4 238]
	).
]

{ #category : #'generated-accessing' }
JavaParser class >> cacheId [
	^'2019-02-18T19:20:24.011193+01:00'
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
	: package_declaration_opt 'packageDeclaration'
		import_declarations_opt 
		type_declarations_opt {{ProgramFile}}
	;
package_declaration_opt 
	: package_declaration
	|
	;
import_declarations_opt 
	: import_declarations
	|
	;
type_declarations_opt 
	: type_declarations 
	|
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
	: ""import"" 'importToken' static_opt name 'name' "";"" 'semicolon' {{SingleTypeImportDeclaration}}
	;
type_import_on_demand_declaration 
	: ""import"" 'importToken' static_opt name 'name' ""."" 'period' ""*"" 'star' "";"" 'semicolon' {{TypeImportOnDemandDeclaration}}
	;
type_declaration 
	: class_declaration 
	| interface_declaration 
	| annotation_interface_declaration
	| "";"" 'semicolon' {{EmptyDeclaration}}
	;
# 19.7) Productions used only in the LALR(1) grammar

modifiers_opt
	:
	| modifiers 
	;
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
	: modifiers_opt ""class"" 'classToken' <IDENTIFIER> 'name' type_parameters_opt 'typeParameters' super_opt interfaces_opt class_body {{ClassDeclaration}}
	| enum_declaration
	;
super 
	: ""extends"" 'extendsToken' class_type 'superclass'
	;
super_opt 
	: 
	| super 
	;
interfaces 
	: ""implements"" 'implementsToken' interface_type_list
	;
interfaces_opt
	: 
	| interfaces 
	;
interface_type_list 
	: interface_type 'interface' 
	| interface_type_list "","" 'comma' interface_type 'interface' 
	;
class_body 
	: ""{"" 'leftBrace' class_body_declarations_opt ""}"" 'rightBrace'
	;
class_body_declarations_opt 
	: 
	| class_body_declarations
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
	: modifiers_opt type 'type' variable_declarators "";"" 'semicolon' {{FieldDeclaration}}
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
	: modifiers_opt type_parameters_opt 'typeParameters' type 'type' method_declarator 'declarator' throws_opt 'throws'
	| modifiers_opt type_parameters_opt 'typeParameters' void 'type' method_declarator 'declarator' throws_opt 'throws'
	;
####
void 
	: ""void"" 'voidToken' {{VoidType}} 
	;
####
method_declarator 
	: <IDENTIFIER> 'name' ""("" 'leftParen' formal_parameter_list_opt "")"" 'rightParen' {{MethodDeclarator}}
	| method_declarator 'declarator' ""["" 'leftBracket' ""]"" 'rightBracket' {{ArrayMethodDeclarator}} # deprecated
	# be careful; the above production also allows 'void foo() []'
	;
formal_parameter_list_opt 
	: 
	| formal_parameter_list 
	;
formal_parameter_list 
	: formal_parameter 'parameter' 
	| formal_parameter_list "","" 'comma' formal_parameter 'parameter' 
	;
formal_parameter 
	: variable_modifiers type 'type' variable_declarator_id 'variable' {{Parameter}}
	| variable_modifiers type 'type' ""..."" 'varArgsToken' variable_declarator_id 'variable' {{VariableArgumentParameter}}
	;
throws_opt 
	: 
	| throws 
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
	: modifiers_opt constructor_declarator throws_opt 'throws'
			constructor_body 'body' {{ConstructorDeclaration}}
	;
constructor_declarator 
	: type_parameters_opt 'typeParameters' simple_name 'name' ""("" 'leftParen' formal_parameter_list_opt "")"" 'rightParen'
	;
constructor_body 
	: ""{"" 'leftBrace' explicit_constructor_invocation 'statement'
			block_statements ""}"" 'rightBrace' {{Block}}
	| ""{"" 'leftBrace' explicit_constructor_invocation 'statement' ""}"" 'rightBrace' {{Block}}
	| ""{"" 'leftBrace' block_statements ""}"" 'rightBrace' {{Block}}
	| ""{"" 'leftBrace' ""}"" 'rightBrace' {{Block}}
	;
explicit_constructor_invocation 
	: ""this"" 'thisToken' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' "";"" 'semicolon' {{ThisConstructorInvocation}}
	| ""super"" 'superToken' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' "";"" 'semicolon' {{SuperConstructorInvocation}}
	| primary 'primary' ""."" 'period' ""this"" 'thisToken' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' "";"" 'semicolon' {{ThisConstructorInvocation}}
	| primary 'primary' ""."" 'period' ""super"" 'superToken' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' "";"" 'semicolon' {{SuperConstructorInvocation}}
	;
# 19.9) Interfaces
# 19.9.1) Interface Declarations
interface_declaration 
	: modifiers_opt ""interface"" 'interfaceToken' <IDENTIFIER> 'name' type_parameters_opt 'typeParameters' extends_interfaces_opt 
			interface_body {{InterfaceDeclaration}}
	;
annotation_interface_declaration
	: modifiers_opt ""@"" 'atToken' ""interface"" 'interfaceToken' <IDENTIFIER> 'name' annotation_interface_body {{AnnotationInterface}}
	;
annotation_interface_body
	: ""{"" 'leftBrace' annotation_interface_member_declarations_opt ""}"" 'rightBrace'
	;
annotation_interface_member_declarations_opt
	: 
	| annotation_interface_member_declarations
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
extends_interfaces_opt 
	: 
	| extends_interfaces 
	;
extends_interfaces 
	: ""extends"" 'extendsToken' interface_type 'interfaceType' 
	| extends_interfaces "","" 'comma' interface_type 'interfaceType' 
	;
interface_body 
	: ""{"" 'leftBrace' interface_member_declarations_opt ""}"" 'rightBrace'
	;
interface_member_declarations_opt 
	: 
	| interface_member_declarations 
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
	: interface_modifiers_opt type_parameters_opt 'typeParameters' type 'type' method_declarator 'declarator' throws_opt 'throws'
	| interface_modifiers_opt type_parameters_opt 'typeParameters' void 'type' method_declarator 'declarator' throws_opt 'throws'
	;
interface_modifiers_opt
	: modifiers_opt
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
	:	""{"" 'leftBrace' block_statements_opt ""}"" 'rightBrace' {{Block}}
	;
block_statements_opt 
	: 
	| block_statements 
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
	: ""for"" 'forToken' ""("" 'leftParen' for_init_opt 'initial' "";"" 'firstSemicolon' expression_opt 'test' "";"" 'secondSemicolon'
			for_update_opt 'update' "")"" 'rightParen' statement 'statement' {{ForStatement}}
	;
for_init_opt 
	: 
	| for_init 
	;
for_init 
	: statement_expression_list 
	| local_variable_declaration 
	;
for_update_opt 
	: 
	| for_update 
	;
for_update 
	: statement_expression_list 
	;
statement_expression_list 
	: statement_expression 'expression' {{StatementExpressionList}}
	| statement_expression_list "","" 'comma' statement_expression 'expression' {{StatementExpressionList}}
	;
identifier_opt 
	: 
	| <IDENTIFIER> 
	;
break_statement 
	: ""break"" 'breakToken' identifier_opt 'identifier' "";"" 'semicolon' {{BreakStatement}}
	;
continue_statement 
	: ""continue"" 'continueToken' identifier_opt 'identifier' "";"" 'semicolon' {{ContinueStatement}}
	;
return_statement 
	: ""return"" 'returnToken' expression_opt 'expression' "";"" 'semicolon' {{ReturnStatement}}
	;
throw_statement 
	: ""throw"" 'throwToken' expression 'expression' "";"" 'semicolon' {{ThrowStatement}}
	;
synchronized_statement 
	: ""synchronized"" 'synchronizedToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' block 'block' {{SynchronizedStatement}}
	;
try_statement 
	: ""try"" 'tryToken' try_resources_opt block 'block' catches {{TryStatement}}
	| ""try"" 'tryToken' try_resources_opt block 'block' catches_opt finally 'finally' {{TryStatement}}
	| ""try"" 'tryToken' try_resources block 'block' {{TryStatement}}
	;
try_resources_opt
	:
	| try_resources
	;
try_resources
	: ""("" 'leftParen' try_resources_list semicolon_opt "")"" 'rightParen'
	;
try_resources_list
	: try_resource 'resource'
	| try_resources_list "";"" 'semicolon' try_resource 'resource' 
	;
try_resource
	: variable_modifiers type 'type' initialized_variable_declarator 'variableDeclaration' {{LocalVariableDeclaration}}
	;
semicolon_opt
	:
	| "";"" 'semicolon'
	;
catches_opt 
	: 
	| catches 
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
	: ""("" 'leftParen' lambda_parameter_list_opt "")"" 'rightParen' 
	| untyped_lambda_parameter 'parameter'
	;
lambda_parameter_list_opt
	:
	| lambda_parameter_list
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
	: ""new"" 'newToken' class_type 'type' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{New}}
	| ""new"" 'newToken' class_type 'type' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' class_body {{NewClass}}
	| primary_or_name 'primary' ""."" 'period' ""new"" 'newToken' type_arguments_opt <IDENTIFIER> 'name' 
			type_arguments_or_diamond_opt ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{New}}
	| primary_or_name 'primary' ""."" 'period' ""new"" 'newToken' type_arguments_opt <IDENTIFIER> 'name' 
			type_arguments_or_diamond_opt ""("" 'leftParen' argument_list_opt "")"" 'rightParen' class_body {{NewClass}}
	;
argument_list_opt 
	: 
	| argument_list 
	;
argument_list 
	: expression 'expression' 
	| argument_list "","" 'comma' expression 'expression'
	;
array_creation_expression 
	: ""new"" 'newToken' primitive_type 'type' dim_exprs dims_opt {{NewArray}}
	| ""new"" 'newToken' class_or_interface_type 'type' dim_exprs dims_opt {{NewArray}}
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
dims_opt 
	: 
	| dims 
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
	: type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{MethodInvocation}}
	| primary_or_name 'receiver' ""."" 'period' type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{MethodInvocation}}
	| ""super"" 'superToken' ""."" 'period' type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{MethodInvocation}}
	| name 'receiver' ""."" 'superPeriod' ""super"" 'superToken' ""."" 'period' type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{MethodInvocation}}
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
	| ""("" 'leftParen' reference_type 'type' additional_bound_opt "")"" 'rightParen' unary_expression_not_plus_minus 'expression' {{CastExpression}}
	| ""("" 'leftParen' reference_type 'type' additional_bound_opt "")"" 'rightParen' lambda_expression 'expression' {{CastExpression}}
	;
additional_bound_opt
	:
	| ""&"" 'ampToken' interface_type 'interfaceType'
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
expression_opt 
	: 
	| expression 
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
	: ""@"" 'at' name 'name' annotation_args_opt {{Annotation}}
	;
annotation_args_opt
	:
	| ""("" 'leftParen' annotation_args "")"" 'rightParen'
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
	: ""{"" 'leftBrace' elementValues_opt comma_opt ""}"" 'rightBrace' {{ElementArrayInitializer}}
	;
elementValues_opt
	:
	| elementValues
	;
elementValues
	: elementValue 'value'
	| elementValues "","" 'comma' elementValue 'value'
	;
comma_opt
	:
	| "","" 'comma'
	;
static_opt
	:
	| ""static"" 'staticToken'
	;
enum_declaration
	: modifiers_opt ""enum"" 'enumToken' <IDENTIFIER> 'name' interfaces_opt enum_body {{EnumDeclaration}}
	;
enum_body
	: ""{"" 'leftBrace' enum_constants_opt comma_opt enum_body_declarations_opt ""}"" 'rightBrace'
	;
enum_constants_opt
	:
	| enum_constants
	;
enum_constants
	: enum_constant 'constant'
	| enum_constants "","" 'comma' enum_constant 'constant'
	;
enum_constant
	: annotations <IDENTIFIER> 'name' arguments_opt class_body_opt {{EnumConstant}}
	;
arguments_opt
	:
	| ""("" 'leftParen' argument_list_opt "")"" 'rightParen'
	;
class_body_opt
	:
	| class_body
	;
enum_body_declarations_opt
	:
	| enum_body_declarations
	;
enum_body_declarations
	: "";"" 'semicolon' class_body_declarations_opt
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
	: <IDENTIFIER> 'name' extends_type_parameter_opt {{TypeParameter}}
	;
extends_type_parameter_opt
	:
	| ""extends"" 'extendsToken' type_bound 
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
	#(126 0 #nil) 
	#(289 0 #reduceActionForannotations1:) 
	#(324 0 #reduceActionForannotations1:) 
	#(136 0 #reduceActionForannotations1:) 
	#(316 0 #reduceActionFortype_arguments_opt1:) 
	#(110 1 #liftFirstValue:) 
	#(127 0 #reduceActionForannotations1:) 
	#(126 1 #liftFirstValue:) 
	#(201 1 #reduceActionForempty_statement1:) 
	#(138 1 #reduceActionFormodifier5:) 
	#(113 1 #reduceActionForprimitive_type2:) 
	#(221 0 #nil) 
	#(115 1 #reduceActionForintegral_type1:) 
	#(115 1 #reduceActionForintegral_type5:) 
	#(116 1 #reduceActionForfloating_point_type2:) 
	#(116 1 #reduceActionForfloating_point_type1:) 
	#(115 1 #reduceActionForintegral_type3:) 
	#(115 1 #reduceActionForintegral_type4:) 
	#(286 0 #nil) 
	#(115 1 #reduceActionForintegral_type2:) 
	#(241 1 #reduceActionForprimary_no_new_array2:) 
	#(228 0 #reduceActionFortype_arguments_opt1:) 
	#(158 1 #reduceActionForvoid1:) 
	#(194 0 #reduceActionForannotations1:) 
	#(111 1 #reduceActionForliteral1:) 
	#(111 1 #reduceActionForliteral2:) 
	#(111 1 #reduceActionForliteral3:) 
	#(111 1 #reduceActionForliteral4:) 
	#(111 1 #reduceActionForliteral5:) 
	#(111 1 #reduceActionForliteral6:) 
	#(123 1 #reduceActionForprimary_no_new_array2:) 
	#(241 1 #liftFirstValue:) 
	#(112 1 #liftFirstValue:) 
	#(113 1 #liftFirstValue:) 
	#(114 1 #liftFirstValue:) 
	#(117 1 #liftFirstValue:) 
	#(262 1 #liftFirstValue:) 
	#(284 1 #liftFirstValue:) 
	#(326 1 #liftFirstValue:) 
	#(122 1 #liftFirstValue:) 
	#(136 1 #reduceActionFormodifiers_opt2:) 
	#(137 1 #reduceActionFormodifiers1:) 
	#(196 1 #liftFirstValue:) 
	#(200 1 #liftFirstValue:) 
	#(199 1 #liftFirstValue:) 
	#(240 1 #liftFirstValue:) 
	#(204 1 #liftFirstValue:) 
	#(138 1 #liftFirstValue:) 
	#(139 1 #liftFirstValue:) 
	#(118 1 #reduceActionForclass_or_interface_type1:) 
	#(320 1 #liftFirstValue:) 
	#(244 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(154 1 #reduceActionForvariable_declarator_id1:) 
	#(247 1 #reduceActionForuntyped_lambda_parameter1:) 
	#(287 1 #liftFirstValue:) 
	#(243 1 #reduceActionForlambda_parameters2:) 
	#(268 1 #liftFirstValue:) 
	#(271 1 #liftFirstValue:) 
	#(265 1 #liftFirstValue:) 
	#(272 1 #liftFirstValue:) 
	#(273 1 #liftFirstValue:) 
	#(274 1 #liftFirstValue:) 
	#(275 1 #liftFirstValue:) 
	#(276 1 #liftFirstValue:) 
	#(277 1 #liftFirstValue:) 
	#(278 1 #liftFirstValue:) 
	#(279 1 #liftFirstValue:) 
	#(280 1 #liftFirstValue:) 
	#(281 1 #liftFirstValue:) 
	#(282 1 #liftFirstValue:) 
	#(135 1 #reduceActionFortype_declaration4:) 
	#(135 1 #liftFirstValue:) 
	#(310 0 #nil) 
	#(149 1 #liftFirstValue:) 
	#(148 1 #liftFirstValue:) 
	#(148 1 #reduceActionForclass_body_declaration4:) 
	#(300 0 #nil) 
	#(128 0 #reduceActionForannotations1:) 
	#(127 1 #reduceActionFormodifiers_opt2:) 
	#(129 1 #reduceActionFormodifiers1:) 
	#(132 1 #liftFirstValue:) 
	#(289 2 #reduceActionForannotations2:) 
	#(266 2 #reduceActionForpreincrement_expression1:) 
	#(267 2 #reduceActionForpredecrement_expression1:) 
	#(319 0 #reduceActionFortype_argument_type3:) 
	#(316 2 #reduceActionFortype_arguments_opt3:) 
	#(318 1 #reduceActionFortype_argument1:) 
	#(317 1 #reduceActionFortype_arguments1:) 
	#(291 0 #reduceActionFortype_arguments_opt1:) 
	#(221 1 #liftFirstValue:) 
	#(216 0 #nil) 
	#(119 1 #liftFirstValue:) 
	#(286 1 #liftFirstValue:) 
	#(228 1 #reduceActionFormodifiers_opt2:) 
	#(194 1 #reduceActionFormodifiers_opt2:) 
	#(195 1 #reduceActionFormodifiers1:) 
	#(321 2 #reduceActionForsimple_type_name1:) 
	#(121 2 #reduceActionForarray_type1:) 
	#(257 1 #reduceActionFordims1:) 
	#(137 2 #reduceActionForannotations2:) 
	#(197 2 #reduceActionForlocal_variable_declaration_statement1:) 
	#(203 2 #reduceActionForexpression_statement1:) 
	#(263 2 #reduceActionForpostincrement_expression1:) 
	#(264 2 #reduceActionForpostdecrement_expression1:) 
	#(285 1 #liftFirstValue:) 
	#(325 1 #reduceActionFormodifier5:) 
	#(325 1 #liftFirstValue:) 
	#(324 2 #reduceActionForannotations2:) 
	#(268 2 #reduceActionForunary_expression_not_plus_minus3:) 
	#(270 0 #reduceActionFortype_argument_type3:) 
	#(246 1 #liftFirstValue:) 
	#(244 1 #reduceActionFormodifiers_opt2:) 
	#(245 1 #reduceActionFortype_arguments1:) 
	#(265 2 #reduceActionForunary_expression3:) 
	#(265 2 #reduceActionForunary_expression4:) 
	#(268 2 #reduceActionForunary_expression_not_plus_minus2:) 
	#(166 1 #reduceActionFormethod_body2:) 
	#(156 2 #reduceActionFormethod_declaration1:) 
	#(166 1 #liftFirstValue:) 
	#(167 2 #reduceActionForstatic_initializer1:) 
	#(163 0 #nil) 
	#(300 1 #liftFirstValue:) 
	#(125 3 #reduceActionForcompilation_unit1:) 
	#(128 1 #reduceActionFormodifiers_opt2:) 
	#(130 1 #reduceActionFormodifiers1:) 
	#(129 2 #reduceActionForannotations2:) 
	#(241 3 #reduceActionForprimary_no_new_array3:) 
	#(318 2 #reduceActionFortype_argument2:) 
	#(316 3 #reduceActionFortype_arguments_opt2:) 
	#(292 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(290 3 #reduceActionForannotation1:) 
	#(239 3 #reduceActionForassert_statement1:) 
	#(222 3 #reduceActionForbreak_statement1:) 
	#(223 3 #reduceActionForcontinue_statement1:) 
	#(217 1 #liftFirstValue:) 
	#(220 1 #reduceActionForstatement_expression_list1:) 
	#(216 1 #liftFirstValue:) 
	#(256 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(254 1 #reduceActionFormodifiers1:) 
	#(251 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(224 3 #reduceActionForreturn_statement1:) 
	#(259 3 #reduceActionForfield_access2:) 
	#(225 3 #reduceActionForthrow_statement1:) 
	#(232 0 #nil) 
	#(230 1 #reduceActionFortype_arguments1:) 
	#(233 0 #reduceActionForannotations1:) 
	#(227 3 #reduceActionFortry_statement3:) 
	#(193 3 #reduceActionForblock1:) 
	#(195 2 #reduceActionForannotations2:) 
	#(202 3 #reduceActionForlabeled_statement1:) 
	#(241 3 #reduceActionForprimary_no_new_array10:) 
	#(258 2 #reduceActionForempty_dim_expr1:) 
	#(257 2 #reduceActionFordims2:) 
	#(249 3 #reduceActionFormethod_reference_expression2:) 
	#(241 3 #reduceActionForprimary_no_new_array11:) 
	#(124 3 #reduceActionForqualified_name1:) 
	#(143 0 #reduceActionForinterfaces_opt1:) 
	#(259 3 #reduceActionForfield_access1:) 
	#(283 3 #reduceActionForassignment1:) 
	#(198 3 #reduceActionForlocal_variable_declaration1:) 
	#(151 1 #reduceActionFortype_arguments1:) 
	#(152 1 #liftFirstValue:) 
	#(152 1 #reduceActionForvariable_declarator1:) 
	#(243 3 #reduceActionFortype_arguments_opt2:) 
	#(154 3 #reduceActionForvariable_declarator_id2:) 
	#(248 1 #liftFirstValue:) 
	#(242 3 #reduceActionForlambda_expression1:) 
	#(271 3 #reduceActionFormultiplicative_expression4:) 
	#(272 3 #reduceActionFormultiplicative_expression4:) 
	#(273 3 #reduceActionFormultiplicative_expression4:) 
	#(274 3 #reduceActionFormultiplicative_expression4:) 
	#(275 3 #reduceActionFormultiplicative_expression4:) 
	#(276 3 #reduceActionFormultiplicative_expression4:) 
	#(277 3 #reduceActionFormultiplicative_expression4:) 
	#(278 3 #reduceActionFormultiplicative_expression4:) 
	#(279 3 #reduceActionFormultiplicative_expression4:) 
	#(280 3 #reduceActionFormultiplicative_expression4:) 
	#(313 0 #reduceActionForinterfaces_opt1:) 
	#(311 1 #reduceActionFortype_arguments1:) 
	#(163 1 #liftFirstValue:) 
	#(130 2 #reduceActionForannotations2:) 
	#(131 4 #reduceActionForpackage_declaration1:) 
	#(319 2 #reduceActionForempty_dim_expr1:) 
	#(317 3 #reduceActionFortype_arguments2:) 
	#(297 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(295 1 #liftFirstValue:) 
	#(292 1 #reduceActionFormodifiers_opt2:) 
	#(293 1 #reduceActionFortype_arguments1:) 
	#(292 1 #reduceActionFortype_arguments1:) 
	#(254 2 #reduceActionForannotations2:) 
	#(253 4 #reduceActionForarray_creation_expression1:) 
	#(256 1 #reduceActionFormodifiers_opt2:) 
	#(253 4 #reduceActionForarray_creation_expression3:) 
	#(251 1 #reduceActionFormodifiers_opt2:) 
	#(252 1 #reduceActionFortype_arguments1:) 
	#(232 1 #liftFirstValue:) 
	#(227 4 #reduceActionFortry_statement1:) 
	#(233 1 #reduceActionFormodifiers_opt2:) 
	#(234 1 #reduceActionFormodifiers1:) 
	#(261 4 #reduceActionForarray_access1:) 
	#(141 0 #reduceActionFortype_argument_type3:) 
	#(143 1 #reduceActionFormodifiers_opt2:) 
	#(179 0 #reduceActionForinterfaces_opt1:) 
	#(322 4 #reduceActionForqualified_type_name1:) 
	#(269 4 #reduceActionForcast_expression1:) 
	#(120 1 #liftFirstValue:) 
	#(270 2 #reduceActionForempty_dim_expr1:) 
	#(245 3 #reduceActionFortype_arguments2:) 
	#(162 3 #reduceActionForformal_parameter1:) 
	#(312 2 #reduceActionFortype_parameter1:) 
	#(310 3 #reduceActionFortype_parameters_opt2:) 
	#(150 4 #reduceActionForfield_declaration1:) 
	#(165 1 #reduceActionFortype_arguments1:) 
	#(164 2 #reduceActionForthrows1:) 
	#(168 4 #reduceActionForconstructor_declaration1:) 
	#(160 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(133 4 #reduceActionForsingle_type_import_declaration1:) 
	#(298 1 #reduceActionFortype_arguments1:) 
	#(299 0 #nil) 
	#(297 1 #reduceActionFormodifiers_opt2:) 
	#(291 3 #reduceActionFortype_arguments_opt2:) 
	#(239 5 #reduceActionForassert_statement2:) 
	#(220 3 #reduceActionForstatement_expression_list2:) 
	#(205 5 #reduceActionForif_then_statement1:) 
	#(255 3 #reduceActionFordim_expr1:) 
	#(191 2 #reduceActionForarray_initializer4:) 
	#(192 1 #reduceActionFortype_arguments1:) 
	#(155 1 #liftFirstValue:) 
	#(250 5 #reduceActionForclass_instance_creation_expression1:) 
	#(207 5 #reduceActionForswitch_statement1:) 
	#(226 5 #reduceActionForsynchronized_statement1:) 
	#(230 3 #reduceActionFortype_arguments2:) 
	#(229 4 #reduceActionFortry_resources1:) 
	#(231 3 #reduceActionFortry_resource1:) 
	#(227 5 #reduceActionFortry_statement2:) 
	#(234 2 #reduceActionForannotations2:) 
	#(213 5 #reduceActionForwhile_statement1:) 
	#(259 5 #reduceActionForfield_access3:) 
	#(141 1 #reduceActionFormodifiers_opt2:) 
	#(144 1 #reduceActionFortype_arguments1:) 
	#(142 2 #reduceActionForinterfaces1:) 
	#(303 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(301 5 #reduceActionForenum_declaration1:) 
	#(179 1 #reduceActionFormodifiers_opt2:) 
	#(260 5 #reduceActionFormethod_invocation1:) 
	#(151 3 #reduceActionFortype_arguments2:) 
	#(153 3 #reduceActionForinitialized_variable_declarator1:) 
	#(315 0 #reduceActionFortype_arguments_opt1:) 
	#(269 5 #reduceActionForcast_expression3:) 
	#(162 4 #reduceActionForformal_parameter2:) 
	#(281 5 #reduceActionForconditional_expression2:) 
	#(175 0 #reduceActionForannotations1:) 
	#(173 5 #reduceActionForannotation_interface_declaration1:) 
	#(314 1 #reduceActionFortype_arguments1:) 
	#(313 2 #reduceActionForinterfaces1:) 
	#(311 3 #reduceActionFortype_arguments2:) 
	#(157 5 #reduceActionFormethod_header1:) 
	#(170 2 #reduceActionForconstructor_body4:) 
	#(160 1 #reduceActionFormodifiers_opt2:) 
	#(161 1 #reduceActionFortype_arguments1:) 
	#(299 1 #liftFirstValue:) 
	#(294 3 #reduceActionForelementValuePair1:) 
	#(293 3 #reduceActionFortype_arguments2:) 
	#(218 0 #nil) 
	#(191 3 #reduceActionForarray_initializer3:) 
	#(191 3 #reduceActionForarray_initializer2:) 
	#(146 0 #reduceActionForannotations1:) 
	#(250 6 #reduceActionForclass_instance_creation_expression2:) 
	#(252 3 #reduceActionFortype_arguments2:) 
	#(208 2 #reduceActionForswitch_block4:) 
	#(209 1 #reduceActionFormodifiers1:) 
	#(211 1 #reduceActionFormodifiers1:) 
	#(238 2 #reduceActionForfinally1:) 
	#(140 2 #reduceActionForempty_dim_expr1:) 
	#(303 1 #reduceActionFormodifiers_opt2:) 
	#(304 1 #reduceActionFortype_arguments1:) 
	#(180 2 #reduceActionForextends_interfaces1:) 
	#(182 0 #reduceActionForannotations1:) 
	#(172 6 #reduceActionForinterface_declaration1:) 
	#(177 1 #liftFirstValue:) 
	#(175 1 #reduceActionFormodifiers_opt2:) 
	#(176 1 #reduceActionFormodifiers1:) 
	#(178 1 #liftFirstValue:) 
	#(159 3 #reduceActionFormethod_declarator2:) 
	#(165 3 #reduceActionFortype_arguments2:) 
	#(170 3 #reduceActionForconstructor_body2:) 
	#(170 3 #reduceActionForblock1:) 
	#(169 5 #reduceActionForconstructor_declarator1:) 
	#(134 6 #reduceActionFortype_import_on_demand_declaration1:) 
	#(296 4 #reduceActionForelementValueArrayInitializer1:) 
	#(298 3 #reduceActionFortype_arguments2:) 
	#(214 7 #reduceActionFordo_statement1:) 
	#(218 1 #liftFirstValue:) 
	#(219 1 #liftFirstValue:) 
	#(206 7 #reduceActionForif_then_else_statement1:) 
	#(191 4 #reduceActionForarray_initializer1:) 
	#(192 3 #reduceActionFortype_arguments2:) 
	#(146 1 #reduceActionFormodifiers_opt2:) 
	#(147 1 #reduceActionFormodifiers1:) 
	#(260 7 #reduceActionFormethod_invocation3:) 
	#(288 1 #liftFirstValue:) 
	#(212 2 #reduceActionForswitch_label2:) 
	#(208 3 #reduceActionForswitch_block2:) 
	#(209 2 #reduceActionForannotations2:) 
	#(208 3 #reduceActionForswitch_block3:) 
	#(210 2 #reduceActionForswitch_block_statement_group1:) 
	#(211 2 #reduceActionForannotations2:) 
	#(237 1 #reduceActionFortype_arguments1:) 
	#(139 7 #reduceActionForclass_declaration1:) 
	#(144 3 #reduceActionFortype_arguments2:) 
	#(306 0 #reduceActionFortype_arguments_opt1:) 
	#(308 0 #reduceActionForenum_body_declarations_opt1:) 
	#(189 1 #reduceActionFormodifier5:) 
	#(184 1 #liftFirstValue:) 
	#(188 1 #reduceActionFormodifiers_opt2:) 
	#(185 1 #liftFirstValue:) 
	#(182 1 #reduceActionFormodifiers_opt2:) 
	#(183 1 #reduceActionFormodifiers1:) 
	#(188 1 #reduceActionFormodifiers1:) 
	#(180 3 #reduceActionForextends_interfaces2:) 
	#(315 2 #reduceActionFortype_arguments_opt3:) 
	#(260 7 #reduceActionFormethod_invocation2:) 
	#(190 2 #reduceActionForabstract_method_declaration1:) 
	#(174 3 #reduceActionForannotation_interface_body1:) 
	#(176 2 #reduceActionForannotations2:) 
	#(314 3 #reduceActionFortype_arguments2:) 
	#(159 4 #reduceActionFormethod_declarator1:) 
	#(170 4 #reduceActionForconstructor_body1:) 
	#(161 3 #reduceActionFortype_arguments2:) 
	#(145 3 #reduceActionForannotation_interface_body1:) 
	#(147 2 #reduceActionForannotations2:) 
	#(212 3 #reduceActionForswitch_label1:) 
	#(208 4 #reduceActionForswitch_block1:) 
	#(235 5 #reduceActionForcatch_clause1:) 
	#(236 3 #reduceActionForcatch_parameter1:) 
	#(307 0 #reduceActionForclass_body_opt1:) 
	#(308 1 #reduceActionFormodifiers_opt2:) 
	#(304 3 #reduceActionFortype_arguments2:) 
	#(181 3 #reduceActionForannotation_interface_body1:) 
	#(183 2 #reduceActionForannotations2:) 
	#(186 2 #reduceActionFormethod_declaration1:) 
	#(315 3 #reduceActionFortype_arguments_opt2:) 
	#(215 9 #reduceActionForfor_statement1:) 
	#(323 9 #reduceActionForforeach_statement1:) 
	#(237 3 #reduceActionFortype_arguments2:) 
	#(260 9 #reduceActionFormethod_invocation4:) 
	#(307 1 #reduceActionFormodifiers_opt2:) 
	#(305 4 #reduceActionForenum_constant1:) 
	#(309 2 #reduceActionForenum_body_declarations1:) 
	#(302 5 #reduceActionForenum_body1:) 
	#(250 9 #reduceActionForclass_instance_creation_expression3:) 
	#(178 4 #reduceActionForannotation_method_declaration2:) 
	#(171 5 #reduceActionForexplicit_constructor_invocation2:) 
	#(171 5 #reduceActionForexplicit_constructor_invocation1:) 
	#(306 3 #reduceActionFortype_arguments_opt2:) 
	#(250 10 #reduceActionForclass_instance_creation_expression4:) 
	#(187 5 #reduceActionFormethod_header1:) 
	#(171 7 #reduceActionForexplicit_constructor_invocation4:) 
	#(171 7 #reduceActionForexplicit_constructor_invocation3:)
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
	^ #('"!"' '"!="' '"%"' '"%="' '"&"' '"&&"' '"&="' '"("' '")"' '"*"' '"*="' '"+"' '"++"' '"+="' '","' '"-"' '"--"' '"-="' '"->"' '"."' '"..."' '"/"' '"/="' '":"' '"::"' '";"' '"<"' '"<<"' '"<<="' '"<="' '"="' '"=="' '">="' '">>="' '">>>="' '"?"' '"@"' '"["' '"]"' '"^"' '"^="' '"abstract"' '"assert"' '"boolean"' '"break"' '"byte"' '"case"' '"catch"' '"char"' '"class"' '"continue"' '"default"' '"do"' '"double"' '"else"' '"enum"' '"extends"' '"final"' '"finally"' '"float"' '"for"' '"if"' '"implements"' '"import"' '"instanceof"' '"int"' '"interface"' '"long"' '"native"' '"new"' '"package"' '"private"' '"protected"' '"public"' '"return"' '"short"' '"static"' '"strictfp"' '"super"' '"switch"' '"synchronized"' '"this"' '"throw"' '"throws"' '"transient"' '"try"' '"void"' '"volatile"' '"while"' '"{"' '"|"' '"|="' '"||"' '"}"' '"~"' '<GREATER_THAN>' '<SIGNED_RIGHT_SHIFT>' '<UNSIGNED_RIGHT_SHIFT>' '<INTEGER_LITERAL>' '<FLOATING_POINT_LITERAL>' '<BOOLEAN_LITERAL>' '<CHARACTER_LITERAL>' '<STRING_LITERAL>' '<NULL_LITERAL>' '<IDENTIFIER>' '<whitespace>' '<comment>' '<patternToken>' 'B e g i n' 'goal' 'literal' 'type' 'primitive_type' 'numeric_type' 'integral_type' 'floating_point_type' 'reference_type' 'class_or_interface_type' 'class_type' 'interface_type' 'array_type' 'name' 'simple_name' 'qualified_name' 'compilation_unit' 'package_declaration_opt' 'import_declarations_opt' 'type_declarations_opt' 'import_declarations' 'type_declarations' 'package_declaration' 'import_declaration' 'single_type_import_declaration' 'type_import_on_demand_declaration' 'type_declaration' 'modifiers_opt' 'modifiers' 'modifier' 'class_declaration' 'super' 'super_opt' 'interfaces' 'interfaces_opt' 'interface_type_list' 'class_body' 'class_body_declarations_opt' 'class_body_declarations' 'class_body_declaration' 'class_member_declaration' 'field_declaration' 'variable_declarators' 'variable_declarator' 'initialized_variable_declarator' 'variable_declarator_id' 'variable_initializer' 'method_declaration' 'method_header' 'void' 'method_declarator' 'formal_parameter_list_opt' 'formal_parameter_list' 'formal_parameter' 'throws_opt' 'throws' 'class_type_list' 'method_body' 'static_initializer' 'constructor_declaration' 'constructor_declarator' 'constructor_body' 'explicit_constructor_invocation' 'interface_declaration' 'annotation_interface_declaration' 'annotation_interface_body' 'annotation_interface_member_declarations_opt' 'annotation_interface_member_declarations' 'annotation_interface_member_declaration' 'annotation_method_declaration' 'extends_interfaces_opt' 'extends_interfaces' 'interface_body' 'interface_member_declarations_opt' 'interface_member_declarations' 'interface_member_declaration' 'constant_declaration' 'interface_method_declaration' 'interface_method_header' 'interface_modifiers_opt' 'default_modifier' 'abstract_method_declaration' 'array_initializer' 'variable_initializers' 'block' 'block_statements_opt' 'block_statements' 'block_statement' 'local_variable_declaration_statement' 'local_variable_declaration' 'statement' 'statement_without_trailing_substatement' 'empty_statement' 'labeled_statement' 'expression_statement' 'statement_expression' 'if_then_statement' 'if_then_else_statement' 'switch_statement' 'switch_block' 'switch_block_statement_groups' 'switch_block_statement_group' 'switch_labels' 'switch_label' 'while_statement' 'do_statement' 'for_statement' 'for_init_opt' 'for_init' 'for_update_opt' 'for_update' 'statement_expression_list' 'identifier_opt' 'break_statement' 'continue_statement' 'return_statement' 'throw_statement' 'synchronized_statement' 'try_statement' 'try_resources_opt' 'try_resources' 'try_resources_list' 'try_resource' 'semicolon_opt' 'catches_opt' 'catches' 'catch_clause' 'catch_parameter' 'catch_types' 'finally' 'assert_statement' 'primary' 'primary_no_new_array' 'lambda_expression' 'lambda_parameters' 'lambda_parameter_list_opt' 'lambda_parameter_list' 'lambda_parameter' 'untyped_lambda_parameter' 'lambda_function' 'method_reference_expression' 'class_instance_creation_expression' 'argument_list_opt' 'argument_list' 'array_creation_expression' 'dim_exprs' 'dim_expr' 'dims_opt' 'dims' 'empty_dim_expr' 'field_access' 'method_invocation' 'array_access' 'postfix_expression' 'postincrement_expression' 'postdecrement_expression' 'unary_expression' 'preincrement_expression' 'predecrement_expression' 'unary_expression_not_plus_minus' 'cast_expression' 'additional_bound_opt' 'multiplicative_expression' 'additive_expression' 'shift_expression' 'relational_expression' 'equality_expression' 'and_expression' 'exclusive_or_expression' 'inclusive_or_expression' 'conditional_and_expression' 'conditional_or_expression' 'conditional_expression' 'assignment_expression' 'assignment' 'left_hand_side' 'assignment_operator' 'expression_opt' 'expression' 'constant_expression' 'annotations' 'annotation' 'annotation_args_opt' 'annotation_args' 'elementValuePairs' 'elementValuePair' 'elementValue' 'elementValueArrayInitializer' 'elementValues_opt' 'elementValues' 'comma_opt' 'static_opt' 'enum_declaration' 'enum_body' 'enum_constants_opt' 'enum_constants' 'enum_constant' 'arguments_opt' 'class_body_opt' 'enum_body_declarations_opt' 'enum_body_declarations' 'type_parameters_opt' 'type_parameters' 'type_parameter' 'extends_type_parameter_opt' 'type_bound' 'type_arguments_or_diamond_opt' 'type_arguments_opt' 'type_arguments' 'type_argument' 'type_argument_type' 'type_name' 'simple_type_name' 'qualified_type_name' 'foreach_statement' 'variable_modifiers' 'variable_modifier' 'primary_or_name' 'E O F' 'error')
]

{ #category : #generated }
JavaParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #JavaProgramFileNode #JavaProgramFileNode #JavaLiteralNode #JavaTypeNode #JavaPrimitiveTypeNode #JavaPrimitiveTypeNode #JavaPrimitiveTypeNode #JavaPrimitiveTypeNode #JavaTypeNode #JavaClassTypeNode #JavaClassTypeNode #JavaClassTypeNode #JavaArrayTypeNode #JavaNameNode #JavaNameNode #JavaQualifiedNameNode #JavaProgramFileNode #JavaPackageDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaPackageDeclarationNode #JavaSingleTypeImportDeclarationNode #JavaSingleTypeImportDeclarationNode #JavaTypeImportOnDemandDeclarationNode #JavaProgramNode #OrderedCollection #OrderedCollection #JavaProgramNode #JavaDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaProgramNode #JavaProgramNode #JavaFieldDeclarationNode #OrderedCollection #JavaVariableDeclarationNode #JavaInitializedVariableDeclarationNode #JavaProgramNode #JavaProgramNode #JavaMethodDeclarationNode #OrderedCollection #JavaVoidTypeNode #JavaProgramNode #OrderedCollection #OrderedCollection #JavaParameterNode #JavaThrowsNode #JavaThrowsNode #OrderedCollection #JavaProgramNode #JavaStaticInitializerNode #JavaConstructorDeclarationNode #OrderedCollection #JavaBlockNode #JavaStatementNode #JavaInterfaceDeclarationNode #JavaAnnotationInterfaceNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaProgramNode #JavaAbstractMethodDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaProgramNode #JavaFieldDeclarationNode #JavaMethodDeclarationNode #OrderedCollection #Object #JavaModifierNode #JavaAbstractMethodDeclarationNode #JavaArrayInitializerNode #OrderedCollection #JavaBlockNode #OrderedCollection #OrderedCollection #JavaProgramNode #JavaLocalVariableDeclarationStatementNode #JavaLocalVariableDeclarationNode #JavaStatementNode #JavaStatementNode #JavaEmptyStatementNode #JavaLabeledStatementNode #JavaExpressionStatementNode #JavaExpressionNode #JavaIfStatementNode #JavaIfElseStatementNode #JavaSwitchStatementNode #JavaSwitchBlockNode #OrderedCollection #JavaSwitchBlockStatementGroupNode #OrderedCollection #JavaProgramNode #JavaWhileStatementNode #JavaDoWhileStatementNode #JavaForStatementNode #JavaProgramNode #JavaProgramNode #JavaStatementExpressionListNode #JavaStatementExpressionListNode #JavaStatementExpressionListNode #SmaCCToken #JavaBreakStatementNode #JavaContinueStatementNode #JavaReturnStatementNode #JavaThrowStatementNode #JavaSynchronizedStatementNode #JavaTryStatementNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaLocalVariableDeclarationNode #SmaCCToken #OrderedCollection #OrderedCollection #JavaCatchClauseNode #JavaCatchParameterNode #OrderedCollection #JavaFinallyClauseNode #JavaAssertStatementNode #JavaExpressionNode #JavaExpressionNode #JavaLambdaExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaParameterNode #JavaParameterNode #JavaProgramNode #JavaMethodReferenceNode #JavaNewNode #OrderedCollection #OrderedCollection #JavaNewArrayNode #OrderedCollection #JavaDimensionExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaFieldAccessNode #JavaMethodInvocationNode #JavaArrayAccessNode #JavaExpressionNode #JavaPostIncrementExpressionNode #JavaPostDecrementExpressionNode #JavaExpressionNode #JavaPreIncrementExpressionNode #JavaPreDecrementExpressionNode #JavaExpressionNode #JavaCastExpressionNode #OrderedCollection #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaAssignmentNode #JavaExpressionNode #SmaCCToken #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #OrderedCollection #JavaAnnotationNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaElementValuePairNode #JavaProgramNode #JavaElementArrayInitializerNode #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #JavaEnumDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaEnumConstantNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaTypeParametersNode #OrderedCollection #JavaTypeParameterNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaTypeArgumentNode #OrderedCollection #JavaTypeNameNode #JavaTypeNameNode #JavaQualifiedTypeNameNode #JavaForEachStatementNode #OrderedCollection #JavaProgramNode #JavaExpressionNode #SmaCCToken #SmaCCError)
]

{ #category : #generated }
JavaParser class >> transitionTable [
^#(
#[1 0 6 0 26 0 7 0 37 0 6 0 42 0 6 0 50 0 6 0 56 0 6 0 58 0 6 0 64 0 6 0 67 0 6 0 69 0 10 0 71 0 6 0 72 0 6 0 73 0 6 0 74 0 6 0 77 0 6 0 78 0 6 0 81 0 6 0 85 0 6 0 88 0 29 0 110 0 29 0 125 0 37 0 126 0 37 0 131 0 45 1 33 0 6 1 71] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 0 23 0 49 0 18 0 50 0 97 0 51 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 1 61 0 139 1 49 0 158 1 61 0 172 1 61 0 193 1 61 0 196 1 61 0 197 1 69 0 198 1 61 0 199 1 61 0 200 1 61 0 201 1 61 0 202 1 61 0 203 1 93 0 204 1 61 0 205 1 61 0 206 1 61 0 207 1 61 0 213 1 61 0 214 1 61 0 215 1 61 0 222 1 61 0 223 1 61 0 224 1 61 0 225 1 61 0 226 1 61 0 227 1 61 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 1 61 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 61 1 67 1 237 1 68 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 2 121 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 2 121 1 25 2 121 1 26 2 117 1 27 1 205 1 28 2 121 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 2 125 0 26 0 59 0 37 0 73 0 42 0 18 0 50 0 18 0 56 0 109 0 58 0 18 0 67 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 161 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 201 0 88 2 133 0 135 2 137 0 136 1 37 0 137 1 41 0 138 2 133 0 139 2 133 0 172 2 133 0 173 1 41 1 34 2 133 1 45] 
#[1 0 18 0 27 0 69 0 37 0 73 0 42 0 18 0 44 0 18 0 46 0 18 0 49 0 18 0 54 0 109 0 58 0 18 0 60 0 18 0 66 0 18 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 18 0 76 0 161 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 18 0 87 0 201 0 88 0 18 0 105 2 153 0 136 1 37 0 137 1 41 0 138 2 157 0 156 2 161 0 157 1 41 1 34] 
#[1 2 125 0 26 0 18 0 27 0 59 0 37 0 73 0 42 0 18 0 44 0 18 0 46 0 18 0 49 0 18 0 50 0 18 0 54 0 18 0 56 0 109 0 58 0 18 0 60 0 18 0 66 0 18 0 67 0 18 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 18 0 76 2 165 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 18 0 87 0 201 0 88 0 209 0 90 0 18 0 105 2 177 0 135 2 173 0 136 1 37 0 137 1 41 0 138 2 177 0 139 2 177 0 148 2 177 0 149 2 177 0 150 2 177 0 156 2 161 0 157 2 177 0 167 2 177 0 168 2 177 0 172 2 177 0 173 2 201 0 193 1 41 1 34 2 177 1 45] 
#[0 0 0 1 71] 
#[0 0 26 1 71] 
#[1 0 30 0 26 0 30 0 37 0 30 0 42 0 30 0 50 0 30 0 56 0 30 0 58 2 205 0 64 0 30 0 67 0 30 0 69 0 30 0 72 0 30 0 73 0 30 0 74 0 30 0 77 0 30 0 78 0 30 0 81 0 30 0 85 0 30 0 88 2 209 0 127 2 213 0 129 2 217 0 132 2 217 0 133 2 217 0 134 0 30 1 71] 
#[0 0 34 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[1 0 69 0 37 2 229 0 71 2 233 1 34] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 2 237 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 2 237 1 25 2 237 1 26 2 117 1 27 1 205 1 28 2 237 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 249 1 9 2 249 1 10 2 249 1 11 2 249 1 12 2 249 1 13 2 249 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 3 1 1 9 3 1 1 10 3 1 1 11 3 1 1 12 3 1 1 13 3 1 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 0 38 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 3 5 0 36 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 9 0 96 3 13 0 105 3 17 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 3 17 0 117 3 17 0 118 3 17 0 121 3 29 1 61 3 33 1 62 1 221 1 64 1 221 1 65 1 221 1 66] 
#[1 3 37 0 105 3 41 0 122 3 41 0 123 3 41 0 124] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 3 45 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 3 45 1 25 3 45 1 26 2 117 1 27 1 205 1 28 3 45 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 0 46 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[1 0 50 0 26 3 53 0 105 3 53 0 221] 
#[0 0 54 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 58 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[1 0 50 0 26 3 57 0 105 3 57 0 221] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 77 0 43 0 81 0 44 0 85 0 45 0 89 0 46 0 93 0 49 0 97 0 51 0 101 0 53 0 105 0 54 0 113 0 60 0 117 0 61 0 121 0 62 0 125 0 66 0 129 0 68 0 137 0 70 0 153 0 75 0 157 0 76 0 169 0 79 0 173 0 80 3 61 0 81 0 181 0 82 0 185 0 83 0 193 0 86 0 197 0 87 0 205 0 89 0 209 0 90 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 67 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 3 65 0 193 3 65 0 199 3 65 0 200 3 65 0 201 3 65 0 202 3 65 0 203 1 93 0 204 3 65 0 205 3 65 0 206 3 65 0 207 3 65 0 213 3 65 0 214 3 65 0 215 3 65 0 222 3 65 0 223 3 65 0 224 3 65 0 225 3 65 0 226 3 65 0 227 3 65 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 3 65 1 67 1 241 1 70] 
#[0 0 62 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 66 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 3 69 0 8] 
#[0 3 73 0 8] 
#[0 0 70 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 74 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 3 77 0 113 3 77 0 114 3 77 0 115 3 77 0 116 3 81 0 118 3 85 0 119 3 89 1 64 3 89 1 65 3 89 1 66] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 78 0 26 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 3 93 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 3 93 1 25 3 93 1 26 2 117 1 27 1 205 1 28 3 93 1 30 3 93 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 0 82 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 3 101 0 20] 
#[0 3 105 0 8] 
#[1 3 109 0 8 0 42 0 37 0 42 0 42 0 42 0 50 0 42 0 56 0 42 0 58 0 42 0 67 0 42 0 69 0 42 0 72 0 42 0 73 0 42 0 74 0 42 0 77 0 42 0 78 0 42 0 81 0 42 0 85 0 42 0 88] 
#[0 0 86 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 3 113 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 3 113 1 25 3 113 1 26 2 117 1 27 1 205 1 28 3 113 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[1 3 117 0 8 0 90 0 90 3 121 0 228 3 125 0 229] 
#[0 0 94 0 20 0 105] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 3 129 0 8] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 0 23 0 49 0 18 0 50 0 97 0 51 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 0 98 0 94 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 3 141 0 139 1 49 0 158 3 141 0 172 3 141 0 193 3 133 0 194 3 137 0 195 3 141 0 196 3 141 0 197 1 69 0 198 3 141 0 199 3 141 0 200 3 141 0 201 3 141 0 202 3 141 0 203 1 93 0 204 3 141 0 205 3 141 0 206 3 141 0 207 3 141 0 213 3 141 0 214 3 141 0 215 3 141 0 222 3 141 0 223 3 141 0 224 3 141 0 225 3 141 0 226 3 141 0 227 3 141 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 3 141 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 3 141 1 67 1 237 1 68 1 241 1 70] 
#[0 0 102 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 106 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 110 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 114 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 118 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 122 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 0 126 0 4 0 126 0 7 0 126 0 11 0 126 0 13 0 126 0 14 0 126 0 17 0 126 0 18 0 71 0 20 0 126 0 23 3 145 0 24 0 71 0 25 0 65 0 27 0 126 0 29 0 126 0 31 0 126 0 34 0 126 0 35 0 71 0 38 0 126 0 41 0 126 0 92 3 149 1 60] 
#[0 0 130 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 3 153 0 20] 
#[1 0 75 0 20 3 161 0 38 3 165 1 1 3 169 1 2] 
#[0 0 138 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 142 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[0 0 142 0 5 0 9 0 15 0 20 0 21 0 38 0 91 0 96 0 105] 
#[1 0 134 0 20 3 173 0 25] 
#[0 0 146 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[0 0 146 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[1 0 150 0 2 0 150 0 3 0 154 0 4 0 150 0 5 0 150 0 6 0 154 0 7 0 150 0 9 0 150 0 10 0 154 0 11 0 150 0 12 0 150 0 13 0 154 0 14 0 150 0 15 0 150 0 16 0 150 0 17 0 154 0 18 0 79 0 20 0 150 0 22 0 154 0 23 0 150 0 24 0 158 0 25 0 150 0 26 0 150 0 27 0 150 0 28 0 154 0 29 0 150 0 30 0 154 0 31 0 150 0 32 0 150 0 33 0 154 0 34 0 154 0 35 0 150 0 36 3 181 0 38 0 150 0 39 0 150 0 40 0 154 0 41 0 150 0 65 0 150 0 91 0 154 0 92 0 150 0 93 0 150 0 94 0 150 0 96 0 150 0 97 0 150 0 98 0 150 1 71] 
#[0 0 162 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 65 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 91 0 92 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[0 0 162 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 65 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 91 0 92 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[1 3 185 0 50 3 189 0 56 3 193 0 67] 
#[1 0 166 0 27 0 83 0 37 0 73 0 42 0 166 0 44 0 166 0 46 0 166 0 49 0 166 0 50 0 166 0 54 0 166 0 56 0 109 0 58 0 166 0 60 0 166 0 66 0 166 0 67 0 166 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 166 0 76 0 161 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 166 0 87 0 201 0 88 0 166 0 105 3 197 0 138 3 197 1 34] 
#[0 0 170 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 174 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 3 201 0 20] 
#[0 0 174 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 0 1 71] 
#[0 0 174 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 3 205 0 26] 
#[0 0 174 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 182 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 182 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 3 209 0 26] 
#[0 0 182 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 182 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 182 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 182 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 0 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 0 150 0 2 0 150 0 3 0 150 0 5 0 150 0 6 0 150 0 9 0 150 0 10 0 150 0 12 0 150 0 13 0 150 0 15 0 150 0 16 0 150 0 17 0 87 0 20 0 150 0 22 0 150 0 24 0 158 0 25 0 150 0 26 0 150 0 27 0 150 0 28 0 150 0 30 0 150 0 32 0 150 0 33 0 150 0 36 0 150 0 39 0 150 0 40 0 150 0 65 0 150 0 91 0 150 0 93 0 150 0 94 0 150 0 96 0 150 0 97 0 150 0 98 0 150 1 71] 
#[1 0 186 0 2 0 186 0 3 0 186 0 5 0 186 0 6 0 186 0 9 0 186 0 10 0 186 0 12 0 186 0 13 0 186 0 15 0 186 0 16 0 186 0 17 0 186 0 20 0 186 0 22 0 186 0 24 0 186 0 25 0 186 0 26 0 186 0 27 0 186 0 28 0 186 0 30 0 186 0 32 0 186 0 33 0 186 0 36 3 217 0 38 0 186 0 39 0 186 0 40 0 186 0 65 0 186 0 91 0 186 0 93 0 186 0 94 0 186 0 96 0 186 0 97 0 186 0 98 0 186 1 71] 
#[0 0 130 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 0 190 0 9 0 130 0 13 0 190 0 15 0 130 0 17 0 130 0 20 0 130 0 25 0 190 0 26 0 130 0 38] 
#[0 0 186 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 0 130 0 2 0 130 0 3 0 154 0 4 0 130 0 5 0 130 0 6 0 154 0 7 0 130 0 9 0 130 0 10 0 154 0 11 0 130 0 12 0 130 0 13 0 154 0 14 0 130 0 15 0 130 0 16 0 130 0 17 0 154 0 18 0 130 0 20 0 130 0 22 0 154 0 23 0 130 0 24 0 130 0 25 0 130 0 26 0 130 0 27 0 130 0 28 0 154 0 29 0 130 0 30 0 154 0 31 0 130 0 32 0 130 0 33 0 154 0 34 0 154 0 35 0 130 0 36 0 130 0 38 0 130 0 39 0 130 0 40 0 154 0 41 0 130 0 65 0 130 0 91 0 154 0 92 0 130 0 93 0 130 0 94 0 130 0 96 0 130 0 97 0 130 0 98 0 130 1 71] 
#[1 0 190 0 9 0 130 0 13 0 190 0 15 0 130 0 17 0 130 0 20 0 130 0 25 0 190 0 26 0 130 0 38] 
#[1 0 130 0 2 0 130 0 3 0 154 0 4 0 130 0 5 0 130 0 6 0 154 0 7 0 130 0 9 0 130 0 10 0 154 0 11 0 130 0 12 0 130 0 13 0 154 0 14 0 130 0 15 0 130 0 16 0 130 0 17 0 154 0 18 0 130 0 20 0 130 0 22 0 154 0 23 0 130 0 24 0 130 0 25 0 130 0 26 0 130 0 27 0 130 0 28 0 154 0 29 0 130 0 30 0 154 0 31 0 130 0 32 0 130 0 33 0 154 0 34 0 154 0 35 0 130 0 36 0 130 0 38 0 130 0 39 0 130 0 40 0 154 0 41 0 130 0 65 0 130 0 91 0 154 0 92 0 130 0 93 0 130 0 94 0 130 0 96 0 130 0 97 0 130 0 98 0 130 1 71] 
#[1 3 221 0 13 3 225 0 17] 
#[1 0 190 0 9 0 150 0 13 0 190 0 15 0 150 0 17 0 190 0 26] 
#[1 0 190 0 9 0 150 0 13 0 190 0 15 0 150 0 17 0 190 0 26] 
#[0 0 190 0 9 0 15 0 26] 
#[0 0 190 0 9 0 15 0 26] 
#[0 0 190 0 9 0 15 0 26] 
#[0 4 21 0 4 0 7 0 11 0 14 0 18 0 23 0 29 0 31 0 34 0 35 0 41 0 92 1 29] 
#[0 0 194 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 198 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 4 25 0 105] 
#[1 0 202 0 2 0 202 0 3 0 202 0 5 0 202 0 6 0 202 0 9 0 202 0 10 0 202 0 12 0 202 0 15 0 202 0 16 0 91 0 20 0 202 0 21 0 202 0 22 0 202 0 24 0 202 0 25 0 202 0 26 0 202 0 27 0 202 0 28 0 202 0 30 0 202 0 32 0 202 0 33 0 202 0 36 3 161 0 38 0 202 0 39 0 202 0 40 0 202 0 65 0 202 0 91 0 202 0 93 0 202 0 94 0 202 0 96 0 202 0 97 0 202 0 98 0 202 0 105 4 33 1 1 3 169 1 2 0 202 1 71] 
#[0 0 206 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[0 0 206 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[0 0 182 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 4 37 0 58 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 4 41 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 4 41 0 117 4 41 0 118 4 41 0 121 4 49 1 34 1 221 1 64 1 221 1 65 1 221 1 66 4 49 1 69] 
#[1 4 53 0 20 4 57 0 25] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 4 61 1 9 4 61 1 10 4 61 1 11 4 61 1 12 4 61 1 13 4 61 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 0 210 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 14 0 37 0 15 0 44 0 19 0 46 0 23 0 49 0 27 0 54 0 14 0 58 0 35 0 60 0 39 0 66 0 43 0 68 0 137 0 70 0 47 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 95 0 105 1 153 0 111 0 245 0 112 4 65 0 113 4 65 0 114 4 65 0 115 4 65 0 116 4 69 0 117 4 69 0 118 4 69 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 4 85 0 162 1 149 0 240 1 153 0 241 2 237 0 242 2 21 0 243 4 77 0 244 4 81 0 245 4 85 0 246 4 89 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 2 237 1 25 2 237 1 26 2 117 1 27 1 205 1 28 2 237 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 4 93 1 68 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 4 97 1 9 4 97 1 10 4 97 1 11 4 97 1 12 4 97 1 13 4 97 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 4 101 1 9 4 101 1 10 4 101 1 11 4 101 1 12 4 101 1 13 4 101 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 4 105 1 9 4 105 1 10 4 105 1 11 4 105 1 12 4 105 1 13 4 105 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 0 126 0 2 0 126 0 3 0 126 0 4 0 71 0 5 0 126 0 6 0 126 0 7 0 99 0 9 0 126 0 10 0 126 0 11 0 126 0 12 0 126 0 13 0 126 0 14 0 103 0 15 0 126 0 16 0 126 0 17 0 126 0 18 0 214 0 19 0 71 0 20 0 126 0 22 0 126 0 23 0 126 0 24 0 71 0 25 0 126 0 26 0 107 0 27 0 126 0 28 0 126 0 29 0 126 0 30 0 126 0 31 0 126 0 32 0 126 0 33 0 126 0 34 0 126 0 35 0 126 0 36 0 99 0 38 0 126 0 39 0 126 0 40 0 126 0 41 0 126 0 65 0 126 0 91 0 126 0 92 0 126 0 93 0 126 0 94 0 126 0 96 0 126 0 97 0 126 0 98 3 149 1 60 0 126 1 71] 
#[1 0 218 0 9 0 218 0 15 0 218 0 19 4 109 0 38] 
#[0 0 222 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 4 113 0 19] 
#[0 0 226 0 19] 
#[0 0 130 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 130 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 0 230 0 2 0 230 0 3 0 230 0 5 0 230 0 6 0 230 0 9 0 230 0 10 0 230 0 12 3 221 0 13 0 230 0 15 0 230 0 16 3 225 0 17 0 230 0 22 0 230 0 24 0 230 0 26 0 230 0 27 0 230 0 28 0 230 0 30 0 230 0 32 0 230 0 33 0 230 0 36 0 230 0 39 0 230 0 40 0 230 0 65 0 230 0 91 0 230 0 93 0 230 0 94 0 230 0 96 0 230 0 97 0 230 0 98 0 230 1 71] 
#[0 0 150 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 150 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 234 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 238 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 238 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 238 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 230 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 0 242 0 2 0 111 0 3 0 242 0 5 0 242 0 6 0 242 0 9 0 115 0 10 0 242 0 12 0 242 0 15 0 242 0 16 0 119 0 22 0 242 0 24 0 242 0 26 0 242 0 27 0 242 0 28 0 242 0 30 0 242 0 32 0 242 0 33 0 242 0 36 0 242 0 39 0 242 0 40 0 242 0 65 0 242 0 91 0 242 0 93 0 242 0 94 0 242 0 96 0 242 0 97 0 242 0 98 0 242 1 71] 
#[1 0 246 0 2 0 246 0 3 0 246 0 5 0 246 0 6 0 246 0 9 0 246 0 10 0 123 0 12 0 246 0 15 0 127 0 16 0 246 0 22 0 246 0 24 0 246 0 26 0 246 0 27 0 246 0 28 0 246 0 30 0 246 0 32 0 246 0 33 0 246 0 36 0 246 0 39 0 246 0 40 0 246 0 65 0 246 0 91 0 246 0 93 0 246 0 94 0 246 0 96 0 246 0 97 0 246 0 98 0 246 1 71] 
#[1 0 250 0 2 0 250 0 3 0 250 0 5 0 250 0 6 0 250 0 9 0 250 0 10 0 250 0 12 0 250 0 15 0 250 0 16 0 250 0 22 0 250 0 24 0 250 0 26 0 250 0 27 0 131 0 28 0 250 0 30 0 250 0 32 0 250 0 33 0 250 0 36 0 250 0 39 0 250 0 40 0 250 0 65 0 250 0 91 0 250 0 93 0 250 0 94 0 250 0 96 0 135 0 97 0 139 0 98 0 250 1 71] 
#[1 0 254 0 2 0 254 0 3 0 254 0 5 0 254 0 6 0 254 0 9 0 254 0 10 0 254 0 12 0 254 0 15 0 254 0 16 0 254 0 22 0 254 0 24 0 254 0 26 0 143 0 27 0 254 0 28 0 147 0 30 0 254 0 32 0 151 0 33 0 254 0 36 0 254 0 39 0 254 0 40 0 155 0 65 0 254 0 91 0 254 0 93 0 254 0 94 0 159 0 96 0 254 0 97 0 254 0 98 0 254 1 71] 
#[1 0 163 0 2 1 2 0 3 1 2 0 5 1 2 0 6 1 2 0 9 1 2 0 10 1 2 0 12 1 2 0 15 1 2 0 16 1 2 0 22 1 2 0 24 1 2 0 26 1 2 0 27 1 2 0 28 1 2 0 30 0 167 0 32 1 2 0 33 1 2 0 36 1 2 0 39 1 2 0 40 1 2 0 65 1 2 0 91 1 2 0 93 1 2 0 94 1 2 0 96 1 2 0 97 1 2 0 98 1 2 1 71] 
#[1 1 6 0 2 1 6 0 3 0 171 0 5 1 6 0 6 1 6 0 9 1 6 0 10 1 6 0 12 1 6 0 15 1 6 0 16 1 6 0 22 1 6 0 24 1 6 0 26 1 6 0 27 1 6 0 28 1 6 0 30 1 6 0 32 1 6 0 33 1 6 0 36 1 6 0 39 1 6 0 40 1 6 0 65 1 6 0 91 1 6 0 93 1 6 0 94 1 6 0 96 1 6 0 97 1 6 0 98 1 6 1 71] 
#[1 1 10 0 2 1 10 0 3 1 10 0 5 1 10 0 6 1 10 0 9 1 10 0 10 1 10 0 12 1 10 0 15 1 10 0 16 1 10 0 22 1 10 0 24 1 10 0 26 1 10 0 27 1 10 0 28 1 10 0 30 1 10 0 32 1 10 0 33 1 10 0 36 1 10 0 39 0 175 0 40 1 10 0 65 1 10 0 91 1 10 0 93 1 10 0 94 1 10 0 96 1 10 0 97 1 10 0 98 1 10 1 71] 
#[1 1 14 0 2 1 14 0 3 1 14 0 5 1 14 0 6 1 14 0 9 1 14 0 10 1 14 0 12 1 14 0 15 1 14 0 16 1 14 0 22 1 14 0 24 1 14 0 26 1 14 0 27 1 14 0 28 1 14 0 30 1 14 0 32 1 14 0 33 1 14 0 36 1 14 0 39 1 14 0 40 1 14 0 65 0 179 0 91 1 14 0 93 1 14 0 94 1 14 0 96 1 14 0 97 1 14 0 98 1 14 1 71] 
#[1 1 18 0 2 1 18 0 3 1 18 0 5 0 183 0 6 1 18 0 9 1 18 0 10 1 18 0 12 1 18 0 15 1 18 0 16 1 18 0 22 1 18 0 24 1 18 0 26 1 18 0 27 1 18 0 28 1 18 0 30 1 18 0 32 1 18 0 33 1 18 0 36 1 18 0 39 1 18 0 40 1 18 0 65 1 18 0 91 1 18 0 93 1 18 0 94 1 18 0 96 1 18 0 97 1 18 0 98 1 18 1 71] 
#[1 1 22 0 2 1 22 0 3 1 22 0 5 1 22 0 6 1 22 0 9 1 22 0 10 1 22 0 12 1 22 0 15 1 22 0 16 1 22 0 22 1 22 0 24 1 22 0 26 1 22 0 27 1 22 0 28 1 22 0 30 1 22 0 32 1 22 0 33 0 187 0 36 1 22 0 39 1 22 0 40 1 22 0 65 1 22 0 91 0 191 0 93 1 22 0 94 1 22 0 96 1 22 0 97 1 22 0 98 1 22 1 71] 
#[0 1 26 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 222 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 195 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 0 1 71] 
#[0 1 30 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 0 42 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 0 0 1 71] 
#[1 4 201 0 37 3 185 0 50 3 189 0 56 3 193 0 67] 
#[0 1 34 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 34 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 34 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[1 4 205 0 27 1 38 0 44 1 38 0 46 1 38 0 49 1 38 0 54 1 38 0 60 1 38 0 66 1 38 0 68 1 38 0 76 1 38 0 87 1 38 0 105 4 209 1 54] 
#[0 0 0 1 71] 
#[1 4 213 0 26 0 209 0 90 4 217 0 166 4 217 0 193] 
#[1 0 42 0 27 0 42 0 37 0 42 0 42 0 42 0 44 0 42 0 46 0 42 0 49 0 42 0 50 0 42 0 54 0 42 0 56 0 42 0 58 0 42 0 60 0 42 0 66 0 42 0 67 0 42 0 68 0 42 0 69 0 42 0 72 0 42 0 73 0 42 0 74 0 42 0 76 0 42 0 77 0 42 0 78 0 42 0 81 0 42 0 85 0 42 0 87 0 42 0 88 0 209 0 90 0 42 0 105 4 225 0 193] 
#[0 1 42 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[1 4 205 0 27 4 201 0 37 0 199 0 44 0 203 0 46 0 207 0 49 3 185 0 50 0 211 0 54 3 189 0 56 0 215 0 60 0 219 0 66 3 193 0 67 0 223 0 68 0 227 0 76 1 38 0 87 0 231 0 105 4 229 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 4 229 0 117 4 229 0 118 4 229 0 121 4 233 0 169 4 237 1 54 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 0 0 1 71] 
#[0 1 46 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 42 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 42 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 46 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 46 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 50 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[1 4 245 0 77 1 54 0 105 4 245 1 44] 
#[1 2 125 0 26 0 59 0 37 0 73 0 42 0 18 0 50 0 18 0 56 0 109 0 58 0 18 0 67 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 161 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 201 0 88 4 249 0 128 4 253 0 130 5 1 0 135 2 137 0 136 1 37 0 137 1 41 0 138 5 1 0 139 5 1 0 172 5 1 0 173 1 41 1 34 5 1 1 45 1 58 1 71] 
#[1 1 62 0 26 1 62 0 37 1 62 0 42 1 62 0 50 1 62 0 56 1 62 0 58 2 205 0 64 1 62 0 67 1 62 0 69 1 62 0 72 1 62 0 73 1 62 0 74 1 62 0 77 1 62 0 78 1 62 0 81 1 62 0 85 1 62 0 88 5 5 0 132 5 5 0 133 5 5 0 134 1 62 1 71] 
#[0 1 66 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[0 1 70 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[0 1 70 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[1 3 37 0 105 5 9 0 122 5 9 0 123 5 9 0 124] 
#[0 1 74 0 37 0 71 0 105] 
#[0 5 13 0 9] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 4 65 0 113 4 65 0 114 4 65 0 115 4 65 0 116 4 69 0 117 4 69 0 118 4 69 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 2 237 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 2 237 1 25 2 237 1 26 2 117 1 27 1 205 1 28 2 237 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 0 126 0 2 0 126 0 3 0 126 0 4 0 126 0 5 0 126 0 6 0 126 0 7 0 126 0 8 0 126 0 9 0 126 0 10 0 126 0 11 0 126 0 12 0 126 0 13 0 126 0 14 0 126 0 15 0 126 0 16 0 126 0 17 0 126 0 18 0 71 0 20 0 126 0 22 0 126 0 23 0 126 0 24 0 71 0 25 0 126 0 26 0 107 0 27 0 126 0 28 0 126 0 29 0 126 0 30 0 126 0 31 0 126 0 32 0 126 0 33 0 126 0 34 0 126 0 35 0 126 0 36 0 71 0 38 0 126 0 39 0 126 0 40 0 126 0 41 0 126 0 65 0 126 0 91 0 126 0 92 0 126 0 93 0 126 0 94 0 126 0 96 0 126 0 97 0 126 0 98 0 22 0 105 3 149 1 60 0 126 1 71] 
#[0 1 78 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 238 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 1 82 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 1 86 0 15 5 17 0 57 5 21 0 79 1 86 0 96 5 25 1 63] 
#[0 1 90 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[1 0 22 0 2 0 22 0 3 0 22 0 5 0 22 0 6 0 22 0 8 0 22 0 9 0 22 0 10 0 22 0 12 0 22 0 15 0 22 0 16 0 22 0 20 0 22 0 21 0 22 0 22 0 22 0 24 0 22 0 26 0 235 0 27 0 22 0 28 0 22 0 30 0 22 0 32 0 22 0 33 0 22 0 36 0 22 0 38 0 22 0 39 0 22 0 40 0 22 0 52 0 22 0 63 0 22 0 65 0 22 0 90 0 22 0 91 0 22 0 93 0 22 0 94 0 22 0 96 0 22 0 97 0 22 0 98 0 22 0 105 3 149 1 60 0 22 1 71] 
#[0 1 94 0 15 0 96] 
#[1 0 134 0 5 0 134 0 15 0 134 0 21 3 161 0 38 0 134 0 91 0 134 0 96 0 134 0 105 3 165 1 1 3 169 1 2] 
#[0 0 134 0 5 0 15 0 21 0 91 0 96 0 105] 
#[1 5 29 0 15 5 33 0 96] 
#[0 1 98 0 15 0 96] 
#[0 0 126 0 8 0 9 0 15 0 20 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 5 37 0 8 1 102 0 9 1 102 0 15 5 41 0 20 1 102 0 26 1 102 0 27 1 102 0 37 1 102 0 42 1 102 0 44 1 102 0 46 1 102 0 49 1 102 0 50 1 102 0 54 1 102 0 56 1 102 0 58 1 102 0 60 1 102 0 66 1 102 0 67 1 102 0 68 1 102 0 69 1 102 0 71 1 102 0 72 1 102 0 73 1 102 0 74 1 102 0 76 1 102 0 77 1 102 0 78 1 102 0 81 1 102 0 85 1 102 0 87 1 102 0 88 1 102 0 94 1 102 0 105 5 45 1 35] 
#[1 5 49 0 24 5 53 0 26] 
#[0 1 106 0 26] 
#[0 5 57 0 26] 
#[0 5 61 0 26] 
#[0 3 109 0 8] 
#[0 5 65 0 89] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 1 110 0 26 0 65 0 27 0 14 0 37 0 15 0 44 0 19 0 46 0 23 0 49 0 27 0 54 0 14 0 58 0 35 0 60 0 39 0 66 0 43 0 68 0 137 0 70 0 47 0 76 0 169 0 79 0 181 0 82 0 197 0 87 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 239 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 5 77 0 198 5 73 0 204 5 77 0 216 5 77 0 217 5 85 0 220 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 5 73 1 10 5 73 1 11 5 73 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 5 89 1 68 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 5 93 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 5 93 1 25 5 93 1 26 2 117 1 27 1 205 1 28 5 93 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 5 97 0 38 5 101 0 254 5 105 0 255 5 109 1 1 3 169 1 2] 
#[1 1 114 0 8 5 97 0 38 5 113 0 254 5 105 0 255 5 117 1 1 3 169 1 2] 
#[0 5 121 0 8] 
#[1 0 202 0 8 0 202 0 9 0 202 0 15 4 29 0 20 0 202 0 26 0 202 0 38 0 202 0 52 0 202 0 63 0 202 0 90] 
#[0 5 125 0 26] 
#[0 1 118 0 26] 
#[1 0 65 0 27 0 243 0 105 5 133 1 60] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 5 137 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 5 137 1 25 5 137 1 26 2 117 1 27 1 205 1 28 5 137 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 5 141 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 5 141 1 25 5 141 1 26 2 117 1 27 1 205 1 28 5 141 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 5 145 0 26] 
#[1 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 5 149 0 230 5 153 0 231 5 157 1 68] 
#[1 0 209 0 90 5 161 0 193] 
#[1 0 247 0 90 5 165 0 193] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 5 169 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 5 169 1 25 5 169 1 26 2 117 1 27 1 205 1 28 5 169 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 5 173 0 94] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 0 23 0 49 0 18 0 50 0 97 0 51 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 1 126 0 94 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 5 177 0 139 1 49 0 158 5 177 0 172 5 177 0 193 5 177 0 196 5 177 0 197 1 69 0 198 5 177 0 199 5 177 0 200 5 177 0 201 5 177 0 202 5 177 0 203 1 93 0 204 5 177 0 205 5 177 0 206 5 177 0 207 5 177 0 213 5 177 0 214 5 177 0 215 5 177 0 222 5 177 0 223 5 177 0 224 5 177 0 225 5 177 0 226 5 177 0 227 5 177 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 5 177 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 5 177 1 67 1 237 1 68 1 241 1 70] 
#[0 1 130 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 77 0 43 0 81 0 44 0 85 0 45 0 89 0 46 0 93 0 49 0 97 0 51 0 101 0 53 0 105 0 54 0 113 0 60 0 117 0 61 0 121 0 62 0 125 0 66 0 129 0 68 0 137 0 70 0 153 0 75 0 157 0 76 0 169 0 79 0 173 0 80 3 61 0 81 0 181 0 82 0 185 0 83 0 193 0 86 0 197 0 87 0 205 0 89 0 209 0 90 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 67 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 5 181 0 193 5 181 0 199 5 181 0 200 5 181 0 201 5 181 0 202 5 181 0 203 1 93 0 204 5 181 0 205 5 181 0 206 5 181 0 207 5 181 0 213 5 181 0 214 5 181 0 215 5 181 0 222 5 181 0 223 5 181 0 224 5 181 0 225 5 181 0 226 5 181 0 227 5 181 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 5 181 1 67 1 241 1 70] 
#[0 1 134 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[0 5 185 0 50] 
#[0 5 189 0 50] 
#[0 5 193 0 39] 
#[1 1 138 0 2 1 138 0 3 1 138 0 5 1 138 0 6 1 138 0 9 1 138 0 10 1 138 0 12 1 138 0 15 1 138 0 16 1 138 0 20 1 138 0 21 1 138 0 22 1 138 0 24 1 138 0 25 1 138 0 26 1 138 0 27 1 138 0 28 1 138 0 30 1 138 0 32 1 138 0 33 1 138 0 36 3 161 0 38 1 138 0 39 1 138 0 40 1 138 0 65 1 138 0 91 1 138 0 93 1 138 0 94 1 138 0 96 1 138 0 97 1 138 0 98 1 138 0 105 5 197 1 2 1 138 1 71] 
#[0 1 142 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[0 5 201 0 70] 
#[1 5 205 0 79 5 209 0 82 5 213 0 105] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 5 217 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 5 217 1 25 5 217 1 26 2 117 1 27 1 205 1 28 5 217 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 5 221 0 105] 
#[0 5 225 0 105] 
#[0 5 229 0 105] 
#[0 1 146 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 105] 
#[0 5 233 0 50] 
#[0 1 150 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 1 154 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 5 237 0 105] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 5 241 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 5 241 1 25 5 241 1 26 2 117 1 27 1 205 1 28 5 241 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 1 158 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 1 162 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 166 0 1 0 8 0 12 0 13 0 16 0 17 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 70 0 76 0 79 0 82 0 87 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 5 245 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 5 245 1 25 5 245 1 26 2 117 1 27 1 205 1 28 5 245 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 5 249 0 8] 
#[0 5 253 0 105] 
#[1 1 138 0 2 1 138 0 3 1 138 0 5 1 138 0 6 1 138 0 9 1 138 0 10 1 138 0 12 1 138 0 15 1 138 0 16 1 138 0 20 1 138 0 21 1 138 0 22 1 138 0 24 1 138 0 25 1 138 0 26 1 138 0 27 1 138 0 28 1 138 0 30 1 138 0 32 1 138 0 33 1 138 0 36 3 161 0 38 1 138 0 39 1 138 0 40 1 138 0 65 1 138 0 91 1 138 0 93 1 138 0 94 1 138 0 96 1 138 0 97 1 138 0 98 1 138 0 105 5 197 1 2 1 138 1 71] 
#[0 1 170 0 37 0 44 0 46 0 49 0 54 0 58 0 60 0 66 0 68 0 76 0 105] 
#[1 6 1 0 105 6 5 0 151 6 9 0 152 6 9 0 153 6 17 0 154] 
#[0 1 174 0 37 0 44 0 46 0 49 0 54 0 58 0 60 0 66 0 68 0 76 0 105] 
#[0 1 178 0 37 0 44 0 46 0 49 0 54 0 58 0 60 0 66 0 68 0 76 0 105] 
#[1 0 65 0 27 6 21 0 70 0 22 0 105 6 25 1 60] 
#[0 6 29 0 105] 
#[0 1 182 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 6 33 0 9 0 75 0 20 3 161 0 38 3 165 1 1 3 169 1 2] 
#[1 6 37 0 5 1 186 0 9 0 134 0 20 3 173 0 25 6 41 1 14] 
#[0 1 190 0 9 0 15] 
#[0 6 45 0 9] 
#[1 1 194 0 9 6 49 0 15] 
#[0 1 198 0 9 0 15] 
#[1 1 190 0 9 1 190 0 15 0 226 0 19] 
#[1 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 4 37 0 58 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 6 53 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 6 53 0 117 6 53 0 118 6 53 0 121 4 49 1 34 1 221 1 64 1 221 1 65 1 221 1 66 4 49 1 69] 
#[0 1 202 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 1 206 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 1 210 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 6 57 0 39] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 0 209 0 90 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 6 65 0 193 1 149 0 240 1 153 0 241 6 65 0 242 2 21 0 243 2 25 0 247 6 65 0 248 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 6 65 1 25 6 65 1 26 2 117 1 27 1 205 1 28 6 65 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 6 73 1 9 6 73 1 10 6 73 1 11 6 73 1 12 6 73 1 13 6 73 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 6 77 1 9 6 77 1 10 6 77 1 11 6 77 1 12 6 77 1 13 6 77 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 6 81 1 9 6 81 1 10 6 81 1 11 6 81 1 12 6 81 1 13 6 81 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 6 85 1 9 6 85 1 10 6 85 1 11 6 85 1 12 6 85 1 13 6 85 1 15 6 85 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 6 89 1 9 6 89 1 10 6 89 1 11 6 89 1 12 6 89 1 13 6 89 1 15 6 89 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 6 93 1 16 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 6 97 1 16 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 6 101 1 16 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 6 105 1 17 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 6 109 1 17 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 6 113 1 17 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 6 117 0 113 6 117 0 114 6 117 0 115 6 117 0 116 6 121 0 117 6 121 0 118 6 121 0 121 1 221 1 64 1 221 1 65 1 221 1 66] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 6 125 1 17 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 6 129 1 18 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 6 133 1 18 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 6 137 1 19 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 6 141 1 20 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 6 145 1 21 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 6 149 1 22 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 6 153 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 6 153 1 25 6 153 1 26 2 117 1 27 1 205 1 28 6 153 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 6 157 1 23 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 6 161 0 67] 
#[1 6 165 0 105 6 169 1 55 6 173 1 56] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 0 197 0 87 3 13 0 105 6 177 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 6 177 0 117 6 177 0 118 6 177 0 121 6 181 0 158 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 1 214 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 218 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 222 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 226 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[1 6 1 0 105 6 185 0 151 6 9 0 152 6 9 0 153 6 17 0 154] 
#[1 6 189 0 84 1 230 0 90 6 193 0 163 6 193 0 164] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 0 197 0 87 2 245 0 105 6 177 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 6 177 0 117 6 177 0 118 6 177 0 121 6 201 0 123 6 181 0 158 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 1 234 0 105] 
#[1 3 37 0 105 6 205 0 122 6 205 0 123 6 205 0 124] 
#[0 1 238 1 71] 
#[1 2 125 0 26 0 59 0 37 0 73 0 42 0 18 0 50 0 18 0 56 0 109 0 58 0 18 0 67 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 161 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 201 0 88 6 209 0 135 2 137 0 136 1 37 0 137 1 41 0 138 6 209 0 139 6 209 0 172 6 209 0 173 1 41 1 34 6 209 1 45 1 242 1 71] 
#[0 1 246 0 26 0 37 0 42 0 50 0 56 0 58 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[0 1 250 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[1 5 41 0 20 6 213 0 26] 
#[0 1 254 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 6 217 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 6 217 0 117 6 217 0 118 6 217 0 121 1 221 1 64 1 221 1 65 1 221 1 66] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 6 221 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 6 221 0 117 6 221 0 118 6 221 0 121 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 2 2 0 15 0 96] 
#[1 3 5 0 36 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 3 17 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 3 17 0 117 3 17 0 118 3 17 0 121 6 225 1 62 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 2 6 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[1 1 245 0 1 2 241 0 8 2 10 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 6 229 0 90 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 251 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 1 1 25 2 69 1 27 1 205 1 28 7 1 1 34 6 245 1 36 6 249 1 37 6 253 1 38 7 1 1 39 7 1 1 40 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 5 213 0 105] 
#[0 2 14 0 9 0 15 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 9 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 9 1 25 7 9 1 26 2 117 1 27 1 205 1 28 7 9 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 2 18 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 2 22 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 2 26 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 7 13 0 8] 
#[0 2 30 0 26] 
#[0 2 34 0 9 0 15 0 26] 
#[0 7 17 0 26] 
#[0 2 38 0 26] 
#[1 7 21 0 15 2 30 0 26] 
#[1 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 4 37 0 58 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 7 25 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 7 25 0 117 7 25 0 118 7 25 0 121 4 49 1 34 1 221 1 64 1 221 1 65 1 221 1 66 4 49 1 69] 
#[0 7 29 0 9] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 5 193 0 39 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 33 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 33 1 25 7 33 1 26 2 117 1 27 1 205 1 28 7 33 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 2 42 0 2 2 42 0 3 2 42 0 5 2 42 0 6 2 42 0 9 2 42 0 10 2 42 0 12 2 42 0 13 2 42 0 15 2 42 0 16 2 42 0 17 2 42 0 20 2 42 0 22 2 42 0 24 2 42 0 25 2 42 0 26 2 42 0 27 2 42 0 28 2 42 0 30 2 42 0 32 2 42 0 33 2 42 0 36 5 97 0 38 2 42 0 39 2 42 0 40 2 42 0 65 2 42 0 91 2 42 0 93 2 42 0 94 2 42 0 96 2 42 0 97 2 42 0 98 7 37 0 255 7 41 1 0 7 45 1 1 3 169 1 2 2 42 1 71] 
#[0 2 46 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 3 161 0 38 7 49 0 90 7 53 0 191 5 197 1 2] 
#[1 2 42 0 2 2 42 0 3 2 42 0 5 2 42 0 6 2 42 0 9 2 42 0 10 2 42 0 12 2 42 0 13 2 42 0 15 2 42 0 16 2 42 0 17 2 42 0 20 2 42 0 22 2 42 0 24 2 42 0 25 2 42 0 26 2 42 0 27 2 42 0 28 2 42 0 30 2 42 0 32 2 42 0 33 2 42 0 36 5 97 0 38 2 42 0 39 2 42 0 40 2 42 0 65 2 42 0 91 2 42 0 93 2 42 0 94 2 42 0 96 2 42 0 97 2 42 0 98 7 37 0 255 7 57 1 0 7 45 1 1 3 169 1 2 2 42 1 71] 
#[1 3 161 0 38 7 49 0 90 7 61 0 191 5 197 1 2] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 7 65 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 2 54 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 2 58 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 7 77 0 105] 
#[0 7 81 0 9] 
#[0 7 85 0 9] 
#[0 2 62 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 2 66 0 9 7 89 0 26 7 93 0 232] 
#[0 2 70 0 9 0 26] 
#[1 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 4 37 0 58 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 7 97 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 7 97 0 117 7 97 0 118 7 97 0 121 4 49 1 34 1 221 1 64 1 221 1 65 1 221 1 66 4 49 1 69] 
#[1 7 101 0 48 2 74 0 59 7 105 0 233 7 109 0 234 7 113 0 235] 
#[0 2 78 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 7 117 0 9] 
#[0 2 82 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 37 0 39 0 40 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 2 86 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 2 90 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 2 94 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 94 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 98 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[0 2 102 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[0 2 106 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 7 121 0 20] 
#[0 2 110 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 114 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 65 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 91 0 92 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[0 7 125 0 39] 
#[1 4 205 0 27 1 38 0 57 1 38 0 63 1 38 0 90 7 129 1 54] 
#[1 7 133 0 63 2 118 0 90 7 137 0 142 7 141 0 143] 
#[1 4 205 0 27 1 38 0 57 1 38 0 90 7 145 1 54] 
#[0 2 94 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 122 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 7 149 0 39] 
#[0 2 126 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 7 153 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 0 22 0 2 0 22 0 3 0 22 0 5 0 22 0 6 0 22 0 8 0 22 0 9 0 22 0 10 0 22 0 12 0 22 0 15 0 22 0 16 0 22 0 20 0 22 0 21 0 22 0 22 0 22 0 24 0 22 0 25 0 22 0 26 0 235 0 27 0 22 0 28 0 22 0 30 0 22 0 32 0 22 0 33 0 22 0 36 0 22 0 38 0 22 0 39 0 22 0 40 0 22 0 52 0 22 0 63 0 22 0 65 0 22 0 90 0 22 0 91 0 22 0 93 0 22 0 94 0 22 0 96 0 22 0 97 0 22 0 98 0 22 0 105 7 157 1 60 0 22 1 71] 
#[0 0 214 0 9 0 15 0 24 0 26 0 31 0 38] 
#[1 7 161 0 15 2 130 0 26] 
#[0 2 134 0 15 0 26] 
#[0 2 138 0 15 0 26] 
#[1 2 142 0 15 2 142 0 26 7 165 0 31 4 109 0 38] 
#[1 0 65 0 27 0 22 0 105 7 169 1 60] 
#[0 7 173 0 105] 
#[0 2 106 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 7 177 1 9 7 177 1 10 7 177 1 11 7 177 1 12 7 177 1 13 7 177 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 3 13 0 105 7 185 0 118 7 185 0 120 3 89 1 64 3 89 1 65 3 89 1 66] 
#[0 7 189 0 9] 
#[0 2 146 0 19] 
#[1 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 255 0 105 2 13 0 154 7 193 0 162 7 193 0 246 7 193 0 247 4 93 1 68] 
#[1 7 201 0 21 6 1 0 105 7 205 0 154] 
#[0 2 150 0 9 0 15 0 19 0 24 0 26 0 31 0 38] 
#[0 2 154 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 158 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 154 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 162 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 162 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 162 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 2 166 0 2 1 3 0 3 2 166 0 5 2 166 0 6 2 166 0 9 1 7 0 10 2 166 0 12 2 166 0 15 2 166 0 16 1 11 0 22 2 166 0 24 2 166 0 26 2 166 0 27 2 166 0 28 2 166 0 30 2 166 0 32 2 166 0 33 2 166 0 36 2 166 0 39 2 166 0 40 2 166 0 65 2 166 0 91 2 166 0 93 2 166 0 94 2 166 0 96 2 166 0 97 2 166 0 98 2 166 1 71] 
#[1 2 166 0 2 1 3 0 3 2 166 0 5 2 166 0 6 2 166 0 9 1 7 0 10 2 166 0 12 2 166 0 15 2 166 0 16 1 11 0 22 2 166 0 24 2 166 0 26 2 166 0 27 2 166 0 28 2 166 0 30 2 166 0 32 2 166 0 33 2 166 0 36 2 166 0 39 2 166 0 40 2 166 0 65 2 166 0 91 2 166 0 93 2 166 0 94 2 166 0 96 2 166 0 97 2 166 0 98 2 166 1 71] 
#[1 2 170 0 2 2 170 0 3 2 170 0 5 2 170 0 6 2 170 0 9 2 170 0 10 1 15 0 12 2 170 0 15 1 19 0 16 2 170 0 22 2 170 0 24 2 170 0 26 2 170 0 27 2 170 0 28 2 170 0 30 2 170 0 32 2 170 0 33 2 170 0 36 2 170 0 39 2 170 0 40 2 170 0 65 2 170 0 91 2 170 0 93 2 170 0 94 2 170 0 96 2 170 0 97 2 170 0 98 2 170 1 71] 
#[1 2 170 0 2 2 170 0 3 2 170 0 5 2 170 0 6 2 170 0 9 2 170 0 10 1 15 0 12 2 170 0 15 1 19 0 16 2 170 0 22 2 170 0 24 2 170 0 26 2 170 0 27 2 170 0 28 2 170 0 30 2 170 0 32 2 170 0 33 2 170 0 36 2 170 0 39 2 170 0 40 2 170 0 65 2 170 0 91 2 170 0 93 2 170 0 94 2 170 0 96 2 170 0 97 2 170 0 98 2 170 1 71] 
#[1 2 170 0 2 2 170 0 3 2 170 0 5 2 170 0 6 2 170 0 9 2 170 0 10 1 15 0 12 2 170 0 15 1 19 0 16 2 170 0 22 2 170 0 24 2 170 0 26 2 170 0 27 2 170 0 28 2 170 0 30 2 170 0 32 2 170 0 33 2 170 0 36 2 170 0 39 2 170 0 40 2 170 0 65 2 170 0 91 2 170 0 93 2 170 0 94 2 170 0 96 2 170 0 97 2 170 0 98 2 170 1 71] 
#[1 2 174 0 2 2 174 0 3 2 174 0 5 2 174 0 6 2 174 0 9 2 174 0 10 2 174 0 12 2 174 0 15 2 174 0 16 2 174 0 22 2 174 0 24 2 174 0 26 2 174 0 27 1 23 0 28 2 174 0 30 2 174 0 32 2 174 0 33 2 174 0 36 2 174 0 39 2 174 0 40 2 174 0 65 2 174 0 91 2 174 0 93 2 174 0 94 2 174 0 96 1 27 0 97 1 31 0 98 2 174 1 71] 
#[1 2 174 0 2 2 174 0 3 2 174 0 5 2 174 0 6 2 174 0 9 2 174 0 10 2 174 0 12 2 174 0 15 2 174 0 16 2 174 0 22 2 174 0 24 2 174 0 26 2 174 0 27 1 23 0 28 2 174 0 30 2 174 0 32 2 174 0 33 2 174 0 36 2 174 0 39 2 174 0 40 2 174 0 65 2 174 0 91 2 174 0 93 2 174 0 94 2 174 0 96 1 27 0 97 1 31 0 98 2 174 1 71] 
#[1 2 174 0 2 2 174 0 3 2 174 0 5 2 174 0 6 2 174 0 9 2 174 0 10 2 174 0 12 2 174 0 15 2 174 0 16 2 174 0 22 2 174 0 24 2 174 0 26 2 174 0 27 1 23 0 28 2 174 0 30 2 174 0 32 2 174 0 33 2 174 0 36 2 174 0 39 2 174 0 40 2 174 0 65 2 174 0 91 2 174 0 93 2 174 0 94 2 174 0 96 1 27 0 97 1 31 0 98 2 174 1 71] 
#[1 3 161 0 38 3 165 1 1 3 169 1 2] 
#[0 2 174 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 2 174 0 2 2 174 0 3 2 174 0 5 2 174 0 6 2 174 0 9 2 174 0 10 2 174 0 12 2 174 0 15 2 174 0 16 2 174 0 22 2 174 0 24 2 174 0 26 2 174 0 27 1 23 0 28 2 174 0 30 2 174 0 32 2 174 0 33 2 174 0 36 2 174 0 39 2 174 0 40 2 174 0 65 2 174 0 91 2 174 0 93 2 174 0 94 2 174 0 96 1 27 0 97 1 31 0 98 2 174 1 71] 
#[1 2 178 0 2 2 178 0 3 2 178 0 5 2 178 0 6 2 178 0 9 2 178 0 10 2 178 0 12 2 178 0 15 2 178 0 16 2 178 0 22 2 178 0 24 2 178 0 26 1 35 0 27 2 178 0 28 1 39 0 30 2 178 0 32 1 43 0 33 2 178 0 36 2 178 0 39 2 178 0 40 1 47 0 65 2 178 0 91 2 178 0 93 2 178 0 94 1 51 0 96 2 178 0 97 2 178 0 98 2 178 1 71] 
#[1 2 178 0 2 2 178 0 3 2 178 0 5 2 178 0 6 2 178 0 9 2 178 0 10 2 178 0 12 2 178 0 15 2 178 0 16 2 178 0 22 2 178 0 24 2 178 0 26 1 35 0 27 2 178 0 28 1 39 0 30 2 178 0 32 1 43 0 33 2 178 0 36 2 178 0 39 2 178 0 40 1 47 0 65 2 178 0 91 2 178 0 93 2 178 0 94 1 51 0 96 2 178 0 97 2 178 0 98 2 178 1 71] 
#[1 1 55 0 2 2 182 0 3 2 182 0 5 2 182 0 6 2 182 0 9 2 182 0 10 2 182 0 12 2 182 0 15 2 182 0 16 2 182 0 22 2 182 0 24 2 182 0 26 2 182 0 27 2 182 0 28 2 182 0 30 1 59 0 32 2 182 0 33 2 182 0 36 2 182 0 39 2 182 0 40 2 182 0 65 2 182 0 91 2 182 0 93 2 182 0 94 2 182 0 96 2 182 0 97 2 182 0 98 2 182 1 71] 
#[1 2 186 0 2 2 186 0 3 1 63 0 5 2 186 0 6 2 186 0 9 2 186 0 10 2 186 0 12 2 186 0 15 2 186 0 16 2 186 0 22 2 186 0 24 2 186 0 26 2 186 0 27 2 186 0 28 2 186 0 30 2 186 0 32 2 186 0 33 2 186 0 36 2 186 0 39 2 186 0 40 2 186 0 65 2 186 0 91 2 186 0 93 2 186 0 94 2 186 0 96 2 186 0 97 2 186 0 98 2 186 1 71] 
#[1 2 190 0 2 2 190 0 3 2 190 0 5 2 190 0 6 2 190 0 9 2 190 0 10 2 190 0 12 2 190 0 15 2 190 0 16 2 190 0 22 2 190 0 24 2 190 0 26 2 190 0 27 2 190 0 28 2 190 0 30 2 190 0 32 2 190 0 33 2 190 0 36 2 190 0 39 1 67 0 40 2 190 0 65 2 190 0 91 2 190 0 93 2 190 0 94 2 190 0 96 2 190 0 97 2 190 0 98 2 190 1 71] 
#[1 2 194 0 2 2 194 0 3 2 194 0 5 2 194 0 6 2 194 0 9 2 194 0 10 2 194 0 12 2 194 0 15 2 194 0 16 2 194 0 22 2 194 0 24 2 194 0 26 2 194 0 27 2 194 0 28 2 194 0 30 2 194 0 32 2 194 0 33 2 194 0 36 2 194 0 39 2 194 0 40 2 194 0 65 1 71 0 91 2 194 0 93 2 194 0 94 2 194 0 96 2 194 0 97 2 194 0 98 2 194 1 71] 
#[0 7 209 0 24] 
#[1 2 198 0 2 2 198 0 3 2 198 0 5 1 75 0 6 2 198 0 9 2 198 0 10 2 198 0 12 2 198 0 15 2 198 0 16 2 198 0 22 2 198 0 24 2 198 0 26 2 198 0 27 2 198 0 28 2 198 0 30 2 198 0 32 2 198 0 33 2 198 0 36 2 198 0 39 2 198 0 40 2 198 0 65 2 198 0 91 2 198 0 93 2 198 0 94 2 198 0 96 2 198 0 97 2 198 0 98 2 198 1 71] 
#[0 7 213 0 105] 
#[1 2 202 0 15 7 217 0 57 2 202 0 96 7 221 1 57] 
#[1 7 225 0 15 7 229 0 96] 
#[0 2 206 0 15 0 96] 
#[1 7 233 0 105 7 237 0 159] 
#[1 7 233 0 105 7 241 0 159] 
#[1 7 161 0 15 7 245 0 26] 
#[1 3 13 0 105 7 253 0 118 7 253 0 119 8 1 0 165 3 89 1 64 3 89 1 65 3 89 1 66] 
#[1 8 5 0 90 8 9 0 170] 
#[0 2 210 0 26 0 52 0 90] 
#[0 8 13 0 8] 
#[1 8 17 0 20 8 21 0 26] 
#[0 2 214 0 26 0 37 0 42 0 50 0 56 0 58 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[0 2 218 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[0 2 222 0 15 0 96] 
#[0 2 222 0 15 0 96] 
#[0 2 226 0 15 0 96] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 230 0 15 2 1 0 16 0 57 0 17 0 65 0 27 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 6 229 0 90 2 230 0 94 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 8 25 1 25 2 69 1 27 1 205 1 28 8 25 1 34 8 25 1 39 8 25 1 40 8 29 1 41 8 33 1 42 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 0 126 0 2 0 126 0 3 0 126 0 4 0 126 0 5 0 126 0 6 0 126 0 7 0 126 0 9 0 126 0 10 0 126 0 11 0 126 0 12 0 126 0 13 0 126 0 14 0 126 0 16 0 126 0 17 0 126 0 18 0 71 0 20 0 126 0 22 0 126 0 23 0 71 0 25 0 107 0 27 0 126 0 28 0 126 0 29 0 126 0 30 1 79 0 31 0 126 0 32 0 126 0 33 0 126 0 34 0 126 0 35 0 126 0 36 0 71 0 38 0 126 0 40 0 126 0 41 0 126 0 65 0 126 0 91 0 126 0 92 0 126 0 93 0 126 0 96 0 126 0 97 0 126 0 98 3 149 1 60] 
#[0 2 234 0 9 0 15 0 94] 
#[0 2 234 0 9 0 15 0 94] 
#[0 8 41 0 9] 
#[1 2 238 0 9 8 45 0 15] 
#[0 2 242 0 9 0 15] 
#[0 2 246 0 9] 
#[0 2 234 0 9 0 15 0 94] 
#[0 8 49 0 26] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 8 53 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 8 53 1 25 8 53 1 26 2 117 1 27 1 205 1 28 8 53 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 78 0 26 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 8 57 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 8 57 1 25 8 57 1 26 2 117 1 27 1 205 1 28 8 57 1 30 8 57 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 8 61 0 204 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 8 61 1 10 8 61 1 11 8 61 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 6 1 0 105 6 5 0 151 6 9 0 152 6 9 0 153 8 65 0 154] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 77 0 43 0 81 0 44 0 85 0 45 0 89 0 46 0 93 0 49 0 97 0 51 0 101 0 53 0 105 0 54 0 113 0 60 0 117 0 61 0 121 0 62 0 125 0 66 0 129 0 68 0 137 0 70 0 153 0 75 0 157 0 76 0 169 0 79 0 173 0 80 3 61 0 81 0 181 0 82 0 185 0 83 0 193 0 86 0 197 0 87 0 205 0 89 0 209 0 90 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 67 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 8 69 0 193 8 69 0 199 8 69 0 200 8 69 0 201 8 69 0 202 8 69 0 203 1 93 0 204 8 69 0 205 8 69 0 206 8 69 0 207 8 69 0 213 8 69 0 214 8 69 0 215 8 69 0 222 8 69 0 223 8 69 0 224 8 69 0 225 8 69 0 226 8 69 0 227 8 69 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 8 69 1 67 1 241 1 70] 
#[0 8 73 0 39] 
#[0 2 250 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 254 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 3 2 0 2 3 2 0 3 3 2 0 5 3 2 0 6 3 2 0 9 3 2 0 10 3 2 0 12 3 2 0 13 3 2 0 15 3 2 0 16 3 2 0 17 3 2 0 20 3 2 0 22 3 2 0 24 3 2 0 25 3 2 0 26 3 2 0 27 3 2 0 28 3 2 0 30 3 2 0 32 3 2 0 33 3 2 0 36 3 161 0 38 3 2 0 39 3 2 0 40 3 2 0 65 3 2 0 91 3 2 0 93 3 2 0 94 3 2 0 96 3 2 0 97 3 2 0 98 5 197 1 2 3 2 1 71] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 8 77 0 15 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 7 49 0 90 8 81 0 94 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 8 85 0 155 1 49 0 158 8 85 0 191 8 93 0 192 1 149 0 240 1 153 0 241 8 85 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 8 85 1 25 8 85 1 26 2 117 1 27 1 205 1 28 8 85 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 3 6 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 2 254 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 3 6 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 8 101 0 9] 
#[1 3 10 0 9 8 105 0 15] 
#[0 3 14 0 9 0 15] 
#[0 8 109 0 8] 
#[1 8 113 0 90 8 117 0 208] 
#[1 0 209 0 90 8 121 0 193] 
#[1 3 18 0 9 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 8 125 0 231 5 157 1 68] 
#[0 8 129 0 9] 
#[1 6 1 0 105 8 133 0 153 8 137 0 154] 
#[0 8 141 0 8] 
#[1 8 145 0 59 8 149 0 238] 
#[1 3 22 0 8 3 22 0 13 3 22 0 17 3 22 0 26 3 22 0 27 3 22 0 37 3 22 0 42 3 22 0 43 3 22 0 44 3 22 0 45 3 22 0 46 3 22 0 47 7 101 0 48 3 22 0 49 3 22 0 50 3 22 0 51 3 22 0 52 3 22 0 53 3 22 0 54 3 22 0 55 3 22 0 56 3 22 0 58 3 26 0 59 3 22 0 60 3 22 0 61 3 22 0 62 3 22 0 66 3 22 0 67 3 22 0 68 3 22 0 69 3 22 0 70 3 22 0 72 3 22 0 73 3 22 0 74 3 22 0 75 3 22 0 76 3 22 0 77 3 22 0 78 3 22 0 79 3 22 0 80 3 22 0 81 3 22 0 82 3 22 0 83 3 22 0 85 3 22 0 86 3 22 0 87 3 22 0 88 3 22 0 89 3 22 0 90 3 22 0 94 3 22 0 99 3 22 0 100 3 22 0 101 3 22 0 102 3 22 0 103 3 22 0 104 3 22 0 105 8 153 0 235 3 22 1 71] 
#[0 3 30 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 77 0 43 0 81 0 44 0 85 0 45 0 89 0 46 0 93 0 49 0 97 0 51 0 101 0 53 0 105 0 54 0 113 0 60 0 117 0 61 0 121 0 62 0 125 0 66 0 129 0 68 0 137 0 70 0 153 0 75 0 157 0 76 0 169 0 79 0 173 0 80 3 61 0 81 0 181 0 82 0 185 0 83 0 193 0 86 0 197 0 87 0 205 0 89 0 209 0 90 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 67 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 8 157 0 193 8 157 0 199 8 157 0 200 8 157 0 201 8 157 0 202 8 157 0 203 1 93 0 204 8 157 0 205 8 157 0 206 8 157 0 207 8 157 0 213 8 157 0 214 8 157 0 215 8 157 0 222 8 157 0 223 8 157 0 224 8 157 0 225 8 157 0 226 8 157 0 227 8 157 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 8 157 1 67 1 241 1 70] 
#[1 0 65 0 27 1 83 0 105 8 165 1 60] 
#[0 3 34 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 8 169 0 57 3 38 0 63 3 38 0 90 8 173 0 140 8 177 0 141] 
#[1 3 13 0 105 8 181 0 118 8 181 0 120 8 185 0 144 3 89 1 64 3 89 1 65 3 89 1 66] 
#[0 3 42 0 90] 
#[1 8 189 0 90 8 193 1 46] 
#[1 8 197 0 57 3 46 0 90 8 201 0 179 8 205 0 180] 
#[0 3 34 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 8 209 0 9] 
#[0 3 50 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 15 0 16 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 52 0 63 0 65 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 105 1 71] 
#[1 6 1 0 105 8 213 0 152 8 213 0 153 6 17 0 154] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 7 49 0 90 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 8 217 0 155 1 49 0 158 8 217 0 191 1 149 0 240 1 153 0 241 8 217 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 8 217 1 25 8 217 1 26 2 117 1 27 1 205 1 28 8 217 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 8 221 0 105] 
#[0 8 225 0 8] 
#[0 3 54 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 3 58 0 9 0 15 0 90] 
#[0 3 62 0 9] 
#[1 1 245 0 1 1 249 0 8 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 8 229 0 122 8 229 0 123 8 229 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 8 233 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 153 1 3 1 153 1 4 1 153 1 5 2 37 1 6 2 37 1 7 2 37 1 8 8 245 1 12 8 245 1 13 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 3 66 0 9 0 15] 
#[0 1 190 0 9 0 15] 
#[1 6 1 0 105 8 249 0 154] 
#[1 3 70 0 9 3 70 0 15 4 109 0 38] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 8 253 1 25 2 69 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 9 1 0 90 9 5 0 174] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 9 9 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 9 9 0 117 9 9 0 118 9 9 0 121 9 13 1 58 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 3 74 0 15 0 96] 
#[1 6 165 0 105 9 17 1 56] 
#[0 3 78 0 44 0 46 0 49 0 54 0 57 0 60 0 63 0 66 0 68 0 76 0 87 0 90 0 105] 
#[0 9 21 0 8] 
#[1 1 230 0 26 9 25 0 38 1 230 0 52 6 189 0 84 1 230 0 90 9 29 0 163 9 29 0 164] 
#[1 1 230 0 26 9 25 0 38 1 230 0 52 6 189 0 84 1 230 0 90 9 33 0 163 9 33 0 164] 
#[0 3 82 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 1 114 0 15 0 26 0 52 0 63 0 90] 
#[0 3 86 0 15 0 26 0 52 0 90] 
#[1 9 37 0 15 3 90 0 26 3 90 0 52 3 90 0 90] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 0 23 0 49 0 18 0 50 0 97 0 51 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 9 41 0 79 0 173 0 80 0 177 0 81 9 45 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 9 49 0 94 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 3 141 0 139 1 49 0 158 9 53 0 171 3 141 0 172 3 141 0 193 9 57 0 195 3 141 0 196 3 141 0 197 1 69 0 198 3 141 0 199 3 141 0 200 3 141 0 201 3 141 0 202 3 141 0 203 1 93 0 204 3 141 0 205 3 141 0 206 3 141 0 207 3 141 0 213 3 141 0 214 3 141 0 215 3 141 0 222 3 141 0 223 3 141 0 224 3 141 0 225 3 141 0 226 3 141 0 227 3 141 0 239 9 61 0 240 1 153 0 241 1 153 0 249 1 161 0 250 9 61 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 3 141 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 3 141 1 67 1 237 1 68 1 241 1 70] 
#[0 3 94 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[1 3 98 0 9 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 9 65 0 160 9 69 0 161 9 73 0 162 4 93 1 68] 
#[1 9 77 0 10 5 213 0 105] 
#[0 3 102 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[0 3 106 0 15 0 94] 
#[1 9 85 0 15 3 110 0 94 9 85 1 43] 
#[1 1 87 0 15 3 114 0 94] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 6 229 0 90 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 9 93 1 25 2 69 1 27 1 205 1 28 9 93 1 34 9 93 1 39 9 93 1 40 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 3 118 0 9 0 15 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 71 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 9 97 0 105 9 101 1 38] 
#[0 3 122 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 9 105 0 9] 
#[0 9 109 0 26] 
#[0 3 126 0 9 0 15 0 26] 
#[1 2 142 0 15 9 113 0 24 2 142 0 26 7 165 0 31 4 109 0 38] 
#[1 3 130 0 8 3 130 0 13 3 130 0 17 3 130 0 26 3 130 0 27 3 130 0 37 3 130 0 42 3 130 0 43 3 130 0 44 3 130 0 45 3 130 0 46 3 130 0 47 3 130 0 49 3 130 0 50 3 130 0 51 3 130 0 52 3 130 0 53 3 130 0 54 9 117 0 55 3 130 0 56 3 130 0 58 3 130 0 60 3 130 0 61 3 130 0 62 3 130 0 66 3 130 0 67 3 130 0 68 3 130 0 69 3 130 0 70 3 130 0 72 3 130 0 73 3 130 0 74 3 130 0 75 3 130 0 76 3 130 0 77 3 130 0 78 3 130 0 79 3 130 0 80 3 130 0 81 3 130 0 82 3 130 0 83 3 130 0 85 3 130 0 86 3 130 0 87 3 130 0 88 3 130 0 89 3 130 0 90 3 130 0 94 3 130 0 99 3 130 0 100 3 130 0 101 3 130 0 102 3 130 0 103 3 130 0 104 3 130 0 105 3 130 1 71] 
#[0 3 134 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 9 121 0 94] 
#[0 3 138 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 3 142 0 15 0 94] 
#[0 3 146 0 9 0 15 0 26 0 94] 
#[1 9 125 0 15 9 129 0 94] 
#[0 3 146 0 9 0 15 0 26 0 94] 
#[1 3 150 0 2 3 150 0 3 3 150 0 5 3 150 0 6 3 150 0 9 3 150 0 10 3 150 0 12 3 150 0 13 3 150 0 15 3 150 0 16 3 150 0 17 3 150 0 20 3 150 0 22 3 150 0 24 3 150 0 25 3 150 0 26 3 150 0 27 3 150 0 28 3 150 0 30 3 150 0 32 3 150 0 33 3 150 0 36 3 150 0 38 3 150 0 39 3 150 0 40 3 150 0 65 9 133 0 90 3 150 0 91 3 150 0 93 3 150 0 94 3 150 0 96 3 150 0 97 3 150 0 98 9 137 0 145 3 150 1 71] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 9 141 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 9 141 1 25 9 141 1 26 2 117 1 27 1 205 1 28 9 141 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 9 145 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 9 149 0 47 9 153 0 52 9 157 0 94 9 161 0 209 9 165 0 210 9 169 0 211 9 173 0 212] 
#[0 3 154 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 3 158 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 3 162 0 9 0 26] 
#[0 3 166 0 90] 
#[0 3 170 0 9 0 26] 
#[1 7 165 0 31 4 109 0 38] 
#[1 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 9 177 0 236 9 181 1 68] 
#[1 0 209 0 90 9 185 0 193] 
#[0 3 174 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 3 178 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 3 182 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 3 186 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 65 0 91 0 92 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 9 189 0 105] 
#[1 3 13 0 105 9 193 0 118 9 193 0 119 3 89 1 64 3 89 1 65 3 89 1 66] 
#[0 3 190 0 63 0 90] 
#[1 7 133 0 63 2 118 0 90 7 137 0 142 9 197 0 143] 
#[0 3 194 0 15 0 90] 
#[1 9 201 0 15 3 198 0 90] 
#[1 3 202 0 15 3 202 0 26 0 10 0 37 3 202 0 94 0 10 0 105 9 205 1 33 9 209 1 47 9 213 1 48 9 217 1 49] 
#[0 3 206 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 3 13 0 105 9 221 0 118 9 221 0 120 3 89 1 64 3 89 1 65 3 89 1 66] 
#[1 9 225 0 90 9 229 0 181] 
#[1 9 233 0 15 3 210 0 90] 
#[0 3 214 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 3 218 0 15 0 26] 
#[0 3 222 0 9 0 15 0 26] 
#[1 3 226 0 8 9 237 0 27 9 241 1 59] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 9 245 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 0 150 0 2 0 150 0 3 0 150 0 5 0 150 0 6 0 150 0 9 0 150 0 10 0 150 0 12 0 150 0 13 0 150 0 15 0 150 0 16 0 150 0 17 0 79 0 20 0 150 0 22 0 150 0 24 0 158 0 25 0 150 0 26 0 150 0 27 0 150 0 28 0 150 0 30 0 150 0 32 0 150 0 33 0 150 0 36 3 181 0 38 0 150 0 39 0 150 0 40 0 150 0 65 0 150 0 91 0 150 0 93 0 150 0 94 0 150 0 96 0 150 0 97 0 150 0 98 0 150 1 71] 
#[0 3 230 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 130 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 0 130 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 3 230 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 3 234 0 9 3 234 0 15 4 109 0 38] 
#[0 3 238 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 22 0 24 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 2 125 0 26 0 18 0 27 0 59 0 37 0 73 0 42 0 18 0 44 0 18 0 46 0 18 0 49 0 18 0 50 0 18 0 54 0 18 0 56 0 109 0 58 0 18 0 60 0 18 0 66 0 18 0 67 0 18 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 18 0 76 0 161 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 18 0 87 0 201 0 88 3 242 0 94 0 18 0 105 10 17 0 135 9 253 0 136 1 37 0 137 1 41 0 138 10 17 0 139 10 17 0 150 10 5 0 157 10 17 0 172 10 17 0 173 10 9 0 175 10 13 0 176 10 17 0 177 10 17 0 178 10 17 0 190 1 41 1 34 10 17 1 45] 
#[0 3 246 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 3 250 0 5 0 15 0 96] 
#[1 10 29 0 5 3 254 0 15 3 254 0 96] 
#[0 4 2 0 15 0 96] 
#[1 3 98 0 9 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 10 33 0 160 9 69 0 161 9 73 0 162 4 93 1 68] 
#[0 10 37 0 39] 
#[0 4 6 0 26 0 52 0 90] 
#[0 4 6 0 26 0 52 0 90] 
#[1 3 13 0 105 10 41 0 118 10 41 0 119 3 89 1 64 3 89 1 65 3 89 1 66] 
#[1 10 45 0 8 3 101 0 20] 
#[1 10 49 0 8 0 86 0 13 0 86 0 17 0 86 0 20 0 86 0 25 0 86 0 38] 
#[0 4 10 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 0 23 0 49 0 18 0 50 0 97 0 51 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 10 53 0 94 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 3 141 0 139 1 49 0 158 3 141 0 172 3 141 0 193 10 57 0 195 3 141 0 196 3 141 0 197 1 69 0 198 3 141 0 199 3 141 0 200 3 141 0 201 3 141 0 202 3 141 0 203 1 93 0 204 3 141 0 205 3 141 0 206 3 141 0 207 3 141 0 213 3 141 0 214 3 141 0 215 3 141 0 222 3 141 0 223 3 141 0 224 3 141 0 225 3 141 0 226 3 141 0 227 3 141 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 3 141 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 3 141 1 67 1 237 1 68 1 241 1 70] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 0 23 0 49 0 18 0 50 0 97 0 51 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 10 61 0 94 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 5 177 0 139 1 49 0 158 5 177 0 172 5 177 0 193 5 177 0 196 5 177 0 197 1 69 0 198 5 177 0 199 5 177 0 200 5 177 0 201 5 177 0 202 5 177 0 203 1 93 0 204 5 177 0 205 5 177 0 206 5 177 0 207 5 177 0 213 5 177 0 214 5 177 0 215 5 177 0 222 5 177 0 223 5 177 0 224 5 177 0 225 5 177 0 226 5 177 0 227 5 177 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 5 177 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 5 177 1 67 1 237 1 68 1 241 1 70] 
#[1 0 150 0 13 0 150 0 17 1 91 0 20 0 158 0 25] 
#[0 10 69 0 9] 
#[1 4 14 0 9 10 73 0 15] 
#[0 4 18 0 9 0 15] 
#[0 10 77 0 26] 
#[0 4 22 0 26 0 94] 
#[0 10 81 0 94] 
#[1 1 245 0 1 2 241 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 6 229 0 90 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 1 149 0 240 1 153 0 241 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 10 85 1 25 2 69 1 27 1 205 1 28 10 85 1 34 10 85 1 39 10 85 1 40 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 4 26 0 9 0 15] 
#[0 8 37 0 31] 
#[0 4 30 0 9 0 15] 
#[0 10 89 0 26] 
#[1 0 49 0 8 4 34 0 9 0 53 0 13 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 63 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 5 73 0 204 10 93 0 218 10 93 0 219 10 101 0 220 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 5 73 1 10 5 73 1 11 5 73 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 10 105 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 10 105 1 25 10 105 1 26 2 117 1 27 1 205 1 28 10 105 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 77 0 43 0 81 0 44 0 85 0 45 0 89 0 46 0 93 0 49 0 97 0 51 0 101 0 53 0 105 0 54 0 113 0 60 0 117 0 61 0 121 0 62 0 125 0 66 0 129 0 68 0 137 0 70 0 153 0 75 0 157 0 76 0 169 0 79 0 173 0 80 3 61 0 81 0 181 0 82 0 185 0 83 0 193 0 86 0 197 0 87 0 205 0 89 0 209 0 90 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 67 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 10 109 0 193 10 109 0 199 10 109 0 200 10 109 0 201 10 109 0 202 10 109 0 203 1 93 0 204 10 109 0 205 10 109 0 206 10 109 0 207 10 109 0 213 10 109 0 214 10 109 0 215 10 109 0 222 10 109 0 223 10 109 0 224 10 109 0 225 10 109 0 226 10 109 0 227 10 109 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 10 109 1 67 1 241 1 70] 
#[0 4 38 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 7 49 0 90 10 113 0 94 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 10 117 0 155 1 49 0 158 10 117 0 191 1 149 0 240 1 153 0 241 10 117 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 10 117 1 25 10 117 1 26 2 117 1 27 1 205 1 28 10 117 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 4 42 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[1 2 125 0 26 0 18 0 27 0 59 0 37 0 73 0 42 0 18 0 44 0 18 0 46 0 18 0 49 0 18 0 50 0 18 0 54 0 18 0 56 0 109 0 58 0 18 0 60 0 18 0 66 0 18 0 67 0 18 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 18 0 76 2 165 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 18 0 87 0 201 0 88 0 209 0 90 4 46 0 94 0 18 0 105 10 129 0 135 2 173 0 136 1 37 0 137 1 41 0 138 10 129 0 139 10 121 0 146 10 125 0 147 10 129 0 148 10 129 0 149 10 129 0 150 10 129 0 156 2 161 0 157 10 129 0 167 10 129 0 168 10 129 0 172 10 129 0 173 2 201 0 193 1 41 1 34 10 129 1 45] 
#[0 4 50 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 4 54 0 9 0 15] 
#[0 10 133 0 9] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 10 141 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 10 141 1 25 10 141 1 26 2 117 1 27 1 205 1 28 10 141 1 31 10 141 1 32 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 10 145 0 24] 
#[0 4 58 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 9 149 0 47 9 153 0 52 10 149 0 94 10 153 0 210 10 157 0 211 9 173 0 212] 
#[0 4 62 0 47 0 52 0 94] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 9 149 0 47 0 23 0 49 0 18 0 50 0 97 0 51 9 153 0 52 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 10 161 0 94 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 3 141 0 139 1 49 0 158 3 141 0 172 3 141 0 193 10 165 0 195 3 141 0 196 3 141 0 197 1 69 0 198 3 141 0 199 3 141 0 200 3 141 0 201 3 141 0 202 3 141 0 203 1 93 0 204 3 141 0 205 3 141 0 206 3 141 0 207 10 169 0 212 3 141 0 213 3 141 0 214 3 141 0 215 3 141 0 222 3 141 0 223 3 141 0 224 3 141 0 225 3 141 0 226 3 141 0 227 3 141 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 3 141 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 3 141 1 67 1 237 1 68 1 241 1 70] 
#[0 4 66 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 10 173 0 9] 
#[1 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 4 37 0 58 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 10 177 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 10 177 0 117 10 177 0 118 10 177 0 121 10 181 0 237 4 49 1 34 1 221 1 64 1 221 1 65 1 221 1 66 4 49 1 69] 
#[0 4 70 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 10 185 0 8] 
#[0 4 74 0 63 0 90] 
#[1 9 133 0 90 10 189 0 145] 
#[1 3 13 0 105 10 193 0 118 10 193 0 120 3 89 1 64 3 89 1 65 3 89 1 66] 
#[1 0 69 0 37 10 197 0 105 2 233 1 34] 
#[1 10 201 0 15 3 110 0 26 3 110 0 94 10 201 1 43] 
#[1 1 95 0 15 4 78 0 26 4 78 0 94] 
#[0 4 82 0 15 0 26 0 94] 
#[0 4 86 0 15 0 90] 
#[1 2 125 0 26 0 18 0 27 0 59 0 37 0 73 0 42 0 18 0 44 0 18 0 46 0 18 0 49 0 18 0 50 10 209 0 52 0 18 0 54 0 18 0 56 0 109 0 58 0 18 0 60 0 18 0 66 0 18 0 67 0 18 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 18 0 76 0 161 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 18 0 87 0 201 0 88 4 90 0 94 0 18 0 105 10 237 0 135 10 217 0 136 1 37 0 137 1 41 0 138 10 237 0 139 10 237 0 150 10 225 0 157 10 237 0 172 10 237 0 173 10 229 0 182 10 233 0 183 10 237 0 184 10 237 0 185 10 237 0 186 10 249 0 187 10 253 0 188 11 1 0 189 10 237 0 190 1 41 1 34 10 237 1 45] 
#[0 4 94 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 3 13 0 105 11 9 0 118 11 9 0 120 3 89 1 64 3 89 1 65 3 89 1 66] 
#[1 3 5 0 36 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 11 13 0 96 3 13 0 105 3 17 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 3 17 0 117 3 17 0 118 3 17 0 121 11 17 1 61 3 33 1 62 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 11 21 0 8] 
#[0 11 25 0 9] 
#[0 4 98 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 4 205 0 27 4 201 0 37 0 199 0 44 0 203 0 46 0 207 0 49 3 185 0 50 0 211 0 54 3 189 0 56 0 215 0 60 0 219 0 66 3 193 0 67 0 223 0 68 0 227 0 76 1 38 0 87 0 231 0 105 4 229 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 4 229 0 117 4 229 0 118 4 229 0 121 4 209 1 54 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 4 98 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 11 29 0 26 11 33 0 52] 
#[0 11 37 0 94] 
#[1 2 125 0 26 0 18 0 27 0 59 0 37 0 73 0 42 0 18 0 44 0 18 0 46 0 18 0 49 0 18 0 50 0 18 0 54 0 18 0 56 0 109 0 58 0 18 0 60 0 18 0 66 0 18 0 67 0 18 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 18 0 76 0 161 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 18 0 87 0 201 0 88 4 102 0 94 0 18 0 105 11 41 0 135 9 253 0 136 1 37 0 137 1 41 0 138 11 41 0 139 11 41 0 150 10 5 0 157 11 41 0 172 11 41 0 173 11 41 0 177 11 41 0 178 11 41 0 190 1 41 1 34 11 41 1 45] 
#[0 4 106 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 4 98 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 4 110 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 11 45 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 11 45 0 117 11 45 0 118 11 45 0 121 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 11 49 0 9] 
#[0 4 114 0 26 0 38 0 52 0 84 0 90] 
#[0 4 118 0 15 0 26 0 52 0 90] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 11 53 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 11 57 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 4 122 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 0 23 0 49 0 18 0 50 0 97 0 51 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 11 61 0 94 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 5 177 0 139 1 49 0 158 5 177 0 172 5 177 0 193 5 177 0 196 5 177 0 197 1 69 0 198 5 177 0 199 5 177 0 200 5 177 0 201 5 177 0 202 5 177 0 203 1 93 0 204 5 177 0 205 5 177 0 206 5 177 0 207 5 177 0 213 5 177 0 214 5 177 0 215 5 177 0 222 5 177 0 223 5 177 0 224 5 177 0 225 5 177 0 226 5 177 0 227 5 177 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 5 177 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 5 177 1 67 1 237 1 68 1 241 1 70] 
#[0 4 126 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[1 11 65 0 79 11 69 0 82 5 237 0 105] 
#[0 4 130 0 84 0 90] 
#[1 0 14 0 37 0 14 0 44 0 14 0 46 0 14 0 49 0 14 0 54 0 14 0 58 0 14 0 60 0 14 0 66 0 14 0 68 0 14 0 76 0 14 0 105 11 73 0 162 4 93 1 68] 
#[0 4 134 0 26 0 37 0 42 0 50 0 56 0 58 0 64 0 67 0 69 0 72 0 73 0 74 0 77 0 78 0 81 0 85 0 88 1 71] 
#[0 4 138 0 9 0 15 0 94] 
#[0 4 142 0 15 0 94] 
#[0 4 146 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 11 77 0 9] 
#[0 4 150 0 9] 
#[1 4 154 0 9 7 21 0 15] 
#[0 11 81 0 9] 
#[0 4 158 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 4 162 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 4 166 0 15 0 94] 
#[0 11 85 0 94] 
#[1 2 125 0 26 0 18 0 27 0 59 0 37 0 73 0 42 0 18 0 44 0 18 0 46 0 18 0 49 0 18 0 50 0 18 0 54 0 18 0 56 0 109 0 58 0 18 0 60 0 18 0 66 0 18 0 67 0 18 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 18 0 76 2 165 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 18 0 87 0 201 0 88 0 209 0 90 4 170 0 94 0 18 0 105 11 89 0 135 2 173 0 136 1 37 0 137 1 41 0 138 11 89 0 139 11 89 0 148 11 89 0 149 11 89 0 150 11 89 0 156 2 161 0 157 11 89 0 167 11 89 0 168 11 89 0 172 11 89 0 173 2 201 0 193 1 41 1 34 11 89 1 45] 
#[0 4 174 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105] 
#[0 4 178 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 4 182 0 24] 
#[0 11 93 0 24] 
#[0 4 186 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 4 190 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 4 194 0 47 0 52 0 94] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 9 149 0 47 0 23 0 49 0 18 0 50 0 97 0 51 9 153 0 52 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 11 97 0 94 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 3 141 0 139 1 49 0 158 3 141 0 172 3 141 0 193 10 165 0 195 3 141 0 196 3 141 0 197 1 69 0 198 3 141 0 199 3 141 0 200 3 141 0 201 3 141 0 202 3 141 0 203 1 93 0 204 3 141 0 205 3 141 0 206 3 141 0 207 10 169 0 212 3 141 0 213 3 141 0 214 3 141 0 215 3 141 0 222 3 141 0 223 3 141 0 224 3 141 0 225 3 141 0 226 3 141 0 227 3 141 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 3 141 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 3 141 1 67 1 237 1 68 1 241 1 70] 
#[0 4 198 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 11 0 37 0 73 0 42 0 77 0 43 0 15 0 44 0 85 0 45 0 19 0 46 4 202 0 47 0 23 0 49 0 18 0 50 0 97 0 51 4 202 0 52 0 101 0 53 0 27 0 54 0 18 0 56 0 31 0 58 0 35 0 60 0 117 0 61 0 121 0 62 0 39 0 66 0 18 0 67 0 43 0 68 0 133 0 69 0 137 0 70 0 141 0 72 0 145 0 73 0 149 0 74 0 153 0 75 0 47 0 76 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 85 0 193 0 86 0 197 0 87 0 201 0 88 0 205 0 89 0 209 0 90 4 202 0 94 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 51 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 33 0 136 1 37 0 137 1 41 0 138 5 177 0 139 1 49 0 158 5 177 0 172 5 177 0 193 5 177 0 196 5 177 0 197 1 69 0 198 5 177 0 199 5 177 0 200 5 177 0 201 5 177 0 202 5 177 0 203 1 93 0 204 5 177 0 205 5 177 0 206 5 177 0 207 5 177 0 213 5 177 0 214 5 177 0 215 5 177 0 222 5 177 0 223 5 177 0 224 5 177 0 225 5 177 0 226 5 177 0 227 5 177 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 41 1 34 5 177 1 45 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 5 177 1 67 1 237 1 68 1 241 1 70] 
#[0 4 206 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[1 0 209 0 90 11 101 0 193] 
#[0 4 210 0 91 0 105] 
#[1 11 105 0 91 6 1 0 105 11 109 0 154] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 11 113 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 4 214 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 4 218 0 15 0 90] 
#[1 11 117 0 8 4 222 0 15 4 222 0 26 4 222 0 90 4 222 0 94 11 121 1 50] 
#[1 11 125 0 26 4 226 0 94 11 129 1 52 11 133 1 53] 
#[1 0 10 0 37 0 10 0 105 9 205 1 33 11 137 1 49] 
#[0 4 230 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 76 0 87 0 105] 
#[0 4 234 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 1 99 0 27 4 201 0 37 1 103 0 44 1 107 0 46 1 111 0 49 3 185 0 50 1 115 0 54 3 189 0 56 1 119 0 60 1 123 0 66 3 193 0 67 1 127 0 68 1 131 0 76 1 135 0 87 1 139 0 105 4 229 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 4 229 0 117 4 229 0 118 4 229 0 121 4 209 1 54 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 4 242 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 11 29 0 26] 
#[0 11 141 0 94] 
#[1 2 125 0 26 0 18 0 27 0 59 0 37 0 73 0 42 0 18 0 44 0 18 0 46 0 18 0 49 0 18 0 50 10 209 0 52 0 18 0 54 0 18 0 56 0 109 0 58 0 18 0 60 0 18 0 66 0 18 0 67 0 18 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 18 0 76 0 161 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 18 0 87 0 201 0 88 4 246 0 94 0 18 0 105 11 145 0 135 10 217 0 136 1 37 0 137 1 41 0 138 11 145 0 139 11 145 0 150 10 225 0 157 11 145 0 172 11 145 0 173 11 145 0 184 11 145 0 185 11 145 0 186 10 249 0 187 10 253 0 188 11 1 0 189 11 145 0 190 1 41 1 34 11 145 1 45] 
#[0 4 250 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 4 234 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 4 234 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 0 209 0 90 11 149 0 193] 
#[1 4 205 0 27 1 38 0 44 1 38 0 46 1 38 0 49 1 38 0 54 1 38 0 60 1 38 0 66 1 38 0 68 1 38 0 76 1 38 0 87 1 38 0 105 11 153 1 54] 
#[0 4 254 0 27 0 44 0 46 0 49 0 54 0 60 0 66 0 68 0 76 0 87 0 105] 
#[0 4 234 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 2 0 15 0 90] 
#[0 5 6 0 8] 
#[1 5 29 0 15 11 157 0 96] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 11 161 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 5 10 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 5 14 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 1 245 0 1 1 249 0 8 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 69 0 37 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 7 49 0 90 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 11 165 0 155 1 49 0 158 11 165 0 191 1 149 0 240 1 153 0 241 11 165 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 11 165 1 25 11 165 1 26 2 117 1 27 1 205 1 28 11 165 1 31 11 169 1 34 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 5 18 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 5 22 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 26 0 5 0 15 0 96] 
#[0 5 30 0 26 0 38 0 52 0 84 0 90] 
#[0 11 173 0 9] 
#[0 11 177 0 9] 
#[0 5 34 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105 1 71] 
#[0 11 181 0 8] 
#[0 11 185 0 8] 
#[0 5 38 0 9 0 15] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 77 0 43 0 81 0 44 0 85 0 45 0 89 0 46 0 93 0 49 0 97 0 51 0 101 0 53 0 105 0 54 0 113 0 60 0 117 0 61 0 121 0 62 0 125 0 66 0 129 0 68 0 137 0 70 0 153 0 75 0 157 0 76 0 169 0 79 0 173 0 80 3 61 0 81 0 181 0 82 0 185 0 83 0 193 0 86 0 197 0 87 0 205 0 89 0 209 0 90 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 67 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 11 189 0 193 11 189 0 199 11 189 0 200 11 189 0 201 11 189 0 202 11 189 0 203 1 93 0 204 11 189 0 205 11 189 0 206 11 189 0 207 11 189 0 213 11 189 0 214 11 189 0 215 11 189 0 222 11 189 0 223 11 189 0 224 11 189 0 225 11 189 0 226 11 189 0 227 11 189 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 11 189 1 67 1 241 1 70] 
#[1 0 49 0 8 0 53 0 13 0 57 0 17 0 61 0 26 0 65 0 27 0 77 0 43 0 81 0 44 0 85 0 45 0 89 0 46 0 93 0 49 0 97 0 51 0 101 0 53 0 105 0 54 0 113 0 60 0 117 0 61 0 121 0 62 0 125 0 66 0 129 0 68 0 137 0 70 0 153 0 75 0 157 0 76 0 169 0 79 0 173 0 80 3 61 0 81 0 181 0 82 0 185 0 83 0 193 0 86 0 197 0 87 0 205 0 89 0 209 0 90 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 67 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 1 49 0 158 11 193 0 193 11 193 0 199 11 193 0 200 11 193 0 201 11 193 0 202 11 193 0 203 1 93 0 204 11 193 0 205 11 193 0 206 11 193 0 207 11 193 0 213 11 193 0 214 11 193 0 215 11 193 0 222 11 193 0 223 11 193 0 224 11 193 0 225 11 193 0 226 11 193 0 227 11 193 0 239 1 149 0 240 1 153 0 241 1 153 0 249 1 161 0 250 1 149 0 253 1 169 1 3 1 173 1 4 1 177 1 5 1 181 1 6 1 185 1 7 1 189 1 8 1 93 1 10 1 93 1 11 1 93 1 27 1 205 1 28 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 11 193 1 67 1 241 1 70] 
#[0 5 42 0 2 0 3 0 5 0 6 0 8 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 37 0 38 0 39 0 40 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 65 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 93 0 94 0 96 0 97 0 98 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 5 46 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 90 0 94 0 105] 
#[0 5 50 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 5 54 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 5 58 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 59 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 3 13 0 105 11 197 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 11 197 0 117 11 197 0 118 11 197 0 121 1 221 1 64 1 221 1 65 1 221 1 66] 
#[1 5 62 0 9 4 109 0 38] 
#[0 11 201 0 9] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 11 205 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 5 66 0 15 5 66 0 26 9 133 0 90 5 66 0 94 11 209 0 145 11 213 1 51] 
#[1 2 125 0 26 0 18 0 27 0 59 0 37 0 73 0 42 0 18 0 44 0 18 0 46 0 18 0 49 0 18 0 50 0 18 0 54 0 18 0 56 0 109 0 58 0 18 0 60 0 18 0 66 0 18 0 67 0 18 0 68 0 133 0 69 0 141 0 72 0 145 0 73 0 149 0 74 0 18 0 76 2 165 0 77 0 165 0 78 2 129 0 81 0 189 0 85 0 18 0 87 0 201 0 88 0 209 0 90 4 46 0 94 0 18 0 105 10 129 0 135 2 173 0 136 1 37 0 137 1 41 0 138 10 129 0 139 11 217 0 146 10 125 0 147 10 129 0 148 10 129 0 149 10 129 0 150 10 129 0 156 2 161 0 157 10 129 0 167 10 129 0 168 10 129 0 172 10 129 0 173 2 201 0 193 1 41 1 34 10 129 1 45] 
#[0 11 221 0 94] 
#[0 5 70 0 94] 
#[0 5 74 0 15 0 26 0 94] 
#[0 5 78 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 5 82 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 86 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 52 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[1 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 157 0 76 0 197 0 87 3 13 0 105 11 225 0 112 3 21 0 113 3 21 0 114 3 21 0 115 3 21 0 116 11 225 0 117 11 225 0 118 11 225 0 121 11 229 0 158 1 221 1 64 1 221 1 65 1 221 1 66] 
#[0 5 90 0 8] 
#[0 11 233 0 9] 
#[0 11 237 0 26] 
#[0 11 241 0 26] 
#[0 11 245 0 26] 
#[0 11 249 0 26] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 11 253 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[1 1 245 0 1 1 249 0 8 2 50 0 9 1 253 0 12 0 53 0 13 2 1 0 16 0 57 0 17 0 65 0 27 0 81 0 44 0 89 0 46 0 93 0 49 0 105 0 54 0 113 0 60 0 125 0 66 0 129 0 68 0 137 0 70 0 157 0 76 0 169 0 79 0 181 0 82 0 197 0 87 2 5 0 95 0 213 0 99 0 217 0 100 0 221 0 101 0 225 0 102 0 229 0 103 0 233 0 104 0 55 0 105 1 153 0 111 0 245 0 112 0 249 0 113 0 249 0 114 0 249 0 115 0 249 0 116 1 9 0 117 1 9 0 118 1 9 0 121 1 21 0 122 1 21 0 123 1 21 0 124 2 13 0 154 1 49 0 158 1 149 0 240 1 153 0 241 7 73 0 242 2 21 0 243 2 25 0 247 1 153 0 249 1 153 0 250 12 1 0 251 7 69 0 252 1 149 0 253 1 169 1 3 1 153 1 4 1 177 1 5 2 37 1 6 2 37 1 7 2 37 1 8 2 69 1 9 2 69 1 10 2 69 1 11 2 69 1 12 2 69 1 13 2 69 1 15 2 73 1 16 2 77 1 17 2 81 1 18 2 85 1 19 2 89 1 20 2 93 1 21 2 97 1 22 2 101 1 23 2 105 1 24 7 73 1 25 7 73 1 26 2 117 1 27 1 205 1 28 7 73 1 31 1 217 1 60 1 221 1 64 1 221 1 65 1 221 1 66 1 241 1 70] 
#[0 5 94 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 5 98 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[0 5 102 0 91 0 105] 
#[0 5 106 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 12 5 0 9] 
#[0 5 110 0 15 0 26 0 94] 
#[0 5 114 0 15 0 26 0 94] 
#[0 5 118 0 94] 
#[0 5 122 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 47 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 71] 
#[1 7 233 0 105 12 9 0 159] 
#[1 7 233 0 105 12 13 0 159] 
#[1 5 126 0 2 5 126 0 3 5 126 0 5 5 126 0 6 5 126 0 9 5 126 0 10 5 126 0 12 5 126 0 13 5 126 0 15 5 126 0 16 5 126 0 17 5 126 0 20 5 126 0 22 5 126 0 24 5 126 0 25 5 126 0 26 5 126 0 27 5 126 0 28 5 126 0 30 5 126 0 32 5 126 0 33 5 126 0 36 5 126 0 38 5 126 0 39 5 126 0 40 5 126 0 65 9 133 0 90 5 126 0 91 5 126 0 93 5 126 0 94 5 126 0 96 5 126 0 97 5 126 0 98 12 17 0 145 5 126 1 71] 
#[0 5 130 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 130 0 26 0 27 0 37 0 42 0 44 0 46 0 49 0 50 0 54 0 56 0 58 0 60 0 66 0 67 0 68 0 69 0 72 0 73 0 74 0 76 0 77 0 78 0 81 0 85 0 87 0 88 0 94 0 105] 
#[0 5 134 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 5 138 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 12 21 0 9] 
#[0 12 25 0 9] 
#[0 5 142 0 15 0 26 0 90 0 94] 
#[1 9 25 0 38 6 189 0 84 1 230 0 90 12 29 0 163 12 29 0 164] 
#[1 9 25 0 38 6 189 0 84 1 230 0 90 12 33 0 163 12 33 0 164] 
#[0 5 146 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 13 0 15 0 16 0 17 0 20 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 32 0 33 0 36 0 38 0 39 0 40 0 65 0 91 0 93 0 94 0 96 0 97 0 98 1 71] 
#[0 12 37 0 26] 
#[0 12 41 0 26] 
#[0 5 150 0 90] 
#[0 5 150 0 90] 
#[0 5 154 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 5 158 0 8 0 13 0 17 0 26 0 27 0 37 0 42 0 43 0 44 0 45 0 46 0 49 0 50 0 51 0 53 0 54 0 56 0 58 0 60 0 61 0 62 0 66 0 67 0 68 0 69 0 70 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 85 0 86 0 87 0 88 0 89 0 90 0 94 0 99 0 100 0 101 0 102 0 103 0 104 0 105]
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
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 1) at: 2).
	result type: ((nodes at: 1) at: 3).
	result declarator: ((nodes at: 1) at: 4).
	result throws: ((nodes at: 1) at: 5).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation1: nodes [
	| result |
	result := JavaAnnotationNode new.
	result _at: (nodes at: 1).
	result name: (nodes at: 2).
	result leftParen: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result values.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result rightParen: ((nodes at: 3) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_interface_body1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_interface_declaration1: nodes [
	| result |
	result := JavaAnnotationInterfaceNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result atToken: (nodes at: 2).
	result interfaceToken: (nodes at: 3).
	result name: (nodes at: 4).
	result leftBrace: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 5) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_method_declaration2: nodes [
	| result |
	result := JavaAnnotationMethodDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 1) at: 2).
	result type: ((nodes at: 1) at: 3).
	result declarator: ((nodes at: 1) at: 4).
	result throws: ((nodes at: 1) at: 5).
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
JavaParser >> reduceActionForannotations2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
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
	result addTokens: ((nodes at: 4) at: 1) to: result leftBrackets.
	result addTokens: ((nodes at: 4) at: 2) to: result rightBrackets.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_creation_expression3: nodes [
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
	result addNodes: (nodes at: 2) to: result statements.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForbreak_statement1: nodes [
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
JavaParser >> reduceActionForcast_expression3: nodes [
	| result |
	result := JavaCastExpressionNode new.
	result leftParen: (nodes at: 1).
	result type: (nodes at: 2).
	result ampToken: ((nodes at: 3) at: 1).
	result interfaceType: ((nodes at: 3) at: 2).
	result rightParen: (nodes at: 4).
	result expression: (nodes at: 5).
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
JavaParser >> reduceActionForclass_body_opt1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration1: nodes [
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
	result addNodes: ((nodes at: 7) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 7) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression1: nodes [
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
JavaParser >> reduceActionForclass_instance_creation_expression2: nodes [
	| result |
	result := JavaNewClassNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	result leftBrace: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 6) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression3: nodes [
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
JavaParser >> reduceActionForclass_instance_creation_expression4: nodes [
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
	result addNodes: ((nodes at: 10) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 10) at: 3).
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
JavaParser >> reduceActionForconstructor_body4: nodes [
	| result |
	result := JavaBlockNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declaration1: nodes [
	| result |
	result := JavaConstructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 2) at: 1).
	result name: ((nodes at: 2) at: 2).
	result leftParen: ((nodes at: 2) at: 3).
	result addNodes: ((nodes at: 2) at: 4) to: result parameters.
	result addTokens: ((nodes at: 2) at: 5) to: result commas.
	result rightParen: ((nodes at: 2) at: 6).
	result throws: (nodes at: 3).
	result body: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declarator1: nodes [
	| result |
	result := Array new: 6.
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
JavaParser >> reduceActionForcontinue_statement1: nodes [
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
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 4 put: ((nodes at: 4) at: 1).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 5).
	result at: 6 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body_declarations1: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body_declarations_opt1: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_constant1: nodes [
	| result |
	result := JavaEnumConstantNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result name: (nodes at: 2).
	result leftParen: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result expressions.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result rightParen: ((nodes at: 3) at: 4).
	result leftBrace: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 4) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_declaration1: nodes [
	| result |
	result := JavaEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result enumToken: (nodes at: 2).
	result name: (nodes at: 3).
	result implementsToken: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result leftBrace: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result constants.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result semicolon: ((nodes at: 5) at: 4).
	result addNodes: ((nodes at: 5) at: 5) to: result declarations.
	result rightBrace: ((nodes at: 5) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation1: nodes [
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
JavaParser >> reduceActionForexplicit_constructor_invocation2: nodes [
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
JavaParser >> reduceActionForexplicit_constructor_invocation3: nodes [
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
JavaParser >> reduceActionForexplicit_constructor_invocation4: nodes [
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
	result addNodes: (nodes at: 1) to: result modifiers.
	result interfaceToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result extendsToken: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result interfaceTypes.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result leftBrace: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 6) at: 3).
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
JavaParser >> reduceActionForinterfaces_opt1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
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
	result addNodes: ((nodes at: 1) at: 2) to: result parameters.
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result rightParen: ((nodes at: 1) at: 4).
	result arrowToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlambda_parameter_list_opt1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlambda_parameters2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 2).
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
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 1) at: 2).
	result type: ((nodes at: 1) at: 3).
	result declarator: ((nodes at: 1) at: 4).
	result throws: ((nodes at: 1) at: 5).
	result body: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_declarator1: nodes [
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
JavaParser >> reduceActionFormethod_declarator2: nodes [
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
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
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
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation2: nodes [
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
JavaParser >> reduceActionFormethod_invocation3: nodes [
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
JavaParser >> reduceActionFormethod_invocation4: nodes [
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
JavaParser >> reduceActionFormodifiers1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormodifiers_opt2: nodes [
	| result |
	result := nodes at: 1.
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
JavaParser >> reduceActionFortry_resources1: nodes [
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
	result leftParen: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result resources.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result rightParen: ((nodes at: 2) at: 4).
	result block: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result catches.
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
	result finally: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_statement3: nodes [
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
	result extendsToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result types.
	result addTokens: ((nodes at: 2) at: 3) to: result amps.
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
