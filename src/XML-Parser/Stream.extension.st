Extension { #name : #Stream }

{ #category : #'*XML-Parser' }
Stream >> isXMLBinaryOrExternalStream [
	^ self isBinary
]

{ #category : #'*XML-Parser' }
Stream >> parseXML [
	^ XMLDOMParser parse: self
]
