Class {
	#name : #SmaCCRewriteCodeTransformation,
	#superclass : #SmaCCRewriteTransformation,
	#instVars : [
		'code',
		'method'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'instance creation' }
SmaCCRewriteCodeTransformation class >> on: aString [
	^ self new
		code: aString;
		yourself
]

{ #category : #accessing }
SmaCCRewriteCodeTransformation >> code [
	^ code
]

{ #category : #'initialize-release' }
SmaCCRewriteCodeTransformation >> code: aString [
	code := aString.
	method := nil.
	self modified
]

{ #category : #'initialize-release' }
SmaCCRewriteCodeTransformation >> initialize [
	super initialize.
	code := 'self continue'
]

{ #category : #accessing }
SmaCCRewriteCodeTransformation >> method [
	method isNil
		ifTrue: [ | tree rewriter |
			tree := RBParser parseMethod: 'code ' , code.
			tree body addReturn.
			rewriter := RBParseTreeRewriter new.
			rewriter replace: '^self continue' with: '^Continue'.
			rewriter executeTree: tree.
			method := SmaCCRewriteMatchContext compiledMethodFor: rewriter tree formattedCode ].
	^ method
]

{ #category : #saving }
SmaCCRewriteCodeTransformation >> saveOn: aStream [
	aStream
		nextPut: $[;
		nextPutAll: code;
		nextPut: $]
]

{ #category : #accessing }
SmaCCRewriteCodeTransformation >> string [
	^ code
]

{ #category : #transforming }
SmaCCRewriteCodeTransformation >> transformUsingContext: aSmaCCRewriteMatchContext [
	self class haltBlock
		ifNotNil: [ :block | 
			(block value: rewrite value: aSmaCCRewriteMatchContext match)
				ifTrue: [ ^ aSmaCCRewriteMatchContext debugMethod: self method message: rewrite displayString ] ].
	^ self method valueWithReceiver: aSmaCCRewriteMatchContext arguments: #()
]
