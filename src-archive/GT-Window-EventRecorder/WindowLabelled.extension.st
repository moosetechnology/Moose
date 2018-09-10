Extension { #name : #WindowLabelled }

{ #category : #'*GT-Window-EventRecorder' }
WindowLabelled >> asRecorderEvent [

	^ GTWindowRecorderWindowLabelledEvent fromAnnouncement: self
]
