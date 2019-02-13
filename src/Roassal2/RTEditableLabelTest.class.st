"
A RTEditableLabelTest is a test class for testing the behavior of RTEditableLabel
"
Class {
	#name : #RTEditableLabelTest,
	#superclass : #RTTest,
	#category : #'Roassal2-MorphSpecific'
}

{ #category : #tests }
RTEditableLabelTest >> testContainsShapeInstanceOf [

	| shape |
	shape := RTCompositeShape new.
	shape allOfSameSizeWithPadding.
	shape add: (RTBox new color: Color white; borderWidth: 2; borderColor: Color black).
	shape add: (RTEditableLabel new height: 30).
	self assert: (shape containsShapeInstanceOf: RTLabel).
	self assert: (shape containsShapeInstanceOf: RTEditableLabel).	
	self assert: (shape containsShapeInstanceOf: RTBox).
]

{ #category : #tests }
RTEditableLabelTest >> testEditableLabel [
	| element label | 
	element := RTElement on: 708.
	label := RTEditableLabel new.
	self assert: (label textFor: element) = '708'.
	label updateTextFor: element with: '1005'.
	
	self assert: (label textFor: element) = '1005'.
	self assert: element model = 708.
]

{ #category : #tests }
RTEditableLabelTest >> testShowTextMorphFor [

	| editable shape e v |
	editable := RTEditableLabel new height: 30.
	shape := RTCompositeShape new.
	shape allOfSameSizeWithPadding.
	shape add: (RTBox new color: Color white; borderWidth: 2; borderColor: Color black).
	shape add: editable.

	e := shape elementOn: 'hello'.
	v := RTView new.
	v add: e.
	(editable showTextMorphFor: e) delete.
]

{ #category : #tests }
RTEditableLabelTest >> testTextFor [

	| shape e |
	shape := RTCompositeShape new.
	shape allOfSameSizeWithPadding.
	shape add: (RTBox new color: Color white; borderWidth: 2; borderColor: Color black).
	shape add: (RTEditableLabel new height: 30).
	e := shape elementOn: 'hello'.
	
	self assert: (shape textFor: e) equals: 'hello'
]
