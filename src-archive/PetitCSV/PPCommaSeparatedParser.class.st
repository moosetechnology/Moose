Class {
	#name : #PPCommaSeparatedParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'row',
		'cell',
		'rows',
		'endOfLine',
		'whitespace',
		'nonComma'
	],
	#category : #PetitCSV
}

{ #category : #'as yet unclassified' }
PPCommaSeparatedParser >> cell [
	^ whitespace star , nonComma star flatten , whitespace star
		==> [ :nodes | nodes second value ]
]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParser >> endOfLine [
	^ #newline asParser token
]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParser >> nonComma [
	^ PPPredicateObjectParser anyExceptAnyOf: {Character space . Character tab . Character cr . Character lf . $, }
]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParser >> number [ 
	^ ($- asParser optional , #digit asParser plus , ($. asParser , #digit asParser plus) optional) token
		==> [ :nodes | nodes first value asNumber ]
]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParser >> row [
	^ (cell delimitedBy: $, asParser token) ==> [ :nodes | nodes reject: [ :each | each class = PPToken ] ]
]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParser >> rows [
	^ (row delimitedBy: endOfLine)  ==> [ :nodes | nodes reject: [ :each | each class = PPToken ] ]
]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParser >> start [
	^ rows end
]

{ #category : #'as yet unclassified' }
PPCommaSeparatedParser >> whitespace [
	^ PPPredicateObjectParser anyOf: (Array with: Character space with: Character tab)
]
