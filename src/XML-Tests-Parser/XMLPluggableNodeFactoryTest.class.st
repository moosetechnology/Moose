Class {
	#name : #XMLPluggableNodeFactoryTest,
	#superclass : #XMLNodeFactoryTest,
	#category : #'XML-Tests-Parser-DOM-Factories'
}

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> attributeListClass [
	^ XMLFAttributeList
]

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> cdataClass [
	^ XMLFCData
]

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> commentClass [
	^ XMLFComment
]

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> documentClass [
	^ XMLFDocument
]

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> elementClass [
	^ XMLFElement
]

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> factoryClass [
	^ XMLPluggableNodeFactory
]

{ #category : #'instance creation' }
XMLPluggableNodeFactoryTest >> newFactoryWithClasses [
	^ self newFactory
		documentClass: self documentClass;
		elementClass: self elementClass;
		stringNodeClass: self stringNodeClass;
		cdataClass: self cdataClass;
		commentClass: self commentClass;
		piClass: self piClass
]

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> nodeListClass [
	^ XMLFNodeList
]

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> piClass [
	^ XMLFPI
]

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> pluggableFactoryClass [
	^ self factoryClass
]

{ #category : #accessing }
XMLPluggableNodeFactoryTest >> stringNodeClass [
	^ XMLFString
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testAttributeListClass [
	| factory |

	super testAttributeListClass.

	factory := self newFactoryWithClasses.
	self
		assert: (factory attributeListClass: self attributeListClass) == factory;
		assert: factory attributeListClass == self attributeListClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testCDataClass [
	super testCDataClass.

	self assert: self newFactoryWithClasses cdataClass == self cdataClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testClassForElement [
	super testClassForElement.

	self assert: (self newFactoryWithClasses classForElement: 'test') == self elementClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testClassForElementNamespaceURI [
	super testClassForElementNamespaceURI.

	self assert:
		(self newFactoryWithClasses
			classForElement: 'test'
			namespaceURI: '') == self elementClass.
	self assert:
		(self newFactoryWithClasses
			classForElement: 'test'
			namespaceURI: 'testNS') == self elementClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testCommentClass [
	super testCommentClass.

	self assert: self newFactoryWithClasses commentClass == self commentClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testDocumentClass [
	super testDocumentClass.

	self assert: self newFactoryWithClasses documentClass == self documentClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testElementClass [
	super testElementClass.

	self assert: self newFactoryWithClasses elementClass == self elementClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNewCData [
	| cdata |

	super testNewCData.

	cdata := self newFactoryWithClasses newCData: 'test'.
	self
		assert: cdata class == self cdataClass;
		assert: cdata string = 'test'.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNewComment [
	| comment |
	
	super testNewComment.

	comment := self newFactoryWithClasses newComment: 'test'.
	self
		assert: comment class == self commentClass;
		assert: comment string = 'test'.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNewDocument [
	super testNewDocument.

	self assert: self newFactoryWithClasses newDocument class == self documentClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNewElement [
	super testNewElement.

	self assert: self newFactoryWithClasses newElement class == self elementClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNewElementNamed [
	| element |

	super testNewElementNamed.

	element := self newFactoryWithClasses newElementNamed: 'test'.
	self
		assert: element class == self elementClass;
		assert: element name = 'test'.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNewElementNamedNamespaceURI [
	| element |

	super testNewElementNamedNamespaceURI.

	element :=
		self newFactoryWithClasses
			newElementNamed: 'prefix:test'
			namespaceURI: 'prefixNS'.
	self
		assert: element class == self elementClass;
		assert: element name = 'prefix:test';
		assert: element namespaceURI = 'prefixNS'.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNewPI [
	super testNewPI.

	self assert: self newFactoryWithClasses newPI class == self piClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNewPITargetData [
	| pi |

	super testNewPITargetData.

	pi :=
		self newFactoryWithClasses
			newPITarget: 'target'
			data: 'data'.
	self
		assert: pi class == self piClass;
		assert: pi target = 'target';
		assert: pi data = 'data'.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNewStringNode [
	| string |

	super testNewStringNode.

	string := self newFactoryWithClasses newStringNode: 'test'.
	self
		assert: string class == self stringNodeClass;
		assert: string string = 'test'.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testNodeListClass [
	| factory |

	super testNodeListClass.

	factory := self newFactoryWithClasses.
	self
		assert: (factory nodeListClass: self nodeListClass) == factory;
		assert: factory nodeListClass == self nodeListClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testPIClass [
	super testPIClass.

	self assert: self newFactoryWithClasses piClass == self piClass.
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testParsingSample [
	| document factory |

	factory := self newFactoryWithClasses.
	document :=
		(XMLDOMParser on: self sampleUserXML)
			nodeFactory: factory;
			preservesCDataNodes: true;
			preservesCommentNodes: true;
			parseDocument.
	self
		assert: document class == self documentClass;
		assert: document nodeFactory == factory.

	document allElementsDo: [:each |
		self
			assert: each class == self elementClass;
			assert: each nodeFactory == factory].

	document allNodesDo: [:each |
		each isStringNode
			ifTrue: [
				self assert:
					each class == 
						(each isCData
							ifTrue: [self cdataClass]
							ifFalse: [self stringNodeClass])].
		each isComment
			ifTrue: [self assert: each class == self commentClass].
		each isPI
			ifTrue: [self assert: each class == self piClass]].
]

{ #category : #tests }
XMLPluggableNodeFactoryTest >> testStringNodeClass [
	super testStringNodeClass.

	self assert: self newFactoryWithClasses stringNodeClass == self stringNodeClass.
]
