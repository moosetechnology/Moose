"
A coordinate or length value can be expressed as a number following by a unit identifier (e.g., ""25cm"" or ""15em""). The list of unit identifiers in SVG matches the list of unit identifiers in CSS: em, ex, px, pt, pc, cm, mm, in and percentages. The following describes how the various unit identifiers are processed:
"
Class {
	#name : #ASLength,
	#superclass : #Object,
	#instVars : [
		'value',
		'units'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASLength class >> fromString: aString [
	| conv l |
	conv := (ASConverter new stream: aString readStream).
	l := self new.
	l value:  conv nextNumber.
	l units: conv stream upToEnd.
	^ l
]

{ #category : #printing }
ASLength >> printOn: aStream [

	aStream print: value; nextPutAll: units
]

{ #category : #accessing }
ASLength >> units [
	^ units
]

{ #category : #accessing }
ASLength >> units: anObject [
	units := anObject
]

{ #category : #accessing }
ASLength >> value [
	^ value
]

{ #category : #accessing }
ASLength >> value: anObject [
	value := anObject
]

{ #category : #converting }
ASLength >> valueForDPI: dpi [


	units = 'cm' ifTrue: [
		^ value * (dpi / 2.54) asFloat
		].
	
	units = 'mm' ifTrue: [
		^ value * (dpi / 25.4) asFloat
		].

	units = 'px' ifTrue: [ ^ value ].

	units = 'pt' ifTrue: [ ^ value ].
	
	units isEmpty ifTrue: [ ^ value ].
	
	self halt.
]
