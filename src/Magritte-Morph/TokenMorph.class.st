Class {
	#name : #TokenMorph,
	#superclass : #Morph,
	#instVars : [
		'object'
	],
	#category : #'Magritte-Morph-Morphs'
}

{ #category : #'instance creation' }
TokenMorph class >> on: anObject [ 

	^ self new
		object: anObject;
		yourself
]

{ #category : #'as yet unclassified' }
TokenMorph >> initialize [
	super initialize.
	self roundedCorners: #(1 2 3 4). "Seems to do nothing"
	self
		color: UITheme current buttonColor;
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 5@1.
]

{ #category : #accessing }
TokenMorph >> object [
	^ object
]

{ #category : #accessing }
TokenMorph >> object: anObject [
	object := anObject.
	self removeAllMorphs.
	self addMorph: object asString asMorph
]
