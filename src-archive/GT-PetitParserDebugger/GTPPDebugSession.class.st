Class {
	#name : #GTPPDebugSession,
	#superclass : #DebugSession,
	#instVars : [
		'rootParserContext'
	],
	#category : #'GT-PetitParserDebugger'
}

{ #category : #'predicates creation' }
GTPPDebugSession >> createStepPredicateForPredicate: aPredicate [ 

	^ self createStepPredicateForPredicate: aPredicate fromContext: rootParserContext
	
]

{ #category : #testing }
GTPPDebugSession >> isActive [

	^ self isActive: rootParserContext
]

{ #category : #testing }
GTPPDebugSession >> isActive: aContext [

	^ aContext 
		ifNil: [ false ] 
		ifNotNil: [ 
			aContext isDead not and: [
				aContext ~= self process suspendedContext or: [aContext willReturn not ] ] ]
]

{ #category : #testing }
GTPPDebugSession >> isPPParser: anObject [ 

	^ self isPPParserClass: anObject class
	
]

{ #category : #testing }
GTPPDebugSession >> isPPParserClass: aClass [

	^ aClass inheritsFrom: PPParser 

	
]

{ #category : #testing }
GTPPDebugSession >> isPPProduction: anObject [ 

	^ (anObject class includesBehavior: PPDelegateParser ) and: [ 
			anObject name notNil ]
	
]

{ #category : #predicates }
GTPPDebugSession >> namedProductionPredicate: anObject [
	""
	
	^ self createPredicateForBlock: [ :aContext |
		(self isPPProduction: aContext receiver) and: [ 
			anObject isNil or: [ 
				aContext receiver name = anObject ] ] ]
]

{ #category : #predicates }
GTPPDebugSession >> notDelegateParserClassPredicate [

	^ self createPredicateForBlock: [ :aContext |
		(self isPPParser: aContext receiver) and: [ 
			aContext receiver class ~= PPDelegateParser ] ]
]

{ #category : #predicates }
GTPPDebugSession >> parseMethodEntryPredicate [

	^ self createPredicateForBlock: [ :aContext |
			(self isPPParser: aContext receiver) and: [ 
				aContext selector = #parseOn: and: [ 
					aContext isInitialnstruction ] ] ]
]

{ #category : #predicates }
GTPPDebugSession >> parseMethodPredicate [

	^ self createPredicateForBlock: [ :aContext |
			(self isPPParser: aContext receiver) and: [ 
				aContext selector = #parseOn: ] ]
]

{ #category : #initialization }
GTPPDebugSession >> process: aProcess context: aContext [

	super process: aProcess context: aContext.
	
	self flag: 'Have a method that is only called when the session is created and put this there'.
	rootParserContext ifNil:  [
		rootParserContext := aContext locateRootPPParser]
]

{ #category : #accessing }
GTPPDebugSession >> rootParser [
	^ (rootParserContext tempAt: 1) debugRoot
]

{ #category : #accessing }
GTPPDebugSession >> rootParserContext [

	^ rootParserContext
]

{ #category : #'debugging actions' }
GTPPDebugSession >> stepOverInitialInstructionForContext: aContext [
	
	(self isActive and: [
		self parseMethodEntryPredicate matches: aContext ])  
			ifTrue: [ self stepInto ]
	
]

{ #category : #'debugging actions' }
GTPPDebugSession >> stepToNextNonDelegateParserFromContext: aContext [

	self 
		stepUntil: (self parseMethodEntryPredicate and: self notDelegateParserClassPredicate)
		from: aContext
]

{ #category : #'debugging actions' }
GTPPDebugSession >> stepToNextParserFromContext: aContext [

	self 
		stepUntil: self parseMethodEntryPredicate
		from: aContext
]

{ #category : #'debugging actions' }
GTPPDebugSession >> stepToNextProduction: aProduction fromContext: aContext [
	
	self 
		stepUntil: (self parseMethodEntryPredicate and: (self namedProductionPredicate: aProduction)) 
		from: aContext
]

{ #category : #accessing }
GTPPDebugSession >> stream [

	^ self streamFromContext: rootParserContext
]

{ #category : #accessing }
GTPPDebugSession >> streamFromContext: aContext [

	^ aContext tempAt: 1
]
