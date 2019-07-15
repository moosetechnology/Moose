Extension { #name : #CompiledMethod }

{ #category : #'*Moose-SmalltalkImporter' }
CompiledMethod >> mooseName [
	^ self mooseNameWithScope: false
]

{ #category : #'*Moose-SmalltalkImporter' }
CompiledMethod >> mooseNameWithScope: aboolean [

	| string |
	string := String streamContents: [:str | 
		str nextPutAll: self methodClass mooseName.
		str nextPut: $..
		str nextPutAll: self selector. 
		self signatureFromSmalltalkSelectorOn: str].
	^ string asSymbol
]

{ #category : #'*Moose-SmalltalkImporter' }
CompiledMethod >> signature [

	| ws |
	ws := WriteStream on: (String new: 150).
	ws nextPutAll: self selector.
	self signatureFromSmalltalkSelectorOn: ws.
	^ws contents asSymbol
]

{ #category : #'*Moose-SmalltalkImporter' }
CompiledMethod >> signatureFromSmalltalkSelectorOn: aStream [

	| sym numArgs |
	sym := self selector.
	numArgs := sym numArgs.
	aStream nextPut: $(.
	1
		to: numArgs
		do: [:inx | aStream nextPutAll: 'Object,'].
	numArgs > 0 ifTrue: [aStream skip: -1	"remove last space"].
	aStream nextPut: $).
	
]
