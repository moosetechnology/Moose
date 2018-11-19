Class {
	#name : #XMLElementDeclarationTest,
	#superclass : #XMLDeclarationNodeTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLElementDeclarationTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLElementDeclarationTest >> nodeClass [
	^ XMLElementDeclaration
]

{ #category : #tests }
XMLElementDeclarationTest >> testContentModel [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration contentModel = '';
		assert: (declaration contentModel: '(one|two)') == declaration;
		assert: declaration contentModel = '(one|two)'.
]

{ #category : #tests }
XMLElementDeclarationTest >> testElement [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration element = '';
		assert: (declaration element: 'test') == declaration;
		assert: declaration element = 'test'.
]

{ #category : #tests }
XMLElementDeclarationTest >> testElementContentModel [
	| declaration |

	declaration :=
		self nodeClass
			element: 'one'
			contentModel: '(two|three)'.
	self
		assert: declaration class == self nodeClass;
		assert: declaration element = 'one';
		assert: declaration contentModel = '(two|three)'
]

{ #category : #assertions }
XMLElementDeclarationTest >> testWriteXMLOn [
	self assert:
		(self nodeClass
			element: 'one'
			contentModel: '(two | three)') printString = '<!ELEMENT one (two | three)>'.
	self assert:
		(self nodeClass
			element: 'one'
			contentModel: 'EMPTY') printString = '<!ELEMENT one EMPTY>'.
]
