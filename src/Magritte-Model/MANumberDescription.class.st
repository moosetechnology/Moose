"
I am a description of numbers, possible values are instances of ==Number== and all its subclasses, including ==Integer== and ==Float==. My visual representation could be a number input-box or even a slider-control.
"
Class {
	#name : #MANumberDescription,
	#superclass : #MAMagnitudeDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MANumberDescription class >> defaultKind [
	^ Number
]

{ #category : #testing }
MANumberDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MANumberDescription class >> label [
	^ 'Number'
]

{ #category : #visiting }
MANumberDescription >> acceptMagritte: aVisitor [
	aVisitor visitNumberDescription: self
]

{ #category : #convenience }
MANumberDescription >> beInteger [
	self addCondition: (MACondition selector: #isInteger) labelled: 'No integer was entered'
]

{ #category : #convenience }
MANumberDescription >> beNegative [
	self addCondition: (MACondition selector: #negative) labelled: 'No negative number was entered'
]

{ #category : #convenience }
MANumberDescription >> bePositive [
	self addCondition: (MACondition selector: #positive) labelled: 'No positive number was entered'
]
