Class {
	#name : #XMLDoctypeDeclarationTest,
	#superclass : #XMLNodeWithChildrenTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLDoctypeDeclarationTest class >> isAbstract [
	^ false
]

{ #category : #'instance creation' }
XMLDoctypeDeclarationTest >> newNodeWithNodes [
	^ self newNode
		addNode: (XMLComment string: 'before');
		addNode: (XMLGeneralEntityDeclaration name: 'one' replacement: 'two');
		addNode: (XMLParameterEntityDeclaration name: 'three' publicID: 'four' systemID: 'four');
		addNode: (XMLElementDeclaration element: 'five' contentModel: '(six|sevent|eight)');
		addNode:
			(XMLAttributeDeclaration
				element: 'five'
				attribute: 'nine'
				type: 'CDATA'
				defaultPragma: '#IMPLIED'
				defaultValue: 'ten');
		addNode:
			(XMLNotationDeclaration
				name: 'eleven'
				publicID: 'twelve'
				systemID: 'twelve');
		addNode: (XMLPI target: 'thirteen' data: 'fourteen');
		addNode: (XMLComment string: 'after');
		yourself
]

{ #category : #accessing }
XMLDoctypeDeclarationTest >> nodeClass [
	^ XMLDoctypeDeclaration
]

{ #category : #accessing }
XMLDoctypeDeclarationTest >> nodeListClass [
	^ XMLInternalSubsetList
]

{ #category : #accessing }
XMLDoctypeDeclarationTest >> selectListClass [
	^ XMLInternalSubsetList
]

{ #category : #tests }
XMLDoctypeDeclarationTest >> testAllNodes [
	| nodeWithNodes allNodes |

	nodeWithNodes := self newNodeWithNodes.
	allNodes := nodeWithNodes allNodes.
	self
		assert: allNodes size = 9;
		assert: allNodes first == nodeWithNodes;
		assert: allNodes second isComment;
		assert: allNodes second string = 'before';
		assert: allNodes third class == XMLGeneralEntityDeclaration;
		assert: allNodes fourth class == XMLParameterEntityDeclaration;
		assert: allNodes fifth class == XMLElementDeclaration;
		assert: allNodes sixth class == XMLAttributeDeclaration;
		assert: allNodes seventh class == XMLNotationDeclaration;
		assert: allNodes eighth isPI;
		assert: allNodes ninth isComment;
		assert: allNodes ninth string = 'after'.
]

{ #category : #tests }
XMLDoctypeDeclarationTest >> testCanonicallyEquals [
	self
		assert: (self newNode canonicallyEquals: self newNode);
		assert: (self newNodeWithNodes canonicallyEquals: self newNodeWithNodes);
		assert: (self newNodeWithNodes canonicallyEquals: self newNode)
]

{ #category : #tests }
XMLDoctypeDeclarationTest >> testPublicID [
	| doctype |

	doctype := self newNode.
	self
		assert: doctype publicID = '';
		assert: (doctype publicID: 'test') == doctype;
		assert: doctype publicID = 'test'.
]

{ #category : #tests }
XMLDoctypeDeclarationTest >> testRoot [
	| doctype |

	doctype := self newNode.
	self
		assert: doctype root = '';
		assert: (doctype root: 'test') == doctype;
		assert: doctype root = 'test'.
]

{ #category : #tests }
XMLDoctypeDeclarationTest >> testRootPublicIDSystemID [
	| doctype |

	doctype :=
		self nodeClass
			root: 'one'
			publicID: 'two'
			systemID: 'three'.
	self
		assert: doctype class == self nodeClass;
		assert: doctype root = 'one';
		assert: doctype publicID = 'two';
		assert: doctype systemID = 'three'.
]

{ #category : #tests }
XMLDoctypeDeclarationTest >> testSystemID [
	| doctype |

	doctype := self newNode.
	self
		assert: doctype systemID = '';
		assert: (doctype systemID: 'test') == doctype;
		assert: doctype systemID = 'test'.
]

{ #category : #tests }
XMLDoctypeDeclarationTest >> testWriteXMLOn [
	| doctype elementDeclaration |

	doctype := self newNode.
	self assert: doctype printString = '<!DOCTYPE >'.
	doctype root: 'one'.
	self assert: doctype printString = '<!DOCTYPE one>'.
	doctype publicID: 'two'.
	self assert: doctype printString = '<!DOCTYPE one PUBLIC "two" "">'.
	doctype systemID: 'three'.
	self assert: doctype printString = '<!DOCTYPE one PUBLIC "two" "three">'.

	elementDeclaration := XMLElementDeclaration element: 'four' contentModel: '(five|six)'.
	doctype addNode: elementDeclaration.
	self assert:
		doctype printString =
			('<!DOCTYPE one PUBLIC "two" "three" [', elementDeclaration printString, ']>').

	self assert:
		(self nodeClass root: 'one' publicID: '' systemID: 'two') printString =
			'<!DOCTYPE one SYSTEM "two">'.
]
