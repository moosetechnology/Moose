Extension { #name : #SmaCCScanner }

{ #category : #'*SmaCC_Debugging_Support' }
SmaCCScanner >> debugSource [
	| str position |
	str := self stream.
	(str respondsTo: #position:)
		ifFalse: [ ^ '' ].
	position := str position.
	^ [ str position: 0.
	str contents ]
		ensure: [ str position: position ]
]
