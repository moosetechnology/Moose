Extension { #name : #Symbol }

{ #category : #'*PetitGui' }
Symbol >> spotterPreviewForPPProductionsIn: aComposite inContext: aSpotter [
	<spotterPreview: 5>
	(aSpotter currentStep origin isKindOf: PPCompositeParser) ifFalse: [ ^ self ].
	
	aComposite pharoMethod
		display: [:selector | 
			' ', (aSpotter currentStep origin class lookupSelector: selector) getSource];
		smalltalkClass: [aSpotter currentStep origin class];
		entity: self.
		
]
