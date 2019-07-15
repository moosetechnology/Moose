Class {
	#name : #XMLCharacterMethodsTest,
	#superclass : #TestCase,
	#category : #'XML-Tests-Parser'
}

{ #category : #accessing }
XMLCharacterMethodsTest class >> allChars [
	"to conserve memory, do not persistently cache this"
	^ BitmapCharacterSet fromXMLBNF:
		'#x9 | #xA | #xD | [#x20-#xD7FF] | [#xE000-#xFFFD] | [#x10000-#x10FFFF]'
]

{ #category : #accessing }
XMLCharacterMethodsTest class >> allNameChars [
	"to conserve memory, do not persistently cache this"
	^ self allNameStartChars,
		(BitmapCharacterSet fromXMLBNF:
			'"-" | "." | [0-9] | #xB7 | [#x0300-#x036F] | [#x203F-#x2040]')
]

{ #category : #accessing }
XMLCharacterMethodsTest class >> allNameStartChars [
	"to conserve memory, do not persistently cache this"
	^ BitmapCharacterSet fromXMLBNF:
		'":" | [A-Z] | "_" | [a-z] | [#xC0-#xD6] | [#xD8-#xF6] |
		[#xF8-#x2FF] | [#x370-#x37D] | [#x37F-#x1FFF] | [#x200C-#x200D] |
		[#x2070-#x218F] | [#x2C00-#x2FEF] | [#x3001-#xD7FF] |
		[#xF900-#xFDCF] | [#xFDF0-#xFFFD] | [#x10000-#xEFFFF]'
]

{ #category : #accessing }
XMLCharacterMethodsTest class >> allNonChars [
	"to conserve memory, do not persistently cache this"
	^ self allChars complement
]

{ #category : #accessing }
XMLCharacterMethodsTest class >> allNonNameChars [
	"to conserve memory, do not persistently cache this"
	^ self allNameChars complement
]

{ #category : #accessing }
XMLCharacterMethodsTest class >> allNonNameStartCharNameChars [
	"to conserve memory, do not persistently cache this"
	^ (BitmapCharacterSet fromXMLBNF:
		'"-" | "." | [0-9] | #xB7 | [#x0300-#x036F] | [#x203F-#x2040]')
]

{ #category : #accessing }
XMLCharacterMethodsTest class >> allNonNameStartChars [
	"to conserve memory, do not persistently cache this"
	^ self allNameStartChars complement
]

{ #category : #accessing }
XMLCharacterMethodsTest class >> nonChars [
	"These values are a limited selection from #allNonChars, including the
	start and end of each char range (used for performance)"
	^ #(16r1 16r2 16r3 16r4 16r5 16r6 16r7 16r8
			16rB 16rC 16rE 16rF
			16r10 16r11 16r12 16r13 16r14 16r15 16r16 16r17 16r18 16r19
			16r1A 16r1B 16r1C 16r1D 16r1E 16r1F
			16rD800 16rDFFF
			16rFFFE 16rFFFF)
			collect: [:each | each asCharacter]
]

{ #category : #accessing }
XMLCharacterMethodsTest class >> nonNameChars [
	"These are a limited selection of values from #allNonNameChars, including
	the start and end of each char range (used for performance)"
	^ #(16r01 16r0F 16r10
			16r2C 16r2F 16r3B
			16r40 16r5B 16r5E
			16r60 16r7B 16r80
			16rB6 16rB8 16rBF
			16rD7 16rF7 16r37E
			16r2000 16r200B 16r200E 16r206F
			16r2190 16r2BFF 16r2FFF 16r3000
			16rD800 16rF8FF 16rFDD0 16rFDEF
			16rFFFE 16r0FFFF 16rF0000 16r10FFFF)
			collect: [:each | each asCharacter]
]

{ #category : #accessing }
XMLCharacterMethodsTest class >> nonNameStartCharNameChars [
	"These are a limited selection of values from #allNonNameStartCharNameChars,
	including the start and end of each char range (used for performance)"
	^ #($- $.
			$0 $1 $2 $3 $4 $5 $6 $7 $8 $9
			16rB7 16r0300 16r036F 16r203F 16r2040)
			collect: [:each | each asCharacter]
]

{ #category : #accessing }
XMLCharacterMethodsTest >> allChars [
	^ self class allChars
]

{ #category : #accessing }
XMLCharacterMethodsTest >> allNameChars [
	^ self class allNameChars
]

{ #category : #accessing }
XMLCharacterMethodsTest >> allNameStartChars [
	^ self class allNameStartChars
]

{ #category : #accessing }
XMLCharacterMethodsTest >> allNonChars [
	^ self class allNonChars
]

{ #category : #accessing }
XMLCharacterMethodsTest >> allNonNameChars [
	^ self class allNonNameChars
]

{ #category : #accessing }
XMLCharacterMethodsTest >> allNonNameStartCharNameChars [
	^ self class allNonNameStartCharNameChars
]

{ #category : #tests }
XMLCharacterMethodsTest >> testIsXMLChar [
	self allChars do: [:each |
		self assert: each isXMLChar].
	self allNonChars do: [:each |
		self deny: each isXMLChar].
	self deny: nil isXMLChar.
]

{ #category : #tests }
XMLCharacterMethodsTest >> testIsXMLNCNameChar [
	self allNameChars do: [:each |
		each == $:
			ifTrue: [self deny: each isXMLNCNameChar]
			ifFalse: [self assert: each isXMLNCNameChar]].
	self allNonNameChars do: [:each |
		self deny: each isXMLNCNameChar].
	self deny: nil isXMLNCNameChar.
]

{ #category : #tests }
XMLCharacterMethodsTest >> testIsXMLNCNameStartChar [
	self allNameStartChars do: [:each |
		each == $:
			ifTrue: [self deny: each isXMLNCNameStartChar]
			ifFalse: [self assert: each isXMLNCNameStartChar]].
	self allNonNameChars do: [:each |
		self deny: each isXMLNCNameStartChar].
	self allNonNameStartCharNameChars do: [:each |
		self deny: each isXMLNCNameStartChar].
	self deny: nil isXMLNCNameStartChar.
]

{ #category : #tests }
XMLCharacterMethodsTest >> testIsXMLNameChar [
	self allNameChars do: [:each |
		self assert: each isXMLNameChar].
	self allNonNameChars do: [:each |
		self deny: each isXMLNameChar].
	self deny: nil isXMLNameChar.
]

{ #category : #tests }
XMLCharacterMethodsTest >> testIsXMLNameStartChar [
	self allNameStartChars do: [:each |
		self assert: each isXMLNameStartChar].
	self allNonNameChars do: [:each |
		self deny: each isXMLNameStartChar].
	self allNonNameStartCharNameChars do: [:each |
		self deny: each isXMLNameStartChar].
	self deny: nil isXMLNameStartChar.
]

{ #category : #tests }
XMLCharacterMethodsTest >> testIsXMLSeparator [
	| separators |

	separators := BitmapCharacterSet newFrom: Character xmlSeparators.
	separators do: [:each |
		self assert: each isXMLSeparator].
	separators complement do: [:each |
		self deny: each isXMLSeparator].
	self deny: nil isXMLSeparator.
]

{ #category : #tests }
XMLCharacterMethodsTest >> testIsXMLWhitespace [
	| whitespace |

	whitespace := BitmapCharacterSet newFrom: Character xmlWhitespace.
	whitespace do: [:each |
		self assert: each isXMLWhitespace].
	whitespace complement do: [:each |
		self deny: each isXMLWhitespace].
	self deny: nil isXMLWhitespace.
]

{ #category : #tests }
XMLCharacterMethodsTest >> testXMLSplit [
	self
		assert: ($: xmlSplit: '') = (OrderedCollection with: '');
		assert: ($: xmlSplit: 'abc') = (OrderedCollection with: 'abc');
		assert: ($: xmlSplit: ':') = #('' '') asOrderedCollection;
		assert: ($: xmlSplit: '::') = #('' '' '') asOrderedCollection;
		assert: ($: xmlSplit: 'a:bc:') = #('a' 'bc' '') asOrderedCollection;
		assert: ($: xmlSplit: ':ab:c:') = #('' 'ab' 'c' '') asOrderedCollection;
		assert: ($: xmlSplit: 'a:bc:') = #('a' 'bc' '') asOrderedCollection;
		assert: ($: xmlSplit: 'ab::cd::ef') = #('ab'  '' 'cd' '' 'ef') asOrderedCollection;
		assert:
			($: xmlSplit: '::ab:::cd:::ef::') =
				#('' '' 'ab'  '' '' 'cd' '' '' 'ef' '' '') asOrderedCollection
]
