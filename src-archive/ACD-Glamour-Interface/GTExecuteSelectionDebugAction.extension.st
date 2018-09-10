Extension { #name : #GTExecuteSelectionDebugAction }

{ #category : #'*ACD-Glamour-Interface' }
GTExecuteSelectionDebugAction class >> gtACDSenderActionFor: aDebugger [
	<gtContextACDSenderDebuggingAction>
	
	^ (self gtActionFor: aDebugger)
		codePresentationSelector: #senderCodePresentation
]
