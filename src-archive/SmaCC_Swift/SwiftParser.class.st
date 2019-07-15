Class {
	#name : #SwiftParser,
	#superclass : #SmaCCGLRParser,
	#category : #'SmaCC_Swift'
}

{ #category : #'generated-accessing' }
SwiftParser class >> cacheId [
	^'2018-03-19T12:41:29.991139-05:00'
]

{ #category : #generated }
SwiftParser class >> definitionComment [
"%glr;

%root Parse;
%prefix Swift;
%suffix Node;

%annotate_tokens;

%hierarchy Statement (
	BranchStatement
	ControlTransferStatement
	DeclarationStatement
	ExpressionStatement
	LabeledStatement
	LoopStatement
);
%hierarchy BranchStatement (
	IfStatement
	SwitchStatement
);
%hierarchy LoopStatement (
	DoWhileStatement
	ForStatement
	ForInStatement
	WhileStatement
);
%hierarchy ControlTransferStatement (
	BreakStatement
	ContinueStatement
	FallThroughStatement
	ReturnStatement
);
<whitespace>
	: \s+
	;
<comment>
	: \/\/ [^\r\n]*
	| (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
file
	: top_level_declaration {{}}
	;
##############
# Lexical Structure
##############
<id>
	: ([a-zA-Z_]) ([a-zA-Z_0-9])*
	;
<integer>
	: \d+
	;
<implicit_parameter_name>
	: $ <integer>
	;
<identifier>
	: <id>
	| ` <id> `
	| <implicit_parameter_name>
	;
identifier_list
	: <identifier>
	| identifier_list "","" <identifier>
	;
<binary_literal>
	: 0b[01][01_]* 
	;
<octal_literal>
	: 0o[0-7][0-7_]*
	;
<decimal_literal>
	: <integer> (<integer>|_)*
	;
<hexadecimal_literal>
	: 0x[0-9a-fA-F][0-9a-fA-F_]*
	;
<integer_literal>
	: <binary_literal>
	| <octal_literal>
	| <decimal_literal>
	| <hexadecimal_literal>
	;
<decimal_fraction>
	: \. <decimal_literal>
	;
<decimal_exponent>
	: [eE] [-+]? <decimal_literal>
	;
<hexadecimal_digit>
	: [0-9a-fA-F]
	;
<hexadecimal_fraction>
	: \. (<hexadecimal_digit> | _)*
	;
<hexadecimal_exponent>
	: [pP] [-+]? <decimal_literal>
	;
<floating_point_literal>
	: <decimal_literal> <decimal_fraction>? <decimal_exponent>?
	| <hexadecimal_literal> <hexadecimal_fraction>? <hexadecimal_exponent>
	;
<string_character>
	: \\([0\\tnr\""\(] | x <hexadecimal_digit>{2,2} | u <hexadecimal_digit>{4,4} | U <hexadecimal_digit>{8,8}) | [^\\\""\r\n]
	;
<full_string_literal>
	: \"" <string_character> * \""
	;
<start_string_literal>
	: \"" <string_character>* \\ \(
	;
<end_string_literal>
	: \\ \) <string_character>* \""
	;
<middle_string_literal>
	: \) <string_character>* \\ \(
	;
string_literal
	: <full_string_literal>
#	| <start_string_literal> string_expression_literals <end_string_literal>
	;
#string_expression_literals
#	: expression
#	| string_expression_literals <middle_string_literal> expression
#	;
literal
	: <integer_literal>
	| <floating_point_literal>
	| string_literal
	;

<operator>
	: [\/\=\-\+\!\*\%\<\>\&\|\^\~\.] +
	;
binary_operator
	: <operator>
	;
prefix_operator
	: <operator>
	;
postfix_operator
	: <operator>
	;
###############
# Statements
###############
statement
	: expression 'expression' _semicolon {{ExpressionStatement}}
	| declaration 'declaration' _semicolon {{DeclarationStatement}}
	| loop_statement _semicolon {{LoopStatement}}
	| branch_statement _semicolon {{BranchStatement}}
	| labeled_statement _semicolon {{LabeledStatement}}
	| control_transfer_statement _semicolon {{ControlTransferStatement}}
	;
statements
	: statement 'statement'
	| statements statement 'statement'
	;
loop_statement
	: for_statement
	| for_in_statement
	| while_statement
	| do_while_statement
	;
for_statement
	: ""for"" _for_init "";"" _expression 'testExpression' "";"" _expression 'incrementExpression' code_block 'block' {{ForStatement}}
	| ""for"" ""("" _for_init "";"" _expression 'testExpression' "";"" _expression 'incrementExpression' "")"" code_block 'block' {{ForStatement}}
	;
for_init
	: variable_declaration 'expression'
	| expression_list
	;
for_in_statement
	: ""for"" pattern ""in"" expression 'expression' code_block 'block' {{ForInStatement}}
	;
while_statement
	: ""while"" while_condition 'expression' code_block 'block' {{WhileStatement}}
	;
while_condition
	: expression
	| declaration
	;
do_while_statement
	: ""do"" code_block 'block' ""while"" while_condition {{DoWhileStatement}}
	;
branch_statement
	: if_statement
	| switch_statement
	;
if_statement
	: ""if"" if_condition code_block 'then' _else_clause {{IfStatement}}
	;
if_condition
	: expression 'expression'
	| declaration 'expression'
	;
else_clause
	: ""else"" code_block 'else'
	| ""else"" if_statement 'else'
	;
switch_statement
	: ""switch"" expression 'expression' ""{"" _switch_cases ""}"" {{SwitchStatement}}
	;
switch_cases
	: switch_case
	| switch_cases switch_case
	;
switch_case
	: case_label statements
	| case_label "";""
	| default_label statements
	| default_label "";""
	;
case_label
	: ""case"" case_item_list "":""
	;
case_item_list
	: pattern _guard_clause
	| case_item_list "","" pattern _guard_clause
	;
default_label
	: ""default"" "":""
	;
guard_clause
	: ""where"" guard_expression 'expression'
	;
guard_expression
	: expression
	;
labeled_statement
	: statement_label  loop_statement 'statement' {{LabeledStatement}}
	| statement_label switch_statement 'statement' {{LabeledStatement}}
	;
statement_label
	: label_name "":""
	;
label_name
	: <identifier> 'name'
	;
control_transfer_statement
	: break_statement
	| continue_statement
	| fallthrough_statement
	| return_statement
	;
break_statement
	: ""break"" _label_name {{BreakStatement}}
	;
continue_statement
	: ""continue"" _label_name {{ContinueStatement}}
	;
fallthrough_statement
	: ""fallthrough"" {{FallThroughStatement}}
	;
return_statement
	: ""return"" _expression {{ReturnStatement}}
	;
##############
# Generic Parameters and Arguments
##############
generic_parameter_clause
	: ""<"" generic_parameter_list _requirement_clause "">""
	;
generic_parameter_list
	: generic_parameter
	| generic_parameter_list "","" generic_parameter
	;
generic_parameter
	: type_name
	| type_name "":"" type_identifier
	| type_name "":"" protocol_composition_type
	;
requirement_clause
	: ""where"" requirement_list
	;
requirement_list
	: requirement
	| requirement_list "","" requirement
	;
requirement
	: conformance_requirement
	| same_type_requirement
	;
conformance_requirement
	: type_identifier "":"" type_identifier
	| type_identifier "":"" protocol_composition_type
	;
same_type_requirement
	: type_identifier ""=="" type_identifier
	;
generic_argument_clause
	: ""<"" generic_argument_list "">""
	;
generic_argument_list
	: generic_argument
	| generic_argument_list "","" generic_argument
	;
generic_argument
	: type
	;
#################
# Declarations
#################
declaration
	: import_declaration
	| constant_declaration
	| variable_declaration
	| typealias_declaration
	| function_declaration
	| enum_declaration
	| struct_declaration
	| class_declaration
	| protocol_declaration
	| initializer_declaration
	| deinitializer_declaration
	| extension_declaration
	| subscript_declaration
	| operator_declaration
	;
declarations
	: 
	| declarations declaration 'declaration'
	;
declaration_specifiers
	: 
	| declaration_specifiers  declaration_specifier
	;
declaration_specifier
	: ""class""
	| ""mutating""
	| ""nonmutating""
	| ""override""
	| ""static""
	| ""unowned""
	| ""unowned(safe)""
	| ""unowned(unsafe)""
	| ""weak""
	;
top_level_declaration
	: _statements
	;
code_block
	: ""{"" _statements ""}"" {{Block}}
	;
import_declaration
	: _attributes ""import"" _import_kind import_path {{}}
	;
import_kind
	: ""typealias""
	| ""struct""
	| ""class""
	| ""enum""
	| ""protocol""
	| ""var""
	| ""func""
	;
import_path
	: import_path_identifier
	| import_path ""."" import_path_identifier
	;
import_path_identifier
	: <identifier>
	| <operator>
	;
constant_declaration
	: _attributes _declaration_specifiers ""let"" pattern_initializer_list {{}}
	;
pattern_initializer_list
	: pattern_initializer 'inializer'
	| pattern_initializer_list "","" pattern_initializer 'inializer'
	;
pattern_initializer
	: pattern _initializer {{}}
	;
initializer
	: ""="" expression 'expression'
	;
variable_declaration
	: variable_declaration_head pattern_initializer_list {{}}
	| variable_declaration_head variable_name type_annotation code_block 'block' {{}}
	| variable_declaration_head variable_name type_annotation getter_setter_block {{}}
	| variable_declaration_head variable_name type_annotation getter_setter_keyword_block {{}}
	| variable_declaration_head variable_name type_annotation _initializer willSet_didSet_block {{}}
	;
variable_declaration_head
	: _attributes _declaration_specifiers ""var""
	;
variable_name
	: <identifier>
	;
getter_setter_block
	: ""{"" getter_clause _setter_clause ""}""
	| ""{"" setter_clause getter_clause ""}""
	;
getter_clause
	: _attributes ""get"" code_block 'block'
	;
setter_clause
	: _attributes ""set"" _setter_name code_block 'block'
	;
setter_name
	: ""("" <identifier> "")""
	;
getter_setter_keyword_block
	: ""{"" getter_keyword_clause _setter_keyword_clause ""}""
	| ""{"" setter_keyword_clause getter_keyword_clause ""}""
	;
getter_keyword_clause
	: _attributes ""get""
	;
setter_keyword_clause
	: _attributes ""set""
	;
willSet_didSet_block
	: ""{"" willSet_clause _didSet_clause ""}""
	| ""{"" didSet_clause willSet_clause ""}""
	;
willSet_clause
	: _attributes ""willSet"" _setter_name code_block 'block' 
	;
didSet_clause
	: _attributes ""didSet"" _setter_name code_block 'block'
	;
typealias_declaration
	: typealias_head typealias_assignment {{}}
	;
typealias_head
	: ""typealias"" typealias_name
	;
typealias_name
	: <identifier>
	;
typealias_assignment
	: ""="" type
	;
function_declaration
	: function_head function_name _generic_parameter_clause function_signature function_body 'block' {{}}
	;
function_head
	: _attributes _declaration_specifiers ""func"" 
	;
function_name
	: <identifier>
	| <operator>
	;
function_signature
	: parameter_clauses _function_result
	;
function_result
	: ""->"" _attributes type
	;
function_body
	: code_block
	;
parameter_clauses
	:
	| parameter_clauses parameter_clause
	;
parameter_clause
	: ""("" "")""
	| ""("" parameter_list _ellipsis "")""
	;
parameter_list
	: parameter
	| parameter_list "","" parameter
	;
parameter
	: _inout _let _hash parameter_name _local_parameter_name type_annotation _default_argument_clause
	| _inout ""var"" _hash parameter_name _local_parameter_name type_annotation _default_argument_clause
	| _attributes type
	;
parameter_name
	: <identifier>
	| ""_""
	;
local_parameter_name
	: <identifier>
	| ""_""
	;
default_argument_clause
	: ""="" expression 'expression'
	;
enum_declaration
	: _attributes union_style_enum {{}}
	| _attributes raw_value_style_enum {{}}
	;
union_style_enum
	: enum_name _generic_parameter_clause ""{"" _union_style_enum_members ""}""
	;
union_style_enum_members
	: union_style_enum_member
	| union_style_enum_members union_style_enum_member
	;
union_style_enum_member
	: declaration
	| union_style_enum_case_clause
	;
union_style_enum_case_clause
	: _attributes ""case"" union_style_enum_case_list
	;
union_style_enum_case_list
	: union_style_enum_case
	| union_style_enum_case_list "","" union_style_enum_case
	;
union_style_enum_case
	: enum_case_name _tuple_type
	;
enum_name
	: <identifier>
	;
enum_case_name
	: <identifier>
	;
raw_value_style_enum
	: enum_name _generic_parameter_clause "":"" type_identifier ""{"" _raw_value_style_enum_members ""}""
	;
raw_value_style_enum_members
	: raw_value_style_enum_member
	| raw_value_style_enum_members raw_value_style_enum_member
	;
raw_value_style_enum_member
	: declaration
	| raw_value_style_enum_case_clause
	;
raw_value_style_enum_case_clause
	: _attributes ""case"" raw_value_style_enum_case_list
	;
raw_value_style_enum_case_list
	: raw_value_style_enum_case
	| raw_value_style_enum_case_list "","" raw_value_style_enum_case
	;
raw_value_style_enum_case
	: enum_case_name _raw_value_assignment
	;
raw_value_assignment
	: ""="" literal
	;
struct_declaration
	: _attributes ""struct"" struct_name _generic_parameter_clause _type_inheritance_clause struct_body {{}}
	;
struct_name
	: <identifier>
	;
struct_body
	: ""{"" _declarations ""}""
	;
class_declaration
	: _attributes ""class"" class_name _generic_parameter_clause _type_inheritance_clause class_body {{}}
	;
class_name
	: <identifier>
	;
class_body
	: ""{"" _declarations ""}""
	;
protocol_declaration
	: _attributes ""protocol"" protocol_name _type_inheritance_clause protocol_body {{}}
	;
protocol_name
	: <identifier>
	;
protocol_body
	: ""{"" _protocol_member_declarations ""}""
	;
protocol_member_declaration
	: protocol_property_declaration
	| protocol_method_declaration
	| protocol_initializer_declaration
	| protocol_subscript_declaration
	| protocol_association_type_declaration
	;
protocol_member_declarations
	: protocol_member_declaration 'declaration'
	| protocol_member_declarations protocol_member_declaration 'declaration'
	;
protocol_property_declaration
	: variable_declaration_head variable_name type_annotation getter_setter_keyword_block {{}}
	;
protocol_method_declaration
	: function_head function_name _generic_parameter_clause function_signature {{}}
	;
protocol_initializer_declaration
	: initializer_head _generic_parameter_clause parameter_clause {{}}
	;
protocol_subscript_declaration
	: subscript_head subscript_result getter_setter_keyword_block {{}}
	;
protocol_association_type_declaration
	: typealias_head _type_inheritance_clause _typealias_assignment {{}}
	;
initializer_declaration
	: initializer_head _generic_parameter_clause parameter_clause initializer_body 'block' {{}}
	;
initializer_head
	: _attributes _convenience ""init""
	;
initializer_body
	: code_block
	;
deinitializer_declaration
	: _attributes ""deinit"" code_block 'block' {{}}
	;
extension_declaration
	: ""extension"" type_identifier _type_inheritance_clause extension_body {{}}
	;
extension_body
	: ""{"" _declarations ""}""
	;
subscript_declaration
	: subscript_head subscript_result code_block 'block' {{}}
	| subscript_head subscript_result getter_setter_block {{}}
	| subscript_head subscript_result getter_setter_keyword_block {{}}
	;
subscript_head
	: _attributes ""subscript"" parameter_clause
	;
subscript_result
	: ""->"" _attributes type
	;
operator_declaration
	: prefix_operator_declaration
	| postfix_operator_declaration
	| infix_operator_declaration
	;
prefix_operator_declaration
	: ""operator"" ""prefix"" <operator> ""{"" ""}"" {{}}
	;
postfix_operator_declaration
	: ""operator"" ""postfix""  <operator> ""{"" ""}"" {{}}
	;
infix_operator_declaration
	: ""operator"" ""infix"" <operator> ""{"" _infix_operator_attributes ""}"" {{}}
	;
infix_operator_attributes
	: _precedence_clause _associativity_clause
	;
precedence_clause
	: ""precedence"" precedence_level
	;
precedence_level
	: <integer_literal>
	;
associativity_clause
	: ""associativity"" associativity
	;
associativity
	: ""left""
	| ""right""
	| ""none""
	;
######################
# Patterns
######################
pattern
	: wildcard_pattern _type_annotation
	| identifier_pattern _type_annotation
	| value_binding_pattern
	| tuple_pattern _type_annotation
	| enum_case_pattern
	| type_casting_pattern
	| expression_pattern
	;
wildcard_pattern
	: ""_""
	;
identifier_pattern
	: <identifier>
	;
value_binding_pattern
	: ""var"" pattern
	| ""let"" pattern
	;
tuple_pattern
	: ""("" _tuple_pattern_element_list "")""
	;
tuple_pattern_element_list
	: tuple_pattern_element
	| tuple_pattern_element_list "","" tuple_pattern_element
	;
tuple_pattern_element
	: pattern
	;
enum_case_pattern
	: _type_identifier ""."" enum_case_name _tuple_pattern
	;
type_casting_pattern
	: is_pattern
	| as_pattern
	;
is_pattern
	: ""is"" type
	;
as_pattern
	: pattern ""as"" type
	;
expression_pattern
	: expression 'expression'
	;
######################
# Attributes
######################
attribute
	: ""@"" attribute_name _attribute_argument_clause
	;
attribute_name
	: <identifier>
	;
attribute_argument_clause
	: ""("" _balanced_tokens "")""
	;
attributes
	: attribute
	| attributes attribute
	;
balanced_tokens
	: balanced_token
	| balanced_tokens balanced_token
	;
balanced_token
	: ""("" _balanced_tokens "")""
	| ""["" _balanced_tokens ""]""
	| ""{"" _balanced_tokens ""}""
	| <identifier>
	| literal
	| <operator>
	# “Any punctuation except (, ), [, ], {, or }”
	;
expression
	: prefix_expression 
	| prefix_expression binary_expressions {{BinaryExpression}}
	;
expression_list
	: expression 'expression'
	| expression_list "","" expression 'expression'
	;
prefix_expression
	: postfix_expression
	| prefix_operator postfix_expression {{}}
	| in_out_expression
	;
in_out_expression
	: ""&"" <identifier> {{}}
	;
binary_expression
	: binary_operator prefix_expression {{BinaryOperator}}
	| assignment_operator prefix_expression {{AssignmentOperator}}
	| conditional_operator prefix_expression {{CondionalOperator}}
	| type_casting_operator {{TypeCastOperator}}
	;
binary_expressions
	: binary_expression 'operator'
	| binary_expressions binary_expression 'operator'
	;
assignment_operator
	: ""=""
	;
conditional_operator
	: ""?"" expression 'trueExpression' "":""
	;
type_casting_operator
	: ""is"" type 'type'
	| ""as"" type 'type'
	| ""as"" ""?"" type 'type'
	;
primary_expression
	: <identifier> _generic_argument_clause {{}}
	| literal_expression
	| self_expression
	| superclass_expression
	| closure_expression
	| parenthesized_expression
	| implicit_member_expression
	| wildcard_expression
	;
literal_expression
	: literal {{}}
	| array_literal {{}}
	| dictionary_literal {{}}
	| ""__FILE__"" {{}}
	| ""__LINE__"" {{}}
	| ""__COLUMN__"" {{}}
	| ""__FUNCTION__"" {{}}
	;
array_literal
	: ""["" _array_literal_items ""]""
	;
array_literal_items
	: array_literal_item _comma
	| array_literal_item "","" array_literal_items
	;
array_literal_item
	: expression 'expression'
	;
dictionary_literal
	: ""["" dictionary_literal_items ""]""	
	| ""["" "":"" ""]""
	;
dictionary_literal_items
	: dictionary_literal_item _comma
	| dictionary_literal_item "","" dictionary_literal_items
	;
dictionary_literal_item
	: expression 'keyExpression' "":"" expression 'valueExpression'
	;
self_expression
	: ""self"" {{}}
	| ""self"" ""."" <identifier> {{}}
	| ""self"" ""["" expression 'expression' ""]"" {{}}
	| ""self"" ""."" ""init"" {{}}
	;
superclass_expression
	: superclass_method_expression
	| superclass_subscript_expression
	| superclass_initializer_expression
	;
superclass_method_expression
	: ""super"" ""."" <identifier> {{}}
	;
superclass_subscript_expression
	: ""super"" ""["" expression 'expression' ""]"" {{}}
	;
superclass_initializer_expression
	: ""super"" ""."" ""init"" {{}}
	;
closure_expression
	: ""{"" _closure_signature statements ""}"" {{}}
	;
closure_signature
	: parameter_clause _function_result ""in""
	| identifier_list _function_result ""in""
	| capture_list parameter_clause _function_result ""in""
	| capture_list identifier_list _function_result ""in""
	| capture_list ""in""
	;
capture_list
	: ""["" capture_specifier expression 'expression' ""]""
	;
capture_specifier
	: ""weak""
	| ""unowned""
	| ""unowned(safe)""
	| ""unowned(unsafe)""
	;
implicit_member_expression
	: ""."" <identifier> {{}}
	;
parenthesized_expression
	: ""("" _expression_element_list "")""  {{}}
	;
expression_element_list
	: expression_element
	| expression_element_list "","" expression_element
	;
expression_element
	: expression 'expression'
	| <identifier> "":"" expression 'expression' {{NamedExpression}}
	;
wildcard_expression
	: ""_"" {{}}
	;
postfix_expression
	: primary_expression
	| postfix_expression postfix_operator
	| function_call_expression
	| initializer_expression
	| explicit_member_expression
	| postfix_self_expression
	| dynamic_type_expression
	| subscript_expression
	| forced_value_expression
	| optional_chaining_expression
	;
function_call_expression
	: postfix_expression 'expression' parenthesized_expression {{}}
	| postfix_expression 'expression' _parenthesized_expression trailing_closure {{}}
	;
trailing_closure
	: closure_expression
	;
initializer_expression
	: postfix_expression ""."" ""init"" {{}}
	;
explicit_member_expression
	: postfix_expression ""."" <integer_literal> {{}}
	| postfix_expression ""."" <identifier> _generic_argument_clause {{}}
	;
postfix_self_expression
	: postfix_expression ""."" ""self"" {{}}
	;
dynamic_type_expression
	: postfix_expression ""."" ""dynamicType"" {{}}
	;
subscript_expression
	: postfix_expression ""["" expression_list ""]"" {{}}
	;
forced_value_expression
	: postfix_expression 'expression' ""!"" {{}}
	;
optional_chaining_expression
	: postfix_expression 'expression' ""?"" {{}}
	;
######################
# Types
######################
type
	: array_type
	| dictionary_type
	| function_type
	| type_identifier
	| tuple_type
	| optional_type
	| implicitly_unwrapped_optional_type
	| protocol_composition_type
	| metatype_type
	;
type_annotation
	: "":"" _attributes type
	;
type_identifier
	: type_name _generic_argument_clause {{}}
	| type_name _generic_argument_clause ""."" type_identifier {{}}
	;
type_name
	: <identifier>
	;
tuple_type
	: ""("" _tuple_type_body "")"" {{}}
	;
tuple_type_body
	: tuple_type_element_list _ellipsis
	;
tuple_type_element_list
	: tuple_type_element
	| tuple_type_element_list "","" tuple_type_element
	;
tuple_type_element
	: _attributes _inout type
	| _inout element_name type_annotation
	;
element_name
	: <identifier>
	;
function_type
	: type ""->"" type {{}}
	;
array_type
	: ""["" type ""]"" {{}}
	;
dictionary_type
	: ""["" type "":"" type ""]"" {{}}
	;
optional_type
	: type ""?"" {{}}
	;
implicitly_unwrapped_optional_type
	: type ""!"" {{}}
	;
protocol_composition_type
	: ""protocol"" ""<"" _protocol_identifier_list "">"" {{}}
	;
protocol_identifier_list
	: protocol_identifier
	| protocol_identifier_list "","" protocol_identifier
	;
protocol_identifier
	: type_identifier
	;
metatype_type
	: type ""."" ""Type"" {{}}
	| type ""."" ""Protocol"" {{}}
	;
type_inheritance_clause
	: "":"" type_inheritance_list
	;
type_inheritance_list
	: type_identifier
	| type_inheritance_list "","" type_identifier
	;
######################
# Optional items
######################
_array_literal_items
	:
	| array_literal_items
	;
_associativity_clause
	:
	| associativity_clause
	;
_attribute_argument_clause
	:
	| attribute_argument_clause
	;
_attributes
	:
	| attributes
	;
_balanced_tokens
	:
	| balanced_tokens
	;
_binary_expressions
	:
	| binary_expressions
	;
_closure_signature
	:
	| closure_signature
	;
_comma
	:
	| "",""
	;
_convenience
	:
	| ""convenience""
	;
_declaration_specifiers
	:
	| declaration_specifiers
	;
_declarations
	: 
	| declarations
	;
_default_argument_clause
	: 
	| default_argument_clause
	;
_didSet_clause
	:
	| didSet_clause
	;
_ellipsis
	:
	| ""...""
	;
_else_clause
	: 
	| else_clause
	;
_expression
	:
	| expression 'expression'
	;
_expression_element_list
	:
	| expression_element_list
	;
_generic_argument_clause
	:
	| generic_argument_clause
	;
_generic_parameter_clause
	: 
	| generic_parameter_clause
	;
_guard_clause
	:
	| guard_clause
	;
_for_init
	:
	| for_init
	;
_function_result
	:
	| function_result
	;
_hash
	:
	| ""#""
	;
_import_kind
	: 
	| import_kind
	;
_infix_operator_attributes
	:
	| infix_operator_attributes
	;
_initializer
	: 
	| initializer
	;
_inout
	: 
	| ""inout""
	;
_label_name
	: 
	| label_name
	;
_let
	:
	| ""let""
	;
_local_parameter_name
	:
	| local_parameter_name
	;
_parenthesized_expression
	:
	| parenthesized_expression
	;
_precedence_clause
	:
	| precedence_clause
	;
_prefix_operator
	:
	| prefix_operator
	;
_protocol_identifier_list
	: 
	| protocol_identifier_list
	;
_protocol_member_declarations
	:
	| protocol_member_declarations
	;
_raw_value_assignment
	: 
	| raw_value_assignment
	;
_raw_value_style_enum_members
	: 
	| raw_value_style_enum_members
	;
_requirement_clause
	:
	| requirement_clause
	;
_semicolon
	:
	| "";""
	;
_setter_clause
	: 
	| setter_clause
	;
_setter_keyword_clause
	:
	| setter_keyword_clause
	;
_setter_name
	: 
	| setter_name
	;
_statements
	:
	| statements
	;
_switch_cases
	: 
	| switch_cases
	;
_tuple_pattern
	:
	| tuple_pattern
	;
_tuple_pattern_element_list
	: 
	| tuple_pattern_element_list
	;
_tuple_type
	:
	| tuple_type
	;
_tuple_type_body
	:
	| tuple_type_body
	;
_typealias_assignment
	:
	| typealias_assignment
	;
_type_annotation
	:
	| type_annotation
	;
_type_identifier
	:
	| type_identifier
	;
_type_inheritance_clause
	:
	| type_inheritance_clause
	;
_union_style_enum_members
	:
	| union_style_enum_members
	;"
]

{ #category : #'generated-accessing' }
SwiftParser class >> scannerClass [
	^SwiftScanner
]

{ #category : #generated }
SwiftParser class >> startingStateForfile [
	^ 1
]

{ #category : #generated }
SwiftParser >> ambiguousTransitions [
^#(
#[ 0 6 0 109] 
#[ 0 42 1 241] 
#[ 0 17 0 50] 
#[ 0 6 2 37] 
#[ 0 6 1 213] 
#[ 0 9 0 58] 
#[ 0 13 0 58] 
#[ 0 17 0 58] 
#[ 0 25 0 58] 
#[ 0 29 0 58] 
#[ 0 33 0 58] 
#[ 0 37 0 58] 
#[ 0 41 0 58] 
#[ 0 45 0 58] 
#[ 0 58 0 85] 
#[ 0 58 0 89] 
#[ 0 58 0 105] 
#[ 0 58 1 213] 
#[ 0 58 0 113] 
#[ 0 58 0 117] 
#[ 0 58 0 121] 
#[ 0 58 0 125] 
#[ 0 62 2 149] 
#[ 0 62 2 153] 
#[ 0 66 2 189] 
#[ 0 66 2 193] 
#[ 0 66 2 197] 
#[ 0 150 3 97] 
#[ 0 150 3 105] 
#[ 0 150 3 113] 
#[ 0 13 0 154] 
#[ 0 154 3 145] 
#[ 0 154 3 149] 
#[ 0 154 3 153] 
#[ 0 154 0 178] 
#[ 0 154 3 157] 
#[ 0 182 3 173] 
#[ 0 182 0 186] 
#[ 0 222 3 241] 
#[ 0 14 1 2] 
#[ 0 22 1 6] 
#[ 0 70 1 10] 
#[ 0 70 0 250 1 10] 
#[ 0 250 2 221] 
#[ 1 22 4 149] 
#[ 0 6 1 90] 
#[ 0 13 1 114] 
#[ 1 114 3 145] 
#[ 1 114 3 149] 
#[ 1 114 3 153] 
#[ 0 178 1 114] 
#[ 1 114 3 157] 
#[ 1 10 1 142] 
#[ 1 194 3 97] 
#[ 1 194 3 105] 
#[ 1 194 3 113] 
#[ 1 218 1 222] 
#[ 2 38 6 165] 
#[ 0 70 0 250] 
#[ 1 10 3 229] 
#[ 0 202 1 54] 
#[ 0 202 1 50 1 54] 
#[ 0 6 4 237] 
#[ 2 58 6 221] 
#[ 2 66 4 141] 
#[ 2 70 4 141] 
#[ 1 154 5 121] 
#[ 2 178 6 221] 
#[ 2 210 6 221] 
#[ 2 210 6 225] 
#[ 2 214 6 221] 
#[ 2 214 6 225] 
#[ 3 162 3 166] 
#[ 3 198 6 221] 
#[ 3 210 8 129] 
#[ 3 222 3 226] 
#[ 4 74 6 221] 
#[ 4 74 6 225] 
#[ 4 94 9 109] 
#[ 4 158 6 213] 
#[ 4 158 6 217] 
#[ 4 158 6 221] 
#[ 4 158 6 225] 
#[ 4 174 6 221]
	).
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_array_literal_items1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_associativity_clause1: nodes [
	| result |
	result := Array new: 4.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_attribute_argument_clause1: nodes [
	| result |
	result := Array new: 11.
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
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_attributes1: nodes [
	| result |
	result := Array new: 12.
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
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_closure_signature1: nodes [
	| result |
	result := Array new: 33.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_expression_element_list1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_generic_argument_clause1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_generic_parameter_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_import_kind1: nodes [
	| result |
	result := Array new: 7.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_infix_operator_attributes1: nodes [
	| result |
	result := Array new: 6.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_initializer1: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_protocol_identifier_list2: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_requirement_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_setter_clause1: nodes [
	| result |
	result := Array new: 14.
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
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_setter_keyword_clause1: nodes [
	| result |
	result := Array new: 13.
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
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_setter_name1: nodes [
	| result |
	result := Array new: 3.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_statements1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_statements2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_switch_cases1: nodes [
	| result |
	result := Array new: 34.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_switch_cases2: nodes [
	| result |
	result := Array new: 34.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
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
	self addAll: ((nodes at: 1) at: 18) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 30).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 31).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 32).
	self addAll: ((nodes at: 1) at: 30) to: (result at: 33).
	self addAll: ((nodes at: 1) at: 31) to: (result at: 34).
	self addAll: ((nodes at: 1) at: 32) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 33) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 34) to: (result at: 28).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_tuple_pattern_element_list1: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_tuple_pattern_element_list2: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 23).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_type_annotation1: nodes [
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
SwiftParser >> reduceActionFor_type_inheritance_clause1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_typealias_assignment1: nodes [
	| result |
	result := Array new: 25.
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
	result at: 25 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_union_style_enum_members1: nodes [
	| result |
	result := Array new: 57.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_union_style_enum_members2: nodes [
	| result |
	result := Array new: 57.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 38).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 41).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 55).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 56).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 57).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 30) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 31) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 32) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 33) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 34) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 35) to: (result at: 30).
	self addAll: ((nodes at: 1) at: 36) to: (result at: 31).
	self addAll: ((nodes at: 1) at: 37) to: (result at: 32).
	self addAll: ((nodes at: 1) at: 38) to: (result at: 33).
	self addAll: ((nodes at: 1) at: 39) to: (result at: 34).
	self addAll: ((nodes at: 1) at: 40) to: (result at: 36).
	self addAll: ((nodes at: 1) at: 41) to: (result at: 35).
	self addAll: ((nodes at: 1) at: 42) to: (result at: 37).
	self addAll: ((nodes at: 1) at: 43) to: (result at: 39).
	self addAll: ((nodes at: 1) at: 44) to: (result at: 40).
	self addAll: ((nodes at: 1) at: 45) to: (result at: 42).
	self addAll: ((nodes at: 1) at: 46) to: (result at: 43).
	self addAll: ((nodes at: 1) at: 47) to: (result at: 44).
	self addAll: ((nodes at: 1) at: 48) to: (result at: 45).
	self addAll: ((nodes at: 1) at: 49) to: (result at: 46).
	self addAll: ((nodes at: 1) at: 50) to: (result at: 47).
	self addAll: ((nodes at: 1) at: 51) to: (result at: 53).
	self addAll: ((nodes at: 1) at: 52) to: (result at: 54).
	self addAll: ((nodes at: 1) at: 53) to: (result at: 48).
	self addAll: ((nodes at: 1) at: 54) to: (result at: 49).
	self addAll: ((nodes at: 1) at: 55) to: (result at: 50).
	self addAll: ((nodes at: 1) at: 56) to: (result at: 51).
	self addAll: ((nodes at: 1) at: 57) to: (result at: 52).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForarray_literal1: nodes [
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
SwiftParser >> reduceActionForarray_literal_items1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForarray_literal_items2: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForarray_type1: nodes [
	| result |
	result := SwiftArrayTypeNode new.
	result addToken: (nodes at: 1) to: result leftBracketTokens.
	result addToken: (nodes at: 3) to: result rightBracketTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForas_pattern1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForassociativity_clause1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForattribute1: nodes [
	| result |
	result := Array new: 12.
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
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForattribute_argument_clause1: nodes [
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForattributes1: nodes [
	| result |
	result := Array new: 12.
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
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
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
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForattributes2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token2: nodes [
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token3: nodes [
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 5).
	self add: (nodes at: 3) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token4: nodes [
	| result |
	result := Array new: 11.
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
	self add: (nodes at: 1) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token5: nodes [
	| result |
	result := Array new: 11.
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
	self add: ((nodes at: 1) at: 1) to: (result at: 8).
	self add: ((nodes at: 1) at: 2) to: (result at: 9).
	self add: ((nodes at: 1) at: 3) to: (result at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token6: nodes [
	| result |
	result := Array new: 11.
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
	self add: (nodes at: 1) to: (result at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_tokens2: nodes [
	| result |
	result := nodes at: 2.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbinary_expression1: nodes [
	| result |
	result := SwiftBinaryOperatorNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbinary_expression2: nodes [
	| result |
	result := SwiftAssignmentOperatorNode new.
	result addToken: (nodes at: 1) to: result equalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbinary_expression3: nodes [
	| result |
	result := SwiftCondionalOperatorNode new.
	result addToken: ((nodes at: 1) at: 1) to: result questionMarkTokens.
	result trueExpression: ((nodes at: 1) at: 2).
	result addToken: ((nodes at: 1) at: 3) to: result colonTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbinary_expression4: nodes [
	| result |
	result := SwiftTypeCastOperatorNode new.
	result _isToken: ((nodes at: 1) at: 1).
	result type: ((nodes at: 1) at: 2).
	result asToken: ((nodes at: 1) at: 3).
	result questionMarkToken: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbreak_statement1: nodes [
	| result |
	result := SwiftBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_list1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	result at: 5 put: ((nodes at: 2) at: 4).
	result at: 6 put: (nodes at: 3).
	result at: 7 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_specifier1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_specifier2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_specifier3: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_specifier4: nodes [
	| result |
	result := Array new: 4.
	result at: 4 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcase_item_list1: nodes [
	| result |
	result := Array new: 30.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
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
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self add: ((nodes at: 2) at: 1) to: (result at: 30).
	self add: ((nodes at: 2) at: 2) to: (result at: 27).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcase_item_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 3) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 3) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 3) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 29) to: (result at: 29).
	self add: ((nodes at: 4) at: 1) to: (result at: 30).
	self add: ((nodes at: 4) at: 2) to: (result at: 27).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcase_label1: nodes [
	| result |
	result := Array new: 31.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 29).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 30).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 31).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 30) to: (result at: 25).
	self add: (nodes at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclass_declaration1: nodes [
	| result |
	result := SwiftClassDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result classToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result commaTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 4) at: 8).
	result addTokens: ((nodes at: 4) at: 9) to: result equalEqualTokens.
	result addToken: ((nodes at: 5) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 5) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 5) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 5) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 5) at: 5) to: result periodTokens.
	result addTokens: ((nodes at: 5) at: 6) to: result commaTokens.
	result addToken: ((nodes at: 6) at: 1) to: result leftBraceTokens.
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result addToken: ((nodes at: 6) at: 3) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_expression1: nodes [
	| result |
	result := SwiftClosureExpressionNode new.
	result addToken: (nodes at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result letTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result periodTokens.
	result
		addTokens: ((nodes at: 2) at: 12)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result typeTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 19)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result equalTokens.
	result addObjects: ((nodes at: 2) at: 21) to: result expressions.
	result addTokens: ((nodes at: 2) at: 22) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 25)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 26)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 27)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 28) to: result operatorTokens.
	result inToken: ((nodes at: 2) at: 29).
	result weakToken: ((nodes at: 2) at: 30).
	result unownedToken: ((nodes at: 2) at: 31).
	result unownedLeftParensafeRightParenToken: ((nodes at: 2) at: 32).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 2) at: 33).
	result addNodes: (nodes at: 3) to: result statements.
	result addToken: (nodes at: 4) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature1: nodes [
	| result |
	result := Array new: 33.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
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
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 3).
	result at: 29 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature2: nodes [
	| result |
	result := Array new: 33.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 3).
	result at: 29 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature3: nodes [
	| result |
	result := Array new: 33.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 8).
	result at: 30 put: ((nodes at: 1) at: 2).
	result at: 31 put: ((nodes at: 1) at: 3).
	result at: 32 put: ((nodes at: 1) at: 4).
	result at: 33 put: ((nodes at: 1) at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 21).
	self add: ((nodes at: 1) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 25).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 26).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 27).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 3).
	result at: 29 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature4: nodes [
	| result |
	result := Array new: 33.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 8).
	result at: 30 put: ((nodes at: 1) at: 2).
	result at: 31 put: ((nodes at: 1) at: 3).
	result at: 32 put: ((nodes at: 1) at: 4).
	result at: 33 put: ((nodes at: 1) at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 21).
	self add: ((nodes at: 1) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 25).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 26).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 27).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 3).
	result at: 29 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature5: nodes [
	| result |
	result := Array new: 33.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 8).
	result at: 30 put: ((nodes at: 1) at: 2).
	result at: 31 put: ((nodes at: 1) at: 3).
	result at: 32 put: ((nodes at: 1) at: 4).
	result at: 33 put: ((nodes at: 1) at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 21).
	self add: ((nodes at: 1) at: 7) to: (result at: 9).
	result at: 29 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcode_block1: nodes [
	| result |
	result := SwiftBlockNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForconformance_requirement1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForconstant_declaration1: nodes [
	| result |
	result := SwiftConstantDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result classTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result mutatingTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result overrideTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result staticTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result unownedTokens.
	result
		addTokens: ((nodes at: 2) at: 7)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 2) at: 8)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result weakTokens.
	result letToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result inializers.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcontinue_statement1: nodes [
	| result |
	result := SwiftContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier2: nodes [
	| result |
	result := Array new: 9.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier3: nodes [
	| result |
	result := Array new: 9.
	result at: 3 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier4: nodes [
	| result |
	result := Array new: 9.
	result at: 4 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier5: nodes [
	| result |
	result := Array new: 9.
	result at: 5 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier6: nodes [
	| result |
	result := Array new: 9.
	result at: 6 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier7: nodes [
	| result |
	result := Array new: 9.
	result at: 7 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier8: nodes [
	| result |
	result := Array new: 9.
	result at: 8 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier9: nodes [
	| result |
	result := Array new: 9.
	result at: 9 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifiers1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifiers2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	self add: ((nodes at: 2) at: 3) to: (result at: 3).
	self add: ((nodes at: 2) at: 4) to: (result at: 4).
	self add: ((nodes at: 2) at: 5) to: (result at: 5).
	self add: ((nodes at: 2) at: 6) to: (result at: 6).
	self add: ((nodes at: 2) at: 7) to: (result at: 7).
	self add: ((nodes at: 2) at: 8) to: (result at: 8).
	self add: ((nodes at: 2) at: 9) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeinitializer_declaration1: nodes [
	| result |
	result := SwiftDeinitializerDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result deinitToken: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	result at: 6 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal2: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 3).
	result at: 6 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal_item1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal_items1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	self add: (nodes at: 2) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal_items2: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addFirst: (nodes at: 2) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_type1: nodes [
	| result |
	result := SwiftDictionaryTypeNode new.
	result addToken: (nodes at: 1) to: result leftBracketTokens.
	result addToken: (nodes at: 3) to: result colonTokens.
	result addToken: (nodes at: 5) to: result rightBracketTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordo_while_statement1: nodes [
	| result |
	result := SwiftDoWhileStatementNode new.
	result doToken: (nodes at: 1).
	result block: (nodes at: 2).
	result whileToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordynamic_type_expression1: nodes [
	| result |
	result := SwiftDynamicTypeExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result
		addTokens: ((nodes at: 1) at: 27)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 28)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 30) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 31) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 32)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 34) to: result varTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result operatorTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result dynamicTypeTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForenum_case_pattern1: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 2) to: (result at: 5).
	self add: (nodes at: 3) to: (result at: 1).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 7).
	self addAll: ((nodes at: 4) at: 3) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 4) at: 5) to: (result at: 9).
	self addAll: ((nodes at: 4) at: 6) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 7) to: (result at: 11).
	self addAll: ((nodes at: 4) at: 8) to: (result at: 12).
	self addAll: ((nodes at: 4) at: 9) to: (result at: 5).
	self addAll: ((nodes at: 4) at: 10) to: (result at: 13).
	self addAll: ((nodes at: 4) at: 11) to: (result at: 14).
	self addAll: ((nodes at: 4) at: 12) to: (result at: 15).
	self addAll: ((nodes at: 4) at: 13) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 14) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 4) at: 16) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 4) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 4) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 4) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 4) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 4) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 4) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 4) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 4) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 4) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 4) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 4) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 4) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForenum_declaration1: nodes [
	| result |
	result := SwiftEnumDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result whereTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 12) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result importTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result typealiasTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result structTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result classTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result enumTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result funcTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result mutatingTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result overrideTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result staticTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result unownedTokens.
	result
		addTokens: ((nodes at: 2) at: 27)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 2) at: 28)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result weakTokens.
	result addTokens: ((nodes at: 2) at: 30) to: result letTokens.
	result addNodes: ((nodes at: 2) at: 31) to: result inializers.
	result addTokens: ((nodes at: 2) at: 32) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 33)
		to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 34)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 35)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 36) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 37) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 38)
		to: result periodPeriodPeriodTokens.
	result addNodes: ((nodes at: 2) at: 39) to: result blocks.
	result addTokens: ((nodes at: 2) at: 40) to: result getTokens.
	result addTokens: ((nodes at: 2) at: 41) to: result setTokens.
	result addTokens: ((nodes at: 2) at: 42) to: result rightBraceTokens.
	result addTokens: ((nodes at: 2) at: 43) to: result equalTokens.
	result addObjects: ((nodes at: 2) at: 44) to: result expressions.
	result addTokens: ((nodes at: 2) at: 45) to: result willSetTokens.
	result addTokens: ((nodes at: 2) at: 46) to: result didSetTokens.
	result addTokens: ((nodes at: 2) at: 47) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 48) to: result initTokens.
	result addTokens: ((nodes at: 2) at: 49) to: result deinitTokens.
	result addTokens: ((nodes at: 2) at: 50) to: result extensionTokens.
	result addTokens: ((nodes at: 2) at: 51) to: result subscriptTokens.
	result addTokens: ((nodes at: 2) at: 52) to: result caseTokens.
	result addNodes: ((nodes at: 2) at: 53) to: result declarations.
	result addTokens: ((nodes at: 2) at: 54) to: result convenienceTokens.
	result
		addTokens: ((nodes at: 2) at: 55)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 56)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 57)
		to: result full_string_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForenum_declaration2: nodes [
	| result |
	result := SwiftEnumDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result whereTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 12) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result importTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result typealiasTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result structTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result classTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result enumTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result funcTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result mutatingTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result overrideTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result staticTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result unownedTokens.
	result
		addTokens: ((nodes at: 2) at: 27)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 2) at: 28)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result weakTokens.
	result addTokens: ((nodes at: 2) at: 30) to: result letTokens.
	result addNodes: ((nodes at: 2) at: 31) to: result inializers.
	result addTokens: ((nodes at: 2) at: 32) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 33)
		to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 34)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 35)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 36) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 37) to: result typeTokens.
	result addNodes: ((nodes at: 2) at: 38) to: result blocks.
	result addTokens: ((nodes at: 2) at: 39) to: result getTokens.
	result addTokens: ((nodes at: 2) at: 40) to: result setTokens.
	result addTokens: ((nodes at: 2) at: 41) to: result rightBraceTokens.
	result addTokens: ((nodes at: 2) at: 42) to: result equalTokens.
	result addObjects: ((nodes at: 2) at: 43) to: result expressions.
	result addTokens: ((nodes at: 2) at: 44) to: result willSetTokens.
	result addTokens: ((nodes at: 2) at: 45) to: result didSetTokens.
	result
		addTokens: ((nodes at: 2) at: 46)
		to: result periodPeriodPeriodTokens.
	result addNodes: ((nodes at: 2) at: 47) to: result declarations.
	result addTokens: ((nodes at: 2) at: 48) to: result convenienceTokens.
	result addTokens: ((nodes at: 2) at: 49) to: result initTokens.
	result addTokens: ((nodes at: 2) at: 50) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 51) to: result deinitTokens.
	result addTokens: ((nodes at: 2) at: 52) to: result extensionTokens.
	result addTokens: ((nodes at: 2) at: 53) to: result subscriptTokens.
	result addTokens: ((nodes at: 2) at: 54) to: result caseTokens.
	result
		addTokens: ((nodes at: 2) at: 55)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 56)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 57)
		to: result full_string_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexplicit_member_expression1: nodes [
	| result |
	result := SwiftExplicitMemberExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result
		addTokens: ((nodes at: 1) at: 27)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 28)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 30) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 31) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 32)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 34) to: result varTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result operatorTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result integer_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexplicit_member_expression2: nodes [
	| result |
	result := SwiftExplicitMemberExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result
		addTokens: ((nodes at: 1) at: 27)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 28)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 30) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 31) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 32)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 34) to: result varTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result operatorTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result addToken: ((nodes at: 4) at: 3) to: result greaterThanTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexpression2: nodes [
	| result |
	result := SwiftBinaryExpressionNode new.
	result addNodes: (nodes at: 2) to: result operators.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexpression_element2: nodes [
	| result |
	result := SwiftNamedExpressionNode new.
	result identifierToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexpression_element_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexpression_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForextension_body1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForextension_declaration1: nodes [
	| result |
	result := SwiftExtensionDeclarationNode new.
	result extensionToken: (nodes at: 1).
	result colonToken: ((nodes at: 3) at: 1).
	result addTokens: ((nodes at: 3) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result commaTokens.
	result leftBraceToken: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBraceToken: ((nodes at: 4) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfallthrough_statement1: nodes [
	| result |
	result := SwiftFallThroughStatementNode new.
	result fallthroughToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfile1: nodes [
	| result |
	result := SwiftFileNode new.
	result addNodes: (nodes at: 1) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfor_in_statement1: nodes [
	| result |
	result := SwiftForInStatementNode new.
	result forToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 2) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 14)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 2) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result letTokens.
	result addObjects: ((nodes at: 2) at: 27) to: result expressions.
	result addTokens: ((nodes at: 2) at: 28) to: result isTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result asTokens.
	result inToken: (nodes at: 3).
	result addObject: (nodes at: 4) to: result expressions.
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfor_init1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfor_statement1: nodes [
	| result |
	result := SwiftForStatementNode new.
	result forToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 3).
	result testExpression: (nodes at: 4).
	result semicolonToken: (nodes at: 5).
	result incrementExpression: (nodes at: 6).
	result block: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfor_statement2: nodes [
	| result |
	result := SwiftForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addObjects: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 4).
	result testExpression: (nodes at: 5).
	result semicolonToken: (nodes at: 6).
	result incrementExpression: (nodes at: 7).
	result rightParenToken: (nodes at: 8).
	result block: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForforced_value_expression1: nodes [
	| result |
	result := SwiftForcedValueExpressionNode new.
	result expression: (nodes at: 1).
	result bangToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_call_expression1: nodes [
	| result |
	result := SwiftFunctionCallExpressionNode new.
	result addObject: (nodes at: 1) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_declaration1: nodes [
	| result |
	result := SwiftFunctionDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result funcToken: ((nodes at: 1) at: 22).
	result addToken: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 2) to: result operatorTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 3) at: 8).
	result addTokens: ((nodes at: 3) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result commaTokens.
	result
		addTokens: ((nodes at: 4) at: 4)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result varTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result letTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 9) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 10) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 11) to: result equalTokens.
	result addObjects: ((nodes at: 4) at: 12) to: result expressions.
	result addTokens: ((nodes at: 4) at: 13) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 14)
		to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 15)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 4) at: 16) to: result periodTokens.
	result
		addTokens: ((nodes at: 4) at: 17)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 4) at: 18) to: result bangTokens.
	result addTokens: ((nodes at: 4) at: 19) to: result protocolTokens.
	result addTokens: ((nodes at: 4) at: 20) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 21) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 22) to: result typeTokens.
	result addTokens: ((nodes at: 4) at: 23) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 24) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 25)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 26)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 27)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 4) at: 28) to: result operatorTokens.
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_head1: nodes [
	| result |
	result := Array new: 22.
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
	self addAll: ((nodes at: 2) at: 1) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 21).
	result at: 22 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_name1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_name2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_signature1: nodes [
	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_type1: nodes [
	| result |
	result := SwiftFunctionTypeNode new.
	result addToken: (nodes at: 2) to: result minusGreaterThanTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_argument_clause1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_argument_list1: nodes [
	| result |
	result := Array new: 1.
	result at: 1 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_argument_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter2: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	result at: 8 put: ((nodes at: 3) at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self add: (nodes at: 4) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter_list1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self add: ((nodes at: 1) at: 7) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 6).
	self add: ((nodes at: 3) at: 7) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_keyword_clause1: nodes [
	| result |
	result := Array new: 13.
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
	result at: 13 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_setter_block1: nodes [
	| result |
	result := Array new: 15.
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
	result at: 14 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	result at: 13 put: ((nodes at: 2) at: 13).
	self add: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	result at: 15 put: ((nodes at: 3) at: 13).
	self add: ((nodes at: 3) at: 14) to: (result at: 14).
	self add: (nodes at: 4) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_setter_block2: nodes [
	| result |
	result := Array new: 15.
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
	result at: 14 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	result at: 15 put: ((nodes at: 2) at: 13).
	self add: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	result at: 13 put: ((nodes at: 3) at: 13).
	self add: ((nodes at: 3) at: 14) to: (result at: 14).
	self add: (nodes at: 4) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_setter_keyword_block1: nodes [
	| result |
	result := Array new: 14.
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
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	result at: 13 put: ((nodes at: 2) at: 13).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	result at: 14 put: ((nodes at: 3) at: 13).
	self add: (nodes at: 4) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_setter_keyword_block2: nodes [
	| result |
	result := Array new: 14.
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
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	result at: 14 put: ((nodes at: 2) at: 13).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	result at: 13 put: ((nodes at: 3) at: 13).
	self add: (nodes at: 4) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForif_statement1: nodes [
	| result |
	result := SwiftIfStatementNode new.
	result ifToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result then: (nodes at: 3).
	result elseToken: ((nodes at: 4) at: 1).
	result else: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimplicit_member_expression1: nodes [
	| result |
	result := SwiftImplicitMemberExpressionNode new.
	result periodToken: (nodes at: 1).
	result identifierToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimplicitly_unwrapped_optional_type1: nodes [
	| result |
	result := SwiftImplicitlyUnwrappedOptionalTypeNode new.
	result addToken: (nodes at: 2) to: result bangTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_declaration1: nodes [
	| result |
	result := SwiftImportDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result importToken: (nodes at: 2).
	result typealiasToken: ((nodes at: 3) at: 1).
	result structToken: ((nodes at: 3) at: 2).
	result classToken: ((nodes at: 3) at: 3).
	result enumToken: ((nodes at: 3) at: 4).
	result protocolToken: ((nodes at: 3) at: 5).
	result varToken: ((nodes at: 3) at: 6).
	result funcToken: ((nodes at: 3) at: 7).
	result addTokens: ((nodes at: 4) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result operatorTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result periodTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind2: nodes [
	| result |
	result := Array new: 7.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind3: nodes [
	| result |
	result := Array new: 7.
	result at: 3 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind4: nodes [
	| result |
	result := Array new: 7.
	result at: 4 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind5: nodes [
	| result |
	result := Array new: 7.
	result at: 5 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind6: nodes [
	| result |
	result := Array new: 7.
	result at: 6 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind7: nodes [
	| result |
	result := Array new: 7.
	result at: 7 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_path1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_path2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForin_out_expression1: nodes [
	| result |
	result := SwiftInOutExpressionNode new.
	result andToken: (nodes at: 1).
	result identifierToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinfix_operator_attributes1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 2) at: 1).
	result at: 4 put: ((nodes at: 2) at: 2).
	result at: 5 put: ((nodes at: 2) at: 3).
	result at: 6 put: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinfix_operator_declaration1: nodes [
	| result |
	result := SwiftInfixOperatorDeclarationNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result infixToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result operatorTokens.
	result leftBraceToken: (nodes at: 4).
	result precedenceToken: ((nodes at: 5) at: 1).
	result integer_literalToken: ((nodes at: 5) at: 2).
	result associativityToken: ((nodes at: 5) at: 3).
	result leftToken: ((nodes at: 5) at: 4).
	result rightToken: ((nodes at: 5) at: 5).
	result noneToken: ((nodes at: 5) at: 6).
	result rightBraceToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinitializer_declaration1: nodes [
	| result |
	result := SwiftInitializerDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result convenienceToken: ((nodes at: 1) at: 13).
	result initToken: ((nodes at: 1) at: 14).
	result addTokens: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 2) at: 8).
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result letTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result periodTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result typeTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 19)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result equalTokens.
	result addObjects: ((nodes at: 3) at: 21) to: result expressions.
	result addTokens: ((nodes at: 3) at: 22) to: result varTokens.
	result addTokens: ((nodes at: 3) at: 23) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 25)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 26)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 27)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 28) to: result operatorTokens.
	result block: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinitializer_expression1: nodes [
	| result |
	result := SwiftInitializerExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result
		addTokens: ((nodes at: 1) at: 27)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 28)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 30) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 31) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 32)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 34) to: result varTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result operatorTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result initTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinitializer_head1: nodes [
	| result |
	result := Array new: 14.
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
	result at: 13 put: (nodes at: 2).
	result at: 14 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForis_pattern1: nodes [
	| result |
	result := Array new: 25.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForlabeled_statement1: nodes [
	| result |
	result := SwiftLabeledStatementNode new.
	result name: ((nodes at: 1) at: 1).
	result colonToken: ((nodes at: 1) at: 2).
	result statement: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral3: nodes [
	| result |
	result := Array new: 3.
	result at: 3 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression1: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result integer_literalToken: ((nodes at: 1) at: 1).
	result floating_point_literalToken: ((nodes at: 1) at: 2).
	result full_string_literalToken: ((nodes at: 1) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression2: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result leftBracketToken: ((nodes at: 1) at: 1).
	result addObjects: ((nodes at: 1) at: 2) to: result expressions.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result rightBracketToken: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression3: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result leftBracketToken: ((nodes at: 1) at: 1).
	result addObjects: ((nodes at: 1) at: 2) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 3) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 4) to: result valueExpressions.
	result addTokens: ((nodes at: 1) at: 5) to: result commaTokens.
	result rightBracketToken: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression4: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result __FILE__Token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression5: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result __LINE__Token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression6: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result __COLUMN__Token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression7: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result __FUNCTION__Token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFormetatype_type1: nodes [
	| result |
	result := SwiftMetatypeTypeNode new.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result typeTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFormetatype_type2: nodes [
	| result |
	result := SwiftMetatypeTypeNode new.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result protocolTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForoptional_chaining_expression1: nodes [
	| result |
	result := SwiftOptionalChainingExpressionNode new.
	result expression: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForoptional_type1: nodes [
	| result |
	result := SwiftOptionalTypeNode new.
	result addToken: (nodes at: 2) to: result questionMarkTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter1: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
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
	result at: 25 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	self add: ((nodes at: 4) at: 1) to: (result at: 4).
	self add: ((nodes at: 4) at: 2) to: (result at: 3).
	self add: ((nodes at: 5) at: 1) to: (result at: 4).
	self add: ((nodes at: 5) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 1) to: (result at: 5).
	self addAll: ((nodes at: 6) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 6) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 6) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 6) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 6) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 6) at: 8) to: (result at: 10).
	self addAll: ((nodes at: 6) at: 9) to: (result at: 11).
	self addAll: ((nodes at: 6) at: 10) to: (result at: 12).
	self addAll: ((nodes at: 6) at: 11) to: (result at: 13).
	self addAll: ((nodes at: 6) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 6) at: 13) to: (result at: 15).
	self addAll: ((nodes at: 6) at: 14) to: (result at: 16).
	self addAll: ((nodes at: 6) at: 15) to: (result at: 17).
	self addAll: ((nodes at: 6) at: 16) to: (result at: 18).
	self addAll: ((nodes at: 6) at: 17) to: (result at: 19).
	self addAll: ((nodes at: 6) at: 18) to: (result at: 20).
	self addAll: ((nodes at: 6) at: 19) to: (result at: 21).
	self addAll: ((nodes at: 6) at: 20) to: (result at: 22).
	self addAll: ((nodes at: 6) at: 21) to: (result at: 23).
	self addAll: ((nodes at: 6) at: 22) to: (result at: 24).
	self addAll: ((nodes at: 6) at: 23) to: (result at: 25).
	self addAll: ((nodes at: 6) at: 24) to: (result at: 1).
	result at: 26 put: ((nodes at: 7) at: 1).
	result at: 27 put: ((nodes at: 7) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter2: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
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
	result at: 25 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 28 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	self add: ((nodes at: 4) at: 1) to: (result at: 4).
	self add: ((nodes at: 4) at: 2) to: (result at: 3).
	self add: ((nodes at: 5) at: 1) to: (result at: 4).
	self add: ((nodes at: 5) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 1) to: (result at: 5).
	self addAll: ((nodes at: 6) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 6) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 6) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 6) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 6) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 6) at: 8) to: (result at: 10).
	self addAll: ((nodes at: 6) at: 9) to: (result at: 11).
	self addAll: ((nodes at: 6) at: 10) to: (result at: 12).
	self addAll: ((nodes at: 6) at: 11) to: (result at: 13).
	self addAll: ((nodes at: 6) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 6) at: 13) to: (result at: 15).
	self addAll: ((nodes at: 6) at: 14) to: (result at: 16).
	self addAll: ((nodes at: 6) at: 15) to: (result at: 17).
	self addAll: ((nodes at: 6) at: 16) to: (result at: 18).
	self addAll: ((nodes at: 6) at: 17) to: (result at: 19).
	self addAll: ((nodes at: 6) at: 18) to: (result at: 20).
	self addAll: ((nodes at: 6) at: 19) to: (result at: 21).
	self addAll: ((nodes at: 6) at: 20) to: (result at: 22).
	self addAll: ((nodes at: 6) at: 21) to: (result at: 23).
	self addAll: ((nodes at: 6) at: 22) to: (result at: 24).
	self addAll: ((nodes at: 6) at: 23) to: (result at: 25).
	self addAll: ((nodes at: 6) at: 24) to: (result at: 1).
	result at: 26 put: ((nodes at: 7) at: 1).
	result at: 27 put: ((nodes at: 7) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter3: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
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
	result at: 25 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_clause1: nodes [
	| result |
	result := Array new: 28.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_clause2: nodes [
	| result |
	result := Array new: 28.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self add: (nodes at: 3) to: (result at: 19).
	self add: (nodes at: 4) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_clauses1: nodes [
	| result |
	result := Array new: 28.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_clauses2: nodes [
	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_list1: nodes [
	| result |
	result := Array new: 28.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 19).
	self add: ((nodes at: 1) at: 26) to: (result at: 20).
	self add: ((nodes at: 1) at: 27) to: (result at: 21).
	self add: ((nodes at: 1) at: 28) to: (result at: 22).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 25).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 26).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 27).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 25) to: (result at: 19).
	self add: ((nodes at: 3) at: 26) to: (result at: 20).
	self add: ((nodes at: 3) at: 27) to: (result at: 21).
	self add: ((nodes at: 3) at: 28) to: (result at: 22).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparenthesized_expression1: nodes [
	| result |
	result := SwiftParenthesizedExpressionNode new.
	result leftParenToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern1: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern2: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern3: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern4: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern5: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern6: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern7: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 27).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern_initializer1: nodes [
	| result |
	result := SwiftPatternInitializerNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result colonTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 14)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 1) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 1) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result varTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result letTokens.
	result addObjects: ((nodes at: 1) at: 27) to: result expressions.
	result addTokens: ((nodes at: 1) at: 28) to: result isTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result asTokens.
	result equalToken: ((nodes at: 2) at: 1).
	result addObject: ((nodes at: 2) at: 2) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpostfix_expression1: nodes [
	| result |
	result := Array new: 43.
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
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpostfix_expression2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 36).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpostfix_operator_declaration1: nodes [
	| result |
	result := SwiftPostfixOperatorDeclarationNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result postfixToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result operatorTokens.
	result leftBraceToken: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpostfix_self_expression1: nodes [
	| result |
	result := SwiftPostfixSelfExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result
		addTokens: ((nodes at: 1) at: 27)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 28)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 30) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 31) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 32)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 34) to: result varTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result operatorTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result selfTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprefix_expression2: nodes [
	| result |
	result := SwiftPrefixExpressionNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 2) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 2) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 2) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 2) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 2) at: 14).
	result __LINE__Token: ((nodes at: 2) at: 15).
	result __COLUMN__Token: ((nodes at: 2) at: 16).
	result __FUNCTION__Token: ((nodes at: 2) at: 17).
	result addTokens: ((nodes at: 2) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result _Tokens.
	result
		addTokens: ((nodes at: 2) at: 27)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 28)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 30) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 31) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 32)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 33) to: result equalTokens.
	result addTokens: ((nodes at: 2) at: 34) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 35) to: result rightBraceTokens.
	result addTokens: ((nodes at: 2) at: 36) to: result operatorTokens.
	result inToken: ((nodes at: 2) at: 37).
	result weakToken: ((nodes at: 2) at: 38).
	result unownedToken: ((nodes at: 2) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 2) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 2) at: 41).
	result addNodes: ((nodes at: 2) at: 42) to: result statements.
	result addTokens: ((nodes at: 2) at: 43) to: result dynamicTypeTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprefix_operator_declaration1: nodes [
	| result |
	result := SwiftPrefixOperatorDeclarationNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result prefixToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result operatorTokens.
	result leftBraceToken: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprimary_expression1: nodes [
	| result |
	result := SwiftPrimaryExpressionNode new.
	result identifierToken: (nodes at: 1).
	result lessThanToken: ((nodes at: 2) at: 1).
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result greaterThanToken: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_association_type_declaration1: nodes [
	| result |
	result := SwiftProtocolAssociationTypeDeclarationNode new.
	result typealiasToken: ((nodes at: 1) at: 1).
	result addToken: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result commaTokens.
	result equalToken: ((nodes at: 3) at: 1).
	result addTokens: ((nodes at: 3) at: 2) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result colonTokens.
	result
		addTokens: ((nodes at: 3) at: 5)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 10) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result typeTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 17)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 19) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 22)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 24)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 25) to: result operatorTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_composition_type1: nodes [
	| result |
	result := SwiftProtocolCompositionTypeNode new.
	result protocolToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result greaterThanTokens.
	result addToken: (nodes at: 4) to: result greaterThanTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_declaration1: nodes [
	| result |
	result := SwiftProtocolDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result protocolToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result colonToken: ((nodes at: 4) at: 1).
	result addTokens: ((nodes at: 4) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result commaTokens.
	result addToken: ((nodes at: 5) at: 1) to: result leftBraceTokens.
	result addNodes: ((nodes at: 5) at: 2) to: result declarations.
	result addToken: ((nodes at: 5) at: 3) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_initializer_declaration1: nodes [
	| result |
	result := SwiftProtocolInitializerDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result convenienceToken: ((nodes at: 1) at: 13).
	result initToken: ((nodes at: 1) at: 14).
	result addTokens: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 2) at: 8).
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result letTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result periodTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result typeTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 19)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result equalTokens.
	result addObjects: ((nodes at: 3) at: 21) to: result expressions.
	result addTokens: ((nodes at: 3) at: 22) to: result varTokens.
	result addTokens: ((nodes at: 3) at: 23) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 25)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 26)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 27)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 28) to: result operatorTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_method_declaration1: nodes [
	| result |
	result := SwiftProtocolMethodDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result funcToken: ((nodes at: 1) at: 22).
	result addToken: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 2) to: result operatorTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 3) at: 8).
	result addTokens: ((nodes at: 3) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result commaTokens.
	result
		addTokens: ((nodes at: 4) at: 4)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result varTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result letTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 9) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 10) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 11) to: result equalTokens.
	result addObjects: ((nodes at: 4) at: 12) to: result expressions.
	result addTokens: ((nodes at: 4) at: 13) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 14)
		to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 15)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 4) at: 16) to: result periodTokens.
	result
		addTokens: ((nodes at: 4) at: 17)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 4) at: 18) to: result bangTokens.
	result addTokens: ((nodes at: 4) at: 19) to: result protocolTokens.
	result addTokens: ((nodes at: 4) at: 20) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 21) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 22) to: result typeTokens.
	result addTokens: ((nodes at: 4) at: 23) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 24) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 25)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 26)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 27)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 4) at: 28) to: result operatorTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_property_declaration1: nodes [
	| result |
	result := SwiftProtocolPropertyDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 14)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 3) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 4) at: 12) to: result operatorTokens.
	result getToken: ((nodes at: 4) at: 13).
	result setToken: ((nodes at: 4) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_subscript_declaration1: nodes [
	| result |
	result := SwiftProtocolSubscriptDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result subscriptToken: ((nodes at: 1) at: 13).
	result addTokens: ((nodes at: 1) at: 14) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result colonTokens.
	result
		addTokens: ((nodes at: 1) at: 17)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result periodTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result greaterThanTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result typeTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result equalTokens.
	result addObjects: ((nodes at: 1) at: 27) to: result expressions.
	result addTokens: ((nodes at: 1) at: 28) to: result varTokens.
	result
		addTokens: ((nodes at: 1) at: 29)
		to: result periodPeriodPeriodTokens.
	result
		addTokens: ((nodes at: 2) at: 1)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 2) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result operatorTokens.
	result getToken: ((nodes at: 3) at: 13).
	result setToken: ((nodes at: 3) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum1: nodes [
	| result |
	result := Array new: 57.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self add: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self add: (nodes at: 3) to: (result at: 3).
	self add: (nodes at: 5) to: (result at: 10).
	self addAll: ((nodes at: 6) at: 1) to: (result at: 11).
	self addAll: ((nodes at: 6) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 6) at: 3) to: (result at: 12).
	self addAll: ((nodes at: 6) at: 4) to: (result at: 13).
	self addAll: ((nodes at: 6) at: 5) to: (result at: 14).
	self addAll: ((nodes at: 6) at: 6) to: (result at: 15).
	self addAll: ((nodes at: 6) at: 7) to: (result at: 16).
	self addAll: ((nodes at: 6) at: 8) to: (result at: 17).
	self addAll: ((nodes at: 6) at: 9) to: (result at: 18).
	self addAll: ((nodes at: 6) at: 10) to: (result at: 7).
	self addAll: ((nodes at: 6) at: 11) to: (result at: 19).
	self addAll: ((nodes at: 6) at: 12) to: (result at: 20).
	self addAll: ((nodes at: 6) at: 13) to: (result at: 21).
	self addAll: ((nodes at: 6) at: 14) to: (result at: 6).
	self addAll: ((nodes at: 6) at: 15) to: (result at: 22).
	self addAll: ((nodes at: 6) at: 16) to: (result at: 23).
	self addAll: ((nodes at: 6) at: 17) to: (result at: 24).
	self addAll: ((nodes at: 6) at: 18) to: (result at: 25).
	self addAll: ((nodes at: 6) at: 19) to: (result at: 26).
	self addAll: ((nodes at: 6) at: 20) to: (result at: 27).
	self addAll: ((nodes at: 6) at: 21) to: (result at: 28).
	self addAll: ((nodes at: 6) at: 22) to: (result at: 29).
	self addAll: ((nodes at: 6) at: 23) to: (result at: 30).
	self addAll: ((nodes at: 6) at: 24) to: (result at: 31).
	self addAll: ((nodes at: 6) at: 25) to: (result at: 5).
	self addAll: ((nodes at: 6) at: 26) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 27) to: (result at: 32).
	self addAll: ((nodes at: 6) at: 28) to: (result at: 33).
	self addAll: ((nodes at: 6) at: 29) to: (result at: 34).
	self addAll: ((nodes at: 6) at: 30) to: (result at: 35).
	self addAll: ((nodes at: 6) at: 31) to: (result at: 36).
	self addAll: ((nodes at: 6) at: 32) to: (result at: 2).
	self addAll: ((nodes at: 6) at: 33) to: (result at: 4).
	self addAll: ((nodes at: 6) at: 34) to: (result at: 37).
	self addAll: ((nodes at: 6) at: 35) to: (result at: 50).
	self addAll: ((nodes at: 6) at: 36) to: (result at: 46).
	self addAll: ((nodes at: 6) at: 37) to: (result at: 38).
	self addAll: ((nodes at: 6) at: 38) to: (result at: 10).
	self addAll: ((nodes at: 6) at: 39) to: (result at: 39).
	self addAll: ((nodes at: 6) at: 40) to: (result at: 40).
	self addAll: ((nodes at: 6) at: 41) to: (result at: 41).
	self addAll: ((nodes at: 6) at: 42) to: (result at: 42).
	self addAll: ((nodes at: 6) at: 43) to: (result at: 43).
	self addAll: ((nodes at: 6) at: 44) to: (result at: 44).
	self addAll: ((nodes at: 6) at: 45) to: (result at: 45).
	self addAll: ((nodes at: 6) at: 46) to: (result at: 8).
	self addAll: ((nodes at: 6) at: 47) to: (result at: 9).
	self addAll: ((nodes at: 6) at: 48) to: (result at: 49).
	self addAll: ((nodes at: 6) at: 49) to: (result at: 51).
	self addAll: ((nodes at: 6) at: 50) to: (result at: 52).
	self addAll: ((nodes at: 6) at: 51) to: (result at: 53).
	self addAll: ((nodes at: 6) at: 52) to: (result at: 54).
	self addAll: ((nodes at: 6) at: 53) to: (result at: 47).
	self addAll: ((nodes at: 6) at: 54) to: (result at: 48).
	self addAll: ((nodes at: 6) at: 55) to: (result at: 55).
	self addAll: ((nodes at: 6) at: 56) to: (result at: 56).
	self addAll: ((nodes at: 6) at: 57) to: (result at: 57).
	self add: (nodes at: 7) to: (result at: 41).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_case1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	result at: 5 put: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_case_clause1: nodes [
	| result |
	result := Array new: 15.
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
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
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
	result at: 13 put: (nodes at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_case_list1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_case_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 6).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self add: ((nodes at: 3) at: 3) to: (result at: 3).
	self add: ((nodes at: 3) at: 4) to: (result at: 4).
	self add: ((nodes at: 3) at: 5) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_member2: nodes [
	| result |
	result := Array new: 57.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
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
	self add: ((nodes at: 1) at: 13) to: (result at: 57).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 45).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 32).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 4).
	result at: 5 put: ((nodes at: 1) at: 6).
	result at: 7 put: ((nodes at: 1) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement2: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 4).
	result at: 8 put: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement_list1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self add: ((nodes at: 1) at: 7) to: (result at: 7).
	self add: ((nodes at: 1) at: 8) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self add: ((nodes at: 3) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 6).
	self add: ((nodes at: 3) at: 7) to: (result at: 7).
	self add: ((nodes at: 3) at: 8) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForreturn_statement1: nodes [
	| result |
	result := SwiftReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsame_type_requirement1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForself_expression1: nodes [
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForself_expression2: nodes [
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForself_expression3: nodes [
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForself_expression4: nodes [
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result initToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsetter_clause1: nodes [
	| result |
	result := Array new: 14.
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
	result at: 13 put: (nodes at: 2).
	self add: ((nodes at: 3) at: 1) to: (result at: 3).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self add: ((nodes at: 3) at: 3) to: (result at: 4).
	result at: 14 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatement1: nodes [
	| result |
	result := SwiftExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatement2: nodes [
	| result |
	result := SwiftDeclarationStatementNode new.
	result declaration: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatement3: nodes [
	| result |
	result := nodes at: 1.
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatements1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatements2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstruct_declaration1: nodes [
	| result |
	result := SwiftStructDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result structToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result commaTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 4) at: 8).
	result addTokens: ((nodes at: 4) at: 9) to: result equalEqualTokens.
	result addToken: ((nodes at: 5) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 5) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 5) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 5) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 5) at: 5) to: result periodTokens.
	result addTokens: ((nodes at: 5) at: 6) to: result commaTokens.
	result addToken: ((nodes at: 6) at: 1) to: result leftBraceTokens.
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result addToken: ((nodes at: 6) at: 3) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_declaration1: nodes [
	| result |
	result := SwiftSubscriptDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result subscriptToken: ((nodes at: 1) at: 13).
	result addTokens: ((nodes at: 1) at: 14) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result colonTokens.
	result
		addTokens: ((nodes at: 1) at: 17)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result periodTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result greaterThanTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result typeTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result equalTokens.
	result addObjects: ((nodes at: 1) at: 27) to: result expressions.
	result addTokens: ((nodes at: 1) at: 28) to: result varTokens.
	result
		addTokens: ((nodes at: 1) at: 29)
		to: result periodPeriodPeriodTokens.
	result
		addTokens: ((nodes at: 2) at: 1)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 2) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addNode: (nodes at: 3) to: result blocks.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_declaration2: nodes [
	| result |
	result := SwiftSubscriptDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result subscriptToken: ((nodes at: 1) at: 13).
	result addTokens: ((nodes at: 1) at: 14) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result colonTokens.
	result
		addTokens: ((nodes at: 1) at: 17)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result periodTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result greaterThanTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result typeTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result equalTokens.
	result addObjects: ((nodes at: 1) at: 27) to: result expressions.
	result addTokens: ((nodes at: 1) at: 28) to: result varTokens.
	result
		addTokens: ((nodes at: 1) at: 29)
		to: result periodPeriodPeriodTokens.
	result
		addTokens: ((nodes at: 2) at: 1)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 2) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result operatorTokens.
	result getToken: ((nodes at: 3) at: 13).
	result addNodes: ((nodes at: 3) at: 14) to: result blocks.
	result setToken: ((nodes at: 3) at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_declaration3: nodes [
	| result |
	result := SwiftSubscriptDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result subscriptToken: ((nodes at: 1) at: 13).
	result addTokens: ((nodes at: 1) at: 14) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result colonTokens.
	result
		addTokens: ((nodes at: 1) at: 17)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result periodTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result greaterThanTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result typeTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result equalTokens.
	result addObjects: ((nodes at: 1) at: 27) to: result expressions.
	result addTokens: ((nodes at: 1) at: 28) to: result varTokens.
	result
		addTokens: ((nodes at: 1) at: 29)
		to: result periodPeriodPeriodTokens.
	result
		addTokens: ((nodes at: 2) at: 1)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 2) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result operatorTokens.
	result getToken: ((nodes at: 3) at: 13).
	result setToken: ((nodes at: 3) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_expression1: nodes [
	| result |
	result := SwiftSubscriptExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result
		addTokens: ((nodes at: 1) at: 27)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 28)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 30) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 31) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 32)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 34) to: result varTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result operatorTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result leftBracketTokens.
	result addObjects: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result addToken: (nodes at: 4) to: result rightBracketTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_head1: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
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
	result at: 13 put: (nodes at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 25).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 29).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 26).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 27).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 25) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 26) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 27) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 28) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_result1: nodes [
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
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsuperclass_initializer_expression1: nodes [
	| result |
	result := SwiftSuperclassInitializerExpressionNode new.
	result superToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result initToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsuperclass_method_expression1: nodes [
	| result |
	result := SwiftSuperclassMethodExpressionNode new.
	result superToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsuperclass_subscript_expression1: nodes [
	| result |
	result := SwiftSuperclassSubscriptExpressionNode new.
	result superToken: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_case1: nodes [
	| result |
	result := Array new: 34.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
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
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 1) at: 31) to: (result at: 31).
	self addAll: (nodes at: 2) to: (result at: 32).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_case2: nodes [
	| result |
	result := Array new: 34.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
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
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 1) at: 31) to: (result at: 31).
	result at: 33 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_case3: nodes [
	| result |
	result := Array new: 34.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 34 put: ((nodes at: 1) at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 3).
	self addAll: (nodes at: 2) to: (result at: 32).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_case4: nodes [
	| result |
	result := Array new: 34.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 34 put: ((nodes at: 1) at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 3).
	result at: 33 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_cases1: nodes [
	| result |
	result := Array new: 34.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
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
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 1) at: 31) to: (result at: 31).
	self addAll: ((nodes at: 1) at: 32) to: (result at: 32).
	self add: ((nodes at: 1) at: 33) to: (result at: 33).
	self add: ((nodes at: 1) at: 34) to: (result at: 34).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_cases2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 2) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 2) at: 31) to: (result at: 31).
	self addAll: ((nodes at: 2) at: 32) to: (result at: 32).
	self add: ((nodes at: 2) at: 33) to: (result at: 33).
	self add: ((nodes at: 2) at: 34) to: (result at: 34).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_statement1: nodes [
	| result |
	result := SwiftSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result addObject: (nodes at: 2) to: result expressions.
	result addToken: (nodes at: 3) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result caseTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result leftBracketTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 9)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 4) at: 10) to: result periodTokens.
	result
		addTokens: ((nodes at: 4) at: 11)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 4) at: 12) to: result bangTokens.
	result addTokens: ((nodes at: 4) at: 13) to: result protocolTokens.
	result addTokens: ((nodes at: 4) at: 14) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 15) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 16) to: result typeTokens.
	result addTokens: ((nodes at: 4) at: 17) to: result commaTokens.
	result
		addTokens: ((nodes at: 4) at: 18)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 4) at: 19) to: result varTokens.
	result addTokens: ((nodes at: 4) at: 20) to: result letTokens.
	result addObjects: ((nodes at: 4) at: 21) to: result expressions.
	result addTokens: ((nodes at: 4) at: 22) to: result isTokens.
	result addTokens: ((nodes at: 4) at: 23) to: result asTokens.
	result addTokens: ((nodes at: 4) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 25) to: result whereTokens.
	result addNodes: ((nodes at: 4) at: 26) to: result statements.
	result addTokens: ((nodes at: 4) at: 27) to: result semicolonToken.
	result addTokens: ((nodes at: 4) at: 28) to: result defaultTokens.
	result addTokens: ((nodes at: 4) at: 29) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 30) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 31)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 32)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 33)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 4) at: 34) to: result operatorTokens.
	result addToken: (nodes at: 5) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_pattern1: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 29).
	self add: (nodes at: 3) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_pattern_element_list2: nodes [
	| result |
	result := nodes at: 3.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAllFirst: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAllFirst: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAllFirst: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAllFirst: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAllFirst: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAllFirst: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAllFirst: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAllFirst: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAllFirst: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAllFirst: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAllFirst: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAllFirst: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAllFirst: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAllFirst: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAllFirst: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAllFirst: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAllFirst: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAllFirst: ((nodes at: 1) at: 29) to: (result at: 29).
	self addFirst: (nodes at: 2) to: (result at: 22).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type1: nodes [
	| result |
	result := SwiftTupleTypeNode new.
	result addToken: (nodes at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result colonTokens.
	result
		addTokens: ((nodes at: 2) at: 9)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result periodTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result typeTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 18)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 21)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 22)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result operatorTokens.
	result addToken: (nodes at: 3) to: result rightParenTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type_body1: nodes [
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
	self addAll: ((nodes at: 1) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 18).
	self add: (nodes at: 2) to: (result at: 18).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type_element1: nodes [
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
	self add: (nodes at: 2) to: (result at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type_element2: nodes [
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
	self add: (nodes at: 1) to: (result at: 13).
	self add: (nodes at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type_element_list2: nodes [
	| result |
	result := nodes at: 3.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAllFirst: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAllFirst: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAllFirst: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAllFirst: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAllFirst: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAllFirst: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAllFirst: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAllFirst: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAllFirst: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAllFirst: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAllFirst: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAllFirst: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAllFirst: ((nodes at: 1) at: 24) to: (result at: 24).
	self addFirst: (nodes at: 2) to: (result at: 23).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_operator1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_operator2: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_operator3: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (nodes at: 1).
	result at: 4 put: (nodes at: 2).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_pattern1: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
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
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_pattern2: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_identifier1: nodes [
	| result |
	result := SwiftTypeIdentifierNode new.
	result addToken: (nodes at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: ((nodes at: 2) at: 3) to: result greaterThanTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_identifier2: nodes [
	| result |
	result := nodes at: 4.
	result addFirstToken: (nodes at: 1) to: result identifierTokens.
	result addFirstToken: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addFirstTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result
		addFirstToken: ((nodes at: 2) at: 3)
		to: result greaterThanTokens.
	result addFirstToken: (nodes at: 3) to: result periodTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_inheritance_clause1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_inheritance_list1: nodes [
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
SwiftParser >> reduceActionFortype_inheritance_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortypealias_declaration1: nodes [
	| result |
	result := SwiftTypealiasDeclarationNode new.
	result typealiasToken: ((nodes at: 1) at: 1).
	result addToken: ((nodes at: 1) at: 2) to: result identifierTokens.
	result equalToken: ((nodes at: 2) at: 1).
	result addTokens: ((nodes at: 2) at: 2) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result colonTokens.
	result
		addTokens: ((nodes at: 2) at: 5)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result typeTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 17)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 19) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 22)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 24)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result operatorTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortypealias_head1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum1: nodes [
	| result |
	result := Array new: 57.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self add: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self add: (nodes at: 3) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 11).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 4) at: 3) to: (result at: 12).
	self addAll: ((nodes at: 4) at: 4) to: (result at: 13).
	self addAll: ((nodes at: 4) at: 5) to: (result at: 14).
	self addAll: ((nodes at: 4) at: 6) to: (result at: 15).
	self addAll: ((nodes at: 4) at: 7) to: (result at: 16).
	self addAll: ((nodes at: 4) at: 8) to: (result at: 17).
	self addAll: ((nodes at: 4) at: 9) to: (result at: 18).
	self addAll: ((nodes at: 4) at: 10) to: (result at: 7).
	self addAll: ((nodes at: 4) at: 11) to: (result at: 19).
	self addAll: ((nodes at: 4) at: 12) to: (result at: 20).
	self addAll: ((nodes at: 4) at: 13) to: (result at: 21).
	self addAll: ((nodes at: 4) at: 14) to: (result at: 6).
	self addAll: ((nodes at: 4) at: 15) to: (result at: 22).
	self addAll: ((nodes at: 4) at: 16) to: (result at: 23).
	self addAll: ((nodes at: 4) at: 17) to: (result at: 24).
	self addAll: ((nodes at: 4) at: 18) to: (result at: 25).
	self addAll: ((nodes at: 4) at: 19) to: (result at: 26).
	self addAll: ((nodes at: 4) at: 20) to: (result at: 27).
	self addAll: ((nodes at: 4) at: 21) to: (result at: 28).
	self addAll: ((nodes at: 4) at: 22) to: (result at: 29).
	self addAll: ((nodes at: 4) at: 23) to: (result at: 30).
	self addAll: ((nodes at: 4) at: 24) to: (result at: 31).
	self addAll: ((nodes at: 4) at: 25) to: (result at: 5).
	self addAll: ((nodes at: 4) at: 26) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 27) to: (result at: 32).
	self addAll: ((nodes at: 4) at: 28) to: (result at: 33).
	self addAll: ((nodes at: 4) at: 29) to: (result at: 34).
	self addAll: ((nodes at: 4) at: 30) to: (result at: 35).
	self addAll: ((nodes at: 4) at: 31) to: (result at: 36).
	self addAll: ((nodes at: 4) at: 32) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 33) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 34) to: (result at: 37).
	self addAll: ((nodes at: 4) at: 35) to: (result at: 47).
	self addAll: ((nodes at: 4) at: 36) to: (result at: 38).
	self addAll: ((nodes at: 4) at: 37) to: (result at: 39).
	self addAll: ((nodes at: 4) at: 38) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 39) to: (result at: 40).
	self addAll: ((nodes at: 4) at: 40) to: (result at: 41).
	self addAll: ((nodes at: 4) at: 41) to: (result at: 42).
	self addAll: ((nodes at: 4) at: 42) to: (result at: 43).
	self addAll: ((nodes at: 4) at: 43) to: (result at: 44).
	self addAll: ((nodes at: 4) at: 44) to: (result at: 45).
	self addAll: ((nodes at: 4) at: 45) to: (result at: 46).
	self addAll: ((nodes at: 4) at: 46) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 47) to: (result at: 9).
	self addAll: ((nodes at: 4) at: 48) to: (result at: 48).
	self addAll: ((nodes at: 4) at: 49) to: (result at: 49).
	self addAll: ((nodes at: 4) at: 50) to: (result at: 50).
	self addAll: ((nodes at: 4) at: 51) to: (result at: 51).
	self addAll: ((nodes at: 4) at: 52) to: (result at: 52).
	self addAll: ((nodes at: 4) at: 53) to: (result at: 53).
	self addAll: ((nodes at: 4) at: 54) to: (result at: 54).
	self addAll: ((nodes at: 4) at: 55) to: (result at: 55).
	self addAll: ((nodes at: 4) at: 56) to: (result at: 56).
	self addAll: ((nodes at: 4) at: 57) to: (result at: 57).
	self add: (nodes at: 5) to: (result at: 42).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum_case1: nodes [
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
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum_case_clause1: nodes [
	| result |
	result := Array new: 25.
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
	result at: 25 put: (OrderedCollection new: 2).
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
	result at: 13 put: (nodes at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 25).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum_case_list2: nodes [
	| result |
	result := nodes at: 3.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAllFirst: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAllFirst: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAllFirst: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAllFirst: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAllFirst: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAllFirst: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAllFirst: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAllFirst: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAllFirst: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAllFirst: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAllFirst: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAllFirst: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAllFirst: ((nodes at: 1) at: 24) to: (result at: 24).
	self addFirst: (nodes at: 2) to: (result at: 17).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum_member2: nodes [
	| result |
	result := Array new: 57.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
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
	self add: ((nodes at: 1) at: 13) to: (result at: 57).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 33).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 32).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 41).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 34).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 35).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 36).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 37).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 38).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 39).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 40).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum_members2: nodes [
	| result |
	result := nodes at: 2.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAllFirst: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAllFirst: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAllFirst: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAllFirst: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAllFirst: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAllFirst: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAllFirst: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAllFirst: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAllFirst: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAllFirst: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAllFirst: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAllFirst: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAllFirst: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAllFirst: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAllFirst: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAllFirst: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAllFirst: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAllFirst: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAllFirst: ((nodes at: 1) at: 30) to: (result at: 30).
	self addAllFirst: ((nodes at: 1) at: 31) to: (result at: 31).
	self addAllFirst: ((nodes at: 1) at: 32) to: (result at: 32).
	self addAllFirst: ((nodes at: 1) at: 33) to: (result at: 33).
	self addAllFirst: ((nodes at: 1) at: 34) to: (result at: 34).
	self addAllFirst: ((nodes at: 1) at: 35) to: (result at: 35).
	self addAllFirst: ((nodes at: 1) at: 36) to: (result at: 36).
	self addAllFirst: ((nodes at: 1) at: 37) to: (result at: 37).
	self addAllFirst: ((nodes at: 1) at: 38) to: (result at: 38).
	self addAllFirst: ((nodes at: 1) at: 39) to: (result at: 39).
	self addAllFirst: ((nodes at: 1) at: 40) to: (result at: 40).
	self addAllFirst: ((nodes at: 1) at: 41) to: (result at: 41).
	self addAllFirst: ((nodes at: 1) at: 42) to: (result at: 42).
	self addAllFirst: ((nodes at: 1) at: 43) to: (result at: 43).
	self addAllFirst: ((nodes at: 1) at: 44) to: (result at: 44).
	self addAllFirst: ((nodes at: 1) at: 45) to: (result at: 45).
	self addAllFirst: ((nodes at: 1) at: 46) to: (result at: 46).
	self addAllFirst: ((nodes at: 1) at: 47) to: (result at: 47).
	self addAllFirst: ((nodes at: 1) at: 48) to: (result at: 48).
	self addAllFirst: ((nodes at: 1) at: 49) to: (result at: 49).
	self addAllFirst: ((nodes at: 1) at: 50) to: (result at: 50).
	self addAllFirst: ((nodes at: 1) at: 51) to: (result at: 51).
	self addAllFirst: ((nodes at: 1) at: 52) to: (result at: 52).
	self addAllFirst: ((nodes at: 1) at: 53) to: (result at: 53).
	self addAllFirst: ((nodes at: 1) at: 54) to: (result at: 54).
	self addAllFirst: ((nodes at: 1) at: 55) to: (result at: 55).
	self addAllFirst: ((nodes at: 1) at: 56) to: (result at: 56).
	self addAllFirst: ((nodes at: 1) at: 57) to: (result at: 57).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvalue_binding_pattern1: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvalue_binding_pattern2: nodes [
	| result |
	result := Array new: 29.
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
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration1: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addNodes: ((nodes at: 2) at: 1) to: result inializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration2: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 14)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 3) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result addNode: (nodes at: 4) to: result blocks.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration3: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 14)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 3) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 4) at: 12) to: result operatorTokens.
	result getToken: ((nodes at: 4) at: 13).
	result addNodes: ((nodes at: 4) at: 14) to: result blocks.
	result setToken: ((nodes at: 4) at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration4: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 14)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 3) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 4) at: 12) to: result operatorTokens.
	result getToken: ((nodes at: 4) at: 13).
	result setToken: ((nodes at: 4) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration5: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 14)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result periodTokens.
	result
		addTokens: ((nodes at: 3) at: 16)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result typeTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result equalToken: ((nodes at: 4) at: 1).
	result expression: ((nodes at: 4) at: 2).
	result addTokens: ((nodes at: 5) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 5) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 5) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 5) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 5) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 5) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 5) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 5) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 5) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 5) at: 10)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 5) at: 11)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 5) at: 12) to: result operatorTokens.
	result willSetToken: ((nodes at: 5) at: 13).
	result addNodes: ((nodes at: 5) at: 14) to: result blocks.
	result didSetToken: ((nodes at: 5) at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForwhile_statement1: nodes [
	| result |
	result := SwiftWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForwildcard_expression1: nodes [
	| result |
	result := SwiftWildcardExpressionNode new.
	result _Token: (nodes at: 1).
	^ result
]

{ #category : #generated }
SwiftParser >> reduceTable [
^#(
	#(315 0 #reduceActionFor_attributes1:) 
	#(354 0 #reduceActionFor_statements1:) 
	#(328 0 #reduceActionFor_expression_element_list1:) 
	#(312 0 #reduceActionFor_array_literal_items1:) 
	#(281 1 #reduceActionForwildcard_expression1:) 
	#(261 1 #reduceActionForliteral_expression6:) 
	#(261 1 #reduceActionForliteral_expression4:) 
	#(261 1 #reduceActionForliteral_expression7:) 
	#(261 1 #reduceActionForliteral_expression5:) 
	#(339 0 #nil) 
	#(126 1 #reduceActionForfallthrough_statement1:) 
	#(362 0 #nil) 
	#(332 0 #reduceActionFor_array_literal_items1:) 
	#(327 0 #nil) 
	#(268 1 #reduceActionForself_expression1:) 
	#(318 0 #reduceActionFor_closure_signature1:) 
	#(329 0 #reduceActionFor_generic_argument_clause1:) 
	#(122 1 #liftFirstValue:) 
	#(95 1 #reduceActionForliteral1:) 
	#(95 1 #reduceActionForliteral2:) 
	#(94 1 #liftFirstValue:) 
	#(97 1 #liftFirstValue:) 
	#(95 1 #reduceActionForliteral3:) 
	#(261 1 #reduceActionForliteral_expression1:) 
	#(100 1 #reduceActionForstatements1:) 
	#(354 1 #reduceActionFor_statements2:) 
	#(350 0 #nil) 
	#(101 1 #liftFirstValue:) 
	#(108 1 #liftFirstValue:) 
	#(123 1 #liftFirstValue:) 
	#(92 1 #reduceActionForfile1:) 
	#(139 1 #liftFirstValue:) 
	#(330 0 #reduceActionFor_generic_parameter_clause1:) 
	#(224 1 #liftFirstValue:) 
	#(248 1 #reduceActionForattributes1:) 
	#(315 1 #reduceActionFor_statements2:) 
	#(251 1 #liftFirstValue:) 
	#(253 1 #liftFirstValue:) 
	#(282 1 #reduceActionForpostfix_expression1:) 
	#(260 1 #liftFirstValue:) 
	#(261 1 #reduceActionForliteral_expression2:) 
	#(261 1 #reduceActionForliteral_expression3:) 
	#(269 1 #liftFirstValue:) 
	#(342 0 #nil) 
	#(141 0 #reduceActionFordeclaration_specifiers1:) 
	#(321 0 #reduceActionFordeclaration_specifiers1:) 
	#(320 0 #nil) 
	#(143 1 #reduceActionFor_statements2:) 
	#(254 2 #reduceActionForin_out_expression1:) 
	#(280 1 #liftFirstValue:) 
	#(328 1 #reduceActionFor_statements2:) 
	#(279 1 #reduceActionFor_expression_element_list1:) 
	#(277 2 #reduceActionForimplicit_member_expression1:) 
	#(246 1 #liftFirstValue:) 
	#(314 0 #reduceActionFor_attribute_argument_clause1:) 
	#(264 1 #liftFirstValue:) 
	#(312 1 #reduceActionFor_statements2:) 
	#(319 0 #nil) 
	#(339 1 #liftFirstValue:) 
	#(124 2 #reduceActionForbreak_statement1:) 
	#(125 2 #reduceActionForcontinue_statement1:) 
	#(295 1 #liftFirstValue:) 
	#(363 0 #reduceActionFor_type_inheritance_clause1:) 
	#(357 0 #reduceActionFor_tuple_pattern_element_list1:) 
	#(234 1 #liftFirstValue:) 
	#(235 1 #liftFirstValue:) 
	#(332 1 #reduceActionFor_statements2:) 
	#(103 1 #reduceActionForfor_init1:) 
	#(361 0 #reduceActionFor_type_annotation1:) 
	#(233 1 #reduceActionForpattern3:) 
	#(233 1 #reduceActionForpattern5:) 
	#(233 1 #reduceActionForpattern6:) 
	#(241 1 #reduceActionFortype_casting_pattern1:) 
	#(241 1 #reduceActionFortype_casting_pattern2:) 
	#(233 1 #reduceActionForpattern7:) 
	#(252 1 #reduceActionForfor_init1:) 
	#(244 1 #liftFirstValue:) 
	#(103 1 #reduceActionFor_statements2:) 
	#(362 1 #liftFirstValue:) 
	#(110 1 #liftFirstValue:) 
	#(327 1 #liftFirstValue:) 
	#(127 2 #reduceActionForreturn_statement1:) 
	#(168 1 #liftFirstValue:) 
	#(167 2 #reduceActionFortypealias_head1:) 
	#(106 1 #liftFirstValue:) 
	#(338 0 #nil) 
	#(93 1 #reduceActionForfor_init1:) 
	#(333 0 #reduceActionFor_type_annotation1:) 
	#(318 1 #reduceActionFor_statements2:) 
	#(329 1 #reduceActionFor_statements2:) 
	#(260 2 #reduceActionForprimary_expression1:) 
	#(253 2 #reduceActionForprefix_expression2:) 
	#(100 2 #reduceActionForstatements2:) 
	#(350 1 #liftFirstValue:) 
	#(99 2 #reduceActionForstatement3:) 
	#(120 2 #reduceActionForlabeled_statement1:) 
	#(121 2 #reduceActionFortypealias_head1:) 
	#(99 2 #reduceActionForstatement2:) 
	#(155 1 #liftFirstValue:) 
	#(153 2 #reduceActionForvariable_declaration1:) 
	#(150 1 #reduceActionForfor_init1:) 
	#(337 0 #reduceActionFor_initializer1:) 
	#(166 2 #reduceActionFortypealias_declaration1:) 
	#(172 1 #reduceActionForfunction_name1:) 
	#(172 1 #reduceActionForfunction_name2:) 
	#(330 1 #reduceActionFor_statements2:) 
	#(248 2 #reduceActionForattributes2:) 
	#(99 2 #reduceActionForstatement1:) 
	#(257 1 #liftFirstValue:) 
	#(96 1 #liftFirstValue:) 
	#(256 1 #reduceActionForstatements1:) 
	#(251 2 #reduceActionForexpression2:) 
	#(255 1 #reduceActionForbinary_expression4:) 
	#(290 2 #reduceActionForforced_value_expression1:) 
	#(291 2 #reduceActionForoptional_chaining_expression1:) 
	#(98 1 #liftFirstValue:) 
	#(282 2 #reduceActionForpostfix_expression2:) 
	#(283 2 #reduceActionForfunction_call_expression1:) 
	#(342 1 #liftFirstValue:) 
	#(320 1 #liftFirstValue:) 
	#(335 0 #reduceActionFor_import_kind1:) 
	#(190 1 #liftFirstValue:) 
	#(321 1 #reduceActionFor_statements2:) 
	#(183 2 #reduceActionForenum_declaration1:) 
	#(183 2 #reduceActionForenum_declaration2:) 
	#(278 3 #reduceActionForparenthesized_expression1:) 
	#(316 0 #reduceActionFor_attribute_argument_clause1:) 
	#(314 1 #reduceActionFor_statements2:) 
	#(245 3 #reduceActionForattribute1:) 
	#(265 3 #reduceActionFordictionary_literal2:) 
	#(319 1 #liftFirstValue:) 
	#(263 2 #reduceActionForarray_literal_items1:) 
	#(265 3 #reduceActionFordictionary_literal1:) 
	#(266 2 #reduceActionFordictionary_literal_items1:) 
	#(262 3 #reduceActionForarray_literal1:) 
	#(363 1 #reduceActionFor_statements2:) 
	#(294 2 #reduceActionFortype_identifier1:) 
	#(239 1 #reduceActionFor_statements2:) 
	#(357 1 #reduceActionFor_tuple_pattern_element_list2:) 
	#(238 1 #reduceActionFor_statements2:) 
	#(359 0 #reduceActionFor_type_annotation1:) 
	#(242 2 #reduceActionForis_pattern1:) 
	#(292 1 #liftFirstValue:) 
	#(236 2 #reduceActionForvalue_binding_pattern2:) 
	#(236 2 #reduceActionForvalue_binding_pattern1:) 
	#(361 1 #reduceActionFor_statements2:) 
	#(233 2 #reduceActionForpattern1:) 
	#(233 2 #reduceActionForpattern2:) 
	#(233 2 #reduceActionForpattern4:) 
	#(326 0 #reduceActionFor_initializer1:) 
	#(268 3 #reduceActionForself_expression4:) 
	#(268 3 #reduceActionForself_expression2:) 
	#(272 3 #reduceActionForsuperclass_initializer_expression1:) 
	#(270 3 #reduceActionForsuperclass_method_expression1:) 
	#(355 0 #reduceActionFor_switch_cases1:) 
	#(105 3 #reduceActionForwhile_statement1:) 
	#(177 2 #reduceActionForparameter_clause1:) 
	#(338 1 #liftFirstValue:) 
	#(325 0 #nil) 
	#(178 1 #reduceActionForparameter_list1:) 
	#(340 0 #nil) 
	#(276 1 #reduceActionForcapture_specifier2:) 
	#(276 1 #reduceActionForcapture_specifier3:) 
	#(276 1 #reduceActionForcapture_specifier4:) 
	#(276 1 #reduceActionForcapture_specifier1:) 
	#(333 1 #reduceActionFor_statements2:) 
	#(274 2 #reduceActionForclosure_signature5:) 
	#(137 1 #reduceActionForgeneric_argument_list1:) 
	#(138 1 #liftFirstValue:) 
	#(337 1 #reduceActionFor_statements2:) 
	#(151 2 #reduceActionForpattern_initializer1:) 
	#(169 2 #reduceActionForis_pattern1:) 
	#(176 0 #reduceActionForparameter_clauses1:) 
	#(349 0 #reduceActionFor_requirement_clause1:) 
	#(129 1 #reduceActionForgeneric_parameter_list1:) 
	#(130 1 #reduceActionForgeneric_parameter1:) 
	#(221 3 #reduceActionForsubscript_declaration1:) 
	#(221 3 #reduceActionForsubscript_declaration2:) 
	#(221 3 #reduceActionForsubscript_declaration3:) 
	#(259 2 #reduceActionFortype_casting_operator2:) 
	#(259 2 #reduceActionFortype_casting_operator1:) 
	#(255 2 #reduceActionForbinary_expression1:) 
	#(256 2 #reduceActionForstatements2:) 
	#(255 2 #reduceActionForbinary_expression2:) 
	#(255 2 #reduceActionForbinary_expression3:) 
	#(288 3 #reduceActionFordynamic_type_expression1:) 
	#(285 3 #reduceActionForinitializer_expression1:) 
	#(287 3 #reduceActionForpostfix_self_expression1:) 
	#(286 3 #reduceActionForexplicit_member_expression1:) 
	#(284 1 #liftFirstValue:) 
	#(283 3 #reduceActionForfunction_call_expression1:) 
	#(203 1 #liftFirstValue:) 
	#(218 3 #reduceActionFordeinitializer_declaration1:) 
	#(146 1 #reduceActionForimport_kind3:) 
	#(146 1 #reduceActionForimport_kind4:) 
	#(146 1 #reduceActionForimport_kind7:) 
	#(146 1 #reduceActionForimport_kind5:) 
	#(146 1 #reduceActionForimport_kind2:) 
	#(146 1 #reduceActionForimport_kind1:) 
	#(146 1 #reduceActionForimport_kind6:) 
	#(335 1 #reduceActionFor_statements2:) 
	#(206 1 #liftFirstValue:) 
	#(200 1 #liftFirstValue:) 
	#(222 3 #reduceActionForsubscript_head1:) 
	#(142 1 #reduceActionFordeclaration_specifier1:) 
	#(142 1 #reduceActionFordeclaration_specifier2:) 
	#(142 1 #reduceActionFordeclaration_specifier3:) 
	#(142 1 #reduceActionFordeclaration_specifier4:) 
	#(142 1 #reduceActionFordeclaration_specifier5:) 
	#(142 1 #reduceActionFordeclaration_specifier6:) 
	#(142 1 #reduceActionFordeclaration_specifier7:) 
	#(142 1 #reduceActionFordeclaration_specifier8:) 
	#(142 1 #reduceActionFordeclaration_specifier9:) 
	#(141 2 #reduceActionFordeclaration_specifiers2:) 
	#(216 3 #reduceActionForinitializer_head1:) 
	#(171 3 #reduceActionForfunction_head1:) 
	#(154 3 #reduceActionForfunction_head1:) 
	#(280 3 #reduceActionForexpression_element2:) 
	#(279 3 #reduceActionForexpression_element_list2:) 
	#(250 1 #reduceActionForbalanced_token4:) 
	#(250 1 #reduceActionForbalanced_token6:) 
	#(250 1 #reduceActionForbalanced_token5:) 
	#(316 1 #reduceActionFor_statements2:) 
	#(249 1 #reduceActionFor_statements2:) 
	#(267 3 #reduceActionFordictionary_literal_item1:) 
	#(263 3 #reduceActionForarray_literal_items2:) 
	#(266 3 #reduceActionFordictionary_literal_items2:) 
	#(144 3 #reduceActionForcode_block1:) 
	#(107 4 #reduceActionFordo_while_statement1:) 
	#(311 1 #reduceActionFortype_inheritance_list1:) 
	#(310 2 #reduceActionFortype_inheritance_clause1:) 
	#(140 0 #reduceActionFor_statements1:) 
	#(322 0 #reduceActionFor_statements1:) 
	#(219 4 #reduceActionForextension_declaration1:) 
	#(237 3 #reduceActionFortuple_pattern1:) 
	#(359 1 #reduceActionFor_statements2:) 
	#(298 1 #reduceActionFor_statements2:) 
	#(345 0 #reduceActionFortype_inheritance_list1:) 
	#(305 2 #reduceActionForimplicitly_unwrapped_optional_type1:) 
	#(304 2 #reduceActionForoptional_type1:) 
	#(243 3 #reduceActionForas_pattern1:) 
	#(252 3 #reduceActionForexpression_list2:) 
	#(191 1 #liftFirstValue:) 
	#(356 0 #reduceActionFor_tuple_pattern_element_list1:) 
	#(326 1 #reduceActionFor_statements2:) 
	#(109 4 #reduceActionForif_statement1:) 
	#(343 0 #reduceActionFor_initializer1:) 
	#(336 0 #reduceActionFor_infix_operator_attributes1:) 
	#(268 4 #reduceActionForself_expression3:) 
	#(271 4 #reduceActionForsuperclass_subscript_expression1:) 
	#(355 1 #reduceActionFor_switch_cases2:) 
	#(113 1 #reduceActionForswitch_cases1:) 
	#(325 1 #liftFirstValue:) 
	#(179 2 #reduceActionForparameter3:) 
	#(340 1 #liftFirstValue:) 
	#(334 0 #nil) 
	#(93 3 #reduceActionForexpression_list2:) 
	#(274 3 #reduceActionForclosure_signature2:) 
	#(274 3 #reduceActionForclosure_signature1:) 
	#(273 4 #reduceActionForclosure_expression1:) 
	#(136 3 #reduceActionForgeneric_argument_clause1:) 
	#(150 3 #reduceActionForexpression_list2:) 
	#(153 4 #reduceActionForvariable_declaration2:) 
	#(153 4 #reduceActionForvariable_declaration3:) 
	#(153 4 #reduceActionForvariable_declaration4:) 
	#(152 2 #reduceActionFortypealias_head1:) 
	#(349 1 #reduceActionFor_statements2:) 
	#(217 1 #liftFirstValue:) 
	#(215 4 #reduceActionForinitializer_declaration1:) 
	#(223 3 #reduceActionForsubscript_result1:) 
	#(351 0 #reduceActionFor_setter_clause1:) 
	#(352 0 #reduceActionFor_setter_keyword_clause1:) 
	#(258 3 #reduceActionFordictionary_literal_item1:) 
	#(259 3 #reduceActionFortype_casting_operator3:) 
	#(286 4 #reduceActionForexplicit_member_expression2:) 
	#(289 4 #reduceActionForsubscript_expression1:) 
	#(148 1 #reduceActionForfunction_name1:) 
	#(148 1 #reduceActionForfunction_name2:) 
	#(145 4 #reduceActionForimport_declaration1:) 
	#(147 1 #reduceActionForimport_path1:) 
	#(364 0 #reduceActionFor_union_style_enum_members1:) 
	#(149 4 #reduceActionForconstant_declaration1:) 
	#(249 2 #reduceActionForbalanced_tokens2:) 
	#(247 3 #reduceActionForattribute_argument_clause1:) 
	#(322 1 #reduceActionFor_statements2:) 
	#(294 4 #reduceActionFortype_identifier2:) 
	#(238 3 #reduceActionFortuple_pattern_element_list2:) 
	#(297 2 #reduceActionFortuple_type_body1:) 
	#(300 1 #liftFirstValue:) 
	#(296 3 #reduceActionFortuple_type1:) 
	#(302 3 #reduceActionForarray_type1:) 
	#(308 1 #liftFirstValue:) 
	#(345 1 #reduceActionFor_protocol_identifier_list2:) 
	#(307 1 #reduceActionFortype_inheritance_list1:) 
	#(301 3 #reduceActionForfunction_type1:) 
	#(309 3 #reduceActionFormetatype_type2:) 
	#(309 3 #reduceActionFormetatype_type1:) 
	#(104 5 #reduceActionForfor_in_statement1:) 
	#(293 3 #reduceActionForsubscript_result1:) 
	#(356 1 #reduceActionFor_statements2:) 
	#(240 4 #reduceActionForenum_case_pattern1:) 
	#(111 2 #reduceActionFortypealias_head1:) 
	#(336 1 #reduceActionFor_statements2:) 
	#(343 1 #reduceActionFor_statements2:) 
	#(313 0 #reduceActionFor_associativity_clause1:) 
	#(226 5 #reduceActionForpostfix_operator_declaration1:) 
	#(225 5 #reduceActionForprefix_operator_declaration1:) 
	#(331 0 #reduceActionFor_initializer1:) 
	#(117 2 #reduceActionFortypealias_head1:) 
	#(113 2 #reduceActionForswitch_cases2:) 
	#(114 2 #reduceActionForswitch_case2:) 
	#(114 2 #reduceActionForswitch_case1:) 
	#(114 2 #reduceActionForswitch_case4:) 
	#(114 2 #reduceActionForswitch_case3:) 
	#(112 5 #reduceActionForswitch_statement1:) 
	#(178 3 #reduceActionForparameter_list2:) 
	#(177 4 #reduceActionForparameter_clause2:) 
	#(334 1 #liftFirstValue:) 
	#(275 4 #reduceActionForcapture_list1:) 
	#(174 3 #reduceActionForsubscript_result1:) 
	#(274 4 #reduceActionForclosure_signature4:) 
	#(274 4 #reduceActionForclosure_signature3:) 
	#(137 3 #reduceActionForgeneric_argument_list2:) 
	#(153 5 #reduceActionForvariable_declaration5:) 
	#(175 1 #liftFirstValue:) 
	#(170 5 #reduceActionForfunction_declaration1:) 
	#(176 2 #reduceActionForparameter_clauses2:) 
	#(173 2 #reduceActionForfunction_signature1:) 
	#(129 3 #reduceActionForgeneric_parameter_list2:) 
	#(131 2 #reduceActionForrequirement_clause1:) 
	#(132 1 #reduceActionForrequirement_list1:) 
	#(133 1 #reduceActionForrequirement1:) 
	#(133 1 #reduceActionForrequirement2:) 
	#(128 4 #reduceActionForgeneric_parameter_clause1:) 
	#(130 3 #reduceActionForgeneric_parameter2:) 
	#(351 1 #reduceActionFor_statements2:) 
	#(352 1 #reduceActionFor_statements2:) 
	#(161 2 #reduceActionForgetter_keyword_clause1:) 
	#(162 2 #reduceActionForgetter_keyword_clause1:) 
	#(353 0 #reduceActionFor_setter_name1:) 
	#(346 0 #reduceActionFor_statements1:) 
	#(205 5 #reduceActionForprotocol_declaration1:) 
	#(186 1 #reduceActionFor_union_style_enum_members1:) 
	#(364 1 #reduceActionFor_union_style_enum_members2:) 
	#(185 1 #reduceActionFor_statements2:) 
	#(186 1 #reduceActionForunion_style_enum_member2:) 
	#(250 3 #reduceActionForattribute_argument_clause1:) 
	#(250 3 #reduceActionForbalanced_token2:) 
	#(250 3 #reduceActionForbalanced_token3:) 
	#(311 3 #reduceActionFortype_inheritance_list2:) 
	#(140 2 #reduceActionForstatements2:) 
	#(220 3 #reduceActionForextension_body1:) 
	#(298 3 #reduceActionFortuple_type_element_list2:) 
	#(299 3 #reduceActionFortuple_type_element1:) 
	#(299 3 #reduceActionFortuple_type_element2:) 
	#(306 4 #reduceActionForprotocol_composition_type1:) 
	#(230 1 #liftFirstValue:) 
	#(229 2 #reduceActionFortypealias_head1:) 
	#(227 6 #reduceActionForinfix_operator_declaration1:) 
	#(313 1 #reduceActionFor_statements2:) 
	#(228 2 #reduceActionForinfix_operator_attributes1:) 
	#(115 3 #reduceActionForcase_label1:) 
	#(331 1 #reduceActionFor_statements2:) 
	#(116 2 #reduceActionForcase_item_list1:) 
	#(180 1 #reduceActionForfunction_name2:) 
	#(180 1 #reduceActionForfunction_name1:) 
	#(341 0 #reduceActionFor_initializer1:) 
	#(324 0 #reduceActionFor_setter_clause1:) 
	#(156 4 #reduceActionForgetter_setter_block1:) 
	#(156 4 #reduceActionForgetter_setter_block2:) 
	#(160 4 #reduceActionForgetter_setter_keyword_block1:) 
	#(160 4 #reduceActionForgetter_setter_keyword_block2:) 
	#(157 3 #reduceActionForinitializer_head1:) 
	#(353 1 #reduceActionFor_statements2:) 
	#(202 6 #reduceActionForclass_declaration1:) 
	#(147 3 #reduceActionForimport_path2:) 
	#(209 1 #reduceActionForstatements1:) 
	#(346 1 #reduceActionFor_statements2:) 
	#(208 1 #liftFirstValue:) 
	#(199 6 #reduceActionForstruct_declaration1:) 
	#(348 0 #reduceActionFor_union_style_enum_members1:) 
	#(185 2 #reduceActionForunion_style_enum_members2:) 
	#(184 5 #reduceActionForunion_style_enum1:) 
	#(303 5 #reduceActionFordictionary_type1:) 
	#(307 3 #reduceActionForexpression_element_list2:) 
	#(102 7 #reduceActionForfor_statement1:) 
	#(232 1 #reduceActionForliteral1:) 
	#(232 1 #reduceActionForliteral3:) 
	#(232 1 #reduceActionForliteral2:) 
	#(231 2 #reduceActionForassociativity_clause1:) 
	#(118 2 #reduceActionFortypealias_head1:) 
	#(119 1 #liftFirstValue:) 
	#(181 1 #reduceActionForfunction_name2:) 
	#(181 1 #reduceActionForfunction_name1:) 
	#(341 1 #reduceActionFor_statements2:) 
	#(324 1 #reduceActionFor_statements2:) 
	#(132 3 #reduceActionForrequirement_list2:) 
	#(134 3 #reduceActionForconformance_requirement1:) 
	#(135 3 #reduceActionForsame_type_requirement1:) 
	#(158 4 #reduceActionForsetter_clause1:) 
	#(360 0 #reduceActionFor_typealias_assignment1:) 
	#(209 2 #reduceActionForstatements2:) 
	#(207 3 #reduceActionForextension_body1:) 
	#(194 1 #reduceActionFor_union_style_enum_members1:) 
	#(348 1 #reduceActionFor_union_style_enum_members2:) 
	#(193 1 #reduceActionFor_statements2:) 
	#(194 1 #reduceActionForraw_value_style_enum_member2:) 
	#(187 3 #reduceActionForunion_style_enum_case_clause1:) 
	#(188 1 #reduceActionFor_statements2:) 
	#(358 0 #nil) 
	#(116 4 #reduceActionForcase_item_list2:) 
	#(323 0 #reduceActionFor_initializer1:) 
	#(163 4 #reduceActionForgetter_setter_block1:) 
	#(163 4 #reduceActionForgetter_setter_block2:) 
	#(159 3 #reduceActionFordictionary_literal_item1:) 
	#(204 3 #reduceActionForextension_body1:) 
	#(360 1 #reduceActionFor_statements2:) 
	#(214 3 #reduceActionForprotocol_association_type_declaration1:) 
	#(212 3 #reduceActionForprotocol_initializer_declaration1:) 
	#(213 3 #reduceActionForprotocol_subscript_declaration1:) 
	#(201 3 #reduceActionForextension_body1:) 
	#(193 2 #reduceActionForunion_style_enum_members2:) 
	#(192 7 #reduceActionForraw_value_style_enum1:) 
	#(358 1 #liftFirstValue:) 
	#(189 2 #reduceActionForunion_style_enum_case1:) 
	#(102 9 #reduceActionForfor_statement2:) 
	#(323 1 #reduceActionFor_statements2:) 
	#(179 7 #reduceActionForparameter2:) 
	#(179 7 #reduceActionForparameter1:) 
	#(165 4 #reduceActionForsetter_clause1:) 
	#(164 4 #reduceActionForsetter_clause1:) 
	#(210 4 #reduceActionForprotocol_property_declaration1:) 
	#(211 4 #reduceActionForprotocol_method_declaration1:) 
	#(347 0 #reduceActionFor_associativity_clause1:) 
	#(195 3 #reduceActionForraw_value_style_enum_case_clause1:) 
	#(196 1 #reduceActionForraw_value_style_enum_case_list1:) 
	#(188 3 #reduceActionForunion_style_enum_case_list2:) 
	#(182 2 #reduceActionFortypealias_head1:) 
	#(347 1 #reduceActionFor_statements2:) 
	#(197 2 #reduceActionForraw_value_style_enum_case1:) 
	#(198 2 #reduceActionForassociativity_clause1:) 
	#(196 3 #reduceActionForraw_value_style_enum_case_list2:)
	).
]

{ #category : #generated }
SwiftParser >> symbolNames [
	^ #('"!"' '"#"' '"&"' '"("' '")"' '","' '"->"' '"."' '"..."' '":"' '";"' '"<"' '"="' '"=="' '">"' '"?"' '"@"' '"Protocol"' '"Type"' '"["' '"]"' '"_"' '"__COLUMN__"' '"__FILE__"' '"__FUNCTION__"' '"__LINE__"' '"as"' '"associativity"' '"break"' '"case"' '"class"' '"continue"' '"convenience"' '"default"' '"deinit"' '"didSet"' '"do"' '"dynamicType"' '"else"' '"enum"' '"extension"' '"fallthrough"' '"for"' '"func"' '"get"' '"if"' '"import"' '"in"' '"infix"' '"init"' '"inout"' '"is"' '"left"' '"let"' '"mutating"' '"none"' '"nonmutating"' '"operator"' '"override"' '"postfix"' '"precedence"' '"prefix"' '"protocol"' '"return"' '"right"' '"self"' '"set"' '"static"' '"struct"' '"subscript"' '"super"' '"switch"' '"typealias"' '"unowned"' '"unowned(safe)"' '"unowned(unsafe)"' '"var"' '"weak"' '"where"' '"while"' '"willSet"' '"{"' '"}"' '<whitespace>' '<comment>' '<identifier>' '<integer_literal>' '<floating_point_literal>' '<full_string_literal>' '<operator>' 'B e g i n' 'file' 'identifier_list' 'string_literal' 'literal' 'binary_operator' 'prefix_operator' 'postfix_operator' 'statement' 'statements' 'loop_statement' 'for_statement' 'for_init' 'for_in_statement' 'while_statement' 'while_condition' 'do_while_statement' 'branch_statement' 'if_statement' 'if_condition' 'else_clause' 'switch_statement' 'switch_cases' 'switch_case' 'case_label' 'case_item_list' 'default_label' 'guard_clause' 'guard_expression' 'labeled_statement' 'statement_label' 'label_name' 'control_transfer_statement' 'break_statement' 'continue_statement' 'fallthrough_statement' 'return_statement' 'generic_parameter_clause' 'generic_parameter_list' 'generic_parameter' 'requirement_clause' 'requirement_list' 'requirement' 'conformance_requirement' 'same_type_requirement' 'generic_argument_clause' 'generic_argument_list' 'generic_argument' 'declaration' 'declarations' 'declaration_specifiers' 'declaration_specifier' 'top_level_declaration' 'code_block' 'import_declaration' 'import_kind' 'import_path' 'import_path_identifier' 'constant_declaration' 'pattern_initializer_list' 'pattern_initializer' 'initializer' 'variable_declaration' 'variable_declaration_head' 'variable_name' 'getter_setter_block' 'getter_clause' 'setter_clause' 'setter_name' 'getter_setter_keyword_block' 'getter_keyword_clause' 'setter_keyword_clause' 'willSet_didSet_block' 'willSet_clause' 'didSet_clause' 'typealias_declaration' 'typealias_head' 'typealias_name' 'typealias_assignment' 'function_declaration' 'function_head' 'function_name' 'function_signature' 'function_result' 'function_body' 'parameter_clauses' 'parameter_clause' 'parameter_list' 'parameter' 'parameter_name' 'local_parameter_name' 'default_argument_clause' 'enum_declaration' 'union_style_enum' 'union_style_enum_members' 'union_style_enum_member' 'union_style_enum_case_clause' 'union_style_enum_case_list' 'union_style_enum_case' 'enum_name' 'enum_case_name' 'raw_value_style_enum' 'raw_value_style_enum_members' 'raw_value_style_enum_member' 'raw_value_style_enum_case_clause' 'raw_value_style_enum_case_list' 'raw_value_style_enum_case' 'raw_value_assignment' 'struct_declaration' 'struct_name' 'struct_body' 'class_declaration' 'class_name' 'class_body' 'protocol_declaration' 'protocol_name' 'protocol_body' 'protocol_member_declaration' 'protocol_member_declarations' 'protocol_property_declaration' 'protocol_method_declaration' 'protocol_initializer_declaration' 'protocol_subscript_declaration' 'protocol_association_type_declaration' 'initializer_declaration' 'initializer_head' 'initializer_body' 'deinitializer_declaration' 'extension_declaration' 'extension_body' 'subscript_declaration' 'subscript_head' 'subscript_result' 'operator_declaration' 'prefix_operator_declaration' 'postfix_operator_declaration' 'infix_operator_declaration' 'infix_operator_attributes' 'precedence_clause' 'precedence_level' 'associativity_clause' 'associativity' 'pattern' 'wildcard_pattern' 'identifier_pattern' 'value_binding_pattern' 'tuple_pattern' 'tuple_pattern_element_list' 'tuple_pattern_element' 'enum_case_pattern' 'type_casting_pattern' 'is_pattern' 'as_pattern' 'expression_pattern' 'attribute' 'attribute_name' 'attribute_argument_clause' 'attributes' 'balanced_tokens' 'balanced_token' 'expression' 'expression_list' 'prefix_expression' 'in_out_expression' 'binary_expression' 'binary_expressions' 'assignment_operator' 'conditional_operator' 'type_casting_operator' 'primary_expression' 'literal_expression' 'array_literal' 'array_literal_items' 'array_literal_item' 'dictionary_literal' 'dictionary_literal_items' 'dictionary_literal_item' 'self_expression' 'superclass_expression' 'superclass_method_expression' 'superclass_subscript_expression' 'superclass_initializer_expression' 'closure_expression' 'closure_signature' 'capture_list' 'capture_specifier' 'implicit_member_expression' 'parenthesized_expression' 'expression_element_list' 'expression_element' 'wildcard_expression' 'postfix_expression' 'function_call_expression' 'trailing_closure' 'initializer_expression' 'explicit_member_expression' 'postfix_self_expression' 'dynamic_type_expression' 'subscript_expression' 'forced_value_expression' 'optional_chaining_expression' 'type' 'type_annotation' 'type_identifier' 'type_name' 'tuple_type' 'tuple_type_body' 'tuple_type_element_list' 'tuple_type_element' 'element_name' 'function_type' 'array_type' 'dictionary_type' 'optional_type' 'implicitly_unwrapped_optional_type' 'protocol_composition_type' 'protocol_identifier_list' 'protocol_identifier' 'metatype_type' 'type_inheritance_clause' 'type_inheritance_list' '_array_literal_items' '_associativity_clause' '_attribute_argument_clause' '_attributes' '_balanced_tokens' '_binary_expressions' '_closure_signature' '_comma' '_convenience' '_declaration_specifiers' '_declarations' '_default_argument_clause' '_didSet_clause' '_ellipsis' '_else_clause' '_expression' '_expression_element_list' '_generic_argument_clause' '_generic_parameter_clause' '_guard_clause' '_for_init' '_function_result' '_hash' '_import_kind' '_infix_operator_attributes' '_initializer' '_inout' '_label_name' '_let' '_local_parameter_name' '_parenthesized_expression' '_precedence_clause' '_prefix_operator' '_protocol_identifier_list' '_protocol_member_declarations' '_raw_value_assignment' '_raw_value_style_enum_members' '_requirement_clause' '_semicolon' '_setter_clause' '_setter_keyword_clause' '_setter_name' '_statements' '_switch_cases' '_tuple_pattern' '_tuple_pattern_element_list' '_tuple_type' '_tuple_type_body' '_typealias_assignment' '_type_annotation' '_type_identifier' '_type_inheritance_clause' '_union_style_enum_members' 'E O F' 'error')
]

{ #category : #generated }
SwiftParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SwiftFileNode #SwiftFileNode #OrderedCollection #SmaCCToken #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken #SwiftStatementNode #OrderedCollection #SwiftLoopStatementNode #SwiftForStatementNode #OrderedCollection #SwiftForInStatementNode #SwiftWhileStatementNode #Object #SwiftDoWhileStatementNode #SwiftBranchStatementNode #SwiftIfStatementNode #Object #OrderedCollection #SwiftSwitchStatementNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Object #SwiftLabeledStatementNode #OrderedCollection #SmaCCToken #SwiftControlTransferStatementNode #SwiftBreakStatementNode #SwiftContinueStatementNode #SwiftFallThroughStatementNode #SwiftReturnStatementNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftParseNode #SwiftParseNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftBlockNode #SwiftImportDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #SwiftConstantDeclarationNode #OrderedCollection #SwiftPatternInitializerNode #OrderedCollection #SwiftVariableDeclarationNode #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftTypealiasDeclarationNode #OrderedCollection #SmaCCToken #OrderedCollection #SwiftFunctionDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftBlockNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftEnumDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftStructDeclarationNode #SmaCCToken #OrderedCollection #SwiftClassDeclarationNode #SmaCCToken #OrderedCollection #SwiftProtocolDeclarationNode #SmaCCToken #OrderedCollection #SwiftParseNode #OrderedCollection #SwiftProtocolPropertyDeclarationNode #SwiftProtocolMethodDeclarationNode #SwiftProtocolInitializerDeclarationNode #SwiftProtocolSubscriptDeclarationNode #SwiftProtocolAssociationTypeDeclarationNode #SwiftInitializerDeclarationNode #OrderedCollection #SwiftBlockNode #SwiftDeinitializerDeclarationNode #SwiftExtensionDeclarationNode #OrderedCollection #SwiftSubscriptDeclarationNode #OrderedCollection #OrderedCollection #SwiftParseNode #SwiftPrefixOperatorDeclarationNode #SwiftPostfixOperatorDeclarationNode #SwiftInfixOperatorDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Object #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Object #OrderedCollection #Object #SwiftInOutExpressionNode #SwiftParseNode #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #SwiftParseNode #SwiftLiteralExpressionNode #OrderedCollection #OrderedCollection #Object #OrderedCollection #OrderedCollection #OrderedCollection #SwiftSelfExpressionNode #SwiftParseNode #SwiftSuperclassMethodExpressionNode #SwiftSuperclassSubscriptExpressionNode #SwiftSuperclassInitializerExpressionNode #SwiftClosureExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #SwiftImplicitMemberExpressionNode #SwiftParenthesizedExpressionNode #OrderedCollection #Object #SwiftWildcardExpressionNode #OrderedCollection #SwiftFunctionCallExpressionNode #SwiftClosureExpressionNode #SwiftInitializerExpressionNode #SwiftExplicitMemberExpressionNode #SwiftPostfixSelfExpressionNode #SwiftDynamicTypeExpressionNode #SwiftSubscriptExpressionNode #SwiftForcedValueExpressionNode #SwiftOptionalChainingExpressionNode #SwiftParseNode #OrderedCollection #SwiftTypeIdentifierNode #SmaCCToken #SwiftTupleTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SwiftFunctionTypeNode #SwiftArrayTypeNode #SwiftDictionaryTypeNode #SwiftOptionalTypeNode #SwiftImplicitlyUnwrappedOptionalTypeNode #SwiftProtocolCompositionTypeNode #OrderedCollection #SwiftTypeIdentifierNode #SwiftMetatypeTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #Object #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken #OrderedCollection #SwiftParenthesizedExpressionNode #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftTupleTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #SwiftTypeIdentifierNode #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken)
]

{ #category : #generated }
SwiftParser >> transitionTable [
^#(
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 0 6 0 31 0 53 0 32 0 6 0 33 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 129 0 92 0 133 0 94 0 137 0 95 0 141 0 97 0 145 0 99 0 149 0 100 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 221 0 143 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59 1 169 1 98 0 10 1 109] 
#[0 1 173 0 86] 
#[1 0 9 0 3 0 13 0 4 0 14 0 5 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 177 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 1 189 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 185 1 23 1 189 1 24 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 193 1 72] 
#[0 1 197 0 86] 
#[0 1 205 0 86 0 246] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 1 209 0 10 0 25 0 20 0 18 0 21 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 1 217 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 221 1 7 1 225 1 8 1 89 1 9 1 229 1 10 1 233 1 11 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 237 1 56] 
#[0 0 22 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 26 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 30 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 34 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 38 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 42 0 3 0 42 0 4 0 42 0 8 0 42 0 11 0 42 0 17 0 42 0 20 0 42 0 22 0 42 0 23 0 42 0 24 0 42 0 25 0 42 0 26 0 42 0 29 0 42 0 30 0 42 0 31 0 42 0 32 0 42 0 33 0 42 0 34 0 42 0 35 0 42 0 37 0 42 0 41 0 42 0 42 0 42 0 43 0 42 0 44 0 42 0 46 0 42 0 47 0 42 0 50 0 42 0 54 0 42 0 55 0 42 0 57 0 42 0 58 0 42 0 59 0 42 0 63 0 42 0 64 0 42 0 66 0 42 0 68 0 42 0 69 0 42 0 70 0 42 0 71 0 42 0 72 0 42 0 73 0 42 0 74 0 42 0 75 0 42 0 76 0 42 0 77 0 42 0 78 0 42 0 80 0 42 0 82 0 42 0 83 0 11 0 86 0 42 0 87 0 42 0 88 0 42 0 89 0 42 0 90 1 249 0 122 1 249 1 83 0 42 1 109] 
#[1 0 42 0 3 0 42 0 4 0 42 0 8 0 42 0 11 0 42 0 17 0 42 0 20 0 42 0 22 0 42 0 23 0 42 0 24 0 42 0 25 0 42 0 26 0 42 0 29 0 42 0 30 0 42 0 31 0 42 0 32 0 42 0 33 0 42 0 34 0 42 0 35 0 42 0 37 0 42 0 41 0 42 0 42 0 42 0 43 0 42 0 44 0 42 0 46 0 42 0 47 0 42 0 50 0 42 0 54 0 42 0 55 0 42 0 57 0 42 0 58 0 42 0 59 0 42 0 63 0 42 0 64 0 42 0 66 0 42 0 68 0 42 0 69 0 42 0 70 0 42 0 71 0 42 0 72 0 42 0 73 0 42 0 74 0 42 0 75 0 42 0 76 0 42 0 77 0 42 0 78 0 42 0 80 0 42 0 82 0 42 0 83 0 11 0 86 0 42 0 87 0 42 0 88 0 42 0 89 0 42 0 90 1 253 0 122 1 253 1 83 0 42 1 109] 
#[1 2 1 0 82 2 5 0 144] 
#[1 2 17 0 86 2 13 1 38 2 17 1 39] 
#[0 0 46 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 2 21 0 4 0 15 0 8 0 54 0 11 0 21 0 17 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 6 0 31 2 29 0 52 2 33 0 54 0 6 0 55 0 6 0 57 0 6 0 59 0 85 0 66 0 6 0 68 0 89 0 71 0 6 0 74 0 6 0 75 0 6 0 76 0 19 0 77 0 6 0 78 0 105 0 82 2 41 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 45 0 103 2 49 0 153 0 237 0 154 2 53 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 1 57 0 245 1 61 0 248 2 93 0 251 2 97 0 252 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 105 1 59 2 109 1 76 2 113 1 106] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 6 0 31 0 6 0 33 0 6 0 35 0 61 0 41 0 6 0 44 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 105 0 82 0 23 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 117 0 110 2 117 0 139 2 117 0 145 2 117 0 149 2 117 0 153 0 237 0 154 2 117 0 166 0 245 0 167 2 117 0 170 0 253 0 171 2 117 0 183 2 117 0 199 2 117 0 202 2 117 0 205 2 117 0 215 1 21 0 216 2 117 0 218 2 117 0 219 2 117 0 221 1 37 0 222 2 117 0 224 2 117 0 225 2 117 0 226 2 117 0 227 1 57 0 245 1 61 0 248 2 117 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59] 
#[1 2 129 0 49 2 133 0 60 2 137 0 62] 
#[1 0 27 0 3 0 31 0 4 0 35 0 8 0 58 0 11 0 58 0 17 0 39 0 20 0 43 0 22 0 47 0 23 0 51 0 24 0 55 0 25 0 59 0 26 0 58 0 29 0 58 0 30 0 58 0 31 0 58 0 32 0 58 0 33 0 58 0 34 0 58 0 35 0 58 0 37 0 58 0 41 0 58 0 42 0 58 0 43 0 58 0 44 0 58 0 46 0 58 0 47 0 58 0 50 0 58 0 54 0 58 0 55 0 58 0 57 0 58 0 58 0 58 0 59 0 58 0 63 0 58 0 64 0 63 0 66 0 58 0 68 0 58 0 69 0 58 0 70 0 67 0 71 0 58 0 72 0 58 0 73 0 58 0 74 0 58 0 75 0 58 0 76 0 58 0 77 0 58 0 78 0 58 0 80 0 71 0 82 0 58 0 83 0 75 0 86 0 79 0 87 0 83 0 88 0 87 0 89 0 91 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 145 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 145 1 71 0 58 1 109] 
#[1 0 62 0 1 0 62 0 3 0 62 0 4 0 62 0 5 0 62 0 6 0 95 0 8 0 62 0 9 0 62 0 10 0 62 0 11 0 62 0 13 0 62 0 16 0 62 0 17 0 99 0 20 0 62 0 21 0 62 0 22 0 62 0 23 0 62 0 24 0 62 0 25 0 62 0 26 0 62 0 27 0 62 0 29 0 62 0 30 0 62 0 31 0 62 0 32 0 62 0 33 0 62 0 34 0 62 0 35 0 62 0 37 0 62 0 41 0 62 0 42 0 62 0 43 0 62 0 44 0 62 0 46 0 62 0 47 0 62 0 48 0 62 0 50 0 62 0 52 0 62 0 54 0 62 0 55 0 62 0 57 0 62 0 58 0 62 0 59 0 62 0 63 0 62 0 64 0 62 0 66 0 62 0 68 0 62 0 69 0 62 0 70 0 62 0 71 0 62 0 72 0 62 0 73 0 62 0 74 0 62 0 75 0 62 0 76 0 62 0 77 0 62 0 78 0 62 0 79 0 62 0 80 0 62 0 82 0 62 0 83 0 62 0 86 0 62 0 87 0 62 0 88 0 62 0 89 0 62 0 90 0 62 1 109] 
#[1 2 157 0 8 2 161 0 20] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 165 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 2 173 0 86 0 168] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 6 0 31 0 6 0 33 0 6 0 35 0 61 0 41 0 6 0 44 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 105 0 82 0 23 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 177 0 106 2 177 0 139 2 177 0 145 2 177 0 149 2 177 0 153 0 237 0 154 2 177 0 166 0 245 0 167 2 177 0 170 0 253 0 171 2 177 0 183 2 177 0 199 2 177 0 202 2 177 0 205 2 177 0 215 1 21 0 216 2 177 0 218 2 177 0 219 2 177 0 221 1 37 0 222 2 177 0 224 2 177 0 225 2 177 0 226 2 177 0 227 1 57 0 245 1 61 0 248 2 177 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59] 
#[1 0 66 0 3 0 103 0 4 0 66 0 8 0 66 0 17 0 107 0 20 0 66 0 22 0 66 0 23 0 66 0 24 0 66 0 25 0 66 0 26 0 66 0 29 0 66 0 31 0 66 0 32 0 66 0 33 0 66 0 35 0 66 0 37 0 66 0 41 0 66 0 42 0 66 0 43 0 66 0 44 0 66 0 46 0 66 0 47 0 66 0 50 0 66 0 54 0 66 0 55 0 66 0 57 0 66 0 58 0 66 0 59 0 66 0 63 0 66 0 64 0 66 0 66 0 66 0 68 0 66 0 69 0 66 0 70 0 66 0 71 0 66 0 72 0 66 0 73 0 66 0 74 0 66 0 75 0 66 0 76 0 66 0 77 0 66 0 78 0 66 0 80 0 66 0 82 0 111 0 86 0 66 0 87 0 66 0 88 0 66 0 89 0 66 0 90 2 201 0 93 2 205 0 177 2 209 1 18 2 213 1 19 2 217 1 62] 
#[1 0 70 0 1 0 70 0 3 0 70 0 4 0 70 0 8 0 74 0 10 0 70 0 11 2 221 0 12 0 70 0 13 0 70 0 16 0 70 0 17 0 70 0 20 0 70 0 22 0 70 0 23 0 70 0 24 0 70 0 25 0 70 0 26 0 70 0 27 0 70 0 29 0 70 0 30 0 70 0 31 0 70 0 32 0 70 0 33 0 70 0 34 0 70 0 35 0 70 0 37 0 70 0 41 0 70 0 42 0 70 0 43 0 70 0 44 0 70 0 46 0 70 0 47 0 70 0 50 0 70 0 52 0 70 0 54 0 70 0 55 0 70 0 57 0 70 0 58 0 70 0 59 0 70 0 63 0 70 0 64 0 70 0 66 0 70 0 68 0 70 0 69 0 70 0 70 0 70 0 71 0 70 0 72 0 70 0 73 0 70 0 74 0 70 0 75 0 70 0 76 0 70 0 77 0 70 0 78 0 70 0 80 0 70 0 82 0 70 0 83 0 70 0 86 0 70 0 87 0 70 0 88 0 70 0 89 0 70 0 90 2 225 0 136 2 229 1 73 0 70 1 109] 
#[0 0 78 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 82 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 86 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 90 0 4 0 8 0 20 0 22 0 23 0 24 0 25 0 26 0 66 0 71 0 82 0 86 0 87 0 88 0 89] 
#[0 0 0 1 109] 
#[0 0 94 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 98 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 133 0 94 0 137 0 95 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 2 233 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 0 102 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 0 6 0 31 0 53 0 32 0 6 0 33 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 0 106 0 83 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 237 0 99 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59 0 106 1 109] 
#[1 0 110 0 3 0 110 0 4 0 110 0 8 2 245 0 11 0 110 0 17 0 110 0 20 0 110 0 22 0 110 0 23 0 110 0 24 0 110 0 25 0 110 0 26 0 110 0 29 0 110 0 30 0 110 0 31 0 110 0 32 0 110 0 33 0 110 0 34 0 110 0 35 0 110 0 37 0 110 0 41 0 110 0 42 0 110 0 43 0 110 0 44 0 110 0 46 0 110 0 47 0 110 0 50 0 110 0 54 0 110 0 55 0 110 0 57 0 110 0 58 0 110 0 59 0 110 0 63 0 110 0 64 0 110 0 66 0 110 0 68 0 110 0 69 0 110 0 70 0 110 0 71 0 110 0 72 0 110 0 73 0 110 0 74 0 110 0 75 0 110 0 76 0 110 0 77 0 110 0 78 0 110 0 80 0 110 0 82 0 110 0 83 0 110 0 86 0 110 0 87 0 110 0 88 0 110 0 89 0 110 0 90 2 245 1 94 0 110 1 109] 
#[0 0 114 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 114 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 114 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 114 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 110 0 3 0 110 0 4 0 110 0 8 2 249 0 11 0 110 0 17 0 110 0 20 0 110 0 22 0 110 0 23 0 110 0 24 0 110 0 25 0 110 0 26 0 110 0 29 0 110 0 30 0 110 0 31 0 110 0 32 0 110 0 33 0 110 0 34 0 110 0 35 0 110 0 37 0 110 0 41 0 110 0 42 0 110 0 43 0 110 0 44 0 110 0 46 0 110 0 47 0 110 0 50 0 110 0 54 0 110 0 55 0 110 0 57 0 110 0 58 0 110 0 59 0 110 0 63 0 110 0 64 0 110 0 66 0 110 0 68 0 110 0 69 0 110 0 70 0 110 0 71 0 110 0 72 0 110 0 73 0 110 0 74 0 110 0 75 0 110 0 76 0 110 0 77 0 110 0 78 0 110 0 80 0 110 0 82 0 110 0 83 0 110 0 86 0 110 0 87 0 110 0 88 0 110 0 89 0 110 0 90 2 249 1 94 0 110 1 109] 
#[0 0 118 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 118 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 110 0 3 0 110 0 4 0 110 0 8 2 253 0 11 0 110 0 17 0 110 0 20 0 110 0 22 0 110 0 23 0 110 0 24 0 110 0 25 0 110 0 26 0 110 0 29 0 110 0 30 0 110 0 31 0 110 0 32 0 110 0 33 0 110 0 34 0 110 0 35 0 110 0 37 0 110 0 41 0 110 0 42 0 110 0 43 0 110 0 44 0 110 0 46 0 110 0 47 0 110 0 50 0 110 0 54 0 110 0 55 0 110 0 57 0 110 0 58 0 110 0 59 0 110 0 63 0 110 0 64 0 110 0 66 0 110 0 68 0 110 0 69 0 110 0 70 0 110 0 71 0 110 0 72 0 110 0 73 0 110 0 74 0 110 0 75 0 110 0 76 0 110 0 77 0 110 0 78 0 110 0 80 0 110 0 82 0 110 0 83 0 110 0 86 0 110 0 87 0 110 0 88 0 110 0 89 0 110 0 90 2 253 1 94 0 110 1 109] 
#[1 0 57 0 37 0 69 0 43 0 93 0 72 0 101 0 80 3 1 0 101 3 1 0 102 3 1 0 104 3 1 0 105 3 1 0 107 3 5 0 112] 
#[0 3 9 0 10] 
#[1 0 110 0 3 0 110 0 4 0 110 0 8 3 13 0 11 0 110 0 17 0 110 0 20 0 110 0 22 0 110 0 23 0 110 0 24 0 110 0 25 0 110 0 26 0 110 0 29 0 110 0 30 0 110 0 31 0 110 0 32 0 110 0 33 0 110 0 34 0 110 0 35 0 110 0 37 0 110 0 41 0 110 0 42 0 110 0 43 0 110 0 44 0 110 0 46 0 110 0 47 0 110 0 50 0 110 0 54 0 110 0 55 0 110 0 57 0 110 0 58 0 110 0 59 0 110 0 63 0 110 0 64 0 110 0 66 0 110 0 68 0 110 0 69 0 110 0 70 0 110 0 71 0 110 0 72 0 110 0 73 0 110 0 74 0 110 0 75 0 110 0 76 0 110 0 77 0 110 0 78 0 110 0 80 0 110 0 82 0 110 0 83 0 110 0 86 0 110 0 87 0 110 0 88 0 110 0 89 0 110 0 90 3 13 1 94 0 110 1 109] 
#[0 0 122 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 122 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 122 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 122 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 110 0 3 0 110 0 4 0 110 0 8 3 17 0 11 0 110 0 17 0 110 0 20 0 110 0 22 0 110 0 23 0 110 0 24 0 110 0 25 0 110 0 26 0 110 0 29 0 110 0 30 0 110 0 31 0 110 0 32 0 110 0 33 0 110 0 34 0 110 0 35 0 110 0 37 0 110 0 41 0 110 0 42 0 110 0 43 0 110 0 44 0 110 0 46 0 110 0 47 0 110 0 50 0 110 0 54 0 110 0 55 0 110 0 57 0 110 0 58 0 110 0 59 0 110 0 63 0 110 0 64 0 110 0 66 0 110 0 68 0 110 0 69 0 110 0 70 0 110 0 71 0 110 0 72 0 110 0 73 0 110 0 74 0 110 0 75 0 110 0 76 0 110 0 77 0 110 0 78 0 110 0 80 0 110 0 82 0 110 0 83 0 110 0 86 0 110 0 87 0 110 0 88 0 110 0 89 0 110 0 90 3 17 1 94 0 110 1 109] 
#[0 0 126 1 109] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 3 21 0 4 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 3 25 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 3 29 0 150 3 33 0 151 3 37 0 155 3 41 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 2 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 113 1 106] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 3 49 0 13 3 53 0 169] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 3 57 0 86 3 61 0 90 3 65 0 172] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 134 0 4 3 69 0 12 3 73 0 128 3 77 1 74] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 3 81 0 7 3 85 0 223] 
#[0 0 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 138 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 138 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 138 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 142 0 4 0 17 0 20 0 30 0 31 0 33 0 35 0 36 0 44 0 45 0 47 0 50 0 51 0 54 0 55 0 57 0 59 0 63 0 67 0 68 0 69 0 70 0 74 0 75 0 76 0 77 0 78 0 81 0 86] 
#[1 0 146 0 4 0 21 0 17 0 146 0 20 0 146 0 30 0 146 0 31 0 146 0 33 0 146 0 35 0 146 0 36 0 146 0 44 0 146 0 45 0 146 0 47 0 146 0 50 0 146 0 51 0 146 0 54 0 146 0 55 0 146 0 57 0 146 0 59 0 146 0 63 0 146 0 67 0 146 0 68 0 146 0 69 0 146 0 70 0 146 0 74 0 146 0 75 0 146 0 76 0 146 0 77 0 146 0 78 0 146 0 81 0 146 0 86 3 89 0 245] 
#[1 0 110 0 3 0 110 0 4 0 110 0 8 3 93 0 11 0 110 0 17 0 110 0 20 0 110 0 22 0 110 0 23 0 110 0 24 0 110 0 25 0 110 0 26 0 110 0 29 0 110 0 30 0 110 0 31 0 110 0 32 0 110 0 33 0 110 0 34 0 110 0 35 0 110 0 37 0 110 0 41 0 110 0 42 0 110 0 43 0 110 0 44 0 110 0 46 0 110 0 47 0 110 0 50 0 110 0 54 0 110 0 55 0 110 0 57 0 110 0 58 0 110 0 59 0 110 0 63 0 110 0 64 0 110 0 66 0 110 0 68 0 110 0 69 0 110 0 70 0 110 0 71 0 110 0 72 0 110 0 73 0 110 0 74 0 110 0 75 0 110 0 76 0 110 0 77 0 110 0 78 0 110 0 80 0 110 0 82 0 110 0 83 0 110 0 86 0 110 0 87 0 110 0 88 0 110 0 89 0 110 0 90 3 93 1 94 0 110 1 109] 
#[1 0 150 0 3 0 150 0 4 0 150 0 5 0 150 0 6 0 150 0 8 0 150 0 9 0 150 0 10 0 150 0 11 0 115 0 13 3 101 0 16 0 150 0 17 0 150 0 20 0 150 0 21 0 150 0 22 0 150 0 23 0 150 0 24 0 150 0 25 0 150 0 26 0 119 0 27 0 150 0 29 0 150 0 30 0 150 0 31 0 150 0 32 0 150 0 33 0 150 0 34 0 150 0 35 0 150 0 37 0 150 0 41 0 150 0 42 0 150 0 43 0 150 0 44 0 150 0 46 0 150 0 47 0 150 0 48 0 150 0 50 3 109 0 52 0 150 0 54 0 150 0 55 0 150 0 57 0 150 0 58 0 150 0 59 0 150 0 63 0 150 0 64 0 150 0 66 0 150 0 68 0 150 0 69 0 150 0 70 0 150 0 71 0 150 0 72 0 150 0 73 0 150 0 74 0 150 0 75 0 150 0 76 0 150 0 77 0 150 0 78 0 150 0 79 0 150 0 80 0 150 0 82 0 150 0 83 0 150 0 86 0 150 0 87 0 150 0 88 0 150 0 89 0 123 0 90 3 117 0 96 3 121 0 255 3 125 1 0 3 129 1 1 3 133 1 2 3 137 1 3 0 150 1 109] 
#[0 0 154 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 158 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 162 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 166 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 170 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 162 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 162 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 174 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 174 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 174 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 162 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 162 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 162 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 162 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 3 141 0 1 0 154 0 3 0 127 0 4 0 154 0 5 0 154 0 6 0 131 0 8 0 154 0 9 0 154 0 10 0 154 0 11 0 154 0 13 0 135 0 16 0 154 0 17 0 139 0 20 0 154 0 21 0 154 0 22 0 154 0 23 0 154 0 24 0 154 0 25 0 154 0 26 0 154 0 27 0 154 0 29 0 154 0 30 0 154 0 31 0 154 0 32 0 154 0 33 0 154 0 34 0 154 0 35 0 154 0 37 0 154 0 41 0 154 0 42 0 154 0 43 0 154 0 44 0 154 0 46 0 154 0 47 0 154 0 48 0 154 0 50 0 154 0 52 0 154 0 54 0 154 0 55 0 154 0 57 0 154 0 58 0 154 0 59 0 154 0 63 0 154 0 64 0 154 0 66 0 154 0 68 0 154 0 69 0 154 0 70 0 154 0 71 0 154 0 72 0 154 0 73 0 154 0 74 0 154 0 75 0 154 0 76 0 154 0 77 0 154 0 78 0 154 0 79 0 154 0 80 0 143 0 82 0 154 0 83 0 154 0 86 0 154 0 87 0 154 0 88 0 154 0 89 0 147 0 90 3 161 0 98 3 165 1 22 3 169 1 86 0 154 1 109] 
#[0 0 158 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 158 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 158 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 158 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 158 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 158 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 158 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 158 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 151 0 31 3 221 0 33 3 181 0 35 0 155 0 44 3 185 0 47 0 190 0 50 0 155 0 54 0 182 0 55 0 182 0 57 0 182 0 59 3 189 0 63 0 182 0 68 3 193 0 69 3 197 0 70 0 182 0 74 0 182 0 75 0 182 0 76 0 155 0 77 0 182 0 78 3 213 0 86 3 205 0 141 3 209 0 184 3 213 0 190 3 217 0 192 3 221 1 64 3 225 1 65] 
#[0 0 194 1 109] 
#[0 0 198 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 70 0 1 0 70 0 4 0 70 0 5 0 70 0 6 0 70 0 8 3 229 0 10 2 221 0 12 0 70 0 13 0 70 0 16 0 70 0 20 0 70 0 27 0 70 0 52 0 70 0 82 0 70 0 90 2 225 0 136 2 229 1 73] 
#[0 0 202 0 5 0 6] 
#[1 0 206 0 5 3 233 0 6] 
#[0 0 210 0 5 0 6] 
#[0 3 237 0 5] 
#[0 0 214 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 218 0 4 0 17 0 20 0 30 0 31 0 33 0 35 0 36 0 44 0 45 0 47 0 50 0 51 0 54 0 55 0 57 0 59 0 63 0 67 0 68 0 69 0 70 0 74 0 75 0 76 0 77 0 78 0 81 0 86] 
#[1 0 159 0 4 0 222 0 17 0 222 0 20 0 222 0 30 0 222 0 31 0 222 0 33 0 222 0 35 0 222 0 36 0 222 0 44 0 222 0 45 0 222 0 47 0 222 0 50 0 222 0 51 0 222 0 54 0 222 0 55 0 222 0 57 0 222 0 59 0 222 0 63 0 222 0 67 0 222 0 68 0 222 0 69 0 222 0 70 0 222 0 74 0 222 0 75 0 222 0 76 0 222 0 77 0 222 0 78 0 222 0 81 0 222 0 86 3 245 0 247 3 249 1 58] 
#[0 3 253 0 21] 
#[1 0 70 0 1 0 70 0 3 0 70 0 4 0 70 0 5 0 70 0 6 0 70 0 8 0 70 0 9 0 70 0 10 0 70 0 11 2 221 0 12 0 70 0 13 0 70 0 16 0 70 0 17 0 70 0 20 0 70 0 21 0 70 0 22 0 70 0 23 0 70 0 24 0 70 0 25 0 70 0 26 0 70 0 27 0 70 0 29 0 70 0 30 0 70 0 31 0 70 0 32 0 70 0 33 0 70 0 34 0 70 0 35 0 70 0 37 0 70 0 41 0 70 0 42 0 70 0 43 0 70 0 44 0 70 0 46 0 70 0 47 0 70 0 48 0 70 0 50 0 70 0 52 0 70 0 54 0 70 0 55 0 70 0 57 0 70 0 58 0 70 0 59 0 70 0 63 0 70 0 64 0 70 0 66 0 70 0 68 0 70 0 69 0 70 0 70 0 70 0 71 0 70 0 72 0 70 0 73 0 70 0 74 0 70 0 75 0 70 0 76 0 70 0 77 0 70 0 78 0 70 0 79 0 70 0 80 0 70 0 82 0 70 0 83 0 70 0 86 0 70 0 87 0 70 0 88 0 70 0 89 0 70 0 90 2 225 0 136 2 229 1 73 0 70 1 109] 
#[1 0 226 0 6 4 1 0 10 0 226 0 21] 
#[0 0 230 0 21] 
#[1 4 5 0 6 0 234 0 21 4 9 1 63] 
#[0 4 13 0 21] 
#[1 4 17 0 6 0 234 0 21 4 21 1 63] 
#[0 4 25 0 21] 
#[0 0 74 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 238 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 242 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 0 246 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 0 6 0 31 0 53 0 32 0 6 0 33 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 0 10 0 83 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 0 145 0 99 0 149 0 100 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59 4 29 1 98] 
#[0 4 33 0 80] 
#[0 0 250 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 4 37 0 10 0 254 0 82 4 41 1 54 4 45 1 107] 
#[1 0 70 0 1 0 70 0 3 0 70 0 4 0 70 0 5 0 70 0 6 0 70 0 7 0 70 0 8 0 70 0 9 0 70 0 10 0 70 0 11 2 221 0 12 0 70 0 13 0 70 0 14 0 70 0 15 0 70 0 16 0 70 0 17 0 70 0 20 0 70 0 21 0 70 0 22 0 70 0 23 0 70 0 24 0 70 0 25 0 70 0 26 0 70 0 27 0 70 0 29 0 70 0 30 0 70 0 31 0 70 0 32 0 70 0 33 0 70 0 34 0 70 0 35 0 70 0 37 0 70 0 41 0 70 0 42 0 70 0 43 0 70 0 44 0 70 0 46 0 70 0 47 0 70 0 48 0 70 0 50 0 70 0 52 0 70 0 54 0 70 0 55 0 70 0 57 0 70 0 58 0 70 0 59 0 70 0 63 0 70 0 64 0 70 0 66 0 70 0 68 0 70 0 69 0 70 0 70 0 70 0 71 0 70 0 72 0 70 0 73 0 70 0 74 0 70 0 75 0 70 0 76 0 70 0 77 0 70 0 78 0 70 0 79 0 70 0 80 0 70 0 82 0 70 0 83 0 70 0 86 0 70 0 87 0 70 0 88 0 70 0 89 0 70 0 90 2 225 0 136 4 49 1 73 0 70 1 109] 
#[1 0 9 0 3 3 21 0 4 0 163 0 5 0 15 0 8 0 54 0 11 0 21 0 17 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 6 0 31 2 29 0 52 2 33 0 54 0 6 0 55 0 6 0 57 0 6 0 59 0 85 0 66 0 6 0 68 0 89 0 71 0 6 0 74 0 6 0 75 0 6 0 76 0 19 0 77 0 6 0 78 0 105 0 82 4 53 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 45 0 103 2 49 0 153 0 237 0 154 4 57 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 4 61 0 238 4 65 0 239 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 1 57 0 245 1 61 0 248 4 69 0 251 2 97 0 252 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 185 1 23 1 189 1 24 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 105 1 59 1 193 1 72 4 73 1 76 4 77 1 101 2 113 1 106] 
#[1 0 22 0 1 0 167 0 3 0 167 0 4 0 167 0 5 0 167 0 6 0 167 0 8 0 167 0 10 0 167 0 11 0 167 0 13 0 22 0 16 0 167 0 17 0 167 0 20 0 167 0 22 0 167 0 23 0 167 0 24 0 167 0 25 0 167 0 26 0 167 0 27 0 167 0 29 0 167 0 30 0 167 0 31 0 167 0 32 0 167 0 33 0 167 0 34 0 167 0 35 0 167 0 37 0 167 0 41 0 167 0 42 0 167 0 43 0 167 0 44 0 167 0 46 0 167 0 47 0 167 0 48 0 167 0 50 0 22 0 52 0 167 0 54 0 167 0 55 0 167 0 57 0 167 0 58 0 167 0 59 0 167 0 63 0 167 0 64 0 167 0 66 0 167 0 68 0 167 0 69 0 167 0 70 0 167 0 71 0 167 0 72 0 167 0 73 0 167 0 74 0 167 0 75 0 167 0 76 0 167 0 77 0 167 0 78 0 167 0 79 0 167 0 80 0 167 0 82 0 167 0 83 0 167 0 86 0 167 0 87 0 167 0 88 0 167 0 89 0 167 0 90 0 167 1 109] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 4 93 1 36 4 93 1 38 2 17 1 39 4 93 1 40 4 93 1 45 4 93 1 46 4 93 1 47 4 93 1 48 4 93 1 49 4 93 1 50 4 93 1 53] 
#[1 0 9 0 3 3 21 0 4 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 2 41 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 4 133 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 2 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 113 1 106] 
#[1 0 9 0 3 3 21 0 4 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 2 41 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 4 137 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 2 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 113 1 106] 
#[1 0 70 0 1 0 171 0 3 0 171 0 4 0 171 0 5 0 171 0 6 0 175 0 8 0 171 0 10 0 171 0 11 0 179 0 12 0 171 0 13 0 70 0 16 0 171 0 17 0 171 0 20 0 171 0 22 0 171 0 23 0 171 0 24 0 171 0 25 0 171 0 26 0 171 0 27 0 171 0 29 0 171 0 30 0 171 0 31 0 171 0 32 0 171 0 33 0 171 0 34 0 171 0 35 0 171 0 37 0 171 0 41 0 171 0 42 0 171 0 43 0 171 0 44 0 171 0 46 0 171 0 47 0 171 0 48 0 171 0 50 0 70 0 52 0 171 0 54 0 171 0 55 0 171 0 57 0 171 0 58 0 171 0 59 0 171 0 63 0 171 0 64 0 171 0 66 0 171 0 68 0 171 0 69 0 171 0 70 0 171 0 71 0 171 0 72 0 171 0 73 0 171 0 74 0 171 0 75 0 171 0 76 0 171 0 77 0 171 0 78 0 171 0 79 0 171 0 80 0 171 0 82 0 171 0 83 0 171 0 86 0 171 0 87 0 171 0 88 0 171 0 89 0 171 0 90 2 225 0 136 2 229 1 73 0 171 1 109] 
#[0 1 14 0 11] 
#[0 1 18 0 11] 
#[1 4 141 0 27 4 145 0 48] 
#[1 1 22 0 3 1 22 0 4 1 22 0 5 1 22 0 6 1 22 0 8 0 183 0 10 1 22 0 11 1 22 0 13 1 22 0 17 1 22 0 20 1 22 0 22 1 22 0 23 1 22 0 24 1 22 0 25 1 22 0 26 1 22 0 27 1 22 0 29 1 22 0 30 1 22 0 31 1 22 0 32 1 22 0 33 1 22 0 34 1 22 0 35 1 22 0 37 1 22 0 41 1 22 0 42 1 22 0 43 1 22 0 44 1 22 0 46 1 22 0 47 1 22 0 48 1 22 0 50 1 22 0 54 1 22 0 55 1 22 0 57 1 22 0 58 1 22 0 59 1 22 0 63 1 22 0 64 1 22 0 66 1 22 0 68 1 22 0 69 1 22 0 70 1 22 0 71 1 22 0 72 1 22 0 73 1 22 0 74 1 22 0 75 1 22 0 76 1 22 0 77 1 22 0 78 1 22 0 79 1 22 0 80 1 22 0 82 1 22 0 83 1 22 0 86 1 22 0 87 1 22 0 88 1 22 0 89 1 22 0 90 4 153 1 37 4 157 1 105 1 22 1 109] 
#[1 1 22 0 3 1 22 0 4 1 22 0 5 1 22 0 6 1 22 0 8 0 183 0 10 1 22 0 11 1 22 0 13 1 22 0 17 1 22 0 20 1 22 0 22 1 22 0 23 1 22 0 24 1 22 0 25 1 22 0 26 1 22 0 27 1 22 0 29 1 22 0 30 1 22 0 31 1 22 0 32 1 22 0 33 1 22 0 34 1 22 0 35 1 22 0 37 1 22 0 41 1 22 0 42 1 22 0 43 1 22 0 44 1 22 0 46 1 22 0 47 1 22 0 48 1 22 0 50 1 22 0 54 1 22 0 55 1 22 0 57 1 22 0 58 1 22 0 59 1 22 0 63 1 22 0 64 1 22 0 66 1 22 0 68 1 22 0 69 1 22 0 70 1 22 0 71 1 22 0 72 1 22 0 73 1 22 0 74 1 22 0 75 1 22 0 76 1 22 0 77 1 22 0 78 1 22 0 79 1 22 0 80 1 22 0 82 1 22 0 83 1 22 0 86 1 22 0 87 1 22 0 88 1 22 0 89 1 22 0 90 4 153 1 37 4 161 1 105 1 22 1 109] 
#[0 1 26 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 1 22 0 3 1 22 0 4 1 22 0 5 1 22 0 6 1 22 0 8 0 183 0 10 1 22 0 11 1 22 0 13 1 22 0 17 1 22 0 20 1 22 0 22 1 22 0 23 1 22 0 24 1 22 0 25 1 22 0 26 1 22 0 27 1 22 0 29 1 22 0 30 1 22 0 31 1 22 0 32 1 22 0 33 1 22 0 34 1 22 0 35 1 22 0 37 1 22 0 41 1 22 0 42 1 22 0 43 1 22 0 44 1 22 0 46 1 22 0 47 1 22 0 48 1 22 0 50 1 22 0 54 1 22 0 55 1 22 0 57 1 22 0 58 1 22 0 59 1 22 0 63 1 22 0 64 1 22 0 66 1 22 0 68 1 22 0 69 1 22 0 70 1 22 0 71 1 22 0 72 1 22 0 73 1 22 0 74 1 22 0 75 1 22 0 76 1 22 0 77 1 22 0 78 1 22 0 79 1 22 0 80 1 22 0 82 1 22 0 83 1 22 0 86 1 22 0 87 1 22 0 88 1 22 0 89 1 22 0 90 4 153 1 37 4 165 1 105 1 22 1 109] 
#[0 1 30 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 34 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 38 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 42 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 46 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 1 50 0 6 1 50 0 11 1 54 0 27 1 54 0 48] 
#[1 4 169 0 6 1 58 0 11] 
#[0 1 62 0 8] 
#[1 0 182 0 31 0 182 0 55 0 182 0 57 0 182 0 59 0 182 0 68 0 182 0 74 0 182 0 75 0 182 0 76 0 155 0 77 0 182 0 78 3 205 0 141 4 173 1 65] 
#[0 4 177 0 11] 
#[0 4 181 0 8] 
#[1 2 1 0 82 4 185 0 144] 
#[0 1 66 0 82] 
#[0 1 66 0 82] 
#[0 4 189 0 90] 
#[0 4 193 0 90] 
#[0 4 197 0 90] 
#[0 1 70 0 3 0 4 0 5 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 74 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 4 201 0 50 4 205 0 86] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 4 209 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[1 4 213 0 50 4 217 0 86] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 4 221 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 4 225 0 82] 
#[0 1 78 0 10 0 13 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[0 1 82 0 10 0 13 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[1 2 1 0 82 4 229 0 144] 
#[0 1 86 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 86 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 1 90 0 2 0 6 0 4 4 233 0 5 0 21 0 17 0 6 0 20 1 90 0 22 4 253 0 51 1 90 0 54 0 6 0 63 1 90 0 77 0 187 0 86 4 241 0 178 4 245 0 179 1 57 0 245 1 61 0 248 4 249 1 59 4 253 1 82] 
#[1 5 1 0 74 5 5 0 75 5 9 0 76 5 13 0 78 5 17 1 20] 
#[0 1 94 0 6 0 7 0 48] 
#[1 5 21 0 6 5 25 0 7 1 98 0 48 5 29 0 174 5 33 1 77] 
#[1 5 25 0 7 1 98 0 48 5 29 0 174 5 37 1 77] 
#[0 1 102 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[1 2 189 0 4 5 41 0 48 2 197 0 86 5 45 0 93 5 49 0 177] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 0 6 0 31 0 53 0 32 0 6 0 33 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 0 145 0 99 5 53 0 100 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 5 57 0 137 5 61 0 138 5 65 1 36 5 65 1 38 2 17 1 39 5 65 1 40 5 65 1 45 5 65 1 46 5 65 1 47 5 65 1 48 5 65 1 49 5 65 1 50 5 65 1 53] 
#[0 1 106 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 110 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 3 141 0 1 1 114 0 3 0 191 0 4 1 114 0 5 1 114 0 6 0 195 0 8 1 114 0 9 1 114 0 10 1 114 0 11 1 114 0 13 0 199 0 16 1 114 0 17 0 203 0 20 1 114 0 21 1 114 0 22 1 114 0 23 1 114 0 24 1 114 0 25 1 114 0 26 1 114 0 27 1 114 0 29 1 114 0 30 1 114 0 31 1 114 0 32 1 114 0 33 1 114 0 34 1 114 0 35 1 114 0 37 1 114 0 41 1 114 0 42 1 114 0 43 1 114 0 44 1 114 0 46 1 114 0 47 1 114 0 48 1 114 0 50 1 114 0 52 1 114 0 54 1 114 0 55 1 114 0 57 1 114 0 58 1 114 0 59 1 114 0 63 1 114 0 64 1 114 0 66 1 114 0 68 1 114 0 69 1 114 0 70 1 114 0 71 1 114 0 72 1 114 0 73 1 114 0 74 1 114 0 75 1 114 0 76 1 114 0 77 1 114 0 78 1 114 0 79 1 114 0 80 0 207 0 82 1 114 0 83 1 114 0 86 1 114 0 87 1 114 0 88 1 114 0 89 0 211 0 90 3 161 0 98 3 165 1 22 3 169 1 86 1 114 1 109] 
#[0 1 118 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 122 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 126 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 126 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 126 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 134 0 37 0 43 0 72 0 80] 
#[0 1 126 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 138 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 3 21 0 4 0 163 0 5 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 4 53 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 4 57 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 4 61 0 238 4 65 0 239 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 5 69 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 185 1 23 1 189 1 24 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 1 193 1 72 4 77 1 101 2 113 1 106] 
#[1 0 70 0 1 0 171 0 3 0 171 0 4 0 171 0 6 0 175 0 8 0 215 0 10 0 171 0 11 0 179 0 12 0 171 0 13 0 70 0 16 0 171 0 17 0 171 0 20 0 171 0 22 0 171 0 23 0 171 0 24 0 171 0 25 0 171 0 26 0 171 0 27 0 171 0 29 0 171 0 30 0 171 0 31 0 171 0 32 0 171 0 33 0 171 0 34 0 171 0 35 0 171 0 37 0 171 0 41 0 171 0 42 0 171 0 43 0 171 0 44 0 171 0 46 0 171 0 47 0 171 0 50 0 70 0 52 0 171 0 54 0 171 0 55 0 171 0 57 0 171 0 58 0 171 0 59 0 171 0 63 0 171 0 64 0 171 0 66 0 171 0 68 0 171 0 69 0 171 0 70 0 171 0 71 0 171 0 72 0 171 0 73 0 171 0 74 0 171 0 75 0 171 0 76 0 171 0 77 0 171 0 78 0 171 0 80 0 171 0 82 0 171 0 83 0 171 0 86 0 171 0 87 0 171 0 88 0 171 0 89 0 171 0 90 2 225 0 136 2 229 1 73 0 171 1 109] 
#[1 1 146 0 3 1 146 0 4 5 73 0 6 1 146 0 8 1 146 0 11 1 146 0 17 1 146 0 20 1 146 0 22 1 146 0 23 1 146 0 24 1 146 0 25 1 146 0 26 1 146 0 29 1 146 0 30 1 146 0 31 1 146 0 32 1 146 0 33 1 146 0 34 1 146 0 35 1 146 0 37 1 146 0 41 1 146 0 42 1 146 0 43 1 146 0 44 1 146 0 46 1 146 0 47 1 146 0 50 1 146 0 54 1 146 0 55 1 146 0 57 1 146 0 58 1 146 0 59 1 146 0 63 1 146 0 64 1 146 0 66 1 146 0 68 1 146 0 69 1 146 0 70 1 146 0 71 1 146 0 72 1 146 0 73 1 146 0 74 1 146 0 75 1 146 0 76 1 146 0 77 1 146 0 78 1 146 0 80 1 146 0 82 1 146 0 83 1 146 0 86 1 146 0 87 1 146 0 88 1 146 0 89 1 146 0 90 1 146 1 109] 
#[0 1 150 0 3 0 4 0 6 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 4 149 0 10 5 77 1 37] 
#[1 1 154 0 3 1 154 0 4 1 154 0 6 1 154 0 8 1 154 0 11 5 81 0 13 1 154 0 17 1 154 0 20 1 154 0 22 1 154 0 23 1 154 0 24 1 154 0 25 1 154 0 26 4 141 0 27 1 154 0 29 1 154 0 30 1 154 0 31 1 154 0 32 1 154 0 33 1 154 0 34 1 154 0 35 1 154 0 37 1 154 0 41 1 154 0 42 1 154 0 43 1 154 0 44 1 154 0 46 1 154 0 47 1 154 0 50 1 154 0 54 1 154 0 55 1 154 0 57 1 154 0 58 1 154 0 59 1 154 0 63 1 154 0 64 1 154 0 66 1 154 0 68 1 154 0 69 1 154 0 70 1 154 0 71 1 154 0 72 1 154 0 73 1 154 0 74 1 154 0 75 1 154 0 76 1 154 0 77 1 154 0 78 1 154 0 80 1 154 0 82 1 154 0 83 1 154 0 86 1 154 0 87 1 154 0 88 1 154 0 89 1 154 0 90 5 85 0 152 5 89 1 81 1 154 1 109] 
#[0 1 54 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 5 93 1 36 5 93 1 38 2 17 1 39 5 93 1 40 5 93 1 45 5 93 1 46 5 93 1 47 5 93 1 48 5 93 1 49 5 93 1 50 5 93 1 53] 
#[0 1 158 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 162 0 4 0 7 0 12 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[0 1 166 0 4 0 7 0 12 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[1 0 134 0 4 0 134 0 7 3 69 0 12 0 134 0 82 3 73 0 128 5 97 1 74] 
#[1 5 109 0 86 5 101 0 129 5 105 0 130 5 109 1 39] 
#[0 1 170 0 4 0 7 0 10 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[1 2 189 0 4 5 113 0 177] 
#[1 0 6 0 4 0 21 0 17 0 6 0 20 0 6 0 63 0 6 0 86 1 57 0 245 1 61 0 248 5 117 1 59] 
#[1 5 121 0 82 5 125 0 144 5 129 0 156 5 133 0 160] 
#[0 1 174 0 4 0 17 0 20 0 30 0 31 0 33 0 35 0 36 0 44 0 45 0 47 0 50 0 51 0 54 0 55 0 57 0 59 0 63 0 67 0 68 0 69 0 70 0 74 0 75 0 76 0 77 0 78 0 81 0 86] 
#[0 1 178 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 182 0 3 0 4 0 8 0 20 0 22 0 23 0 24 0 25 0 26 0 66 0 71 0 82 0 86 0 87 0 88 0 89 0 90] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 5 137 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[1 4 81 0 4 5 141 0 16 4 85 0 20 4 89 0 63 2 17 0 86 5 145 1 36 5 145 1 38 2 17 1 39 5 145 1 40 5 145 1 45 5 145 1 46 5 145 1 47 5 145 1 48 5 145 1 49 5 145 1 50 5 145 1 53] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 5 149 1 36 5 149 1 38 2 17 1 39 5 149 1 40 5 149 1 45 5 149 1 46 5 149 1 47 5 149 1 48 5 149 1 49 5 149 1 50 5 149 1 53] 
#[0 1 186 0 3 0 4 0 8 0 20 0 22 0 23 0 24 0 25 0 26 0 66 0 71 0 82 0 86 0 87 0 88 0 89 0 90] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 5 153 0 253 5 153 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 1 190 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 1 194 0 3 1 194 0 4 1 194 0 5 1 194 0 6 1 194 0 8 1 194 0 9 1 194 0 10 1 194 0 11 0 219 0 13 3 101 0 16 1 194 0 17 1 194 0 20 1 194 0 21 1 194 0 22 1 194 0 23 1 194 0 24 1 194 0 25 1 194 0 26 0 223 0 27 1 194 0 29 1 194 0 30 1 194 0 31 1 194 0 32 1 194 0 33 1 194 0 34 1 194 0 35 1 194 0 37 1 194 0 41 1 194 0 42 1 194 0 43 1 194 0 44 1 194 0 46 1 194 0 47 1 194 0 48 1 194 0 50 3 109 0 52 1 194 0 54 1 194 0 55 1 194 0 57 1 194 0 58 1 194 0 59 1 194 0 63 1 194 0 64 1 194 0 66 1 194 0 68 1 194 0 69 1 194 0 70 1 194 0 71 1 194 0 72 1 194 0 73 1 194 0 74 1 194 0 75 1 194 0 76 1 194 0 77 1 194 0 78 1 194 0 79 1 194 0 80 1 194 0 82 1 194 0 83 1 194 0 86 1 194 0 87 1 194 0 88 1 194 0 89 0 227 0 90 3 117 0 96 5 157 0 255 3 129 1 1 3 133 1 2 3 137 1 3 1 194 1 109] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 5 161 0 253 5 161 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 5 165 0 253 5 165 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 1 198 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 202 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 5 169 0 38 5 173 0 50 5 177 0 66 5 181 0 86 5 185 0 87] 
#[0 1 206 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 5 189 0 251 5 193 0 252 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 1 210 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 214 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 1 218 0 1 1 218 0 3 1 218 0 4 1 218 0 5 1 218 0 6 1 218 0 8 1 218 0 9 1 218 0 10 1 218 0 11 1 218 0 13 1 218 0 16 1 218 0 17 1 218 0 20 1 218 0 21 1 218 0 22 1 218 0 23 1 218 0 24 1 218 0 25 1 218 0 26 1 218 0 27 1 218 0 29 1 218 0 30 1 218 0 31 1 218 0 32 1 218 0 33 1 218 0 34 1 218 0 35 1 218 0 37 1 218 0 41 1 218 0 42 1 218 0 43 1 218 0 44 1 218 0 46 1 218 0 47 1 218 0 48 1 218 0 50 1 218 0 52 1 218 0 54 1 218 0 55 1 218 0 57 1 218 0 58 1 218 0 59 1 218 0 63 1 218 0 64 1 218 0 66 1 218 0 68 1 218 0 69 1 218 0 70 1 218 0 71 1 218 0 72 1 218 0 73 1 218 0 74 1 218 0 75 1 218 0 76 1 218 0 77 1 218 0 78 1 218 0 79 1 218 0 80 0 231 0 82 1 218 0 83 1 218 0 86 1 218 0 87 1 218 0 88 1 218 0 89 1 218 0 90 1 218 1 109] 
#[1 0 105 0 82 5 201 1 17 5 201 1 28] 
#[0 5 209 0 86 0 203] 
#[0 1 226 0 50] 
#[1 2 1 0 82 5 213 0 144] 
#[1 5 217 0 31 5 221 0 40 5 225 0 44 5 229 0 63 5 233 0 69 5 237 0 73 5 241 0 77 1 230 0 86 1 230 0 90 5 245 0 146 5 249 1 79] 
#[0 6 1 0 86 0 206] 
#[0 6 9 0 86 0 200] 
#[1 2 189 0 4 6 13 0 177] 
#[0 1 234 0 10 0 12 0 82] 
#[1 6 17 0 31 1 238 0 44 1 238 0 54 6 21 0 55 6 25 0 57 6 29 0 59 6 33 0 68 6 37 0 74 6 41 0 75 6 45 0 76 1 238 0 77 6 49 0 78 6 53 0 142] 
#[0 1 242 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 134 0 10 3 69 0 12 0 134 0 82 3 73 0 128 6 57 1 74] 
#[0 1 246 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 6 61 0 50] 
#[1 6 65 0 44 6 69 0 54 6 73 0 77] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 6 77 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 177 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 6 81 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 6 81 1 24 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 1 250 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 6 85 0 4 1 254 0 5 6 89 0 20 6 93 0 82 6 97 0 86 0 113 0 87 0 117 0 88 0 133 0 89 6 101 0 90 0 133 0 94 6 105 0 95 6 109 0 249 6 113 0 250 6 117 1 60] 
#[0 2 2 0 4 0 17 0 20 0 30 0 31 0 33 0 35 0 36 0 44 0 45 0 47 0 50 0 51 0 54 0 55 0 57 0 59 0 63 0 67 0 68 0 69 0 70 0 74 0 75 0 76 0 77 0 78 0 81 0 86] 
#[0 2 6 0 4 0 17 0 20 0 30 0 31 0 33 0 35 0 36 0 44 0 45 0 47 0 50 0 51 0 54 0 55 0 57 0 59 0 63 0 67 0 68 0 69 0 70 0 74 0 75 0 76 0 77 0 78 0 81 0 86] 
#[0 2 10 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 6 121 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 2 14 0 21 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 1 225 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 6 129 1 7 1 225 1 8 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 2 18 0 21] 
#[0 2 22 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 2 14 0 21 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 6 133 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 6 137 1 10 1 233 1 11 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 2 26 0 21] 
#[0 2 30 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 6 141 0 83] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 6 0 31 0 6 0 33 0 6 0 35 0 61 0 41 0 6 0 44 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 105 0 82 0 23 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 6 145 0 106 6 145 0 139 6 145 0 145 6 145 0 149 6 145 0 153 0 237 0 154 6 145 0 166 0 245 0 167 6 145 0 170 0 253 0 171 6 145 0 183 6 145 0 199 6 145 0 202 6 145 0 205 6 145 0 215 1 21 0 216 6 145 0 218 6 145 0 219 6 145 0 221 1 37 0 222 6 145 0 224 6 145 0 225 6 145 0 226 6 145 0 227 1 57 0 245 1 61 0 248 6 145 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59] 
#[1 2 17 0 86 6 149 1 38 2 17 1 39 6 153 1 55] 
#[0 2 34 0 13 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[1 6 157 0 82 6 161 0 220] 
#[1 2 38 0 1 2 38 0 3 2 38 0 4 2 38 0 5 2 38 0 6 2 38 0 7 0 235 0 8 2 38 0 9 2 38 0 10 2 38 0 11 2 38 0 13 2 38 0 14 2 38 0 15 2 38 0 16 2 38 0 17 2 38 0 20 2 38 0 21 2 38 0 22 2 38 0 23 2 38 0 24 2 38 0 25 2 38 0 26 2 38 0 27 2 38 0 29 2 38 0 30 2 38 0 31 2 38 0 32 2 38 0 33 2 38 0 34 2 38 0 35 2 38 0 37 2 38 0 41 2 38 0 42 2 38 0 43 2 38 0 44 2 38 0 46 2 38 0 47 2 38 0 48 2 38 0 50 2 38 0 52 2 38 0 54 2 38 0 55 2 38 0 57 2 38 0 58 2 38 0 59 2 38 0 63 2 38 0 64 2 38 0 66 2 38 0 68 2 38 0 69 2 38 0 70 2 38 0 71 2 38 0 72 2 38 0 73 2 38 0 74 2 38 0 75 2 38 0 76 2 38 0 77 2 38 0 78 2 38 0 79 2 38 0 80 2 38 0 82 2 38 0 83 2 38 0 86 2 38 0 87 2 38 0 88 2 38 0 89 2 38 0 90 2 38 1 109] 
#[1 0 70 0 1 0 70 0 4 0 171 0 5 0 171 0 6 0 239 0 8 0 243 0 10 0 70 0 11 0 179 0 12 0 70 0 13 0 70 0 16 0 70 0 20 0 171 0 27 0 70 0 52 0 70 0 82 0 70 0 90 2 225 0 136 2 229 1 73] 
#[1 2 42 0 5 2 42 0 6 4 141 0 27] 
#[1 2 46 0 5 6 169 0 6] 
#[0 2 50 0 5 0 6] 
#[1 0 247 0 5 0 251 0 6 1 50 0 11 1 54 0 27] 
#[0 6 173 0 11] 
#[0 6 177 0 5] 
#[1 0 6 0 4 2 54 0 5 0 21 0 17 0 6 0 20 0 255 0 51 0 6 0 63 0 187 0 86 1 57 0 245 1 61 0 248 6 181 1 41 6 185 1 42 6 189 1 43 6 193 1 59 6 197 1 82 6 201 1 103] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 6 205 1 36 6 205 1 38 2 17 1 39 6 205 1 40 6 205 1 45 6 205 1 46 6 205 1 47 6 205 1 48 6 205 1 49 6 205 1 50 6 205 1 53] 
#[0 6 209 0 12] 
#[1 6 213 0 1 2 58 0 3 2 58 0 4 2 58 0 5 2 58 0 6 6 217 0 7 1 3 0 8 2 58 0 10 2 58 0 11 2 58 0 13 6 225 0 16 2 58 0 17 2 58 0 20 2 58 0 22 2 58 0 23 2 58 0 24 2 58 0 25 2 58 0 26 2 58 0 27 2 58 0 29 2 58 0 30 2 58 0 31 2 58 0 32 2 58 0 33 2 58 0 34 2 58 0 35 2 58 0 37 2 58 0 41 2 58 0 42 2 58 0 43 2 58 0 44 2 58 0 46 2 58 0 47 2 58 0 48 2 58 0 50 2 58 0 54 2 58 0 55 2 58 0 57 2 58 0 58 2 58 0 59 2 58 0 63 2 58 0 64 2 58 0 66 2 58 0 68 2 58 0 69 2 58 0 70 2 58 0 71 2 58 0 72 2 58 0 73 2 58 0 74 2 58 0 75 2 58 0 76 2 58 0 77 2 58 0 78 2 58 0 79 2 58 0 80 2 58 0 82 2 58 0 83 2 58 0 86 2 58 0 87 2 58 0 88 2 58 0 89 2 58 0 90 2 58 1 109] 
#[0 2 62 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 62 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 62 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 62 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 62 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 62 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 62 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 62 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 62 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 2 66 0 3 2 66 0 4 2 66 0 5 2 66 0 6 2 66 0 8 2 66 0 10 2 66 0 11 2 66 0 13 2 66 0 17 2 66 0 20 2 66 0 22 2 66 0 23 2 66 0 24 2 66 0 25 2 66 0 26 1 7 0 27 2 66 0 29 2 66 0 30 2 66 0 31 2 66 0 32 2 66 0 33 2 66 0 34 2 66 0 35 2 66 0 37 2 66 0 41 2 66 0 42 2 66 0 43 2 66 0 44 2 66 0 46 2 66 0 47 2 66 0 48 2 66 0 50 2 66 0 54 2 66 0 55 2 66 0 57 2 66 0 58 2 66 0 59 2 66 0 63 2 66 0 64 2 66 0 66 2 66 0 68 2 66 0 69 2 66 0 70 2 66 0 71 2 66 0 72 2 66 0 73 2 66 0 74 2 66 0 75 2 66 0 76 2 66 0 77 2 66 0 78 2 66 0 79 2 66 0 80 2 66 0 82 2 66 0 83 2 66 0 86 2 66 0 87 2 66 0 88 2 66 0 89 2 66 0 90 2 66 1 109] 
#[1 2 70 0 3 2 70 0 4 2 70 0 5 2 70 0 6 2 70 0 8 2 70 0 10 2 70 0 11 2 70 0 13 2 70 0 17 2 70 0 20 2 70 0 22 2 70 0 23 2 70 0 24 2 70 0 25 2 70 0 26 1 11 0 27 2 70 0 29 2 70 0 30 2 70 0 31 2 70 0 32 2 70 0 33 2 70 0 34 2 70 0 35 2 70 0 37 2 70 0 41 2 70 0 42 2 70 0 43 2 70 0 44 2 70 0 46 2 70 0 47 2 70 0 48 2 70 0 50 2 70 0 54 2 70 0 55 2 70 0 57 2 70 0 58 2 70 0 59 2 70 0 63 2 70 0 64 2 70 0 66 2 70 0 68 2 70 0 69 2 70 0 70 2 70 0 71 2 70 0 72 2 70 0 73 2 70 0 74 2 70 0 75 2 70 0 76 2 70 0 77 2 70 0 78 2 70 0 79 2 70 0 80 2 70 0 82 2 70 0 83 2 70 0 86 2 70 0 87 2 70 0 88 2 70 0 89 2 70 0 90 2 70 1 109] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 6 229 1 36 6 229 1 38 2 17 1 39 6 229 1 40 6 229 1 45 6 229 1 46 6 229 1 47 6 229 1 48 6 229 1 49 6 229 1 50 6 229 1 53] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 6 233 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[1 0 6 0 4 0 21 0 17 0 6 0 20 0 6 0 63 0 6 0 86 1 57 0 245 1 61 0 248 6 237 1 59] 
#[0 2 74 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 78 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 82 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 86 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 6 241 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 6 73 0 77] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 58 0 11 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 6 245 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 6 245 1 71] 
#[0 6 253 0 86 0 191] 
#[1 2 90 0 3 2 90 0 4 2 90 0 8 2 90 0 11 2 90 0 17 2 90 0 20 2 90 0 22 2 90 0 23 2 90 0 24 2 90 0 25 2 90 0 26 2 90 0 29 2 90 0 30 2 90 0 31 2 90 0 32 2 90 0 33 2 90 0 34 2 90 0 35 2 90 0 37 7 1 0 39 2 90 0 41 2 90 0 42 2 90 0 43 2 90 0 44 2 90 0 46 2 90 0 47 2 90 0 50 2 90 0 54 2 90 0 55 2 90 0 57 2 90 0 58 2 90 0 59 2 90 0 63 2 90 0 64 2 90 0 66 2 90 0 68 2 90 0 69 2 90 0 70 2 90 0 71 2 90 0 72 2 90 0 73 2 90 0 74 2 90 0 75 2 90 0 76 2 90 0 77 2 90 0 78 2 90 0 80 2 90 0 82 2 90 0 83 2 90 0 86 2 90 0 87 2 90 0 88 2 90 0 89 2 90 0 90 7 5 0 111 7 9 1 70 2 90 1 109] 
#[0 7 13 0 82] 
#[0 7 17 0 82] 
#[0 7 21 0 82] 
#[0 2 94 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 98 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 7 25 0 21] 
#[0 2 102 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 106 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 7 29 0 21] 
#[1 7 33 0 30 7 37 0 34 2 110 0 83 7 41 0 113 7 45 0 114 7 49 0 115 7 53 0 117 7 57 1 99] 
#[0 2 114 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 118 0 4 0 7 0 17 0 31 0 33 0 44 0 48 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[0 2 122 0 2 0 4 0 20 0 22 0 54 0 63 0 77 0 86] 
#[1 2 126 0 5 7 61 0 6 7 69 0 9 7 69 1 69] 
#[0 2 130 0 5 0 6 0 9] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 7 73 1 36 7 73 1 38 2 17 1 39 7 73 1 40 7 73 1 45 7 73 1 46 7 73 1 47 7 73 1 48 7 73 1 49 7 73 1 50 7 73 1 53] 
#[1 2 134 0 2 2 134 0 22 7 85 0 54 7 81 0 77 2 134 0 86 7 85 1 84] 
#[0 2 138 0 3 0 4 0 8 0 20 0 22 0 23 0 24 0 25 0 26 0 66 0 71 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 2 142 0 3 0 4 0 8 0 20 0 22 0 23 0 24 0 25 0 26 0 66 0 71 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 2 146 0 3 0 4 0 8 0 20 0 22 0 23 0 24 0 25 0 26 0 66 0 71 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 2 150 0 3 0 4 0 8 0 20 0 22 0 23 0 24 0 25 0 26 0 66 0 71 0 82 0 86 0 87 0 88 0 89 0 90] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 7 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 7 93 0 86] 
#[1 0 6 0 4 0 21 0 17 0 6 0 20 0 6 0 63 0 6 0 86 1 57 0 245 1 61 0 248 7 97 1 59] 
#[0 2 154 0 17 0 31 0 33 0 44 0 48 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[0 7 101 0 48] 
#[0 7 105 0 48] 
#[0 2 158 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[1 5 21 0 6 5 25 0 7 1 98 0 48 5 29 0 174 7 109 1 77] 
#[1 5 25 0 7 1 98 0 48 5 29 0 174 7 113 1 77] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 0 6 0 31 0 53 0 32 0 6 0 33 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 7 117 0 83 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 237 0 99 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59] 
#[1 7 121 0 6 7 125 0 15] 
#[0 2 162 0 6 0 15] 
#[1 6 213 0 1 2 166 0 6 6 217 0 7 6 221 0 8 2 166 0 15 6 225 0 16] 
#[1 0 247 0 5 0 247 0 6 1 54 0 27] 
#[1 0 9 0 3 3 21 0 4 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 2 41 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 7 129 0 151 3 41 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 2 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 113 1 106] 
#[1 5 81 0 13 1 15 0 82 7 133 0 144 5 85 0 152 7 137 0 156 7 141 0 160 7 145 1 81] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 7 149 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 2 170 0 3 0 4 0 6 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 174 0 3 0 4 0 6 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 6 213 0 1 2 178 0 3 2 178 0 4 6 217 0 7 1 19 0 8 2 178 0 11 6 225 0 16 2 178 0 17 2 178 0 20 2 178 0 22 2 178 0 23 2 178 0 24 2 178 0 25 2 178 0 26 2 178 0 29 2 178 0 30 2 178 0 31 2 178 0 32 2 178 0 33 2 178 0 34 2 178 0 35 2 178 0 37 2 178 0 41 2 178 0 42 2 178 0 43 2 178 0 44 2 178 0 46 2 178 0 47 2 178 0 50 2 178 0 54 2 178 0 55 2 178 0 57 2 178 0 58 2 178 0 59 2 178 0 63 2 178 0 64 2 178 0 66 2 178 0 68 2 178 0 69 2 178 0 70 2 178 0 71 2 178 0 72 2 178 0 73 2 178 0 74 2 178 0 75 2 178 0 76 2 178 0 77 2 178 0 78 2 178 0 80 2 178 0 82 2 178 0 83 2 178 0 86 2 178 0 87 2 178 0 88 2 178 0 89 2 178 0 90 2 178 1 109] 
#[1 2 182 0 4 2 182 0 7 2 182 0 82 7 153 0 173 7 157 0 176] 
#[1 7 161 0 6 2 186 0 15 7 165 0 79 7 169 0 131 7 173 1 93] 
#[0 2 190 0 6 0 15 0 79] 
#[1 2 194 0 6 7 177 0 10 2 194 0 15 2 194 0 79] 
#[1 2 1 0 82 7 185 0 144 7 185 0 217] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 7 189 1 36 7 189 1 38 2 17 1 39 7 189 1 40 7 189 1 45 7 189 1 46 7 189 1 47 7 189 1 48 7 189 1 49 7 189 1 50 7 189 1 53] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 0 6 0 31 0 53 0 32 0 6 0 33 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 6 0 45 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 67 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 0 10 0 83 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 0 145 0 99 0 149 0 100 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 7 193 0 157 7 197 0 158 7 201 0 161 7 205 0 162 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 7 209 1 59 4 29 1 98] 
#[0 2 198 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 202 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 206 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 7 213 0 10] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 7 217 1 36 7 217 1 38 2 17 1 39 7 217 1 40 7 217 1 45 7 217 1 46 7 217 1 47 7 217 1 48 7 217 1 49 7 217 1 50 7 217 1 53] 
#[1 6 213 0 1 2 210 0 3 2 210 0 4 2 210 0 5 2 210 0 6 6 217 0 7 1 23 0 8 2 210 0 9 2 210 0 10 2 210 0 11 2 210 0 13 1 27 0 16 2 210 0 17 2 210 0 20 2 210 0 21 2 210 0 22 2 210 0 23 2 210 0 24 2 210 0 25 2 210 0 26 2 210 0 27 2 210 0 29 2 210 0 30 2 210 0 31 2 210 0 32 2 210 0 33 2 210 0 34 2 210 0 35 2 210 0 37 2 210 0 41 2 210 0 42 2 210 0 43 2 210 0 44 2 210 0 46 2 210 0 47 2 210 0 48 2 210 0 50 2 210 0 52 2 210 0 54 2 210 0 55 2 210 0 57 2 210 0 58 2 210 0 59 2 210 0 63 2 210 0 64 2 210 0 66 2 210 0 68 2 210 0 69 2 210 0 70 2 210 0 71 2 210 0 72 2 210 0 73 2 210 0 74 2 210 0 75 2 210 0 76 2 210 0 77 2 210 0 78 2 210 0 79 2 210 0 80 2 210 0 82 2 210 0 83 2 210 0 86 2 210 0 87 2 210 0 88 2 210 0 89 2 210 0 90 2 210 1 109] 
#[1 6 213 0 1 2 214 0 3 2 214 0 4 2 214 0 5 2 214 0 6 6 217 0 7 1 31 0 8 2 214 0 9 2 214 0 10 2 214 0 11 2 214 0 13 1 35 0 16 2 214 0 17 2 214 0 20 2 214 0 21 2 214 0 22 2 214 0 23 2 214 0 24 2 214 0 25 2 214 0 26 2 214 0 27 2 214 0 29 2 214 0 30 2 214 0 31 2 214 0 32 2 214 0 33 2 214 0 34 2 214 0 35 2 214 0 37 2 214 0 41 2 214 0 42 2 214 0 43 2 214 0 44 2 214 0 46 2 214 0 47 2 214 0 48 2 214 0 50 2 214 0 52 2 214 0 54 2 214 0 55 2 214 0 57 2 214 0 58 2 214 0 59 2 214 0 63 2 214 0 64 2 214 0 66 2 214 0 68 2 214 0 69 2 214 0 70 2 214 0 71 2 214 0 72 2 214 0 73 2 214 0 74 2 214 0 75 2 214 0 76 2 214 0 77 2 214 0 78 2 214 0 79 2 214 0 80 2 214 0 82 2 214 0 83 2 214 0 86 2 214 0 87 2 214 0 88 2 214 0 89 2 214 0 90 2 214 1 109] 
#[0 2 218 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 222 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 226 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 230 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 234 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 238 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 242 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 70 0 1 0 70 0 3 0 70 0 4 0 70 0 5 0 70 0 6 0 70 0 8 0 70 0 9 0 70 0 10 0 70 0 11 2 221 0 12 0 70 0 13 0 70 0 16 0 70 0 17 0 70 0 20 0 70 0 21 0 70 0 22 0 70 0 23 0 70 0 24 0 70 0 25 0 70 0 26 0 70 0 27 0 70 0 29 0 70 0 30 0 70 0 31 0 70 0 32 0 70 0 33 0 70 0 34 0 70 0 35 0 70 0 37 0 70 0 41 0 70 0 42 0 70 0 43 0 70 0 44 0 70 0 46 0 70 0 47 0 70 0 48 0 70 0 50 0 70 0 52 0 70 0 54 0 70 0 55 0 70 0 57 0 70 0 58 0 70 0 59 0 70 0 63 0 70 0 64 0 70 0 66 0 70 0 68 0 70 0 69 0 70 0 70 0 70 0 71 0 70 0 72 0 70 0 73 0 70 0 74 0 70 0 75 0 70 0 76 0 70 0 77 0 70 0 78 0 70 0 79 0 70 0 80 0 70 0 82 0 70 0 83 0 70 0 86 0 70 0 87 0 70 0 88 0 70 0 89 0 70 0 90 2 225 0 136 7 221 1 73 0 70 1 109] 
#[0 2 246 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 1 50 0 6 0 21] 
#[1 4 169 0 6 7 225 0 21] 
#[0 2 250 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 2 254 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 3 2 0 10 0 12 0 82] 
#[1 0 134 0 10 3 69 0 12 0 134 0 82 3 73 0 128 7 229 1 74] 
#[0 3 6 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 3 10 0 86 0 90] 
#[0 3 14 0 86 0 90] 
#[0 3 18 0 86 0 90] 
#[0 3 22 0 86 0 90] 
#[0 3 26 0 86 0 90] 
#[0 3 30 0 86 0 90] 
#[0 3 34 0 86 0 90] 
#[0 3 38 0 86 0 90] 
#[1 7 233 0 86 7 237 0 90 7 241 0 147 7 245 0 148] 
#[0 3 42 0 10 0 82] 
#[1 4 37 0 10 0 254 0 82 4 41 1 54 7 249 1 107] 
#[0 3 46 0 10 0 12 0 82] 
#[1 0 134 0 10 3 69 0 12 0 134 0 82 3 73 0 128 7 253 1 74] 
#[0 3 50 0 7] 
#[0 3 54 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[0 3 58 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[0 3 62 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[0 3 66 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[0 3 70 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[0 3 74 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[0 3 78 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[0 3 82 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[0 3 86 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[0 3 90 0 31 0 44 0 54 0 55 0 57 0 59 0 68 0 74 0 75 0 76 0 77 0 78] 
#[1 8 1 0 10 8 5 0 82] 
#[0 3 94 0 4 0 12] 
#[0 3 98 0 86 0 90] 
#[1 0 9 0 3 3 21 0 4 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 2 41 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 8 9 0 150 3 33 0 151 3 41 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 2 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 113 1 106] 
#[0 3 102 0 3 0 4 0 8 0 20 0 22 0 23 0 24 0 25 0 26 0 52 0 54 0 66 0 71 0 77 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 3 106 0 5 0 6] 
#[0 3 110 0 5 0 6] 
#[1 6 85 0 4 1 254 0 5 6 89 0 20 6 93 0 82 6 97 0 86 0 113 0 87 0 117 0 88 0 133 0 89 6 101 0 90 0 133 0 94 6 105 0 95 6 109 0 249 6 113 0 250 8 13 1 60] 
#[1 6 85 0 4 6 89 0 20 1 254 0 21 6 93 0 82 6 97 0 86 0 113 0 87 0 117 0 88 0 133 0 89 6 101 0 90 0 133 0 94 6 105 0 95 6 109 0 249 6 113 0 250 8 17 1 60] 
#[1 6 85 0 4 6 89 0 20 6 93 0 82 1 254 0 83 6 97 0 86 0 113 0 87 0 117 0 88 0 133 0 89 6 101 0 90 0 133 0 94 6 105 0 95 6 109 0 249 6 113 0 250 8 21 1 60] 
#[0 3 114 0 4 0 5 0 20 0 21 0 82 0 83 0 86 0 87 0 88 0 89 0 90] 
#[0 3 118 0 4 0 5 0 20 0 21 0 82 0 83 0 86 0 87 0 88 0 89 0 90] 
#[0 3 122 0 4 0 5 0 20 0 21 0 82 0 83 0 86 0 87 0 88 0 89 0 90] 
#[1 6 85 0 4 3 126 0 5 6 89 0 20 3 126 0 21 6 93 0 82 3 126 0 83 6 97 0 86 0 113 0 87 0 117 0 88 0 133 0 89 6 101 0 90 0 133 0 94 6 105 0 95 8 25 0 250] 
#[0 3 130 0 4 0 5 0 20 0 21 0 82 0 83 0 86 0 87 0 88 0 89 0 90] 
#[0 8 29 0 5] 
#[0 3 134 0 6 0 21] 
#[0 0 226 0 6 0 21] 
#[0 3 138 0 21] 
#[0 4 1 0 10] 
#[0 3 142 0 21] 
#[0 3 146 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 39 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 81 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 3 150 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 3 154 0 6 0 13 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[1 8 33 0 6 3 158 0 13 3 158 0 17 3 158 0 31 3 158 0 33 3 158 0 44 3 158 0 50 3 158 0 55 3 158 0 57 3 158 0 59 3 158 0 68 3 158 0 70 3 158 0 73 3 158 0 74 3 158 0 75 3 158 0 76 3 158 0 77 3 158 0 78 3 158 0 82 3 158 0 83] 
#[1 3 162 0 17 3 162 0 31 3 162 0 33 3 162 0 35 3 162 0 41 3 162 0 44 3 162 0 47 3 162 0 50 3 162 0 54 3 162 0 55 3 162 0 57 3 162 0 58 3 162 0 59 3 162 0 63 3 162 0 68 3 162 0 69 3 162 0 70 3 162 0 73 3 162 0 74 3 162 0 75 3 162 0 76 3 162 0 77 3 162 0 78 1 39 0 83 3 162 0 86 8 37 0 140 8 41 1 66] 
#[0 3 170 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 2 17 0 86 8 45 1 38 2 17 1 39] 
#[1 0 9 0 3 3 21 0 4 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 2 41 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 4 57 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 8 49 0 239 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 2 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 113 1 106] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 58 0 11 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 8 53 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 8 53 1 71] 
#[0 3 174 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 3 178 0 5] 
#[1 2 126 0 5 8 57 0 6 8 61 0 9 8 61 1 69] 
#[0 3 182 0 5 0 6 0 9] 
#[1 1 90 0 4 1 90 0 20 8 65 0 51 1 90 0 63 1 90 0 86 8 65 1 82] 
#[0 8 73 0 86 1 44] 
#[0 8 77 0 5] 
#[1 6 213 0 1 6 217 0 7 6 221 0 8 8 81 0 10 6 225 0 16 8 85 0 21] 
#[1 3 186 0 15 2 17 0 86 8 97 1 38 2 17 1 39 8 93 1 51 8 97 1 52 8 101 1 89] 
#[0 3 190 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 8 105 1 36 8 105 1 38 2 17 1 39 8 105 1 40 8 105 1 45 8 105 1 46 8 105 1 47 8 105 1 48 8 105 1 49 8 105 1 50 8 105 1 53] 
#[1 8 109 0 18 8 113 0 19] 
#[0 3 194 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 6 213 0 1 3 198 0 3 3 198 0 4 3 198 0 5 3 198 0 6 6 217 0 7 1 43 0 8 3 198 0 10 3 198 0 11 3 198 0 13 6 225 0 16 3 198 0 17 3 198 0 20 3 198 0 22 3 198 0 23 3 198 0 24 3 198 0 25 3 198 0 26 3 198 0 27 3 198 0 29 3 198 0 30 3 198 0 31 3 198 0 32 3 198 0 33 3 198 0 34 3 198 0 35 3 198 0 37 3 198 0 41 3 198 0 42 3 198 0 43 3 198 0 44 3 198 0 46 3 198 0 47 3 198 0 48 3 198 0 50 3 198 0 54 3 198 0 55 3 198 0 57 3 198 0 58 3 198 0 59 3 198 0 63 3 198 0 64 3 198 0 66 3 198 0 68 3 198 0 69 3 198 0 70 3 198 0 71 3 198 0 72 3 198 0 73 3 198 0 74 3 198 0 75 3 198 0 76 3 198 0 77 3 198 0 78 3 198 0 79 3 198 0 80 3 198 0 82 3 198 0 83 3 198 0 86 3 198 0 87 3 198 0 88 3 198 0 89 3 198 0 90 3 198 1 109] 
#[1 2 1 0 82 8 117 0 144] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 8 121 1 36 8 121 1 38 2 17 1 39 8 121 1 40 8 121 1 45 8 121 1 46 8 121 1 47 8 121 1 48 8 121 1 49 8 121 1 50 8 121 1 53] 
#[0 3 202 0 6 0 11 0 21] 
#[0 8 125 0 11] 
#[0 3 206 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 3 210 0 3 1 47 0 4 3 210 0 5 3 210 0 6 3 210 0 8 3 210 0 10 3 210 0 11 3 210 0 13 3 210 0 17 3 210 0 20 3 210 0 22 3 210 0 23 3 210 0 24 3 210 0 25 3 210 0 26 3 210 0 27 3 210 0 29 3 210 0 30 3 210 0 31 3 210 0 32 3 210 0 33 3 210 0 34 3 210 0 35 3 210 0 37 3 210 0 41 3 210 0 42 3 210 0 43 3 210 0 44 3 210 0 46 3 210 0 47 3 210 0 48 3 210 0 50 3 210 0 54 3 210 0 55 3 210 0 57 3 210 0 58 3 210 0 59 3 210 0 63 3 210 0 64 3 210 0 66 3 210 0 68 3 210 0 69 3 210 0 70 3 210 0 71 3 210 0 72 3 210 0 73 3 210 0 74 3 210 0 75 3 210 0 76 3 210 0 77 3 210 0 78 3 210 0 79 3 210 0 80 3 210 0 82 3 210 0 83 3 210 0 86 3 210 0 87 3 210 0 88 3 210 0 89 3 210 0 90 8 133 0 237 8 137 1 100 3 210 1 109] 
#[1 0 73 0 46 2 1 0 82 8 141 0 109 8 145 0 144] 
#[0 3 214 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 3 218 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 3 222 0 28 8 149 0 61 1 51 0 83 8 153 0 228 8 157 0 229 8 161 1 80 8 165 1 87] 
#[0 8 169 0 83] 
#[0 8 173 0 83] 
#[0 3 230 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 3 234 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 3 21 0 4 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 2 41 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 8 177 0 116 8 181 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 2 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 113 1 106] 
#[0 8 185 0 10] 
#[1 7 33 0 30 7 37 0 34 3 238 0 83 8 189 0 114 7 49 0 115 7 53 0 117] 
#[0 3 242 0 30 0 34 0 83] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 8 193 0 11 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 0 6 0 31 0 53 0 32 0 6 0 33 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 0 145 0 99 8 197 0 100 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 8 201 0 11 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 0 6 0 31 0 53 0 32 0 6 0 33 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 0 145 0 99 8 205 0 100 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59] 
#[0 8 209 0 83] 
#[1 1 90 0 2 0 6 0 4 0 21 0 17 0 6 0 20 1 90 0 22 4 253 0 51 1 90 0 54 0 6 0 63 1 90 0 77 0 187 0 86 8 213 0 179 1 57 0 245 1 61 0 248 4 249 1 59 4 253 1 82] 
#[0 3 246 0 5] 
#[0 8 217 0 5] 
#[1 6 213 0 1 3 250 0 5 3 250 0 6 6 217 0 7 6 221 0 8 3 250 0 9 6 225 0 16] 
#[0 3 254 0 2 0 22 0 86] 
#[1 8 225 0 2 4 2 0 22 4 2 0 86 8 225 1 78] 
#[1 8 229 0 2 4 2 0 22 4 2 0 86 8 229 1 78] 
#[0 8 233 0 21] 
#[0 4 6 0 6 0 7 0 48] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 8 237 1 36 8 237 1 38 2 17 1 39 8 237 1 40 8 237 1 45 8 237 1 46 8 237 1 47 8 237 1 48 8 237 1 49 8 237 1 50 8 237 1 53] 
#[0 4 10 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 4 14 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 8 241 0 48] 
#[0 8 245 0 48] 
#[0 4 18 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 8 249 0 138 5 65 1 36 5 65 1 38 2 17 1 39 5 65 1 40 5 65 1 45 5 65 1 46 5 65 1 47 5 65 1 48 5 65 1 49 5 65 1 50 5 65 1 53] 
#[0 4 22 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 26 0 3 0 4 0 6 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 30 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 34 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 38 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 8 253 0 82 9 1 0 163] 
#[0 4 42 0 3 0 4 0 6 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 2 1 0 82 9 9 0 144 9 9 0 175] 
#[1 2 189 0 4 5 25 0 7 1 98 0 17 1 98 0 31 1 98 0 33 1 98 0 44 1 98 0 50 1 98 0 55 1 98 0 57 1 98 0 59 1 98 0 68 1 98 0 70 1 98 0 73 1 98 0 74 1 98 0 75 1 98 0 76 1 98 0 77 1 98 0 78 1 98 0 82 1 98 0 83 5 29 0 174 9 13 0 177 9 17 1 77] 
#[1 5 109 0 86 9 21 0 130 5 109 1 39] 
#[1 2 17 0 86 9 25 0 132 9 29 0 133 9 33 0 134 9 37 0 135 9 41 1 38 2 17 1 39] 
#[0 4 46 0 15] 
#[0 9 45 0 15] 
#[1 4 89 0 63 2 17 0 86 9 49 1 38 2 17 1 39 9 53 1 50] 
#[0 4 50 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 54 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 6 213 0 1 6 217 0 7 6 221 0 8 6 225 0 16 4 58 0 82] 
#[1 0 21 0 17 0 6 0 67 4 62 0 83 9 57 0 158 1 57 0 245 1 61 0 248 9 61 1 59 9 65 1 95] 
#[1 0 21 0 17 0 6 0 45 9 69 0 157 1 57 0 245 1 61 0 248 9 73 1 59] 
#[1 0 21 0 17 0 6 0 67 4 66 0 83 9 77 0 162 1 57 0 245 1 61 0 248 9 81 1 59 9 85 1 96] 
#[1 0 21 0 17 0 6 0 45 9 89 0 161 1 57 0 245 1 61 0 248 9 93 1 59] 
#[1 0 151 0 31 3 221 0 33 3 181 0 35 0 155 0 44 9 97 0 45 3 185 0 47 0 190 0 50 0 155 0 54 0 182 0 55 0 182 0 57 0 182 0 59 3 189 0 63 9 101 0 67 0 182 0 68 3 193 0 69 3 197 0 70 0 182 0 74 0 182 0 75 0 182 0 76 0 155 0 77 0 182 0 78 3 213 0 86 3 205 0 141 3 209 0 184 3 213 0 190 3 217 0 192 3 221 1 64 3 225 1 65] 
#[0 4 70 0 3 0 4 0 8 0 20 0 22 0 23 0 24 0 25 0 26 0 66 0 71 0 82 0 86 0 87 0 88 0 89 0 90] 
#[1 6 213 0 1 4 74 0 3 4 74 0 4 4 74 0 5 4 74 0 6 6 217 0 7 1 55 0 8 4 74 0 9 4 74 0 10 4 74 0 11 4 74 0 13 1 59 0 16 4 74 0 17 4 74 0 20 4 74 0 21 4 74 0 22 4 74 0 23 4 74 0 24 4 74 0 25 4 74 0 26 4 74 0 27 4 74 0 29 4 74 0 30 4 74 0 31 4 74 0 32 4 74 0 33 4 74 0 34 4 74 0 35 4 74 0 37 4 74 0 41 4 74 0 42 4 74 0 43 4 74 0 44 4 74 0 46 4 74 0 47 4 74 0 48 4 74 0 50 4 74 0 52 4 74 0 54 4 74 0 55 4 74 0 57 4 74 0 58 4 74 0 59 4 74 0 63 4 74 0 64 4 74 0 66 4 74 0 68 4 74 0 69 4 74 0 70 4 74 0 71 4 74 0 72 4 74 0 73 4 74 0 74 4 74 0 75 4 74 0 76 4 74 0 77 4 74 0 78 4 74 0 79 4 74 0 80 4 74 0 82 4 74 0 83 4 74 0 86 4 74 0 87 4 74 0 88 4 74 0 89 4 74 0 90 4 74 1 109] 
#[0 4 78 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 82 0 1 0 3 0 4 0 5 0 6 0 8 0 9 0 10 0 11 0 13 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 4 37 0 10 0 254 0 82 4 41 1 54 9 105 1 107] 
#[0 4 86 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 90 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 4 94 0 3 4 94 0 4 1 63 0 8 4 94 0 11 4 94 0 17 4 94 0 20 4 94 0 22 4 94 0 23 4 94 0 24 4 94 0 25 4 94 0 26 4 94 0 29 4 94 0 30 4 94 0 31 4 94 0 32 4 94 0 33 4 94 0 34 4 94 0 35 4 94 0 37 4 94 0 41 4 94 0 42 4 94 0 43 4 94 0 44 4 94 0 46 4 94 0 47 4 94 0 50 4 94 0 54 4 94 0 55 4 94 0 57 4 94 0 58 4 94 0 59 4 94 0 63 4 94 0 64 4 94 0 66 4 94 0 68 4 94 0 69 4 94 0 70 4 94 0 71 4 94 0 72 4 94 0 73 4 94 0 74 4 94 0 75 4 94 0 76 4 94 0 77 4 94 0 78 4 94 0 80 4 94 0 82 4 94 0 83 4 94 0 86 4 94 0 87 4 94 0 88 4 94 0 89 4 94 0 90 4 94 1 109] 
#[0 4 98 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 9 113 0 82 9 117 0 207] 
#[1 4 37 0 10 0 254 0 82 4 41 1 54 9 121 1 107] 
#[1 2 17 0 86 9 125 1 38 2 17 1 39] 
#[1 0 21 0 17 0 6 0 30 0 6 0 31 0 6 0 33 0 6 0 35 0 61 0 41 0 6 0 44 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 6 0 68 0 6 0 69 0 6 0 70 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 4 102 0 83 0 6 0 86 9 129 0 139 9 129 0 145 9 129 0 149 9 129 0 153 0 237 0 154 9 129 0 166 0 245 0 167 9 129 0 170 0 253 0 171 9 129 0 183 9 133 0 185 9 137 0 186 9 141 0 187 9 129 0 199 9 129 0 202 9 129 0 205 9 129 0 215 1 21 0 216 9 129 0 218 9 129 0 219 9 129 0 221 1 37 0 222 9 129 0 224 9 129 0 225 9 129 0 226 9 129 0 227 1 57 0 245 1 61 0 248 9 145 1 59 9 149 1 108] 
#[1 4 106 0 3 4 106 0 4 5 73 0 6 4 106 0 8 4 106 0 11 4 106 0 17 4 106 0 20 4 106 0 22 4 106 0 23 4 106 0 24 4 106 0 25 4 106 0 26 4 106 0 29 4 106 0 30 4 106 0 31 4 106 0 32 4 106 0 33 4 106 0 34 4 106 0 35 4 106 0 37 4 106 0 41 4 106 0 42 4 106 0 43 4 106 0 44 4 106 0 46 4 106 0 47 4 106 0 50 4 106 0 54 4 106 0 55 4 106 0 57 4 106 0 58 4 106 0 59 4 106 0 63 4 106 0 64 4 106 0 66 4 106 0 68 4 106 0 69 4 106 0 70 4 106 0 71 4 106 0 72 4 106 0 73 4 106 0 74 4 106 0 75 4 106 0 76 4 106 0 77 4 106 0 78 4 106 0 80 4 106 0 82 4 106 0 83 4 106 0 86 4 106 0 87 4 106 0 88 4 106 0 89 4 106 0 90 4 106 1 109] 
#[0 9 153 0 5] 
#[0 9 157 0 21] 
#[0 9 161 0 83] 
#[0 4 110 0 4 0 5 0 20 0 21 0 82 0 83 0 86 0 87 0 88 0 89 0 90] 
#[0 4 114 0 4 0 17 0 20 0 30 0 31 0 33 0 35 0 36 0 44 0 45 0 47 0 50 0 51 0 54 0 55 0 57 0 59 0 63 0 67 0 68 0 69 0 70 0 74 0 75 0 76 0 77 0 78 0 81 0 86] 
#[1 2 17 0 86 9 165 1 38 2 17 1 39] 
#[1 0 21 0 17 0 6 0 31 0 6 0 33 0 6 0 35 0 61 0 41 0 6 0 44 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 6 0 68 0 6 0 69 0 6 0 70 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 4 118 0 83 0 6 0 86 9 169 0 139 9 169 0 145 9 169 0 149 9 169 0 153 0 237 0 154 9 169 0 166 0 245 0 167 9 169 0 170 0 253 0 171 9 169 0 183 9 169 0 199 9 169 0 202 9 169 0 205 9 169 0 215 1 21 0 216 9 169 0 218 9 169 0 219 9 169 0 221 1 37 0 222 9 169 0 224 9 169 0 225 9 169 0 226 9 169 0 227 1 57 0 245 1 61 0 248 1 165 1 59] 
#[0 9 173 0 83] 
#[0 4 122 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 14 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 126 0 5 0 6] 
#[0 9 177 0 11] 
#[1 0 6 0 4 0 21 0 17 0 6 0 20 0 255 0 51 0 6 0 63 0 187 0 86 1 57 0 245 1 61 0 248 9 181 1 43 6 193 1 59 6 197 1 82] 
#[0 4 130 0 5] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 9 185 1 36 9 185 1 38 2 17 1 39 9 185 1 40 9 185 1 45 9 185 1 46 9 185 1 47 9 185 1 48 9 185 1 49 9 185 1 50 9 185 1 53] 
#[0 4 134 0 10] 
#[1 4 149 0 10 9 189 1 37] 
#[0 4 138 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 4 81 0 4 4 85 0 20 4 89 0 63 2 17 0 86 9 193 1 36 9 193 1 38 2 17 1 39 9 193 1 40 9 193 1 45 9 193 1 46 9 193 1 47 9 193 1 48 9 193 1 49 9 193 1 50 9 193 1 53] 
#[0 4 142 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 146 0 6 0 15] 
#[1 9 197 0 6 4 150 0 15] 
#[0 4 154 0 6 0 15] 
#[0 9 201 0 15] 
#[1 1 67 0 1 4 158 0 3 4 158 0 4 4 158 0 5 4 158 0 6 1 71 0 7 1 75 0 8 4 158 0 9 4 158 0 10 4 158 0 11 4 158 0 13 4 158 0 15 1 79 0 16 4 158 0 17 4 158 0 20 4 158 0 21 4 158 0 22 4 158 0 23 4 158 0 24 4 158 0 25 4 158 0 26 4 158 0 27 4 158 0 29 4 158 0 30 4 158 0 31 4 158 0 32 4 158 0 33 4 158 0 34 4 158 0 35 4 158 0 37 4 158 0 41 4 158 0 42 4 158 0 43 4 158 0 44 4 158 0 46 4 158 0 47 4 158 0 48 4 158 0 50 4 158 0 52 4 158 0 54 4 158 0 55 4 158 0 57 4 158 0 58 4 158 0 59 4 158 0 63 4 158 0 64 4 158 0 66 4 158 0 68 4 158 0 69 4 158 0 70 4 158 0 71 4 158 0 72 4 158 0 73 4 158 0 74 4 158 0 75 4 158 0 76 4 158 0 77 4 158 0 78 4 158 0 79 4 158 0 80 4 158 0 82 4 158 0 83 4 158 0 86 4 158 0 87 4 158 0 88 4 158 0 89 4 158 0 90 4 158 1 109] 
#[0 4 162 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 166 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 170 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 6 213 0 1 4 174 0 3 4 174 0 4 4 174 0 5 4 174 0 6 6 217 0 7 1 83 0 8 4 174 0 9 4 174 0 10 4 174 0 11 4 174 0 13 6 225 0 16 4 174 0 17 4 174 0 20 4 174 0 22 4 174 0 23 4 174 0 24 4 174 0 25 4 174 0 26 4 174 0 27 4 174 0 29 4 174 0 30 4 174 0 31 4 174 0 32 4 174 0 33 4 174 0 34 4 174 0 35 4 174 0 37 4 174 0 41 4 174 0 42 4 174 0 43 4 174 0 44 4 174 0 46 4 174 0 47 4 174 0 48 4 174 0 50 4 174 0 54 4 174 0 55 4 174 0 57 4 174 0 58 4 174 0 59 4 174 0 63 4 174 0 64 4 174 0 66 4 174 0 68 4 174 0 69 4 174 0 70 4 174 0 71 4 174 0 72 4 174 0 73 4 174 0 74 4 174 0 75 4 174 0 76 4 174 0 77 4 174 0 78 4 174 0 79 4 174 0 80 4 174 0 82 4 174 0 83 4 174 0 86 4 174 0 87 4 174 0 88 4 174 0 89 4 174 0 90 4 174 1 109] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 71 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 9 205 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 9 205 1 71] 
#[1 0 9 0 3 3 21 0 4 1 2 0 5 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 2 41 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 4 57 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 4 61 0 238 4 65 0 239 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 2 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 4 77 1 101 2 113 1 106] 
#[0 4 178 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 182 0 3 0 4 0 5 0 6 0 8 0 10 0 11 0 13 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 186 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 186 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 9 213 0 87 0 230] 
#[0 4 190 0 83] 
#[0 4 194 0 28 0 83] 
#[0 9 217 0 83] 
#[1 9 221 0 28 4 198 0 83 9 225 0 231 9 229 1 57] 
#[0 4 202 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 206 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 9 233 0 6 9 237 0 10] 
#[1 4 210 0 6 4 210 0 10 4 141 0 27 9 241 0 79 9 245 0 118 9 249 1 75] 
#[0 4 214 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 4 218 0 30 0 34 0 83] 
#[0 4 222 0 30 0 34 0 83] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 4 226 0 30 0 6 0 31 0 53 0 32 0 6 0 33 4 226 0 34 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 4 226 0 83 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 237 0 99 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59] 
#[0 4 230 0 30 0 34 0 83] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 21 0 17 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 49 0 29 4 234 0 30 0 6 0 31 0 53 0 32 0 6 0 33 4 234 0 34 0 6 0 35 0 57 0 37 0 61 0 41 0 65 0 42 0 69 0 43 0 6 0 44 0 73 0 46 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 81 0 64 0 85 0 66 0 6 0 68 0 6 0 69 0 6 0 70 0 89 0 71 0 93 0 72 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 0 101 0 80 0 105 0 82 4 234 0 83 0 7 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 2 237 0 99 0 153 0 101 0 153 0 102 0 153 0 104 0 153 0 105 0 153 0 107 0 173 0 108 0 173 0 109 0 173 0 112 0 185 0 120 0 189 0 121 0 193 0 122 0 197 0 123 0 197 0 124 0 197 0 125 0 197 0 126 0 197 0 127 0 217 0 139 0 217 0 145 0 217 0 149 0 217 0 153 0 237 0 154 0 217 0 166 0 245 0 167 0 217 0 170 0 253 0 171 0 217 0 183 0 217 0 199 0 217 0 202 0 217 0 205 0 217 0 215 1 21 0 216 0 217 0 218 0 217 0 219 0 217 0 221 1 37 0 222 0 217 0 224 0 217 0 225 0 217 0 226 0 217 0 227 1 57 0 245 1 61 0 248 1 65 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 1 165 1 59] 
#[0 4 238 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 4 242 0 5 0 6 0 9] 
#[0 4 246 0 4 0 7 0 17 0 31 0 33 0 44 0 48 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[0 4 250 0 22 0 86] 
#[1 9 253 0 22 10 1 0 86 10 5 0 180] 
#[1 9 253 0 22 10 1 0 86 10 9 0 180] 
#[0 4 254 0 4 0 48 0 86] 
#[1 6 213 0 1 6 217 0 7 6 221 0 8 6 225 0 16 5 2 0 17 5 2 0 31 5 2 0 33 5 2 0 44 5 2 0 48 5 2 0 50 5 2 0 55 5 2 0 57 5 2 0 59 5 2 0 68 5 2 0 70 5 2 0 73 5 2 0 74 5 2 0 75 5 2 0 76 5 2 0 77 5 2 0 78 5 2 0 82 5 2 0 83] 
#[0 5 6 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 5 10 0 3 0 4 0 8 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 5 14 0 6 0 15] 
#[1 0 21 0 17 0 6 0 36 0 6 0 81 10 13 0 164 10 17 0 165 1 57 0 245 1 61 0 248 10 21 1 59] 
#[0 5 18 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 5 22 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 5 26 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 5 30 0 4 0 7 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[0 5 34 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[0 5 38 0 6 0 15 0 79] 
#[1 10 25 0 6 5 42 0 15] 
#[0 5 46 0 6 0 15] 
#[0 5 50 0 6 0 15] 
#[0 5 54 0 6 0 15] 
#[1 10 29 0 10 10 33 0 14] 
#[0 5 58 0 4 0 7 0 10 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[0 5 62 0 6 0 15 0 79] 
#[0 5 62 0 6 0 15 0 79] 
#[0 5 66 0 83] 
#[0 10 37 0 67] 
#[0 10 41 0 83] 
#[0 10 45 0 83] 
#[0 10 49 0 45] 
#[0 5 70 0 83] 
#[0 10 53 0 67] 
#[0 10 57 0 83] 
#[0 10 61 0 83] 
#[0 10 65 0 45] 
#[1 5 74 0 17 5 74 0 67 2 1 0 82 5 74 0 83 10 69 0 144] 
#[1 10 73 0 4 5 78 0 17 5 78 0 45 5 82 0 82 10 77 0 159 10 81 1 97] 
#[1 10 85 0 82 10 89 0 204] 
#[1 7 233 0 86 7 237 0 90 10 93 0 148] 
#[1 0 21 0 17 0 6 0 31 0 6 0 33 0 6 0 44 0 6 0 50 0 6 0 55 0 6 0 57 0 6 0 59 0 6 0 68 0 6 0 70 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 5 86 0 83 10 97 0 154 10 101 0 167 10 105 0 171 10 109 0 208 10 113 0 209 10 109 0 210 10 109 0 211 10 109 0 212 10 109 0 213 10 109 0 214 10 137 0 216 10 141 0 222 1 57 0 245 1 61 0 248 10 145 1 59 10 149 1 90] 
#[0 5 90 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 10 153 0 82 10 157 0 201] 
#[0 10 161 0 82] 
#[0 5 94 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[1 0 21 0 17 0 6 0 30 0 6 0 31 0 6 0 33 0 6 0 35 0 61 0 41 0 6 0 44 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 6 0 68 0 6 0 69 0 6 0 70 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 5 98 0 83 0 6 0 86 9 129 0 139 9 129 0 145 9 129 0 149 9 129 0 153 0 237 0 154 9 129 0 166 0 245 0 167 9 129 0 170 0 253 0 171 9 129 0 183 10 165 0 186 9 141 0 187 9 129 0 199 9 129 0 202 9 129 0 205 9 129 0 215 1 21 0 216 9 129 0 218 9 129 0 219 9 129 0 221 1 37 0 222 9 129 0 224 9 129 0 225 9 129 0 226 9 129 0 227 1 57 0 245 1 61 0 248 9 145 1 59] 
#[0 5 102 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[0 5 106 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[1 10 169 0 30 0 151 0 31 3 221 0 33 3 181 0 35 0 155 0 44 3 185 0 47 0 190 0 50 0 155 0 54 0 182 0 55 0 182 0 57 0 182 0 59 3 189 0 63 0 182 0 68 3 193 0 69 3 197 0 70 0 182 0 74 0 182 0 75 0 182 0 76 0 155 0 77 0 182 0 78 3 213 0 86 3 205 0 141 3 209 0 184 3 213 0 190 3 217 0 192 3 221 1 64 3 225 1 65] 
#[0 10 173 0 83] 
#[0 5 110 0 4 0 5 0 20 0 21 0 82 0 83 0 86 0 87 0 88 0 89 0 90] 
#[0 5 114 0 4 0 5 0 20 0 21 0 82 0 83 0 86 0 87 0 88 0 89 0 90] 
#[0 5 118 0 4 0 5 0 20 0 21 0 82 0 83 0 86 0 87 0 88 0 89 0 90] 
#[0 5 122 0 6 0 13 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 82 0 83] 
#[0 5 126 0 17 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[0 5 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 0 13 0 4 0 58 0 5 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 10 177 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 10 177 1 71] 
#[0 5 134 0 5 0 6 0 9] 
#[1 6 213 0 1 5 138 0 5 5 138 0 6 6 217 0 7 6 221 0 8 5 138 0 9 6 225 0 16] 
#[0 5 142 0 5 0 6 0 9] 
#[1 6 213 0 1 6 217 0 7 6 221 0 8 6 225 0 16 10 181 0 21] 
#[1 2 17 0 86 10 185 1 38 2 17 1 39 10 185 1 52] 
#[0 5 146 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 2 1 0 82 10 189 0 144] 
#[0 5 150 0 28 0 83] 
#[0 5 154 0 28 0 83] 
#[0 5 158 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 10 193 0 53 10 197 0 56 10 201 0 65 10 205 0 232] 
#[0 5 162 0 83] 
#[0 5 166 0 83] 
#[1 0 9 0 3 3 21 0 4 0 15 0 8 0 25 0 20 2 25 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 2 29 0 52 2 33 0 54 0 85 0 66 0 89 0 71 2 37 0 77 0 105 0 82 2 41 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 10 209 0 233 2 57 0 234 2 61 0 235 2 65 0 236 2 69 0 237 2 73 0 240 2 77 0 241 2 81 0 242 2 85 0 243 2 89 0 244 2 89 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35 2 113 1 38 2 17 1 39 2 113 1 106] 
#[0 5 170 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 31 0 32 0 33 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 10 213 0 119 10 213 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 5 174 0 6 0 10] 
#[0 5 178 0 6 0 10] 
#[0 5 182 0 10 0 22 0 86] 
#[0 5 186 0 10 0 22 0 86] 
#[1 5 190 0 10 10 221 0 22 10 225 0 86 10 229 0 181 10 233 1 85] 
#[1 5 190 0 10 10 221 0 22 10 225 0 86 10 229 0 181 10 237 1 85] 
#[1 0 21 0 17 0 6 0 36 5 194 0 83 10 241 0 165 1 57 0 245 1 61 0 248 10 245 1 59 10 249 1 68] 
#[1 0 21 0 17 0 6 0 81 10 253 0 164 1 57 0 245 1 61 0 248 11 1 1 59] 
#[1 11 5 0 36 11 9 0 81] 
#[1 2 17 0 86 11 13 0 133 9 33 0 134 9 37 0 135 9 41 1 38 2 17 1 39] 
#[1 4 89 0 63 2 17 0 86 11 17 1 38 2 17 1 39 11 21 1 50] 
#[1 2 17 0 86 11 25 1 38 2 17 1 39] 
#[1 10 73 0 4 5 82 0 82 10 77 0 159 10 81 1 97] 
#[0 5 198 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 5 202 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 2 1 0 82 10 69 0 144] 
#[0 5 78 0 17 0 45 0 83] 
#[0 5 206 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 5 210 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 5 74 0 17 0 67 0 83] 
#[0 5 214 0 17 0 67 0 83] 
#[0 11 29 0 86] 
#[0 5 218 0 82] 
#[1 2 1 0 82 11 33 0 144] 
#[1 3 162 0 17 3 162 0 31 3 162 0 33 3 162 0 35 3 162 0 41 3 162 0 44 3 162 0 47 3 162 0 50 3 162 0 54 3 162 0 55 3 162 0 57 3 162 0 58 3 162 0 59 3 162 0 63 3 162 0 68 3 162 0 69 3 162 0 70 3 162 0 73 3 162 0 74 3 162 0 75 3 162 0 76 3 162 0 77 3 162 0 78 1 39 0 83 3 162 0 86 8 37 0 140 11 37 1 66] 
#[0 5 222 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 5 226 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 11 45 0 86 0 155] 
#[1 4 37 0 10 0 254 0 13 0 254 0 17 0 254 0 31 0 254 0 33 0 254 0 44 0 254 0 50 0 254 0 55 0 254 0 57 0 254 0 59 0 254 0 68 0 254 0 70 0 254 0 73 0 254 0 74 0 254 0 75 0 254 0 76 0 254 0 77 0 254 0 78 0 254 0 83 4 41 1 54 11 49 1 107] 
#[1 3 57 0 86 3 61 0 90 11 53 0 172] 
#[0 5 230 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[1 0 21 0 17 0 6 0 31 0 6 0 33 0 6 0 44 0 6 0 50 0 6 0 55 0 6 0 57 0 6 0 59 0 6 0 68 0 6 0 70 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 5 234 0 83 10 97 0 154 10 101 0 167 10 105 0 171 11 57 0 208 11 57 0 210 11 57 0 211 11 57 0 212 11 57 0 213 11 57 0 214 10 137 0 216 10 141 0 222 1 57 0 245 1 61 0 248 10 145 1 59] 
#[0 5 238 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[0 5 238 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[0 5 238 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[0 5 238 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[0 5 238 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[1 0 134 0 4 3 69 0 12 3 73 0 128 11 61 1 74] 
#[1 3 81 0 7 11 65 0 223] 
#[1 0 182 0 31 3 221 0 33 0 155 0 44 0 190 0 50 0 182 0 55 0 182 0 57 0 182 0 59 0 182 0 68 3 197 0 70 0 182 0 74 0 182 0 75 0 182 0 76 0 155 0 77 0 182 0 78 3 205 0 141 3 221 1 64 11 69 1 65] 
#[0 11 73 0 83] 
#[1 3 162 0 17 3 162 0 31 3 162 0 33 3 162 0 35 3 162 0 41 3 162 0 44 3 162 0 47 3 162 0 50 3 162 0 54 3 162 0 55 3 162 0 57 3 162 0 58 3 162 0 59 3 162 0 63 3 162 0 68 3 162 0 69 3 162 0 70 3 162 0 73 3 162 0 74 3 162 0 75 3 162 0 76 3 162 0 77 3 162 0 78 1 39 0 83 3 162 0 86 8 37 0 140 11 77 1 66] 
#[0 5 242 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 21 0 17 0 6 0 30 0 6 0 31 0 6 0 33 0 6 0 35 0 61 0 41 0 6 0 44 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 6 0 68 0 6 0 69 0 6 0 70 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 5 246 0 83 0 6 0 86 11 81 0 139 11 81 0 145 11 81 0 149 11 81 0 153 0 237 0 154 11 81 0 166 0 245 0 167 11 81 0 170 0 253 0 171 11 81 0 183 11 85 0 193 11 89 0 194 11 93 0 195 11 81 0 199 11 81 0 202 11 81 0 205 11 81 0 215 1 21 0 216 11 81 0 218 11 81 0 219 11 81 0 221 1 37 0 222 11 81 0 224 11 81 0 225 11 81 0 226 11 81 0 227 1 57 0 245 1 61 0 248 11 97 1 59 11 101 1 92] 
#[0 5 250 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[1 11 113 0 86 11 105 0 188 11 109 0 189 11 113 0 191] 
#[0 5 254 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 11 117 0 5] 
#[0 6 2 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 13 0 15 0 16 0 17 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 48 0 50 0 52 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 6 6 0 6 0 15] 
#[0 6 10 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 6 14 0 83] 
#[0 6 18 0 83] 
#[0 6 22 0 83] 
#[0 6 26 0 83] 
#[1 4 210 0 6 4 210 0 10 4 141 0 27 9 241 0 79 9 245 0 118 11 121 1 75] 
#[0 6 30 0 6 0 10] 
#[0 6 34 0 6 0 10] 
#[0 6 38 0 10] 
#[0 6 42 0 10] 
#[0 6 46 0 10] 
#[1 4 149 0 10 11 125 1 37] 
#[1 4 149 0 10 11 129 1 37] 
#[0 6 50 0 83] 
#[0 11 5 0 36] 
#[0 11 133 0 83] 
#[0 11 137 0 83] 
#[0 11 9 0 81] 
#[1 10 73 0 4 5 82 0 82 10 77 0 159 11 141 1 97] 
#[1 10 73 0 4 5 82 0 82 10 77 0 159 11 145 1 97] 
#[0 6 54 0 6 0 15] 
#[0 6 58 0 6 0 15] 
#[0 6 58 0 6 0 15] 
#[0 6 62 0 6 0 15] 
#[0 11 149 0 5] 
#[0 6 66 0 17 0 45 0 83] 
#[0 11 153 0 83] 
#[0 1 142 0 10] 
#[1 4 149 0 10 11 157 1 37] 
#[1 3 49 0 13 6 70 0 17 6 70 0 31 6 70 0 33 6 70 0 44 6 70 0 50 6 70 0 55 6 70 0 57 6 70 0 59 6 70 0 68 6 70 0 70 6 70 0 73 6 70 0 74 6 70 0 75 6 70 0 76 6 70 0 77 6 70 0 78 6 70 0 83 11 161 0 169 11 165 1 104] 
#[1 0 134 0 4 0 134 0 7 3 69 0 12 0 134 0 17 0 134 0 31 0 134 0 33 0 134 0 44 0 134 0 50 0 134 0 55 0 134 0 57 0 134 0 59 0 134 0 68 0 134 0 70 0 134 0 73 0 134 0 74 0 134 0 75 0 134 0 76 0 134 0 77 0 134 0 78 0 134 0 83 3 73 0 128 11 169 1 74] 
#[0 6 74 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[1 2 189 0 4 11 173 0 177] 
#[1 11 177 0 82 11 181 0 160] 
#[1 6 65 0 44 6 73 0 77] 
#[0 6 78 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 11 185 0 83] 
#[0 6 82 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[1 0 21 0 17 0 6 0 30 0 6 0 31 0 6 0 33 0 6 0 35 0 61 0 41 0 6 0 44 0 6 0 47 0 6 0 50 0 6 0 54 0 6 0 55 0 6 0 57 0 77 0 58 0 6 0 59 0 6 0 63 0 6 0 68 0 6 0 69 0 6 0 70 0 97 0 73 0 6 0 74 0 6 0 75 0 6 0 76 0 6 0 77 0 6 0 78 6 86 0 83 0 6 0 86 11 81 0 139 11 81 0 145 11 81 0 149 11 81 0 153 0 237 0 154 11 81 0 166 0 245 0 167 11 81 0 170 0 253 0 171 11 81 0 183 11 189 0 194 11 93 0 195 11 81 0 199 11 81 0 202 11 81 0 205 11 81 0 215 1 21 0 216 11 81 0 218 11 81 0 219 11 81 0 221 1 37 0 222 11 81 0 224 11 81 0 225 11 81 0 226 11 81 0 227 1 57 0 245 1 61 0 248 11 97 1 59] 
#[0 6 90 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[0 6 94 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[1 11 193 0 30 0 151 0 31 3 221 0 33 3 181 0 35 0 155 0 44 3 185 0 47 0 190 0 50 0 155 0 54 0 182 0 55 0 182 0 57 0 182 0 59 3 189 0 63 0 182 0 68 3 193 0 69 3 197 0 70 0 182 0 74 0 182 0 75 0 182 0 76 0 155 0 77 0 182 0 78 3 213 0 86 3 205 0 141 3 209 0 184 3 213 0 190 3 217 0 192 3 221 1 64 3 225 1 65] 
#[0 11 197 0 83] 
#[1 11 201 0 6 6 98 0 17 6 98 0 30 6 98 0 31 6 98 0 33 6 98 0 35 6 98 0 41 6 98 0 44 6 98 0 47 6 98 0 50 6 98 0 54 6 98 0 55 6 98 0 57 6 98 0 58 6 98 0 59 6 98 0 63 6 98 0 68 6 98 0 69 6 98 0 70 6 98 0 73 6 98 0 74 6 98 0 75 6 98 0 76 6 98 0 77 6 98 0 78 6 98 0 83 6 98 0 86] 
#[0 6 102 0 6 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[1 4 81 0 4 6 106 0 6 6 106 0 17 6 106 0 30 6 106 0 31 6 106 0 33 6 106 0 35 6 106 0 41 6 106 0 44 6 106 0 47 6 106 0 50 6 106 0 54 6 106 0 55 6 106 0 57 6 106 0 58 6 106 0 59 6 106 0 63 6 106 0 68 6 106 0 69 6 106 0 70 6 106 0 73 6 106 0 74 6 106 0 75 6 106 0 76 6 106 0 77 6 106 0 78 6 106 0 83 6 106 0 86 11 209 1 40 11 209 1 102] 
#[1 2 1 0 82 11 213 0 144] 
#[0 6 110 0 6 0 10] 
#[1 6 114 0 5 6 114 0 6 6 114 0 9 11 217 0 13 11 221 0 182 11 225 1 67] 
#[1 6 114 0 5 6 114 0 6 6 114 0 9 11 217 0 13 11 221 0 182 11 229 1 67] 
#[0 6 118 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 6 122 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 2 1 0 82 11 233 0 144] 
#[1 2 1 0 82 11 237 0 144] 
#[0 6 126 0 82] 
#[0 6 130 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 11 177 0 82 11 241 0 160] 
#[0 6 134 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[0 6 138 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[1 2 182 0 4 2 182 0 7 2 182 0 17 2 182 0 31 2 182 0 33 2 182 0 44 2 182 0 50 2 182 0 55 2 182 0 57 2 182 0 59 2 182 0 68 2 182 0 70 2 182 0 73 2 182 0 74 2 182 0 75 2 182 0 76 2 182 0 77 2 182 0 78 2 182 0 83 11 245 0 173 7 157 0 176] 
#[0 6 142 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[1 0 21 0 17 0 6 0 45 0 6 0 67 7 201 0 161 7 205 0 162 1 57 0 245 1 61 0 248 11 249 1 59] 
#[0 6 146 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[0 6 150 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[0 6 154 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[1 11 253 0 86 11 253 0 191 12 1 0 196 12 5 0 197] 
#[0 6 158 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 11 113 0 86 12 9 0 189 11 113 0 191] 
#[0 6 162 0 6 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[0 6 166 0 6 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[0 6 170 0 3 0 4 0 8 0 11 0 17 0 20 0 22 0 23 0 24 0 25 0 26 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 37 0 41 0 42 0 43 0 44 0 46 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 64 0 66 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 82 0 83 0 86 0 87 0 88 0 89 0 90 1 109] 
#[1 0 9 0 3 0 13 0 4 0 17 0 8 0 25 0 20 0 29 0 22 0 33 0 23 0 37 0 24 0 41 0 25 0 45 0 26 0 85 0 66 0 89 0 71 0 105 0 82 1 213 0 86 0 113 0 87 0 117 0 88 0 133 0 89 0 141 0 90 0 133 0 94 0 137 0 95 0 141 0 97 12 13 0 251 1 69 0 253 1 69 0 254 1 77 1 4 1 77 1 5 1 85 1 6 1 89 1 9 1 77 1 12 1 77 1 13 1 77 1 14 1 77 1 15 1 77 1 16 1 77 1 17 1 77 1 21 1 77 1 22 1 77 1 25 1 129 1 26 1 133 1 27 1 137 1 29 1 141 1 30 1 145 1 31 1 149 1 32 1 153 1 33 1 157 1 34 1 161 1 35] 
#[0 6 174 0 5 0 6 0 9] 
#[0 6 178 0 5 0 6 0 9] 
#[0 6 182 0 5 0 6 0 9] 
#[0 6 186 0 17 0 81 0 83] 
#[0 6 190 0 17 0 36 0 83] 
#[0 6 194 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[0 6 198 0 17 0 31 0 33 0 44 0 50 0 55 0 57 0 59 0 68 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83] 
#[1 10 65 0 45 10 53 0 67] 
#[1 6 202 0 6 12 17 0 13 6 202 0 17 6 202 0 30 6 202 0 31 6 202 0 33 6 202 0 35 6 202 0 41 6 202 0 44 6 202 0 47 6 202 0 50 6 202 0 54 6 202 0 55 6 202 0 57 6 202 0 58 6 202 0 59 6 202 0 63 6 202 0 68 6 202 0 69 6 202 0 70 6 202 0 73 6 202 0 74 6 202 0 75 6 202 0 76 6 202 0 77 6 202 0 78 6 202 0 83 6 202 0 86 12 21 0 198 12 25 1 91] 
#[1 12 29 0 6 6 206 0 17 6 206 0 30 6 206 0 31 6 206 0 33 6 206 0 35 6 206 0 41 6 206 0 44 6 206 0 47 6 206 0 50 6 206 0 54 6 206 0 55 6 206 0 57 6 206 0 58 6 206 0 59 6 206 0 63 6 206 0 68 6 206 0 69 6 206 0 70 6 206 0 73 6 206 0 74 6 206 0 75 6 206 0 76 6 206 0 77 6 206 0 78 6 206 0 83 6 206 0 86] 
#[0 6 210 0 6 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[0 6 214 0 6 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[0 6 218 0 5 0 6 0 9] 
#[1 0 113 0 87 0 117 0 88 0 133 0 89 0 133 0 94 12 33 0 95] 
#[0 6 222 0 6 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[0 6 226 0 6 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[1 11 253 0 86 11 253 0 191 12 37 0 197] 
#[0 6 230 0 6 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86] 
#[0 6 234 0 6 0 17 0 30 0 31 0 33 0 35 0 41 0 44 0 47 0 50 0 54 0 55 0 57 0 58 0 59 0 63 0 68 0 69 0 70 0 73 0 74 0 75 0 76 0 77 0 78 0 83 0 86]
	).
]
