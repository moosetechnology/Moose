"
a CandidateListOperatorAcceptingBasicAndVariableReceivers  compute a list of possible type for a FamixInvocation's receiver when:
	
- the receiver is a Class (so its type is then evident :))
- the receiver is 'self'
- the receiver is 'super'
- the receiver is a FAMIXAttribute


"
Class {
	#name : #CandidateListOperatorAcceptingBasicAndVariableReceivers,
	#superclass : #AbstractCandidateListOperator,
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #running }
CandidateListOperatorAcceptingBasicAndVariableReceivers >> computeCandidateListFor: anInvocation [ 
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
				
			(receiver class = self importer factory attribute and: [receiver isSharedVariable not])
				ifTrue:
					["Transcript show: receiver belongsTo name, '-->', receiver name, '  - roelTyperResult :- ',"(self computeInstanceVariableCandidateListFor: anInvocation ) "sString, '//////      '"].
				
			"not working yet :"	
			"receiver class = FAMIXLocalVariable  
				ifTrue:
					[Transcript show: receiver belongsTo name, '-->', receiver name, '  - roelTyperResult :- ',(self computeTemporaryVariableCandidateListFor: anInvocation ) asString, '//////      ']"
			]. 
	
]
