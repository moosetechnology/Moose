Class {
	#name : #MerlinOptionValueHolder,
	#superclass : #Model,
	#instVars : [
		'contents',
		'option'
	],
	#category : #'Merlin-Parts'
}

{ #category : #accessing }
MerlinOptionValueHolder >> contents [
	^contents
]

{ #category : #accessing }
MerlinOptionValueHolder >> contents: newContents [
	contents := newContents.
"	self contentsChanged."
	self changed: self option 
]

{ #category : #accessing }
MerlinOptionValueHolder >> contentsChanged [
	self changed: #contents
]

{ #category : #accessing }
MerlinOptionValueHolder >> option [

	^ option
]

{ #category : #accessing }
MerlinOptionValueHolder >> option: anObject [

	option := anObject
]

{ #category : #accessing }
MerlinOptionValueHolder >> safeContents: newContents [
	contents := newContents.
	self contentsChanged.
]
