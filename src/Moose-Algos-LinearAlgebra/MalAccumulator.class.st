"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalAccumulator,
	#superclass : #Object,
	#instVars : [
		'accumulateBlock',
		'size',
		'value',
		'index'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalAccumulator class >> extreme [
	
	^self
		value: 0
		using:
			[:extreme :each | 
			extreme abs > each abs
				ifTrue: [extreme]
				ifFalse: [each]]
]

{ #category : #'instance creation' }
MalAccumulator class >> maximum [
	
	^self
		value: MalUnlimited negative
		using: [:max :each | max max: each]
]

{ #category : #'instance creation' }
MalAccumulator class >> minimum [
	
	^self
		value: MalUnlimited positive
		using: [:min :each | min min: each]
]

{ #category : #'instance creation' }
MalAccumulator class >> new [
	
	self shouldNotImplement
]

{ #category : #'instance creation' }
MalAccumulator class >> squaredSum [
	
	^self
		value: 0
		using: [:sum :each | sum + each squared]
]

{ #category : #'instance creation' }
MalAccumulator class >> sum [
	
	^self
		value: 0
		using: [:sum :each | sum + each]
]

{ #category : #'instance creation' }
MalAccumulator class >> using: anAccumulationBlock [
	
	^self
		value: Number zero
		using: anAccumulationBlock
]

{ #category : #'instance creation' }
MalAccumulator class >> value: initialValue using: anAccumulationBlock [
	
	^(self basicNew)
		setAccumulateBlock: anAccumulationBlock;
		resetValue: initialValue;
		yourself
]

{ #category : #accumulate }
MalAccumulator >> accumulate: aValue [
	
	size := size + 1.
	^value := accumulateBlock value: value value: aValue
]

{ #category : #accumulate }
MalAccumulator >> accumulate: aValue withIndex: anIndex [
	
	size := size + 1.
	^(value = (value := accumulateBlock value: value value: aValue))
		ifFalse: [index := anIndex]
]

{ #category : #accumulate }
MalAccumulator >> add: aValue [
	
	^self accumulate: aValue
]

{ #category : #accessing }
MalAccumulator >> average [
	
	^value / size
]

{ #category : #accumulate }
MalAccumulator >> enumerate: aCollection [
	
	aCollection do: [:each | self accumulate: each].
	^value
]

{ #category : #accumulate }
MalAccumulator >> enumerate: aCollection atAll: indices [
	
	indices do: [:key | self accumulate: (aCollection at: key)].
	^value
]

{ #category : #accumulate }
MalAccumulator >> enumerate: aMatrix atAll: rowIndices andAll: columnIndices [
	
	rowIndices
		do:
			[:row | 
			columnIndices
				do: [:column | self accumulate: (aMatrix at: row and: column)]].
	^value
]

{ #category : #accumulate }
MalAccumulator >> enumerateWithIndex: aSequencableCollection [
	
	aSequencableCollection
		doWithIndex: [:each :index0 | self accumulate: each withIndex: index0].
	^value
]

{ #category : #accumulate }
MalAccumulator >> from: start to: end do: aBlock [
	
	start
		to: end
		do: [:each | self accumulate: (aBlock value: each)].
	^value
]

{ #category : #accessing }
MalAccumulator >> index [
	
	^index
]

{ #category : #'initialize-release' }
MalAccumulator >> merge: anAccumulator [
	
	size := size + anAccumulator size.
	^self
		accumulate: anAccumulator value
		withIndex: anAccumulator index
]

{ #category : #printing }
MalAccumulator >> printOn: stream [
	
	| method |
	method := accumulateBlock method outerMethod.
	stream
		nextPutAll:
				(method mclass == MalAccumulator class
						ifTrue: [method selector]
						ifFalse: ['custom']);
		space;
		nextPut: $=;
		space;
		print: value
]

{ #category : #'initialize-release' }
MalAccumulator >> resetValue: aValue [
	
	size := 0.
	index := nil.
	value := aValue
]

{ #category : #'initialize-release' }
MalAccumulator >> setAccumulateBlock: aBlock [
	
	accumulateBlock := aBlock
]

{ #category : #'initialize-release' }
MalAccumulator >> setValue: aValue [
	
	size := 0.
	^value := value
]

{ #category : #accessing }
MalAccumulator >> size [
	
	^size
]

{ #category : #accumulate }
MalAccumulator >> upTo: end do: aBlock [
	
	^self from: 1 to: end do: aBlock
]

{ #category : #accessing }
MalAccumulator >> value [
	
	^value
]
