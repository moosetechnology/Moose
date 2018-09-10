"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalTermScannerTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-InformationRetrieval'
}

{ #category : #running }
MalTermScannerTest >> testDanglingLetter [
	self assert: (MalTermScanner scan: '   a') asArray equals: #('a')
]

{ #category : #running }
MalTermScannerTest >> testEmptyString [
	
	self assert: (MalTermScanner scan: '') isEmpty
]

{ #category : #running }
MalTermScannerTest >> testNonLetter [
	self assert: (MalTermScanner scan: '123456') isEmpty.
	self assert: (MalTermScanner scan: 'abc123abc') asArray equals: #('abc' 'abc')
]

{ #category : #running }
MalTermScannerTest >> testScanWords [
	
	
		
		self
assert: (MalTermScanner scan: 'foo') asArray 
equals: #('foo').
	
		self
assert: (MalTermScanner scan: 'foo bar') asArray 
equals: #( 'bar' 'foo')
		"self
assert: (MATermScanner scan: 'foo')  
equals: #('foo').
	
		self
assert: (MATermScanner scan: 'foo bar') 
equals: #('foo' 'bar')"
]

{ #category : #running }
MalTermScannerTest >> testTrailingWhitespace [
	self assert: (MalTermScanner scan: 'foo') asArray equals: #('foo').
	self assert: (MalTermScanner scan: '  foo  ') asArray equals: #('foo')
]

{ #category : #running }
MalTermScannerTest >> testWhitespaceString [
	self assert: (MalTermScanner scan: '               ') isEmpty.
	self assert: (MalTermScanner scan: 'foo') asArray equals: #('foo').
	self assert: (MalTermScanner scan: '  foo  ') asArray equals: #('foo')
]
