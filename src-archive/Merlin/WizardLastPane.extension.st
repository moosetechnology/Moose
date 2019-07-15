Extension { #name : #WizardLastPane }

{ #category : #'*merlin-rendering' }
WizardLastPane >> merlinSpecificRenderer [ 
	^ MerlinMorphicLastPaneRenderer new 
]

{ #category : #'*merlin-rendering' }
WizardLastPane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinLastPane: self  
]
