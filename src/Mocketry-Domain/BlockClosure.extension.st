Extension { #name : #BlockClosure }

{ #category : #'*Mocketry-Domain' }
BlockClosure >> asMockExpectationAction [
	^MockExpectedPluggableAction basedOn: self
]

{ #category : #'*Mocketry-Domain' }
BlockClosure >> runWithMocks [

	| mocks |
	mocks := self argumentNames collect: [:each | Mock named: each ].
	self valueWithArguments: mocks
]
