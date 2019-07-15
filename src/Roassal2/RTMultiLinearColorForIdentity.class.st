"
RTMultiLinearColorForIdentity associates to each objects a distinct color. 

Consider the following example:
[[[
classes := Collection withAllSubclasses.
packages := (classes collect: #package) asSet asArray.
v := RTView new.
v @ RTDraggableView.
normalizer := RTMultiLinearColorForIdentity new 
					objects: packages;
					command: #package.
s := RTBox new size: 15; color: normalizer.
v addAll: (s elementsOn: classes).

e := RTEdgeBuilder new
		view: v;
		moveBehind;
		objects: classes.
e connectFrom: #superclass.
RTClusterLayout on: v elements.
v
]]]

Using the Mondrian api, the normalizer es:
"
Class {
	#name : #RTMultiLinearColorForIdentity,
	#superclass : #RTMultiLinearColor,
	#instVars : [
		'objects',
		'defaultColor'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #public }
RTMultiLinearColorForIdentity >> colorOf: anObject [
	"Public method. It return the color of an Object"
	
	| index temp |
	index := objects indexOf: anObject.
	
	"If the object is not part of the range of objects to consider, then we use a default color"
	index = 0 ifTrue: [ ^ self defaultColor ].
	temp := objects size -1.
	temp := temp = 0
		ifTrue: [ 1 ]
		ifFalse: [ (index -1 )/temp ].
	^ self level: temp
]

{ #category : #accessing }
RTMultiLinearColorForIdentity >> defaultColor [
	"Return the color used in case the element to display is not part of the visualization"
	^ defaultColor
]

{ #category : #accessing }
RTMultiLinearColorForIdentity >> defaultColor: aColor [
	"Set the color used in case the element to display is not part of the visualization"
	defaultColor := aColor
]

{ #category : #public }
RTMultiLinearColorForIdentity >> elements: roassalElements [
	^ self objects: (roassalElements collect: #model)
]

{ #category : #initialization }
RTMultiLinearColorForIdentity >> initialize [
	super initialize.
	self colors: (RTColorPalette qualitative colors: 12 scheme: 'Set3').
	objects := #().
	self defaultColor: Color veryLightGray
]

{ #category : #public }
RTMultiLinearColorForIdentity >> numberOfColors: aValue [
	^ self objects: (1 to: aValue)
]

{ #category : #public }
RTMultiLinearColorForIdentity >> objects: someObjects [
	objects := someObjects
]

{ #category : #public }
RTMultiLinearColorForIdentity >> rtValue: anObject [
	"Public method"
	^ self colorOf: (command rtValue: anObject)
]
