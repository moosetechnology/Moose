"
a CandidateListOperatorAcceptingSimpleKindsOfReceiver compute a list of possible type for a FamixInvocation's receiver when:
	
- the receiver is a Class (so its type is then evident :))
- the receiver is 'self'
- the receiver is 'super'
"
Class {
	#name : #CandidateListOperatorAcceptingSimpleKindsOfReceiver,
	#superclass : #AbstractCandidateListOperator,
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #running }
CandidateListOperatorAcceptingSimpleKindsOfReceiver >> computeCandidateListFor: anInvocation [ 
	| receiver | 
	receiver := anInvocation receiver. 
	receiver ~~ nil 
		ifTrue: 
			[(receiver isImplicitVariable and: [receiver isSuper]) 
				ifTrue: 
					[^self 
						computeCandidateListFor: anInvocation 
						withBaseClass: receiver belongsTo belongsTo superclass]. 
			(receiver isImplicitVariable and: [receiver isSelf]) 
				ifTrue: 
					[^self 
						computeCandidateListFor: anInvocation 
						withReceivingClass: receiver belongsTo belongsTo]. 
			receiver isClass 
				ifTrue: 
					[^self computeCandidateListFor: anInvocation withBaseClass: receiver].
			]. 

]
