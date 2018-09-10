"
This class is an adapter for positionable read streams that wraps them to be safe to send messages like next and peek when atEnd and supports efficient push back of token objects to minimize backtracking by parsers.
"
Class {
	#name : #XPathReadStreamAdapter,
	#superclass : #XMLReadStreamAdapter,
	#instVars : [
		'pushedBackToken',
		'nameStream'
	],
	#category : #'XPath-Core-Streams'
}

{ #category : #converting }
XPathReadStreamAdapter >> asXPathReadStreamAdapter [
	^ self
]

{ #category : #accessing }
XPathReadStreamAdapter >> nextNCName [
	"returns the next non-qualified name or nil"

	(self peekPushedBackToken notNil
		and: [self peekPushedBackToken isNCNameToken])
		ifTrue: [^ self nextPushedBackToken value].

	self peek isXMLNCNameStartChar
		ifFalse: [^ nil].
	nameStream
		reset;
		nextPut: self next.
	[self peek isXMLNCNameChar]
		whileTrue: [nameStream nextPut: self next].
	^ nameStream contents.
]

{ #category : #accessing }
XPathReadStreamAdapter >> nextName [
	"returns the next qualified or non-qualified name or nil"

	| oldPosition ncNameOrPrefix |

	oldPosition := self position.
	(ncNameOrPrefix := self nextNCName)
		ifNil: [^ nil].
	(self peekFor: $:)
		ifFalse: [
			"just a local name"
			^ ncNameOrPrefix].
	self nextNCName
		ifNil: [
			"an NCName followed by : must have a local name after"
			self position: oldPosition.
			^ nil]
		ifNotNil: [:localName |
			"a full qualified name"
			^ localName qualifyWithXMLPrefix: ncNameOrPrefix].
]

{ #category : #accessing }
XPathReadStreamAdapter >> nextPushedBackToken [
	^ self peekPushedBackToken
		ifNotNil: [:token |
			self position: self position + token value size.
			token]
]

{ #category : #initialization }
XPathReadStreamAdapter >> on: aStream [
	super on: aStream.

	"must use #writeStream instead of 'WriteStream on:' to get a 0-based
	stream on Gemstone"
	nameStream := (String new: 32) writeStream.
]

{ #category : #accessing }
XPathReadStreamAdapter >> peekForNCName: anNCName [
	| position ncName |

	position := self position.
	ncName := self nextNCName
		ifNil: [^ false].
	ncName = anNCName
		ifTrue: [^ true]
		ifFalse: [
			self
				pushBackNCName: ncName
				position: position.
			^ false].
]

{ #category : #accessing }
XPathReadStreamAdapter >> peekPushedBackToken [
	(pushedBackToken notNil
		and: [pushedBackToken position = self position])
		ifTrue: [^ pushedBackToken]
		ifFalse: [^ nil]
]

{ #category : #positioning }
XPathReadStreamAdapter >> pushBackNCName: anNCName position: aPosition [
	self pushBackToken:
		(XPathPushedBackNCNameToken
			value: anNCName
			position: aPosition)
]

{ #category : #positioning }
XPathReadStreamAdapter >> pushBackToken: aPushedBackToken [
	pushedBackToken := aPushedBackToken.
	self position: aPushedBackToken position.
]

{ #category : #positioning }
XPathReadStreamAdapter >> skipBack [
	"does not peek like #back"
	self position: self position - 1
]

{ #category : #positioning }
XPathReadStreamAdapter >> skipSeparators [
	"provides consistent cross-platform separator skipping with the XML set of
	separators, which the XPath spec uses for whitespace too:
		ExprWhitespace	   ::=   	S
		S	   ::=   	(#x20 | #x9 | #xD | #xA)+"
	[self atEnd not
		and: [self peek isXMLSeparator]]
		whileTrue: [self next]
]
