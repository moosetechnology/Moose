Class {
	#name : #PPListsParserTest,
	#superclass : #PPCompositeParserTest,
	#instVars : [
		'aPPContext',
		'string',
		'context'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #'as yet unclassified' }
PPListsParserTest >> context [
	^ context
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> parserClass [
	^ PPListsParser
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> setUp [
	context := PPContext new.
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testContent [

	context := PPContext new.
	context indentStack push: (PPCompareParser on: [:ctx | ctx column = 1 ]).

	self parse: '
hi
there
' rule: #content.
	self assert: result size = 2.
	self assert: result first = 'hi'.
	self assert: result second = 'there'
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testItem [
	self parse: '1) abc' rule: #item.
	
	self assert: result first = 'abc'.

]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testItem2 [
	self parse: '2) abc' rule: #item.
	self assert: result first = 'abc'.
	
	self parse: '2.1) abc' rule: #item.
	self assert: result first = 'abc'.
	
	self parse: '2.2) def' rule: #item.	
	self assert: result first = 'def'.

]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testItem3 [
	self parse: '2) abc' rule: #item.
	self assert: result first = 'abc'.
	
	self parse: '2.1) abc' rule: #item.
	self assert: result first = 'abc'.
	
	self parse: '2.2) def' rule: #item.	
	self assert: result first = 'def'.

]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testItem4 [
	| source |
	
	"Its hard to se, but abc and def starts at the same column!"
	source := 
'2) abc
   def'.

	self parse: source rule: #item.
	self assert: result first = 'abc'.
	self assert: result second = 'def'.
	
	source := 
'2) abc
   def
   ghi'.

	self parse: source rule: #item.
	self assert: result first = 'abc'.
	self assert: result second =  'def'.
	self assert: result third =  'ghi'.
	
	source := 
'2) abc
  def'.

	self fail: source rule: #item.
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testItemSublist [

      string := 
'1) abc
   1.1) def
'.
	
	self parse: string rule: #item.
	self assert: result first = 'abc'.
	self assert: result second isCollection.
	self assert: result second size = 1.
	self assert: result second first first = 'def'.
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testItemWithoutParen [
	self parse: '1 abc' rule: #item.
	
	self assert: result first = 'abc'.
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testLine [
	self parse: 'hi' rule: #line.
	self assert: result = 'hi'.
	
	self parse: 'hi there how are you' rule: #line.
	self assert: result = 'hi there how are you'.
	
	self fail: '' rule: #line.

]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testList1 [

	string :=
'
1) a
2) b
3) c
'.
	self parse: string.
	
	self assert: result size = 3.
	self assert: result first first = 'a'.
	self assert: result second first = 'b'.
	self assert: result third first = 'c'.

]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testList2 [

	| sublist |
	string :=
'
1) a
   1.1) j
   1.2) k
   1.3) l
2) b
3) c
'.
	self parse: string.
	
	self assert: result size = 3.
	self assert: result first first = 'a'.
	self assert: result second first = 'b'.
	self assert: result third first = 'c'.
	
	sublist := result first second.
	self assert: sublist first first = 'j'.
	self assert: sublist second first = 'k'.	
	self assert: sublist third first = 'l'.
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testList3 [

	| sublist |
	string :=
'
1) a
   1.1) j
   1.2) k
   1.3) l
   aa
2) b
3) c
   3.1) m
   3.2) n
   3.3) o
'.
	self parse: string.
	
	self assert: result size = 3.
	self assert: result first first = 'a'.
	self assert: result first third = 'aa'.
	self assert: result second first = 'b'.
	self assert: result third first = 'c'.
	
	sublist := result first second.
	self assert: sublist first first = 'j'.
	self assert: sublist second first = 'k'.	
	self assert: sublist third first = 'l'.

	sublist := result third second.
	self assert: sublist first first = 'm'.
	self assert: sublist second first = 'n'.	
	self assert: sublist third first = 'o'.	
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testList4 [

	| sublist |
	string :=
'
1) a
   1.1) j
   1.2) k
   1.3) l
        1.3.1) q
        1.3.2) w
        1.3.3) e
   1.4) m
2) b
3) c
   3.1) m
   3.2) n
   3.3) o
'.
	self parse: string.
	
	self assert: result size = 3.
	self assert: result first first = 'a'.
	self assert: result second first = 'b'.
	self assert: result third first = 'c'.
	
	sublist := result first second.
	self assert: sublist size = 4.
	self assert: sublist first first = 'j'.
	self assert: sublist second first = 'k'.	
	self assert: sublist third first = 'l'.
	self assert: sublist fourth first = 'm'.	
		
	sublist := sublist third second.
	self assert: sublist first first = 'q'.
	self assert: sublist second first = 'w'.	
	self assert: sublist third first = 'e'.		

	sublist := result third second.
	self assert: sublist first first = 'm'.
	self assert: sublist second first = 'n'.	
	self assert: sublist third first = 'o'.	

]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testList5 [

	string :=
'
1) a
2) b
3) c
4) d
5) e
6) f
7) g
8) h
9) i
10) j
11) k
12) l
'.
	self parse: string.
	
	self assert: result size = 12.
	self assert: result first first = 'a'.
	self assert: result second first = 'b'.
	self assert: result third first = 'c'.
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testList6 [

	string :=
'
1) a
2) b
9) i
   1) ia
   2) ib
10) j
    1) ja
    2) jb
11) k
12) l
'.
	self parse: string.
	
	self assert: result size = 6.
	self assert: result first first = 'a'.
	self assert: result second first = 'b'.
	self assert: result third second first first = 'ia'.
	self assert: result third second second first = 'ib'.
	self assert: result fourth second first first = 'ja'.
	self assert: result fourth second second first = 'jb'.
	
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testList7 [

	| sublist |
	string :=
'
1) a
   1.1) j
   1.2) k
   1.3) l
        1.3.1) q
        1.3.2) w
        1.3.3) e
   1.4) m
   aa
2) b
3) c
   3.1) m
   3.2) n
   3.3) o
'.
	self parse: string.
	
	self assert: result size = 3.
	self assert: result first first = 'a'.
	self assert: result first third = 'aa'.
	self assert: result second first = 'b'.
	self assert: result third first = 'c'.
	
	sublist := result first second.
	self assert: sublist size = 4.
	self assert: sublist first first = 'j'.
	self assert: sublist second first = 'k'.	
	self assert: sublist third first = 'l'.
	self assert: sublist fourth first = 'm'.	
		
	sublist := sublist third second.
	self assert: sublist first first = 'q'.
	self assert: sublist second first = 'w'.	
	self assert: sublist third first = 'e'.		

	sublist := result third second.
	self assert: sublist first first = 'm'.
	self assert: sublist second first = 'n'.	
	self assert: sublist third first = 'o'.	
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testListMultiline [

	string :=
'
1) a
   a
2) b
   b
3) c
   c
   c
'.
	self parse: string.
	
	self assert: result size = 3.
	self assert: result first first = 'a'.
	self assert: result first second = 'a'.
	self assert: result second first = 'b'.
	self assert: result second second = 'b'.
	self assert: result third first = 'c'.
	self assert: result third second = 'c'.
	self assert: result third third = 'c'.

]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testListMultiline2 [

	| sublist |
	string :=
'
1) a
   a
   1.1) j
        j
   1.2) k
        k
        k
   1.3) l
2) b
   b
3) c
'.
	self parse: string.
	
	self assert: result size = 3.
	self assert: result first second = 'a'.
	self assert: result second second = 'b'.
	self assert: result third first = 'c'.
	
	sublist := result first third.
	self assert: sublist first second = 'j'.
	self assert: sublist second third = 'k'.	
	self assert: sublist third first = 'l'.
]

{ #category : #'as yet unclassified' }
PPListsParserTest >> testListMultiline3 [

	string :=
'
1) a
  a
2) b
   b
'.
	self fail: string rule: #start.
	self assert: result isPetitFailure.
]
