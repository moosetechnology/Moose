Class {
	#name : #RTFindInAViewTest,
	#superclass : #RTTest,
	#category : #'Roassal2GT-Spotter'
}

{ #category : #tests }
RTFindInAViewTest >> testBasic [

	| b |
	b := RTMondrian new.
	b shape box.
	b nodes: Collection withAllSubclasses.
	b view @ RTFindInAView.
	b build.

]
