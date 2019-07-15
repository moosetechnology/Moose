"
This is a base class for element nesters that are used by parser tokenizers and drivers to keep track of which elements are open while parsing and ensure they are properly nested.
"
Class {
	#name : #XMLElementNester,
	#superclass : #Object,
	#instVars : [
		'openElements',
		'rootElement',
		'scopedAttributes',
		'hasExternalRootElement',
		'wasRootElementEnded',
		'isInElement'
	],
	#category : #'XML-Parser-Drivers'
}

{ #category : #private }
XMLElementNester >> copiedScopedAttributes [
	| copiedAttributes |

	copiedAttributes :=
		self hasScopedAttributes
			ifTrue: [self scopedAttributes removeLast copy]
			ifFalse: [Dictionary new].
	self scopedAttributes addLast: copiedAttributes.

	^ copiedAttributes.
]

{ #category : #accessing }
XMLElementNester >> currentElement [
	^ self openElements xmlLastOrNil
]

{ #category : #accessing }
XMLElementNester >> currentElement: anElement [
	self hasOpenElements
		ifTrue: [
			self openElements
				at: self totalOpenElements
				put: anElement]
		ifFalse: [self setExternalRootElement: anElement]
]

{ #category : #accessing }
XMLElementNester >> currentScopedAttributes [
	^ self scopedAttributes xmlLastOrNil
]

{ #category : #private }
XMLElementNester >> elementPrintLimit [
	^ 5
]

{ #category : #nesting }
XMLElementNester >> endCurrentElement [
	(self openElements
		removeLast;
		size) > 0
		ifFalse: [
			isInElement := hasExternalRootElement.
			wasRootElementEnded := hasExternalRootElement not].
	self hasScopedAttributes
		ifTrue: [self endScopedAttributes].
]

{ #category : #private }
XMLElementNester >> endScopedAttributes [
	scopedAttributes removeLast
]

{ #category : #testing }
XMLElementNester >> hasExternalRootElement [
	^ hasExternalRootElement
]

{ #category : #testing }
XMLElementNester >> hasOpenElement: anElement [
	^ self openElements includes: anElement
]

{ #category : #testing }
XMLElementNester >> hasOpenElements [
	^ self openElements size > 0
]

{ #category : #testing }
XMLElementNester >> hasScopedAttributes [
	"optimized to avoid lazy initialization"
	scopedAttributes == nil
		ifTrue: [^ false].
	^ scopedAttributes size > 0.
]

{ #category : #initialization }
XMLElementNester >> initialize [
	super initialize.

	openElements := OrderedCollection new: 10.
	hasExternalRootElement := false.
	wasRootElementEnded := false.
	isInElement := false.
]

{ #category : #testing }
XMLElementNester >> isInElement [
	^ isInElement
]

{ #category : #accessing }
XMLElementNester >> openElements [
	^ openElements
]

{ #category : #enumerating }
XMLElementNester >> openElementsDo: aBlock [
	self openElements do: aBlock
]

{ #category : #enumerating }
XMLElementNester >> openElementsReverseDo: aBlock [
	"implemented for XMLParserHTML so it's always safe to remove at
	the end while scanning backwards"
	self openElements size to: 1 by: -1 do: [:i |
			aBlock value: (self openElements at: i)]
]

{ #category : #printing }
XMLElementNester >> printElementsOn: aStream [
	self
		printElementsStartingAt: 1
		on: aStream
]

{ #category : #printing }
XMLElementNester >> printElementsStartingAt: aStart on: aStream [
	self
		printElementsStartingAt: aStart
		stoppingAt: aStart + self elementPrintLimit - 1
		on: aStream
]

{ #category : #printing }
XMLElementNester >> printElementsStartingAt: aStart stoppingAt: aStop on: aStream [
	aStart
		to: (aStop min: self openElements size)
		do: [:i |
			i > aStart
				ifTrue: [aStream nextPutAll: ', '].

			aStream
				nextPut: $<;
				nextPutAll: (self openElements at: i);
				nextPut: $>].

	(aStop < self openElements size)
		ifTrue: [aStream nextPutAll: '...'].
]

{ #category : #printing }
XMLElementNester >> printOn: aStream [
	super printOn: aStream.

	self hasOpenElements
		ifTrue: [
			aStream nextPut: $(.
			self
				printElementsStartingAt: 1
				on: aStream.
			aStream nextPut: $)].
]

{ #category : #printing }
XMLElementNester >> printedElements [
	^ String streamContents: [:stream | self printElementsOn: stream]
]

{ #category : #printing }
XMLElementNester >> printedElementsEnclosedBy: anElement [
	^ String streamContents: [:stream |
		self
			printElementsStartingAt: (self openElements lastIndexOf: anElement) + 1
			on: stream]
]

{ #category : #accessing }
XMLElementNester >> rootElement [
	^ rootElement
]

{ #category : #accessing }
XMLElementNester >> scopedAttributeAt: anAttribute [
	^ self
		scopedAttributeAt: anAttribute
		ifAbsent: ['']
]

{ #category : #accessing }
XMLElementNester >> scopedAttributeAt: anAttribute ifAbsent: aBlock [
	^ self currentScopedAttributes
		ifNil: [aBlock value]
		ifNotNil: [:attributes |
			attributes
				at: anAttribute
				ifAbsent: aBlock]
]

{ #category : #private }
XMLElementNester >> scopedAttributes [
	^ scopedAttributes ifNil: [scopedAttributes := OrderedCollection new]
]

{ #category : #accessing }
XMLElementNester >> setExternalRootElement: anElement [
	rootElement := anElement.
	hasExternalRootElement := true.
	isInElement := true.
]

{ #category : #accessing }
XMLElementNester >> setScopedAttributesNamed: anAttributeCollection from: aDictionary [
	| attributes |

	anAttributeCollection do: [:each |
		aDictionary
			at: each
			ifPresent: [:value |
				"used to copy only once if needed"
				(attributes ifNil: [attributes := self copiedScopedAttributes])
					at: each
					put: value]]
]

{ #category : #nesting }
XMLElementNester >> startElement: anElement [
	self openElements addLast: anElement.
	isInElement
		ifFalse: [
			isInElement := true.
			rootElement
				ifNil: [rootElement := anElement]].
	self hasScopedAttributes
		ifTrue: [self startScopedAttributes].
]

{ #category : #private }
XMLElementNester >> startScopedAttributes [
	scopedAttributes addLast: self currentScopedAttributes
]

{ #category : #accessing }
XMLElementNester >> totalOpenElements [
	^ self openElements size
]

{ #category : #testing }
XMLElementNester >> wasRootElementEnded [
	^ wasRootElementEnded
]
