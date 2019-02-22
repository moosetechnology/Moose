"
A RTAbstractFlowLayout is a layout based on the size in pixels of elements.

Instance Variables
	alignment:		<Object>
	gapSize:		<Object>
	maxWidth:		<Object>

alignment
	- xxxxx

gapSize
	- xxxxx

maxWidth
	- xxxxx

"
Class {
	#name : #RTAbstractFlowLayout,
	#superclass : #RTLayout,
	#instVars : [
		'maxWidth',
		'gapSize',
		'alignment'
	],
	#classInstVars : [
		'aBlock',
		'maxWithBlock'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #public }
RTAbstractFlowLayout class >> isAbstract [
	^ self name = #RTAbstractFlowLayout
]

{ #category : #'instance creation' }
RTAbstractFlowLayout class >> withMaxWidth: anInteger [
	
	^(self new)
		maxWidth: anInteger;
		yourself
]

{ #category : #'instance creation' }
RTAbstractFlowLayout class >> withMaxWidth: anInteger withGap: anotherInteger [
	
	^(self new)
		maxWidth: anInteger;
		gapSize: anotherInteger;
		yourself
]

{ #category : #alignment }
RTAbstractFlowLayout >> alignBottom [
	alignment := #bottom
]

{ #category : #alignment }
RTAbstractFlowLayout >> alignCenter [
	alignment := #center
]

{ #category : #alignment }
RTAbstractFlowLayout >> alignTop [
	alignment := #top
]

{ #category : #configuration }
RTAbstractFlowLayout >> defaultGapSize [
 ^ 5
]

{ #category : #configuration }
RTAbstractFlowLayout >> defaultMaxWidth [
	
	^ [ :elements | 
		(elements size < 4) ifTrue: [ (((elements collect: [ :each | each width * each height]) * 2) sum ) + (elements size * (gapSize squared)) ]
			ifFalse: [
			((((elements collect: [ :each | each width * each height]) * 2) sum) + (elements size * (gapSize squared))) sqrt ceiling truncated.
			]
		]
]

{ #category : #accessing }
RTAbstractFlowLayout >> gapSize [
	
	^gapSize
]

{ #category : #accessing }
RTAbstractFlowLayout >> gapSize: aSizeInPixels [
	
	gapSize := aSizeInPixels
]

{ #category : #'initialize-release' }
RTAbstractFlowLayout >> initialize [
	
	super initialize.
	maxWidth := self defaultMaxWidth.
	gapSize := self defaultGapSize.
]

{ #category : #testing }
RTAbstractFlowLayout >> isAlignBottom [
	^ alignment = #bottom
]

{ #category : #testing }
RTAbstractFlowLayout >> isAlignCenter [
	^ alignment = #center
]

{ #category : #testing }
RTAbstractFlowLayout >> isAlignTop [
	^ alignment = #top
]

{ #category : #private }
RTAbstractFlowLayout >> maxWidth [
	
	^maxWidth
]

{ #category : #accessing }
RTAbstractFlowLayout >> maxWidth: aSizeInPixels [
	
	maxWidth := aSizeInPixels
]
