Extension { #name : #SubscriptionRegistry }

{ #category : #'*Roassal2Spec' }
SubscriptionRegistry >> subscriptionsDo: aBlock [
	| copy |
	
	self protected: [ copy := subscriptions copy ].
	
	copy do: aBlock
]
