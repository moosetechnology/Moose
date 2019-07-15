Extension { #name : #SpecWindow }

{ #category : #'*GT-Window-EventRecorder' }
SpecWindow >> eventRecorderWindowType [

	^ super eventRecorderWindowType model ifNil: [ self ]
]
