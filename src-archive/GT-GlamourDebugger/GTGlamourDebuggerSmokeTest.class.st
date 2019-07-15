Class {
	#name : #GTGlamourDebuggerSmokeTest,
	#superclass : #GTDebuggerSmokeTest,
	#category : #'GT-GlamourDebugger'
}

{ #category : #accessing }
GTGlamourDebuggerSmokeTest >> debuggerToTest [

	^ GTGlamourDebugger
]

{ #category : #utils }
GTGlamourDebuggerSmokeTest >> stepToStartOnContext [

	^ [:aProcess |
	aProcess 
		step;
		step;
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		step; "send openOn:"
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		step; "send openOn:with:"
		completeStep: aProcess suspendedContext;
		completeStep: aProcess suspendedContext;
		step "send startOn:" ]
]

{ #category : #tests }
GTGlamourDebuggerSmokeTest >> testDebugger [

	self 
		assertDebuggerInitializationForContext: [GLMBasicExamples open] asContext 
		andStepBlock: self stepToStartOnContext.

 	self assertDebuggerClosing.
]
