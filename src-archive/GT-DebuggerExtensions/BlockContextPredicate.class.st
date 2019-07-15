"
I encapsulate a condition that can be verified against a MethodContext as a block.
The block can have at least one parameter, representing the context that should be verified and 
should return a boolean value.

"
Class {
	#name : #BlockContextPredicate,
	#superclass : #GTDebuggerContextPredicate,
	#instVars : [
		'blockCondition'
	],
	#category : #'GT-DebuggerExtensions'
}

{ #category : #'instance creation' }
BlockContextPredicate class >> for: aBlock [

	^ self new for: aBlock
]

{ #category : #'instance creation' }
BlockContextPredicate >> for: aBlock [

	blockCondition := aBlock
]

{ #category : #testing }
BlockContextPredicate >> matchContext: aContext [

	^ blockCondition isNil 
		ifFalse: [ blockCondition cull: aContext ] 
		ifTrue: [ false ]
]
