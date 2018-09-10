"
Just a class for examples
"
Class {
	#name : #RTSBFadeInteractionExamples,
	#superclass : #RTObject,
	#category : #'Roassal2-Builder-Sunburst'
}

{ #category : #examples }
RTSBFadeInteractionExamples >> example01 [
	
	"
	self new example01
	"	
	| b |
	b := RTSunburstBuilder new.
	
	"This should be called before the explore method"
	b interaction addInteraction: RTSBFadeInteraction new.
	
	b radialSpacing: 5.
	b angularSpacing: 1.

	b color: [ :cls | cls subclasses notEmpty 
		ifTrue: [ Color orange ] 
		ifFalse: [ Color red ] ].

	b explore: RTObject using: #subclasses.
	^ b
]

{ #category : #examples }
RTSBFadeInteractionExamples >> example02 [
	
	"
	self new example02
	"	
	| b |
	b := RTSunburstBuilder new.
	
	b radialSpacing: 5.
	b angularSpacing: 1.

	b color: [ :cls | cls subclasses notEmpty 
		ifTrue: [ Color orange ] 
		ifFalse: [ Color red ] ].

	b explore: RTObject using: #subclasses.
	b view @ RTDraggableView.
	"This should'nt work"
	b interaction addInteraction: (RTSBFadeInteraction new).
	b build.
	^ b view
]

{ #category : #examples }
RTSBFadeInteractionExamples >> example03 [
	
	"
	self new example03
	"	
	| b |
	b := RTSunburstBuilder new.
	
	b radialSpacing: 5.
	b angularSpacing: 1.

	b shape current 
				color: [ :cls | cls subclasses notEmpty ifTrue: [ Color orange ] ifFalse: [ Color red ] ].

	b interaction addInteraction: (RTSBFadeInteraction action: [:cls | Transcript show: cls name; cr.]).
	
	b explore: RTObject using: #subclasses.
	b view @ RTDraggableView.

	b build.
	^ b view
]
