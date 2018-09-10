Extension { #name : #GTInspectSelectionDebugAction }

{ #category : #'*ACD-Glamour-Interface' }
GTInspectSelectionDebugAction class >> gtACDSenderActionFor: aDebugger [
	<gtContextACDSenderDebuggingAction>
	
	^ (self gtActionFor: aDebugger)
		codePresentationSelector: #senderCodePresentation
]
