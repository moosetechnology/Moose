Class {
	#name : #TREventOverseer,
	#superclass : #TRObject,
	#instVars : [
		'block'
	],
	#category : #'Trachel-Core'
}

{ #category : #accessing }
TREventOverseer >> block [
	^ block
]

{ #category : #accessing }
TREventOverseer >> block: aOneArgBlock [
	"The block is evaluated at each event fired by TRMorph"
	block := aOneArgBlock
]

{ #category : #public }
TREventOverseer >> firedEvent: anEvent [
	block rtValue: anEvent
]

{ #category : #initialization }
TREventOverseer >> initialize [
	super initialize.
	"Do nothing for now"
	block := nil
]
