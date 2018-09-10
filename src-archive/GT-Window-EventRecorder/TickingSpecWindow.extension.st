Extension { #name : #TickingSpecWindow }

{ #category : #'*GT-Window-EventRecorder' }
TickingSpecWindow >> eventRecorderWindowType [

	^ super eventRecorderWindowType model ifNil: [ self ]
]
