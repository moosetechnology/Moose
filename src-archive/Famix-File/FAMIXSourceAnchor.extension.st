Extension { #name : #FAMIXSourceAnchor }

{ #category : #'*Famix-File' }
FAMIXSourceAnchor >> containerFiles [
	"I should return a collection of files corresponding to the source anchor. If there is no file just return an empty collection."

	^ self subclassResponsibility
]
