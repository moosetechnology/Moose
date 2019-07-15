"
An immutable class for storing the function return type, name, and argument number and types parsed from a function prototype source string.
"
Class {
	#name : #XPathFunctionPrototype,
	#superclass : #Object,
	#instVars : [
		'returnType',
		'name',
		'minArguments',
		'maxArguments',
		'argumentTypes'
	],
	#category : #'XPath-Core-Functions'
}

{ #category : #'instance creation' }
XPathFunctionPrototype class >> fromString: aSourceString [
	^ (XPathFunctionPrototypeParser
		on: aSourceString
		for: XPathTypedFunctionPrototypeParserHandler new) parse
]

{ #category : #'instance creation' }
XPathFunctionPrototype class >> returnType: aReturnType name: aName minArguments: aMinimum maxArguments: aMaximum argumentTypes: anArgumentTypeCollection [
	^ self new
		setReturnType: aReturnType
		name: aName
		minArguments: aMinimum
		maxArguments: aMaximum
		argumentTypes: anArgumentTypeCollection
]

{ #category : #testing }
XPathFunctionPrototype >> acceptsArguments [
	^ self minArguments > 0
		or: [self maxArguments isNil
			or: [self maxArguments > 0]]
]

{ #category : #testing }
XPathFunctionPrototype >> acceptsOptionalArguments [
	^ self acceptsArguments
		and: [self minArguments ~= self maxArguments]
]

{ #category : #testing }
XPathFunctionPrototype >> acceptsVariableArguments [
	^ self acceptsArguments
		and: [self maxArguments isNil]
]

{ #category : #accessing }
XPathFunctionPrototype >> argumentTypeAt: anIndex [
	^ self
		argumentTypeAt: anIndex
		ifAbsent: [nil]
]

{ #category : #accessing }
XPathFunctionPrototype >> argumentTypeAt: anIndex ifAbsent: aBlock [
	anIndex > 0
		ifFalse: [^ aBlock value].
	anIndex > self argumentTypes size
		ifTrue: [
			"If it has a variable number of arguments, then
			use the last argument type for the remaining"
			self acceptsVariableArguments
				ifTrue: [^ self argumentTypes last]
				ifFalse: [^ aBlock value]].
	^ self argumentTypes at: anIndex.
]

{ #category : #accessing }
XPathFunctionPrototype >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
XPathFunctionPrototype >> maxArguments [
	^ maxArguments
]

{ #category : #accessing }
XPathFunctionPrototype >> minArguments [
	^ minArguments
]

{ #category : #accessing }
XPathFunctionPrototype >> name [
	^ name
]

{ #category : #printing }
XPathFunctionPrototype >> printOn: aStream [
	super printOn: aStream.

	aStream
		nextPut: $(;
		nextPutAll: self returnType name;
		space;
		nextPutAll: self name;
		nextPut: $(.

	self argumentTypes withIndexDo: [:each :i |
		i > 1
			ifTrue: [aStream nextPutAll: ', '].
		aStream nextPutAll: each name.
		i > self minArguments
			ifTrue: [
				self maxArguments
					ifNil: [aStream nextPut: $*]
					ifNotNil: [aStream nextPut: $?]]].

	aStream nextPutAll: '))'.
]

{ #category : #accessing }
XPathFunctionPrototype >> returnType [
	^ returnType
]

{ #category : #initialization }
XPathFunctionPrototype >> setReturnType: aReturnType name: aName minArguments: aMinimum maxArguments: aMaximum argumentTypes: anArgumentTypeCollection [
	returnType := aReturnType.
	name := aName.
	minArguments := aMinimum.
	maxArguments := aMaximum.
	argumentTypes := anArgumentTypeCollection asArray.
]
