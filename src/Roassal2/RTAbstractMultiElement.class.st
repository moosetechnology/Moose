Class {
	#name : #RTAbstractMultiElement,
	#superclass : #RTElement,
	#instVars : [
		'ownedElements',
		'layoutBuilder'
	],
	#category : #'Roassal2-Core'
}

{ #category : #adding }
RTAbstractMultiElement >> add: anElement [
	ownedElements add: anElement
]

{ #category : #adding }
RTAbstractMultiElement >> addAll: someElements [
	ownedElements addAll: someElements
]

{ #category : #adding }
RTAbstractMultiElement >> addFirst: anElement [
	ownedElements addFirst: anElement
]

{ #category : #rendering }
RTAbstractMultiElement >> addInteractions [
	"no interactions by default"
]

{ #category : #adding }
RTAbstractMultiElement >> addShape: aRTShape [
	"I don't support multiple base elements"

	self shouldNotImplement
]

{ #category : #adding }
RTAbstractMultiElement >> addedIn: aView [
	super addedIn: aView.
	ownedElements do: [ :c | c addedIn: aView ]
]

{ #category : #accessing }
RTAbstractMultiElement >> baseShape [
	^ self subclassResponsibility
]

{ #category : #'creating - subelements' }
RTAbstractMultiElement >> createOwnedElements [
	"subElements are optional"
]

{ #category : #initialization }
RTAbstractMultiElement >> initialize [
	super initialize.
	ownedElements := RTGroup new.
	shape := self baseShape.
	trachelShape := shape trachelShapeFor: self.
	self createOwnedElements
]

{ #category : #accessing }
RTAbstractMultiElement >> ownedElements [
	^ ownedElements
]

{ #category : #actions }
RTAbstractMultiElement >> remove [
	super remove.
	ownedElements do: #remove
]

{ #category : #rendering }
RTAbstractMultiElement >> renderOn: trachelCanvas [
	super renderOn: trachelCanvas.
	ownedElements
		do: [ :c | 
			c
				update;
				renderOn: trachelCanvas ].
	self addInteractions.
	self update.
	self trachelShape triggerCallbacksForStep: 0 @ 0
]

{ #category : #updating }
RTAbstractMultiElement >> show: anElement if: aConditionBlock [
	(anElement view isNil and: aConditionBlock)
		ifTrue: [ ownedElements add: anElement.
			self view add: anElement ].
	(anElement view isNotNil and: [ aConditionBlock value not ])
		ifTrue: [ ownedElements remove: anElement.
			anElement remove ]
]

{ #category : #updating }
RTAbstractMultiElement >> update [
	ownedElements do: #update.
	super update.
	self signalUpdate
]
