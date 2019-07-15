"
A RTTextBuilder parses a text and displays it on a RTView.

It uses textTokenizer for splitting text into lines and lines into words. For each word an RTElement is created. It allows to have different shape or/and interaction on each word. User can define how to split text by implementing a textTokenizer; by default RTTextTokenizer. 

All the RTElements representing words are nested to a main RTElement object with padding.

On each word, wordShapeBuilder and wordInteractionBuilder are applied. 

Before applying shape and interaction builders on any RTElement object, hook for main element and wordHook for wor elements are called. It allows to make extra customization for each element.

Instance Variables
	hook:						<BlockClosure>
	padding:					<Integer>
	textTokenizer:				<RTTextTokenizer>
	wordHook:					<BlockClosure>
	wordInteractionBuilder:		<RTInteractionBuilder>
	wordShapeBuilder:			<RTShapeBuilder>

hook
	- is one-orgument-block which receives a main RTElement object; the RTElement object nests all the other objects for a displayed text. It is called before any element initialization. 

padding
	- number of pixes between main RTElement object and nested text.

textTokenizer
	- is responsible for splitting a text into lines and lines into words.

wordHook
	- is two-argument-block which receives a word element and interval of a word in the original text

wordInteractionBuilder
	- interaction builder applied on each word element

wordShapeBuilder
	- shape builder applied on each word element

"
Class {
	#name : #RTTextBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'hook',
		'wordHook',
		'wordInteractionBuilder',
		'wordShapeBuilder',
		'padding',
		'textTokenizer'
	],
	#category : #'Roassal2-Builder-TextBuilder'
}

{ #category : #protocol }
RTTextBuilder >> addText: aText [
	^ self buildText: aText.
]

{ #category : #protocol }
RTTextBuilder >> addText: aText model: anObject [
	^ self buildText: aText model: anObject.
]

{ #category : #protocol }
RTTextBuilder >> buildText: aText [
	^ self buildText: aText model: aText.
]

{ #category : #protocol }
RTTextBuilder >> buildText: aString in: element [
	| tokenizedString elements lines |
	tokenizedString := textTokenizer tokenize: aString.
	lines := RTGroup new.
	elements := RTGroup new.
	tokenizedString linesDo: [ :eachLine | 
		| line |
		line := RTGroup new.
		eachLine wordsDo: [ :eachWord | | wordElement |
			wordElement := RTElement on: eachWord text.
			wordHook cull: wordElement cull: eachWord interval.
			wordShapeBuilder setUpElements: wordElement.
			wordInteractionBuilder setUpElements: wordElement.
			line add: wordElement.
			elements add: wordElement.
			view add: wordElement ].
		RTHorizontalLineLayout new gapSize: 0; on: line.
		lines add: line ].
	RTVerticalLineLayout new gapSize: 0; on: lines.
	RTNest new padding: padding; on: element nest: elements.
	element attributeAt: self nestedElementsAttribute put: elements.
	^ elements
]

{ #category : #protocol }
RTTextBuilder >> buildText: aText model: anObject [
	| el |
	el := RTElement on: anObject.
	hook value: el.
	shapeBuilder setUpElements: el.
	interactionBuilder setUpElements: el.
	view add: el.
	self buildText: aText in: el.
	^ el
]

{ #category : #initialization }
RTTextBuilder >> defaultTokenizer [
	^ RTTextTokenizer new
]

{ #category : #accessing }
RTTextBuilder >> hook: aOneArgBlock [
	hook := aOneArgBlock
]

{ #category : #initialization }
RTTextBuilder >> initialize [
	super initialize.
	textTokenizer := self defaultTokenizer.
	wordShapeBuilder := RTShapeBuilder new.
	wordShapeBuilder text.
	wordInteractionBuilder := RTInteractionBuilder new.
	wordHook := [ :anElement :anInterval | nil ].
	hook := [ :anElement | nil ].
	padding := 5
]

{ #category : #accessing }
RTTextBuilder >> padding [
	^ padding
]

{ #category : #accessing }
RTTextBuilder >> padding: aNumber [
	padding := aNumber
]

{ #category : #hooks }
RTTextBuilder >> renderIn: aView [
	
]

{ #category : #accessing }
RTTextBuilder >> wordHook: aTwoArgBlock [

	wordHook := aTwoArgBlock
]

{ #category : #accessing }
RTTextBuilder >> wordInteraction [
	^ wordInteractionBuilder
]

{ #category : #accessing }
RTTextBuilder >> wordShape [
	^ wordShapeBuilder
]
