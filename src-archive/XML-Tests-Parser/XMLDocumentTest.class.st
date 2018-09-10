Class {
	#name : #XMLDocumentTest,
	#superclass : #XMLNodeWithElementsTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLDocumentTest class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
XMLDocumentTest >> newNodeWithElements [
	^ super newNodeWithElements
		doctypeDeclaration: (XMLDoctypeDeclaration new root: 'zero');
		yourself
]

{ #category : #accessing }
XMLDocumentTest >> nodeClass [
	^ XMLDocument
]

{ #category : #tests }
XMLDocumentTest >> testAcceptNodeVisitor [
	| visitor document message |

	visitor := XMLRecordingNodeVisitor new.
	document := self newNode.
	self
		assert: (document acceptNodeVisitor: visitor) == document;
		assert: visitor messageRecorder hasMessages.

	message := visitor messageRecorder nextMessage.
	self
		assert: message selector == #visitDocument:;
		assert: message arguments = (Array with: document);
		assert: visitor messageRecorder hasMessages.

	message := visitor messageRecorder nextMessage.
	self
		assert: message selector == #visitNodeWithElements:;
		assert: message arguments = (Array with: document);
		deny: visitor messageRecorder hasMessages.

	super testAcceptNodeVisitor.
]

{ #category : #tests }
XMLDocumentTest >> testDoctypeDeclaration [
	| document doctypeDeclaration newDocument |

	document := self newNode.
	self assert: document doctypeDeclaration isNil.

	doctypeDeclaration := XMLDoctypeDeclaration new.
	self
		assert: (document doctypeDeclaration: doctypeDeclaration) == document;
		assert: document doctypeDeclaration == doctypeDeclaration;
		assert: doctypeDeclaration parent == document.

	"adding a doctypeDeclaration from another doc should remove it from the
	other doc"
	newDocument := self newNode.
	self
		assert:
			(newDocument doctypeDeclaration: document doctypeDeclaration) ==
				newDocument;
		assert: newDocument doctypeDeclaration == doctypeDeclaration;
		assert: newDocument doctypeDeclaration parent == newDocument;
		assert: document doctypeDeclaration isNil.

	newDocument doctypeDeclaration: nil.
	self
		assert: newDocument doctypeDeclaration isNil;
		assert: doctypeDeclaration parent isNil.
]

{ #category : #tests }
XMLDocumentTest >> testDoctypeDefinition [
	| document doctypeDefinition |

	document := self newNode.
	self assert: document doctypeDefinition isNil.

	doctypeDefinition := DTDDoctypeDefinition new.
	self
		assert: (document doctypeDefinition: doctypeDefinition) == document;
		assert: document doctypeDefinition == doctypeDefinition.
]

{ #category : #tests }
XMLDocumentTest >> testDocument [
	| document |

	super testDocument.

	document := self newNode.
	self assert: document document == document.

	document := self newNodeWithElements.
	self assert: document document == document.
]

{ #category : #tests }
XMLDocumentTest >> testEncoding [
	| document |

	document := self newNode.
	self
		assert: document encoding = '';
		assert: (document encoding: 'UTF-8') == document;
		assert: document encoding = 'UTF-8'.
]

{ #category : #tests }
XMLDocumentTest >> testHasDoctypeDeclaration [
	| document |

	document := self newNode.
	self deny: document hasDoctypeDeclaration.

	document doctypeDeclaration: XMLDoctypeDeclaration new.	
	self assert: document hasDoctypeDeclaration.

	document doctypeDeclaration: nil.
	self deny: document hasDoctypeDeclaration.
]

{ #category : #tests }
XMLDocumentTest >> testHasDoctypeDefinition [
	| document |

	document := self newNode.
	self deny: document hasDoctypeDefinition.

	document doctypeDefinition: DTDDoctypeDefinition new.
	self assert: document hasDoctypeDefinition.

	document doctypeDefinition: nil.
	self deny: document hasDoctypeDefinition.
]

{ #category : #tests }
XMLDocumentTest >> testHasEncoding [
	| document |

	document := self newNode.
	self deny: document hasEncoding.

	document encoding: 'UTF-8'.
	self assert: document hasEncoding.

	document encoding: ''.
	self deny: document hasEncoding.
]

{ #category : #tests }
XMLDocumentTest >> testHasRoot [
	| nodeWithElements |

	self deny: self newNode hasRoot.
	nodeWithElements := self newNodeWithElements.

	self assert: nodeWithElements hasRoot.

	nodeWithElements removeNode: nodeWithElements root.
	self deny: nodeWithElements hasRoot.
]

{ #category : #tests }
XMLDocumentTest >> testIsDocument [
	self assert: self newNode isDocument
]

{ #category : #tests }
XMLDocumentTest >> testIsStandalone [
	| document |

	document := self newNode.
	self
		deny: document isStandalone;
		assert: (document isStandalone: true) == document;
		assert: document isStandalone.
]

{ #category : #tests }
XMLDocumentTest >> testRoot [
	| document newRoot |

	newRoot := self newElementWithAttributes.
	document := self nodeClass root: newRoot.
	self
		assert: document class == self nodeClass;
		assert: document root == newRoot.
	 
	self assert: self newNode root isNil.

	document := self newNodeWithElements.
	self
		assert: document root == document nodes second;
		assert: document nodes size = 3;
		assert: document nodes first isComment;
		assert: (document nodes second isElementNamed: 'zero');
		assert: document nodes third isComment.

	newRoot := self elementClass named: 'new-root'.
	self
		assert: (document root: newRoot) == document;
		assert: document root == newRoot;
		assert: document nodes size = 3;
		assert: document nodes first isComment;
		assert: document nodes second == newRoot;
		assert: document nodes third isComment.

	document removeNodes.
	self assert: document root isNil.

	self
		should: [document root: 'test' asXMLStringNode]
		raise: XMLDOMException.
]

{ #category : #tests }
XMLDocumentTest >> testValidate [
	| xml document |

	super testValidate.

	xml := '
		<!DOCTYPE one [
			<!ELEMENT one (two+, three)>
			<!ATTLIST one idref IDREF #REQUIRED>
			<!ELEMENT two (#PCDATA)*>
			<!ATTLIST two id ID #REQUIRED>
			<!ELEMENT three EMPTY>]>
		<!--comment-->
		<one idref="a">
			<two id="a">three</two>
			<two id="b"><!--comment--></two>
			<three></three>
		</one>
		<?target data?>'.

	document :=
		(XMLDOMParser on: xml)
			preservesCommentNodes: true;
			parseDocument.
	self
		shouldnt: [document validate]
		raise: XMLValidationException.
	self assert:
		(document canonicallyEquals: 
			((XMLDOMParser on: xml)
				preservesCommentNodes: true;
				parseDocument)).

	document
		allElementsNamed: 'two'
		do: [:each | each attributeAt: 'id' put: 'a'].
	self
		should: [document validate]
		raise: XMLValidationException.

	document := XMLDOMParser parse: xml.
	document root name: 'zero'.
	self
		should: [document validate]
		raise: XMLValidationException.

	document := XMLDOMParser parse: xml.
	document root attributeAt: 'idref' put: 'undeclared'.
	self
		should: [document validate]
		raise: XMLValidationException.

	document := XMLDOMParser parse: xml.
	document root addElementNamed: 'four'.
	self
		should: [document validate]
		raise: XMLValidationException.

	document := XMLDOMParser parse: xml.
	(document root elementAt: 'three') addNode:
		(XMLComment string: 'comment').
	self
		should: [document validate]
		raise: XMLValidationException.

	document := XMLDOMParser parse: xml.
	(document root elementAt: 'three') addNode:
		(XMLPI
			target: 'target'
			data: 'data').
	self
		should: [document validate]
		raise: XMLValidationException.

	document := XMLDOMParser parse: xml.
	(document root elementAt: 'three') addNode: (XMLCData string: 'five').
	self
		should: [document validate]
		raise: XMLValidationException.

	document := XMLDOMParser parse: xml.
	(document root elementAt: 'three') addElementNamed: 'four'.
	self
		should: [document validate]
		raise: XMLValidationException.

	(document := XMLDOMParser parse: xml) doctypeDefinition: nil.
	document root
		name: 'zero';
		attributeAt: 'idref' put: 'undeclared';
		addElementNamed: 'four';
		allElementsNamed: 'two' do: [:each | each attributeAt: 'id' put: 'same'].
	(document root elementAt: 'three')
		addNode: (XMLComment string: 'comment');
		addNode:
			(XMLPI
				target: 'target'
				data: 'data');
		addNode: (XMLCData string: 'five');
		addElementNamed: 'four'.
	self
		shouldnt: [document validate]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLDocumentTest >> testValidateNoSubset [
	| xml document |

	xml := '<!DOCTYPE one>
		<one idref="a">
			<two id="a">three</two><two id="b"><!--comment--></two>
		</one>'.

	document :=
		(XMLDOMParser on: xml)
			preservesCommentNodes: true;
			parseDocument.
	self
		shouldnt: [document validate]
		raise: XMLValidationException.
	self assert:
		(document canonicallyEquals: 
			((XMLDOMParser on: xml)
				preservesCommentNodes: true;
				parseDocument)).

	document root name: 'five'.
	self
		should: [document validate]
		raise: XMLValidationException.

	document doctypeDefinition: nil.
	self
		shouldnt: [document validate]
		raise: XMLValidationException.
]

{ #category : #tests }
XMLDocumentTest >> testVersion [
	| document |

	document := self newNode.
	self
		assert: document version isNil;
		assert: (document version: 1.0) == document;
		assert: document version = 1.0.
]
