Extension { #name : #MoosePanelCommand }

{ #category : #'*Famix-Deprecated' }
MoosePanelCommand >> abstractTag [
	"Say that this class will not taken into consideration when querying command hierarchy"

	self deprecated: 'Implement #isAbstract class side instead of relying on this method.'
]

{ #category : #'*Famix-Deprecated' }
MoosePanelCommand class >> isAbstractCommand [
	self deprecated: 'Implement #isAbstract instead.'.
	^ self selectors includes: #abstractTag
]
