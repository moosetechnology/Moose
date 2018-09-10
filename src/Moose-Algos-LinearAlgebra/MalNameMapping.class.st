"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalNameMapping,
	#superclass : #MalMapping,
	#instVars : [
		'names',
		'comparisonBlock'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalNameMapping class >> new [

	^(super new)
		initialize;
		forEquality;
		yourself
]

{ #category : #'instance creation' }
MalNameMapping class >> newUsing: aComparisonBlock [
	
	^(super new)
		initialize;
		setComparisonBlock: aComparisonBlock;
		yourself
]

{ #category : #adding }
MalNameMapping >> add: name [
	
	(self includesName: name) ifTrue: [Error raise].
	names addLast: name.
	^self size
]

{ #category : #accessing }
MalNameMapping >> atKey: key ifAbsent: exceptionBlock [
	
	^(key
		between: 1
		and: self size)
		ifTrue: [key]
		ifFalse: [exceptionBlock value]
]

{ #category : #enumerating }
MalNameMapping >> do: aBlock [
	
	1
		to: self size
		do: [:each | aBlock value: each]
]

{ #category : #'initialize-release' }
MalNameMapping >> forEquality [
	
	self setComparisonBlock: [:a :b | a = b]
]

{ #category : #'initialize-release' }
MalNameMapping >> forIdentity [
	
	self setComparisonBlock: [:a :b | a == b]
]

{ #category : #testing }
MalNameMapping >> includesName: name [
	
	^names contains: [:each | comparisonBlock value: each value: name]
]

{ #category : #'initialize-release' }
MalNameMapping >> initialize [
	
	names := OrderedCollection new
]

{ #category : #'accessing - name' }
MalNameMapping >> keyForName: name ifAbsent: exceptionBlock [
	^ name isInteger
		ifTrue: [ name ]
		ifFalse: [ | idx |
			idx := names findFirst: [ :each | comparisonBlock value: name value: each ].
			idx isZero
				ifTrue: [ exceptionBlock value ].
			^ idx ]
]

{ #category : #accessing }
MalNameMapping >> keyOf: anIndex ifAbsent: exceptionBlock [
	
	^self atKey: anIndex ifAbsent: exceptionBlock
]

{ #category : #'accessing - name' }
MalNameMapping >> keys [
	
	^names
]

{ #category : #'accessing - name' }
MalNameMapping >> nameForKey: key [
	
	^names at: key
]

{ #category : #'accessing - name' }
MalNameMapping >> names [
	
	^names
]

{ #category : #'initialize-release' }
MalNameMapping >> setComparisonBlock: aComparisonBlock [
	
	^comparisonBlock := aComparisonBlock
]

{ #category : #accessing }
MalNameMapping >> size [
	
	^names size
]
