Extension { #name : #FAMIXContainerEntity }

{ #category : #'*Famix-Deprecated' }
FAMIXContainerEntity >> incomingInvocations [
	self
		deprecated: 'Please use #queryLocalIncoming: FamixTInvocation instead'
		transformWith: '`@receiver incomingInvocations' -> '`@receiver queryLocalIncoming: FamixTInvocation'.

	^ self queryLocalIncoming: FamixTInvocation
]

{ #category : #'*Famix-Deprecated' }
FAMIXContainerEntity >> outgoingInvocations [
	self
		deprecated: 'Please use #queryLocalOutgoing: FamixTInvocation instead'
		transformWith: '`@receiver outgoingInvocations' -> '`@receiver queryLocalOutgoing: FamixTInvocation'.

	^ self queryLocalOutgoing: FamixTInvocation
]
