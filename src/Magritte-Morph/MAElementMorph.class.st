Class {
	#name : #MAElementMorph,
	#superclass : #MADescriptionMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MAElementMorph >> buildMorphLabel [
	^ self stringMorph
		contents: self magritteDescription label , ':';
		width: 100;
		yourself
]

{ #category : #'private-building' }
MAElementMorph >> buildMorphRequired [
	^ self stringMorph
		contents: ' *';
		color: Color red;
		yourself
]

{ #category : #'private-building' }
MAElementMorph >> buildMorphView [

	^ self stringMorph
		contents: self string;
		yourself
]

{ #category : #'private-building' }
MAElementMorph >> buildMorphViewOn: aMorph [

	aMorph
		layoutInset: 1 @ 1;
		listDirection: #leftToRight;
		addMorphBack: self buildMorphLabel;
		addMorphBack: self buildMorphView.
	self magritteDescription hasComment
		ifTrue: [ aMorph setBalloonText: self magritteDescription comment ].
	self magritteDescription isRequired
		ifTrue: [ aMorph addMorphBack: self buildMorphRequired ]
]

{ #category : #accessing }
MAElementMorph >> string [
	^ self magritteDescription toString: self value
]

{ #category : #accessing }
MAElementMorph >> string: aString [
	| value |
	value := self magritteDescription fromString: aString greaseString.
	self value: value; changed: #string
]

{ #category : #accessing }
MAElementMorph >> value [
	^ self memento readUsing: self magritteDescription
]

{ #category : #accessing }
MAElementMorph >> value: anObject [
	self memento write: anObject using: self magritteDescription.
	self changed: #value
]
