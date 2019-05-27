"
SmaCCError is a special node that is used when encountering an error during parsing and the parser uses the special ""error"" keyword in the grammar. When an error occurs the parser searches for a location on the stack that will shift the ""error"". 

Instance Variables:
	stackContents	<Array of: Object>	the objects that had to be popped off the node stack to be able to shift the error
	dismissedTokens	<OrderedCollection of: Object>	the token objects that needed to be ignored to be able to resume parsing
	errorToken	<SmaCCToken>	the token that started the error handling. This token may also be in the dismissedTokens or it may be used in some other node created after handling the error
"
Class {
	#name : #SmaCCErrorNode,
	#superclass : #SmaCCParseNode,
	#instVars : [
		'stackContents',
		'dismissedTokens',
		'errorToken'
	],
	#category : #'SmaCC_Runtime'
}

{ #category : #'visitor-double dispatching' }
SmaCCErrorNode >> acceptVisitor: aSmaCCParseNodeVisitor [
	^ aSmaCCParseNodeVisitor visitSmaCCError: self
]

{ #category : #private }
SmaCCErrorNode >> assignParents: anObject [
	(anObject isKindOf: SmaCCParseNode)
		ifTrue: [ anObject parent: self ].
	(anObject isKindOf: Collection)
		ifTrue: [ anObject do: [ :each | self assignParents: each ] ]
]

{ #category : #private }
SmaCCErrorNode >> calculateStartPosition [
	| min |
	min := SmallInteger maxVal.
	self errorComponentsDo: [ :each | each startPosition ifNotNil: [ :pos | min := min min: pos ] ].
	min = SmallInteger maxVal
		ifTrue: [ min := errorToken startPosition ].
	^ min
]

{ #category : #private }
SmaCCErrorNode >> calculateStopPosition [
	| max |
	max := 0.
	self errorComponentsDo: [ :each | each stopPosition ifNotNil: [ :pos | max := max max: pos ] ].
	max = 0
		ifTrue: [ max := errorToken startPosition ].
	^ max
]

{ #category : #accessing }
SmaCCErrorNode >> dismissedTokens [
	^ dismissedTokens
]

{ #category : #accessing }
SmaCCErrorNode >> dismissedTokens: tokenCollection [
	dismissedTokens := tokenCollection
]

{ #category : #errors }
SmaCCErrorNode >> doesNotUnderstand: aMessage [
	"Hack to handle reduce action steps that add parens (or other items) to pulled up nodes. 
	Probably should validate that we are inside a reduce action."

	aMessage arguments isEmpty
		ifTrue: [ ^ (self attributeNamed: #nodeProperties ifAbsentPut: [ Dictionary new ])
				at: aMessage selector
				ifAbsentPut: [ OrderedCollection new ] ].
	super doesNotUnderstand: aMessage
]

{ #category : #private }
SmaCCErrorNode >> errorComponentsDo: aBlock [
	self nodesAndTokensIn: stackContents do: aBlock.
	dismissedTokens do: aBlock
]

{ #category : #accessing }
SmaCCErrorNode >> errorToken [
	^ errorToken
]

{ #category : #accessing }
SmaCCErrorNode >> errorToken: smaccToken [
	errorToken := smaccToken
]

{ #category : #testing }
SmaCCErrorNode >> isErrorNode [
	^ true
]

{ #category : #private }
SmaCCErrorNode >> nodesAndTokensIn: anObject do: aBlock [
	anObject isCollection
		ifTrue: [ anObject do: [ :each | self nodesAndTokensIn: each do: aBlock ] ]
		ifFalse: [ ((anObject isKindOf: SmaCCParseNode) or: [ anObject isKindOf: SmaCCToken ])
				ifTrue: [ aBlock value: anObject ] ]
]

{ #category : #iterating }
SmaCCErrorNode >> nodesDo: nodeBlock andTokensDo: tokenBlock includeErrors: aBoolean [
	super nodesDo: nodeBlock andTokensDo: tokenBlock includeErrors: aBoolean.
	aBoolean
		ifFalse: [ ^ self ].
	self
		errorComponentsDo: [ :each | 
			(nodeBlock notNil and: [ each isKindOf: SmaCCParseNode ])
				ifTrue: [ nodeBlock value: each ].
			(tokenBlock notNil and: [ each isKindOf: SmaCCToken ])
				ifTrue: [ tokenBlock value: each ] ]
]

{ #category : #accessing }
SmaCCErrorNode >> stackContents [
	^ stackContents
]

{ #category : #accessing }
SmaCCErrorNode >> stackContents: aCollection [
	stackContents := aCollection.
	self assignParents: aCollection
]
