Class {
	#name : #PPRegexMatcher,
	#superclass : #Object,
	#instVars : [
		'parser'
	],
	#classVars : [
		'ParserValidator'
	],
	#category : #'PetitRegex-Core'
}

{ #category : #'instance creation' }
PPRegexMatcher class >> for: aParser [
	^ self for: aParser ignoringCase: false
]

{ #category : #'instance creation' }
PPRegexMatcher class >> for: aParser ignoringCase: aBoolean [ 
	^ self new initializeFor: aParser ignoringCase: aBoolean
]

{ #category : #'instance creation' }
PPRegexMatcher class >> forString: aString [
	^ self for: (PPRegexParser parse: aString)
]

{ #category : #'instance creation' }
PPRegexMatcher class >> forString: aString ignoreCase: aBoolean [
	^ self for: (PPRegexParser parse: aString) ignoringCase: aBoolean
]

{ #category : #initialization }
PPRegexMatcher class >> initialize [
	ParserValidator := PPSearcher new.
	ParserValidator
		matchesAnyOf: (OrderedCollection new 
			add: (PPEpsilonParser new starGreedy: PPPattern any);
			add: ((PPRegexParser beginOfLineParser) starGreedy: PPPattern any);
			add: ((PPRegexParser endOfLineParser) starGreedy: PPPattern any);
			add: ((PPChoiceParser withAll: (Array with: PPListPattern any with: PPEpsilonParser new with: PPListPattern any)) starGreedy: PPPattern any);
			add: ((PPChoiceParser withAll: (Array with: PPListPattern any with: (PPPattern any starGreedy: PPPattern any) with: PPListPattern any)) starGreedy: PPPattern any);
			add: ((PPLimitedChoiceParser withAll: (Array with: PPListPattern any with: PPEpsilonParser new with: PPListPattern any)) starGreedy: PPPattern any);
			add: ((PPLimitedChoiceParser withAll: (Array with: PPListPattern any with: (PPPattern any starGreedy: PPPattern any) with: PPListPattern any)) starGreedy: PPPattern any);
			add: ((PPPattern any starGreedy: PPPattern any) starGreedy: PPPattern any);
			add: ((PPPattern any starGreedy: PPPattern any) plusGreedy: PPPattern any);
			add: ((PPPattern any starLazy: PPPattern any));
			yourself)
		do: [ :node :result | self error: 'Invalid regular expression' ]
]

{ #category : #copying }
PPRegexMatcher >> copy: aString replacingMatchesWith: replacementString [
	| writeStream |
	writeStream := (String new: 40) writeStream.
	self copyStream: aString to: writeStream replacingMatchesWith: replacementString.
	^ writeStream contents
]

{ #category : #copying }
PPRegexMatcher >> copy: aString translatingMatchesUsing: aBlock [
	| writeStream |
	writeStream := (String new: 40) writeStream.
	self copyStream: aString to: writeStream translatingMatchesUsing: aBlock.
	^ writeStream contents
]

{ #category : #copying }
PPRegexMatcher >> copyStream: aStream to: writeStream replacingMatchesWith: aString [
	self copyStream: aStream to: writeStream translatingMatchesUsing: [ :each | aString ]
]

{ #category : #copying }
PPRegexMatcher >> copyStream: aStream to: writeStream translatingMatchesUsing: aBlock [
	| stream |
	stream := aStream asPetitStream.
	((parser flatten ==> [ :match | 
		writeStream nextPutAll: (aBlock value: match).
		(match isEmpty and: [ stream atEnd not ])
			ifTrue: [ writeStream nextPut: stream next ].
		stream atEnd
			ifTrue: [ ^ self ] ])
	/ (#any asParser ==> [ :char | writeStream nextPut: char ]))
		star parse: stream
]

{ #category : #initialization }
PPRegexMatcher >> initializeFor: aParser ignoringCase: aBoolean [
	parser := aParser.
	ParserValidator execute: parser.
	aBoolean ifTrue: [
		parser := parser transform: [ :each |
			(each respondsTo: #caseInsensitive)
				ifTrue: [ each caseInsensitive ]
				ifFalse: [ each ] ] ].
	(parser respondsTo: #optimize)
		ifTrue: [ parser := parser optimize ]
]

{ #category : #matching }
PPRegexMatcher >> matches: anObject [
	^ parser end matches: anObject
]

{ #category : #matching }
PPRegexMatcher >> matchesIn: anObject [
	| result |
	result := OrderedCollection new.
	self 
		matchesIn: anObject
		do: [ :each | result addLast: each ].
	^ result
]

{ #category : #matching }
PPRegexMatcher >> matchesIn: anObject collect: aBlock [
	^ (self matchesIn: anObject) collect: aBlock
]

{ #category : #matching }
PPRegexMatcher >> matchesIn: anObject do: aBlock [
	| stream |
	stream := anObject asPetitStream.
	(parser flatten ==> [ :match | 
		aBlock value: match.
		(match isEmpty and: [ stream atEnd not ])
			ifTrue: [ stream next ].
		stream atEnd
			ifTrue: [ ^ self ] ]
	/ #any asParser)
		star parse: stream
]

{ #category : #matching }
PPRegexMatcher >> matchesOnStream: aStream [
	^ self matchesIn: aStream
]

{ #category : #matching }
PPRegexMatcher >> matchesOnStream: aStream collect: aBlock [
	^ self matchesIn: aStream collect: aBlock
]

{ #category : #matching }
PPRegexMatcher >> matchesOnStream: aStream do: aBlock [
	^ self matchesIn: aStream do: aBlock
]

{ #category : #matching }
PPRegexMatcher >> matchesStream: aStream [
	^ self matches: aStream
]

{ #category : #matching }
PPRegexMatcher >> matchingRangesIn: anObject [
	| result |
	result := OrderedCollection new.
	self 
		matchingRangesIn: anObject
		do: [ :each | result addLast: each ].
	^ result
]

{ #category : #matching }
PPRegexMatcher >> matchingRangesIn: anObject do: aBlock [
	| stream |
	stream := anObject asPetitStream.
	(([ :s | s position ] asParser , parser ==> [ :nodes |
		aBlock value: (nodes first + 1 to: stream position).
		nodes first = stream position
			ifTrue: [ stream next ].
		stream atEnd
			ifTrue: [ ^ self ] ])
	/ #any asParser)
		star parse: stream
]

{ #category : #searching }
PPRegexMatcher >> search: anObject [
	^ self searchOn: anObject
]

{ #category : #searching }
PPRegexMatcher >> searchOn: anObject [
	self
		matchesIn: anObject
		do: [ :match | ^ true ].
	^ false
	
]

{ #category : #testing }
PPRegexMatcher >> supportsSubexpressions [
	^ false
]
