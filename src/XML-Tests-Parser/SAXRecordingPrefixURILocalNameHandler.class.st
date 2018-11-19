"
This class records the first element events (#startElement:prefix:uri:attributes:localName: and #endElement:prefix:uri:localName:) sent before the others.
"
Class {
	#name : #SAXRecordingPrefixURILocalNameHandler,
	#superclass : #SAXRecordingPrefixURIHandler,
	#category : #'XML-Tests-Parser'
}

{ #category : #'handling - content' }
SAXRecordingPrefixURILocalNameHandler >> endElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName [
	self
		recordMessageReceiver: self
		selector: #endElement:prefix:uri:localName:
		arguments:
			(OrderedCollection new
				addLast: aQualifiedName;
				addLast: aPrefix;
				addLast: aURI;
				addLast: aLocalName;
				yourself)
]

{ #category : #'handling - content' }
SAXRecordingPrefixURILocalNameHandler >> startElement: aQualifiedName prefix: aPrefix uri: aURI localName: aLocalName attributes: anAttributeDictionary [
	self
		recordMessageReceiver: self
		selector: #startElement:prefix:uri:localName:attributes:
		arguments:
			(OrderedCollection new
				addLast: aQualifiedName;
				addLast: aPrefix;
				addLast: aURI;
				addLast: aLocalName;
				addLast: anAttributeDictionary;
				yourself)
]
