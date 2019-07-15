Extension { #name : #WizardSinglePane }

{ #category : #'*merlin-rendering' }
WizardSinglePane >> merlinSpecificRenderer [

	^ MerlinMorphicSinglePaneRenderer new.
]

{ #category : #'*merlin-rendering' }
WizardSinglePane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinSinglePane: self  
]
