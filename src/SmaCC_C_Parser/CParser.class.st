Class {
	#name : #CParser,
	#superclass : #SmaCCParser,
	#category : #'SmaCC_C_Parser'
}

{ #category : #'generated-accessing' }
CParser class >> cacheId [
	^'2019-04-15T17:15:42.567645-05:00'
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

{ #category : #generated }
CParser class >> reduceTable [
^#(
	#(127 1 #reduceFor: 6178817 false ) 
	#(112 1 #reduceFor: 4176900 false ) 
	#(113 1 #reduceFor: 4267010 false ) 
	#(124 1 #reduceFor: 5764097 false ) 
	#(113 1 #reduceFor: 4267015 false ) 
	#(112 1 #reduceFor: 4176898 false ) 
	#(113 1 #reduceFor: 4267014 false ) 
	#(113 1 #reduceFor: 4267012 false ) 
	#(113 1 #reduceFor: 4267013 false ) 
	#(112 1 #reduceFor: 4176901 false ) 
	#(113 1 #reduceFor: 4267011 false ) 
	#(113 1 #reduceFor: 4267016 false ) 
	#(112 1 #reduceFor: 4176899 false ) 
	#(115 1 #reduceFor: 4776961 false ) 
	#(112 1 #reduceFor: 4176897 false ) 
	#(115 1 #reduceFor: 4776962 false ) 
	#(113 1 #reduceFor: 4267017 false ) 
	#(113 1 #reduceFor: 4267009 false ) 
	#(124 1 #reduceFor: 5764098 false ) 
	#(126 1 #reduceFor: 5873665 false ) 
	#(147 1 #reduceFor: 8776706 false ) 
	#(109 1 #reduceFor: 3796993 false ) 
	#(109 1 #reduceFor: 3796995 false ) 
	#(113 1 #reduceFor: 4267018 false ) 
	#(113 1 #reduceFor: 4267019 false ) 
	#(109 1 #reduceFor: 3796997 false ) 
	#(125 1 #reduceFor: 5808130 false ) 
	#(85 1 #reduceFor: 686081 false ) 
	#(147 1 #reduceFor: 8776705 false ) 
	#(113 1 #reduceFor: 4267020 false ) 
	#(128 1 #reduceFor: 6276097 false ) 
	#(127 2 #reduceFor: 6178819 false ) 
	#(127 2 #reduceFor: 6178818 false ) 
	#(121 2 #reduceActionForenum_specifier3: 5349379 false ) 
	#(85 2 #reduceFor: 686082 false ) 
	#(107 2 #reduceFor: 3510274 false ) 
	#(107 2 #reduceFor: 3510273 false ) 
	#(108 2 #reduceActionForinit_declaration1: 3580929 false ) 
	#(110 1 #reduceFor: 4023297 false ) 
	#(111 1 #reduceFor: 4112385 false ) 
	#(109 2 #reduceFor: 3796994 false ) 
	#(109 2 #reduceFor: 3796996 false ) 
	#(114 2 #reduceActionForenum_specifier3: 4449283 false ) 
	#(109 2 #reduceFor: 3796998 false ) 
	#(141 1 #reduceFor: 8047617 false ) 
	#(148 2 #reduceFor: 8840196 false ) 
	#(125 2 #reduceFor: 5808129 false ) 
	#(126 3 #reduceFor: 5873666 false ) 
	#(128 2 #reduceFor: 6276098 false ) 
	#(127 3 #reduceFor: 6178820 false ) 
	#(123 1 #reduceFor: 5692417 false ) 
	#(122 1 #reduceFor: 5623809 false ) 
	#(148 3 #reduceFor: 8840194 false ) 
	#(118 1 #reduceFor: 4996098 false ) 
	#(116 1 #reduceFor: 4819969 false ) 
	#(118 1 #reduceFor: 4996100 false ) 
	#(90 1 #reduceFor: 1496070 false ) 
	#(90 1 #reduceFor: 1496065 false ) 
	#(90 1 #reduceFor: 1496066 false ) 
	#(90 1 #reduceFor: 1496067 false ) 
	#(90 1 #reduceFor: 1496068 false ) 
	#(143 1 #reduceFor: 8176641 false ) 
	#(90 1 #reduceFor: 1496069 false ) 
	#(86 1 #reduceFor: 771073 false ) 
	#(86 1 #reduceFor: 771074 false ) 
	#(86 1 #reduceFor: 771075 false ) 
	#(140 2 #reduceFor: 7836673 false ) 
	#(87 1 #reduceFor: 867329 false ) 
	#(89 1 #reduceFor: 1306625 false ) 
	#(91 1 #reduceFor: 1557505 false ) 
	#(92 1 #reduceFor: 1635329 false ) 
	#(93 1 #reduceFor: 1835009 false ) 
	#(94 1 #reduceFor: 1996801 false ) 
	#(95 1 #reduceFor: 2132993 false ) 
	#(96 1 #reduceFor: 2369537 false ) 
	#(97 1 #reduceFor: 2521089 false ) 
	#(98 1 #reduceFor: 2606081 false ) 
	#(99 1 #reduceFor: 2699265 false ) 
	#(100 1 #reduceFor: 2810881 false ) 
	#(101 1 #reduceFor: 2921473 false ) 
	#(102 1 #reduceFor: 3027969 false ) 
	#(103 1 #reduceFor: 3148801 false ) 
	#(105 1 #reduceFor: 3379201 false ) 
	#(142 1 #reduceFor: 8116225 false ) 
	#(138 1 #reduceFor: 7564289 false ) 
	#(138 1 #reduceFor: 7564290 false ) 
	#(138 1 #reduceFor: 7564291 false ) 
	#(138 1 #reduceFor: 7564292 false ) 
	#(138 1 #reduceFor: 7564293 false ) 
	#(138 1 #reduceFor: 7564294 false ) 
	#(141 2 #reduceFor: 8047618 false ) 
	#(148 3 #reduceFor: 8840195 false ) 
	#(126 3 #reduceFor: 5873671 false ) 
	#(132 1 #reduceFor: 6659073 false ) 
	#(131 1 #reduceFor: 6521859 false ) 
	#(129 1 #reduceFor: 6356993 false ) 
	#(130 1 #reduceFor: 6432769 false ) 
	#(126 3 #reduceFor: 5873668 false ) 
	#(106 1 #reduceFor: 3460097 false ) 
	#(121 4 #reduceFor: 5349377 false ) 
	#(110 3 #reduceFor: 4023298 false ) 
	#(136 1 #reduceFor: 7350273 false ) 
	#(111 3 #reduceFor: 4112386 false ) 
	#(148 4 #reduceFor: 8840193 false ) 
	#(118 2 #reduceFor: 4996097 false ) 
	#(114 4 #reduceFor: 4449282 false ) 
	#(116 2 #reduceFor: 4819970 false ) 
	#(119 1 #reduceFor: 5149697 false ) 
	#(120 1 #reduceFor: 5246977 false ) 
	#(118 2 #reduceFor: 4996099 false ) 
	#(133 1 #reduceFor: 6731777 false ) 
	#(89 2 #reduceFor: 1306626 false ) 
	#(89 2 #reduceFor: 1306627 false ) 
	#(146 2 #reduceFor: 8652803 false ) 
	#(146 2 #reduceFor: 8652802 false ) 
	#(146 2 #reduceFor: 8652804 false ) 
	#(89 2 #reduceFor: 1306629 false ) 
	#(87 2 #reduceFor: 867335 false ) 
	#(87 2 #reduceFor: 867336 false ) 
	#(104 1 #reduceFor: 3264516 false ) 
	#(104 1 #reduceFor: 3264521 false ) 
	#(104 1 #reduceFor: 3264514 false ) 
	#(104 1 #reduceFor: 3264517 false ) 
	#(104 1 #reduceFor: 3264518 false ) 
	#(104 1 #reduceFor: 3264515 false ) 
	#(104 1 #reduceFor: 3264519 false ) 
	#(104 1 #reduceFor: 3264513 false ) 
	#(104 1 #reduceFor: 3264520 false ) 
	#(104 1 #reduceFor: 3264522 false ) 
	#(104 1 #reduceFor: 3264523 false ) 
	#(89 2 #reduceFor: 1306628 false ) 
	#(143 2 #reduceFor: 8176642 false ) 
	#(140 3 #reduceFor: 7836675 false ) 
	#(140 3 #reduceFor: 7836674 false ) 
	#(142 2 #reduceFor: 8116226 false ) 
	#(131 2 #reduceFor: 6521857 false ) 
	#(134 1 #reduceFor: 6822913 false ) 
	#(131 2 #reduceFor: 6521858 false ) 
	#(134 1 #reduceFor: 6822914 false ) 
	#(126 4 #reduceFor: 5873669 false ) 
	#(126 4 #reduceFor: 5873670 false ) 
	#(126 4 #reduceFor: 5873667 false ) 
	#(121 5 #reduceActionForenum_specifier3: 5349378 false ) 
	#(123 3 #reduceFor: 5692418 false ) 
	#(122 3 #reduceFor: 5623810 false ) 
	#(137 1 #reduceFor: 7491585 false ) 
	#(114 5 #reduceActionForenum_specifier3: 4449281 false ) 
	#(120 2 #reduceFor: 5246978 false ) 
	#(117 3 #reduceFor: 4917249 false ) 
	#(86 3 #reduceFor: 771076 false ) 
	#(133 2 #reduceFor: 6731778 false ) 
	#(139 3 #reduceFor: 7711747 false ) 
	#(146 3 #reduceFor: 8652801 false ) 
	#(146 3 #reduceFor: 8652805 false ) 
	#(139 3 #reduceFor: 7711745 false ) 
	#(87 3 #reduceFor: 867331 false ) 
	#(88 1 #reduceFor: 1197057 false ) 
	#(87 3 #reduceFor: 867334 false ) 
	#(87 3 #reduceFor: 867333 false ) 
	#(103 3 #reduceFor: 3148802 false ) 
	#(92 3 #reduceFor: 1635332 false ) 
	#(92 3 #reduceFor: 1635330 false ) 
	#(92 3 #reduceFor: 1635331 false ) 
	#(93 3 #reduceFor: 1835010 false ) 
	#(93 3 #reduceFor: 1835011 false ) 
	#(94 3 #reduceFor: 1996802 false ) 
	#(94 3 #reduceFor: 1996803 false ) 
	#(95 3 #reduceFor: 2132994 false ) 
	#(95 3 #reduceFor: 2132996 false ) 
	#(95 3 #reduceFor: 2132995 false ) 
	#(95 3 #reduceFor: 2132997 false ) 
	#(96 3 #reduceFor: 2369539 false ) 
	#(96 3 #reduceFor: 2369538 false ) 
	#(97 3 #reduceFor: 2521090 false ) 
	#(98 3 #reduceFor: 2606082 false ) 
	#(99 3 #reduceFor: 2699266 false ) 
	#(100 3 #reduceFor: 2810882 false ) 
	#(101 3 #reduceFor: 2921474 false ) 
	#(105 3 #reduceFor: 3379202 false ) 
	#(140 4 #reduceFor: 7836676 false ) 
	#(135 2 #reduceFor: 6927366 false ) 
	#(135 2 #reduceFor: 6927362 false ) 
	#(134 2 #reduceFor: 6822915 false ) 
	#(129 3 #reduceFor: 6356994 false ) 
	#(130 3 #reduceFor: 6432770 false ) 
	#(132 3 #reduceFor: 6659074 false ) 
	#(136 3 #reduceFor: 7350274 false ) 
	#(119 3 #reduceFor: 5149698 false ) 
	#(120 3 #reduceFor: 5246979 false ) 
	#(91 4 #reduceFor: 1557506 false ) 
	#(139 4 #reduceFor: 7711746 false ) 
	#(89 4 #reduceFor: 1306630 false ) 
	#(87 4 #reduceFor: 867332 false ) 
	#(87 4 #reduceFor: 867330 false ) 
	#(135 3 #reduceFor: 6927367 false ) 
	#(135 3 #reduceFor: 6927361 false ) 
	#(135 3 #reduceFor: 6927363 false ) 
	#(135 3 #reduceFor: 6927368 false ) 
	#(135 3 #reduceFor: 6927364 false ) 
	#(136 4 #reduceFor: 7350275 false ) 
	#(137 3 #reduceFor: 7491586 false ) 
	#(144 5 #reduceFor: 8226817 false ) 
	#(144 5 #reduceFor: 8226819 false ) 
	#(145 5 #reduceFor: 8385537 false ) 
	#(88 3 #reduceFor: 1197058 false ) 
	#(102 5 #reduceFor: 3027970 false ) 
	#(135 4 #reduceFor: 6927369 false ) 
	#(135 4 #reduceFor: 6927365 false ) 
	#(145 6 #reduceFor: 8385539 false ) 
	#(145 7 #reduceFor: 8385538 false ) 
	#(145 7 #reduceFor: 8385540 false ) 
	#(144 7 #reduceFor: 8226818 false )
	).
]

{ #category : #'generated-accessing' }
CParser class >> scannerClass [
	^CScanner
]

{ #category : #generated }
CParser class >> startingStateFortranslationUnit [
	^ 1
]

{ #category : #generated }
CParser class >> symbolNames [
	^ #('"!"' '"!="' '"%"' '"%="' '"&"' '"&&"' '"&="' '"("' '")"' '"*"' '"*="' '"+"' '"++"' '"+="' '","' '"-"' '"--"' '"-="' '"->"' '"."' '"/"' '"/="' '":"' '";"' '"<"' '"<<"' '"<<="' '"<="' '"="' '"=="' '">"' '">="' '">>"' '">>="' '"?"' '"^"' '"^="' '"auto"' '"break"' '"case"' '"char"' '"const"' '"continue"' '"default"' '"do"' '"double"' '"else"' '"enum"' '"extern"' '"float"' '"for"' '"goto"' '"if"' '"int"' '"long"' '"register"' '"return"' '"short"' '"signed"' '"sizeof"' '"static"' '"struct"' '"switch"' '"typedef"' '"union"' '"unsigned"' '"void"' '"volatile"' '"while"' '"|"' '"|="' '"||"' '"~"' '<ELLIPSIS>' '<comment>' '<IDENTIFIER>' '<CONSTANT>' '<STRING_LITERAL>' '<LEFT_BLOCK>' '<RIGHT_BLOCK>' '<LEFT_BRACE>' '<RIGHT_BRACE>' '<whitespace>' 'B e g i n' 'translationUnit' 'primary_expression' 'postfix_expression' 'argument_expression_list' 'unary_expression' 'unary_operator' 'cast_expression' 'multiplicative_expression' 'additive_expression' 'shift_expression' 'relational_expression' 'equality_expression' 'and_expression' 'exclusive_or_expression' 'inclusive_or_expression' 'logical_and_expression' 'logical_or_expression' 'conditional_expression' 'assignment_expression' 'assignment_operator' 'expression' 'constant_expression' 'declaration' 'init_declaration' 'declaration_specifiers' 'init_declarator_list' 'init_declarator' 'storage_class_specifier' 'type_specifier' 'struct_or_union_specifier' 'struct_or_union' 'struct_declaration_list' 'struct_declaration' 'specifier_qualifier_list' 'struct_declarator_list' 'struct_declarator' 'enum_specifier' 'enumerator_list' 'enumerator' 'type_qualifier' 'declarator' 'direct_declarator' 'pointer' 'type_qualifier_list' 'parameter_type_list' 'parameter_list' 'parameter_declaration' 'identifier_list' 'type_name' 'abstract_declarator' 'direct_abstract_declarator' 'initializer' 'initializer_list' 'statement' 'labeled_statement' 'compound_statement' 'declaration_list' 'statement_list' 'expression_statement' 'selection_statement' 'iteration_statement' 'jump_statement' 'external_declaration' 'function_definition' '<TypeName>' 'E O F' 'error')
]

{ #category : #generated }
CParser class >> transitionTable [
^#(
#[1 0 9 0 8 0 13 0 10 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 93 0 76 0 97 0 85 0 101 0 107 0 105 0 108 0 109 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 137 0 125 0 141 0 126 0 145 0 127 0 149 0 147 0 153 0 148 0 157 0 149] 
#[1 0 9 0 8 0 13 0 10 0 93 0 76 0 161 0 125 0 141 0 126 0 145 0 127] 
#[1 0 6 0 8 0 6 0 9 0 13 0 10 0 6 0 15 0 25 0 42 0 89 0 68 0 6 0 76 0 6 0 79 0 165 0 124 0 169 0 127 0 173 0 128] 
#[0 0 10 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 14 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 18 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 22 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[1 0 177 0 76 0 181 0 81] 
#[0 0 26 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 30 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 34 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 38 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 42 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 46 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 50 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 54 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 58 0 76 0 81] 
#[0 0 62 0 8 0 9 0 10 0 15 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 66 0 76 0 81] 
#[0 0 70 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 74 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 78 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 0 82 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[1 0 9 0 8 0 13 0 10 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 93 0 76 0 101 0 107 0 105 0 108 0 109 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 137 0 125 0 141 0 126 0 145 0 127 0 185 0 147 0 153 0 148 0 157 0 149 0 0 0 150] 
#[0 0 86 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 0 189 0 24] 
#[1 0 9 0 8 0 13 0 10 0 193 0 24 0 93 0 76 0 197 0 110 0 201 0 111 0 205 0 125 0 141 0 126 0 145 0 127] 
#[1 0 90 0 8 0 90 0 9 0 90 0 10 0 90 0 15 0 90 0 24 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 90 0 76 0 90 0 79 0 209 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 157 0 149] 
#[1 0 94 0 8 0 94 0 9 0 94 0 10 0 94 0 15 0 94 0 24 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 94 0 76 0 94 0 79 0 213 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 157 0 149] 
#[0 0 98 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[1 0 217 0 76 0 221 0 81] 
#[0 0 102 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[1 0 106 0 8 0 106 0 9 0 106 0 10 0 106 0 15 0 106 0 24 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 106 0 76 0 106 0 79 0 225 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 157 0 149] 
#[1 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 229 0 81 0 233 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 241 0 140 0 245 0 141 0 157 0 149] 
#[1 0 249 0 8 0 110 0 9 0 110 0 15 0 110 0 23 0 110 0 24 0 110 0 29 0 110 0 38 0 110 0 41 0 110 0 42 0 110 0 46 0 110 0 48 0 110 0 49 0 110 0 50 0 110 0 54 0 110 0 55 0 110 0 56 0 110 0 58 0 110 0 59 0 110 0 61 0 110 0 62 0 110 0 64 0 110 0 65 0 110 0 66 0 110 0 67 0 110 0 68 0 253 0 79 0 110 0 81 0 110 0 149] 
#[1 0 9 0 8 0 93 0 76 1 1 0 126] 
#[0 0 114 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 0 118 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 0 122 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 1 5 0 9] 
#[0 0 126 0 8 0 9 0 10 0 15 0 42 0 68 0 76 0 79] 
#[0 0 130 0 8 0 9 0 15 0 76 0 79] 
#[1 0 134 0 8 0 134 0 9 0 13 0 10 0 134 0 15 0 25 0 42 0 89 0 68 0 134 0 76 0 134 0 79 1 9 0 124 1 13 0 127] 
#[1 0 138 0 8 0 138 0 9 0 138 0 10 0 138 0 15 0 138 0 23 0 138 0 24 0 138 0 38 0 138 0 41 0 138 0 42 0 138 0 46 0 138 0 48 0 138 0 49 0 138 0 50 0 138 0 54 0 138 0 55 0 138 0 56 0 138 0 58 0 138 0 59 0 138 0 61 0 138 0 62 0 138 0 64 0 138 0 65 0 138 0 66 0 138 0 67 0 138 0 68 0 138 0 76 0 138 0 79 1 17 0 81 0 138 0 149] 
#[1 1 21 0 76 1 25 0 122 1 29 0 123] 
#[0 0 142 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 0 146 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[0 0 150 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[1 1 33 0 15 0 154 0 24] 
#[0 0 158 0 15 0 24] 
#[1 0 162 0 15 0 162 0 24 1 37 0 29 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 229 0 81 0 233 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 1 41 0 140 1 45 0 141 0 157 0 149] 
#[0 0 166 0 8 0 9 0 10 0 15 0 24 0 76 0 79] 
#[0 0 170 0 8 0 9 0 10 0 15 0 24 0 76 0 79] 
#[1 0 174 0 8 0 174 0 9 0 174 0 10 0 174 0 15 0 174 0 23 0 174 0 24 0 174 0 38 0 174 0 41 0 174 0 42 0 174 0 46 0 174 0 48 0 174 0 49 0 174 0 50 0 174 0 54 0 174 0 55 0 174 0 56 0 174 0 58 0 174 0 59 0 174 0 61 0 174 0 62 0 174 0 64 0 174 0 65 0 174 0 66 0 174 0 67 0 174 0 68 0 174 0 76 0 174 0 79 1 49 0 81 0 174 0 149] 
#[1 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 53 0 113 0 121 0 114 0 125 0 115 1 57 0 116 1 61 0 117 1 65 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[0 0 178 0 8 0 9 0 10 0 15 0 24 0 76 0 79] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 0 17 0 38 1 109 0 39 1 113 0 40 0 21 0 41 0 25 0 42 1 117 0 43 1 121 0 44 1 125 0 45 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 1 129 0 51 1 133 0 52 1 137 0 53 0 45 0 54 0 49 0 55 0 53 0 56 1 141 0 57 0 57 0 58 0 61 0 59 1 145 0 60 0 65 0 61 0 69 0 62 1 149 0 63 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 173 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 0 233 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 1 249 0 138 1 253 0 139 2 1 0 140 2 5 0 141 2 9 0 142 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146 0 157 0 149] 
#[0 0 182 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149] 
#[1 0 9 0 8 0 13 0 10 0 193 0 24 0 93 0 76 0 197 0 110 0 201 0 111 2 29 0 125 0 141 0 126 0 145 0 127] 
#[0 0 186 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[1 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 229 0 81 2 33 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 2 37 0 140 0 157 0 149] 
#[1 2 41 0 9 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 2 45 0 76 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 2 53 0 129 2 57 0 130 2 61 0 131 2 65 0 132 0 157 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 2 73 0 80 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 2 85 0 106] 
#[1 0 249 0 8 0 190 0 9 0 190 0 15 0 190 0 23 0 190 0 24 0 190 0 29 0 190 0 38 0 190 0 41 0 190 0 42 0 190 0 46 0 190 0 48 0 190 0 49 0 190 0 50 0 190 0 54 0 190 0 55 0 190 0 56 0 190 0 58 0 190 0 59 0 190 0 61 0 190 0 62 0 190 0 64 0 190 0 65 0 190 0 66 0 190 0 67 0 190 0 68 0 253 0 79 0 190 0 81 0 190 0 149] 
#[0 0 194 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 0 198 0 8 0 9 0 10 0 15 0 42 0 68 0 76 0 79] 
#[0 0 202 0 8 0 9 0 15 0 76 0 79] 
#[1 1 21 0 76 2 89 0 122 1 29 0 123] 
#[1 0 206 0 15 2 93 0 29 0 206 0 82] 
#[1 2 97 0 15 2 101 0 82] 
#[0 0 210 0 15 0 82] 
#[1 0 9 0 8 0 13 0 10 0 93 0 76 2 105 0 111 2 29 0 125 0 141 0 126 0 145 0 127] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 2 109 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 2 113 0 103 2 117 0 136] 
#[0 0 214 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[1 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 229 0 81 2 33 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 2 121 0 140 0 157 0 149] 
#[1 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 53 0 113 0 121 0 114 0 125 0 115 2 125 0 116 1 61 0 117 1 65 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[1 0 218 0 8 0 218 0 9 0 218 0 10 0 218 0 23 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 218 0 76 0 218 0 79 1 53 0 113 0 121 0 114 0 125 0 115 2 129 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[1 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 2 133 0 82 1 53 0 113 0 121 0 114 0 125 0 115 2 137 0 117 1 65 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[0 0 222 0 41 0 42 0 46 0 48 0 50 0 54 0 55 0 58 0 59 0 62 0 65 0 66 0 67 0 68 0 82 0 149] 
#[1 0 9 0 8 0 13 0 10 2 141 0 23 0 93 0 76 2 145 0 119 2 149 0 120 2 153 0 125 0 141 0 126 0 145 0 127] 
#[1 0 226 0 8 0 226 0 9 0 226 0 10 0 226 0 23 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 226 0 76 0 226 0 79 1 53 0 113 0 121 0 114 0 125 0 115 2 157 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[0 0 230 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 0 234 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 1 145 0 60 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 2 161 0 105 1 53 0 113 0 121 0 114 0 125 0 115 2 165 0 118 0 129 0 121 1 69 0 124 2 169 0 133 0 157 0 149] 
#[0 0 238 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 0 242 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 1 73 0 1 1 77 0 5 2 173 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 177 0 89 1 189 0 90] 
#[0 0 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 1 73 0 1 1 77 0 5 2 173 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 181 0 89 1 189 0 90] 
#[0 0 250 0 1 0 5 0 8 0 9 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
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
#[0 0 254 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 1 2 0 2 1 2 0 3 1 2 0 4 1 2 0 5 1 2 0 6 1 2 0 7 1 2 0 8 1 2 0 10 1 2 0 11 1 2 0 12 1 2 0 13 1 2 0 14 1 2 0 15 1 2 0 16 1 2 0 17 1 2 0 18 1 2 0 19 1 2 0 20 1 2 0 21 1 2 0 22 2 241 0 23 1 2 0 24 1 2 0 25 1 2 0 26 1 2 0 27 1 2 0 28 1 2 0 29 1 2 0 30 1 2 0 31 1 2 0 32 1 2 0 33 1 2 0 34 1 2 0 35 1 2 0 36 1 2 0 37 1 2 0 70 1 2 0 71 1 2 0 72 1 2 0 79] 
#[0 1 6 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 1 10 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 1 14 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[0 1 18 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 1 22 0 2 1 22 0 3 1 22 0 4 1 22 0 5 1 22 0 6 1 22 0 7 2 245 0 8 1 22 0 9 1 22 0 10 1 22 0 11 1 22 0 12 2 249 0 13 1 22 0 14 1 22 0 15 1 22 0 16 2 253 0 17 1 22 0 18 3 1 0 19 3 5 0 20 1 22 0 21 1 22 0 22 1 22 0 23 1 22 0 24 1 22 0 25 1 22 0 26 1 22 0 27 1 22 0 28 1 22 0 29 1 22 0 30 1 22 0 31 1 22 0 32 1 22 0 33 1 22 0 34 1 22 0 35 1 22 0 36 1 22 0 37 1 22 0 70 1 22 0 71 1 22 0 72 3 9 0 79 1 22 0 80 1 22 0 82] 
#[1 1 26 0 2 1 26 0 3 3 13 0 4 1 26 0 5 1 26 0 6 3 17 0 7 1 26 0 9 1 26 0 10 3 21 0 11 1 26 0 12 3 25 0 14 1 26 0 15 1 26 0 16 3 29 0 18 1 26 0 21 3 33 0 22 1 26 0 23 1 26 0 24 1 26 0 25 1 26 0 26 3 37 0 27 1 26 0 28 3 41 0 29 1 26 0 30 1 26 0 31 1 26 0 32 1 26 0 33 3 45 0 34 1 26 0 35 1 26 0 36 3 49 0 37 1 26 0 70 3 53 0 71 1 26 0 72 1 26 0 80 1 26 0 82 3 57 0 104] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 3 61 0 91] 
#[0 1 30 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 24 0 25 0 26 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 70 0 72 0 80 0 82] 
#[1 1 34 0 2 3 65 0 3 1 34 0 5 1 34 0 6 1 34 0 9 3 69 0 10 1 34 0 12 1 34 0 15 1 34 0 16 3 73 0 21 1 34 0 23 1 34 0 24 1 34 0 25 1 34 0 26 1 34 0 28 1 34 0 30 1 34 0 31 1 34 0 32 1 34 0 33 1 34 0 35 1 34 0 36 1 34 0 70 1 34 0 72 1 34 0 80 1 34 0 82] 
#[1 1 38 0 2 1 38 0 5 1 38 0 6 1 38 0 9 3 77 0 12 1 38 0 15 3 81 0 16 1 38 0 23 1 38 0 24 1 38 0 25 1 38 0 26 1 38 0 28 1 38 0 30 1 38 0 31 1 38 0 32 1 38 0 33 1 38 0 35 1 38 0 36 1 38 0 70 1 38 0 72 1 38 0 80 1 38 0 82] 
#[1 1 42 0 2 1 42 0 5 1 42 0 6 1 42 0 9 1 42 0 15 1 42 0 23 1 42 0 24 1 42 0 25 3 85 0 26 1 42 0 28 1 42 0 30 1 42 0 31 1 42 0 32 3 89 0 33 1 42 0 35 1 42 0 36 1 42 0 70 1 42 0 72 1 42 0 80 1 42 0 82] 
#[1 1 46 0 2 1 46 0 5 1 46 0 6 1 46 0 9 1 46 0 15 1 46 0 23 1 46 0 24 3 93 0 25 3 97 0 28 1 46 0 30 3 101 0 31 3 105 0 32 1 46 0 35 1 46 0 36 1 46 0 70 1 46 0 72 1 46 0 80 1 46 0 82] 
#[1 3 109 0 2 1 50 0 5 1 50 0 6 1 50 0 9 1 50 0 15 1 50 0 23 1 50 0 24 3 113 0 30 1 50 0 35 1 50 0 36 1 50 0 70 1 50 0 72 1 50 0 80 1 50 0 82] 
#[1 3 117 0 5 1 54 0 6 1 54 0 9 1 54 0 15 1 54 0 23 1 54 0 24 1 54 0 35 1 54 0 36 1 54 0 70 1 54 0 72 1 54 0 80 1 54 0 82] 
#[1 1 58 0 6 1 58 0 9 1 58 0 15 1 58 0 23 1 58 0 24 1 58 0 35 3 121 0 36 1 58 0 70 1 58 0 72 1 58 0 80 1 58 0 82] 
#[1 1 62 0 6 1 62 0 9 1 62 0 15 1 62 0 23 1 62 0 24 1 62 0 35 3 125 0 70 1 62 0 72 1 62 0 80 1 62 0 82] 
#[1 3 129 0 6 1 66 0 9 1 66 0 15 1 66 0 23 1 66 0 24 1 66 0 35 1 66 0 72 1 66 0 80 1 66 0 82] 
#[1 1 70 0 9 1 70 0 15 1 70 0 23 1 70 0 24 3 133 0 35 3 137 0 72 1 70 0 80 1 70 0 82] 
#[0 1 74 0 9 0 15 0 23 0 24 0 80 0 82] 
#[0 1 78 0 9 0 15 0 23 0 24 0 80] 
#[1 3 141 0 15 3 145 0 24] 
#[0 1 82 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 1 86 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 1 90 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 0 17 0 38 1 109 0 39 1 113 0 40 0 21 0 41 0 25 0 42 1 117 0 43 1 121 0 44 1 125 0 45 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 1 129 0 51 1 133 0 52 1 137 0 53 0 45 0 54 0 49 0 55 0 53 0 56 1 141 0 57 0 57 0 58 0 61 0 59 1 145 0 60 0 65 0 61 0 69 0 62 1 149 0 63 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 3 149 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 2 33 0 107 0 105 0 108 0 237 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 1 249 0 138 1 253 0 139 2 1 0 140 3 153 0 142 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146 0 157 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 3 157 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 3 161 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 1 94 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 1 98 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 1 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 1 106 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 0 162 0 15 0 162 0 24 1 37 0 29] 
#[0 1 110 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149] 
#[0 1 114 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[0 1 118 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 1 122 0 9 0 15] 
#[1 3 165 0 8 1 126 0 9 0 13 0 10 1 126 0 15 0 93 0 76 3 169 0 79 3 173 0 125 0 141 0 126 3 177 0 127 3 181 0 134 3 185 0 135] 
#[0 3 189 0 9] 
#[1 1 130 0 9 3 193 0 15] 
#[0 1 134 0 9 0 15] 
#[1 3 197 0 9 3 201 0 15] 
#[0 1 2 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 1 138 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 1 26 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[0 1 142 0 15 0 23 0 24 0 80 0 82] 
#[0 3 205 0 80] 
#[1 2 97 0 15 3 209 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 3 213 0 106] 
#[1 1 21 0 76 3 217 0 123] 
#[0 1 146 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 1 150 0 15 0 24] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 2 109 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 2 113 0 103 3 221 0 136 3 225 0 137] 
#[0 1 154 0 15 0 24 0 82] 
#[0 1 158 0 15 0 24] 
#[0 1 162 0 8 0 10 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 149 0 150] 
#[1 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 3 229 0 82 1 53 0 113 0 121 0 114 0 125 0 115 2 137 0 117 1 65 0 118 0 129 0 121 1 69 0 124 0 157 0 149] 
#[0 1 166 0 8 0 9 0 10 0 23 0 76 0 79] 
#[0 1 170 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 1 174 0 41 0 42 0 46 0 48 0 50 0 54 0 55 0 58 0 59 0 62 0 65 0 66 0 67 0 68 0 82 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 3 233 0 106] 
#[1 3 237 0 15 3 241 0 24] 
#[0 1 178 0 15 0 24] 
#[1 1 182 0 15 3 245 0 23 1 182 0 24] 
#[0 1 186 0 8 0 9 0 10 0 23 0 76 0 79] 
#[1 3 249 0 9 3 141 0 15] 
#[1 3 253 0 8 1 190 0 9 0 13 0 10 3 169 0 79 4 1 0 127 4 5 0 134 3 185 0 135] 
#[0 4 9 0 9] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 2 161 0 105] 
#[0 1 194 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[0 1 198 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[0 1 202 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 4 13 0 23] 
#[0 1 206 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 17 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 4 21 0 69] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 25 0 143] 
#[0 4 29 0 24] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 4 33 0 105] 
#[0 1 210 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 3 141 0 15 4 37 0 24] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 41 0 50 0 45 0 54 0 49 0 55 0 57 0 58 0 61 0 59 1 145 0 60 0 69 0 62 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 2 161 0 105 1 53 0 113 0 121 0 114 0 125 0 115 2 165 0 118 0 129 0 121 1 69 0 124 4 41 0 133 0 157 0 149] 
#[0 1 214 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 4 45 0 105] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 4 49 0 105] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 53 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 4 57 0 9 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 4 61 0 88 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 4 65 0 103] 
#[0 1 218 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 1 222 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 4 69 0 76] 
#[0 4 73 0 76] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 4 77 0 105] 
#[0 1 226 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 230 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 234 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 238 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 242 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 246 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 250 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 1 254 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 2 2 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 2 6 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[0 2 10 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 60 0 73 0 76 0 77 0 78] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 4 81 0 103] 
#[0 2 14 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
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
#[0 2 18 0 1 0 5 0 8 0 9 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 2 22 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 4 165 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 3 161 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 2 26 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[0 2 30 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 3 165 0 8 4 169 0 9 0 13 0 10 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 0 93 0 76 3 169 0 79 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 0 161 0 125 0 141 0 126 3 177 0 127 4 173 0 129 2 57 0 130 2 61 0 131 4 177 0 134 3 185 0 135 0 157 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 4 181 0 80 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 4 185 0 106] 
#[0 2 34 0 9 0 15] 
#[1 3 165 0 8 2 38 0 9 2 38 0 15 0 93 0 76 3 169 0 79 1 1 0 126 4 189 0 135] 
#[0 2 42 0 9 0 15] 
#[1 4 193 0 8 2 46 0 9 2 46 0 15 4 197 0 79] 
#[0 2 50 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[1 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 4 201 0 74 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 4 205 0 131 0 157 0 149] 
#[0 2 54 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 4 209 0 76] 
#[0 2 58 0 8 0 9 0 15 0 23 0 24 0 29 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 79 0 81 0 149] 
#[0 2 62 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 2 66 0 15 0 82] 
#[0 2 70 0 15 0 82] 
#[0 2 74 0 15 0 82] 
#[1 4 213 0 15 4 217 0 82] 
#[0 2 78 0 8 0 9 0 10 0 15 0 23 0 24 0 38 0 41 0 42 0 46 0 48 0 49 0 50 0 54 0 55 0 56 0 58 0 59 0 61 0 62 0 64 0 65 0 66 0 67 0 68 0 76 0 79 0 149] 
#[0 2 82 0 15 0 24] 
#[1 0 9 0 8 0 13 0 10 2 141 0 23 0 93 0 76 4 221 0 120 2 153 0 125 0 141 0 126 0 145 0 127] 
#[0 2 86 0 41 0 42 0 46 0 48 0 50 0 54 0 55 0 58 0 59 0 62 0 65 0 66 0 67 0 68 0 82 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 4 225 0 106] 
#[0 2 90 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 3 253 0 8 4 169 0 9 0 13 0 10 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 3 169 0 79 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 4 1 0 127 4 173 0 129 2 57 0 130 2 61 0 131 4 177 0 134 3 185 0 135 0 157 0 149] 
#[1 3 253 0 8 2 38 0 9 3 169 0 79 4 189 0 135] 
#[0 2 94 0 9] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 4 229 0 91] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 233 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 2 98 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 4 237 0 8] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 4 241 0 143] 
#[0 2 102 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 4 245 0 9 3 141 0 15] 
#[0 2 106 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 4 249 0 9] 
#[1 4 253 0 9 3 141 0 15] 
#[1 5 1 0 9 3 141 0 15] 
#[0 2 110 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 2 114 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 5 5 0 9 5 9 0 15] 
#[0 2 118 0 9 0 15] 
#[0 2 122 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[0 2 126 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 3 141 0 15 5 13 0 80] 
#[0 2 130 0 9 0 15 0 23 0 24 0 80 0 82] 
#[0 2 134 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 24 0 25 0 26 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 70 0 72 0 80 0 82] 
#[0 2 138 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 24 0 25 0 26 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 70 0 72 0 80 0 82] 
#[0 2 142 0 2 0 3 0 5 0 6 0 9 0 10 0 12 0 15 0 16 0 21 0 23 0 24 0 25 0 26 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 70 0 72 0 80 0 82] 
#[1 2 146 0 2 3 65 0 3 2 146 0 5 2 146 0 6 2 146 0 9 3 69 0 10 2 146 0 12 2 146 0 15 2 146 0 16 3 73 0 21 2 146 0 23 2 146 0 24 2 146 0 25 2 146 0 26 2 146 0 28 2 146 0 30 2 146 0 31 2 146 0 32 2 146 0 33 2 146 0 35 2 146 0 36 2 146 0 70 2 146 0 72 2 146 0 80 2 146 0 82] 
#[1 2 150 0 2 3 65 0 3 2 150 0 5 2 150 0 6 2 150 0 9 3 69 0 10 2 150 0 12 2 150 0 15 2 150 0 16 3 73 0 21 2 150 0 23 2 150 0 24 2 150 0 25 2 150 0 26 2 150 0 28 2 150 0 30 2 150 0 31 2 150 0 32 2 150 0 33 2 150 0 35 2 150 0 36 2 150 0 70 2 150 0 72 2 150 0 80 2 150 0 82] 
#[1 2 154 0 2 2 154 0 5 2 154 0 6 2 154 0 9 3 77 0 12 2 154 0 15 3 81 0 16 2 154 0 23 2 154 0 24 2 154 0 25 2 154 0 26 2 154 0 28 2 154 0 30 2 154 0 31 2 154 0 32 2 154 0 33 2 154 0 35 2 154 0 36 2 154 0 70 2 154 0 72 2 154 0 80 2 154 0 82] 
#[1 2 158 0 2 2 158 0 5 2 158 0 6 2 158 0 9 3 77 0 12 2 158 0 15 3 81 0 16 2 158 0 23 2 158 0 24 2 158 0 25 2 158 0 26 2 158 0 28 2 158 0 30 2 158 0 31 2 158 0 32 2 158 0 33 2 158 0 35 2 158 0 36 2 158 0 70 2 158 0 72 2 158 0 80 2 158 0 82] 
#[1 2 162 0 2 2 162 0 5 2 162 0 6 2 162 0 9 2 162 0 15 2 162 0 23 2 162 0 24 2 162 0 25 3 85 0 26 2 162 0 28 2 162 0 30 2 162 0 31 2 162 0 32 3 89 0 33 2 162 0 35 2 162 0 36 2 162 0 70 2 162 0 72 2 162 0 80 2 162 0 82] 
#[1 2 166 0 2 2 166 0 5 2 166 0 6 2 166 0 9 2 166 0 15 2 166 0 23 2 166 0 24 2 166 0 25 3 85 0 26 2 166 0 28 2 166 0 30 2 166 0 31 2 166 0 32 3 89 0 33 2 166 0 35 2 166 0 36 2 166 0 70 2 166 0 72 2 166 0 80 2 166 0 82] 
#[1 2 170 0 2 2 170 0 5 2 170 0 6 2 170 0 9 2 170 0 15 2 170 0 23 2 170 0 24 2 170 0 25 3 85 0 26 2 170 0 28 2 170 0 30 2 170 0 31 2 170 0 32 3 89 0 33 2 170 0 35 2 170 0 36 2 170 0 70 2 170 0 72 2 170 0 80 2 170 0 82] 
#[1 2 174 0 2 2 174 0 5 2 174 0 6 2 174 0 9 2 174 0 15 2 174 0 23 2 174 0 24 2 174 0 25 3 85 0 26 2 174 0 28 2 174 0 30 2 174 0 31 2 174 0 32 3 89 0 33 2 174 0 35 2 174 0 36 2 174 0 70 2 174 0 72 2 174 0 80 2 174 0 82] 
#[1 2 178 0 2 2 178 0 5 2 178 0 6 2 178 0 9 2 178 0 15 2 178 0 23 2 178 0 24 3 93 0 25 3 97 0 28 2 178 0 30 3 101 0 31 3 105 0 32 2 178 0 35 2 178 0 36 2 178 0 70 2 178 0 72 2 178 0 80 2 178 0 82] 
#[1 2 182 0 2 2 182 0 5 2 182 0 6 2 182 0 9 2 182 0 15 2 182 0 23 2 182 0 24 3 93 0 25 3 97 0 28 2 182 0 30 3 101 0 31 3 105 0 32 2 182 0 35 2 182 0 36 2 182 0 70 2 182 0 72 2 182 0 80 2 182 0 82] 
#[1 3 109 0 2 2 186 0 5 2 186 0 6 2 186 0 9 2 186 0 15 2 186 0 23 2 186 0 24 3 113 0 30 2 186 0 35 2 186 0 36 2 186 0 70 2 186 0 72 2 186 0 80 2 186 0 82] 
#[1 3 117 0 5 2 190 0 6 2 190 0 9 2 190 0 15 2 190 0 23 2 190 0 24 2 190 0 35 2 190 0 36 2 190 0 70 2 190 0 72 2 190 0 80 2 190 0 82] 
#[1 2 194 0 6 2 194 0 9 2 194 0 15 2 194 0 23 2 194 0 24 2 194 0 35 3 121 0 36 2 194 0 70 2 194 0 72 2 194 0 80 2 194 0 82] 
#[1 2 198 0 6 2 198 0 9 2 198 0 15 2 198 0 23 2 198 0 24 2 198 0 35 3 125 0 70 2 198 0 72 2 198 0 80 2 198 0 82] 
#[1 3 141 0 15 5 17 0 23] 
#[1 3 129 0 6 2 202 0 9 2 202 0 15 2 202 0 23 2 202 0 24 2 202 0 35 2 202 0 72 2 202 0 80 2 202 0 82] 
#[0 2 206 0 9 0 15 0 23 0 24 0 80] 
#[0 2 210 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 73 0 76 0 77 0 78 0 81 0 82 0 149 0 150] 
#[0 2 214 0 8 0 9 0 15 0 79] 
#[0 5 21 0 9] 
#[0 5 25 0 9] 
#[0 2 218 0 8 0 9 0 15 0 79] 
#[0 5 29 0 80] 
#[1 4 193 0 8 2 222 0 9 2 222 0 15 4 197 0 79] 
#[1 5 33 0 9 0 17 0 38 0 21 0 41 0 25 0 42 0 29 0 46 0 33 0 48 0 37 0 49 0 41 0 50 0 45 0 54 0 49 0 55 0 53 0 56 0 57 0 58 0 61 0 59 0 65 0 61 0 69 0 62 0 73 0 64 0 77 0 65 0 81 0 66 0 85 0 67 0 89 0 68 2 49 0 109 0 113 0 112 0 117 0 113 0 121 0 114 0 125 0 115 0 129 0 121 0 133 0 124 5 37 0 129 2 57 0 130 2 61 0 131 0 157 0 149] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 5 41 0 80 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 2 81 0 102 5 45 0 106] 
#[0 2 226 0 9] 
#[0 2 230 0 9 0 15] 
#[0 2 234 0 9 0 15] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 2 109 0 81 5 49 0 82 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 2 113 0 103 5 53 0 136] 
#[0 2 238 0 15 0 24 0 82] 
#[0 2 242 0 15 0 24] 
#[0 2 246 0 15 0 24] 
#[0 2 250 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[0 2 254 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 5 57 0 105] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 5 61 0 9 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 5 65 0 105] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 69 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 3 2 0 2 0 3 0 4 0 5 0 6 0 7 0 9 0 10 0 11 0 12 0 14 0 15 0 16 0 18 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 80 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 73 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 77 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 3 6 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 5 81 0 103] 
#[0 3 10 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 70 0 71 0 72 0 79 0 80 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 145 0 60 1 157 0 73 2 69 0 76 1 165 0 77 1 169 0 78 1 177 0 86 1 181 0 87 2 77 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 5 85 0 102] 
#[0 3 14 0 8 0 9 0 15 0 79] 
#[0 3 18 0 8 0 9 0 15 0 79] 
#[0 3 22 0 8 0 9 0 15 0 79] 
#[0 3 26 0 8 0 9 0 15 0 79] 
#[0 5 89 0 9] 
#[0 3 30 0 8 0 9 0 15 0 79] 
#[0 5 93 0 80] 
#[0 3 34 0 15 0 24 0 82] 
#[0 3 38 0 15 0 82] 
#[1 5 97 0 9 3 141 0 15] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 101 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[1 5 105 0 9 3 141 0 15] 
#[1 3 42 0 1 3 42 0 5 3 42 0 8 3 42 0 10 3 42 0 12 3 42 0 13 3 42 0 16 3 42 0 17 3 42 0 24 3 42 0 39 3 42 0 40 3 42 0 43 3 42 0 44 3 42 0 45 5 109 0 47 3 42 0 51 3 42 0 52 3 42 0 53 3 42 0 57 3 42 0 60 3 42 0 63 3 42 0 69 3 42 0 73 3 42 0 76 3 42 0 77 3 42 0 78 3 42 0 81 3 42 0 82] 
#[0 3 46 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 3 50 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 3 54 0 9 0 15] 
#[0 3 58 0 9 0 15 0 23 0 24 0 80 0 82] 
#[0 3 62 0 8 0 9 0 15 0 79] 
#[0 3 66 0 8 0 9 0 15 0 79] 
#[0 5 113 0 24] 
#[0 3 70 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 117 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[1 1 73 0 1 1 77 0 5 1 81 0 8 1 85 0 10 1 89 0 12 1 93 0 13 1 97 0 16 1 101 0 17 1 105 0 24 1 109 0 39 1 113 0 40 1 117 0 43 1 121 0 44 1 125 0 45 1 129 0 51 1 133 0 52 1 137 0 53 1 141 0 57 1 145 0 60 1 149 0 63 1 153 0 69 1 157 0 73 1 161 0 76 1 165 0 77 1 169 0 78 0 229 0 81 1 177 0 86 1 181 0 87 1 185 0 89 1 189 0 90 1 193 0 91 1 197 0 92 1 201 0 93 1 205 0 94 1 209 0 95 1 213 0 96 1 217 0 97 1 221 0 98 1 225 0 99 1 229 0 100 1 233 0 101 1 237 0 102 1 241 0 103 1 245 0 105 5 121 0 138 1 253 0 139 2 1 0 140 2 13 0 143 2 17 0 144 2 21 0 145 2 25 0 146] 
#[0 3 74 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 3 78 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82] 
#[0 3 82 0 1 0 5 0 8 0 10 0 12 0 13 0 16 0 17 0 24 0 39 0 40 0 43 0 44 0 45 0 47 0 51 0 52 0 53 0 57 0 60 0 63 0 69 0 73 0 76 0 77 0 78 0 81 0 82]
	).
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
