Class {
	#name : #SmaCCRewriteStringTransformation,
	#superclass : #SmaCCRewriteTransformation,
	#instVars : [
		'string',
		'expression'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'instance creation' }
SmaCCRewriteStringTransformation class >> on: aString [
	^ self new
		string: aString;
		yourself
]

{ #category : #accessing }
SmaCCRewriteStringTransformation >> expression [
	^ expression
		ifNil: [ expression := SmaCCReplaceExpressionParser parse: self string ]
]

{ #category : #'initialize-release' }
SmaCCRewriteStringTransformation >> initialize [
	super initialize.
	string := ''
]

{ #category : #public }
SmaCCRewriteStringTransformation >> saveOn: aStream [
	aStream
		nextPutAll: '>>>';
		nextPutAll: self string;
		nextPutAll: '<<<'
]

{ #category : #'initialize-release' }
SmaCCRewriteStringTransformation >> string [
	^ string ifNil: [ '' ]
]

{ #category : #'initialize-release' }
SmaCCRewriteStringTransformation >> string: aString [
	string := aString.
	expression := nil.
	self modified
]

{ #category : #transforming }
SmaCCRewriteStringTransformation >> transformUsingContext: aSmaCCRewriteMatchContext [
	| newSource |
	newSource := self expression
		evaluateInContext: aSmaCCRewriteMatchContext.
	aSmaCCRewriteMatchContext
		replace: aSmaCCRewriteMatchContext match
		with: newSource
]
