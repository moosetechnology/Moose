Class {
	#name : #PPMiniHaskellGrammarTest,
	#superclass : #PPCompositeParserTest,
	#instVars : [
		'statementBlock',
		'context'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> assert: aParser parse: anInput [
	result := super assert: aParser parse: anInput
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> assert: aParser parse: anInput end: anEnd [
	result := super assert: aParser parse: anInput end: anEnd
]

{ #category : #'as yet unclassified' }
PPMiniHaskellGrammarTest >> context [
	^ context
]

{ #category : #'as yet unclassified' }
PPMiniHaskellGrammarTest >> parserClass [
	^ PPMiniHaskellGrammar 
]

{ #category : #'as yet unclassified' }
PPMiniHaskellGrammarTest >> setUp [
	context := PPContext new.
	super setUp.

]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testDo1 [
	| string |

	string := 
'
do print 1
   print 2
   print 3'.

	self parse: string rule: #do.
	self assert: result size = 3.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testDo2 [
	| string |

	"
		Please note that ST editor does not have monospaced editor!
	"	
	string := 
'
do print 1
   print 2
   print 3

print 4
'.

	self parse: string rule: #start.
	self assert: result size = 2.
	self assert: result first size = 3.
	self assert: result second = #print.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testDo3 [
	| string |

	"
		Please note that ST editor does not have monospaced editor!
	"	
	string := 
'
do print 1
print 2
print 3

print 4'.

	self parse: string rule: #start.
	self assert: result size = 4.
	self assert: result first size = 1.
	self assert: result second = #print.
	self assert: result third  = #print.	
	self assert: result fourth = #print.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testDo4 [
	| string |

	string := 
'
do print 1
   if foo
    then print 2
    else print 3
   print 4
'.

	self parse: string rule: #start.
	self assert: result first size = 3.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testDo5 [
	| string |
	string := 
'
     do 
 print 1
 print 2'.

	self parse: string rule: #do.
	self assert: result size = 2.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testDo6 [
	| string |
	string := 
'
     do 
print 1
print 2'.

	self parse: string rule: #do.
	self assert: result size = 2.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testDoNested1 [
	| string |
	string := 
'
  do print 1
     print 2
     do print 3
        print 4'.

	self parse: string rule: #do.
	self assert: result size = 3.
	self assert: result third size = 2.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testDoNested2 [
	| string |
	string := 
'
  do print 1
     print 2
     do print 3
        print 4
     print 5'.

	self parse: string rule: #do.
	self assert: result size = 4.
	self assert: result third size = 2.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testDoNested3 [
	| string |
	string := 
'
  do print 1
     print 2
     do 
   print 3
   print 4
     print 5'.

	self parse: string rule: #do.
	self assert: result size = 4.
	self assert: result third size = 2.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf01 [
	| string |

	string :=  'if foo then print 1 else print 2'.

	self parse: string rule: #if.
	self assert: result second size = 1.
	self assert: result second first = #print.
	self assert: result third size = 1.
	self assert: result third first = #print.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf02 [
	| string |

	string := 
'
if foo 
	then print 1
	else print 2
'.

	self parse: string rule: #if.
	self assert: result second size = 1.
	self assert: result second first = #print.
	self assert: result third size = 1.
	self assert: result third first = #print.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf03 [
	| string |

	string := 
'
if foo 
	then print 1 
else print 2'.

	self fail: string rule: #if.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf04 [
	| string |

	string := 
'
if foo 
	then print 1
	     print 11      
	else print 2
	     print22
'.

	self parse: string rule: #if.
	self assert: result second size = 2.
	self assert: result third size = 2.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf05 [
	| string |

	"
		Please note that ST editor does not have monospaced editor!
	"	
	string := 
'
if foo 
	then print 1
	     print 11      
	else print 2

	print 42
'.

	self parse: string rule: #start.
	self assert: result size = 2.
	self assert: result first second size = 2.
	self assert: result first third size = 1.
	self assert: result second = #print.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf06 [
	| string |

	string := 
'
if foo
then print 2
else print 3
'.

	self parse: string rule: #if.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf07 [
	| string |

	string := 
'
if foo 
   then if bar
               then print 21
               else print 22   
                    print 23      
   else print 11
        print 12
        print 13
'.

	self parse: string rule: #if.
	self assert: result size = 3.
	self assert: result first = 'foo'.
	self assert: result second first first = 'bar'.
	self assert: result second first second size = 1.
	self assert: result second first third size = 2.
	self assert: result third size = 3.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf08 [
	| string |

	string := 
'
if foo 
	then if bar
               then print 21
               else print 22'.

	self parse: string rule: #if.
	self assert: result size = 3.
	self assert: result first = 'foo'.
	self assert: result second first first = 'bar'.
	self assert: result second first second size = 1.
	self assert: result second first second first = #print.
	self assert: result second first third size = 1.
	self assert: result second first third first = #print.
	self assert: result third isNil.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf09 [
	| string |

	string := 
'
if foo 
	then if bar
               then print 21 
	else print 22   
'.

	self parse: string rule: #if.
	self assert: result size = 3.
	self assert: result first = 'foo'.
	self assert: result second first first = 'bar'.
	self assert: result second first second size = 1.
	self assert: result second first second first = #print.
	self assert: result second first third isNil.
	self assert: result third size = 1.
	self assert: result third first = #print.

]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testIf10 [
	| string |
	string := 
'
if foo then print 1
       else print 2
'.

	self parse: string rule: #if.
	self assert: result size = 3.
	self assert: result first = 'foo'.
	self assert: result second first = #print.
	self assert: result third first = #print.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testLet1 [
	| string |
	string := 
'
let a = 1
    b = 2'.

	self parse: string rule: #let.
	self assert: result size = 2.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testLet2 [
	| string |
	string := 
'
let a = 1
     b = 2
'.

	self fail: string rule: #let.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testLet3 [
	| string |

	string := 
'
let 
	a = 1
	b = 2
'.

	self parse: string rule: #let.
	self assert: result size = 2.
]

{ #category : #'test-grammar' }
PPMiniHaskellGrammarTest >> testStatementBlock [
	statementBlock := self parserInstanceFor: #statementBlock.
	
	self assert: statementBlock parse: 'print 1'.
	self assert: result size = 1.
	
	self assert: statementBlock parse: 'print 1
print 2'.

	parser := #space asParser star, statementBlock ==> #second.
	self assert: parser parse: '
    print 1
    print 2
    print 3
'.
	self assert: result size = 3.
	
	
	parser := #space asParser star, statementBlock ==> #second.
	self assert: parser parse: '
    print 1
    print 2
   print 3
' end: 25.
	self assert: result size = 2.

]
