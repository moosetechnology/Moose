"
This class records the second element events (#startElement:prefix:uri:attributes: and #endElement:prefix:uri:) used when the first aren't defined.
"
Class {
	#name : #SAXRecordingPrefixURIHandler,
	#superclass : #SAXRecordingHandler,
	#category : #'XML-Tests-Parser'
}

{ #category : #'handling - content' }
SAXRecordingPrefixURIHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI [
	self
		recordMessageReceiver: self
		selector: #endElement:prefix:uri:
		arguments:
			(OrderedCollection new
				addLast: aQualifiedName;
				addLast: aPrefix;
				addLast: aURI;
				yourself)
]

{ #category : #'handling - content' }
SAXRecordingPrefixURIHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI attributes: anAttributeDictionary [
	self
		recordMessageReceiver: self
		selector: #startElement:prefix:uri:attributes:
		arguments:
			(OrderedCollection new
				addLast: aQualifiedName;
				addLast: aPrefix;
				addLast: aURI;
				addLast: anAttributeDictionary;
				yourself)
]
