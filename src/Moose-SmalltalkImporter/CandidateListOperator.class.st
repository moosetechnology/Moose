"
a CandidateListOperator compute a list of possible type for a FamixInvocation's receiver when:
	
- the receiver is a Class (so its type is then evident :))
- the receiver is 'self'
- the receiver is 'super'
"
Class {
	#name : #CandidateListOperator,
	#superclass : #AbstractCandidateListOperator,
	#category : #'Moose-SmalltalkImporter'
}

{ #category : #running }
CandidateListOperator >> allCandidatesFor: invocation [ 
	 
	^Array 
		withAll: 
			(groups 
				at: invocation signature 
				ifAbsent: #())
]

{ #category : #running }
CandidateListOperator >> basicRun [ 
	 
	model allInvocations 
		do: 
			[:invocation |  
			self computeCandidateListFor: invocation. 
			"self reifyIncomingInvocationsFor: invocation. "
			self increment]
]

{ #category : #running }
CandidateListOperator >> computeCandidateListFor: anInvocation [ 
	| receiver | 
	receiver := anInvocation receiver. 
	receiver ~~ nil 
		ifTrue: 
			[(receiver isImplicitVariable and: [receiver isSuper]) 
				ifTrue: 
					[^self 
						computeCandidateListFor: anInvocation 
						withBaseClass: receiver belongsTo parentType superclass]. 
			(receiver isImplicitVariable and: [receiver isSelf]) 
				ifTrue: 
					[^self 
						computeCandidateListFor: anInvocation 
						withReceivingClass: receiver belongsTo parentType]. 
			receiver isClass 
				ifTrue: 
					[^self computeCandidateListFor: anInvocation withBaseClass: receiver].
			]. 
	anInvocation candidates: (self allCandidatesFor: anInvocation)
]

{ #category : #running }
CandidateListOperator >> computeCandidateListFor: anInvocation withBaseClass: aClass [ 
	 
	aClass ~~ nil 
		ifTrue: 
			[| candidate | 
			candidate := aClass implementationOf: anInvocation signature. 
			(candidate ~~ nil and: [candidate isAbstract not]) 
				ifTrue: [anInvocation candidates: (Array with: candidate)]]
]

{ #category : #running }
CandidateListOperator >> computeCandidateListFor: anInvocation withReceivingClass: aClass [ 
	 
	| candidate candidates | 
	aClass ~~ nil 
		ifTrue: 
			[candidates := self allCandidatesFor: anInvocation. 
			candidates := candidates 
				select: [:each | each belongsTo inheritsFrom: aClass]. 
			candidate := aClass implementationOf: anInvocation signature. 
			(candidate ~~ nil and: [candidate isAbstract not]) 
				ifTrue: [candidates := candidates copyWith: candidate]. 
			anInvocation candidates: candidates]
]

{ #category : #running }
CandidateListOperator >> computeInstanceVariableCandidateListFor: anInvocation [ 
	 
	| roelTyperResult allCandidates classContainingInvocation instVarSymbol |
	classContainingInvocation := Smalltalk at: (anInvocation receiver belongsTo name).
	instVarSymbol := anInvocation receiver name.
	roelTyperResult := (TypeCollector typeInstvar: instVarSymbol ofClassWithLookup: classContainingInvocation) types. 
	"roelTyperResult := (TypeCollector typeInstvar: instVarSymbol ofClass: (self containerOf: instVarSymbol asString startingAt: classContainingInvocation )) assignments. "
	
	allCandidates := self allCandidatesFor: anInvocation .
	
	roelTyperResult isNil
	 	ifTrue: [
			anInvocation candidates: (self allCandidatesFor: anInvocation ).				
		]
		ifFalse: [
			allCandidates := allCandidates select: [:each | roelTyperResult includes: each belongsTo name].
			anInvocation candidates: allCandidates .
		].
	
	
	^ roelTyperResult 

]

{ #category : #running }
CandidateListOperator >> computeTemporaryVariableCandidateListFor: anInvocation [ 
	 
	| aClass |
	aClass ~~ nil 
		ifTrue: 
			[| candidate | 
			candidate := aClass implementationOf: anInvocation signature. 
			(candidate ~~ nil and: [candidate isAbstract not]) 
				ifTrue: [anInvocation candidates: (Array with: candidate)]]
]

{ #category : #private }
CandidateListOperator >> containerOf: anInstVarName startingAt: aClass [

	"When we see that the receiver of an Invocation is an Instance Variable, this instance variable may be defined in the class containing the invocation or maybe in one of the superclass.
	Here we return the class defining this instance variable."
	

	(aClass instVarNames includes: anInstVarName )
		ifTrue: [ ^ aClass ]
		ifFalse: [ ^ self containerOf: anInstVarName startingAt: aClass ].
		
		 .
]

{ #category : #accessing }
CandidateListOperator >> description [ 
	 
	^'Computing candidate list for <1p> invocations'
		expandMacrosWith: model allInvocations size
]

{ #category : #accessing }
CandidateListOperator >> length [ 
	 
	^model allInvocations size
]

{ #category : #running }
CandidateListOperator >> setUp [ 
	
	"dont call 'model allMethods' here because it sorts the group and we dont care at this level"
	groups := ((model allWithType: self importer factory method) reject: #isAbstract) asOrderedCollection groupedBy: #signature
]
