Extension { #name : #SimpleHierarchicalListMorph }

{ #category : #'*Moose-Wizard' }
SimpleHierarchicalListMorph >> expandFirstLevel: aMorph [ 
	| oldState |
	"self setSelectedMorph: aMorph."
	
		"oldState := aMorph isExpanded.
		scroller submorphs copy do: [ :each |
			(each canExpand and: [each isExpanded = oldState]) ifTrue: [
				each toggleExpandedState.
			].
		]."
	aMorph toggleExpandedState.
	self adjustSubmorphPositions.
	
]
