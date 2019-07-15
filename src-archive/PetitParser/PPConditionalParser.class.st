"
A PPConditionalParser is a delegate parser that evaluates a block and if that returns true, the delegate parser is invoked and its result returned. If the block evaluates to false, the PPFailure is returned.

The block accepts one argument, context.

E.g.
    ('a' asParser if: [ :ctx | (ctx propertyAt: #myProperty) isNotNil ]) parse: 'a'
"
Class {
	#name : #PPConditionalParser,
	#superclass : #PPDelegateParser,
	#instVars : [
		'block'
	],
	#category : #'PetitParser-Parsers'
}

{ #category : #'as yet unclassified' }
PPConditionalParser class >> on: aPPParser block: block [
	^ (PPConditionalParser on: aPPParser)
		block: block;
		yourself
]

{ #category : #accessing }
PPConditionalParser >> block: aBlock [
	block := aBlock
]

{ #category : #parsing }
PPConditionalParser >> parseOn: aPPContext [
	^ (block value: aPPContext) 
		ifTrue: [ parser parseOn: aPPContext ]
		ifFalse: [ PPFailure message: block asString, ' was not evaluated to true.' context: aPPContext ]
]
