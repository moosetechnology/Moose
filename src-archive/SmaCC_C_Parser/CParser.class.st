Class {
	#name : #CParser,
	#superclass : #SmaCCParser,
	#category : #'SmaCC_C_Parser'
}

{ #category : #'generated-accessing' }
CParser class >> cacheId [
	^'2018-03-19T12:39:33.636522-05:00'
]

{ #category : #generated }
CParser class >> definitionComment [
"<H>
	: [a-fA-F0-9]
	;
<IS>
	: [uUlL]	
	;
<D>
	: [0-9]
	;
<E>
	: [Ee][\+\-]?<D>+	
	;
<FS>
	: [fFlL]	
	;
<ELLIPSIS> 
	: \.\.\. 
	;
<comment>
	: (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
<LETTER>
	: [a-zA-Z_] 
	;
<DIGIT> 
	: [0-9] 
	;
<IDENTIFIER>
	: <LETTER> (<LETTER>|<DIGIT>)*
	;
<CONSTANT>
	: (0[xX]<H>+<IS>?) 
	| (<D>+<IS>?) 
	| (<D>+<E><FS>?) 
	| <D>*\.<D>+<E>?<FS>? 
	| (L? \' ( (\\ .) | ([^\\\""]) )+ \')
	;
<STRING_LITERAL>
	: L? \"" ( (\\ .) | ([^\\\""]) )* \""
	;
<LEFT_BLOCK>
	: \[ | (\< \:)
	;
<RIGHT_BLOCK>
	: \] | (\: \>)	
	;
<LEFT_BRACE>
	: \{ | (\< \%)
	;
<RIGHT_BRACE>
	: \} | (\% \>)
	;
<whitespace>
	: \s+
	;

%id <TypeName> <IDENTIFIER> <CONSTANT> ;

translationUnit
	: external_declaration
	| translationUnit external_declaration
	;
primary_expression
	: <IDENTIFIER>
	| <CONSTANT>
	| <STRING_LITERAL>
	| ""("" expression "")""
	;
postfix_expression
	: primary_expression
	| postfix_expression <LEFT_BLOCK> expression <RIGHT_BLOCK>
	| postfix_expression ""("" "")""
	| postfix_expression ""("" argument_expression_list "")""
	| postfix_expression ""."" <IDENTIFIER>
	| postfix_expression ""->"" <IDENTIFIER>
	| postfix_expression ""++""
	| postfix_expression ""--""
	;
argument_expression_list
	: assignment_expression
	| argument_expression_list "","" assignment_expression
	;
unary_expression
	: postfix_expression
	| ""++"" unary_expression
	| ""--"" unary_expression
	| unary_operator cast_expression
	| ""sizeof"" unary_expression
	| ""sizeof"" ""("" type_name "")""
	;
unary_operator
	: ""&""
	| ""*""
	| ""+""
	| ""-""
	| ""~""
	| ""!""
	;
cast_expression
	: unary_expression
	| ""("" type_name "")"" cast_expression
	;
multiplicative_expression
	: cast_expression
	| multiplicative_expression ""*"" cast_expression
	| multiplicative_expression ""/"" cast_expression
	| multiplicative_expression ""%"" cast_expression
	;
additive_expression
	: multiplicative_expression
	| additive_expression ""+"" multiplicative_expression
	| additive_expression ""-"" multiplicative_expression
	;
shift_expression
	: additive_expression
	| shift_expression ""<<"" additive_expression
	| shift_expression "">>"" additive_expression
	;
relational_expression
	: shift_expression
	| relational_expression ""<"" shift_expression
	| relational_expression "">"" shift_expression
	| relational_expression ""<="" shift_expression
	| relational_expression "">="" shift_expression
	;
equality_expression
	: relational_expression
	| equality_expression ""=="" relational_expression
	| equality_expression ""!="" relational_expression
	;
and_expression
	: equality_expression
	| and_expression ""&"" equality_expression
	;
exclusive_or_expression
	: and_expression
	| exclusive_or_expression ""^"" and_expression
	;
inclusive_or_expression
	: exclusive_or_expression
	| inclusive_or_expression ""|"" exclusive_or_expression
	;
logical_and_expression
	: inclusive_or_expression
	| logical_and_expression ""&&"" inclusive_or_expression
	;
logical_or_expression
	: logical_and_expression
	| logical_or_expression ""||"" logical_and_expression
	;
conditional_expression
	: logical_or_expression
	| logical_or_expression ""?"" expression "":"" conditional_expression
	;
assignment_expression
	: conditional_expression
	| unary_expression assignment_operator assignment_expression
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
	| ""&=""
	| ""^=""
	| ""|=""
	;
expression
	: assignment_expression
	| expression "","" assignment_expression
	;
constant_expression
	: conditional_expression
	;
declaration
	: declaration_specifiers "";""
	| init_declaration "";""
	;
init_declaration
	: declaration_specifiers init_declarator_list 
		{'1' first value = 'typedef'
			ifTrue: 
				[1 to: '2' size by: 2 do: [:i | self addTypeName: ('2' at: i) value]].
		self reduceFor: nodes}
	;
declaration_specifiers
	: storage_class_specifier
	| storage_class_specifier declaration_specifiers
	| type_specifier
	| type_specifier declaration_specifiers
	| type_qualifier
	| type_qualifier declaration_specifiers
	;
init_declarator_list
	: init_declarator
	| init_declarator_list "","" init_declarator
	;
init_declarator
	: declarator
	| declarator ""="" initializer
	;
storage_class_specifier
	: ""typedef""
	| ""extern""
	| ""static""
	| ""auto""
	| ""register""
	;
type_specifier
	: ""void""
	| ""char""
	| ""short""
	| ""int""
	| ""long""
	| ""float""
	| ""double""
	| ""signed""
	| ""unsigned""
	| struct_or_union_specifier
	| enum_specifier
	| <TypeName>
	;
struct_or_union_specifier
	: struct_or_union <IDENTIFIER> <LEFT_BRACE> struct_declaration_list <RIGHT_BRACE> {self addTypeName: '2' value. self reduceFor: nodes}
	| struct_or_union <LEFT_BRACE> struct_declaration_list <RIGHT_BRACE>
	| struct_or_union <IDENTIFIER> {self addTypeName: '2' value. self reduceFor: nodes}
	;
struct_or_union
	: ""struct""
	| ""union""
	;
struct_declaration_list
	: struct_declaration
	| struct_declaration_list struct_declaration
	;
struct_declaration
	: specifier_qualifier_list struct_declarator_list "";""
	;
specifier_qualifier_list
	: type_specifier specifier_qualifier_list
	| type_specifier
	| type_qualifier specifier_qualifier_list
	| type_qualifier
	;
struct_declarator_list
	: struct_declarator
	| struct_declarator_list "","" struct_declarator
	;
struct_declarator
	: declarator
	| "":"" constant_expression
	| declarator "":"" constant_expression
	;
enum_specifier
	: ""enum"" <LEFT_BRACE> enumerator_list <RIGHT_BRACE>
	| ""enum"" <IDENTIFIER> <LEFT_BRACE> enumerator_list <RIGHT_BRACE>  {self addTypeName: '2' value. self reduceFor: nodes}
	| ""enum"" <IDENTIFIER>  {self addTypeName: '2' value. self reduceFor: nodes}
	;
enumerator_list
	: enumerator
	| enumerator_list "","" enumerator
	;
enumerator
	: <IDENTIFIER>
	| <IDENTIFIER> ""="" constant_expression
	;
type_qualifier
	: ""const""
	| ""volatile""
	;
declarator
	: pointer direct_declarator
	| direct_declarator
	;
direct_declarator
	: <IDENTIFIER>
	| ""("" declarator "")""
	| direct_declarator <LEFT_BLOCK> constant_expression <RIGHT_BLOCK>
	| direct_declarator <LEFT_BLOCK> <RIGHT_BLOCK>
	| direct_declarator ""("" parameter_type_list "")""
	| direct_declarator ""("" identifier_list "")""
	| direct_declarator ""("" "")""
	;
pointer
	: ""*""
	| ""*"" type_qualifier_list
	| ""*"" pointer
	| ""*"" type_qualifier_list pointer
	;
type_qualifier_list
	: type_qualifier
	| type_qualifier_list type_qualifier
	;
parameter_type_list
	: parameter_list
	| parameter_list "","" <ELLIPSIS>
	;
parameter_list
	: parameter_declaration
	| parameter_list "","" parameter_declaration
	;
parameter_declaration
	: declaration_specifiers declarator
	| declaration_specifiers abstract_declarator
	| declaration_specifiers
	;
identifier_list
	: <IDENTIFIER>
	| identifier_list "","" <IDENTIFIER>
	;
type_name
	: specifier_qualifier_list
	| specifier_qualifier_list abstract_declarator
	;
abstract_declarator
	: pointer
	| direct_abstract_declarator
	| pointer direct_abstract_declarator
	;
direct_abstract_declarator
	: ""("" abstract_declarator "")""
	| <LEFT_BLOCK> <RIGHT_BLOCK>
	| <LEFT_BLOCK> constant_expression <RIGHT_BLOCK>
	| direct_abstract_declarator <LEFT_BLOCK> <RIGHT_BLOCK>
	| direct_abstract_declarator <LEFT_BLOCK> constant_expression <RIGHT_BLOCK>
	| ""("" "")""
	| ""("" parameter_type_list "")""
	| direct_abstract_declarator ""("" "")""
	| direct_abstract_declarator ""("" parameter_type_list "")""
	;
initializer
	: assignment_expression
	| <LEFT_BRACE> initializer_list <RIGHT_BRACE>
	| <LEFT_BRACE> initializer_list "","" <RIGHT_BRACE>
	;
initializer_list
	: initializer
	| initializer_list "","" initializer
	;
statement
	: labeled_statement
	| compound_statement
	| expression_statement
	| selection_statement
	| iteration_statement
	| jump_statement
	;
labeled_statement
	: <IDENTIFIER> "":"" statement
	| ""case"" constant_expression "":"" statement
	| ""default"" "":"" statement
	;
compound_statement
	: <LEFT_BRACE> <RIGHT_BRACE>
	| <LEFT_BRACE> statement_list <RIGHT_BRACE>
	| <LEFT_BRACE> declaration_list <RIGHT_BRACE>
	| <LEFT_BRACE> declaration_list statement_list <RIGHT_BRACE>
	;
declaration_list
	: declaration
	| declaration_list declaration
	;
statement_list
	: statement
	| statement_list statement
	;
expression_statement
	: "";""
	| expression "";""
	;
selection_statement
	: ""if"" ""("" expression "")"" statement
	| ""if"" ""("" expression "")"" statement ""else"" statement
	| ""switch"" ""("" expression "")"" statement
	;
iteration_statement
	: ""while"" ""("" expression "")"" statement
	| ""do"" statement ""while"" ""("" expression "")"" "";""
	| ""for"" ""("" expression_statement expression_statement "")"" statement
	| ""for"" ""("" expression_statement expression_statement expression "")"" statement
	;
jump_statement
	: ""goto"" <IDENTIFIER> "";""
	| ""continue"" "";""
	| ""break"" "";""
	| ""return"" "";""
	| ""return"" expression "";""
	;
external_declaration
	: function_definition
	| declaration
	;
function_definition
	: declaration_specifiers declarator declaration_list compound_statement
	| declaration_specifiers declarator compound_statement
	| declarator declaration_list compound_statement
	| declarator compound_statement
	;"
]

{ #category : #'file types' }
CParser class >> fileExtension [
	^ '.c'
]

{ #category : #'file types' }
CParser class >> fileExtensionType [
	^ 'C files'
]

{ #category : #'generated-accessing' }
CParser class >> scannerClass [
	^CScanner
]

{ #category : #generated }
CParser class >> startingStateFortranslationUnit [
	^ 1
]

{ #category : #scanning }
CParser >> addTypeName: aString [
	scanner addTypeName: aString
]

{ #category : #'generated-reduction actions' }
CParser >> reduceActionForenum_specifier3: nodes [
	self addTypeName: (nodes at: 2) value.
	^ self reduceFor: nodes
]

{ #category : #'generated-reduction actions' }
CParser >> reduceActionForinit_declaration1: nodes [
	(nodes at: 1) first value = 'typedef'
		ifTrue: [ 1 to: (nodes at: 2) size by: 2 do: [ :i | self addTypeName: ((nodes at: 2) at: i) value ] ].
	^ self reduceFor: nodes
]

{ #category : #generated }
CParser >> reduceTable [
^#(
	#(127 1 #reduceFor:) 
	#(112 1 #reduceFor:) 
	#(113 1 #reduceFor:) 
	#(124 1 #reduceFor:) 
	#(115 1 #reduceFor:) 
	#(126 1 #reduceFor:) 
	#(147 1 #reduceFor:) 
	#(109 1 #reduceFor:) 
	#(125 1 #reduceFor:) 
	#(85 1 #reduceFor:) 
	#(128 1 #reduceFor:) 
	#(127 2 #reduceFor:) 
	#(121 2 #reduceActionForenum_specifier3:) 
	#(85 2 #reduceFor:) 
	#(107 2 #reduceFor:) 
	#(108 2 #reduceActionForinit_declaration1:) 
	#(110 1 #reduceFor:) 
	#(111 1 #reduceFor:) 
	#(109 2 #reduceFor:) 
	#(114 2 #reduceActionForenum_specifier3:) 
	#(141 1 #reduceFor:) 
	#(148 2 #reduceFor:) 
	#(125 2 #reduceFor:) 
	#(126 3 #reduceFor:) 
	#(128 2 #reduceFor:) 
	#(127 3 #reduceFor:) 
	#(123 1 #reduceFor:) 
	#(122 1 #reduceFor:) 
	#(148 3 #reduceFor:) 
	#(118 1 #reduceFor:) 
	#(116 1 #reduceFor:) 
	#(90 1 #reduceFor:) 
	#(143 1 #reduceFor:) 
	#(86 1 #reduceFor:) 
	#(140 2 #reduceFor:) 
	#(87 1 #reduceFor:) 
	#(89 1 #reduceFor:) 
	#(91 1 #reduceFor:) 
	#(92 1 #reduceFor:) 
	#(93 1 #reduceFor:) 
	#(94 1 #reduceFor:) 
	#(95 1 #reduceFor:) 
	#(96 1 #reduceFor:) 
	#(97 1 #reduceFor:) 
	#(98 1 #reduceFor:) 
	#(99 1 #reduceFor:) 
	#(100 1 #reduceFor:) 
	#(101 1 #reduceFor:) 
	#(102 1 #reduceFor:) 
	#(103 1 #reduceFor:) 
	#(105 1 #reduceFor:) 
	#(142 1 #reduceFor:) 
	#(138 1 #reduceFor:) 
	#(141 2 #reduceFor:) 
	#(132 1 #reduceFor:) 
	#(131 1 #reduceFor:) 
	#(129 1 #reduceFor:) 
	#(130 1 #reduceFor:) 
	#(106 1 #reduceFor:) 
	#(121 4 #reduceFor:) 
	#(110 3 #reduceFor:) 
	#(136 1 #reduceFor:) 
	#(111 3 #reduceFor:) 
	#(148 4 #reduceFor:) 
	#(118 2 #reduceFor:) 
	#(114 4 #reduceFor:) 
	#(116 2 #reduceFor:) 
	#(119 1 #reduceFor:) 
	#(120 1 #reduceFor:) 
	#(133 1 #reduceFor:) 
	#(89 2 #reduceFor:) 
	#(146 2 #reduceFor:) 
	#(87 2 #reduceFor:) 
	#(104 1 #reduceFor:) 
	#(143 2 #reduceFor:) 
	#(140 3 #reduceFor:) 
	#(142 2 #reduceFor:) 
	#(131 2 #reduceFor:) 
	#(134 1 #reduceFor:) 
	#(126 4 #reduceFor:) 
	#(121 5 #reduceActionForenum_specifier3:) 
	#(123 3 #reduceFor:) 
	#(122 3 #reduceFor:) 
	#(137 1 #reduceFor:) 
	#(114 5 #reduceActionForenum_specifier3:) 
	#(120 2 #reduceFor:) 
	#(117 3 #reduceFor:) 
	#(86 3 #reduceFor:) 
	#(133 2 #reduceFor:) 
	#(139 3 #reduceFor:) 
	#(146 3 #reduceFor:) 
	#(87 3 #reduceFor:) 
	#(88 1 #reduceFor:) 
	#(103 3 #reduceFor:) 
	#(92 3 #reduceFor:) 
	#(93 3 #reduceFor:) 
	#(94 3 #reduceFor:) 
	#(95 3 #reduceFor:) 
	#(96 3 #reduceFor:) 
	#(97 3 #reduceFor:) 
	#(98 3 #reduceFor:) 
	#(99 3 #reduceFor:) 
	#(100 3 #reduceFor:) 
	#(101 3 #reduceFor:) 
	#(105 3 #reduceFor:) 
	#(140 4 #reduceFor:) 
	#(135 2 #reduceFor:) 
	#(134 2 #reduceFor:) 
	#(129 3 #reduceFor:) 
	#(130 3 #reduceFor:) 
	#(132 3 #reduceFor:) 
	#(136 3 #reduceFor:) 
	#(119 3 #reduceFor:) 
	#(120 3 #reduceFor:) 
	#(91 4 #reduceFor:) 
	#(139 4 #reduceFor:) 
	#(89 4 #reduceFor:) 
	#(87 4 #reduceFor:) 
	#(135 3 #reduceFor:) 
	#(136 4 #reduceFor:) 
	#(137 3 #reduceFor:) 
	#(144 5 #reduceFor:) 
	#(145 5 #reduceFor:) 
	#(88 3 #reduceFor:) 
	#(102 5 #reduceFor:) 
	#(135 4 #reduceFor:) 
	#(145 6 #reduceFor:) 
	#(145 7 #reduceFor:) 
	#(144 7 #reduceFor:)
	).
]

{ #category : #generated }
CParser >> symbolNames [
	^ #('"!"' '"!="' '"%"' '"%="' '"&"' '"&&"' '"&="' '"("' '")"' '"*"' '"*="' '"+"' '"++"' '"+="' '","' '"-"' '"--"' '"-="' '"->"' '"."' '"/"' '"/="' '":"' '";"' '"<"' '"<<"' '"<<="' '"<="' '"="' '"=="' '">"' '">="' '">>"' '">>="' '"?"' '"^"' '"^="' '"auto"' '"break"' '"case"' '"char"' '"const"' '"continue"' '"default"' '"do"' '"double"' '"else"' '"enum"' '"extern"' '"float"' '"for"' '"goto"' '"if"' '"int"' '"long"' '"register"' '"return"' '"short"' '"signed"' '"sizeof"' '"static"' '"struct"' '"switch"' '"typedef"' '"union"' '"unsigned"' '"void"' '"volatile"' '"while"' '"|"' '"|="' '"||"' '"~"' '<ELLIPSIS>' '<comment>' '<IDENTIFIER>' '<CONSTANT>' '<STRING_LITERAL>' '<LEFT_BLOCK>' '<RIGHT_BLOCK>' '<LEFT_BRACE>' '<RIGHT_BRACE>' '<whitespace>' 'B e g i n' 'translationUnit' 'primary_expression' 'postfix_expression' 'argument_expression_list' 'unary_expression' 'unary_operator' 'cast_expression' 'multiplicative_expression' 'additive_expression' 'shift_expression' 'relational_expression' 'equality_expression' 'and_expression' 'exclusive_or_expression' 'inclusive_or_expression' 'logical_and_expression' 'logical_or_expression' 'conditional_expression' 'assignment_expression' 'assignment_operator' 'expression' 'constant_expression' 'declaration' 'init_declaration' 'declaration_specifiers' 'init_declarator_list' 'init_declarator' 'storage_class_specifier' 'type_specifier' 'struct_or_union_specifier' 'struct_or_union' 'struct_declaration_list' 'struct_declaration' 'specifier_qualifier_list' 'struct_declarator_list' 'struct_declarator' 'enum_specifier' 'enumerator_list' 'enumerator' 'type_qualifier' 'declarator' 'direct_declarator' 'pointer' 'type_qualifier_list' 'parameter_type_list' 'parameter_list' 'parameter_declaration' 'identifier_list' 'type_name' 'abstract_declarator' 'direct_abstract_declarator' 'initializer' 'initializer_list' 'statement' 'labeled_statement' 'compound_statement' 'declaration_list' 'statement_list' 'expression_statement' 'selection_statement' 'iteration_statement' 'jump_statement' 'external_declaration' 'function_definition' '<TypeName>' 'E O F' 'error')
]

{ #category : #generated }
CParser >> transitionTable [
^#(
#[1 0 9 0 8 0 13 0 10 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 93 0 76 0 97 0 85 0 101 0 107 0 105 0 108 0 109 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 137 0 125 0 141 0 126 0 145 0 127 0 149 0 147 0 153 0 148 0 157 0 149] 
#[1 0 9 0 8 0 13 0 10 0 93 0 76 0 161 0 125 0 141 0 126 0 145 0 127] 
#[1 0 6 0 8 0 6 0 9 0 13 0 10 0 6 0 15 0 25 0 42 0 89 0 68 0 6 0 76 0 6 0 79 0 165 0 124 0 169 0 127 0 173 0 128] 
#[0 0 10 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 18 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[1 0 177 0 76 0 181 0 81] 
#[0 0 10 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 10 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 10 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 22 0 76 0 81] 
#[0 0 10 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 22 0 76 0 81] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 18 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 26 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[1 0 9 0 8 0 13 0 10 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 93 0 76 0 101 0 107 0 105 0 108 0 109 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 137 0 125 0 141 0 126 0 145 0 127 0 185 0 147 0 153 0 148 0 157 0 149 0 0 0 150] 
#[0 0 30 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 0 189 0 24] 
#[1 0 9 0 8 0 13 0 10 0 193 0 24 0 93 0 76 0 197 0 110 0 201 0 111 0 205 0 125 0 141 0 126 0 145 0 127] 
#[1 0 34 0 8 0 34 0 9 0 34 0 10 0 34 0 15 0 34 0 24 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 34 0 76 0 34 0 79 0 209 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 157 0 149] 
#[1 0 34 0 8 0 34 0 9 0 34 0 10 0 34 0 15 0 34 0 24 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 34 0 76 0 34 0 79 0 213 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 157 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[1 0 217 0 76 0 221 0 81] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[1 0 34 0 8 0 34 0 9 0 34 0 10 0 34 0 15 0 34 0 24 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 34 0 76 0 34 0 79 0 225 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 157 0 149] 
#[1 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 229 0 81 0 233 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 241 0 140 0 245 0 141 0 157 0 149] 
#[1 0 249 0 8 0 38 0 9 0 38 0 15 0 38 0 23 0 38 0 24 0 38 0 29 0 38 0 38 0 38 0 41 0 38 0 42 0 38 0 46 0 38 0 48 0 38 0 49 0 38 0 50 0 38 0 54 0 38 0 55 0 38 0 56 0 38 0 58 0 38 0 59 0 38 0 61 0 38 0 62 0 38 0 64 0 38 0 65 0 38 0 66 0 38 0 67 0 38 0 68 0 253 0 79 0 38 0 81 0 38 0 149] 
#[1 0 9 0 8 0 93 0 76 1 1 0 126] 
#[0 0 42 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 0 30 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 1 5 0 9] 
#[0 0 46 0 8 0 9 0 10 0 15 0 42 0 68 0 76 0 79] 
#[0 0 50 0 8 0 9 0 15 0 76 0 79] 
#[1 0 50 0 8 0 50 0 9 0 13 0 10 0 50 0 15 0 25 0 42 0 89 0 68 0 50 0 76 0 50 0 79 1 9 0 124 1 13 0 127] 
#[1 0 54 0 8 0 54 0 9 0 54 0 10 0 54 0 15 0 54 0 23 0 54 0 24 0 54 0 38 0 54 0 41 0 54 0 42 0 54 0 46 0 54 0 48 0 54 0 49 0 54 0 50 0 54 0 54 0 54 0 55 0 54 0 56 0 54 0 58 0 54 0 59 0 54 0 61 0 54 0 62 0 54 0 64 0 54 0 65 0 54 0 66 0 54 0 67 0 54 0 68 0 54 0 76 0 54 0 79 1 17 0 81 0 54 0 149] 
#[1 1 21 0 76 1 25 0 122 1 29 0 123] 
#[0 0 58 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 0 62 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[0 0 62 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[1 1 33 0 15 0 66 0 24] 
#[0 0 70 0 15 0 24] 
#[1 0 74 0 15 0 74 0 24 1 37 0 29 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 229 0 81 0 233 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 1 41 0 140 1 45 0 141 0 157 0 149] 
#[0 0 78 0 8 0 9 0 10 0 15 0 24 0 76 0 79] 
#[0 0 78 0 8 0 9 0 10 0 15 0 24 0 76 0 79] 
#[1 0 82 0 8 0 82 0 9 0 82 0 10 0 82 0 15 0 82 0 23 0 82 0 24 0 82 0 38 0 82 0 41 0 82 0 42 0 82 0 46 0 82 0 48 0 82 0 49 0 82 0 50 0 82 0 54 0 82 0 55 0 82 0 56 0 82 0 58 0 82 0 59 0 82 0 61 0 82 0 62 0 82 0 64 0 82 0 65 0 82 0 66 0 82 0 67 0 82 0 68 0 82 0 76 0 82 0 79 1 49 0 81 0 82 0 149] 
#[1 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 53 0 113 0 121 0 114 0 125 0 115 1 57 0 116 1 61 0 117 1 65 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[0 0 78 0 8 0 9 0 10 0 15 0 24 0 76 0 79] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 0 17 0 38 1 109 0 39 1 113 0 40 0 21 0 41 0 25 0 42 1 117 0 43 1 121 0 44 1 125 0 45 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 1 129 0 51 1 133 0 52 1 137 0 53 0 45 0 54 0 49 0 55 0 53 0 56 1 141 0 57 0 57 0 58 0 61 0 59 1 145 0 60 0 65 0 61 0 69 0 62 1 149 0 63 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 173 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 0 233 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 1 249 0 138 1 253 0 139 2 1 0 140 2 5 0 141 2 9 0 142 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146 0 157 0 149] 
#[0 0 86 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149] 
#[1 0 9 0 8 0 13 0 10 0 193 0 24 0 93 0 76 0 197 0 110 0 201 0 111 2 29 0 125 0 141 0 126 0 145 0 127] 
#[0 0 90 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[1 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 229 0 81 2 33 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 2 37 0 140 0 157 0 149] 
#[1 2 41 0 9 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 2 45 0 76 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 2 53 0 129 2 57 0 130 2 61 0 131 2 65 0 132 0 157 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 2 73 0 80 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 2 85 0 106] 
#[1 0 249 0 8 0 94 0 9 0 94 0 15 0 94 0 23 0 94 0 24 0 94 0 29 0 94 0 38 0 94 0 41 0 94 0 42 0 94 0 46 0 94 0 48 0 94 0 49 0 94 0 50 0 94 0 54 0 94 0 55 0 94 0 56 0 94 0 58 0 94 0 59 0 94 0 61 0 94 0 62 0 94 0 64 0 94 0 65 0 94 0 66 0 94 0 67 0 94 0 68 0 253 0 79 0 94 0 81 0 94 0 149] 
#[0 0 98 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 0 102 0 8 0 9 0 10 0 15 0 42 0 68 0 76 0 79] 
#[0 0 106 0 8 0 9 0 15 0 76 0 79] 
#[1 1 21 0 76 2 89 0 122 1 29 0 123] 
#[1 0 110 0 15 2 93 0 29 0 110 0 82] 
#[1 2 97 0 15 2 101 0 82] 
#[0 0 114 0 15 0 82] 
#[1 0 9 0 8 0 13 0 10 0 93 0 76 2 105 0 111 2 29 0 125 0 141 0 126 0 145 0 127] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 2 109 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 2 113 0 103 2 117 0 136] 
#[0 0 118 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[1 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 229 0 81 2 33 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 2 121 0 140 0 157 0 149] 
#[1 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 53 0 113 0 121 0 114 0 125 0 115 2 125 0 116 1 61 0 117 1 65 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[1 0 122 0 8 0 122 0 9 0 122 0 10 0 122 0 23 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 122 0 76 0 122 0 79 1 53 0 113 0 121 0 114 0 125 0 115 2 129 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[1 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 2 133 0 82 1 53 0 113 0 121 0 114 0 125 0 115 2 137 0 117 1 65 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[0 0 126 0 41 0 42 0 46 0 48 0 50 0 54 0 55 0 58 0 59 0 62 0 65 0 66 0 67 0 68 0 82 0 149] 
#[1 0 9 0 8 0 13 0 10 2 141 0 23 0 93 0 76 2 145 0 119 2 149 0 120 2 153 0 125 0 141 0 126 0 145 0 127] 
#[1 0 122 0 8 0 122 0 9 0 122 0 10 0 122 0 23 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 122 0 76 0 122 0 79 1 53 0 113 0 121 0 114 0 125 0 115 2 157 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[0 0 130 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 0 130 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 1 145 0 60 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 2 161 0 105 1 53 0 113 0 121 0 114 0 125 0 115 2 165 0 118 0 129 0 121 1 69 0 124 2 169 0 133 0 157 0 149] 
#[0 0 130 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 0 130 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 1 73 0 1 1 77 0 5 2 173 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 177 0 89 1 189 0 90] 
#[0 0 130 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 1 73 0 1 1 77 0 5 2 173 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 181 0 89 1 189 0 90] 
#[0 0 134 0 1 0 5 0 8 0 9 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 2 185 0 24] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 2 189 0 106] 
#[0 2 193 0 24] 
#[0 2 197 0 23] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 2 201 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 2 205 0 8] 
#[0 2 209 0 76] 
#[0 2 213 0 8] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 2 217 0 24 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 2 221 0 105] 
#[1 1 73 0 1 1 77 0 5 2 225 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 229 0 89 1 189 0 90] 
#[0 2 233 0 8] 
#[0 2 237 0 8] 
#[0 0 130 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 0 138 0 2 0 138 0 3 0 138 0 4 0 138 0 5 0 138 0 6 0 138 0 7 0 138 0 8 0 138 0 10 0 138 0 11 0 138 0 12 0 138 0 13 0 138 0 14 0 138 0 15 0 138 0 16 0 138 0 17 0 138 0 18 0 138 0 19 0 138 0 20 0 138 0 21 0 138 0 22 2 241 0 23 0 138 0 24 0 138 0 25 0 138 0 26 0 138 0 27 0 138 0 28 0 138 0 29 0 138 0 30 0 138 0 31 0 138 0 32 0 138 0 33 0 138 0 34 0 138 0 35 0 138 0 36 0 138 0 37 0 138 0 70 0 138 0 71 0 138 0 72 0 138 0 79] 
#[0 0 138 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 0 138 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 0 142 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[0 0 146 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 0 150 0 2 0 150 0 3 0 150 0 4 0 150 0 5 0 150 0 6 0 150 0 7 2 245 0 8 0 150 0 9 0 150 0 10 0 150 0 11 0 150 0 12 2 249 0 13 0 150 0 14 0 150 0 15 0 150 0 16 2 253 0 17 0 150 0 18 3 1 0 19 3 5 0 20 0 150 0 21 0 150 0 22 0 150 0 23 0 150 0 24 0 150 0 25 0 150 0 26 0 150 0 27 0 150 0 28 0 150 0 29 0 150 0 30 0 150 0 31 0 150 0 32 0 150 0 33 0 150 0 34 0 150 0 35 0 150 0 36 0 150 0 37 0 150 0 70 0 150 0 71 0 150 0 72 3 9 0 79 0 150 0 80 0 150 0 82] 
#[1 0 154 0 2 0 154 0 3 3 13 0 4 0 154 0 5 0 154 0 6 3 17 0 7 0 154 0 9 0 154 0 10 3 21 0 11 0 154 0 12 3 25 0 14 0 154 0 15 0 154 0 16 3 29 0 18 0 154 0 21 3 33 0 22 0 154 0 23 0 154 0 24 0 154 0 25 0 154 0 26 3 37 0 27 0 154 0 28 3 41 0 29 0 154 0 30 0 154 0 31 0 154 0 32 0 154 0 33 3 45 0 34 0 154 0 35 0 154 0 36 3 49 0 37 0 154 0 70 3 53 0 71 0 154 0 72 0 154 0 80 0 154 0 82 3 57 0 104] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 3 61 0 91] 
#[0 0 158 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 24 0 25 0 26 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 70 0 72 0 80 0 82] 
#[1 0 162 0 2 3 65 0 3 0 162 0 5 0 162 0 6 0 162 0 9 3 69 0 10 0 162 0 12 0 162 0 15 0 162 0 16 3 73 0 21 0 162 0 23 0 162 0 24 0 162 0 25 0 162 0 26 0 162 0 28 0 162 0 30 0 162 0 31 0 162 0 32 0 162 0 33 0 162 0 35 0 162 0 36 0 162 0 70 0 162 0 72 0 162 0 80 0 162 0 82] 
#[1 0 166 0 2 0 166 0 5 0 166 0 6 0 166 0 9 3 77 0 12 0 166 0 15 3 81 0 16 0 166 0 23 0 166 0 24 0 166 0 25 0 166 0 26 0 166 0 28 0 166 0 30 0 166 0 31 0 166 0 32 0 166 0 33 0 166 0 35 0 166 0 36 0 166 0 70 0 166 0 72 0 166 0 80 0 166 0 82] 
#[1 0 170 0 2 0 170 0 5 0 170 0 6 0 170 0 9 0 170 0 15 0 170 0 23 0 170 0 24 0 170 0 25 3 85 0 26 0 170 0 28 0 170 0 30 0 170 0 31 0 170 0 32 3 89 0 33 0 170 0 35 0 170 0 36 0 170 0 70 0 170 0 72 0 170 0 80 0 170 0 82] 
#[1 0 174 0 2 0 174 0 5 0 174 0 6 0 174 0 9 0 174 0 15 0 174 0 23 0 174 0 24 3 93 0 25 3 97 0 28 0 174 0 30 3 101 0 31 3 105 0 32 0 174 0 35 0 174 0 36 0 174 0 70 0 174 0 72 0 174 0 80 0 174 0 82] 
#[1 3 109 0 2 0 178 0 5 0 178 0 6 0 178 0 9 0 178 0 15 0 178 0 23 0 178 0 24 3 113 0 30 0 178 0 35 0 178 0 36 0 178 0 70 0 178 0 72 0 178 0 80 0 178 0 82] 
#[1 3 117 0 5 0 182 0 6 0 182 0 9 0 182 0 15 0 182 0 23 0 182 0 24 0 182 0 35 0 182 0 36 0 182 0 70 0 182 0 72 0 182 0 80 0 182 0 82] 
#[1 0 186 0 6 0 186 0 9 0 186 0 15 0 186 0 23 0 186 0 24 0 186 0 35 3 121 0 36 0 186 0 70 0 186 0 72 0 186 0 80 0 186 0 82] 
#[1 0 190 0 6 0 190 0 9 0 190 0 15 0 190 0 23 0 190 0 24 0 190 0 35 3 125 0 70 0 190 0 72 0 190 0 80 0 190 0 82] 
#[1 3 129 0 6 0 194 0 9 0 194 0 15 0 194 0 23 0 194 0 24 0 194 0 35 0 194 0 72 0 194 0 80 0 194 0 82] 
#[1 0 198 0 9 0 198 0 15 0 198 0 23 0 198 0 24 3 133 0 35 3 137 0 72 0 198 0 80 0 198 0 82] 
#[0 0 202 0 9 0 15 0 23 0 24 0 80 0 82] 
#[0 0 206 0 9 0 15 0 23 0 24 0 80] 
#[1 3 141 0 15 3 145 0 24] 
#[0 0 210 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 0 214 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 0 214 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 0 17 0 38 1 109 0 39 1 113 0 40 0 21 0 41 0 25 0 42 1 117 0 43 1 121 0 44 1 125 0 45 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 1 129 0 51 1 133 0 52 1 137 0 53 0 45 0 54 0 49 0 55 0 53 0 56 1 141 0 57 0 57 0 58 0 61 0 59 1 145 0 60 0 65 0 61 0 69 0 62 1 149 0 63 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 3 149 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 2 33 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 1 249 0 138 1 253 0 139 2 1 0 140 3 153 0 142 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146 0 157 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 3 157 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 3 161 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 0 214 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 0 214 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 0 214 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 0 214 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 0 74 0 15 0 74 0 24 1 37 0 29] 
#[0 0 218 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149] 
#[0 0 118 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 0 98 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 0 222 0 9 0 15] 
#[1 3 165 0 8 0 226 0 9 0 13 0 10 0 226 0 15 0 93 0 76 3 169 0 79 3 173 0 125 0 141 0 126 3 177 0 127 3 181 0 134 3 185 0 135] 
#[0 3 189 0 9] 
#[1 0 230 0 9 3 193 0 15] 
#[0 0 234 0 9 0 15] 
#[1 3 197 0 9 3 201 0 15] 
#[0 0 138 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 0 98 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 0 154 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[0 0 238 0 15 0 23 0 24 0 80 0 82] 
#[0 3 205 0 80] 
#[1 2 97 0 15 3 209 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 3 213 0 106] 
#[1 1 21 0 76 3 217 0 123] 
#[0 0 242 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 246 0 15 0 24] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 2 109 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 2 113 0 103 3 221 0 136 3 225 0 137] 
#[0 0 250 0 15 0 24 0 82] 
#[0 0 254 0 15 0 24] 
#[0 1 2 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[1 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 3 229 0 82 1 53 0 113 0 121 0 114 0 125 0 115 2 137 0 117 1 65 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[0 1 6 0 8 0 9 0 10 0 23 0 76 0 79] 
#[0 1 10 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 1 14 0 41 0 42 0 46 0 48 0 50 0 54 0 55 0 58 0 59 0 62 0 65 0 66 0 67 0 68 0 82 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 3 233 0 106] 
#[1 3 237 0 15 3 241 0 24] 
#[0 1 18 0 15 0 24] 
#[1 1 22 0 15 3 245 0 23 1 22 0 24] 
#[0 1 6 0 8 0 9 0 10 0 23 0 76 0 79] 
#[1 3 249 0 9 3 141 0 15] 
#[1 3 253 0 8 1 26 0 9 0 13 0 10 3 169 0 79 4 1 0 127 4 5 0 134 3 185 0 135] 
#[0 4 9 0 9] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 2 161 0 105] 
#[0 1 30 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[0 1 30 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[0 1 34 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 4 13 0 23] 
#[0 1 34 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 17 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 4 21 0 69] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 25 0 143] 
#[0 4 29 0 24] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 4 33 0 105] 
#[0 1 34 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 3 141 0 15 4 37 0 24] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 1 145 0 60 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 2 161 0 105 1 53 0 113 0 121 0 114 0 125 0 115 2 165 0 118 0 129 0 121 1 69 0 124 4 41 0 133 0 157 0 149] 
#[0 1 30 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 4 45 0 105] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 4 49 0 105] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 53 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 4 57 0 9 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 4 61 0 88 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 4 65 0 103] 
#[0 1 38 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 1 38 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 4 69 0 76] 
#[0 4 73 0 76] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 4 77 0 105] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 42 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 4 81 0 103] 
#[0 1 30 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 4 85 0 91] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 4 89 0 91] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 4 93 0 91] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 4 97 0 92] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 4 101 0 92] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 4 105 0 93] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 4 109 0 93] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 4 113 0 94] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 4 117 0 94] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 4 121 0 94] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 4 125 0 94] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 4 129 0 95] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 4 133 0 95] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 4 137 0 96] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 4 141 0 97] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 4 145 0 98] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 4 149 0 99] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 4 153 0 105] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 4 157 0 100] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 4 161 0 103] 
#[0 1 46 0 1 0 5 0 8 0 9 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 1 50 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 4 165 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 3 161 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 1 50 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[0 1 54 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 3 165 0 8 4 169 0 9 0 13 0 10 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 93 0 76 3 169 0 79 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 161 0 125 0 141 0 126 3 177 0 127 4 173 0 129 2 57 0 130 2 61 0 131 4 177 0 134 3 185 0 135 0 157 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 4 181 0 80 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 4 185 0 106] 
#[0 1 58 0 9 0 15] 
#[1 3 165 0 8 1 62 0 9 1 62 0 15 0 93 0 76 3 169 0 79 1 1 0 126 4 189 0 135] 
#[0 1 58 0 9 0 15] 
#[1 4 193 0 8 1 62 0 9 1 62 0 15 4 197 0 79] 
#[0 1 66 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[1 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 4 201 0 74 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 4 205 0 131 0 157 0 149] 
#[0 1 66 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 4 209 0 76] 
#[0 1 66 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 1 70 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 1 74 0 15 0 82] 
#[0 1 78 0 15 0 82] 
#[0 1 82 0 15 0 82] 
#[1 4 213 0 15 4 217 0 82] 
#[0 1 86 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 1 90 0 15 0 24] 
#[1 0 9 0 8 0 13 0 10 2 141 0 23 0 93 0 76 4 221 0 120 2 153 0 125 0 141 0 126 0 145 0 127] 
#[0 1 94 0 41 0 42 0 46 0 48 0 50 0 54 0 55 0 58 0 59 0 62 0 65 0 66 0 67 0 68 0 82 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 4 225 0 106] 
#[0 1 98 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 3 253 0 8 4 169 0 9 0 13 0 10 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 3 169 0 79 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 4 1 0 127 4 173 0 129 2 57 0 130 2 61 0 131 4 177 0 134 3 185 0 135 0 157 0 149] 
#[1 3 253 0 8 1 62 0 9 3 169 0 79 4 189 0 135] 
#[0 1 102 0 9] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 4 229 0 91] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 233 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 1 106 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 4 237 0 8] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 241 0 143] 
#[0 1 110 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 4 245 0 9 3 141 0 15] 
#[0 1 110 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 4 249 0 9] 
#[1 4 253 0 9 3 141 0 15] 
#[1 5 1 0 9 3 141 0 15] 
#[0 1 106 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 1 114 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 5 5 0 9 5 9 0 15] 
#[0 1 118 0 9 0 15] 
#[0 1 114 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 1 114 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 3 141 0 15 5 13 0 80] 
#[0 1 122 0 9 0 15 0 23 0 24 0 80 0 82] 
#[0 1 126 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 24 0 25 0 26 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 70 0 72 0 80 0 82] 
#[0 1 126 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 24 0 25 0 26 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 70 0 72 0 80 0 82] 
#[0 1 126 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 24 0 25 0 26 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 70 0 72 0 80 0 82] 
#[1 1 130 0 2 3 65 0 3 1 130 0 5 1 130 0 6 1 130 0 9 3 69 0 10 1 130 0 12 1 130 0 15 1 130 0 16 3 73 0 21 1 130 0 23 1 130 0 24 1 130 0 25 1 130 0 26 1 130 0 28 1 130 0 30 1 130 0 31 1 130 0 32 1 130 0 33 1 130 0 35 1 130 0 36 1 130 0 70 1 130 0 72 1 130 0 80 1 130 0 82] 
#[1 1 130 0 2 3 65 0 3 1 130 0 5 1 130 0 6 1 130 0 9 3 69 0 10 1 130 0 12 1 130 0 15 1 130 0 16 3 73 0 21 1 130 0 23 1 130 0 24 1 130 0 25 1 130 0 26 1 130 0 28 1 130 0 30 1 130 0 31 1 130 0 32 1 130 0 33 1 130 0 35 1 130 0 36 1 130 0 70 1 130 0 72 1 130 0 80 1 130 0 82] 
#[1 1 134 0 2 1 134 0 5 1 134 0 6 1 134 0 9 3 77 0 12 1 134 0 15 3 81 0 16 1 134 0 23 1 134 0 24 1 134 0 25 1 134 0 26 1 134 0 28 1 134 0 30 1 134 0 31 1 134 0 32 1 134 0 33 1 134 0 35 1 134 0 36 1 134 0 70 1 134 0 72 1 134 0 80 1 134 0 82] 
#[1 1 134 0 2 1 134 0 5 1 134 0 6 1 134 0 9 3 77 0 12 1 134 0 15 3 81 0 16 1 134 0 23 1 134 0 24 1 134 0 25 1 134 0 26 1 134 0 28 1 134 0 30 1 134 0 31 1 134 0 32 1 134 0 33 1 134 0 35 1 134 0 36 1 134 0 70 1 134 0 72 1 134 0 80 1 134 0 82] 
#[1 1 138 0 2 1 138 0 5 1 138 0 6 1 138 0 9 1 138 0 15 1 138 0 23 1 138 0 24 1 138 0 25 3 85 0 26 1 138 0 28 1 138 0 30 1 138 0 31 1 138 0 32 3 89 0 33 1 138 0 35 1 138 0 36 1 138 0 70 1 138 0 72 1 138 0 80 1 138 0 82] 
#[1 1 138 0 2 1 138 0 5 1 138 0 6 1 138 0 9 1 138 0 15 1 138 0 23 1 138 0 24 1 138 0 25 3 85 0 26 1 138 0 28 1 138 0 30 1 138 0 31 1 138 0 32 3 89 0 33 1 138 0 35 1 138 0 36 1 138 0 70 1 138 0 72 1 138 0 80 1 138 0 82] 
#[1 1 138 0 2 1 138 0 5 1 138 0 6 1 138 0 9 1 138 0 15 1 138 0 23 1 138 0 24 1 138 0 25 3 85 0 26 1 138 0 28 1 138 0 30 1 138 0 31 1 138 0 32 3 89 0 33 1 138 0 35 1 138 0 36 1 138 0 70 1 138 0 72 1 138 0 80 1 138 0 82] 
#[1 1 138 0 2 1 138 0 5 1 138 0 6 1 138 0 9 1 138 0 15 1 138 0 23 1 138 0 24 1 138 0 25 3 85 0 26 1 138 0 28 1 138 0 30 1 138 0 31 1 138 0 32 3 89 0 33 1 138 0 35 1 138 0 36 1 138 0 70 1 138 0 72 1 138 0 80 1 138 0 82] 
#[1 1 142 0 2 1 142 0 5 1 142 0 6 1 142 0 9 1 142 0 15 1 142 0 23 1 142 0 24 3 93 0 25 3 97 0 28 1 142 0 30 3 101 0 31 3 105 0 32 1 142 0 35 1 142 0 36 1 142 0 70 1 142 0 72 1 142 0 80 1 142 0 82] 
#[1 1 142 0 2 1 142 0 5 1 142 0 6 1 142 0 9 1 142 0 15 1 142 0 23 1 142 0 24 3 93 0 25 3 97 0 28 1 142 0 30 3 101 0 31 3 105 0 32 1 142 0 35 1 142 0 36 1 142 0 70 1 142 0 72 1 142 0 80 1 142 0 82] 
#[1 3 109 0 2 1 146 0 5 1 146 0 6 1 146 0 9 1 146 0 15 1 146 0 23 1 146 0 24 3 113 0 30 1 146 0 35 1 146 0 36 1 146 0 70 1 146 0 72 1 146 0 80 1 146 0 82] 
#[1 3 117 0 5 1 150 0 6 1 150 0 9 1 150 0 15 1 150 0 23 1 150 0 24 1 150 0 35 1 150 0 36 1 150 0 70 1 150 0 72 1 150 0 80 1 150 0 82] 
#[1 1 154 0 6 1 154 0 9 1 154 0 15 1 154 0 23 1 154 0 24 1 154 0 35 3 121 0 36 1 154 0 70 1 154 0 72 1 154 0 80 1 154 0 82] 
#[1 1 158 0 6 1 158 0 9 1 158 0 15 1 158 0 23 1 158 0 24 1 158 0 35 3 125 0 70 1 158 0 72 1 158 0 80 1 158 0 82] 
#[1 3 141 0 15 5 17 0 23] 
#[1 3 129 0 6 1 162 0 9 1 162 0 15 1 162 0 23 1 162 0 24 1 162 0 35 1 162 0 72 1 162 0 80 1 162 0 82] 
#[0 1 166 0 9 0 15 0 23 0 24 0 80] 
#[0 1 170 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[0 1 174 0 8 0 9 0 15 0 79] 
#[0 5 21 0 9] 
#[0 5 25 0 9] 
#[0 1 174 0 8 0 9 0 15 0 79] 
#[0 5 29 0 80] 
#[1 4 193 0 8 1 178 0 9 1 178 0 15 4 197 0 79] 
#[1 5 33 0 9 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 5 37 0 129 2 57 0 130 2 61 0 131 0 157 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 5 41 0 80 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 5 45 0 106] 
#[0 1 182 0 9] 
#[0 1 186 0 9 0 15] 
#[0 1 190 0 9 0 15] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 2 109 0 81 5 49 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 2 113 0 103 5 53 0 136] 
#[0 1 194 0 15 0 24 0 82] 
#[0 1 198 0 15 0 24] 
#[0 1 202 0 15 0 24] 
#[0 1 206 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[0 1 210 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 5 57 0 105] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 5 61 0 9 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 5 65 0 105] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 69 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 1 214 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 73 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 77 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 1 218 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 5 81 0 103] 
#[0 1 218 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 5 85 0 102] 
#[0 1 222 0 8 0 9 0 15 0 79] 
#[0 1 222 0 8 0 9 0 15 0 79] 
#[0 1 222 0 8 0 9 0 15 0 79] 
#[0 1 222 0 8 0 9 0 15 0 79] 
#[0 5 89 0 9] 
#[0 1 222 0 8 0 9 0 15 0 79] 
#[0 5 93 0 80] 
#[0 1 226 0 15 0 24 0 82] 
#[0 1 230 0 15 0 82] 
#[1 5 97 0 9 3 141 0 15] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 101 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[1 5 105 0 9 3 141 0 15] 
#[1 1 234 0 1 1 234 0 5 1 234 0 8 1 234 0 10 1 234 0 12 1 234 0 13 1 234 0 16 1 234 0 17 1 234 0 24 1 234 0 39 1 234 0 40 1 234 0 43 1 234 0 44 1 234 0 45 5 109 0 47 1 234 0 51 1 234 0 52 1 234 0 53 1 234 0 57 1 234 0 60 1 234 0 63 1 234 0 69 1 234 0 73 1 234 0 76 1 234 0 77 1 234 0 78 1 234 0 81 1 234 0 82] 
#[0 1 234 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 1 238 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 1 242 0 9 0 15] 
#[0 1 246 0 9 0 15 0 23 0 24 0 80 0 82] 
#[0 1 250 0 8 0 9 0 15 0 79] 
#[0 1 250 0 8 0 9 0 15 0 79] 
#[0 5 113 0 24] 
#[0 1 254 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 117 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 121 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 2 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 2 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 2 6 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82]
	).
]
