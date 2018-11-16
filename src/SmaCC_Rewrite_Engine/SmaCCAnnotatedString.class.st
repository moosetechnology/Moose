Class {
	#name : #SmaCCAnnotatedString,
	#superclass : #SmaCCString,
	#instVars : [
		'node',
		'rule'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #public }
SmaCCAnnotatedString >> addAnnotationTo: aSmaCCAnnotatedStringInterval [
	(node isNil or: [ rule isNil ])
		ifTrue: [ ^ self ].
	aSmaCCAnnotatedStringInterval
		addAnnotation: (SmaCCRewriteAnnotation onNode: node rewrite: rule)
]

{ #category : #public }
SmaCCAnnotatedString >> intervalClass [
	^ SmaCCAnnotatedStringInterval
]

{ #category : #public }
SmaCCAnnotatedString >> newIntervalFor: aString [
	| interval |
	interval := super newIntervalFor: aString.
	self addAnnotationTo: interval.
	^ interval
]

{ #category : #accessing }
SmaCCAnnotatedString >> node [
	^ node
]

{ #category : #accessing }
SmaCCAnnotatedString >> node: aSmaCCParseNode [
	node := aSmaCCParseNode
]

{ #category : #public }
SmaCCAnnotatedString >> removeInterval: startInterval [
	| result |
	result := super removeInterval: startInterval.
	self addAnnotationTo: result.
	^ result
]

{ #category : #accessing }
SmaCCAnnotatedString >> rule [
	^ rule
]

{ #category : #accessing }
SmaCCAnnotatedString >> rule: aSmaCCRewrite [
	rule := aSmaCCRewrite
]
