"
Interaction for a view. Make the view resizeable in GTInspector. Here is an example:
-=-=-=
b := RTMondrian new.
b nodes: (1 to: 100).
b layout grid.
b view @ RTResizeableViewContextInteraction.
b
-=-=-=
"
Class {
	#name : #RTResizeableViewContextInteraction,
	#superclass : #RTAbstractContextInteraction,
	#category : #'Roassal2GT-Glamour-Roassal-Interaction'
}

{ #category : #hooks }
RTResizeableViewContextInteraction >> initializeElement: aView [
	"self assert: [ self presentation notNil ] description: 'The presentation has to be set'."

	aView canvas
		when: TRResizeCanvasEvent
		do: [ :evt | 
			| es |
			es := aView elements asGroup encompassingRectangle. 
			(es width + es height) > 4000
				ifFalse: [ aView canvas focusOnCenterScaled ] ]
]
