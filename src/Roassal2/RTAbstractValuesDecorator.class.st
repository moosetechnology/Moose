"
The class RTAbstractValuesDecorator is the root of a class hierarchy made to labels some data points on the X and/or Y axis. Consider the following example:

b := RTGrapher new.

ds := RTDataSet new.
ds points: #(0 1 2 3 4 5 6).
b add: ds.

deco :=  RTHorizontalAllValuesDecorator new.
deco labelConversion: [ :value | '#', value asString ].
b addDecorator: deco.

deco :=  RTVerticalValuesDecorator new.
deco addAll: #(2 3 4).
deco labelConversion: [ :value | '#', value asString ].
b addDecorator: deco.

b axisX noTick; noLabel.
b axisY noTick; noLabel.
b 
"
Class {
	#name : #RTAbstractValuesDecorator,
	#superclass : #RTAbstractLineDecorator,
	#instVars : [
		'labelConversion',
		'labelRotation'
	],
	#category : #'Roassal2-Builder-Grapher-Decorators'
}

{ #category : #initialization }
RTAbstractValuesDecorator >> initialize [
	super initialize.
	labelConversion := #yourself.
	labelRotation := 0.
]

{ #category : #accessing }
RTAbstractValuesDecorator >> labelConversion [
	^ labelConversion
]

{ #category : #accessing }
RTAbstractValuesDecorator >> labelConversion: aBlockOrASymbol [
	"Before creating the label, the value to be displayed may be converted using the provided block. Consider the following example:
-=-=-=-=-=-=-=-=	
b := RTGrapher new.

ds := RTDataSet new.
ds points: #(0 1 2 3 4 5 6).
b add: ds.

deco :=  RTHorizontalAllValuesDecorator new.
deco labelConversion: [ :value | '#', value asString ].
b addDecorator: deco.

deco :=  RTVerticalValuesDecorator new.
deco addAll: #(2 3 4).
deco labelConversion: [ :value | '#', value asString ].
b addDecorator: deco.

b axisX noTick; noLabel.
b axisY noTick; noLabel.
b 
-=-=-=-=-=-=-=-=	
	"
	labelConversion := aBlockOrASymbol
]

{ #category : #accessing }
RTAbstractValuesDecorator >> labelRotation [
	^ labelRotation
]

{ #category : #accessing }
RTAbstractValuesDecorator >> labelRotation: aNumber [
	labelRotation := aNumber
]
