"
A RTGrayLinearColor is xxxxxxxxx.

Instance Variables
	max:		<Object>
	min:		<Object>
	scope:		<Object>

max
	- xxxxx

min
	- xxxxx

scope
	- xxxxx

"
Class {
	#name : #RTMultiLinearColor,
	#superclass : #RTAbstractNormalizer,
	#instVars : [
		'colors'
	],
	#category : #'Roassal2-ColorNormalizer'
}

{ #category : #accessing }
RTMultiLinearColor >> colors [
	"Return the set of colors used to do the fading"
	^ colors
]

{ #category : #accessing }
RTMultiLinearColor >> colors: anArrayOfColors [
	colors := anArrayOfColors
]

{ #category : #initialization }
RTMultiLinearColor >> defaultColors [
	^ Array with: Color red with: Color blue with: Color green
]

{ #category : #initialization }
RTMultiLinearColor >> defaultCommand [
	^ #yourself
]

{ #category : #accessing }
RTMultiLinearColor >> indexesFor: f [
	"f - float is between 0.0 and 1.0. Return an array of length two"
	| nbColors v i1 i2 |
	nbColors := colors size.
	v := f * (nbColors - 1).
	i1 := v asInteger + 1.
	i2 := i1 + 1.
	
	^ Array with: i1 with: i2
]

{ #category : #initialization }
RTMultiLinearColor >> initialize [
	super initialize.
	colors := self defaultColors.
	command := self defaultCommand
]

{ #category : #accessing }
RTMultiLinearColor >> level: f [
	"f - float is between 0.0 and 1.0"
	| arr c1 c2 nr ng nb i1 i2 nbColors ff  |
	(f isNaN) ifTrue: [ ^ Color white ]. 
	
	arr := self indexesFor: f.
	nbColors := colors size.
	
	i1 := arr first.
	i2 := arr second.
	
	i1 >= colors size ifTrue: [ ^ colors last ].
	i1 < 1 ifTrue: [ ^ colors first ].
	c1 := colors at: (i1).
	c2 := colors at: (i2).
	
	ff :=( f - (i1 -1 / (nbColors - 1)) / (1 / (nbColors - 1)) ).
	
	nr := (c2 red - c1 red) * ff + c1 red.
	ng := (c2 green - c1 green) * ff + c1 green.
	nb := (c2 blue - c1 blue) * ff + c1 blue.
	
	^ Color r: nr g: ng  b: nb 
]

{ #category : #accessing }
RTMultiLinearColor >> numberOfColors [
	^ colors size
]

{ #category : #accessing }
RTMultiLinearColor >> rtValue: anObject [
	| v |	
	v := command rtValue: anObject.
	"v ranges from 0.0 to 1.0"
	^ self level: v
]
