Extension { #name : #WindowDeActivated }

{ #category : #'*GT-Window-EventRecorder' }
WindowDeActivated >> asRecorderEvent [

	^ GTWindowRecorderWindowDeActivatedEvent fromAnnouncement: self
]
