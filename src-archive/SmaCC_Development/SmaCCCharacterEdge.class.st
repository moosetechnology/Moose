"
SmaCCCharacterEdge is a SmaCCEdge for Characters.

"
Class {
	#name : #SmaCCCharacterEdge,
	#superclass : #SmaCCEdge,
	#instVars : [
		'codeSizeEstimate'
	],
	#category : #'SmaCC_Development'
}

{ #category : #comparing }
SmaCCCharacterEdge >> <= aSmaCCEdge [
	^ self class = aSmaCCEdge class
		and: [ self transitionObjects <= aSmaCCEdge transitionObjects ]
]

{ #category : #compiling }
SmaCCCharacterEdge >> codeSizeEstimate [
	^ codeSizeEstimate
		ifNil: [ | last size |
			size := 1.
			last := transitionObjects first asInteger - 1.
			transitionObjects
				do: [ :each | 
					each asInteger - 1 = last
						ifFalse: [ size := size + 1 ].
					last := each asInteger ].
			codeSizeEstimate := size * 8 + 4 ]
]

{ #category : #compiling }
SmaCCCharacterEdge >> dispatchTo: aSmaCCCodeGenerator seen: aCollection [
	^ aSmaCCCodeGenerator acceptCharacterEdge: self seen: aCollection
]

{ #category : #printing }
SmaCCCharacterEdge >> edgeLabel [
	^ transitionObjects asString
]

{ #category : #testing }
SmaCCCharacterEdge >> isCharacterTransition [
	^ true
]

{ #category : #merging }
SmaCCCharacterEdge >> mergeWith: aSmaCCEdge [
	transitionObjects := transitionObjects copy.
	transitionObjects addAll: aSmaCCEdge transitionObjects
]

{ #category : #private }
SmaCCCharacterEdge >> remove: aCollection [
	transitionObjects := transitionObjects copy.
	transitionObjects smaccRemoveAll: aCollection
]

{ #category : #accessing }
SmaCCCharacterEdge >> setClass [
	^ SmaCCCharacterSet
]

{ #category : #'initialize-release' }
SmaCCCharacterEdge >> to: aSmaCCNode on: aStringOrNil [
	toNode := aSmaCCNode.
	transitionObjects := aStringOrNil notNil
		ifTrue: [ SmaCCCharacterSet withAll: aStringOrNil ]
		ifFalse: [ nil ]
]
