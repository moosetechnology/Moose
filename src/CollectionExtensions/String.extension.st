Extension { #name : #String }

{ #category : #'*CollectionExtensions' }
String >> asEnglishPlural [
	"Answer the plural of the receiver.  Assumes the receiver is an English noun.
	For a more comprehensive algorithm please refer to ''An Algorithmic Approach
	to English Pluralization'' by Damian Conway."

	self size < 2 ifTrue: [ ^self ].
	self asString = 'child' ifTrue: [ ^'children' ].

	((self last == $y) and: [ (self at: self size - 1) isVowel not ]) 
		ifTrue: [ ^self replaceSuffix: 'y' with: 'ies' ].
	(self endsWith: 's') ifTrue: [ ^self replaceSuffix: 's' with: 'ses' ].

	^self copyWith: $s.
]

{ #category : #'*CollectionExtensions' }
String >> deepFlattenInto: stream [

	stream nextPut: self
]

{ #category : #'*CollectionExtensions' }
String >> intervalFromStartLine: aStartLine startColumn: aStartColumn toEndLine: anEndLine endColumn: anEndColumn [

	" Returns an interval spanning between startLine @ startColumn to endLine @ endColumn"
	
	| lineIndex intervalStart intervalEnd |
	lineIndex := 0.
	intervalStart := 1.
	intervalEnd := 0.
	self lineIndicesDo: [ :start :endWithoutDelimiters :end |
		lineIndex := lineIndex + 1.
		lineIndex = aStartLine ifTrue: [ intervalStart := start + aStartColumn - 1 ].
		lineIndex = anEndLine ifTrue: [ intervalEnd := start + anEndColumn - 1] ].
	^ intervalStart to: intervalEnd
]

{ #category : #'*CollectionExtensions' }
String >> intervalOfLine: aLineNumber [

	"Answer an interval spanning between the first and the last character of the line from aLineNumber"
	
	| lineIndex |
	lineIndex := 0.
	self lineIndicesDo: [ :start :endWithoutDelimiters :end |
		lineIndex := lineIndex + 1.
		lineIndex = aLineNumber ifTrue: [ ^ start to: end ] ].
	^ 0 to: 0
]

{ #category : #'*CollectionExtensions' }
String >> intervalOfLineCorrespondingToIndex: anIndex [

	"Answer an interval spanning between the first and the last character of the line containing the given character index"
	
	self lineIndicesDo: [:start :endWithoutDelimiters :end |
		anIndex <= end ifTrue: [^ start to: end]].
	^ 0 to: 0
]

{ #category : #'*CollectionExtensions' }
String >> piecesCutWhere: aBlock [ 
	"Evaluate testBlock for successive pairs of the receiver elements,
	breaking the receiver into pieces between elements where
	the block evaluated to true, and return an OrderedCollection of
	those pieces."
	"'A sentence. Another sentence... Yet another sentence.'
		piecesCutWhere: [:each :next | each = $. and: [next = Character space]]"

	| pieces |
	pieces := OrderedCollection new.
	self piecesCutWhere: aBlock do: [:each | pieces add: each].
	^pieces
]

{ #category : #'*CollectionExtensions' }
String >> piecesCutWhereCamelCase [
	"Breaks apart words written in camel case.
	
	It's not simply using piecesCutWhere: because we want
	to also deal with abbreviations and thus we need to 
	decide based on three characters, not just on two:
	 ('FOOBar') piecesCutWhereCamelCase asArray = #('FOO' 'Bar').
	('FOOBar12AndSomething') piecesCutWhereCamelCase asArray = #('FOO' 'Bar' '12' 'And' 'Something')	
	"
	
	| start previous current next pieces |
	self isEmpty ifTrue: [^self].
	start := 1.
	pieces := OrderedCollection new.
	3 to: self size do: [ :index |
		previous := self at: index - 2.
		current := self at: index - 1.
		next := self at: index.
		((previous isLowercase and: [current isUppercase]) or: [
			(previous isUppercase and: [current isUppercase and: [next isLowercase ]]) or: [
				(previous isDigit not and: [current isDigit]) or: [
					previous isDigit and: [current isDigit not] 
		]]]) ifTrue: [
			pieces add: (self copyFrom: start to: index - 2).
			start := index - 1].
	].
	pieces addAll: ((self copyFrom: start to: self size) piecesCutWhere: [:a :b | 
		(a isDigit and: [b isDigit not]) or: [a isDigit not and: [b isDigit ]]]).
	^pieces
]

{ #category : #'*CollectionExtensions' }
String >> removePrefix: prefix [
	"Remove the given prefix, if present."

	^(self beginsWith: prefix) ifTrue: [ self copyFrom: 1 + prefix size to: self size ] ifFalse: [ self ]
]

{ #category : #'*CollectionExtensions' }
String >> removeSuffix: suffix [
	"Remove the given suffix, if present."

	^(self endsWith: suffix) ifTrue: [ self copyFrom: 1 to: self size - suffix size ] ifFalse: [ self ]
]

{ #category : #'*CollectionExtensions' }
String >> replaceAllRegex: aRegexString with: anotherSubstring [ 
	 
	| tempString aCollection | 
	tempString := self. 
	aCollection := aRegexString asRegex matchesIn: tempString. 
	aCollection 
		do: 
			[:subString | tempString := tempString copyReplaceAll: subString with: anotherSubstring]. 
	^tempString
]

{ #category : #'*CollectionExtensions' }
String >> replaceSuffix: suffix with: replacement [
	^ (self removeSuffix: suffix), replacement
]
