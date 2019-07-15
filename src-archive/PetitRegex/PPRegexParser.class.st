Class {
	#name : #PPRegexParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'regex',
		'atom',
		'anyAtom',
		'beginOfLineAtom',
		'endOfLineAtom',
		'characterAtom',
		'rangePieceSpec',
		'number',
		'groupAtom',
		'escapeAtom',
		'characterGroup',
		'quantifier',
		'characterSet',
		'characterSetClass',
		'characterSetEscape',
		'characterSetRange',
		'characterSetCharacter',
		'predicateAtom',
		'piece',
		'branch'
	],
	#classVars : [
		'BeginOfLineParser',
		'ClassMap',
		'EndOfLineParser',
		'EscapeMap'
	],
	#category : #'PetitRegex-Core'
}

{ #category : #private }
PPRegexParser class >> atBeginOfWord: aStream [
	^ (self isWordChar: (self lastCharIn: aStream)) not and: [ self isWordChar: aStream peek ]
]

{ #category : #private }
PPRegexParser class >> atEndOfWord: aStream [
	^ (self isWordChar: (self lastCharIn: aStream)) and: [ (self isWordChar: aStream peek) not ]
]

{ #category : #private }
PPRegexParser class >> atWordBoundary: aStream [
	^ (self isWordChar: (self lastCharIn: aStream)) xor: (self isWordChar: aStream peek)
]

{ #category : #accessing }
PPRegexParser class >> beginOfLineParser [
	BeginOfLineParser isNil ifTrue: [ 
		BeginOfLineParser  := self createBeginOfLineParser.
	].
	^ BeginOfLineParser 
]

{ #category : #private }
PPRegexParser class >> condition: aBlock message: aString [
	^ [ :stream | (aBlock value: stream) ifFalse: [ PPFailure message: aString context: stream  ] ] asParser
]

{ #category : #creation }
PPRegexParser class >> createBeginOfLineParser [
	^ [ :context | 
		(context position = 0 or: [ (context skip: -1; next) = Character cr ])
			ifFalse: [ PPFailure message: '^ not expected' context: context ] ] asParser.
]

{ #category : #creation }
PPRegexParser class >> createEndOfLineParser [ 
	^ [ :context | 
		(context atEnd or: [ context peek = Character cr ])
			ifFalse: [ PPFailure message: '$ not expected' context: context  ] ] asParser
]

{ #category : #accessing }
PPRegexParser class >> endOfLineParser [
	EndOfLineParser isNil ifTrue: [ 
		EndOfLineParser  := self createEndOfLineParser.
	].
	^ EndOfLineParser 
]

{ #category : #initialization }
PPRegexParser class >> initialize [
	self initializeOther.
	self initializeClassMap.
	self initializeEscapeMap
]

{ #category : #initialization }
PPRegexParser class >> initializeClassMap [
	ClassMap := Dictionary new.
	ClassMap
		at: 'alnum' put: #word asParser;
		at: 'alpha' put: #letter asParser;
		at: 'cntrl' put: #control asParser;
		at: 'digit' put: #digit asParser;
		at: 'graph' put: #control asParser negate;
		at: 'lower' put: #lowercase asParser;
		at: 'print' put: #control asParser negate;
		at: 'punct' put: #punctuation asParser;
		at: 'space' put: #space asParser;
		at: 'upper' put: #uppercase asParser;
		at: 'xdigit' put: #hex asParser
]

{ #category : #initialization }
PPRegexParser class >> initializeEscapeMap [
	EscapeMap := Dictionary new.
	EscapeMap
		"only at beginning of string"
		at: $A put: (self condition: [ :stream | stream position = 0 ] message: 'beginning of input expected');
		"only at end of string"		
		at: $Z put: (self condition: [ :stream | stream atEnd ] message: 'end of input expected');
		"an empty string at a word boundary"
		at: $b put: (self condition: [ :stream | self atWordBoundary: stream ] message: 'word boundary expected');
		"an empty string not at a word boundary"
		at: $B put: (self condition: [ :stream | (self atWordBoundary: stream) not ] message: 'no word boundary expected');
		"an empty string at the beginning of a word"
		at: $< put: (self condition: [ :stream | self atBeginOfWord: stream ] message: 'beginning of word expected');
		"an empty string at the end of a word"
		at: $> put: (self condition: [ :stream | self atEndOfWord: stream ] message: 'end of word expected');
		"newline"
		at: $n put: Character lf asParser;
		"carriage return"
		at: $r put: Character cr asParser;
		"tab"
		at: $t put: Character tab asParser;
		"digit"
		at: $d put: #digit asParser;
		"not digit"
		at: $D put: #digit asParser negate;
		"word"
		at: $w put: #word asParser / $_ asParser;
		"not word"
		at: $W put: #word asParser negate;
		"whitespace"
		at: $s put: #space asParser;
		"not whitespace"
		at: $S put: #space asParser negate;
		"backslash"
		at: $\ put: $\ asParser
]

{ #category : #initialization }
PPRegexParser class >> initializeOther [
	BeginOfLineParser := self createBeginOfLineParser.
	EndOfLineParser := self createEndOfLineParser 
]

{ #category : #private }
PPRegexParser class >> isWordChar: aCharacterOrNil [
	^ aCharacterOrNil ~~ nil and: [ aCharacterOrNil isAlphaNumeric ]
]

{ #category : #private }
PPRegexParser class >> lastCharIn: aStream [
	^ aStream position = 0 ifFalse: [ aStream skip: -1; next ]
]

{ #category : #'grammar-atoms' }
PPRegexParser >> anyAtom [
	^ $. asParser map: [ :char | (PPPredicateObjectParser char: (Character value: 0)) negate ]
]

{ #category : #grammar }
PPRegexParser >> atom [
	^ groupAtom / characterGroup / predicateAtom / anyAtom / beginOfLineAtom / endOfLineAtom / escapeAtom / characterAtom
]

{ #category : #'grammar-atoms' }
PPRegexParser >> beginOfLineAtom [
	^ $^ asParser answer: BeginOfLineParser
]

{ #category : #grammar }
PPRegexParser >> branch [
	^ (piece plus foldLeft: [ :a :b | a , b ])
	/ (PPEpsilonParser new ==> [ :r | PPEpsilonParser new ])
]

{ #category : #'grammar-atoms' }
PPRegexParser >> characterAtom [
	^ (PPPredicateObjectParser anyOf: '()[|:{*+?\.^$') negate map: [ :char | char asParser ]
]

{ #category : #'grammar-atoms' }
PPRegexParser >> characterGroup [
	^  $[ asParser , $^ asParser optional, $] asParser optional,  $- asParser optional , characterSet star , $- asParser optional , $] asParser 
	map: [ :open :negate :closeSquareBracket :opend :parsers :closed :close |
		| result |
		result := parsers
			inject: PPChoiceParser new
			into: [ :each :other | each / other ].
		(opend notNil or: [ closed notNil ])
			ifTrue: [ result := $- asParser / result ].
		closeSquareBracket notNil ifTrue: [ result := $] asParser / result ].
		result children size = 1
			ifTrue: [ result := result children first ]. 
		negate isNil
			ifTrue: [ result ]
			ifFalse: [ result negate ] ] 
]

{ #category : #'grammar-characters' }
PPRegexParser >> characterSet [
	^ characterSetClass / characterSetEscape / characterSetRange / characterSetCharacter
]

{ #category : #'grammar-characters' }
PPRegexParser >> characterSetCharacter [
	^ (PPPredicateObjectParser anyOf: '-]') negate map: [ :char | char asParser ]
]

{ #category : #'grammar-characters' }
PPRegexParser >> characterSetClass [
	^ [ :stream | stream position ] asParser , '[:' asParser , #word asParser star flatten , ':]' asParser map: [ :pos :open :class :close | 
		ClassMap at: class ifAbsent: [ PPFailure message: 'Invalid character class [:' , class , ':]' context: nil at: pos ] ]
]

{ #category : #'grammar-characters' }
PPRegexParser >> characterSetEscape [
	^ escapeAtom
]

{ #category : #'grammar-characters' }
PPRegexParser >> characterSetRange [
	^ [ :stream | stream position ] asParser , #any asParser , $- asParser , $] asParser negate map: [ :pos :start :sep :stop | 
		start < stop
			ifTrue: [ PPPredicateObjectParser between: start and: stop ]
			ifFalse: [ PPFailure message: 'Invalid character range: ' , (String with: start with: $- with: stop) context: nil at: pos ] ]
]

{ #category : #'grammar-atoms' }
PPRegexParser >> endOfLineAtom [
	^ $$ asParser answer: EndOfLineParser
]

{ #category : #'grammar-atoms' }
PPRegexParser >> escapeAtom [
	^ $\ asParser , #any asParser map: [ :escape :char | EscapeMap at: char ifAbsent: [ char asParser ] ]
]

{ #category : #'grammar-atoms' }
PPRegexParser >> groupAtom [
	^ $( asParser , regex , $) asParser ==> #second
]

{ #category : #other }
PPRegexParser >> number [
	^ #digit asParser plus flatten ==> [ :token | token asInteger ]
]

{ #category : #'grammar-operators' }
PPRegexParser >> oneOrMorePiece [
	"+	1 or more times"
	
	^ $+ asParser , quantifier map: [ :op :qu | qu setMin: 1 ]
]

{ #category : #grammar }
PPRegexParser >> piece [
	^ atom , (self zeroOrOnePiece /  self zeroOrMorePiece / self oneOrMorePiece / self rangePiece) optional map: [ :at :op |
		op isNil
			ifTrue: [ at ]
			ifFalse: [ op setParser: at ] ]
]

{ #category : #'grammar-atoms' }
PPRegexParser >> predicateAtom [
	^ $: asParser , $^ asParser optional , #word asParser plus flatten , $: asParser map: [ :begin :negated :selector :end |
		| result |
		result := PPPredicateObjectParser 
			on: (PPCharSetPredicate on: [ :char | char perform: selector asSymbol ]) 
			message: selector printString , ' expected'.
		negated isNil
			ifFalse: [ result := result negated ].
		result ]
]

{ #category : #'grammar-operators' }
PPRegexParser >> quantifier [
	^ ($+ asParser ==> [ :node | PPPossessiveRepeatingParser new ])
	/ ($? asParser ==> [ :node | PPLazyRepeatingParser new setLimit: nil asParser end ])
	/ (nil asParser ==> [ :node | PPGreedyRepeatingParser new setLimit: nil asParser end ])
]

{ #category : #'grammar-operators' }
PPRegexParser >> rangePiece [
	^ ${ asParser , rangePieceSpec , $} asParser , quantifier 
		map: [ :op :ra :cl :qu | qu setMin: ra first; setMax: ra last ]
]

{ #category : #'grammar-operators' }
PPRegexParser >> rangePieceSpec [
	"{n,m}	at least n but not more than m times
	{n,}	at least n times
	{n}	exactly n times"
	
	^ number optional , $, asParser optional , number optional
		map: [ :n :op :m | (n ifNil: [ 0 ]) to: (m ifNil: [ SmallInteger maxVal ]) ]
]

{ #category : #grammar }
PPRegexParser >> regex [
	^ ((branch separatedBy: $| asParser) foldLeft: [ :a :op :b | a // b ])
	/ (PPEpsilonParser new ==> [ :r | PPEpsilonParser new ])
]

{ #category : #private }
PPRegexParser >> resolveStubs: aParser [
	"In this post-processing step we need to fix the quantifiers."
	
	aParser nextSets keysAndValuesDo: [ :start :follow |
		(start isKindOf: PPLimitedRepeatingParser) ifTrue: [
			| limit |
			limit := follow collect: [ :each | 
				each isNil
					ifTrue: [ nil asParser end ]
					ifFalse: [ each ] ].
			start setLimit: (limit size = 1
				ifTrue: [ limit anyOne ]
				ifFalse: [ PPChoiceParser withAll: limit ]) ].
			
		(start isKindOf: PPLimitedChoiceParser) ifTrue: [ 
			| limit |
			limit := follow collect: [ :each | 
				each isNil
					ifTrue: [ nil asParser end ]
					ifFalse: [ each ] ].
			start limit: (limit size = 1
				ifTrue: [ limit anyOne and ]
				ifFalse: [ (PPChoiceParser withAll: limit) and ]) ].
	].
	^ aParser
]

{ #category : #accessing }
PPRegexParser >> start [
	^ regex end ==> [ :node | self resolveStubs: node ]
]

{ #category : #'grammar-operators' }
PPRegexParser >> zeroOrMorePiece [
	"*	0 or more times"
		
	^ $* asParser , quantifier map: [ :op :qu | qu ]
]

{ #category : #'grammar-operators' }
PPRegexParser >> zeroOrOnePiece [
	"?	0 or 1 times"

	^ $? asParser , quantifier map: [ :op :qu | qu setMax: 1 ]
]
