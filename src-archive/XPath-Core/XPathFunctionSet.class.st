"
A set for XPath functions. Supports set composition with + and - and lookup of functions by name.

"
Class {
	#name : #XPathFunctionSet,
	#superclass : #Collection,
	#instVars : [
		'functionsByName'
	],
	#category : #'XPath-Core-Functions'
}

{ #category : #'instance creation' }
XPathFunctionSet class >> default [
	^ XPathBooleanFunction +
		XPathCeilingFunction +
		XPathConcatFunction +
		XPathContainsFunction +
		XPathCountFunction +
		XPathEndsWithFunction +
		XPathFloorFunction +
		XPathIDFunction +
		XPathLangFunction +
		XPathLocalNameFunction +
		XPathNameFunction +
		XPathNamespaceURIFunction +
		XPathNormalizeSpaceFunction +
		XPathNotFunction +
		XPathNumberFunction +
		XPathRoundFunction +
		XPathStartsWithFunction +
		XPathStringFunction +
		XPathStringLengthFunction +
		XPathSubstringAfterFunction +
		XPathSubstringBeforeFunction +
		XPathSubstringFunction +
		XPathSumFunction +
		XPathTranslateFunction
]

{ #category : #'instance creation' }
XPathFunctionSet class >> new [
	^ self new: 15
]

{ #category : #'instance creation' }
XPathFunctionSet class >> new: aCapacity [
	^ self basicNew initialize: aCapacity
]

{ #category : #'instance creation' }
XPathFunctionSet class >> newFrom: aCollection [
	"for GS portability"
	^ self withAll: aCollection
]

{ #category : #composition }
XPathFunctionSet >> + aFunctionOrFunctionSet [
	^ aFunctionOrFunctionSet asXPathFunctionSetWithFunctions: self
]

{ #category : #copying }
XPathFunctionSet >> , aCollection [
	"GS doesn't define #, for non-Sequenceable collections"
	^ self copy
		addAll: aCollection;
		yourself
]

{ #category : #composition }
XPathFunctionSet >> - aFunctionOrFunctionSet [
	^ aFunctionOrFunctionSet asXPathFunctionSetSubtractedFromFunctions: self
]

{ #category : #comparing }
XPathFunctionSet >> = anObject [
	self == anObject
		ifTrue: [^ true].

	(self species == anObject species
		and: [self size = anObject size])
		ifFalse: [^ false].

	^ self allSatisfy: [:each | anObject includes: each].
]

{ #category : #adding }
XPathFunctionSet >> add: aFunction [
	^ functionsByName
		at: aFunction prototypeName
		put: aFunction
]

{ #category : #converting }
XPathFunctionSet >> asXPathFunctionSet [
	^ self
]

{ #category : #converting }
XPathFunctionSet >> asXPathFunctionSetSubtractedFromFunction: aFunction [
	^ aFunction asXPathFunctionSet copyWithoutAll: self
]

{ #category : #converting }
XPathFunctionSet >> asXPathFunctionSetSubtractedFromFunctions: aFunctionSet [
	^ aFunctionSet copyWithoutAll: self
]

{ #category : #converting }
XPathFunctionSet >> asXPathFunctionSetWithFunction: aFunction [
	^ self copyWith: aFunction
]

{ #category : #converting }
XPathFunctionSet >> asXPathFunctionSetWithFunctions: aFunctionSet [
	^ self, aFunctionSet
]

{ #category : #enumerating }
XPathFunctionSet >> do: aBlock [
	functionsByName valuesDo: aBlock
]

{ #category : #accessing }
XPathFunctionSet >> functionNamed: aFunctionName [
	^ self
		functionNamed: aFunctionName
		ifAbsent: [nil]
]

{ #category : #accessing }
XPathFunctionSet >> functionNamed: aFunctionName ifAbsent: aBlock [
	^ functionsByName
		at: aFunctionName
		ifAbsent: aBlock
]

{ #category : #private }
XPathFunctionSet >> functionsByName [
	^ functionsByName
]

{ #category : #comparing }
XPathFunctionSet >> hash [
	^ self species hash bitXor: functionsByName hash
]

{ #category : #testing }
XPathFunctionSet >> includes: aFunction [
	^ (functionsByName
		at: aFunction prototypeName
		ifAbsent: [^ false]) == aFunction
]

{ #category : #testing }
XPathFunctionSet >> includesFunctionNamed: aFunctionName [
	^ functionsByName includesKey: aFunctionName
]

{ #category : #initialization }
XPathFunctionSet >> initialize: aCapacity [
	functionsByName := Dictionary new: aCapacity
]

{ #category : #testing }
XPathFunctionSet >> isEmpty [
	"Squeak's Collection>>#isEmpty is inefficient"
	^ self size = 0
]

{ #category : #copying }
XPathFunctionSet >> postCopy [
	functionsByName := functionsByName copy
]

{ #category : #removing }
XPathFunctionSet >> remove: aFunction ifAbsent: aBlock [
	^ (self includes: aFunction)
		ifTrue: [
			functionsByName
				removeKey: aFunction prototypeName
				ifAbsent: aBlock]
		ifFalse: [aBlock value]
]

{ #category : #removing }
XPathFunctionSet >> removeAll [
	"Redefined because Collection>>#removeAll assumes the collection can
	be safely modified while iterating it with #do:"

	functionsByName removeAll
]

{ #category : #removing }
XPathFunctionSet >> removeFunctionNamed: aFunctionName [
	^ functionsByName removeKey: aFunctionName
]

{ #category : #removing }
XPathFunctionSet >> removeFunctionNamed: aFunctionName ifAbsent: aBlock [
	^ functionsByName
		removeKey: aFunctionName
		ifAbsent: aBlock
]

{ #category : #accessing }
XPathFunctionSet >> size [
	^ functionsByName size
]
