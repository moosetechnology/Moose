Class {
	#name : #XMLStringReadStreamAdapterTest,
	#superclass : #XMLReadStreamAdapterTest,
	#category : #'XML-Tests-Parser-Streams'
}

{ #category : #testing }
XMLStringReadStreamAdapterTest >> expectsBinaryOutput [
	^ true
]

{ #category : #accessing }
XMLStringReadStreamAdapterTest >> streamAdapterClass [
	^ XMLStringReadStreamAdapter
]
