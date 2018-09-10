"
This is a node test parser that tracks the start and end positions of node tests and node type test arguments.
"
Class {
	#name : #XPathPositionNodeTestParser,
	#superclass : #XPathNodeTestParser,
	#instVars : [
		'startArgumentPosition',
		'endArgumentPosition'
	],
	#category : #'XPath-GTExtensions-Highlighting-Parsers'
}

{ #category : #accessing }
XPathPositionNodeTestParser >> currentPosition [
	^ readStream position
]

{ #category : #'parsing - peeking' }
XPathPositionNodeTestParser >> peekForNodeTest [
	| startPosition |

	startPosition := self currentPosition + 1.
	startArgumentPosition := nil.
	endArgumentPosition := nil.
	super peekForNodeTest
		ifFalse: [^ false].

	handler handleStartNodeTestPosition: startPosition.
	isParsingNodeTypeTest
		ifTrue: [
			handler handleStartFunctionCallPosition: startPosition.
			startArgumentPosition
			ifNotNil: [
				handler
					handleStartArgumentPosition: startArgumentPosition;
					handleEndArgumentPosition: endArgumentPosition].
			handler handleEndFunctionCallPosition: self currentPosition].
	handler handleEndNodeTestPosition: self currentPosition.
	^ true.
]

{ #category : #'parsing - peeking' }
XPathPositionNodeTestParser >> peekForNodeTestArgument [
	| startPosition |
	
	startPosition := self currentPosition + 1.
	super peekForNodeTestArgument
		ifTrue: [
			startArgumentPosition := startPosition.
			endArgumentPosition := self currentPosition.
			^ true]
		ifFalse: [^ false].
]

{ #category : #'parsing - peeking' }
XPathPositionNodeTestParser >> peekForPITestTarget [
	| startPosition |
	
	startPosition := self currentPosition + 1.
	super peekForPITestTarget
		ifTrue: [
			startArgumentPosition := startPosition.
			endArgumentPosition := self currentPosition.
			^ true]
		ifFalse: [^ false].
]
