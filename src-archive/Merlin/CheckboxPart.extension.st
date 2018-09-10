Extension { #name : #CheckboxPart }

{ #category : #'*merlin-rendering' }
CheckboxPart >> merlinRendering [

	^ self renderer merlinCheckboxRenderingFor: self
]
