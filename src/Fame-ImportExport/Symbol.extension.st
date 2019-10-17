Extension { #name : #Symbol }

{ #category : #'*Fame-ImportExport' }
Symbol >> fm3PrintOn: aStream [
	| x |
	aStream nextPut: $'.
	1 to: self size do: [ :i | 
		aStream nextPut: (x := self at: i).
		x = $' ifTrue: [ aStream nextPut: x ] ].
	aStream nextPut: $'
]
