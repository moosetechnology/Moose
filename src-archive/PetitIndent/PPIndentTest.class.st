Class {
	#name : #PPIndentTest,
	#superclass : #PPAbstractParserTest,
	#instVars : [
		'aligns',
		'setIl',
		'restoreIl',
		'onside',
		'offside',
		'prefix',
		'a',
		'p',
		'align',
		'b',
		'top',
		'nl'
	],
	#category : #'PetitIndent-Tests'
}

{ #category : #'as yet unclassified' }
PPIndentTest >> setUp [
	|  |
	aligns := #aligns asParser.
	align := #align asParser.
	setIl := #setIl asParser.
	restoreIl := #restoreIl asParser.
	prefix := #prefix asParser.
	onside := #onside asParser.
	offside := #offside asParser.
	top := #top asParser.
	
	a := 'a' asParser.
	b := 'b' asParser.
	nl := #newline asParser.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testAlign [
	p := (setIl, a) trimLeft, (align, a).

	self assert: p parse: '  a
  a'.

	self assert: p fail: '  a
 a'.

		self assert: p fail: '  a
    a'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testAligns [
	self assert: aligns asParser fail: ''.
	self assert: setIl, aligns parse: ''.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testAligns2 [
	p := (setIl, a) trim, (aligns, a).

	self assert: p parse: '  a
  a'.

	self assert: p fail: '  a
 a'.

		self assert: p fail: '  a
    a'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testOffside [
	p := (setIl, a) trimLeft, (offside, a).

	self assert: p fail: '  a
  a'.

	self assert: p parse: '  a
 a'.

		self assert: p fail: '  a
    a'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testOnside [
	p := (setIl, a) trimLeft, (onside, a).

	self assert: p fail: '  a
  a'.

	self assert: p fail: '  a
 a'.

		self assert: p parse: '  a
    a'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testPop [
	p := (a ==> [ :e | a ]) push, a pop.
	
	self assert: p parse: 'a'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testPop2 [
	p := (a ==> [ :e | b ]) push, a pop.
	
	self assert: p fail: 'a'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testPrefix [
	p := (a pushAsParser), (b pushAsParser), nl, prefix.

	self assert: p parse: 'ab
ab'.
		self assert: p fail: 'abab'.
	
	self assert: p fail: 'ab
aa'.
	self assert: p fail: 'ab
bb'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testPush [
	p := (a ==> [ :e | 'aa' asParser ]) push, top.
	
	self assert: p parse: 'aaa'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testPush2 [
	p := (a ==> [ :e | 'aa' asParser ]) push, top.
	
	self assert: p fail: 'b'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testTop [
	p := (a pushAsParser), (b pushAsParser), top.

	self assert: p parse: 'abb'.
	self assert: p fail: 'aba'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testTop2 [
	p := (a pushAsParser), (b pushAsParser) optional, top.

	self assert: p parse: 'aa'.
	self assert: p parse: 'abb'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testTrimAlign [
	p := (setIl, a) trimLeft, a trimAlign.

	self assert: p parse: '  a
  a'.

	self assert: p fail: '  a
 a'.

		self assert: p fail: '  a
    a'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testTrimOffside [
	p := (setIl, a) trimLeft, a trimOffside.

	self assert: p fail: '  a
  a'.

"	self assert: p parse: '  a a'."
	self assert: p parse: '  a
 a'.

		self assert: p fail: '  a
    a'.
]

{ #category : #'as yet unclassified' }
PPIndentTest >> testTrimOnside [
	p := (setIl, a) trimLeft, a trimOnside.

	self assert: p fail: '  a
  a'.

	self assert: p fail: '  a
 a'.

"	self assert: p parse: '  a   a'."
	self assert: p parse: '  a
    a'.
]
