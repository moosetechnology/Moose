Class {
	#name : #SmaCCErrorHandler,
	#superclass : #Object,
	#instVars : [
		'parser'
	],
	#category : #'SmaCC_Runtime'
}

{ #category : #'instance creation' }
SmaCCErrorHandler class >> on: aSmaCCParser [
	^ self new
		parser: aSmaCCParser;
		yourself
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> actionMask [
	^ parser actionMask
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> actionsAndSymbolsForState: stateIndex do: aBlock [
	parser actionsAndSymbolsForState: stateIndex do: aBlock
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> actionsForState: stateIndex and: aSymbolIndex [
	^ parser actionsForState: stateIndex and: aSymbolIndex
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> allActionsAndSymbolsForState: stateIndex do: aBlock [
	parser allActionsAndSymbolsForState: stateIndex do: aBlock
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> currentToken [
	^ parser currentToken
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> dismissErrorToken [
	^ parser dismissErrorToken
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> dismissStackTopForErrorRecovery: anInteger [
	^ parser dismissStackTopForErrorRecovery: anInteger
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> errorToken: aSmaCCToken [
	parser errorToken: aSmaCCToken
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> errorTokenId [
	^ parser errorTokenId
]

{ #category : #'error handling' }
SmaCCErrorHandler >> handleError: anInteger [
	self subclassResponsibility
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> isEOFToken [
	^ parser isEOFToken
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> isNodeType: aSymbol [
	^ parser isNodeType: aSymbol
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> markErrorToken [
	self errorToken: self currentToken
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> nodeStack [
	^ parser nodeStack
]

{ #category : #accessing }
SmaCCErrorHandler >> parser [
	^ parser
]

{ #category : #accessing }
SmaCCErrorHandler >> parser: aSmaCCParser [
	parser := aSmaCCParser
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> reduce: anInteger [
	^ parser reduce: anInteger
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> reduceAction [
	^ parser reduceAction
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> reportError: anInteger [
	^ parser reportError: anInteger
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> shiftAction [
	^ parser shiftAction
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> stateStack [
	^ parser stateStack
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> symbolTypes [
	^ parser symbolTypes
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> willAccept: potentialStateStack [
	^ parser willAccept: potentialStateStack
]

{ #category : #'private-parser accessing' }
SmaCCErrorHandler >> willShift: potentialStateStack [
	^ parser willShift: potentialStateStack
]
