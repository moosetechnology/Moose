"
This class records the final element events (startElement:attributes: and #endElement:) used when no others are defined, as well as every other non-element event.
"
Class {
	#name : #SAXRecordingHandler,
	#superclass : #SAXHandler,
	#instVars : [
		'messageRecorder'
	],
	#category : #'XML-Tests-Parser'
}

{ #category : #private }
SAXRecordingHandler class >> generateRecordingHandlerMethods [
	"
	self generateRecordingHandlerMethods
	"

	#(#'handling - content'
		#'handling - lexical'
		#'handling - declaration')
		do: [:handlerCategory |
			(SAXHandler selectorsInCategory: handlerCategory) do: [:handlerSelector | | parsedMethod sourceStream |
				parsedMethod := RBParser parseMethod: (SAXHandler sourceCodeAt: handlerSelector).
				(sourceStream := String new writeStream)
					nextPutAll: parsedMethod selectorAndArgumentNames;
					cr;
					nextPutAll: '	self messageRecorder';
					cr;
					nextPutAll: '		recordMessageReceiver: self';
					cr;
					nextPutAll: '		selector: #', handlerSelector asString.
				parsedMethod arguments
					ifNotEmpty: [
						sourceStream
							cr;
							nextPutAll: '		arguments:';
							cr;
							nextPutAll: '			(OrderedCollection new'.
						parsedMethod argumentNames do: [:each |
							sourceStream
								cr;
								nextPutAll: '				addLast: ', each, ';'].
						sourceStream
							cr;
							nextPutAll: '				yourself)'].

				self
					compile: sourceStream contents
					classified: handlerCategory]]
]

{ #category : #accessing }
SAXRecordingHandler >> allSentMessages [
	^ self messageRecorder messages asArray
]

{ #category : #accessing }
SAXRecordingHandler >> allSentMessagesNamed: aName [
	^ (self messageRecorder messagesSelect: [:each |
		each selector = aName asSymbol]) asArray
]

{ #category : #accessing }
SAXRecordingHandler >> allSentSelectors [
	^ (self messageRecorder messagesCollect: [:each |
		each selector]) asArray
]

{ #category : #accessing }
SAXRecordingHandler >> argumentsSentWith: aSelector [
	self messageRecorder messagesDo: [:each |
		each selector = aSelector
			ifTrue: [^ each arguments]].
	^ #().
]

{ #category : #'handling - declaration' }
SAXRecordingHandler >> attributeDeclaration: anElementName name: anAttributeName type: aType defaultPragma: aDefaultPragma defaultValue: aDefaultValue [
	self
		recordMessageReceiver: self
		selector: #attributeDeclaration:name:type:defaultPragma:defaultValue:
		arguments:
			(OrderedCollection new
				addLast: anElementName;
				addLast: anAttributeName;
				addLast: aType;
				addLast: aDefaultPragma;
				addLast: aDefaultValue;
				yourself)
]

{ #category : #'handling - content' }
SAXRecordingHandler >> characters: aString [
	self
		recordMessageReceiver: self
		selector: #characters:
		arguments:
			(OrderedCollection new
				addLast: aString;
				yourself)
]

{ #category : #'handling - lexical' }
SAXRecordingHandler >> comment: aString [
	self
		recordMessageReceiver: self
		selector: #comment:
		arguments:
			(OrderedCollection new
				addLast: aString;
				yourself)
]

{ #category : #'handling - declaration' }
SAXRecordingHandler >> elementDeclaration: anElementName contentModel: aContentModel [
	self
		recordMessageReceiver: self
		selector: #elementDeclaration:contentModel:
		arguments:
			(OrderedCollection new
				addLast: anElementName;
				addLast: aContentModel;
				yourself)
]

{ #category : #'handling - lexical' }
SAXRecordingHandler >> endCData [
	self
		recordMessageReceiver: self
		selector: #endCData
]

{ #category : #'handling - lexical' }
SAXRecordingHandler >> endDTD [
	self
		recordMessageReceiver: self
		selector: #endDTD
]

{ #category : #'handling - content' }
SAXRecordingHandler >> endDocument [
	self
		recordMessageReceiver: self
		selector: #endDocument
]

{ #category : #'handling - content' }
SAXRecordingHandler >> endElement: aQualifiedName [
	self
		recordMessageReceiver: self
		selector: #endElement:
		arguments:
			(OrderedCollection new
				addLast: aQualifiedName;
				yourself)
]

{ #category : #'handling - lexical' }
SAXRecordingHandler >> endEntity: anEntityName [
	self
		recordMessageReceiver: self
		selector: #endEntity:
		arguments:
			(OrderedCollection new
				addLast: anEntityName;
				yourself)
]

{ #category : #'handling - content' }
SAXRecordingHandler >> endPrefixMapping: aPrefix [
	self
		recordMessageReceiver: self
		selector: #endPrefixMapping:
		arguments:
			(OrderedCollection new
				addLast: aPrefix;
				yourself)
]

{ #category : #'handling - declaration' }
SAXRecordingHandler >> generalEntityDeclaration: aName publicID: aPublicID systemID: aSystemID ndata: aNotationName [
	self
		recordMessageReceiver: self
		selector: #generalEntityDeclaration:publicID:systemID:ndata:
		arguments:
			(OrderedCollection new
				addLast: aName;
				addLast: aPublicID;
				addLast: aSystemID;
				addLast: aNotationName;
				yourself)
]

{ #category : #'handling - declaration' }
SAXRecordingHandler >> generalEntityDeclaration: aName replacement: aReplacement [
	self
		recordMessageReceiver: self
		selector: #generalEntityDeclaration:replacement:
		arguments:
			(OrderedCollection new
				addLast: aName;
				addLast: aReplacement;
				yourself)
]

{ #category : #'handling - content' }
SAXRecordingHandler >> ignorableWhitespace: aString [
	self
		recordMessageReceiver: self
		selector: #ignorableWhitespace:
		arguments:
			(OrderedCollection new
				addLast: aString;
				yourself)
]

{ #category : #accessing }
SAXRecordingHandler >> messageRecorder [
	^ messageRecorder ifNil: [messageRecorder := XMLMessageRecorder new]
]

{ #category : #'handling - declaration' }
SAXRecordingHandler >> notationDeclaration: aName publicID: aPublicID systemID: aSystemID [
	self
		recordMessageReceiver: self
		selector: #notationDeclaration:publicID:systemID:
		arguments:
			(OrderedCollection new
				addLast: aName;
				addLast: aPublicID;
				addLast: aSystemID;
				yourself)
]

{ #category : #'handling - declaration' }
SAXRecordingHandler >> parameterEntityDeclaration: aName publicID: aPublicID systemID: aSystemID [
	self
		recordMessageReceiver: self
		selector: #parameterEntityDeclaration:publicID:systemID:
		arguments:
			(OrderedCollection new
				addLast: aName;
				addLast: aPublicID;
				addLast: aSystemID;
				yourself)
]

{ #category : #'handling - declaration' }
SAXRecordingHandler >> parameterEntityDeclaration: aName replacement: aReplacement [
	self
		recordMessageReceiver: self
		selector: #parameterEntityDeclaration:replacement:
		arguments:
			(OrderedCollection new
				addLast: aName;
				addLast: aReplacement;
				yourself)
]

{ #category : #'handling - content' }
SAXRecordingHandler >> processingInstruction: aTargetString data: aDataString [
	self
		recordMessageReceiver: self
		selector: #processingInstruction:data:
		arguments:
			(OrderedCollection new
				addLast: aTargetString;
				addLast: aDataString;
				yourself)
]

{ #category : #recording }
SAXRecordingHandler >> recordMessage: aMessage [
	self messageRecorder recordMessage: aMessage
]

{ #category : #recording }
SAXRecordingHandler >> recordMessageReceiver: anObject selector: aSelector [
	self messageRecorder
		recordMessageReceiver: anObject
		selector: aSelector
]

{ #category : #recording }
SAXRecordingHandler >> recordMessageReceiver: anObject selector: aSelector argument: anArgument [
	self messageRecorder
		recordMessageReceiver: anObject
		selector: aSelector
		argument: anArgument
]

{ #category : #recording }
SAXRecordingHandler >> recordMessageReceiver: anObject selector: aSelector arguments: aSequenceableCollection [
	self messageRecorder
		recordMessageReceiver: anObject
		selector: aSelector
		arguments: aSequenceableCollection
]

{ #category : #'handling - content' }
SAXRecordingHandler >> skippedEntity: anEntityName [
	self
		recordMessageReceiver: self
		selector: #skippedEntity:
		arguments:
			(OrderedCollection new
				addLast: anEntityName;
				yourself)
]

{ #category : #'handling - lexical' }
SAXRecordingHandler >> startCData [
	self
		recordMessageReceiver: self
		selector: #startCData
]

{ #category : #'handling - lexical' }
SAXRecordingHandler >> startDTD: aRootElementName publicID: aPublicID systemID: aSystemID [
	self
		recordMessageReceiver: self
		selector: #startDTD:publicID:systemID:
		arguments:
			(OrderedCollection new
				addLast: aRootElementName;
				addLast: aPublicID;
				addLast: aSystemID;
				yourself)
]

{ #category : #'handling - content' }
SAXRecordingHandler >> startDocument [
	self
		recordMessageReceiver: self
		selector: #startDocument
]

{ #category : #'handling - content' }
SAXRecordingHandler >> startElement: aQualifiedName attributes: anAttributeDictionary [
	self
		recordMessageReceiver: self
		selector: #startElement:attributes:
		arguments:
			(OrderedCollection new
				addLast: aQualifiedName;
				addLast: anAttributeDictionary;
				yourself)
]

{ #category : #'handling - lexical' }
SAXRecordingHandler >> startEntity: anEntityName [
	self
		recordMessageReceiver: self
		selector: #startEntity:
		arguments:
			(OrderedCollection new
				addLast: anEntityName;
				yourself)
]

{ #category : #'handling - content' }
SAXRecordingHandler >> startPrefixMapping: aPrefix uri: aURI [
	self
		recordMessageReceiver: self
		selector: #startPrefixMapping:uri:
		arguments:
			(OrderedCollection new
				addLast: aPrefix;
				addLast: aURI;
				yourself)
]

{ #category : #testing }
SAXRecordingHandler >> wasSentSelector: aSelector [
	^ self allSentSelectors includes: aSelector asSymbol
]

{ #category : #testing }
SAXRecordingHandler >> wasSentSelectors: aSelectorArray [
	^ self allSentSelectors = aSelectorArray asArray
]

{ #category : #'handling - lexical' }
SAXRecordingHandler >> xmlVersion: aVersionFloat encoding: anEncoding standalone: aBoolean [
	self
		recordMessageReceiver: self
		selector: #xmlVersion:encoding:standalone:
		arguments:
			(OrderedCollection new
				addLast: aVersionFloat;
				addLast: anEncoding;
				addLast: aBoolean;
				yourself)
]
