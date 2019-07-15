Class {
	#name : #SmaCCRewriteMatch,
	#superclass : #Object,
	#instVars : [
		'rewrite'
	],
	#classVars : [
		'HaltBlock'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #accessing }
SmaCCRewriteMatch class >> haltBlock [
	^ HaltBlock ifNil: [ [ :rewrite :node | false ] ]
]

{ #category : #accessing }
SmaCCRewriteMatch class >> haltBlock: aBlock [
	HaltBlock := aBlock
]

{ #category : #testing }
SmaCCRewriteMatch >> canMatch: aClass [
	^ true
]

{ #category : #printing }
SmaCCRewriteMatch >> displayOn: aStream [
	self printOn: aStream
]

{ #category : #printing }
SmaCCRewriteMatch >> displayString [
	| stream |
	stream := WriteStream on: String new.
	self displayOn: stream.
	^ stream contents
]

{ #category : #matching }
SmaCCRewriteMatch >> match: aSmaCCRewriteMatchContext [
	self subclassResponsibility
]

{ #category : #public }
SmaCCRewriteMatch >> modified [
	rewrite notNil
		ifTrue: [ rewrite modified ]
]

{ #category : #accessing }
SmaCCRewriteMatch >> parserClass [
	^ rewrite parserClass
]

{ #category : #copying }
SmaCCRewriteMatch >> postCopy [
	super postCopy.
	rewrite := nil
]

{ #category : #accessing }
SmaCCRewriteMatch >> rewrite [
	^ rewrite
]

{ #category : #accessing }
SmaCCRewriteMatch >> rewrite: anObject [
	rewrite := anObject
]

{ #category : #public }
SmaCCRewriteMatch >> saveOn: aStream [
	self subclassResponsibility
]
