"
An abstract parser for all parsers in PetitParser. Subclasses implement #parseOn: to perform the actual recursive-descent parsing. All parsers support a variety of methods to perform an actual parse, see the methods in the #parsing protocol. Parsers are combined with a series of operators that can be found in the #operations protocol.

Instance Variables:
	properties	<Dictionary>	Stores additional state in the parser object.

"
Class {
	#name : #PPParser,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'instance creation' }
PPParser class >> named: aString [
	^ self new name: aString
]

{ #category : #'instance creation' }
PPParser class >> new [
	^ self basicNew initialize
]

{ #category : #operators }
PPParser >> , aParser [ 
	"Answer a new parser that parses the receiver followed by aParser."

	^ PPSequenceParser with: self with: aParser
]

{ #category : #operators }
PPParser >> / aParser [ 
	"Answer a new parser that parses the receiver, if the receiver fails try with aParser (ordered-choice)."
	
	^ PPChoiceParser with: self with: aParser
]

{ #category : #operators }
PPParser >> // aParser [ 
	"
		Answer a new parser that parses the receiver, if the receiver fails try with aParser (ordered-choice).
		If the receiver passes, limit must pass as well.
	"
	
	^ PPLimitedChoiceParser with: self with: aParser
]

{ #category : #'operators-mapping' }
PPParser >> ==> aBlock [
	"Answer a new parser that performs aBlock as action handler on success."

	^ PPActionParser on: self block: aBlock
]

{ #category : #'operators-mapping' }
PPParser >> >=> aBlock [
	"Answer a new parser that wraps the receiving parser with a two argument block. The first argument is the parsed stream, the second argument a continuation block on the delegate parser."

	^ PPWrappingParser on: self block: aBlock
]

{ #category : #enumerating }
PPParser >> allParsers [
	"Answer all the parse nodes of the receiver."

	| result |
	result := OrderedCollection new.
	self allParsersDo: [ :parser | result addLast: parser ].
	^ result
]

{ #category : #enumerating }
PPParser >> allParsersDo: aBlock [
	"Iterate over all the parse nodes of the receiver."

	self allParsersDo: aBlock seen: IdentitySet new
]

{ #category : #enumerating }
PPParser >> allParsersDo: aBlock seen: aSet [
	"Iterate over all the parse nodes of the receiver, do not visit and follow the ones contained in aSet."

	(aSet includes: self)
		ifTrue: [ ^ self ].
	aSet add: self.
	aBlock value: self.
	self children
		do: [ :each | each allParsersDo: aBlock seen: aSet ]
]

{ #category : #operators }
PPParser >> and [
	"Answer a new parser (logical and-predicate) that succeeds whenever the receiver does, but never consumes input."

	^ PPAndParser on: self
]

{ #category : #'operators-mapping' }
PPParser >> answer: anObject [
	"Answer a new parser that always returns anObject from a successful parse."

	^ self ==> [ :nodes | anObject ]
]

{ #category : #converting }
PPParser >> asParser [
	"Answer the receiving parser."
	
	^ self
]

{ #category : #accessing }
PPParser >> child [
	self assert: (self children size == 1).
	^ self children first
]

{ #category : #accessing }
PPParser >> children [
	"Answer a set of child parsers that could follow the receiver."

	^ #()
]

{ #category : #operators }
PPParser >> def: aParser [
	"Redefine the receiver as the argument aParser. This method is useful when defining recursive parsers: instantiate a PPUnresolvedParser and later redefine it with another one."

	^ self becomeForward: (aParser name: self name)
]

{ #category : #'operators-convenience' }
PPParser >> delimitedBy: aParser [
	"Answer a new parser that parses the receiver one or more times, separated and possibly ended by aParser."
	
	^ (self separatedBy: aParser) , (aParser optional) ==> [ :node |
		node second isNil
			ifTrue: [ node first ]
			ifFalse: [ node first copyWith: node second ] ]
]

{ #category : #operators }
PPParser >> end [
	"Answer a new parser that succeeds at the end of the input and return the result of the receiver."

	^ PPEndOfInputParser on: self
]

{ #category : #'operators-mapping' }
PPParser >> flatten [
	"Answer a new parser that flattens the underlying collection."
	
	^ PPFlattenParser on: self
]

{ #category : #'operators-mapping' }
PPParser >> foldLeft: aBlock [
	"Answer a new parser that that folds the result of the receiver from left-to-right into aBlock. The argument aBlock must take two or more arguments."
	
	| size args |
	size := aBlock numArgs.
	args := Array new: size.
	^ self ==> [ :nodes |
		args at: 1 put: nodes first.
		2 to: nodes size by: size - 1 do: [ :index |
			args
				replaceFrom: 2 to: size with: nodes startingAt: index;
				at: 1 put: (aBlock valueWithArguments: args) ].
		args first ]
]

{ #category : #'operators-mapping' }
PPParser >> foldRight: aBlock [
	"Answer a new parser that that folds the result of the receiver from right-to-left into aBlock. The argument aBlock must take two or more arguments."

	| size args |
	size := aBlock numArgs.
	args := Array new: size.
	^ self ==> [ :nodes |
		args at: size put: nodes last.
		nodes size - size + 1 to: 1 by: 1 - size do: [ :index |
			args
				replaceFrom: 1 to: size - 1 with: nodes startingAt: index;
				at: size put: (aBlock valueWithArguments: args) ].
		args at: size ]
]

{ #category : #'accessing-properties' }
PPParser >> hasProperty: aKey [
	"Test if the property aKey is present."
	
	^ properties notNil and: [ properties includesKey: aKey ]
]

{ #category : #operators }
PPParser >> if: aBlock [
	^ PPConditionalParser on: self block: aBlock
]

{ #category : #initialization }
PPParser >> initialize [
]

{ #category : #testing }
PPParser >> isPetitParser [
	^ true
]

{ #category : #testing }
PPParser >> isUnresolved [
	^ false
]

{ #category : #'operators-mapping' }
PPParser >> map: aBlock [
	"Answer a new parser that works on the receiving sequence an passes in each element as a block argument."
	
	^ aBlock numArgs = 1
		ifTrue: [ self ==> aBlock ]
		ifFalse: [ self error: aBlock numArgs asString , ' arguments expected.' ]

]

{ #category : #parsing }
PPParser >> matches: anObject [
	"Answer if anObject can be parsed by the receiver."
	
	^ (self parse: anObject) isPetitFailure not
]

{ #category : #parsing }
PPParser >> matchesIn: anObject [
	"Search anObject repeatedly for the matches of the receiver. Answered an OrderedCollection of the matched parse-trees."

	| result |
	result := OrderedCollection new.
	self 
		matchesIn: anObject
		do: [ :each | result addLast: each ].
	^ result
]

{ #category : #parsing }
PPParser >> matchesIn: anObject do: aBlock [
	"Search anObject repeatedly for the matches of the receiver. Evaluate aBlock for each match with the matched parse-tree as the argument. Make sure to always consume exactly one character with each step, to not miss any match."

	((self and ==> aBlock , #any asParser) / #any asParser) star parse: anObject
]

{ #category : #parsing }
PPParser >> matchesSkipIn: anObject [
	"Search anObject repeatedly for the matches of the receiver. Answer an OrderedCollection of the matched parse-trees. Skip over matches."

	| result |
	result := OrderedCollection new.
	self 
		matchesSkipIn: anObject
		do: [ :each | result addLast: each ].
	^ result
]

{ #category : #parsing }
PPParser >> matchesSkipIn: anObject do: aBlock [
	"Search anObject repeatedly for the matches of the receiver. Evaluate aBlock for each match with the matched parse-tree as the argument. Skip over matches."

	(self ==> aBlock / #any asParser) star parse: anObject
]

{ #category : #parsing }
PPParser >> matchingRangesIn: anObject [
	"Search anObject repeatedly for the matches of the receiver. Answer an OrderedCollection of ranges of each match (index of first character to: index of last character)."
	
	| result |
	result := OrderedCollection new.
	self
		matchingRangesIn: anObject
		do: [ :value | result addLast: value ].
	^ result
]

{ #category : #parsing }
PPParser >> matchingRangesIn: anObject do: aBlock [
	"Search anObject repeatedly for the matches of the receiver. Evaluate aBlock with the range of each match (index of first character to: index of last character)."

	self token
		matchesIn: anObject
		do: [ :token | aBlock value: (token start to: token stop) ]
]

{ #category : #parsing }
PPParser >> matchingSkipRangesIn: anObject [
	"Search anObject repeatedly for the matches of the receiver. Skip over matches. Answer an OrderedCollection of ranges of each match (index of first character to: index of last character)."
	
	| result |
	result := OrderedCollection new.
	self
		matchingSkipRangesIn: anObject
		do: [ :value | result addLast: value ].
	^ result
]

{ #category : #parsing }
PPParser >> matchingSkipRangesIn: anObject do: aBlock [
	"Search anObject repeatedly for the matches of the receiver. Skip over matches. Evaluate aBlock with the range of each match (index of first character to: index of last character)."
	
	self token
		matchesSkipIn: anObject
		do: [ :token | aBlock value: (token start to: token stop) ]
]

{ #category : #'operators-repeating' }
PPParser >> max: anInteger [
	"Answer a new parser that parses the receiver at most anInteger times."
	
	^ self star setMax: anInteger
]

{ #category : #'operators-repeating' }
PPParser >> max: anInteger greedy: aParser [
	"Answer a new parser that parses the receiver at most anInteger times until it reaches aParser. This is a greedy non-blind implementation. aParser is not consumed."
	
	^ (self starGreedy: aParser) setMax: anInteger
]

{ #category : #'operators-repeating' }
PPParser >> max: anInteger lazy: aParser [
	"Answer a new parser that parses the receiver at most anInteger times until it reaches aParser. This is a lazy non-blind implementation. aParser is not consumed."
	
	^ (self starLazy: aParser) setMax: anInteger
]

{ #category : #operators }
PPParser >> memoized [
	"Answer a new memoized parser, for refraining redundant computations. This ensures polynomial time O(n^4) for left-recursive grammars and O(n^3) for non left-recursive grammars in the worst case. Not necessary for most grammars that are carefully written and in O(n) anyway."
	
	^ PPMemoizedParser on: self
]

{ #category : #'operators-repeating' }
PPParser >> min: anInteger [
	"Answer a new parser that parses the receiver at least anInteger times."
	
	^ self star setMin: anInteger
]

{ #category : #'operators-repeating' }
PPParser >> min: anInteger greedy: aParser [
	"Answer a new parser that parses the receiver at least anInteger times until it reaches aParser. This is a greedy non-blind implementation. aParser is not consumed."
	
	^ (self starGreedy: aParser) setMin: anInteger
]

{ #category : #'operators-repeating' }
PPParser >> min: anInteger lazy: aParser [
	"Answer a new parser that parses the receiver at least anInteger times until it reaches aParser. This is a lazy non-blind implementation. aParser is not consumed."
	
	^ (self starLazy: aParser) setMin: anInteger
]

{ #category : #'operators-repeating' }
PPParser >> min: aMinInteger max: aMaxInteger [
	"Answer a new parser that parses the receiver at least aMinInteger and at most aMaxInteger times."
	
	^ self star setMin: aMinInteger; setMax: aMaxInteger
]

{ #category : #'operators-repeating' }
PPParser >> min: aMinInteger max: aMaxInteger greedy: aParser [
	"Answer a new parser that parses the receiver at least aMinInteger and at most aMaxInteger times until it reaches aParser. This is a greedy non-blind implementation. aParser is not consumed."
	
	^ (self starGreedy: aParser) setMin: aMinInteger; setMax: aMaxInteger
]

{ #category : #'operators-repeating' }
PPParser >> min: aMinInteger max: aMaxInteger lazy: aParser [
	"Answer a new parser that parses the receiver at least aMinInteger and at most aMaxInteger times until it reaches aParser. This is a greedy non-blind implementation. aParser is not consumed."
	
	^ (self starLazy: aParser) setMin: aMinInteger; setMax: aMaxInteger
]

{ #category : #accessing }
PPParser >> name [
	"Answer the production name of the receiver."
	
	^ self propertyAt: #name ifAbsent: [ nil ]
]

{ #category : #accessing }
PPParser >> name: aString [
	self propertyAt: #name put: aString
]

{ #category : #operators }
PPParser >> negate [
	"Answer a new parser consumes any input token but the receiver."
	
	^ self not , #any asParser ==> #second
]

{ #category : #operators }
PPParser >> nonMemoized [
	^ self
]

{ #category : #operators }
PPParser >> not [
	"Answer a new parser (logical not-predicate) that succeeds whenever the receiver fails, but never consumes input."

	^ PPNotParser on: self
]

{ #category : #operators }
PPParser >> optional [
	"Answer a new parser that parses the receiver, if possible."

	^ PPOptionalParser on: self
]

{ #category : #parsing }
PPParser >> parse: anObject [
	"Parse anObject with the receiving parser and answer the parse-result or an instance of PPFailure."

	^ self parse: anObject withContext: PPContext new
]

{ #category : #parsing }
PPParser >> parse: anObject onError: aBlock [
	"Parse anObject with the receiving parser and answer the parse-result or answer the result of evaluating aBlock. Depending on the number of arguments of the block it is simply evaluated, evaluated with the failure object, or evaluated with the error message and position."
	
	| result |
	result := self parse: anObject.
	result isPetitFailure
		ifFalse: [ ^ result ].
	aBlock numArgs = 0
		ifTrue: [ ^ aBlock value ].
	aBlock numArgs = 1
		ifTrue: [ ^ aBlock value: result ].
	^ aBlock value: result message value: result position
]

{ #category : #context }
PPParser >> parse: anObject withContext: aPPContext [
	"Parse anObject with the receiving parser and answer the parse-result or an instance of PPFailure."

	aPPContext stream: anObject asPetitStream.
	^ self parseWithContext: aPPContext.

]

{ #category : #parsing }
PPParser >> parseOn: aPPContext [
	"Parse aStream with the receiving parser and answer the parse-result or an instance of PPFailure. Override this method in subclasses to specify custom parse behavior. Do not call this method from outside, instead use #parse:."
	
	self subclassResponsibility
]

{ #category : #context }
PPParser >> parseWithContext: context [
	| result |
	context initializeFor: self.
	result := self parseOn: context.
	
	"Return the furthest failure, it gives better results than the last failure"
	(result isPetitFailure and: [ context furthestFailure notNil]) 
		ifTrue: [ ^ context furthestFailure ].
	^ result
	
]

{ #category : #'operators-repeating' }
PPParser >> plus [
	"Answer a new parser that parses the receiver one or more times."

	^ self star setMin: 1
]

{ #category : #'operators-repeating' }
PPParser >> plusGreedy: aParser [
	"Answer a new parser that parses the receiver one or more times until it reaches aParser. This is a greedy non-blind implementation of the star operator. aParser is not consumed."
	
	^ (self starGreedy: aParser) setMin: 1
]

{ #category : #'operators-repeating' }
PPParser >> plusLazy: aParser [
	"Answer a new parser that parses the receiver one or more times until it reaches aParser. This is a lazy non-blind implementation of the star operator. aParser is not consumed."
	
	^ (self starLazy: aParser) setMin: 1
]

{ #category : #copying }
PPParser >> postCopy [
	super postCopy.
	properties := properties copy
]

{ #category : #printing }
PPParser >> printNameOn: aStream [
	self name isNil
		ifTrue: [ aStream print: self hash ]
		ifFalse: [ aStream nextPutAll: self name ]
]

{ #category : #printing }
PPParser >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self printNameOn: aStream.
	aStream nextPut: $)
]

{ #category : #'accessing-properties' }
PPParser >> properties [
	^ properties
]

{ #category : #'accessing-properties' }
PPParser >> propertyAt: aKey [
	"Answer the property value associated with aKey."
	
	^ self propertyAt: aKey ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing-properties' }
PPParser >> propertyAt: aKey ifAbsent: aBlock [
	"Answer the property value associated with aKey or, if aKey isn't found, answer the result of evaluating aBlock."
	
	^ properties isNil
		ifTrue: [ aBlock value ]
		ifFalse: [ properties at: aKey ifAbsent: aBlock ]
]

{ #category : #'accessing-properties' }
PPParser >> propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value."
	
	^ self propertyAt: aKey ifAbsent: [ self propertyAt: aKey put: aBlock value ]
]

{ #category : #'accessing-properties' }
PPParser >> propertyAt: aKey put: anObject [
	"Set the property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject."

	^ (properties ifNil: [ properties := Dictionary new: 1 ])
		at: aKey put: anObject
]

{ #category : #'accessing-properties' }
PPParser >> removeProperty: aKey [
	"Remove the property with aKey. Answer the property or raise an error if aKey isn't found."
	
	^ self removeProperty: aKey ifAbsent: [ self error: 'Property not found' ]
]

{ #category : #'accessing-properties' }
PPParser >> removeProperty: aKey ifAbsent: aBlock [
	"Remove the property with aKey. Answer the value or, if aKey isn't found, answer the result of evaluating aBlock."
	
	| answer |
	properties isNil ifTrue: [ ^ aBlock value ].
	answer := properties removeKey: aKey ifAbsent: aBlock.
	properties isEmpty ifTrue: [ properties := nil ].
	^ answer
]

{ #category : #'operators-convenience' }
PPParser >> separatedBy: aParser [
	"Answer a new parser that parses the receiver one or more times, separated by aParser."
	
	^ (PPSequenceParser with: self with: (PPSequenceParser with: aParser with: self) star) ==> [ :nodes |
		| result |
		result := Array new: 2 * nodes second size + 1.
		result at: 1 put: nodes first.
		nodes second 
			keysAndValuesDo: [ :index :pair | result replaceFrom: 2 * index to: 2 * index + 1 with: pair startingAt: 1 ].
		result ]
]

{ #category : #'operators-repeating' }
PPParser >> star [
	"Answer a new parser that parses the receiver zero or more times. This is a greedy and blind implementation that tries to consume as much input as possible and it does not consider what comes afterwards."

	^ PPPossessiveRepeatingParser on: self
]

{ #category : #'operators-repeating' }
PPParser >> starGreedy: aParser [
	"Answer a new parser that parses the receiver zero or more times until it reaches aParser. This is a greedy non-blind implementation of the star operator. aParser is not consumed."
	
	^ PPGreedyRepeatingParser on: self limit: aParser
]

{ #category : #'operators-repeating' }
PPParser >> starLazy: aParser [
	"Answer a new parser that parses the receiver zero or more times until it reaches aParser. This is a lazy non-blind implementation of the star operator. aParser is not consumed."
	
	^ PPLazyRepeatingParser on: self limit: aParser
]

{ #category : #'operators-repeating' }
PPParser >> times: anInteger [
	"Answer a new parser that parses the receiver exactly anInteger times."
	
	^ self min: anInteger max: anInteger
]

{ #category : #'operators-mapping' }
PPParser >> token [
	"Answer a new parser that transforms the input to a token."
	
	^ PPTokenParser on: self
]

{ #category : #'operators-mapping' }
PPParser >> token: aTokenClass [
	"Answer a new parser that transforms the input to a token of class aTokenClass."
	
	^ self token tokenClass: aTokenClass
]

{ #category : #'operators-mapping' }
PPParser >> trim [
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trimSpaces
]

{ #category : #'operators-mapping' }
PPParser >> trim: aParser [
	"Answer a new parser that consumes and ignores aParser repeatedly before and after the receiving parser."
	
	^ PPTrimmingParser on: self trimmer: aParser
]

{ #category : #'operators-mapping' }
PPParser >> trimBlanks [
	"Answer a new parser that consumes blanks before and after the receiving parser."
	
	^ self trim: #blank asParser
]

{ #category : #'operators-mapping' }
PPParser >> trimLeft [
	"Answer a new parser that consumes spaces before the receiving parser."
	
	^ self trimSpacesLeft
]

{ #category : #'operators-mapping' }
PPParser >> trimRight [
	"Answer a new parser that consumes spaces after the receiving parser."
	
	^ self trimSpacesRight
]

{ #category : #'operators-mapping' }
PPParser >> trimRight: trimmer [
	"Answer a new parser that consumes spaces after the receiving parser."
	
	^ (self, trimmer star) ==> #first
]

{ #category : #'operators-mapping' }
PPParser >> trimSpaces [
	"Answer a new parser that consumes spaces before and after the receiving parser."
	
	^ self trim: #space asParser
]

{ #category : #'operators-mapping' }
PPParser >> trimSpacesLeft [
	"Answer a new parser that consumes spaces before the receiving parser."
	
	^ (#space asParser star, self) ==> #second
]

{ #category : #'operators-mapping' }
PPParser >> trimSpacesRight [
	"Answer a new parser that consumes spaces after the receiving parser."
	
	^ (self, #space asParser star) ==> #first
]

{ #category : #'operators-convenience' }
PPParser >> withoutSeparators [
	"Filters out the separators from a parse result produced by one of the productions #delimitedBy: or #separatedBy:."
	
	^ self ==> [ :items |
		| result |
		result := Array new: items size + 1 // 2.
		1 to: result size do: [ :index | result at: index put: (items at: 2 * index - 1) ].
		result ]
]

{ #category : #operators }
PPParser >> wrapped [
	"Answer a new parser that is simply wrapped."
	
	^ PPDelegateParser on: self
]

{ #category : #operators }
PPParser >> | aParser [
	"Answer a new parser that either parses the receiver or aParser. Fail if both pass or fail (exclusive choice, unordered choice)."

	^ (self not , aParser) / (aParser not , self) ==> #second
]
