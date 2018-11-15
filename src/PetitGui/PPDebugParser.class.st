"
A PPDebugParser is  a parser that traces all the progress and returns special object that can be browsed to see how the parsing advanced over a time.

Used by adding enableDebug before parsing.

Instance Variables
	root:		result of root parser

root
	- xxxxx

"
Class {
	#name : #PPDebugParser,
	#superclass : #PPDelegateParser,
	#instVars : [
		'root'
	],
	#category : #'PetitGui-Core'
}

{ #category : #'instance creation' }
PPDebugParser class >> on: aPPParser root: debugResult [
	^ (super on: aPPParser)
		root: debugResult;
		yourself
]

{ #category : #parsing }
PPDebugParser >> parseOn: aPPContext [
	root parser: self.
	root stream: aPPContext stream.
	root start: 0.
	parser parseOn: aPPContext.
	root end: aPPContext position.
	^ root
]

{ #category : #accessing }
PPDebugParser >> root [
	^ root
]

{ #category : #accessing }
PPDebugParser >> root: aPPParserDebuggerResult [
	root := aPPParserDebuggerResult 
]
