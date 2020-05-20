Extension { #name : #MooseModel }

{ #category : #'*Famix-Deprecated' }
MooseModel >> flushGroups [
	self deprecated: 'Use #flushPrivateState instead.' transformWith: '`@receiver flushGroups' -> '`@receiver flushPrivateState'.
	self flushPrivateState
]

{ #category : #'*Famix-Deprecated' }
MooseModel >> flushProperties [
	self deprecated: 'Use #flushPrivateState instead.' transformWith: '`@receiver flushProperties' -> '`@receiver flushPrivateState'.
	self flushPrivateState
]
