"
I recreate Magritte-described domain objects from strings. Typically I am used to convert string values entered into a Magritte form back to the objects they represent. For example, a user may have typed '10/01/2020' into a date field.
"
Class {
	#name : #MAStringReader,
	#superclass : #MAReader,
	#category : #'Magritte-Model-Visitor'
}

{ #category : #private }
MAStringReader >> nextMatchAll: aCollection on: aStream [
	"Tries to match ==aCollection== on ==aStream==. Answer ==true== if ==aCollection== was consumed, otherwise ==false==."

	| position |
	(aCollection isNil or: [ aCollection isEmpty ])
		ifTrue: [ ^ false ].
	position := aStream position.
	aCollection do: [ :char |
		(aStream atEnd or: [ aStream next ~= char ]) ifTrue: [
			aStream position: position.
			^ false ] ].
	^ true
]

{ #category : #visiting }
MAStringReader >> read: aStream description: aDescription [
	(aStream atEnd or: [ self nextMatchAll: aDescription undefined on: aStream ])
		ifTrue: [ ^ nil ].
	^ super read: aStream description: aDescription
]

{ #category : #'visiting-description' }
MAStringReader >> visitBooleanDescription: aDescription [
	(aDescription trueString = self contents
		or: [ aDescription trueStrings includes: self contents ])
			ifTrue: [ ^ self object: true ].
	(aDescription falseString = self contents
		or: [ aDescription falseStrings includes: self contents ])
			ifTrue: [ ^ self object: false ].
	MAReadError signal
]

{ #category : #'visiting-description' }
MAStringReader >> visitClassDescription: aDescription [
	self shouldNotImplement
]

{ #category : #'visiting-description' }
MAStringReader >> visitColorDescription: aDescription [
	(self contents notEmpty and: [ self contents allSatisfy: [ :each | '#0123456789ABCDEFabcdef.' includes: each ] ])
		ifFalse: [ MAReadError signal ].
	self object: (aDescription kind fromString: self contents)
]

{ #category : #'visiting-description' }
MAStringReader >> visitContainer: anObject [
	self shouldNotImplement
]

{ #category : #'visiting-description' }
MAStringReader >> visitDurationDescription: aDescription [
	| contents |
	contents := self contents.
	contents isEmpty
		ifTrue: [ MAReadError signal ].
	(contents occurrencesOf: $-) > 1
		ifTrue: [ MAReadError signal ].
	(contents indexOf: $-) > 1
		ifTrue: [ MAReadError signal ].
	(contents occurrencesOf: $.) > 1
		ifTrue: [ MAReadError signal ].
	(contents allSatisfy: [:each | '-0123456789.:' includes: each])
		ifFalse: [ MAReadError signal ].
	super visitDurationDescription: aDescription
]

{ #category : #'visiting-description' }
MAStringReader >> visitElementDescription: aDescription [
	"This implementation can be very dangerous and might lead to a potential security hole (this is tested), since the default implementation of #readFrom: in Object evaluates the expression to find its value. Most subclasses like Number, Date, Time, ... override this implementation, but some others (like Boolean) do not."

	self object: ([ aDescription kind readFrom: self stream ]
		on: Error do: [ :err | MAReadError signal: err messageText ])
]

{ #category : #'visiting-description' }
MAStringReader >> visitFileDescription: aDescription [
	self shouldNotImplement
]

{ #category : #'visiting-description' }
MAStringReader >> visitMultipleOptionDescription: aDescription [
	self object: (Array streamContents: [ :output |
		[ self stream atEnd ] whileFalse: [
			output nextPut: (aDescription reference
				fromString: (self stream upTo: $,)).
			self stream peek = Character space
				ifTrue: [ self stream next ] ] ])
]

{ #category : #'visiting-description' }
MAStringReader >> visitNumberDescription: aDescription [
	| isContentsValid |
	isContentsValid := NumberParser isValidNumber: self contents.
	isContentsValid ifFalse: [ MAReadError signal ].
	super visitNumberDescription: aDescription
]

{ #category : #'visiting-description' }
MAStringReader >> visitRelationDescription: aDescription [
	self shouldNotImplement
]

{ #category : #'visiting-description' }
MAStringReader >> visitSingleOptionDescription: aDescription [
	aDescription propertyAt: #labels ifPresent: [ :labels |
		labels keysAndValuesDo: [ :key :value |
			(self nextMatchAll: value on: self stream)
				ifTrue: [ ^ self object: key ] ] ].
	self visit: aDescription reference
]

{ #category : #'visiting-description' }
MAStringReader >> visitStringDescription: aDescription [
	self object: self contents
]

{ #category : #'visiting-description' }
MAStringReader >> visitSymbolDescription: aDescription [
	self object: self contents asSymbol
]

{ #category : #'visiting-description' }
MAStringReader >> visitTableDescription: aDescription [
	self shouldNotImplement
]

{ #category : #'visiting-description' }
MAStringReader >> visitTimeDescription: aDescription [
	| string |
	string := self contents.
	(string notEmpty and: [ string allSatisfy: [ :each | '0123456789: apm' includes: each ] ])
		ifFalse: [ MAReadError signal ].
	self object: (aDescription kind readFrom: string readStream)
]

{ #category : #'visiting-description' }
MAStringReader >> visitTokenDescription: aDescription [
	| token |
	self object: (aDescription kind streamContents: [ :output |
		[ self stream atEnd ] whileFalse: [
			token := WriteStream on: String new.
			[ self stream atEnd or: [ aDescription separators includes: self stream peek ] ]
				whileFalse: [ token nextPut: self stream next ].
			self stream atEnd 
				ifFalse: [ self stream next ].
			token contents isEmpty
				ifFalse: [ output nextPut: (aDescription reference fromString: token contents) ] ] ])
]

{ #category : #'visiting-description' }
MAStringReader >> visitUrlDescription: aDescription [
	self object: self contents asUrl
]
