Extension { #name : #PaneColumn }

{ #category : #'*Merlin-Rendering' }
PaneColumn >> merlinMorphWidget [

	^ nil
]

{ #category : #'*Merlin-Rendering' }
PaneColumn >> merlinRendering [

	^ self renderer merlinColumnRenderingFor: self
]

{ #category : #'*Merlin-Rendering' }
PaneColumn >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderColumn: self
]
