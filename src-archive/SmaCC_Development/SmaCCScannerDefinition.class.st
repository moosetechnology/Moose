Class {
	#name : #SmaCCScannerDefinition,
	#superclass : #Object,
	#instVars : [
		'tokens',
		'states',
		'excludeStates'
	],
	#category : #'SmaCC_Development'
}

{ #category : #accessing }
SmaCCScannerDefinition >> addExcludeState: aSymbol [
	excludeStates add: aSymbol.
	self addState: aSymbol
]

{ #category : #accessing }
SmaCCScannerDefinition >> addState: aSymbol [
	states add: aSymbol
]

{ #category : #accessing }
SmaCCScannerDefinition >> addToken: aSmaCCRENode withName: aString [
	tokens at: aString put: aSmaCCRENode
]

{ #category : #accessing }
SmaCCScannerDefinition >> defaultState [
	^ #default
]

{ #category : #testing }
SmaCCScannerDefinition >> includesTokenNamed: aString [
	^ tokens includesKey: aString
]

{ #category : #'initialize-release' }
SmaCCScannerDefinition >> initialize [
	super initialize.
	tokens := Dictionary new.
	states := Set with: self defaultState.
	excludeStates := Set new
]

{ #category : #testing }
SmaCCScannerDefinition >> isExcludeState: aSymbol [
	^ excludeStates includes: aSymbol
]

{ #category : #accessing }
SmaCCScannerDefinition >> nonExcludeStates [
	| nonExcludeStates |
	nonExcludeStates := states
		reject: [ :each | self isExcludeState: each ].
	nonExcludeStates add: self defaultState.
	^ nonExcludeStates
]

{ #category : #accessing }
SmaCCScannerDefinition >> states [
	^ states
]

{ #category : #accessing }
SmaCCScannerDefinition >> tokenNamed: aString [
	^ tokens at: aString
]

{ #category : #accessing }
SmaCCScannerDefinition >> tokenNamed: aString ifAbsentPut: aBlock [
	^ tokens at: aString ifAbsentPut: aBlock
]

{ #category : #accessing }
SmaCCScannerDefinition >> tokens [
	^ tokens
]
