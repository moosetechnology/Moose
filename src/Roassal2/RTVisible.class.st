"
A RTVisible is an interaction for element. It allows one to define behavior when an element become visible or visible. 

The interaction has to be used after having added the element to a view.

Instance Variables
	invisibleBlock:		<Object>
	visibleBlock:		<Object>

invisibleBlock
	- xxxxx

visibleBlock
	- xxxxx

"
Class {
	#name : #RTVisible,
	#superclass : #RTInteraction,
	#instVars : [
		'visibleBlock',
		'invisibleBlock'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #utility }
RTVisible >> doInvisibleBlockOn: element [
	invisibleBlock rtValue: element
]

{ #category : #utility }
RTVisible >> doUpdate: element [
	| isVisible |
	isVisible := element trachelShape isVisible.
	isVisible ~= (element attributeAt: #isVisible)
		ifTrue: [ 
			isVisible
				ifTrue: [ self doVisibleBlockOn: element ]
				ifFalse: [ self doInvisibleBlockOn: element ].
			element attributeAt: #isVisible put: isVisible ].
	
]

{ #category : #utility }
RTVisible >> doVisibleBlockOn: element [
	visibleBlock rtValue: element
]

{ #category : #initialization }
RTVisible >> initialize [
	super initialize.
	visibleBlock := [ :anElement | "do nothing " ].
	invisibleBlock := [ :anElement | "do nothing " ].
]

{ #category : #hooks }
RTVisible >> initializeElement: element [
	| c |
	self prepareElement: element.
	self doUpdate: element.
	
	c := TRTranslationCallback new.
	c block: [ :aShape :aStep | self doUpdate: element ].
	element trachelShape addCallback: c.
	element view canvas camera addCallback: c.
]

{ #category : #accessing }
RTVisible >> invisibleBlock [
	^ invisibleBlock
]

{ #category : #accessing }
RTVisible >> invisibleBlock: aOneArgBlock [
	"The block is evaluated against the element"
	invisibleBlock := aOneArgBlock
]

{ #category : #utility }
RTVisible >> prepareElement: element [
	element attributeAt: #isVisible put: nil
]

{ #category : #accessing }
RTVisible >> visibleBlock [
	^ visibleBlock
]

{ #category : #accessing }
RTVisible >> visibleBlock: aOneArgBlock [
	"The block is evaluated against the element"
	visibleBlock := aOneArgBlock
]
