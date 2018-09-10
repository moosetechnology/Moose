Class {
	#name : #MASortBlock,
	#superclass : #MABasicObject,
	#instVars : [
		'accessor',
		'selector'
	],
	#category : #'Magritte-Model-Utility'
}

{ #category : #'instance creation' }
MASortBlock class >> accessor: anAccessor selector: aSelector [
	^ self basicNew initializeAccessor: anAccessor selector: aSelector
]

{ #category : #'instance creation' }
MASortBlock class >> selector: aSelector [ 
	^ self 
		accessor: MAIdentityAccessor new
		selector: aSelector
]

{ #category : #actions }
MASortBlock >> fixTemps [
]

{ #category : #initialization }
MASortBlock >> initializeAccessor: anAccessor selector: aSelector [
	accessor := anAccessor asAccessor.
	selector := aSelector
]

{ #category : #evaluating }
MASortBlock >> value: aFirstObject value: aSecondObject [
	^ (accessor read: aFirstObject)
		perform: selector
		with: (accessor read: aSecondObject)
]
