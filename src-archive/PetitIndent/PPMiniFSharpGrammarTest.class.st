Class {
	#name : #PPMiniFSharpGrammarTest,
	#superclass : #PPCompositeParserTest,
	#instVars : [
		'aPPContext'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> parserClass [
	^ PPMiniFSharpGrammar
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testConst [
	self parse: '1' rule: #const.
	self assert: result = 1.
	self parse: '123' rule: #const.	
	self assert: result = 123.
	self parse: '"Hi"' rule: #const.
	self assert: result = 'Hi'.	

]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExpr1 [
	self parse: '1;2' rule: #expr.
	self assert: result size = 2.
	self assert: result first = 1.
	self assert: result second = 2.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExpr2 [
	self parse: 'a+b' rule: #expr.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExpr3 [
	self parse: 'printf "hi"' rule: #expr.
	self assert: result size = 1.
	self assert: result first first = #printf.
	self assert: result first second = 'hi'.
	
	self parse: 'printf a' rule: #expr.	
	self assert: result size = 1.
	self assert: result first first = #printf.
	self assert: result first second = 'a'.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprArithmetics [
	self parse: '1+2' rule: #expr.
	self assert: result size = 2.
	self assert: result first = 1.
	self assert: result second = 2.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprArithmetics2 [
	self parse: '1+2+3' rule: #expr.
	self assert: result size = 3.
	self assert: result first = 1.
	self assert: result second = 2.
	self assert: result third = 3.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprArithmetics3 [
	self parse: '
	1+2+3' rule: #seqBlock.

	self assert: result size = 3.
	self assert: result first = 1.
	self assert: result second = 2.
	self assert: result third = 3.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprArithmetics4 [
	self parse: 
' 
   1
   -2
   *3' rule: #seqBlock.

	self assert: result size = 3.
	self assert: result first = 1.
	self assert: result second = 2.
	self assert: result third = 3.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprArithmetics5 [
	self parse: 
' 
   1
  +2
 - 3' rule: #seqBlock.

	self assert: result size = 3.
	self assert: result first = 1.
	self assert: result second = 2.
	self assert: result third = 3.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeq1 [
	self parse: '
	printf 1;
	printf 2;
	printf 3' rule: #seqBlock.

self assert: result size = 3.
self assert: result first first = #printf.
self assert: result first second = 1.
self assert: result third first = #printf.
self assert: result third second = 3.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeq2 [	
	
self parse: '
	printf 1;printf 2;
	printf 3' rule: #seqBlock.

self assert: result size = 3.
self assert: result first first = #printf.
self assert: result first second = 1.
self assert: result third first = #printf.
self assert: result third second = 3.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeq3 [	
	
self fail: '
   printf 1;
  printf 2;	
   printf 3' rule: #seqBlock.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeq4 [
	
self parse: '
	printf 1;
	 printf 2;
	printf 3' rule: #seqBlock.

self assert: result size = 3.
self assert: result first first = #printf.
self assert: result first second = 1.
self assert: result third first = #printf.
self assert: result third second = 3.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeq5 [
	
self parse: '
	printf 1
	;printf 2;' rule: #seqBlock.

self assert: result size = 3.
self assert: result first first = #printf.
self assert: result first second = 1.
self assert: result second first = #printf.
self assert: result second second = 2.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeqLightweight1 [	

self parse: '
   printf 1
   printf 2
   printf 3'
rule: #seqBlock.

self assert: result size = 3.
self assert: result first first = #printf.
self assert: result first second = 1.
self assert: result third first = #printf.
self assert: result third second = 3.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeqLightweight2 [

self parse: '
   printf 1
   printf 2
   printf 3'
rule: #seqBlock.

self assert: result size = 3.
self assert: result first first = #printf.
self assert: result first second = 1.
self assert: result third first = #printf.
self assert: result third second = 3.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeqLightweight3 [

parser := self parserInstanceFor: #seqBlock.
	
self fail: '
   printf 1
  printf 2
   printf 3'
rule: #seqBlock.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeqLightweight4 [

parser := self parserInstanceFor: #seqBlock.
	
self fail: '
   printf 1
   printf 2
    printf 3'
rule: #seqBlock.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testExprSeqLightweight5 [

parser := self parserInstanceFor: #seqBlock.
	
self fail: '
   printf 1
   printf 2
    printf 3'
rule: #seqBlock.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testFor [
	self parse: 'for a = 1 to 10 do printf a done' rule: #for.

	self assert: result size = 8.
	self assert: result eighth size = 1.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testFor2 [
	self parse: 
'for a = 1 to 10 do 
	printf a;
	printf b;
	printf c;
done' rule: #for.

	self assert: result size = 8.
	self assert: result eighth size = 4.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testFor3 [
	self fail: 
'for a = 1 to 10 do 
   printf a;
  printf b;
   printf c;
done' rule: #for.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testFor4 [
	self parse: 
'for a = 1 to 10 do 
   printf a
   ;printf b;
done' rule: #for.

	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight1 [
	self parse: 
'for a = 1 to 10 do 
	printf a
	printf b
	printf c
done' rule: #for.
	
	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight10 [
	self parse: 
'for a = 1 to 10 do 
	printf a
	printf b
	printf c' rule: #for.

	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight11 [
	self fail: 
'for a = 1 to 11 do 
    printf a
   printf b' rule: #for.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight2 [
	self parse: 
'for a = 1 to 10 do 
	printf a;printf b	
	printf c
done' rule: #for.
	
	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight3 [
	self fail: 
'for a = 1 to 10 do 
   printf a
  printf b
   printf c
done' rule: #for.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight4 [
	self parse: 
'for a = 1 to 10 do 
	printf a
	printf b	
	printf c' rule: #for.
	
	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight5 [
	self parse: 
'
  for a = 1 to 10 do 
	printf a
	printf b
	printf c
  done' rule: #for.
	
	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight6 [
	self parse: 
'
  for a = 1 to 10 do 
    printf a
    printf b
    printf c
   done' rule: #for.
	
	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight7 [
	self parse: 
'
  for a = 1 to 10 do 
	printf a
	printf b
	printf c
 done' rule: #for.

	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight8 [
	self parse: 
'
  for a = 1 to 10 do 
 printf a
 printf b
 printf c
  done' rule: #for.
	
	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForLightweight9 [
	self parse: 
'for a = 1 to 10 do 
	printf a; 	printf b
	printf c' rule: #for.
	
	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForMixed1 [
	self parse: 
'for a = 1 to 10 do 
	printf a
	printf b;
	printf c' rule: #for.
	
	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForMixed2 [

	self parse: 
'for a = 1 to 10 do 
	printf a
	printf b;
	 printf c' rule: #for.
	
	self assert: result size = 8.
	self assert: result eighth size = 3.
	self assert: result eighth first first = #printf.
	self assert: result eighth first second = 'a'.
	self assert: result eighth second first = #printf.
	self assert: result eighth second second = 'b'.
	self assert: result eighth third first = #printf.	
	self assert: result eighth third second = 'c'.	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForMixed3 [

	self fail: 
'for a = 1 to 10 do 
	printf a
	 printf b;
	 printf c' rule: #for.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testForMixed4 [

	self parse: 
'for a = 1 to 10 do 
	printf a
	printf b;
	 printf c' rule: #for.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLet [
	self parse: 'let a = 1 in a' rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLet2 [
	self parse: 
'let a = 1 in 
 let b = 2 in 
    a + b' rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLet3 [
	self fail: 
'  let a = 1 in 
a' rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetBlock1 [
	| setIl restoreIl expr trim p input |
	setIl := self parserInstanceFor: #setIl.
	restoreIl := self parserInstanceFor: #restoreIl.
	expr := self parserInstanceFor: #expr.
	trim := self parserInstanceFor: #trim.
	
	p := setIl, #any asParser, trim, expr, restoreIl ==> #fourth.

	input := 
'
  printf a;
  printf b;'.
	
	result := self assert: p parse: input.
	self assert: result size = 3.
    
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetBlock2 [
	| setIl restoreIl expr trim p input |
	setIl := self parserInstanceFor: #setIl.
	restoreIl := self parserInstanceFor: #restoreIl.
	expr := self parserInstanceFor: #expr.
	trim := self parserInstanceFor: #trim.
	
	p := setIl, #any asParser, trim, expr, restoreIl ==> #fourth.

	input := 
'
  printf a;
 printf b;'.
	
	result := self assert: p parse: input.
	self assert: result size = 3.
    
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetBlock3 [
	| setIl restoreIl expr trim p input |
	setIl := self parserInstanceFor: #setIl.
	restoreIl := self parserInstanceFor: #restoreIl.
	expr := self parserInstanceFor: #expr.
	trim := self parserInstanceFor: #trim.
	
	p := setIl, #any asParser, trim, expr, restoreIl ==> #fourth.

	input := 
'
  printf a
  printf b'.
	
	result := self assert: p end fail: input.
    
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight1 [
	self parse: 
'let a = 1
a' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight2 [
	self fail: 
'let a = 1
   a' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight3 [
	self parse: '
let a = 3  
let b = 1 in
 a + b' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight4 [

	self parse: 
'let a = 3  
let b = 1
a + b' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight5 [
	self fail: 
'let a = 3  
let b = 1
 a + b' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight6 [
	self fail: 
'let a = 1 in
 let b = 2
  a + b' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight7 [
	
	self fail: 
'
  let a = 3  
  let b = 1 in
 a + b' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight7b [
	
	self parse: 
'
let foo = 4 in
  let a = 3  
  let b = 1 in
 a + b' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight8 [
	
	self parse: 
'
  let a = 3  
  let b = 1
  a + b' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testLetLightweight9 [
	
	self fail: 
'
  let a = 3  
  let b = 1
   a + b' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testMixed [
	
	self parse: 
'
   let a = 3
          +1  
   let b = 1
   a + b' 
   rule: #seqBlock.

	self assert: result size = 1.
	self assert: result first first first = 'a'.
	self assert: result first first second first = 3.
	self assert: result first first second second = 1.

	self assert: result first second first first first = 'b'.
	self assert: result first second first first second first = 1.
	self assert: result first second first second first = 'a'.			
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testMixed2 [
	
	self parse: 
'
   let a = 3
         + 1 in  
    let b = 1
    a + b' 
   rule: #seqBlock.

	"seq block with one let"
	self assert: result size = 1.

	"first let"
	result := result first.
	self assert: result size = 2.
	self assert: result first first = 'a'.
	self assert: result first second first = 3.
	self assert: result first second second = 1.
	
	self assert: result second first first first = 'b'.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testMixed3 [
	
	self fail: 
'
   let a = 3
         + 1 in  
    let b = 1
     a + b' 
   rule: #seqBlock.
	
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testNumber [
	self parse: '1' rule: #number.
	self assert: result = 1.
	
	self parse: '123' rule: #const.	
	self assert: result = 123.
]

{ #category : #'as yet unclassified' }
PPMiniFSharpGrammarTest >> testValueDefinition [
	self parse: 'a = 123' rule: #valueDefinition.
	self parse: 'abc = 1' rule: #valueDefinition.	
]
