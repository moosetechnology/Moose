"
I am abstract class for callbacks executed when Trachel shapes have changed in some way --- added to canvas, removed, changed size, etc.
"
Class {
	#name : #TRCallback,
	#superclass : #TRObject,
	#instVars : [
		'block'
	],
	#category : #'Trachel-Callbacks'
}

{ #category : #public }
TRCallback class >> block: aBlock [
	^ self new block: aBlock
]

{ #category : #accessing }
TRCallback >> block [
	^ block
	
]

{ #category : #accessing }
TRCallback >> block: aOneArgBlock [
	"aThreeArgBlock follows the pattern [ :shape | ... ]"
	block := aOneArgBlock
]

{ #category : #initialization }
TRCallback >> initialize [
	super initialize.
	block := [ :aShape :aValue | ]
]

{ #category : #testing }
TRCallback >> isAddedCallback [
	^ false
]

{ #category : #testing }
TRCallback >> isCameraScaleCallback [
	^ false
]

{ #category : #testing }
TRCallback >> isExtentCallback [
	^ false
]

{ #category : #testing }
TRCallback >> isRemoveCallback [
	^ false
]

{ #category : #testing }
TRCallback >> isTranslationCallback [
	^ false
]
