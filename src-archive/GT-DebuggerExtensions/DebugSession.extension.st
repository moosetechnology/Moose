Extension { #name : #DebugSession }

{ #category : #'*GT-DebuggerExtensions' }
DebugSession >> createPredicateForBlock: aBlock [ 

	^ BlockContextPredicate for: aBlock
]

{ #category : #'*GT-DebuggerExtensions' }
DebugSession >> createStepPredicateForBlock: aBlock [ 

	^ self createStepPredicatForPredicate: (self createPredicatForBlock: aBlock)
			
]

{ #category : #'*GT-DebuggerExtensions' }
DebugSession >> createStepPredicateForPredicate: aPredicate [
	" Subclasses should specialize this method if needed. "
	^ aPredicate
]

{ #category : #'*GT-DebuggerExtensions' }
DebugSession >> createStepPredicateForPredicate: aPredicate fromContext: targetContext [

	^ (self createPredicateForBlock: [ :currentContext |
		(self isActive: targetContext) not or: [ currentContext isHaltContext ] ]) 
			or: aPredicate
	
]

{ #category : #'*GT-DebuggerExtensions' }
DebugSession >> stepUntil: aPredicate from: aContext [ 
	| ctxt |
	
	ctxt := self process stepUntil: (self createStepPredicateForPredicate: aPredicate) from: aContext.
	self  
		updateWithContext: ctxt 
		fromProcess: self process.
]
