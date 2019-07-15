"
I am the superclass of the class hierarchy describing attach points. An attach point indicates where lines start and end. 
"
Class {
	#name : #RTAttachPoint,
	#superclass : #RTObject,
	#instVars : [
		'inverted'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Roassal2-AttachPoint'
}

{ #category : #public }
RTAttachPoint class >> instance [
	instance ifNil: [ instance := self new ].
	^ instance
]

{ #category : #public }
RTAttachPoint class >> on: elementOrElements [
	| els temp |
	els := elementOrElements.
	els isCollection 
		ifFalse: [ els := Array with: els ].
	temp := self setAttachPoint: els.
	els do: #updateConnectedEdges.
	^ temp
]

{ #category : #public }
RTAttachPoint class >> on: elementOrElements thenDo: aBlock [
	| els temp |
	els := elementOrElements.
	els isCollection 
		ifFalse: [ els := Array with: els ].
	temp := self setAttachPoint: els.
	aBlock value: temp.
	els do: #updateConnectedEdges.
	^ temp
]

{ #category : #public }
RTAttachPoint class >> resetInstance [
	instance := nil
]

{ #category : #public }
RTAttachPoint class >> setAttachPoint: els [
	| temp shapes |
	temp := self new.
	shapes := els flatCollectAsSet: [ :e | 
		e connectedEdges collect: [ :ed | ed shape ] ].
	shapes do: [ :s |
		s attachPoint: temp ].
	^ temp
]

{ #category : #'public - hooks' }
RTAttachPoint >> basicEndingPointOf: anEdge [
	self subclassResponsibility 
]

{ #category : #'public - hooks' }
RTAttachPoint >> basicStartingPointOf: anEdge [
	self subclassResponsibility 
]

{ #category : #'public - hooks' }
RTAttachPoint >> endingPointOf: anEdge [
	(anEdge from = anEdge to) 
		ifTrue: [ ^ anEdge from encompassingRectangle topCenter ].
    ^ inverted
        ifTrue: [ self basicStartingPointOf: anEdge ]
        ifFalse: [ self basicEndingPointOf: anEdge ]
]

{ #category : #initialization }
RTAttachPoint >> initialize [
	super initialize.
	inverted := false.
]

{ #category : #'public - hooks' }
RTAttachPoint >> inverted [
	"Swap the starting and ending points"

	inverted := inverted not
]

{ #category : #'public - hooks' }
RTAttachPoint >> inverted: aBool [
	"Set if the attachpoint should be inverted"

	inverted := aBool
]

{ #category : #testing }
RTAttachPoint >> isInverted [
	"Return wether the attach point is inverted"
	^ inverted
]

{ #category : #'public - hooks' }
RTAttachPoint >> startingPointOf: anEdge [
	(anEdge from = anEdge to) 
		ifTrue: [ ^ anEdge from encompassingRectangle rightCenter ].
    ^ inverted
        ifTrue: [ self basicEndingPointOf: anEdge ]
        ifFalse: [ self basicStartingPointOf: anEdge ]

]
