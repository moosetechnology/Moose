Class {
	#name : #GTDebuggingStone,
	#superclass : #Object,
	#instVars : [
		'pragma',
		'session'
	],
	#category : #'GT-GlamourDebugger'
}

{ #category : #'instance creation' }
GTDebuggingStone class >> forPragma: aPragma forSession: aSession [

	^ self new forPragma: aPragma forSession: aSession
]

{ #category : #selectors }
GTDebuggingStone >> actionSelector [

	^ ('stepTo', (pragma argumentAt: 1) capitalized) asSymbol
]

{ #category : #selectors }
GTDebuggingStone >> activeSelector [

	^ ('is', (pragma argumentAt: 1) capitalized, 'Valid') asSymbol
]

{ #category : #actions }
GTDebuggingStone >> completeAction [

	^ self perform: self actionSelector withEnoughArguments: (Array with: self session context)
]

{ #category : #initialization }
GTDebuggingStone >> forPragma: aPragma forSession: aSession [
	
	pragma := aPragma.
	session := aSession
]

{ #category : #testing }
GTDebuggingStone >> isActive [

	^ (self class canUnderstand: self activeSelector) 	
		ifFalse: [ true ]
		ifTrue: [ self perform: self activeSelector ]
]

{ #category : #testing }
GTDebuggingStone >> reachedTarget [

	^ (self class canUnderstand: self tagetSelector) 	
		ifFalse: [ true ]
		ifTrue: [ self perform: self tagetSelector ]
]

{ #category : #accessing }
GTDebuggingStone >> session [

	^ session
]

{ #category : #selectors }
GTDebuggingStone >> tagetSelector [

	^ ('has', (pragma argumentAt: 1) capitalized, 'ReachedTarget') asSymbol
]
