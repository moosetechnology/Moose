Extension { #name : #MooseGroupRuntimeStorage }

{ #category : #'*Famix-Tagging' }
MooseGroupRuntimeStorage >> addTaggingEntityFirst: anElement [
	elements addFirst: anElement.
	self updateCacheOnAddingOf: anElement.
	^ anElement
]
