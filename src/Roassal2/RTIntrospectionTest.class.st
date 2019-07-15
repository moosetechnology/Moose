Class {
	#name : #RTIntrospectionTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Exporter-HTML5'
}

{ #category : #tests }
RTIntrospectionTest >> testHighlightable [

	| e |
	e := RTElement new.
	self deny: (e hasInteraction: RTHighlightable).
	e @ RTHighlightable.
	self assert: (e hasInteraction: RTHighlightable).
]

{ #category : #tests }
RTIntrospectionTest >> testPopup [

	| e |
	e := RTElement new.
	self deny: (e hasInteraction: RTPopup).
	e @ RTPopup.
	self assert: (e hasInteraction: RTPopup).
]

{ #category : #tests }
RTIntrospectionTest >> testPopup2 [

	| e aPopup |
	e := RTElement new.
	aPopup := RTPopup text: 'zork'.
	e @ aPopup.
	self assert: (e getInteractionForClass: RTPopup) == aPopup.
]
