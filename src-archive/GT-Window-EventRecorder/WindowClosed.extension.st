Extension { #name : #WindowClosed }

{ #category : #'*GT-Window-EventRecorder' }
WindowClosed >> asRecorderEvent [

	^ GTWindowRecorderWindowClosedEvent fromAnnouncement: self
]
