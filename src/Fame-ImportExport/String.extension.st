Extension { #name : #String }

{ #category : #'*Fame-ImportExport' }
String >> fm3PrintOn: stream [
	stream nextPut: $'.
	self do: [ :char |
		$' == char ifTrue: [ 
			stream nextPut: char ].
		stream nextPut: char ].
	stream nextPut: $'.
]
