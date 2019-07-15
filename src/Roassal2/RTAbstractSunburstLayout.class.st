"
I am the abstract class for sunburst visualizations in Roassal2, check my subclasses 

* RTSunburstConstanWidthLayout
* RtSunburstExtentLayout

You can use this layout in with RTLayoutBuilder or with RTSunburstBuilder
and their examples to get more info
"
Class {
	#name : #RTAbstractSunburstLayout,
	#superclass : #RTLayout,
	#instVars : [
		'builder',
		'angularSpacing',
		'radialSpacing',
		'hasCenter'
	],
	#category : #'Roassal2-Builder-Sunburst'
}

{ #category : #accessing }
RTAbstractSunburstLayout >> angularSpacing [
	^ angularSpacing
]

{ #category : #accessing }
RTAbstractSunburstLayout >> angularSpacing: anInteger [
	angularSpacing := anInteger
]

{ #category : #accessing }
RTAbstractSunburstLayout >> builder [
	^ builder
]

{ #category : #accessing }
RTAbstractSunburstLayout >> builder: aBuilder [
	builder := aBuilder
	
]

{ #category : #public }
RTAbstractSunburstLayout >> doExecute: elements [
	| virtual |
	
	elements isEmpty ifTrue: [ ^  self ].
	elements size = 1 ifTrue: [ 
		^ self layoutSunburst: elements first ].
	virtual := RTArc element.
	virtual attributes at: builder childrenKey put: elements.
	elements do: [ :e | e attributes at: #parent put: virtual ].
	virtual attributes at: #parent put: nil.
	virtual attributes at: #depth put: 0.
	self layoutSunburst: virtual.
	elements do: [ :e | e attributes at: #parent put: nil ].
]

{ #category : #accessing }
RTAbstractSunburstLayout >> hasCenter [
	^ hasCenter
]

{ #category : #accessing }
RTAbstractSunburstLayout >> hasCenter: aBool [
	hasCenter := aBool
]

{ #category : #initialization }
RTAbstractSunburstLayout >> initialize [
	super initialize.
	self hasCenter: true.
	self angularSpacing: 0.
	self radialSpacing: 5.
]

{ #category : #public }
RTAbstractSunburstLayout >> layoutSunburst: el [
	self subclassResponsibility
]

{ #category : #accessing }
RTAbstractSunburstLayout >> radialSpacing [
	^ radialSpacing 
]

{ #category : #accessing }
RTAbstractSunburstLayout >> radialSpacing: aNumber [
	radialSpacing := aNumber
]

{ #category : #public }
RTAbstractSunburstLayout >> withoutCenter [
	self hasCenter: false
]
