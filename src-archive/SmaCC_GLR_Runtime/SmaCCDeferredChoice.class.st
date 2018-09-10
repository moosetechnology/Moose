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

{ #category : #accessing }
SmaCCDeferredChoice class >> mergeStacks: stacksOrderedCollection [
	| result choiceBlock choices |
	choices := 1 to: stacksOrderedCollection size.
	choiceBlock := [ :possibleChoices :parser | 
	| returnValue newChoices |
	choices size == 1
		ifTrue: [ possibleChoices at: choices first ]
		ifFalse:
			[ returnValue := (SmaCCAmbiguousResultNotification
				forParser: parser)
				messageText: 'Ambiguous results';
				tag: (choices collect: [ :each | possibleChoices at: each ]);
				signal.
			newChoices := choices
				select: [ :each | (possibleChoices at: each) == returnValue ].
			newChoices notEmpty
				ifTrue: [ choices := newChoices ].
			returnValue ] ].
	result := OrderedCollection new.
	1 to: stacksOrderedCollection first size do:
		[ :i | 
		| object |
		object := stacksOrderedCollection first at: i.
		(stacksOrderedCollection
			allSatisfy: [ :each | object == (each at: i) ])
			ifTrue: [ result add: object ]
			ifFalse:
				[ result
					add:
						(self new
							possibleItems: (stacksOrderedCollection collect: [ :each | each at: i ]);
							choiceBlock: choiceBlock;
							yourself) ] ].
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
