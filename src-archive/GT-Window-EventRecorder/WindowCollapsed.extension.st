Extension { #name : #WindowCollapsed }

{ #category : #'*GT-Window-EventRecorder' }
WindowCollapsed >> asRecorderEvent [

	^ GTWindowRecorderWindowCollapsedEvent fromAnnouncement: self
]
