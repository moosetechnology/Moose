"
A RTTextTokenizer is responsible for splitting a text into lines and lines into words.

Instance Variables
	wordSeparators:		<Collection>

wordSeparators
	- collection of characters which are considered as word separators

"
Class {
	#name : #RTTextTokenizer,
	#superclass : #RTObject,
	#instVars : [
		'wordSeparators'
	],
	#category : #'Roassal2-Builder-TextBuilder'
}

{ #category : #initialization }
RTTextTokenizer >> defaultWordSeparators [
	^ String
		streamContents: [ :stream | 
			stream
				nextPutAll: Character separators;
				nextPutAll: '()[]{}.;' ]
]

{ #category : #initialization }
RTTextTokenizer >> initialize [
	super initialize.
	wordSeparators := self defaultWordSeparators.
]

{ #category : #private }
RTTextTokenizer >> normalizeString: aString [
	"It replaces tab characters by spaces, because tabs are not well handled by Athens."
	^ String streamContents: [ :aStream |
		aString do: [ :eachChar |
			eachChar = Character tab
				ifTrue: [ aStream nextPutAll: '       ' ]
				ifFalse: [ aStream nextPut: eachChar ]
			 ]		
	]
]

{ #category : #parsing }
RTTextTokenizer >> tokenize: aString [
	| lines |
	lines := RTTextLines new.
	aString
		lineIndicesDo: [ :startLine :endLine :endLineWithEOL | 
			| line lineString wordStrings startWord endWord |
			lineString := aString copyFrom: startLine to: endLine.
			line := RTTextLine new.
			wordStrings := self tokenizeLine: lineString.
			startWord := 0.
			wordStrings
				do: [ :wordString | 
					| normalizedString interval |
					endWord := startWord + wordString size.
					normalizedString := self normalizeString: wordString.
					interval := startLine + startWord to: startLine + endWord - 1.
					line
						add:
							(RTTextWord new
								text: normalizedString;
								interval: interval;
								yourself).
					startWord := endWord ].
			lines add: line ].
	^ lines
]

{ #category : #parsing }
RTTextTokenizer >> tokenizeLine: lineString [
	^ lineString findTokens: self wordSeparators keep: self wordSeparators
]

{ #category : #parsing }
RTTextTokenizer >> wordSeparators [
	^ wordSeparators
]
