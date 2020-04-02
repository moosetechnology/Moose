Extension { #name : #MooseEntityState }

{ #category : #'*Famix-Tagging' }
MooseEntityState >> removeTagProperties [
	"When we remove a tag we want to flush all caches relative to tags."

	self subclassResponsibility
]
