Class {
	#name : #RTTopLeftBehavior,
	#superclass : #RTNestingBehavior,
	#category : #'Roassal2-Core'
}

{ #category : #utility }
RTTopLeftBehavior >> makeElements: elements draggableByTrachelShape: trachelShape [
	| callback |
	callback := TRTranslationCallback block: [ :shape :step | 
		| topLeft |
		topLeft := trachelShape encompassingRectangle topLeft.
		elements translateTo: topLeft + (elements extent / 2) ].
	trachelShape addCallback: callback 
]

{ #category : #hooks }
RTTopLeftBehavior >> on: backElement setNested: elements [
	"Override this method to express a particular behavior"
	self makeElements: elements draggableBy: backElement.
	self resize: backElement for: elements
	
]
