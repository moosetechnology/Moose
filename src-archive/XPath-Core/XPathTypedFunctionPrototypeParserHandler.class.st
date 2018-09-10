"
A handler class for function prototype parsers that returns XPathFunctionPrototypes with the function name, return type, and number and types of arguments from the prototype source.
"
Class {
	#name : #XPathTypedFunctionPrototypeParserHandler,
	#superclass : #XPathFunctionPrototypeParserHandler,
	#instVars : [
		'returnType',
		'functionName',
		'minArguments',
		'maxArguments',
		'argumentTypes',
		'typesByName'
	],
	#category : #'XPath-Core-Parsers'
}

{ #category : #private }
XPathTypedFunctionPrototypeParserHandler >> addArgumentTypeFor: aTypeName [
	argumentTypes addLast: (self typeNamed: aTypeName)
]

{ #category : #private }
XPathTypedFunctionPrototypeParserHandler >> errorUnrecognizedTypeName: aTypeName [
	XPathTypeException
		formatSignal: 'Unrecognized type name "{1}"'
		with: aTypeName
]

{ #category : #handling }
XPathTypedFunctionPrototypeParserHandler >> handleArgument: anArgument [
	minArguments := minArguments + 1.
	maxArguments := maxArguments + 1.
	self addArgumentTypeFor: anArgument.
]

{ #category : #handling }
XPathTypedFunctionPrototypeParserHandler >> handleEndParsing [
	self parsingResult:
		(XPathFunctionPrototype
			returnType: returnType
			name: functionName
			minArguments: minArguments
			maxArguments: maxArguments
			argumentTypes: argumentTypes)
]

{ #category : #handling }
XPathTypedFunctionPrototypeParserHandler >> handleFunctionName: aName [
	functionName := aName
]

{ #category : #handling }
XPathTypedFunctionPrototypeParserHandler >> handleOptionalArgument: anArgument [
	maxArguments := maxArguments + 1.
	self addArgumentTypeFor: anArgument.
]

{ #category : #handling }
XPathTypedFunctionPrototypeParserHandler >> handleReturnType: aReturnType [
	returnType := self typeNamed: aReturnType
]

{ #category : #handling }
XPathTypedFunctionPrototypeParserHandler >> handleStartParsing [
	minArguments := 0.
	maxArguments := 0.
	argumentTypes := OrderedCollection new.

	typesByName := Dictionary new.
	XPathValueType withAllSubclassesDo: [:each | | type |
		type := each new.
		typesByName
			at: type name
			put: type].
]

{ #category : #handling }
XPathTypedFunctionPrototypeParserHandler >> handleUnboundedArgument: anArgument [
	maxArguments := nil.
	self addArgumentTypeFor: anArgument.
]

{ #category : #private }
XPathTypedFunctionPrototypeParserHandler >> typeNamed: aTypeName [
	^ self
		typeNamed: aTypeName
		ifNone: [self errorUnrecognizedTypeName: aTypeName]
]

{ #category : #private }
XPathTypedFunctionPrototypeParserHandler >> typeNamed: aTypeName ifNone: aBlock [
	^ typesByName
		at: aTypeName
		ifAbsent: aBlock
]
