Extension { #name : #MooseEntity }

{ #category : #'*Moose-Finder2' }
MooseEntity >> mfRawInspectExtension [
	<inspectorPresentationOrder: 0 title: 'Moose Raw'>
	^ MF2RawInspection on: self
]
