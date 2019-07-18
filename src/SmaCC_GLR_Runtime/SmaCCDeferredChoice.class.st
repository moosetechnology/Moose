"
SmaCCDeferredChoice represents a choice between multiple parses.

Instance Variables
	choiceBlock	<BlockClosure>	a two argument block that decides what choice should be chosen
	possibleItems	<SequenceableCollection of: Object>	the choices


"
Class {
	#name : #SmaCCDeferredChoice,
	#superclass : #Object,
	#instVars : [
		'possibleItems',
		'choiceBlock'
	],
	#category : #'SmaCC_GLR_Runtime'
}

{ #category : #private }
SmaCCDeferredChoice class >> isStack: firstStack preferredOver: secondStack [
	| firstPriority secondPriority |
	firstStack isEmpty
		ifTrue: [ ^ true ].
	firstPriority := self priorityOf: firstStack.
	secondPriority := self priorityOf: secondStack.
	firstPriority = secondPriority
		ifTrue: [ ^ self
				isStack: (self subItemsIn: firstStack withPriority: firstPriority)
				preferredOver: (self subItemsIn: secondStack withPriority: secondPriority) ].
	^ firstPriority < secondPriority
]

{ #category : #accessing }
SmaCCDeferredChoice class >> mergeStacks: stacksCollection [
	| result choiceBlock choices stacks |
	stacks := stacksCollection
		asSortedCollection: [ :a :b | self isStack: a preferredOver: b ].
	choices := 1 to: stacks size.
	choiceBlock := [ :possibleChoices :parser | 
	| returnValue newChoices |
	choices size == 1
		ifTrue: [ possibleChoices at: choices first ]
		ifFalse: [ returnValue := (SmaCCAmbiguousResultNotification forParser: parser)
				messageText: 'Ambiguous results';
				tag: (choices collect: [ :each | possibleChoices at: each ]);
				signal.
			newChoices := choices
				select: [ :each | (possibleChoices at: each) == returnValue ].
			newChoices notEmpty
				ifTrue: [ choices := newChoices ].
			returnValue ] ].
	result := OrderedCollection new.
	1 to: stacks first size do: [ :i | 
		| object |
		object := stacks first at: i.
		(stacks allSatisfy: [ :each | object == (each at: i) ])
			ifTrue: [ result add: object ]
			ifFalse: [ result
					add:
						(self new
							possibleItems: (stacks collect: [ :each | each at: i ]);
							choiceBlock: choiceBlock;
							yourself) ] ].
	^ result
]

{ #category : #private }
SmaCCDeferredChoice class >> priorityOf: aCollection [
	^ aCollection
		inject: SmallInteger maxVal
		into: [ :sum :each | 
			(each isKindOf: SmaCCDeferredReduceAction)
				ifTrue: [ sum min: each priority ]
				ifFalse: [ sum ] ]
]

{ #category : #private }
SmaCCDeferredChoice class >> subItemsIn: aCollection withPriority: anInteger [
	| result |
	result := OrderedCollection new.
	aCollection
		do: [ :each | 
			((each isKindOf: SmaCCDeferredReduceAction)
				and: [ each priority = anInteger ])
				ifTrue: [ result addAll: each arguments ] ].
	^ result
]

{ #category : #accessing }
SmaCCDeferredChoice >> choiceBlock: aBlock [
	choiceBlock := aBlock
]

{ #category : #accessing }
SmaCCDeferredChoice >> performOnSmaCCParser: aSmaCCParser [
	^ (choiceBlock value: possibleItems value: aSmaCCParser)
		performOnSmaCCParser: aSmaCCParser
]

{ #category : #accessing }
SmaCCDeferredChoice >> possibleItems [
	^ possibleItems
]

{ #category : #accessing }
SmaCCDeferredChoice >> possibleItems: aSequenceableCollection [
	possibleItems := aSequenceableCollection
]
