Extension { #name : #WizardFirstPane }

{ #category : #'*merlin-rendering' }
WizardFirstPane >> merlinSpecificRenderer [ 

	^ MerlinMorphicFirstPaneRenderer new 
]

{ #category : #'*merlin-rendering' }
WizardFirstPane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinFirstPane: self 
]
