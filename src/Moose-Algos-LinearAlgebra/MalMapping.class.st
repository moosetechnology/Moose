"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalMapping,
	#superclass : #Collection,
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #adding }
MalMapping >> add: newObject [
	
	self subclassResponsibility
]

{ #category : #accessing }
MalMapping >> at: name [
	
	^self atKey: (self keyForName: name)
]

{ #category : #accessing }
MalMapping >> at: name ifAbsent: exceptionBlock [
	
	^self
		atKey: (self keyForName: name ifAbsent: exceptionBlock)
		ifAbsent: exceptionBlock
]

{ #category : #accessing }
MalMapping >> at: name ifPresent: unaryBlock [
	
	^unaryBlock
		value:
			(self
				at: name
				ifAbsent: [^self])
]

{ #category : #'accessing - key' }
MalMapping >> atKey: key [
	
	^self
		atKey: key
		ifAbsent: [self error: 'key not found']
]

{ #category : #'accessing - key' }
MalMapping >> atKey: aKey ifAbsent: exceptionBlock [
	
	^self subclassResponsibility
]

{ #category : #application }
MalMapping >> convertCollection: aSequencableCollection [
	
	| collection |
	collection := aSequencableCollection species new.
	self do: [:index | collection add: (aSequencableCollection at: index)].
	^collection
]

{ #category : #application }
MalMapping >> convertMatrixColumnwise: aMatrix [
	
	^aMatrix species withMatrix: (MalMappedMatrix on: aMatrix columnMap: self)
]

{ #category : #application }
MalMapping >> convertMatrixRowwise: aMatrix [
	
	^aMatrix species withAll: (MalMappedMatrix on: aMatrix rowMap: self)
]

{ #category : #application }
MalMapping >> convertSquareMatrix: aMatrix [
	
	^aMatrix species withMatrix: (MalMappedMatrix on: aMatrix map: self)
]

{ #category : #converting }
MalMapping >> derive: aBlock [
	
	| derivate |
	derivate := MalSmartMapping new.
	derivate setParent: self.
	self do: [:index | (aBlock value: index) ifTrue: [derivate add: index]].
	^derivate
]

{ #category : #converting }
MalMapping >> deriveWithNames: names [
	
	| derivate |
	derivate := MalSmartMapping new.
	derivate setParent: self.
	names do: [:name | derivate add: (self keyForName: name)].
	^derivate
]

{ #category : #enumerating }
MalMapping >> do: aBlock [
	
	self subclassResponsibility
]

{ #category : #testing }
MalMapping >> includesIndex: index [
	
	self
		keyOf: index
		ifAbsent: [^false].
	^true
]

{ #category : #testing }
MalMapping >> includesKey: key [
	
	self
		atKey: key
		ifAbsent: [^false].
	^true
]

{ #category : #testing }
MalMapping >> includesName: name [
	
	self
		at: name
		ifAbsent: [^false].
	^true
]

{ #category : #'accessing - name' }
MalMapping >> keyForName: name [
	
	^self
		keyForName: name
		ifAbsent: [self error: 'key not found']
]

{ #category : #'accessing - name' }
MalMapping >> keyForName: name ifAbsent: exceptionBlock [
	
	^self subclassResponsibility
]

{ #category : #'accessing - key' }
MalMapping >> keyOf: index [
	
	^self
		keyOf: index
		ifAbsent: [self error: 'value not found']
]

{ #category : #'accessing - key' }
MalMapping >> keyOf: anIndex ifAbsent: exceptionBlock [
	
	^self subclassResponsibility
]

{ #category : #'accessing - key' }
MalMapping >> keys [
	
	^self subclassResponsibility
]

{ #category : #'accessing - name' }
MalMapping >> nameForKey: key [
	
	^self subclassResponsibility
]

{ #category : #'accessing - name' }
MalMapping >> nameOf: index [
	
	^self nameForKey: (self keyOf: index)
]

{ #category : #'accessing - name' }
MalMapping >> nameOf: index ifAbsent: exceptionBlock [
	
	^self nameForKey: (self keyOf: index ifAbsent: exceptionBlock)
]

{ #category : #'accessing - name' }
MalMapping >> names [
	
	^self keys collect: [:key | self nameForKey: key]
]

{ #category : #removing }
MalMapping >> remove: oldObject ifAbsent: anExceptionBlock [
	
	self shouldNotImplement
]

{ #category : #accessing }
MalMapping >> size [
	
	^self subclassResponsibility
]

{ #category : #converting }
MalMapping >> with: aCollection derive: aBlock [
	
	^self derive: [:index | aBlock value: (aCollection at: index)]
]
