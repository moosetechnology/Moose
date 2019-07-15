"
A ROAbstractLineLayout is the abstract superclass of the line layout.

Instance Variables
	alignment:		<Object>
	gapSize:		<Object>
	horizontalGap:		<Object>
	horizontalOutGap:		<Object>
	horizontallyStretchable:		<Object>
	verticalGap:		<Object>
	verticalOutGap:		<Object>
	verticallyStretchable:		<Object>

alignment
	- xxxxx

gapSize
	- xxxxx

horizontalGap
	- xxxxx

horizontalOutGap
	- xxxxx

horizontallyStretchable
	- xxxxx

verticalGap
	- xxxxx

verticalOutGap
	- xxxxx

verticallyStretchable
	- xxxxx

"
Class {
	#name : #RTAbstractLineLayout,
	#superclass : #RTLayout,
	#instVars : [
		'gapSize',
		'horizontalGap',
		'verticalGap',
		'horizontalOutGap',
		'verticalOutGap',
		'alignment',
		'horizontallyStretchable',
		'verticallyStretchable'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #testing }
RTAbstractLineLayout class >> isAbstract [
	^ self name = #RTAbstractLineLayout
]

{ #category : #'instance creation' }
RTAbstractLineLayout class >> withGap: anInteger [
	
	^(self new)
		gapSize: anInteger;
		yourself
]

{ #category : #accessing }
RTAbstractLineLayout >> alignBottom [
	
	alignment := #bottom
]

{ #category : #accessing }
RTAbstractLineLayout >> alignCenter [
	"Make the element centered"
	alignment := #center
]

{ #category : #accessing }
RTAbstractLineLayout >> alignLeft [
	
	alignment := #left
]

{ #category : #accessing }
RTAbstractLineLayout >> alignRight [
	
	alignment := #right
]

{ #category : #accessing }
RTAbstractLineLayout >> alignTop [
	
	alignment := #top
]

{ #category : #accessing }
RTAbstractLineLayout >> alignment [
	
	^alignment
]

{ #category : #accessing }
RTAbstractLineLayout >> alignment: anObject [
	
	alignment := anObject
]

{ #category : #configuration }
RTAbstractLineLayout >> center [
	self alignment: #center
]

{ #category : #hook }
RTAbstractLineLayout >> deltaFor: aNodeFigure [
	
	^self subclassResponsibility
]

{ #category : #hook }
RTAbstractLineLayout >> doCenter: aGraph [
	self subclassResponsibility 
]

{ #category : #hook }
RTAbstractLineLayout >> doExecute: elements [ 
	| pointer delta |
	horizontallyStretchable ifTrue: 
		[ self doStretchHorizontal: elements ].
	verticallyStretchable ifTrue: 
		[ self doStretchVertical: elements ].
	pointer := self positionOriginalPointer: elements.

	elements do: 
		[ :element |
		delta := self deltaFor: element.
		translator translateTopLeftOf: element to: pointer - delta.
		pointer := self 
					movePointer: pointer
					accordingToFigure: element.
		self step ].
]

{ #category : #hook }
RTAbstractLineLayout >> doStretchHorizontal: aCollectionOfElements [ 

	self subclassResponsibility
]

{ #category : #hook }
RTAbstractLineLayout >> doStretchVertical: aCollectionOfElements [ 

	self subclassResponsibility
]

{ #category : #accessing }
RTAbstractLineLayout >> gapSize [
	
	^gapSize
]

{ #category : #accessing }
RTAbstractLineLayout >> gapSize: aNumber [
	gapSize := aNumber. " This value is never used actually "
	
	verticalGap := 2 * aNumber.
	horizontalGap := 2 * aNumber
]

{ #category : #accessing }
RTAbstractLineLayout >> horizontalGap [
	
	^horizontalGap
]

{ #category : #accessing }
RTAbstractLineLayout >> horizontalGap: anInteger [
	
	horizontalGap := anInteger
]

{ #category : #testing }
RTAbstractLineLayout >> horizontallyStretchable [
	^ horizontallyStretchable
]

{ #category : #'initialize-release' }
RTAbstractLineLayout >> initialize [
	
	super initialize.
	verticalGap := 10.
	horizontalGap := 10.
	horizontallyStretchable := false.
	verticallyStretchable := false
]

{ #category : #hook }
RTAbstractLineLayout >> movePointer: pointer accordingToFigure: aNodeFigure [
	
	self subclassResponsibility
]

{ #category : #hook }
RTAbstractLineLayout >> positionOriginalPointer: aGraph [
	
	^self subclassResponsibility
]

{ #category : #configuration }
RTAbstractLineLayout >> stretch [
	horizontallyStretchable := verticallyStretchable := true
]

{ #category : #configuration }
RTAbstractLineLayout >> stretchHorizontally [
	horizontallyStretchable := true
]

{ #category : #configuration }
RTAbstractLineLayout >> stretchVertically [
	verticallyStretchable := true
]

{ #category : #accessing }
RTAbstractLineLayout >> verticalGap [
	
	^verticalGap
]

{ #category : #accessing }
RTAbstractLineLayout >> verticalGap: anInteger [
	
	verticalGap := anInteger
]

{ #category : #testing }
RTAbstractLineLayout >> verticallyStretchable [
	^ verticallyStretchable
]
