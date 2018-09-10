Class {
	#name : #DudeSourceCodeFragmentTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #setUp }
DudeSourceCodeFragmentTest >> sourceCode [ 
	 
	^'
bla bla bla
bla bla
bla
da
da da
da da da
nu nu nu
nu nu
nu
etc
etc etc
etc etc etc
'
]

{ #category : #testing }
DudeSourceCodeFragmentTest >> testBasics [
	| aCodeFragment aMethod string1 string2 |
	string1 := 'firstMethod'.
	string2 := 'a = 2; b = 3; return a + b;'.
	aMethod := DudeDummyEntity name: string1 code: string2.
	aCodeFragment := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 23
		endLine: 25
		fragmentLength: 3.
	self assert: aCodeFragment beginLine equals: 23.
	self assert: aCodeFragment endLine equals: 25.
	self assert: aCodeFragment entity mooseName equals: string1
]

{ #category : #testing }
DudeSourceCodeFragmentTest >> testSourceLines [
	| aCodeFragment aMethod string1 |
	string1 := 'firstMethod'.
	aMethod := DudeDummyEntity name: string1 code: self sourceCode.
	aCodeFragment := DudeSourceCodeFragment
		entity: aMethod
		beginLine: 2
		endLine: 5
		fragmentLength: 4.
	self assert: aCodeFragment beginLine equals: 2.
	self assert: aCodeFragment endLine equals: 5.
	self assert: aCodeFragment entity mooseName equals: string1.
	self assert: aCodeFragment textLines size equals: 4.
	self assert: (aCodeFragment textLines at: 1) equals: 'bla bla'.
	self assert: (aCodeFragment textLines at: 2) equals: 'bla'.
	self assert: (aCodeFragment textLines at: 3) equals: 'da'.
	self assert: (aCodeFragment textLines at: 4) equals: 'da da'
]
