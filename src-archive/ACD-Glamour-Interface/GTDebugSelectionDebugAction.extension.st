Extension { #name : #GTDebugSelectionDebugAction }

{ #category : #'*ACD-Glamour-Interface' }
GTDebugSelectionDebugAction class >> gtACDSenderActionFor: aDebugger [
	<gtContextACDSenderDebuggingAction>
	
	^ (self gtActionFor: aDebugger)
		codePresentationSelector: #senderCodePresentation
]
