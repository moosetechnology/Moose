Class {
	#name : #SmaCCRewriteEngine,
	#superclass : #Object,
	#instVars : [
		'rewriteRule',
		'source',
		'newStarts',
		'newStops',
		'properties',
		'methods',
		'processedNodes',
		'outputDirectory',
		'outputFilename',
		'contextClass'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'accessing-methods' }
SmaCCRewriteEngine >> addMethodNamed: aSymbol as: aBlock [
	methods at: aSymbol put: aBlock
]

{ #category : #accessing }
SmaCCRewriteEngine >> addRewrites: aCollection [
	aCollection do: [ :each | self rewriteRule: each ]
]

{ #category : #'accessing-properites' }
SmaCCRewriteEngine >> additionalFiles [
	^ self propertyAt: #additionalFiles ifAbsentPut: [ Dictionary new ]
]

{ #category : #accessing }
SmaCCRewriteEngine >> contextClass [
	contextClass isNil
		ifTrue: [ contextClass := Class new
				superclass: SmaCCRewriteMatchContext;
				setFormat: SmaCCRewriteMatchContext format;
				classLayout: SmaCCRewriteMatchContext classLayout copy;
				yourself.
			self rewriteRule updateClass: contextClass ].
	^ contextClass
]

{ #category : #private }
SmaCCRewriteEngine >> finished [
	newStarts := IdentityDictionary new.
	newStops := IdentityDictionary new.
	properties := Dictionary new.
	processedNodes := IdentitySet new.
	contextClass notNil
		ifTrue: [ self rewriteRule clearLocalVariablesIn: contextClass ]
]

{ #category : #'initialize-release' }
SmaCCRewriteEngine >> initialize [
	super initialize.
	newStarts := IdentityDictionary new.
	newStops := IdentityDictionary new.
	properties := Dictionary new.
	methods := IdentityDictionary new.
	processedNodes := IdentitySet new
]

{ #category : #private }
SmaCCRewriteEngine >> markAsProcessed: aSmaCCNode [
	processedNodes add: aSmaCCNode
]

{ #category : #'accessing-methods' }
SmaCCRewriteEngine >> methodNamed: aSymbol [
	^ methods at: aSymbol ifAbsent: [ nil ]
]

{ #category : #accessing }
SmaCCRewriteEngine >> outputDirectory [
	^ outputDirectory
]

{ #category : #accessing }
SmaCCRewriteEngine >> outputDirectory: aString [
	outputDirectory := aString
]

{ #category : #accessing }
SmaCCRewriteEngine >> outputFilename [
	^ outputFilename
]

{ #category : #accessing }
SmaCCRewriteEngine >> outputFilename: aString [
	outputFilename := aString
]

{ #category : #private }
SmaCCRewriteEngine >> processChildrenOf: aSmaCCNode [
	^ aSmaCCNode nodesDo: [ :each | self rewriteNode: each ]
]

{ #category : #accessing }
SmaCCRewriteEngine >> properties [
	^ properties
]

{ #category : #accessing }
SmaCCRewriteEngine >> properties: aDictionary [
	properties := aDictionary
]

{ #category : #'accessing-properites' }
SmaCCRewriteEngine >> propertyAt: aString [
	^ properties at: aString ifAbsent: [ nil ]
]

{ #category : #'accessing-properites' }
SmaCCRewriteEngine >> propertyAt: aString ifAbsent: aBlock [
	^ properties at: aString ifAbsent: aBlock
]

{ #category : #'accessing-properites' }
SmaCCRewriteEngine >> propertyAt: aString ifAbsentPut: aBlock [
	^ properties at: aString ifAbsentPut: aBlock
]

{ #category : #'accessing-properites' }
SmaCCRewriteEngine >> propertyAt: aString put: anObject [
	^ properties at: aString put: anObject
]

{ #category : #'accessing-properites' }
SmaCCRewriteEngine >> removeProperty: aString [
	^ properties removeKey: aString ifAbsent: [ nil ]
]

{ #category : #private }
SmaCCRewriteEngine >> rewrite: aSmaCCParseNode [
	self rewriteNode: aSmaCCParseNode.
	^ source
		copyFrom: (self startPositionForNode: aSmaCCParseNode)
		to: (self stopPositionForNode: aSmaCCParseNode)
]

{ #category : #private }
SmaCCRewriteEngine >> rewriteNode: aSmaCCNode [
	(aSmaCCNode isNil or: [ processedNodes includes: aSmaCCNode ])
		ifTrue: [ ^ self ].
	self markAsProcessed: aSmaCCNode.
	rewriteRule
		performOn: aSmaCCNode
		continuation: [ self processChildrenOf: aSmaCCNode ]
]

{ #category : #accessing }
SmaCCRewriteEngine >> rewriteRule [
	^ rewriteRule
]

{ #category : #accessing }
SmaCCRewriteEngine >> rewriteRule: aSmaCCAbstractRewrite [
	rewriteRule := aSmaCCAbstractRewrite.
	aSmaCCAbstractRewrite engine: self
]

{ #category : #rewriting }
SmaCCRewriteEngine >> rewriteTree: aSmaCCParseNode [
	source isNil
		ifTrue: [ source := aSmaCCParseNode completeSource copy ].
	^ (self rewrite: aSmaCCParseNode) asString
]

{ #category : #private }
SmaCCRewriteEngine >> setPosition: anIndex in: aSequenceableCollection [
	| i lastPosition |
	lastPosition := aSequenceableCollection last.
	i := aSequenceableCollection size.
	[ i > 0 and: [ lastPosition = (aSequenceableCollection at: i) ] ]
		whileTrue: [ aSequenceableCollection at: i put: anIndex.
			i := i - 1 ]
]

{ #category : #accessing }
SmaCCRewriteEngine >> setStartPositionForNode: aSmaCCParseNode to: anIndex [
	| position current |
	current := aSmaCCParseNode.
	position := self startPositionForNode: aSmaCCParseNode.
	[ newStarts at: current put: anIndex.
	current := current parent.
	current notNil
		and: [ position = (self startPositionForNode: current) ] ] whileTrue
]

{ #category : #accessing }
SmaCCRewriteEngine >> setStopPositionForNode: aSmaCCParseNode to: anIndex [
	| position current |
	current := aSmaCCParseNode.
	position := self stopPositionForNode: aSmaCCParseNode.
	[ newStops at: current put: anIndex.
	current := current parent.
	current notNil
		and: [ position = (self stopPositionForNode: current) ] ] whileTrue
]

{ #category : #accessing }
SmaCCRewriteEngine >> source [
	^ source
]

{ #category : #accessing }
SmaCCRewriteEngine >> source: aSmaCCString [
	source := aSmaCCString
]

{ #category : #accessing }
SmaCCRewriteEngine >> startPositionForNode: aSmaCCParseNode [
	((aSmaCCParseNode isKindOf: SmaCCParseNode)
		and: [ aSmaCCParseNode parent isNil ])
		ifTrue: [ ^ source startIndex ].
	^ newStarts
		at: aSmaCCParseNode
		ifAbsent: [ aSmaCCParseNode startPosition ]
]

{ #category : #accessing }
SmaCCRewriteEngine >> stopPositionForNode: aSmaCCParseNode [
	((aSmaCCParseNode isKindOf: SmaCCParseNode)
		and: [ aSmaCCParseNode parent isNil ])
		ifTrue: [ ^ source stopIndex ].
	^ newStops
		at: aSmaCCParseNode
		ifAbsent: [ aSmaCCParseNode stopPosition ]
]

{ #category : #accessing }
SmaCCRewriteEngine >> updateStartPositionFor: aSmaCCParseNode to: startPosition whenEqualTo: anIndex [
	anIndex = (self startPositionForNode: aSmaCCParseNode)
		ifTrue: [ self
				setStartPositionForNode: aSmaCCParseNode
				to: startPosition ]
]

{ #category : #accessing }
SmaCCRewriteEngine >> updateStopPositionFor: aSmaCCParseNode to: stopPosition whenEqualTo: anIndex [
	anIndex = (self stopPositionForNode: aSmaCCParseNode)
		ifTrue: [ self
				setStopPositionForNode: aSmaCCParseNode
				to: stopPosition ]
]
