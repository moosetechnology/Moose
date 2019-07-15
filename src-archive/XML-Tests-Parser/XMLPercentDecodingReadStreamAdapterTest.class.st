Class {
	#name : #XMLPercentDecodingReadStreamAdapterTest,
	#superclass : #XMLReadStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLPercentDecodingReadStreamAdapterTest >> basicInputCollection [
	^ String streamContents: [:stream |
		super basicInputCollection do: [:each |
			stream nextPutAll:
				(self class percentEncodeCharacter: each)]]
]

{ #category : #accessing }
XMLPercentDecodingReadStreamAdapterTest >> basicOutputCollection [
	^ 'test'
]

{ #category : #testing }
XMLPercentDecodingReadStreamAdapterTest >> expectsBinaryOutput [
	^ true
]

{ #category : #accessing }
XMLPercentDecodingReadStreamAdapterTest >> streamAdapterClass [
	^ XMLPercentDecodingReadStreamAdapter
]
