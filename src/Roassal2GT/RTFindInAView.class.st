"
Useful interaction to let one search for elements contained in a view

[[[
| b |			
b := RTMondrian new.
b shape box.
b nodes: Collection withAllSubclasses.
b normalizer normalizeWidth: #numberOfVariables; normalizeHeight: #numberOfMethods.
b layout flow.
b view @ RTFindInAView.
b
]]]			
"
Class {
	#name : #RTFindInAView,
	#superclass : #RTAbstractInteractionView,
	#category : #'Roassal2GT-Spotter'
}

{ #category : #hooks }
RTFindInAView >> initializeElement: aView [

	| mb |
	mb := RTMenuBuilder new.
	mb view: aView.
	mb menu: 'Find' callback: [ 
        GTSpotterMorph new
                        extent: 400@500;
                        spotterModel: (GTSpotter on: aView);
                        openCenteredInWorld ].
	mb build
]
