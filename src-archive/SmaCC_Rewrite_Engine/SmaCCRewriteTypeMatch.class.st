Class {
	#name : #SmaCCRewriteTypeMatch,
	#superclass : #SmaCCRewriteMatch,
	#instVars : [
		'nodeClass',
		'code',
		'method',
		'enableDebug'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'instance creation' }
SmaCCRewriteTypeMatch class >> on: aClass [
	^ self new
		enableDebug: false;
		nodeClass: aClass;
		yourself
]

{ #category : #testing }
SmaCCRewriteTypeMatch >> canMatch: aClass [
	^ aClass includesBehavior: nodeClass
]

{ #category : #accessing }
SmaCCRewriteTypeMatch >> code [
	^ code
]

{ #category : #accessing }
SmaCCRewriteTypeMatch >> code: aString [
	code := aString.
	method := nil.
	self modified
]

{ #category : #matching }
SmaCCRewriteTypeMatch >> codeMatches: aSmaCCRewriteMatchContext [
	(code isNil or: [ code isEmpty ])
		ifTrue: [ ^ true ].
	self class haltBlock
		ifNotNil: [ :block | 
			(block value: rewrite value: aSmaCCRewriteMatchContext match)
				ifTrue: [ ^ (aSmaCCRewriteMatchContext debugMethod: self method message: rewrite displayString) == true ] ].
	^ (enableDebug and: [ SmaCCRewriteProcessor debug ])
		ifTrue: [ self methodMatches: aSmaCCRewriteMatchContext ]
		ifFalse: [ [ self methodMatches: aSmaCCRewriteMatchContext ]
				on: Error
				do: [ :ex | ex return: false ] ]
]

{ #category : #printing }
SmaCCRewriteTypeMatch >> displayOn: aStream [
	aStream nextPutAll: nodeClass name
]

{ #category : #accessing }
SmaCCRewriteTypeMatch >> enableDebug [
	^ enableDebug
]

{ #category : #accessing }
SmaCCRewriteTypeMatch >> enableDebug: aBoolean [
	enableDebug := aBoolean
]

{ #category : #'initialize-release' }
SmaCCRewriteTypeMatch >> initialize [
	super initialize.
	nodeClass := SmaCCParseNode.
	code := ''.
	enableDebug := false
]

{ #category : #matching }
SmaCCRewriteTypeMatch >> match: aSmaCCRewriteMatchContext [
	| dictionary |
	(aSmaCCRewriteMatchContext match isKindOf: nodeClass)
		ifFalse: [ ^ nil ].
	(self codeMatches: aSmaCCRewriteMatchContext)
		ifFalse: [ ^ nil ].
	dictionary := Dictionary new.
	aSmaCCRewriteMatchContext match
		allGettersDo:
			[ :each | 
			dictionary
				at: (SmaCCPatternToken value: each asString)
				put: (aSmaCCRewriteMatchContext match perform: each) ].
	^ dictionary
]

{ #category : #private }
SmaCCRewriteTypeMatch >> method [
	method isNil
		ifTrue: [ | tree |
			tree := RBParser parseMethod: 'code ' , code.
			tree body statements isEmpty
				ifTrue: [ ^ method := Object compiledMethodAt: #notNil ].
			tree body addReturn.
			method := SmaCCRewriteMatchContext compiledMethodFor: tree formattedCode ].
	^ method
]

{ #category : #matching }
SmaCCRewriteTypeMatch >> methodMatches: aSmaCCRewriteMatchContext [
	^ (self method valueWithReceiver: aSmaCCRewriteMatchContext arguments: #()) = true
]

{ #category : #accessing }
SmaCCRewriteTypeMatch >> nodeClass [
	^ nodeClass
]

{ #category : #'initialize-release' }
SmaCCRewriteTypeMatch >> nodeClass: aClass [
	nodeClass := aClass.
	self modified
]

{ #category : #saving }
SmaCCRewriteTypeMatch >> saveOn: aStream [
	aStream nextPutAll: nodeClass name.
	(code isNil or: [ code isEmpty ])
		ifTrue: [ ^ self ].
	aStream
		cr;
		nextPut: $[;
		nextPutAll: code;
		nextPut: $]
]
