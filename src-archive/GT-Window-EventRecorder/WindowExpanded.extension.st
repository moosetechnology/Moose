Extension { #name : #WindowExpanded }

{ #category : #'*GT-Window-EventRecorder' }
WindowExpanded >> asRecorderEvent [

	^ GTWindowRecorderWindowExpandedEvent fromAnnouncement: self
]
