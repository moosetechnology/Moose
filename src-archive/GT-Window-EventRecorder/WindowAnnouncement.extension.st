Extension { #name : #WindowAnnouncement }

{ #category : #'*GT-Window-EventRecorder' }
WindowAnnouncement >> asRecorderEvent [

	^ GTWindowRecorderEvent fromAnnouncement: self
]
