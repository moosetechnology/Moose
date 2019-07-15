Class {
	#name : #ACDStepToSubscriptionDebugAction,
	#superclass : #DebugAction,
	#instVars : [
		'targetSubscription'
	],
	#category : #'ACD-Model'
}

{ #category : #'as yet unclassified' }
ACDStepToSubscriptionDebugAction class >> acdActionTypeForDebugger: aDebugger [
	<gtContextACDSubscriptionDebuggingAction>
	
	^ (self forDebugger: aDebugger)
		targetSubscription: aDebugger selectedSubscription
		
]

{ #category : #testing }
ACDStepToSubscriptionDebugAction >> appliesToContext: aContext [

	^ (self session hasSubscriptionExecuted: targetSubscription) not
]

{ #category : #accessing }
ACDStepToSubscriptionDebugAction >> defaultLabel [

	^ 'Step to subscription'
]

{ #category : #actions }
ACDStepToSubscriptionDebugAction >> executeAction [ 
	| receiverSender |

	receiverSender := self session receiverContext sender.			
	[ self interruptedContext receiver == targetSubscription  ] 
		whileFalse: [ 
			self session stepOver: receiverSender.
			(self interruptedContext == receiverSender) 
				ifFalse: [ self session contextChanged. ^ self ].
			
			self session stepOver: (self session stackFilterFor: receiverSender) locateAnnouncementDelivery.
			self session stepUntil: self nextDeliveryStart.
			receiverSender := self interruptedContext ].
		
	(self nextDeliveryStart matches: self interruptedContext) 
		ifTrue: [ 
			self session stepUntil: (self session subscriptionDelivery).
			self session updateReceiver ]
]

{ #category : #predicates }
ACDStepToSubscriptionDebugAction >> nextDeliveryStart [ 

	^ self session createPredicateForBlock: [ :aContext | 
			aContext receiver isSubscription and: [  
				aContext selector =  #deliver: and: [ 
					aContext closure notNil ] ] ]
]

{ #category : #accessing }
ACDStepToSubscriptionDebugAction >> targetSubscription: aSubscription [

	targetSubscription := aSubscription
]
