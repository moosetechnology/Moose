Class {
	#name : #ACDStepToNextSubscriptionDebugAction,
	#superclass : #DebugAction,
	#category : #'ACD-Model'
}

{ #category : #registration }
ACDStepToNextSubscriptionDebugAction class >> acdActionType [
	<gtACDSubscriptionDebuggingAction>
]

{ #category : #testing }
ACDStepToNextSubscriptionDebugAction >> appliesToContext: aContext [

	^ self session hasMoreActiveSubscriptions
]

{ #category : #testing }
ACDStepToNextSubscriptionDebugAction >> appliesToDebugger: aDebugger [

	^ aDebugger session hasMoreActiveSubscriptions
]

{ #category : #actions }
ACDStepToNextSubscriptionDebugAction >> executeAction [ 
	"Step over the delivery of the current announcement."
	| receiverSender |
	receiverSender := self session receiverContext sender.
	
	self session stepOver: receiverSender.
	(self interruptedContext == receiverSender) 
		ifFalse: [ self session contextChanged. ^ self ].
	
	self session stepOver: (self session stackFilterFor: receiverSender) locateAnnouncementDelivery.
	self session stepUntil: self nextDeliveryStart.
			
	(self nextDeliveryStart matches: self interruptedContext) ifTrue: [ 
		self session stepUntil: (self session subscriptionDelivery).
		self session updateReceiver ]
	
	
	
	
]

{ #category : #initialization }
ACDStepToNextSubscriptionDebugAction >> initialize [

	self label: 'Next subscription'.
	self icon: GLMUIThemeExtraIcons glamorousOver.
]

{ #category : #predicates }
ACDStepToNextSubscriptionDebugAction >> nextDeliveryStart [ 

	^ self session createPredicateForBlock: [ :aContext | 
			aContext receiver isSubscription and: [  
				aContext selector =  #deliver: and: [ 
					aContext closure notNil ] ] ]
]
