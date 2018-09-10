Extension { #name : #SubscriptionRegistry }

{ #category : #'*ACD-Model' }
SubscriptionRegistry >> acdSubscriptions [
	|subsCopy|
	
	self protected: [ subsCopy := subscriptions as: OrderedCollection ].
	
	^ subsCopy
]
