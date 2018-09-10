"
A parser that performs an action block with the successful parse result of the delegate.

Instance Variables:
	block	<BlockClosure>	The action block to be executed.

"
Class {
	#name : #PPActionParser,
	#superclass : #PPDelegateParser,
	#instVars : [
		'block'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'instance creation' }
PPActionParser class >> on: aParser block: aBlock [
	^ (self on: aParser) setBlock: aBlock
]

{ #category : #accessing }
PPActionParser >> block [
	"Answer the action block of the receiver."

	^ block
]

{ #category : #parsing }
PPActionParser >> parseOn: aPPContext [
	| element |
	^ (element := parser parseOn: aPPContext) isPetitFailure
		ifFalse: [ block value: element ]
		ifTrue: [ element ]
]

{ #category : #initialization }
PPActionParser >> setBlock: aBlock [
	block := aBlock
]
