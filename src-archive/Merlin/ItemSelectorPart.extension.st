Extension { #name : #ItemSelectorPart }

{ #category : #'*merlin-rendering' }
ItemSelectorPart >> merlinRendering [

	^ self renderer merlinItemsSelectorRenderingFor: self
]
