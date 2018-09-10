Class {
	#name : #RTSliderTest,
	#superclass : #RTTest,
	#instVars : [
		'slider'
	],
	#category : #'Roassal2-Builder-UI-Slider'
}

{ #category : #running }
RTSliderTest >> setUp [
	super setUp.
	slider := RTSlider new
]

{ #category : #tests }
RTSliderTest >> testDefault [
	self assert: slider min equals: 0.
	self assert: slider max equals: 1.
	self assert: slider value equals: 0.5
]

{ #category : #tests }
RTSliderTest >> testOutsideRange [
	self should: [ slider value: 10 ] raise: Error.
	self should: [ slider value: -5 ] raise: Error.
]

{ #category : #tests }
RTSliderTest >> testProgress [
	slider max: 100.
	slider value: 20.
	self assert: slider value equals: 20.
	self assert: slider progress equals: 0.2
]
