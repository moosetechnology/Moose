"
This class represents a string (character data) node. Instances are mutable, but the string is treated as immutable. String nodes can be created using the class-side #string: message or by sending a String #asXMLStringNode. 

When printing, XML-escaping of special characters is done.
"
Class {
	#name : #XMLString,
	#superclass : #XMLNode,
	#instVars : [
		'string'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #'instance creation' }
XMLString class >> string: aString [
	^ self new string: aString
]

{ #category : #visiting }
XMLString >> acceptNodeVisitor: aNodeVisitor [
	^ aNodeVisitor visitStringNode: self
]

{ #category : #deprecated }
XMLString >> addContent: aStringOrStringNode [
	"will be deprecated"

	self append: aStringOrStringNode
]

{ #category : #'appending/prepending' }
XMLString >> append: aStringOrStringNode [
	string :=
		string
			ifNil: [aStringOrStringNode asString]
			ifNotNil: [string, aStringOrStringNode asString]
]

{ #category : #converting }
XMLString >> asString [
	^ self string
]

{ #category : #converting }
XMLString >> asXMLEscapedString [
	^ self string asXMLEscapedString
]

{ #category : #deprecated }
XMLString >> asXMLString [
	"will be deprecated; use #asXMLStringNode instead"

	^ self asXMLStringNode
]

{ #category : #converting }
XMLString >> asXMLStringNode [
	^ self
]

{ #category : #testing }
XMLString >> beginsWith: aStringOrStringNode [
	^ self string beginsWith: aStringOrStringNode asString
]

{ #category : #deprecated }
XMLString >> contentString: aString [
	"will be deprecated; use #string: instead"

	self string: aString
]

{ #category : #replacing }
XMLString >> deleteFrom: aStart to: anEnd [
	self replaceFrom: aStart to: anEnd with: ''
]

{ #category : #testing }
XMLString >> endsWith: aStringOrStringNode [
	^ self string endsWith: aStringOrStringNode asString
]

{ #category : #testing }
XMLString >> includesSubstring: aStringOrStringNode [
	"avoid String>>includesSubstring: for backwards compatibility"
	^ aStringOrStringNode isEmpty
		or: [(self indexOfSubstring: aStringOrStringNode) > 0]
]

{ #category : #accessing }
XMLString >> indexOfSubstring: aStringOrStringNode [
	^ self string
		findString: aStringOrStringNode asString
		startingAt: 1
]

{ #category : #private }
XMLString >> isCoalescingStringNode [
	^ true
]

{ #category : #testing }
XMLString >> isContentNode [
	^ true
]

{ #category : #testing }
XMLString >> isEmpty [
	^ self string isEmpty
]

{ #category : #deprecated }
XMLString >> isString: aStringOrStringNode [
	"will be deprecated; use #isStringNode: instead"

	^ self isStringNode: aStringOrStringNode
]

{ #category : #testing }
XMLString >> isStringNode [
	^ true
]

{ #category : #testing }
XMLString >> isStringNode: aStringOrStringNode [
	^ self string = aStringOrStringNode asString
]

{ #category : #testing }
XMLString >> isWhitespace [
	^ self string isXMLWhitespace
]

{ #category : #'splitting/merging' }
XMLString >> mergeAdjacent [
	"merges a string node with adjacent string nodes in parent"
	| siblingNodes selfIndex adjacentNode |

	self hasParent
		ifFalse: [^ self].

	siblingNodes := self parent nodes.
	selfIndex := siblingNodes indexOf: self.
	[(adjacentNode := siblingNodes at: selfIndex + 1) notNil
		and: [adjacentNode isStringNode]]
		whileTrue: [
			self append: adjacentNode.
			siblingNodes removeAt: selfIndex + 1].

	[(adjacentNode := siblingNodes at: selfIndex - 1) notNil
		and: [adjacentNode isStringNode]]
		whileTrue: [
			self prepend: adjacentNode.
			siblingNodes removeAt: selfIndex - 1.
			selfIndex := selfIndex - 1].
]

{ #category : #testing }
XMLString >> notEmpty [
	^ self string notEmpty
]

{ #category : #'appending/prepending' }
XMLString >> prepend: aStringOrStringNode [
	string :=
		string
			ifNil: [aStringOrStringNode asString]
			ifNotNil: [aStringOrStringNode asString, string]
]

{ #category : #printing }
XMLString >> printRawContentOn: aStream [
	aStream nextPutAll: self string
]

{ #category : #replacing }
XMLString >> replaceAll: aSource with: aReplacement [
	"works like copyReplaceAll:with:"
	self string:
		(self string
			copyReplaceAll: aSource asString
			with: aReplacement asString)
]

{ #category : #replacing }
XMLString >> replaceFrom: aStart to: aStop with: aReplacement [
	"works like copyReplaceFrom:to:with: and
	can be used to insert, delete, and replace"
	| start stop |

	start := (aStart max: 1) min: self size + 1.
	stop := (aStop max: start - 1) min: self size.
	self string:
		(self string
			copyReplaceFrom: start
			to: stop
			with: aReplacement asString)
]

{ #category : #accessing }
XMLString >> size [
	^ self string size
]

{ #category : #accessing }
XMLString >> sortKey [
	^ self string
]

{ #category : #'splitting/merging' }
XMLString >> splitAt: anOffset [
	| newNode |

	newNode := self copy.
	self replaceFrom: anOffset to: self size with: ''.
	newNode replaceFrom: 1 to: anOffset - 1 with: ''.

	self hasParent
		ifTrue: [self parent addNode: newNode after: self].

	^ newNode.
]

{ #category : #accessing }
XMLString >> string [
	^ string ifNil: [string := '']
]

{ #category : #accessing }
XMLString >> string: aString [
	string := aString asString
]

{ #category : #printing }
XMLString >> writeXMLOn: aWriter [
	aWriter string: self string
]
