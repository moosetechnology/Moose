Class {
	#name : #SmaCCRewriteTreeMatch,
	#superclass : #SmaCCRewriteMatch,
	#instVars : [
		'startingState',
		'source',
		'trees'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #testing }
SmaCCRewriteTreeMatch >> canMatch: aClass [
	^ self trees
		anySatisfy: [ :each | each class == aClass or: [ each isKindOf: SmaCCPatternNode ] ]
]

{ #category : #printing }
SmaCCRewriteTreeMatch >> displayOn: aStream [
	aStream
		nextPutAll:
			((source isNil or: [ source isEmpty ])
				ifTrue: [ '"Empty"' ]
				ifFalse: [ source ])
]

{ #category : #'initialize-release' }
SmaCCRewriteTreeMatch >> initialize [
	super initialize.
	source := ''
]

{ #category : #matching }
SmaCCRewriteTreeMatch >> match: aSmaCCRewriteMatchContext [
	| context |
	1 to: self trees size do:
		[ :i | 
		context := Dictionary new.
		((trees at: i)
			match: aSmaCCRewriteMatchContext match
			inContext: context)
			ifTrue: [ ^ context ] ].
	^ nil
]

{ #category : #public }
SmaCCRewriteTreeMatch >> saveOn: aStream [
	startingState notNil
		ifTrue: [ aStream
				nextPutAll: startingState;
				cr ].
	aStream
		nextPutAll: '>>>';
		nextPutAll: source;
		nextPutAll: '<<<'
]

{ #category : #public }
SmaCCRewriteTreeMatch >> source [
	^ source
]

{ #category : #public }
SmaCCRewriteTreeMatch >> source: aString [
	source := aString.
	trees := nil.
	self modified
]

{ #category : #public }
SmaCCRewriteTreeMatch >> startingState [
	^ startingState
]

{ #category : #public }
SmaCCRewriteTreeMatch >> startingState: aString [
	startingState := aString.
	self modified
]

{ #category : #private }
SmaCCRewriteTreeMatch >> startingStateIndex [
	startingState isNil
		ifTrue: [ ^ 1 ].
	^ self parserClass
		perform: ('startingStateFor' , startingState) asSymbol
]

{ #category : #accessing }
SmaCCRewriteTreeMatch >> trees [
	^ trees
		ifNil: [ trees := [ startingState isNil
				ifTrue: [ self parserClass parseAndCacheAllPossibleStates: source ]
				ifFalse: [ self parserClass parseAndCacheAll: source startingAt: self startingStateIndex ] ]
				on: SmaCCParserError
				do: [ :ex | ex return: #() ] ]
]

{ #category : #accessing }
SmaCCRewriteTreeMatch >> trees: aCollection [
	trees := aCollection
]
