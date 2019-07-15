Class {
	#name : #RTMethodAgeTest,
	#superclass : #RTTest,
	#category : #'Roassal2-MorphSpecific'
}

{ #category : #tests }
RTMethodAgeTest >> testMethodAge [ 
	self assert: RTAbstractElementShape computeYoungestMethod notNil
]
