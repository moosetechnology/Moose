Class {
	#name : #RTMondrianFrameTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-Mondrian'
}

{ #category : #tests }
RTMondrianFrameTest >> testDefault [

	self assert: RTMondrianFrame new elements isEmpty
]

{ #category : #tests }
RTMondrianFrameTest >> testDefaultDepth [

	self assert: RTMondrianFrame new depth equals: 1
]

{ #category : #tests }
RTMondrianFrameTest >> testDefaultElements [

	self assert: RTMondrianFrame new elements isEmpty
]
