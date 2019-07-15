Extension { #name : #WindowActivated }

{ #category : #'*GT-Window-EventRecorder' }
WindowActivated >> asRecorderEvent [

	^ GTWindowRecorderWindowActivatedEvent fromAnnouncement: self
]
