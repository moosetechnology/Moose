Class {
	#name : #MAPasswordMorph,
	#superclass : #MATextMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MAPasswordMorph >> buildMorphView [
	^ super buildMorphView
		font: (StrikeFont passwordFontSize: 12);
		yourself
]
