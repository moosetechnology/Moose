Class {
	#name : #RTExampleTestCase,
	#superclass : #GtExampleTestCase,
	#category : #'Roassal2GT-Tests-Examples'
}

{ #category : #accessing }
RTExampleTestCase >> defaultTimeLimit [
	^ 800 seconds
]

{ #category : #configuration }
RTExampleTestCase >> packageNames [
	^ { 'Roassal2' . 'Roassal2GT' }
]
