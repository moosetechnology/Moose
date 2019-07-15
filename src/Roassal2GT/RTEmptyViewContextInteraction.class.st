"
Interaction for a view. Make the view __not__ resizeable in GTInspector. Here is an example:
-=-=-=
b := RTMondrian new.
b nodes: (1 to: 100).
b layout grid.
b view @ RTEmptyViewContextInteraction.
b
-=-=-=
"
Class {
	#name : #RTEmptyViewContextInteraction,
	#superclass : #RTAbstractContextInteraction,
	#category : #'Roassal2GT-Glamour-Roassal-Interaction'
}

{ #category : #hooks }
RTEmptyViewContextInteraction >> initializeElement: aView [
	RTEmptyViewContext setOnView: aView 
]
