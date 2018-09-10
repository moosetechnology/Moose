Extension { #name : #WindowMoved }

{ #category : #'*GT-Window-EventRecorder' }
WindowMoved >> asRecorderEvent [

	^ GTWindowRecorderWindowMovedEvent fromAnnouncement: self
]
