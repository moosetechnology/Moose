Class {
	#name : #RTLayoutTranslator,
	#superclass : #RTObject,
	#instVars : [
		'view'
	],
	#classInstVars : [
		'defaultTranslator'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #accessing }
RTLayoutTranslator class >> default [
	"Return the default translator, the one used in the layouts"

	defaultTranslator ifNotNil: [ ^ defaultTranslator ].
	^ defaultTranslator := self defaultClass new
]

{ #category : #accessing }
RTLayoutTranslator class >> defaultClass [
	^ self allSubclasses detect: #isDefault
]

{ #category : #'as yet unclassified' }
RTLayoutTranslator class >> isDefault [
	^ false
]

{ #category : #accessing }
RTLayoutTranslator >> nbCycles: anInteger [
	"Do nothing"
]

{ #category : #hook }
RTLayoutTranslator >> translate: element by: deltaPosition [
	"Translate of the center of the element by a step"
	self translate: element to: element position + deltaPosition
]

{ #category : #hook }
RTLayoutTranslator >> translate: element to: newPosition [
	"Translate of the center of the element"
	self subclassResponsibility 
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translate: element to: newPosition direction: aDirection [
	"Translate the bottom left corner of the element"

	self translate: element to: newPosition + (element extent / 2 * aDirection)
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translateBottomLeftOf: element to: newPosition [
	"Translate the bottom left corner of the element"

	self translate: element to: newPosition direction: 1 @ -1.
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translateBottomOf: element to: newPosition [
	"Translate the bottom side of the element"

	self translate: element to: element position x @ newPosition direction: 0 @ -1
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translateBottomRightOf: element to: newPosition [
	"Translate the bottom right corner of the element"

	self translate: element to: newPosition direction: -1 @ -1
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translateCenterLeftOf: element to: newPosition [
	"Translate the left center of the element to newPosition"

	self translate: element to: newPosition direction: 1 @ 0
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translateLeftOf: element to: newPosition [
	"Translate the left side of the element"

	self translate: element to: newPosition @ element position y direction: 1 @ 0.
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translateRightOf: element to: newPosition [
	"Translate the right side of the element"

	self translate: element to: newPosition @ element position y direction: -1 @ 0.
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translateTopLeftOf: element to: newPosition [
	"Translate the top right corner of the element"

	self translate: element to: newPosition direction: 1 @ 1
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translateTopOf: element to: newPosition [
	"Translate the top side of the element"

	self translate: element to: element position x @ newPosition direction: 0 @ 1.
]

{ #category : #'public - translating' }
RTLayoutTranslator >> translateTopRightOf: element to: newPosition [
	"Translate the top right corner of the element"

	self translate: element to: newPosition direction: -1 @ 1
]

{ #category : #accessing }
RTLayoutTranslator >> view [
	^ view
]

{ #category : #accessing }
RTLayoutTranslator >> view: aView [
	view := aView
]
