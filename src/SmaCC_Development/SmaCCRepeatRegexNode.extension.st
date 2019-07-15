Extension { #name : #SmaCCRepeatRegexNode }

{ #category : #'*SmaCC_Development' }
SmaCCRepeatRegexNode >> asRegularExpression [
	| re |
	re := self regex regularExpression.
	count value = '*'
		ifTrue: [ ^ re repeat ].
	count value = '+'
		ifTrue: [ ^ re repeatForAtLeast: 1 ].
	count value = '?'
		ifTrue: [ ^ re repeatFor: 0 to: 1 ].
	count value first = ${
		ifTrue: [ | readStream start stop |
			readStream := ReadStream on: (count value copyFrom: 2 to: count value size - 1).
			start := readStream upTo: $,.
			stop := readStream upToEnd.
			^ re
				repeatFor:
					(start isEmpty
						ifTrue: [ 0 ]
						ifFalse: [ start asNumber ])
				to:
					(stop isEmpty
						ifTrue: [ 1 bitShift: 31 ]
						ifFalse: [ stop asNumber ]) ].
	self reportCountError
]

{ #category : #'*SmaCC_Development' }
SmaCCRepeatRegexNode >> reportCountError [
	SmaCCParserError new
		messageText: 'Unknown repeat count';
		tag: count;
		signal
]
