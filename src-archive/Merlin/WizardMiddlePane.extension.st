Extension { #name : #WizardMiddlePane }

{ #category : #'*merlin-rendering' }
WizardMiddlePane >> merlinSpecificRenderer [ 

	^ MerlinMorphicMiddlePaneRenderer new .
]

{ #category : #'*merlin-rendering' }
WizardMiddlePane >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderMerlinMiddlePane: self  
]
