Extension { #name : #WindowOpened }

{ #category : #'*GT-Window-EventRecorder' }
WindowOpened >> asRecorderEvent [

	^ GTWindowRecorderWindowOpenedEvent fromAnnouncement: self
]
