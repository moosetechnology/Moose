Extension { #name : #PaneRow }

{ #category : #'*Merlin-Rendering' }
PaneRow >> merlinRendering [

	^ self renderer merlinRowRenderingFor: self
]

{ #category : #'*Merlin-Rendering' }
PaneRow >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderRow: self
]
