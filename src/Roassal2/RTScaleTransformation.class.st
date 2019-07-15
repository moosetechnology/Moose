Class {
	#name : #RTScaleTransformation,
	#superclass : #RTObject,
	#classInstVars : [
		'instance'
	],
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #'as yet unclassified' }
RTScaleTransformation class >> instance [
	instance ifNil: [ instance := self new ].
	^ instance
]

{ #category : #hooks }
RTScaleTransformation >> invTrans: value [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
RTScaleTransformation >> rtValue: aValue [
	^ self trans: aValue
]

{ #category : #hooks }
RTScaleTransformation >> trans: value [
	self subclassResponsibility
]
