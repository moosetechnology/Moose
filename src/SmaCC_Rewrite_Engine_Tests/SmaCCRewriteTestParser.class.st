Class {
	#name : #SmaCCRewriteTestParser,
	#superclass : #SmaCCGLRParser,
	#category : #'SmaCC_Rewrite_Engine_Tests'
}

{ #category : #'generated-accessing' }
SmaCCRewriteTestParser class >> cacheId [
	^'2019-04-15T17:16:14.067598-05:00'
]

{ #category : #generated }
SmaCCRewriteTestParser class >> definitionComment [
"%glr;

%left ""+"" ""-"";
%left ""*"" ""/"";
%right ""^"";

%prefix SmaCCRewriteTest;
%suffix Node;
%root Expression;
%ignore_variables leftParen rightParen;

%hierarchy Expression (
	Number
	BinaryExpression
	);

<number>
	: \d+
	;

<whitespace>
	: \s+
	;

<patternToken>
	: \` [^\`]* \`
	;

Expression
	: ""("" 'leftParen' Expression "")"" 'rightParen' {{Expression}}
	| Expression 'left' ""+"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""-"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""*"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""/"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""^"" 'operator' Expression 'right' {{BinaryExpression}}
	| <number> 'number' {{Number}}
	;"
]

{ #category : #generated }
SmaCCRewriteTestParser class >> reduceTable [
^#(
	#(12 1 #reduceActionForExpression7: 290823 false ) 
	#(12 3 #reduceActionForExpression1: 290817 false ) 
	#(12 3 #reduceActionForExpression4: 290820 false ) 
	#(12 3 #reduceActionForExpression4: 290818 false ) 
	#(12 3 #reduceActionForExpression4: 290819 false ) 
	#(12 3 #reduceActionForExpression4: 290821 false ) 
	#(12 3 #reduceActionForExpression4: 290822 false )
	).
]

{ #category : #'generated-accessing' }
SmaCCRewriteTestParser class >> scannerClass [
	^SmaCCRewriteTestScanner
]

{ #category : #generated }
SmaCCRewriteTestParser class >> startingStateForExpression [
	^ 1
]

{ #category : #generated }
SmaCCRewriteTestParser class >> symbolNames [
	^ #('"("' '")"' '"*"' '"+"' '"-"' '"/"' '"^"' '<number>' '<whitespace>' '<patternToken>' 'B e g i n' 'Expression' 'E O F' 'error')
]

{ #category : #generated }
SmaCCRewriteTestParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCRewriteTestExpressionNode #SmaCCRewriteTestExpressionNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
SmaCCRewriteTestParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 8 0 17 0 12] 
#[1 0 9 0 1 0 13 0 8 0 21 0 12] 
#[0 0 6 0 2 0 3 0 4 0 5 0 6 0 7 0 13] 
#[1 0 25 0 3 0 29 0 4 0 33 0 5 0 37 0 6 0 41 0 7 0 0 0 13] 
#[1 0 45 0 2 0 25 0 3 0 29 0 4 0 33 0 5 0 37 0 6 0 41 0 7] 
#[1 0 9 0 1 0 13 0 8 0 49 0 12] 
#[1 0 9 0 1 0 13 0 8 0 53 0 12] 
#[1 0 9 0 1 0 13 0 8 0 57 0 12] 
#[1 0 9 0 1 0 13 0 8 0 61 0 12] 
#[1 0 9 0 1 0 13 0 8 0 65 0 12] 
#[0 0 10 0 2 0 3 0 4 0 5 0 6 0 7 0 13] 
#[1 0 14 0 2 0 14 0 3 0 14 0 4 0 14 0 5 0 14 0 6 0 41 0 7 0 14 0 13] 
#[1 0 18 0 2 0 25 0 3 0 18 0 4 0 18 0 5 0 37 0 6 0 41 0 7 0 18 0 13] 
#[1 0 22 0 2 0 25 0 3 0 22 0 4 0 22 0 5 0 37 0 6 0 41 0 7 0 22 0 13] 
#[1 0 26 0 2 0 26 0 3 0 26 0 4 0 26 0 5 0 26 0 6 0 41 0 7 0 26 0 13] 
#[1 0 30 0 2 0 30 0 3 0 30 0 4 0 30 0 5 0 30 0 6 0 41 0 7 0 30 0 13]
	).
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteTestParser >> reduceActionForExpression1: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParens.
	result addToken: (nodes at: 3) to: result rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteTestParser >> reduceActionForExpression4: nodes [
	| result |
	result := SmaCCRewriteTestBinaryExpressionNode new.
	result left: (nodes at: 1).
	result operator: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteTestParser >> reduceActionForExpression7: nodes [
	| result |
	result := SmaCCRewriteTestNumberNode new.
	result number: (nodes at: 1).
	^ result
]
