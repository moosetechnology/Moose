Class {
	#name : #GHGhostTestCase,
	#superclass : #TestCase,
	#instVars : [
		'ghost'
	],
	#category : 'Ghost-ObjectGhost-Tests'
}

{ #category : #testing }
GHGhostTestCase class >> isAbstract [
	^self == GHGhostTestCase
]

{ #category : #running }
GHGhostTestCase >> ghostClass [
	self subclassResponsibility 
]

{ #category : #running }
GHGhostTestCase >> setUp [
	super setUp.
	
	ghost := self ghostClass new
]

{ #category : #tests }
GHGhostTestCase >> testProcessingMetaMessage [

	| actual |
	actual := ghost printString.
	
	self assert: actual equals: 'a ', self ghostClass name
]
