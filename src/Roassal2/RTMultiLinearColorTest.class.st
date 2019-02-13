Class {
	#name : #RTMultiLinearColorTest,
	#superclass : #RTTest,
	#category : #'Roassal2-ColorNormalizer-Tests'
}

{ #category : #tests }
RTMultiLinearColorTest >> testBasic [

	| n |
	n := RTMultiLinearColor new.
	self assert: (n rtValue: 0.0) equals: Color red
]

{ #category : #tests }
RTMultiLinearColorTest >> testDefaultCommand [

	| n |
	n := RTMultiLinearColor new.
	self assert: n command notNil.
	self assert: (n command rtValue: 0.3) equals: 0.3.
]

{ #category : #tests }
RTMultiLinearColorTest >> testNumberOfColors [
	 
	self assert: RTMultiLinearColor new numberOfColors equals: 3
]

{ #category : #tests }
RTMultiLinearColorTest >> testNumberOfColors2 [
	| n |
	n := RTMultiLinearColor new.
	n colors: (Array with: Color gray with: Color blue).
	self assert: n numberOfColors equals: 2
]
