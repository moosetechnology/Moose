Extension { #name : #SystemWindow }

{ #category : #'*GT-Window-EventRecorder' }
SystemWindow >> eventRecorderWindowType [

	^ model ifNil: [ self ]
]
