Extension { #name : #GTPrintSelectionDebugAction }

{ #category : #'*ACD-Glamour-Interface' }
GTPrintSelectionDebugAction class >> gtACDSenderActionFor: aDebugger [
	<gtContextACDSenderDebuggingAction>
	
	^ (self gtActionFor: aDebugger)
		codePresentationSelector: #senderCodePresentation
]
