Extension { #name : #PaneRow }

{ #category : #'*Merlin' }
PaneRow >> merlinRendering [

	^ self renderer merlinRowRenderingFor: self
]

{ #category : #'*Merlin' }
PaneRow >> renderOnMerlinRenderer: aMerlinRenderer [

	^ aMerlinRenderer renderRow: self
]
