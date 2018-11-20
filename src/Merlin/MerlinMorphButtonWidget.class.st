Class {
	#name : #MerlinMorphButtonWidget,
	#superclass : #MerlinMorphPartWidget,
	#instVars : [
		'buttonMorph'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph contents' }
MerlinMorphButtonWidget >> buttonMorph [

	^ buttonMorph ifNil: [buttonMorph := self newButtonOn: self wizardPart named: self wizardPart label withAction: #hasChanged.]

]

{ #category : #'accessing - morph contents' }
MerlinMorphButtonWidget >> specificMorphContents [ 
	
	^ self buttonMorph enabled: self wizardPart buttonEnabled; yourself
	.
]
