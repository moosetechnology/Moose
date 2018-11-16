Class {
	#name : #SmaCCRewrite,
	#superclass : #SmaCCAbstractRewrite,
	#instVars : [
		'comment',
		'match',
		'transformation',
		'engine'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #'instance creation' }
SmaCCRewrite class >> comment: aString match: aSmaCCRewriteMatch transformation: aSmaCCRewriteTransformation [
	^ self new
		comment: aString;
		match: aSmaCCRewriteMatch;
		transformation: aSmaCCRewriteTransformation;
		yourself
]

{ #category : #'instance creation' }
SmaCCRewrite class >> newInstance [
	^ self
		comment: ''
		match: (SmaCCRewriteTypeMatch on: SmaCCParseNode)
		transformation: (SmaCCRewriteCodeTransformation on: 'self continue')
]

{ #category : #accessing }
SmaCCRewrite >> comment [
	^ comment ifNil: [ '' ]
]

{ #category : #accessing }
SmaCCRewrite >> comment: aString [
	comment := aString.
	self changed: #comment
]

{ #category : #printing }
SmaCCRewrite >> displayOn: aStream [
	self comment notEmpty
		ifTrue: [ aStream nextPutAll: self comment ]
		ifFalse: [ match displayOn: aStream ]
]

{ #category : #'initialize-release' }
SmaCCRewrite >> engine: aSmaCCRewriteEngine [
	engine := aSmaCCRewriteEngine
]

{ #category : #accessing }
SmaCCRewrite >> listForClass: aClass into: aSmaCCRewriteLink [
	| next |
	(match canMatch: aClass)
		ifFalse: [ ^ aSmaCCRewriteLink ].
	next := SmaCCRewriteLink new.
	next rewrite: self.
	aSmaCCRewriteLink next: next.
	^ next
]

{ #category : #saving }
SmaCCRewrite >> localSaveOn: aStream [
	self comment notEmpty
		ifTrue:
			[ aStream
				nextPut: $";
				nextPutAll: (self comment copyReplaceAll: '"' with: '""');
				nextPut: $";
				cr ].
	match saveOn: aStream.
	aStream
		cr;
		nextPutAll: '->';
		cr.
	transformation saveOn: aStream
]

{ #category : #accessing }
SmaCCRewrite >> match [
	^ match
]

{ #category : #accessing }
SmaCCRewrite >> match: aSmaCCRewriteMatch [
	match := aSmaCCRewriteMatch.
	match rewrite: self.
	self changed: #match
]

{ #category : #testing }
SmaCCRewrite >> matches: aString [
	^ (super matches: aString)
		or: [ (Smalltalk at: aString asSymbol ifAbsent: [ nil ])
				ifNil: [ false ]
				ifNotNil: [ :class | (class isKindOf: SmaCCParseNode class) and: [ match canMatch: class ] ] ]
]

{ #category : #rewriting }
SmaCCRewrite >> performOn: aSmaCCNode continuation: aBlock [
	| matchedContext dictionary result previousNode previousRule |
	previousNode := engine source node.
	previousRule := engine source rule.
	engine source
		node: aSmaCCNode;
		rule: self.
	matchedContext := engine contextClass new.
	matchedContext forNode: aSmaCCNode rewriter: engine continuation: aBlock.
	dictionary := match match: matchedContext.
	result := dictionary notNil.
	result
		ifTrue: [ matchedContext context: dictionary.
			result := (transformation transformUsingContext: matchedContext) ~~ SmaCCRewriteMatchContext continue ].
	engine source
		node: previousNode;
		rule: previousRule.
	^ result
]

{ #category : #copying }
SmaCCRewrite >> postCopy [
	super postCopy.
	self match: self match copy.
	self transformation: self transformation copy.
	engine := nil
]

{ #category : #accessing }
SmaCCRewrite >> transformation [
	^ transformation
]

{ #category : #accessing }
SmaCCRewrite >> transformation: aSmaCCRewriteTransformation [
	transformation := aSmaCCRewriteTransformation.
	transformation rewrite: self.
	self changed: #transformation
]
