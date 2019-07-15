Class {
	#name : #SmaCCSymbolTableIndex,
	#superclass : #Object,
	#instVars : [
		'index',
		'symbol'
	],
	#category : #'SmaCC_Development'
}

{ #category : #'instance creation' }
SmaCCSymbolTableIndex class >> forIndex: anInteger symbol: aSmaCCSymbol [
	^ self new
		index: anInteger;
		symbol: aSmaCCSymbol;
		yourself
]

{ #category : #comparing }
SmaCCSymbolTableIndex >> = anObject [
	^ self class = anObject class
		and: [ self index = anObject index and: [ self symbol = anObject symbol ] ]
]

{ #category : #comparing }
SmaCCSymbolTableIndex >> hash [
	^ (index bitShift: 14) + symbol hash
]

{ #category : #accessing }
SmaCCSymbolTableIndex >> index [
	^ index
]

{ #category : #accessing }
SmaCCSymbolTableIndex >> index: anObject [
	index := anObject
]

{ #category : #accessing }
SmaCCSymbolTableIndex >> symbol [
	^ symbol
]

{ #category : #accessing }
SmaCCSymbolTableIndex >> symbol: anObject [
	symbol := anObject
]
