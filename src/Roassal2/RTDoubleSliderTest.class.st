"
Tests for class RTDoubleSlider
"
Class {
	#name : #RTDoubleSliderTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-UI-Slider'
}

{ #category : #tests }
RTDoubleSliderTest >> testCallback [
	| slider block t |
	
	slider := RTDoubleSlider new.
	slider build.
	t := 0.
	block := [ :arg1 :arg2 | t := t+1 ].

	slider callback: block.
	self assert: slider callback equals: block.
	slider eventForCursorMin: true.
	self assert: t equals: 1.
	slider eventForCursorMax: true.
	self assert: t equals: 2.
	slider eventForLineCursor.
	self assert: t equals: 3.
]

{ #category : #tests }
RTDoubleSliderTest >> testLabelled [
	| slider |
	
	slider := RTDoubleSlider new.
	self assert: slider isLabelled equals: false.
	slider labeled.
	self assert: slider isLabelled equals: true.
]

{ #category : #tests }
RTDoubleSliderTest >> testMax [
	| slider |
	
	slider := RTDoubleSlider new.
	self assert: slider max equals: 1.0.
	slider max: 0.7.
	self assert: slider max equals: 0.7.
	
]

{ #category : #tests }
RTDoubleSliderTest >> testMin [
	| slider |
	
	slider := RTDoubleSlider new.
	self assert: slider min equals: 0.0.
	slider min: 0.7.
	self assert: slider min equals: 0.7.
]

{ #category : #tests }
RTDoubleSliderTest >> testUseIntegerLabel [
	| slider |
	
	slider := RTDoubleSlider new.
	self assert: slider usingIntegerLabel equals: false.
	slider useIntegerLabel.
	self assert: slider usingIntegerLabel equals: true.
]
