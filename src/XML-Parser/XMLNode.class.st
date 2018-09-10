"
This is a base class for XML nodes. It has testing messages, messages to access the parent, sibling, and ancestor nodes, and messages to control printing.
"
Class {
	#name : #XMLNode,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : #'XML-Parser-DOM'
}

{ #category : #visiting }
XMLNode >> acceptNodeVisitor: aNodeVisitor [
	^ self
]

{ #category : #deprecated }
XMLNode >> addContent: aStringOrStringNode [
	"will be deprecated"

	XMLDOMException signal: 'Node cannot contain string content'
]

{ #category : #enumerating }
XMLNode >> allNodesDo: aBlock [
	"evaluates aBlock for the receiver and all of its descendant nodes"

	aBlock value: self
]

{ #category : #accessing }
XMLNode >> ancestorElements [
	"returns a node list with all ancestor elements of the receiver"
	| ancestorElements |

	ancestorElements := self newListForSelect.
	self ancestorElementsDo: [:each | ancestorElements addLast: each].
	^ ancestorElements.
]

{ #category : #enumerating }
XMLNode >> ancestorElementsDo: aBlock [
	| ancestor |

	ancestor := self parent.
	[ancestor notNil
		and: [ancestor isElement]]
		whileTrue: [
			aBlock value: ancestor.
			ancestor := ancestor parent].
]

{ #category : #accessing }
XMLNode >> ancestorNodes [
	"returns a node list with all ancestor nodes of the receiver"
	| ancestors |

	ancestors := self newListForSelect.
	self ancestorNodesDo: [:each | ancestors addLast: each].
	^ ancestors.
]

{ #category : #enumerating }
XMLNode >> ancestorNodesDo: aBlock [
	| ancestor |

	ancestor := self parent.
	[ancestor notNil]
		whileTrue: [
			aBlock value: ancestor.
			ancestor := ancestor parent].
]

{ #category : #converting }
XMLNode >> asString [
	"don't assume Object>>#asString is defined, for portability"
	^ self printString
]

{ #category : #testing }
XMLNode >> canHaveChildren [
	"returns true if the receiver is a type of node that can have child nodes"

	^ false
]

{ #category : #testing }
XMLNode >> canonicallyEquals: aNode [
	"returns true if the receiver and aNode have the same canonical
	representation (http://www.w3.org/TR/xml-c14n)"

	^ self canonicallyPrinted = aNode canonicallyPrinted
]

{ #category : #printing }
XMLNode >> canonicallyPrintOn: aStream [
 	"Prints on aStream as canonical XML (http://www.w3.org/TR/xml-c14n)"

	self
		printOn: aStream
		beforeWritingDo: [:writer | writer isCanonical: true]
]

{ #category : #printing }
XMLNode >> canonicallyPrintToFileNamed: aFileName [
 	"Prints to the file aFileName as canonical XML (http://www.w3.org/TR/xml-c14n)"

	self
		printToFileNamed: aFileName
		beforeWritingDo: [:writer | writer isCanonical: true]
]

{ #category : #printing }
XMLNode >> canonicallyPrinted [
 	"Prints as canonical XML (http://www.w3.org/TR/xml-c14n)"

	^ String streamContents: [:stream | self canonicallyPrintOn: stream]
]

{ #category : #accessing }
XMLNode >> configuration [
	^ self parent ifNotNil: [:node | node configuration]
]

{ #category : #accessing }
XMLNode >> contentString [
 	"Returns a combined string of all descendant string values with spaces inserted
	for readability when one string has no trailing space and the next has no
	leading space.

	See also #rawContentString."

	^ String streamContents: [:stream | self printContentOn: stream]
]

{ #category : #copying }
XMLNode >> copy [
	"returns a deep copy of the receiver, including copies of any descendant nodes,
	and copies the config"

	^ self shallowCopy postCopy postCopyConfiguration
]

{ #category : #copying }
XMLNode >> copySharingConfiguration [	
	"returns a deep copy of the receiver, including copies of any descendant nodes,
	but does not copy the config"

	^ self shallowCopy postCopy
]

{ #category : #enumerating }
XMLNode >> descendantNodesDo: aBlock [
]

{ #category : #deprecated }
XMLNode >> descendentNodesDo: aBlock [
	self deprecated: 'use #descendantNodesDo: instead'.
	^ self descendantNodesDo: aBlock.
]

{ #category : #accessing }
XMLNode >> document [
	"returns the document node that the receiver belongs to (the receiver if it's a
	document) or nil if there isn't one"

	^ self parent ifNotNil: [:node | node document]
]

{ #category : #accessing }
XMLNode >> documentRoot [
	"returns the root of the DOM tree, a document node if there is one or the
	last ancestor or self otherwise"
	| documentRoot |

	documentRoot := self.
	self ancestorNodesDo: [:each | documentRoot := each].
	^ documentRoot.
]

{ #category : #private }
XMLNode >> errorXMLWritingUnsupported [
	XMLDOMException signal: 'The XMLWriter package is required for writng DOM objects'
]

{ #category : #private }
XMLNode >> escapesContentEntitiesWhenWriting [
	self hasParent
		ifTrue: [^ self parent escapesContentEntitiesWhenWriting]
		ifFalse: [^ true] "default to escaping"
]

{ #category : #testing }
XMLNode >> hasChildren [
	"returns true if the receiver has child nodes"

	^ false
]

{ #category : #private }
XMLNode >> hasNodeList: aNodeList [
	^ false
]

{ #category : #testing }
XMLNode >> hasParent [
	"returns true if the receiver has a parent node"

	^ parent notNil
]

{ #category : #private }
XMLNode >> hasParentWithNodeList: aNodeList [
	"optimized"
	parent == nil
		ifTrue: [^ false].
	^ parent hasNodeList: aNodeList.
]

{ #category : #private }
XMLNode >> initializeFileWriteStream: aWriteStream [
	"This sets a stream converter on aWriteStream based on the document's encoding
	attribute and writes the encoding's byte order mark."

	| document |

	aWriteStream
		streamConverter:
			(((document := self document) notNil
				and: [document hasEncoding])
				ifTrue: [document encoding asXMLStreamConverter]
				ifFalse: [XMLStreamConverter default]);
		nextPutByteOrderMark
]

{ #category : #testing }
XMLNode >> isAttribute [
	^ false
]

{ #category : #testing }
XMLNode >> isCData [
	^ false
]

{ #category : #private }
XMLNode >> isCoalescingStringNode [
	^ false
]

{ #category : #testing }
XMLNode >> isComment [
	^ false
]

{ #category : #testing }
XMLNode >> isContentNode [
	"returns true if the receiver is a content node (an element or string node)"

	^ false
]

{ #category : #testing }
XMLNode >> isDeclaration [
	^ false
]

{ #category : #testing }
XMLNode >> isDocument [
	^ false
]

{ #category : #testing }
XMLNode >> isElement [
	^ false
]

{ #category : #testing }
XMLNode >> isElementNamed: aName [
	"returns true if the receiver is an element whose qualified name or local
	name matches aName"

	^ false
]

{ #category : #testing }
XMLNode >> isElementNamedAny: aNameCollection [
	"returns true if the receiver is an element whose qualified name or local
	name matches any name in aNameCollection"

	^ false
]

{ #category : #testing }
XMLNode >> isInLanguage: aLanguageTag [
	"Returns true if one of the ancestor elements of the receiver has an xml:lang
	attribute, and if the value is an IETF language tag, like 'en-US', that matches
	aLanguageTag. Matching is case-insensitive, and aLanguageTag can be partial,
	like 'en', and use wildcards, like 'en-*'"

	^ self hasParent
		and: [self parent isInLanguage: aLanguageTag]
]

{ #category : #testing }
XMLNode >> isPI [
	"returns true if the receiver is a processing instruction node"

	^ false
]

{ #category : #testing }
XMLNode >> isStringNode [
	^ false
]

{ #category : #testing }
XMLNode >> isStringNode: aStringOrStringNode [
	^ false
]

{ #category : #'instance creation' }
XMLNode >> newCData: aString [
	^ self nodeFactory newCData: aString
]

{ #category : #'instance creation' }
XMLNode >> newComment: aString [
	^ self nodeFactory newComment: aString
]

{ #category : #'instance creation' }
XMLNode >> newDocument [
	^ self nodeFactory newDocument
		configuration: self configuration
]

{ #category : #'instance creation' }
XMLNode >> newElement [
	^ self nodeFactory newElement
		configuration: self configuration
]

{ #category : #'instance creation' }
XMLNode >> newElementNamed: aName [
	^ (self nodeFactory classForElement: aName) new
		configuration: self configuration;
		name: aName
]

{ #category : #'instance creation' }
XMLNode >> newElementNamed: aName attributes: anAssociationCollection [
	^ (self nodeFactory
		classForElement: aName
		attributes: anAssociationCollection) new
			configuration: self configuration;
			name: aName;
			setAttributes: anAssociationCollection
]

{ #category : #'instance creation' }
XMLNode >> newElementNamed: aName namespaceURI: aURI [
	^ (self nodeFactory
		classForElement: aName
		namespaceURI: aURI) new
			configuration: self configuration;
			name: aName namespaceURI: aURI
]

{ #category : #'instance creation' }
XMLNode >> newElementNamed: aName namespaceURI: aURI attributes: anAssociationCollection [
	^ (self nodeFactory
		classForElement: aName
		namespaceURI: aURI
		attributes: anAssociationCollection) new
			configuration: self configuration;
			name: aName namespaceURI: aURI;
			setAttributes: anAssociationCollection
]

{ #category : #'instance creation' }
XMLNode >> newListForCollect [
	"collect can return non-nodes, so a basic ordered list is used"
	^ XMLOrderedList new: 10
]

{ #category : #'instance creation' }
XMLNode >> newListForSelect [
	"select returns only nodes, so a node list is used"
	^ XMLNodeList new: 10
]

{ #category : #'instance creation' }
XMLNode >> newPI [
	^ self nodeFactory newPI
]

{ #category : #'instance creation' }
XMLNode >> newPITarget: aTargetString data: aDataString [
	^ self nodeFactory
		newPITarget: aTargetString
		data: aDataString
]

{ #category : #'instance creation' }
XMLNode >> newStringNode: aString [
	^ self nodeFactory newStringNode: aString
]

{ #category : #accessing }
XMLNode >> nextNode [
	"returns the first node after this one that is a child of the same parent (the next
	sibling) or nil if there isn't one"

	^ self parent ifNotNil: [:node | node nodeAfter: self]
]

{ #category : #accessing }
XMLNode >> nodeFactory [
	^ self configuration
		ifNil: [XMLNodeFactory new]
		ifNotNil: [:config | config nodeFactory]
]

{ #category : #accessing }
XMLNode >> parent [
	"returns the parent node of this node or nil if there isn't one"

	^ parent
]

{ #category : #private }
XMLNode >> parent: aNode [
	parent := aNode
]

{ #category : #defaults }
XMLNode >> parserHandlerClass [
	^ self configuration
		ifNil: [XMLDOMParser]
		ifNotNil: [:config | config parserHandlerClass]
]

{ #category : #copying }
XMLNode >> postCopy [
	super postCopy.

	parent := nil.
]

{ #category : #copying }
XMLNode >> postCopyConfiguration [
]

{ #category : #printing }
XMLNode >> prettyPrintOn: aStream [
 	"Prints XML on aStream with whitespace formatting for readability"

	self
		printOn: aStream
		beforeWritingDo: [:writer | writer enablePrettyPrinting]
]

{ #category : #printing }
XMLNode >> prettyPrintToFileNamed: aFileName [
 	"Prints XML to the file aFileName with whitespace formatting for readability"

	self
		printToFileNamed: aFileName
		beforeWritingDo: [:writer | writer enablePrettyPrinting]
]

{ #category : #printing }
XMLNode >> prettyPrinted [
 	"Prints XML with whitespace formatting for readability"

	^ String streamContents: [:stream | self prettyPrintOn: stream]
]

{ #category : #accessing }
XMLNode >> previousNode [
	"returns the first node before this one that is a child of the same parent
	(the preivous sibling) or nil if there isn't one"

	^ self parent ifNotNil: [:node | node nodeBefore: self]
]

{ #category : #printing }
XMLNode >> printContentOn: aStream [
 	"Prints on aStream the combined content strings of all descendants with
	space inserted when one string has no trailing space and the next has
	no leading space.

	See also #printRawContentOn:"

	self printRawContentOn: (XMLNodeContentWriteStreamAdapter on: aStream)
]

{ #category : #printing }
XMLNode >> printOn: aStream [
	"Uses XMLWriter if supported to print XML on aStream, uses the
	basic Object>>printOn: otherwise"

	self
		withNewXMLWriterOn: aStream
		do: [:writer |
			self writeXMLOn: writer.
			writer write]
		whenAbsent: [super printOn: aStream]
]

{ #category : #printing }
XMLNode >> printOn: aStream beforeWritingDo: aBlock [
	"Prints XML on aStream using an XMLWriter object it creates but first
	evaluates aBlock with the XMLWriter so it can be configured before writing.

	Raises an error without XMLWriter support."

	self
		withNewXMLWriterOn: aStream
		do: [:writer |
			aBlock value: writer.
			self writeXMLOn: writer.
			writer write]
]

{ #category : #printing }
XMLNode >> printRawContentOn: aStream [ 
 	"Prints on aStream the content strings of all descendants
	without spaces inserted.

	See also #printContentOn:"
]

{ #category : #printing }
XMLNode >> printToFileNamed: aFileName [
	"Prints XML to the file aFileName. Uses the encoding specified in the
	document's encoding attribute if supported or UTF-8 otherwise."

	self
		withNewWriteStreamOnFileNamed: aFileName
		do: [:writeStream |
			self
				printOn: writeStream
				beforeWritingDo: [:writer |
					"use the platform's line break because we're writing to a file"
					writer enablePlatformSpecificLineBreak]]
]

{ #category : #printing }
XMLNode >> printToFileNamed: aFileName beforeWritingDo: aBlock [
	"Prints XML to the file aFileName after evaluating aBlock with the XMLWriter.
	Uses the encoding specified in the document's encoding attribute if
	supported or UTF-8 otherwise."

	self
		withNewWriteStreamOnFileNamed: aFileName
		do: [:writeStream |
			self
				printOn: writeStream
				beforeWritingDo: [:writer |
					"use the platform's line break because we're writing to a file"
					writer enablePlatformSpecificLineBreak.
					aBlock value: writer]]
]

{ #category : #printing }
XMLNode >> printWithoutSelfClosingTagsOn: aStream [
	"Prints XML on aStream with empty elements rendered as '<empty></empty>'
	instead of self-closing '<empty/>' tags"

	self
		printOn: aStream
		beforeWritingDo: [:writer | writer outputsSelfClosingTags: false]
]

{ #category : #printing }
XMLNode >> printWithoutSelfClosingTagsToFileNamed: aFileName [
	"Prints XML to the file aFileName with empty elements rendered
	as '<empty></empty>' instead of self-closing '<empty/>' tags"

	self
		printToFileNamed: aFileName
		beforeWritingDo: [:writer | writer outputsSelfClosingTags: false]
]

{ #category : #printing }
XMLNode >> printedWithoutSelfClosingTags [
	"Prints XML with empty elements rendered as '<empty></empty>' instead
	of self-closing '<empty/>' tags"

	^ String streamContents: [:stream | self printWithoutSelfClosingTagsOn: stream]
]

{ #category : #accessing }
XMLNode >> rawContentString [
 	"Returns a combined string of all descendant string values without any spaces
	inserted for readability.
	
	See also #contentString"

	^ String streamContents: [:stream | self printRawContentOn: stream]
]

{ #category : #accessing }
XMLNode >> sortKey [
	"used to compare nodes when sorting"

	^ self class name asString
]

{ #category : #validating }
XMLNode >> validate [
	"revalidate against the DTD it was parsed with (if any)"

	self document ifNotNil: [:document | document validate]
]

{ #category : #validating }
XMLNode >> validateWith: aValidator [
	"revalidate against a custom DTD or other validator"

	self document ifNotNil: [:document | document validateWith: aValidator]
]

{ #category : #private }
XMLNode >> withNewWriteStreamOnFileNamed: aFileName do: aBlock [
	aFileName asXMLFileHandle writeStreamDo: [:writeStream |
		self initializeFileWriteStream: writeStream.
		aBlock value: writeStream]
]

{ #category : #private }
XMLNode >> withNewXMLWriterOn: aStream do: aOneArgBlock [
	^ self
		withNewXMLWriterOn: aStream
		do: aOneArgBlock
		whenAbsent: [self errorXMLWritingUnsupported]
]

{ #category : #private }
XMLNode >> withNewXMLWriterOn: aStream do: aOneArgBlock whenAbsent: aZeroArgBlock [
	| writer |

	writer :=
		(self xmlWriterClassOrNil
			ifNil: [^ aZeroArgBlock value]) on: aStream.
	self escapesContentEntitiesWhenWriting
		ifFalse: [writer escapesContentEntityReferences: false].
	^ aOneArgBlock value: writer.
]

{ #category : #printing }
XMLNode >> writeXMLOn: aWriter [
	"Template method used by nodes to write themselves on XMLWriters.

	Sending with a customized XMLWriter instance as the argument can be used
	to customize printing, but #printOn:beforeWritingDo: should be preferred."
]

{ #category : #defaults }
XMLNode >> xmlWriterClassOrNil [
	"can be overridden to return a custom XMLWriter subclass"

	^ XMLClassFinder classNamed: #XMLWriter
]
