Extension { #name : #Timespan }

{ #category : #'*moose-hismoimporter' }
Timespan >> next: aNumber [

	| timespan |
	timespan := self.
	1 to: aNumber do: [ :each |
		timespan := timespan next ].
	
	^ timespan
]
