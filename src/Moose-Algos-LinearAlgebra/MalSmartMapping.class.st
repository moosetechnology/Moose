"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MalSmartMapping,
	#superclass : #MalNumberMapping,
	#instVars : [
		'parent'
	],
	#category : #'Moose-Algos-LinearAlgebra'
}

{ #category : #'instance creation' }
MalSmartMapping class >> on: parent [
	
	^(self new)
		setParent: parent;
		yourself
]

{ #category : #'initialize-release' }
MalSmartMapping >> isRoot [
	
	^parent isNil
]

{ #category : #'accessing - name' }
MalSmartMapping >> keyForName: name ifAbsent: exceptionBlock [
	
	^name isInteger
		ifTrue: [name]
		ifFalse:
			[self isRoot
				ifTrue: [exceptionBlock value]
				ifFalse:
					[self keyOf: (parent keyForName: name ifAbsent: exceptionBlock)]]
]

{ #category : #'accessing - name' }
MalSmartMapping >> nameForKey: key [
	
	^self isRoot
		ifTrue: [self error: 'key not found']
		ifFalse: [parent nameForKey: (self atKey: key)]
]

{ #category : #'initialize-release' }
MalSmartMapping >> setParent: mapping [
	
	^parent := mapping
]
