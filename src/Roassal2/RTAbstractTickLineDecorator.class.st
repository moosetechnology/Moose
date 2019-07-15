Class {
	#name : #RTAbstractTickLineDecorator,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'step'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #hooks }
RTAbstractTickLineDecorator >> axis [
	self subclassResponsibility
]

{ #category : #drawing }
RTAbstractTickLineDecorator >> fromPoint [
	^ self axis fromPoint
]

{ #category : #initialization }
RTAbstractTickLineDecorator >> initialize [
	super initialize.
	self step: [ :axis | axis step ]
]

{ #category : #drawing }
RTAbstractTickLineDecorator >> maxValue [
	^ self axis maxValue
]

{ #category : #drawing }
RTAbstractTickLineDecorator >> minValue [
	^ self axis minValue
]

{ #category : #accessing }
RTAbstractTickLineDecorator >> numberOfTicks: nbOfTicks [
	self step: [ :axis | (axis maxValue - axis minValue) / nbOfTicks ]
]

{ #category : #drawing }
RTAbstractTickLineDecorator >> step [
	^ step rtValue: self axis
]

{ #category : #accessing }
RTAbstractTickLineDecorator >> step: aValueOrASymbolOrABlock [
	"The argument is evaluated against the axis"
	step := aValueOrASymbolOrABlock
]

{ #category : #drawing }
RTAbstractTickLineDecorator >> toPoint [
	^ self axis toPoint
]
