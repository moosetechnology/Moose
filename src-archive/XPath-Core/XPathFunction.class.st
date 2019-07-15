"
An abstract class for XPath functions. Subclasses need to implement the class #prototypeSource method to return a string with an XPath function prototype and then implement the instance-side #function method to implement the function and return its value. When invoked, the arguments and the return value are automatically converted to the types specified by the prototype.

Functions, including user-defined, can be combined into an XPathFunctionSet and injected into an XPathContext object before evaluation, but some functions (last(), position(), true(), and false()) are compiled inline and can never be redefined.
"
Class {
	#name : #XPathFunction,
	#superclass : #Object,
	#instVars : [
		'context',
		'contextNode',
		'arguments'
	],
	#classInstVars : [
		'prototype'
	],
	#category : #'XPath-Core-Functions'
}

{ #category : #composition }
XPathFunction class >> + aFunctionOrFunctionSet [
	^ aFunctionOrFunctionSet asXPathFunctionSetWithFunction: self
]

{ #category : #composition }
XPathFunction class >> - aFunctionOrFunctionSet [
	^ aFunctionOrFunctionSet asXPathFunctionSetSubtractedFromFunction: self
]

{ #category : #converting }
XPathFunction class >> asXPathFunctionSet [
	^ self functionSetClass with: self
]

{ #category : #converting }
XPathFunction class >> asXPathFunctionSetSubtractedFromFunction: aFunction [
	^ aFunction asXPathFunctionSet copyWithout: self
]

{ #category : #converting }
XPathFunction class >> asXPathFunctionSetSubtractedFromFunctions: aFunctionSet [
	^ aFunctionSet copyWithout: self
]

{ #category : #converting }
XPathFunction class >> asXPathFunctionSetWithFunction: aFunction [
	^ self asXPathFunctionSet
		add: aFunction;
		yourself
]

{ #category : #converting }
XPathFunction class >> asXPathFunctionSetWithFunctions: aFunctionSet [
	^ self asXPathFunctionSet
		addAll: aFunctionSet;
		yourself
]

{ #category : #'instance creation' }
XPathFunction class >> context: aContext contextNode: aContextNode arguments: aSequenceableCollection [
	^ self new
		setContext: aContext
		contextNode: aContextNode
		arguments: aSequenceableCollection
]

{ #category : #private }
XPathFunction class >> functionSetClass [
	^ XPathFunctionSet
]

{ #category : #'class initialization' }
XPathFunction class >> initialize [
	"self initialize"

	self allSubclassesDo: [:each | each prototype: nil]
]

{ #category : #accessing }
XPathFunction class >> prototype [
	^ prototype
		ifNil: [
			prototype :=
				XPathFunctionPrototype fromString:
					self prototypeSource]
]

{ #category : #accessing }
XPathFunction class >> prototype: aFunctionPrototype [
	"
	self allSubclassesDo: [:each |
		each
			prototype: nil;
			prototype]
	"

	prototype := aFunctionPrototype
]

{ #category : #accessing }
XPathFunction class >> prototypeName [
	^ self prototype name
]

{ #category : #accessing }
XPathFunction class >> prototypeSource [
	"Should return a protype string. See subclasses for examples."

	self subclassResponsibility
]

{ #category : #testing }
XPathFunction >> acceptsArguments [
	^ self prototype acceptsArguments
]

{ #category : #testing }
XPathFunction >> acceptsOptionalArguments [
	^ self prototype acceptsOptionalArguments
]

{ #category : #testing }
XPathFunction >> acceptsVariableArguments [
	^ self prototype acceptsVariableArguments
]

{ #category : #accessing }
XPathFunction >> argumentAt: anIndex [
	^ self
		argumentAt: anIndex
		ifAbsent: [nil]
]

{ #category : #accessing }
XPathFunction >> argumentAt: anIndex ifAbsent: aBlock [
	^ self arguments
		at: anIndex
		ifAbsent: aBlock
]

{ #category : #accessing }
XPathFunction >> argumentTypeAt: anIndex [
	^ self prototype argumentTypeAt: anIndex
]

{ #category : #accessing }
XPathFunction >> argumentTypeAt: anIndex ifAbsent: aBlock [
	^ self prototype
		argumentTypeAt: anIndex
		ifAbsent: aBlock
]

{ #category : #accessing }
XPathFunction >> argumentTypes [
	^ self prototype argumentTypes
]

{ #category : #accessing }
XPathFunction >> arguments [
	^ arguments
]

{ #category : #enumerating }
XPathFunction >> argumentsDo: aBlock [
	self arguments do: aBlock
]

{ #category : #accessing }
XPathFunction >> context [
	^ context
]

{ #category : #accessing }
XPathFunction >> contextNode [
	^ contextNode
]

{ #category : #private }
XPathFunction >> errorAcceptsAtMost: anArgumentMaximum argumentsButGot: anArgumentTotal [
	XPathArgumentNumberException
		formatSignal: '{1}() accepts at most {2} argument(s) but was called with {3}'
		with: self name
		with: anArgumentMaximum
		with: anArgumentTotal
]

{ #category : #private }
XPathFunction >> errorRequiresAtLeast: anArgumentMinimum argumentsButGot: anArgumentTotal [
	XPathArgumentNumberException
		formatSignal:
			'{1}() requires at least {2} argument(s) but was called with {3}'
		with: self name
		with: anArgumentMinimum
		with: anArgumentTotal
]

{ #category : #accessing }
XPathFunction >> firstArgument [
	^ self argumentAt: 1
]

{ #category : #implementing }
XPathFunction >> function [
	self subclassResponsibility
]

{ #category : #testing }
XPathFunction >> hasArguments [
	^ self totalArguments > 0
]

{ #category : #invoking }
XPathFunction >> invoke [
	^ self returnType newFrom: self function
]

{ #category : #accessing }
XPathFunction >> lastArgument [
	^ self argumentAt: self totalArguments
]

{ #category : #accessing }
XPathFunction >> maxArguments [
	^ self prototype maxArguments
]

{ #category : #accessing }
XPathFunction >> minArguments [
	^ self prototype minArguments
]

{ #category : #accessing }
XPathFunction >> name [
	^ self prototype name
]

{ #category : #'instance creation' }
XPathFunction >> newContextNodeNodeSet [
	^ self contextNode
		ifNil: [self newNodeSet]
		ifNotNil: [self nodeSetClass with: self contextNode]
]

{ #category : #'instance creation' }
XPathFunction >> newNodeSet [
	^ self nodeSetClass new
]

{ #category : #defaults }
XPathFunction >> nodeSetClass [
	^ XPathNodeSet
]

{ #category : #printing }
XPathFunction >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		print: self prototype;
		nextPut: $).
]

{ #category : #accessing }
XPathFunction >> prototype [
	^ self class prototype
]

{ #category : #accessing }
XPathFunction >> returnType [
	^ self prototype returnType
]

{ #category : #initialization }
XPathFunction >> setArguments: aSequenceableCollection [
	"ensure there aren't too many or too few"
	aSequenceableCollection size < self minArguments
		ifTrue: [
			self
				errorRequiresAtLeast: self minArguments
				argumentsButGot: aSequenceableCollection size].
	(self maxArguments notNil
		and: [aSequenceableCollection size > self maxArguments])
		ifTrue: [
			self
				errorAcceptsAtMost: self maxArguments
				argumentsButGot: aSequenceableCollection size].

	"convert them to the appropriate type (use to:do: for speed)"
	1 to: aSequenceableCollection size do: [:i |
		aSequenceableCollection
			at: i
			put:
				((self argumentTypeAt: i) newFrom:
					(aSequenceableCollection at: i))].

	arguments := aSequenceableCollection asArray.
]

{ #category : #initialization }
XPathFunction >> setContext: aContext contextNode: aContextNode arguments: aSequenceableCollection [
	context := aContext.
	contextNode := aContextNode.
	self setArguments: aSequenceableCollection.
]

{ #category : #accessing }
XPathFunction >> totalArguments [
	^ self arguments size
]
