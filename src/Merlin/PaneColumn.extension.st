Extension { #name : #PaneColumn }

{ #category : #'Merlin' }
PaneColumn >> merlinMorphWidget [

	^ nil
]

{ #category : #'Merlin' }
PaneColumn >> merlinRendering [

	^ self renderer merlinColumnRenderingFor: self
]

{ #category : #'*Merlin' }
PaneColumn >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderColumn: self
]
