"
An abstract parser that repeatedly parses between 'min' and 'max' instances of my delegate and that requires the input to be completed with a specified parser 'limit'. Subclasses provide repeating behavior as typically seen in regular expression implementations (non-blind).

Instance Variables:
	limit	<PPParser>	The parser to complete the input with.
"
Class {
	#name : #PPLimitedRepeatingParser,
	#superclass : #PPRepeatingParser,
	#instVars : [
		'limit'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'instance creation' }
PPLimitedRepeatingParser class >> on: aParser limit: aLimitParser [
	^ (self on: aParser) setLimit: aLimitParser
]

{ #category : #accessing }
PPLimitedRepeatingParser >> children [
	^ Array with: parser with: limit
]

{ #category : #accessing }
PPLimitedRepeatingParser >> limit [
	"Answer the parser that limits (or ends) this repetition."
	
	^ limit
]

{ #category : #parsing }
PPLimitedRepeatingParser >> matchesLimitOn: aPPContext [
	| element position |
	position := aPPContext remember.
	element := limit parseOn: aPPContext.
	aPPContext restore: position.
	^ element isPetitFailure not
]

{ #category : #initialization }
PPLimitedRepeatingParser >> setLimit: aParser [
	limit := aParser
]
