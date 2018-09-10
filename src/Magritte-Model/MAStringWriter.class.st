Class {
	#name : #MAStringWriter,
	#superclass : #MAWriter,
	#category : #'Magritte-Model-Visitor'
}

{ #category : #private }
MAStringWriter >> defaultWriteStream [
	^ WriteStream on: String new
]

{ #category : #private }
MAStringWriter >> printObjectDescribedBy: aDescription [

	| string |
	string := aDescription displayStringFor: self object.
	self stream nextPutAll: string.
]

{ #category : #'visiting-description' }
MAStringWriter >> visitBooleanDescription: aDescription [
	self stream nextPutAll: (self object
		ifTrue: [ aDescription trueString ]
		ifFalse: [ aDescription falseString ])
]

{ #category : #'visiting-description' }
MAStringWriter >> visitClassDescription: aDescription [
	self stream nextPutAll: self object label
]

{ #category : #'visiting-description' }
MAStringWriter >> visitColorDescription: aDescription [
	stream nextPut: $#.
	stream nextPutAll: ((255 * self object red) asInteger
		printPaddedWith: $0 to: 2 base: 16).
	stream nextPutAll: ((255 * self object green) asInteger
		printPaddedWith: $0 to: 2 base: 16).
	stream nextPutAll: ((255 * self object blue) asInteger
		printPaddedWith: $0 to: 2 base: 16)
]

{ #category : #'visiting-description' }
MAStringWriter >> visitContainer: aDescription [
	aDescription do: [ :each |
		each isVisible ifTrue: [
			each stringWriter
				write: (self object readUsing: each)
				description: each to: stream.
			^ self ] ]
]

{ #category : #'visiting-description' }
MAStringWriter >> visitDateAndTimeDescription: aDescription [

	self printObjectDescribedBy: aDescription.
]

{ #category : #'visiting-description' }
MAStringWriter >> visitElementDescription: aDescription [ 
	self stream nextPutAll: self object greaseString
]

{ #category : #'visiting-description' }
MAStringWriter >> visitFileDescription: aDescription [
	self stream nextPutAll: self object filename
]

{ #category : #'visiting-description' }
MAStringWriter >> visitMultipleOptionDescription: aDescription [
	self object isEmpty
		ifTrue: [ self stream nextPutAll: aDescription undefined ]
		ifFalse: [
			self object
				do: [ :each | self stream nextPutAll: (aDescription labelForOption: each) ]
				separatedBy: [ self stream nextPutAll: ', ' ] ]
]

{ #category : #'visiting-description' }
MAStringWriter >> visitSingleOptionDescription: aDescription [
	self stream nextPutAll: (aDescription labelForOption: self object)
]

{ #category : #'visiting-description' }
MAStringWriter >> visitStringDescription: aDescription [

	self printObjectDescribedBy: aDescription.
]

{ #category : #'visiting-description' }
MAStringWriter >> visitTimeDescription: aDescription [ 
	
	self printObjectDescribedBy: aDescription.
]

{ #category : #'visiting-description' }
MAStringWriter >> visitTimeStampDescription: aDescription [
	self stream print: self object asDate; space.
	self stream print: self object asTime
]

{ #category : #'visiting-description' }
MAStringWriter >> visitToManyRelationDescription: aDescription [
	self object
		do: [ :each | self object: each during: [ self visit: each magritteDescription ] ]
		separatedBy: [ self stream nextPutAll: ', ' ]
]

{ #category : #'visiting-description' }
MAStringWriter >> visitToOneRelationDescription: aDescription [
	self visit: self object magritteDescription
]

{ #category : #'visiting-description' }
MAStringWriter >> visitTokenDescription: aDescription [
	self object
		do: [ :each | self object: each during: [ self visit: aDescription reference ] ]
		separatedBy: [ self stream nextPut: aDescription separators first ]
]

{ #category : #'visiting-description' }
MAStringWriter >> visitUrlDescription: aMAUrlDescription [ 
	self stream nextPutAll: self object asString
]

{ #category : #visiting }
MAStringWriter >> write: anObject description: aDescription to: aStream [
	anObject isNil 
		ifTrue: [ aStream nextPutAll: aDescription undefined ]
		ifFalse: [ super write: anObject description: aDescription to: aStream ].
	^ aStream contents
]
