Class {
	#name : #XMLAttributeDeclarationTest,
	#superclass : #XMLDeclarationNodeTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLAttributeDeclarationTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLAttributeDeclarationTest >> nodeClass [
	^ XMLAttributeDeclaration
]

{ #category : #tests }
XMLAttributeDeclarationTest >> testAttribute [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration attribute = '';
		assert: (declaration attribute: 'test') == declaration;
		assert: declaration attribute = 'test'.
]

{ #category : #tests }
XMLAttributeDeclarationTest >> testDefaultPragma [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration defaultPragma = '';
		assert: (declaration defaultPragma: 'REQUIRED') == declaration;
		assert: declaration defaultPragma = 'REQUIRED'.
]

{ #category : #tests }
XMLAttributeDeclarationTest >> testDefaultValue [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration defaultValue = '';
		assert: (declaration defaultValue: 'test') == declaration;
		assert: declaration defaultValue = 'test'.
]

{ #category : #tests }
XMLAttributeDeclarationTest >> testElement [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration element = '';
		assert: (declaration element: 'test') == declaration;
		assert: declaration element = 'test'.
]

{ #category : #tests }
XMLAttributeDeclarationTest >> testElementAttributeTypeDefaultPragmaDefaultValue [
	| declaration |

	declaration :=
		self nodeClass
			element: 'one'
			attribute: 'two'
			type: 'CDATA'
			defaultPragma: '#IMPLIED'
			defaultValue: 'default'.
	self
		assert: declaration class == self nodeClass;
		assert: declaration element = 'one';
		assert: declaration attribute = 'two';
		assert: declaration type = 'CDATA';
		assert: declaration defaultPragma = '#IMPLIED';
		assert: declaration defaultValue = 'default'.
]

{ #category : #tests }
XMLAttributeDeclarationTest >> testType [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration type = '';
		assert: (declaration type: 'CDATA') == declaration;
		assert: declaration type = 'CDATA'.
]

{ #category : #tests }
XMLAttributeDeclarationTest >> testWriteXMLOn [
	self assert:
		(self nodeClass
			element: 'one'
			attribute: 'two'
			type: 'CDATA'
			defaultPragma: ''
			defaultValue: 'three') printString = '<!ATTLIST one two CDATA "three">'.
	self assert:
		(self nodeClass
			element: 'one'
			attribute: 'two'
			type: 'ENTITY'
			defaultPragma: 'FIXED'
			defaultValue: 'three') printString = '<!ATTLIST one two ENTITY #FIXED "three">'.
	self assert:
		(self nodeClass
			element: 'one'
			attribute: 'two'
			type: '(three|four)'
			defaultPragma: '#IMPLIED'
			defaultValue: 'four') printString = '<!ATTLIST one two (three|four) #IMPLIED>'.
]
