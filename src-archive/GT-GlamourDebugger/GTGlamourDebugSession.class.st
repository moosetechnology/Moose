Class {
	#name : #GTGlamourDebugSession,
	#superclass : #DebugSession,
	#instVars : [
		'rootBrowserContext'
	],
	#category : #'GT-GlamourDebugger'
}

{ #category : #'predicates creation' }
GTGlamourDebugSession >> createStepPredicateForPredicate: aPredicate [ 

	^ (self createPredicateForBlock: [ self isActive not ]) or: aPredicate
	
]

{ #category : #testing }
GTGlamourDebugSession >> isActive [

	^ rootBrowserContext  
		ifNil: [ false ] 
		ifNotNil: [ 
			rootBrowserContext isDead not and: [
				
				rootBrowserContext ~= self process suspendedContext or: [rootBrowserContext willReturn not ]
				
				 ]  ]
]

{ #category : #initialization }
GTGlamourDebugSession >> process: aProcess context: aContext [

	super process: aProcess context: aContext.
	
	self flag: 'Have a method that is only called when the session is created and put this there'.
	rootBrowserContext ifNil:  [
		rootBrowserContext := aContext locateBrowserContext ]
]

{ #category : #accessing }
GTGlamourDebugSession >> rootBrowser [

	^ rootBrowserContext receiver
]

{ #category : #accessing }
GTGlamourDebugSession >> rootBrowserContext [

	^ rootBrowserContext
]
