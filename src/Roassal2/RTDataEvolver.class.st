Class {
	#name : #RTDataEvolver,
	#superclass : #RTObject,
	#instVars : [
		'data',
		'stepGiver'
	],
	#category : #'Roassal2-Builder-Map'
}

{ #category : #'as yet unclassified' }
RTDataEvolver >> currentValue [
	^ self valueAt: stepGiver step.
]

{ #category : #'as yet unclassified' }
RTDataEvolver >> dataSequence: aSequenceOfData [
	data := aSequenceOfData.
]

{ #category : #'as yet unclassified' }
RTDataEvolver >> stepGiver: anObject [
	stepGiver := anObject
]

{ #category : #'as yet unclassified' }
RTDataEvolver >> valueAt: step [
	^ data at: step
]
