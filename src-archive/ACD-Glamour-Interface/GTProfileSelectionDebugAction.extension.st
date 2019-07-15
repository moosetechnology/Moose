Extension { #name : #GTProfileSelectionDebugAction }

{ #category : #'*ACD-Glamour-Interface' }
GTProfileSelectionDebugAction class >> gtACDSenderActionFor: aDebugger [
	<gtContextACDSenderDebuggingAction>
	
	^ (self gtActionFor: aDebugger)
		codePresentationSelector: #senderCodePresentation
]
