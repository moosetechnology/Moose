Class {
	#name : #RTAbstractElementHandling,
	#superclass : #RTObject,
	#instVars : [
		'elements',
		'fixedElement'
	],
	#category : #'Roassal2-Core'
}

{ #category : #accessing }
RTAbstractElementHandling >> elements [
	^ elements
]

{ #category : #accessing }
RTAbstractElementHandling >> elements: someElements [
	elements := someElements asGroup
]

{ #category : #accessing }
RTAbstractElementHandling >> fixedElement [
	^ fixedElement
]

{ #category : #accessing }
RTAbstractElementHandling >> fixedElement: anElement [
	"Designate a particular element for which all the other will be aligned against"
	fixedElement := anElement
]

{ #category : #'private - configuration' }
RTAbstractElementHandling >> ifNoFixedElementThen: aBlock [
	fixedElement ifNil: [ aBlock value  ]
]
