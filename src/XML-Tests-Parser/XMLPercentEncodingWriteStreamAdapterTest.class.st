Class {
	#name : #XMLPercentEncodingWriteStreamAdapterTest,
	#superclass : #XMLWriteStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #accessing }
XMLPercentEncodingWriteStreamAdapterTest >> basicOutputCollection [
	^ String streamContents: [:stream |
		super basicOutputCollection do: [:each |
			stream nextPutAll:
				(self class percentEncodeCharacter: each)]]
]

{ #category : #converting }
XMLPercentEncodingWriteStreamAdapterTest >> contentsFromCharacter: aCharacter [
	^ self class percentEncodeCharacter: aCharacter
]

{ #category : #testing }
XMLPercentEncodingWriteStreamAdapterTest >> expectsBinaryInput [
	^ true
]

{ #category : #accessing }
XMLPercentEncodingWriteStreamAdapterTest >> streamAdapterClass [
	^ XMLPercentEncodingWriteStreamAdapter
]
