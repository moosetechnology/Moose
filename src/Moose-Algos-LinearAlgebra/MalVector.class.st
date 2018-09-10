"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalVector,
	#superclass : #ArrayedCollection,
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #accessing }
MalVector class >> browserIcon [
"Answer icon to be displayed with matrix classes."
	
	^ nil
]

{ #category : #'instance creation' }
MalVector class >> new [
	
	^self new: 0
]

{ #category : #'instance creation' }
MalVector class >> new: aSize [
	
	^(self basicNew)
		initializeSize: aSize;
		yourself
]

{ #category : #'instance creation' }
MalVector class >> new: aSize withAll: value [
	
	^(self new: aSize)
		atAllPut: value;
		yourself
]

{ #category : #'instance creation' }
MalVector class >> readFromDenseText: aStream [
	
	| size vector |
	size := Integer readFrom: aStream skipSeparators.
	vector := self new: size.
	1
		to: size
		do:
			[:index | 
			vector
				at: index
				"put: (Number readSmalltalkAndCSyntaxFrom: aStream skipSeparators)"
				put: (Number readFrom: aStream skipSeparators)].
	^vector
]

{ #category : #'constants access' }
MalVector class >> unity [
	
	^MalVectorCoercion with: 1
]

{ #category : #'instance creation' }
MalVector class >> withAll: aCollection [
	
	^(self new: aCollection size)
		atAllPut: aCollection;
		yourself
]

{ #category : #'constants access' }
MalVector class >> zero [
	
	^MalVectorCoercion with: 0
]

{ #category : #arithmetic }
MalVector >> * aNumber [
	
	^aNumber productFromVector: self
]

{ #category : #arithmetic }
MalVector >> *= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a * b]
]

{ #category : #arithmetic }
MalVector >> + aNumber [
	
	^aNumber sumFromVector: self
]

{ #category : #arithmetic }
MalVector >> += aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a + b]
]

{ #category : #arithmetic }
MalVector >> - aNumber [
	
	^aNumber differenceFromVector: self
]

{ #category : #arithmetic }
MalVector >> -= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a - b]
]

{ #category : #arithmetic }
MalVector >> / aNumber [
	
	^aNumber quotientFromVector: self
]

{ #category : #arithmetic }
MalVector >> /= aNumber [
	
	^self
		with: (self coerce: aNumber)
		affect: [:a :b | a / b]
]

{ #category : #comparing }
MalVector >> < aMagnitude [
	
	self error: 'Vectors are not ordered'
]

{ #category : #comparing }
MalVector >> = vector [
	
	^self == vector
		or:
			[(vector isKindOf: MalVector)
				and:
					[(vector hasSize: self size)
						and:
							[self
								with: vector
								do: [:a :b | a = b ifFalse: [^false]].
							true]]]
]

{ #category : #converting }
MalVector >> asVector [
	
	^self
]

{ #category : #accessing }
MalVector >> at: index [
	
	^self subclassResponsibility
]

{ #category : #arithmetic }
MalVector >> at: index add: aNumber [
	
	^self
		at: index
		put: (self at: index) + aNumber
]

{ #category : #accessing }
MalVector >> at: index ifNilPut: aBlock [
	"Answer the value at anIndex.  If the value is nil, set it to be
	the result of evaluating valueBlock, and answer that value."
	
	^(self at: index)
		ifNil:
			[self
				at: index
				put: aBlock value]
]

{ #category : #accessing }
MalVector >> at: index put: aNumber [
	
	^self subclassResponsibility
]

{ #category : #accessing }
MalVector >> atAllPut: collection [
	
	(collection isKindOf: Collection)
		
		ifTrue:
			[self
				with: collection
				affect: [:a :b | b]]
		ifFalse: [super atAllPut: collection]
]

{ #category : #coercing }
MalVector >> coerce: aNumber [
	
	^MalVectorCoercion with: aNumber
]

{ #category : #copying }
MalVector >> copyEmpty [
	
	^self copyEmpty: self size
]

{ #category : #copying }
MalVector >> copyEmpty: size [
	
	^self species new: size
]

{ #category : #'vector functions' }
MalVector >> cosine: aVector [
	
	^self unitVector dotProduct: aVector unitVector
]

{ #category : #copying }
MalVector >> deepCopy [
	
	^self species withAll: self
]

{ #category : #private }
MalVector >> defaultElement [
	
	^Float zero
]

{ #category : #'double dispatching' }
MalVector >> differenceFromDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> differenceFromFixedPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> differenceFromFloat: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> differenceFromFraction: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> differenceFromInteger: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> differenceFromNumber: aNumber [
	
	^self collect: [:b | aNumber - b]
]

{ #category : #'double dispatching' }
MalVector >> differenceFromPoint: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> differenceFromSmallDouble: aNumber [
	
	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> differenceFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a - b]
]

{ #category : #'vector functions' }
MalVector >> dist: aVector [
	
	| sum |
	sum := 0.
	self
		with: aVector
		do: [:a :b | sum := sum + ((a - b) ** 2)].
	^sum
]

{ #category : #enumerating }
MalVector >> do: aBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument."
	
	1
		to: self size
		do: [:index | aBlock value: (self at: index)]
]

{ #category : #enumerating }
MalVector >> doSparseWithIndex: aBlock [
	
	self
		doWithIndex:
			[:each :index | each isZero ifFalse: [aBlock value: each value: index]].
	^self
]

{ #category : #'double dispatching' }
MalVector >> doesNotUnderstand: aMessage [
	
	^super doesNotUnderstand: aMessage
]

{ #category : #'vector functions' }
MalVector >> dotProduct: aVector [
	"comment stating purpose of message"
	
	| sum |
	(aVector hasSize: self size) ifFalse: [^self noMatchError].
	sum := 0.
	self
		with: aVector
		do: [:a :b | sum := sum + (a * b)].
	^sum
]

{ #category : #coercing }
MalVector >> generality [
	
	^210
]

{ #category : #testing }
MalVector >> hasSize: size [
	
	^self size = size
]

{ #category : #comparing }
MalVector >> hash [
	
	^(self size hash bitXor: (self at: 1) hash)
		bitXor: (self at: self size) hash
]

{ #category : #'initialize-release' }
MalVector >> initializeSize: aSize [
	
	^self subclassResponsibility
]

{ #category : #testing }
MalVector >> isZero [
	"comment stating purpose of message"
	
	^self allSatisfy: #isZero
]

{ #category : #testing }
MalVector >> isZeroAt: index [
	
	^(self at: index) isZero
]

{ #category : #'vector functions' }
MalVector >> length [
	"comment stating purpose of message"
	
	^(self dotProduct: self) sqrt
]

{ #category : #arithmetic }
MalVector >> negated [
	"comment stating purpose of message"
	
	^self collect: #negated
]

{ #category : #private }
MalVector >> noModificationError [
	
	Error raise
]

{ #category : #'vector functions' }
MalVector >> normalize [
	"comment stating purpose of message"
	
	| len |
	len := self length.
	len isZero
		ifTrue: [self atAllPut: len]
		ifFalse: [self /= self length].
	^self
]

{ #category : #'double dispatching' }
MalVector >> productFromDouble: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MalVector >> productFromFixedPoint: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MalVector >> productFromFloat: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MalVector >> productFromFraction: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MalVector >> productFromInteger: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MalVector >> productFromNumber: aNumber [
	
	^self collect: [:b | aNumber * b]
]

{ #category : #'double dispatching' }
MalVector >> productFromPoint: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MalVector >> productFromSmallDouble: aVector [
	
	^self productFromNumber: aVector
]

{ #category : #'double dispatching' }
MalVector >> productFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a * b]
]

{ #category : #enumerating }
MalVector >> putWithIndex: aBlock [
	
	1
		to: self size
		do:
			[:index | 
			self
				at: index
				put: (aBlock value: index)]
]

{ #category : #'double dispatching' }
MalVector >> quotientFromDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> quotientFromFixedPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> quotientFromFloat: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> quotientFromFraction: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> quotientFromInteger: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> quotientFromNumber: aNumber [
	
	^self collect: [:b | aNumber / b]
]

{ #category : #'double dispatching' }
MalVector >> quotientFromPoint: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> quotientFromSmallDouble: aNumber [
	
	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> quotientFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a / b]
]

{ #category : #arithmetic }
MalVector >> reciprocal [
	"comment stating purpose of message"
	
	^self collect: #reciprocal
]

{ #category : #testing }
MalVector >> respondsToArithmetic [
	"We are arithmetic, yes."
	
	^true
]

{ #category : #accessing }
MalVector >> size [
	
	^self subclassResponsibility
]

{ #category : #accessing }
MalVector >> sparseSize [
	
	| tally |
	tally := 0.
	self doSparseWithIndex: [:each :index | tally := tally + 1].
	^tally
]

{ #category : #'mathematical functions' }
MalVector >> sqrt [
	
	^self collect: #sqrt
]

{ #category : #printing }
MalVector >> storeDenseTextOn: aStream [
	
	aStream
		print: self size;
		cr.
	self
		do: [:each | aStream print: each]
		separatedBy: [aStream space].
	aStream cr
]

{ #category : #'mathematical functions' }
MalVector >> sum [
	
	^self
		inject: 0
		into: [:sum :each | sum + each]
]

{ #category : #'double dispatching' }
MalVector >> sumFromDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> sumFromFixedPoint: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> sumFromFloat: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> sumFromFraction: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> sumFromInteger: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> sumFromNumber: aNumber [
	
	^self collect: [:b | aNumber + b]
]

{ #category : #'double dispatching' }
MalVector >> sumFromPoint: aNumber [
	
	^self collect: [:b | aNumber + b]
]

{ #category : #'double dispatching' }
MalVector >> sumFromSmallDouble: aNumber [
	
	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
MalVector >> sumFromVector: aVector [
	
	^aVector
		with: self
		collect: [:a :b | a + b]
]

{ #category : #'vector functions' }
MalVector >> unitVector [
	"comment stating purpose of message"
	
	self isZero ifTrue: [^self].
	^self / self length
]

{ #category : #enumerating }
MalVector >> with: vector affect: aBlock [
	
	(vector hasSize: self size) ifFalse: [^self noMatchError].
	1
		to: self size
		do:
			[:index | 
			self
				at: index
				put:
					(aBlock
						value: (self at: index)
						value: (vector at: index))].
	^self
]

{ #category : #enumerating }
MalVector >> with: vector collect: aBlock [
	
	| newVector |
	(vector hasSize: self size) ifFalse: [^self noMatchError].
	newVector := self species new: self size.
	1
		to: self size
		do:
			[:index | 
			newVector
				at: index
				put:
					(aBlock
						value: (self at: index)
						value: (vector at: index))].
	^newVector
]

{ #category : #enumerating }
MalVector >> with: vector do: aBlock [
	
	(vector hasSize: self size) ifFalse: [^self noMatchError].
	1
		to: self size
		do:
			[:index | 
			aBlock
				value: (self at: index)
				value: (vector at: index)].
	^self
]
