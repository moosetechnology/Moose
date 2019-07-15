Class {
	#name : #RTAbstractLineDecorator,
	#superclass : #RTAbstractGrapherDecorator,
	#instVars : [
		'values'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #adding }
RTAbstractLineDecorator >> add: aValue [
	values add: aValue
]

{ #category : #adding }
RTAbstractLineDecorator >> addAll: someValues [
	values addAll: someValues
]

{ #category : #adding }
RTAbstractLineDecorator >> forAllPoints [

	self addAll: self datasetValues
]

{ #category : #initialization }
RTAbstractLineDecorator >> initialize [
	super initialize.
	values := OrderedCollection new.
]
