Extension { #name : #MultiSelectionItemSelectorPart }

{ #category : #'*merlin-rendering' }
MultiSelectionItemSelectorPart >> merlinRendering [

	^ self renderer merlinMultiSelectionItemsSelectorRenderingFor: self
]
