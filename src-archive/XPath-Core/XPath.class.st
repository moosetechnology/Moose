"
This class evaluates XPath expressions in the context of XMLNodes with optional custom context objects to control evaluation. It supports complete XPath 1.0 syntax with extensions.

Basic usage:
	| doc path result context |
	doc := XMLDOMParser parse: '<test>test</test>'.
	path := XPath for: '/test'.
	result := path in: doc.

	""with a custom context""
	path := XPath for: '/*[name() = $name]'.
	context :=  XPathContext new.
	context
		variableAt: 'name'
		put: 'test'.
	result :=
		path
			in: doc
			context: context.

The syntax extensions are:
- Prefix wildcards in name tests like ""*:name""
- Expanded name tests like ""Q{namespaceURI}localName"" that allow easier namespace testing 
- The element(), attribute(), and namespace() type tests that can also have embedded name tests like ""element(name)""

Unlike standard XPath, by default prefixes in node tests are matched against literal prefixes of nodes, so you don't need to declare prefixes in the context before using them in node tests. Declaring at least one prefix triggers standard behavior. See XPathContext for more.

XPath expressions can be encoded directly in Smalltalk using special binary selectors on XMLNodes and  XMLNodeSets:
	xmlNode // 'entry' / '*' / 'link' @ 'href'.

Block or position predicates can be applied with ?? to axis node test arguments or to result node sets. This returns the first element of each 'entry' descendant:
	xmlNode // 'entry' / ('*' ?? 1).

These return the first (document order) element of the first (document order) 'entry' descendant:
	(xmlNode // 'entry' / '*') ?? 1.
	xmlNode // 'entry' / '*' ?? 1. ""same""

Block predicates take upto three arguments, the context node, context position, and context size. This returns the 2nd-5th 'link' elements of all descendant 'entry' elements with no more than 5 'link' elements:
	xmlNode // 'entry' //
		('link' ?? [:node :position :size |
				position >= 2
					and: [size <= 5]]).

Multiple predicates are supported by chaining ?? or using collection arguments. These return the first 'content' element with children of each 'entry' descendant:
	xmlNode // 'entry' //
		('content'
			?? [:node | node hasChildren]
			?? 1).
	xmlNode // 'entry' //
		('content' ?? {[:node | node hasChildren]. 1})
"
Class {
	#name : #XPath,
	#superclass : #Object,
	#instVars : [
		'compiledExpression',
		'expressionSource'
	],
	#classInstVars : [
		'compiledExpressionCacheEnabled',
		'compiledExpressionCache'
	],
	#category : #'XPath-Core'
}

{ #category : #clearing }
XPath class >> clearCompiledExpressionCache [
	"self clearCompiledExpressionCache"
	compiledExpressionCache
		ifNotNil: [compiledExpressionCache clear]
]

{ #category : #private }
XPath class >> compiledExpressionCache [
	^ compiledExpressionCache
		ifNil: [compiledExpressionCache := XMLKeyValueCache maxSize: 512]
]

{ #category : #accessing }
XPath class >> compiledExpressionCacheAt: anExpressionSourceString [
	^ self compiledExpressionCache
		at: anExpressionSourceString
		ifAbsent: [nil]
]

{ #category : #accessing }
XPath class >> compiledExpressionCacheAt: anExpressionSourceString ifAbsent: aBlock [
	^ self compiledExpressionCache
		at: anExpressionSourceString
		ifAbsent: aBlock
]

{ #category : #accessing }
XPath class >> compiledExpressionCacheAt: anExpressionSourceString ifAbsentPut: aBlock [
	^ self compiledExpressionCache
		at: anExpressionSourceString
		ifAbsentPut: aBlock
]

{ #category : #accessing }
XPath class >> compiledExpressionCacheAt: anExpressionSourceString put: aCompiledXPath [
	^ self compiledExpressionCache
		at: anExpressionSourceString
		put: aCompiledXPath
]

{ #category : #testing }
XPath class >> compiledExpressionCacheEnabled [
	^ compiledExpressionCacheEnabled
		ifNil: [compiledExpressionCacheEnabled := true]
]

{ #category : #accessing }
XPath class >> compiledExpressionCacheEnabled: aBoolean [
	"This can be used to disable the XPath compiled expression cache"

	(compiledExpressionCacheEnabled := aBoolean)
		ifFalse: [self clearCompiledExpressionCache]
]

{ #category : #'instance creation' }
XPath class >> for: anExpressionSourceString [
	^ self new expressionSource: anExpressionSourceString

]

{ #category : #evaluating }
XPath class >> for: anExpressionSourceString in: aNode [
	"Evaluates the XPath expression anExpressionSourceString with aNode
	as the initial context node"

	^ (self for: anExpressionSourceString)
		in: aNode

]

{ #category : #evaluating }
XPath class >> for: anExpressionSourceString in: aNode context: aContext [
	"Evaluates the XPath expression anExpressionSourceString with aNode
	as the initial context node and aContext as the controlling
	XPathContext object"

	^ (self for: anExpressionSourceString)
		in: aNode
		context: aContext
]

{ #category : #'class initialization' }
XPath class >> initialize [
	"self initialize"

	"reset to nil instead of just clearing to get full reinitialization"
	compiledExpressionCache := nil
]

{ #category : #accessing }
XPath class >> maxCachedCompiledExpressions [
	^ self compiledExpressionCache maxSize
]

{ #category : #accessing }
XPath class >> maxCachedCompiledExpressions: anInteger [
	self compiledExpressionCache maxSize: anInteger
]

{ #category : #converting }
XPath >> asXPath [
	^ self
]

{ #category : #compiling }
XPath >> compileExpression [
	self compileExpressionWith: self compilerClass new
]

{ #category : #compiling }
XPath >> compileExpressionWith: anExpressionCompiler [
	compiledExpression :=
		anExpressionCompiler compileExpression: self expressionSource.
	self class compiledExpressionCacheEnabled
		ifTrue: [
			self class
				compiledExpressionCacheAt: self expressionSource
				put: compiledExpression].
]

{ #category : #accessing }
XPath >> compiledExpression [
	^ compiledExpression
		ifNil: [| cachedCompiledXPath |
			(self class compiledExpressionCacheEnabled
				and: [
					"avoid #compiledXPathCacheAt:ifAbsent: and
					#compiledXPathCacheAt:ifAbsentPut: here so the cache isn't
					locked during compilation, which could stall other processes"
					(cachedCompiledXPath :=
						self class compiledExpressionCacheAt:
							self expressionSource) notNil])
				ifTrue: [compiledExpression := cachedCompiledXPath]
				ifFalse: [self compileExpression].
			compiledExpression]
]

{ #category : #defaults }
XPath >> compilerClass [
	^ XPathExpressionCompiler
]

{ #category : #defaults }
XPath >> contextClass [
	^ XPathContext
]

{ #category : #evaluating }
XPath >> evaluate [
	"Used to evaluate expressions that don't need a context node
	(Mostly for testing)"

	^ self in: nil
]

{ #category : #accessing }
XPath >> expressionSource [
	^ expressionSource
]

{ #category : #accessing }
XPath >> expressionSource: anExpressionSourceString [
	expressionSource := anExpressionSourceString.
	compiledExpression := nil.
]

{ #category : #evaluating }
XPath >> in: aNode [
	"Evaluates the XPath expression with aNode as the initial context node"

	^ self
		in: aNode
		context: self contextClass new
]

{ #category : #evaluating }
XPath >> in: aNode context: aContext [
	"Evaluates the XPath expression with aNode as the initial context node
	and aContext as the controlling XPathContext object"

	^ self compiledExpression
		evaluateInNode: aNode
		withContext: aContext
]

{ #category : #printing }
XPath >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: self expressionSource;
		nextPut: $).
]
