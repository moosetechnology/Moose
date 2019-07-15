Extension { #name : #Point }

{ #category : #'*Grease-Pharo30-Core' }
Point >> greaseString [
	"Reimplemented because in Pharo 1.4
	(4 @ 2) greaseString
	ansers  '(4@2)'"
	^ String streamContents: [ :stream |
		x printOn: stream.
		stream nextPut: $@.
		(y notNil and: [ y negative ])
			ifTrue: [
				"Avoid ambiguous @- construct"
				stream space ].
		y printOn: stream ]
]
