Class {
	#name : #XMLNotationDeclarationTest,
	#superclass : #XMLDeclarationNodeTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLNotationDeclarationTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLNotationDeclarationTest >> nodeClass [
	^ XMLNotationDeclaration
]

{ #category : #tests }
XMLNotationDeclarationTest >> testName [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration name = '';
		assert: (declaration name: 'test') == declaration;
		assert: declaration name = 'test'.
]

{ #category : #tests }
XMLNotationDeclarationTest >> testNamePublicIDSystemID [
	| declaration |

	declaration :=
		self nodeClass
			name: 'one'
			publicID: 'two'
			systemID: 'three'.
	self
		assert: declaration class == self nodeClass;
		assert: declaration name = 'one';
		assert: declaration publicID = 'two';
		assert: declaration systemID = 'three'.
]

{ #category : #tests }
XMLNotationDeclarationTest >> testPublicID [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration publicID = '';
		assert: (declaration publicID: 'test') == declaration;
		assert: declaration publicID = 'test'.
]

{ #category : #tests }
XMLNotationDeclarationTest >> testSystemID [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration systemID = '';
		assert: (declaration systemID: 'test') == declaration;
		assert: declaration systemID = 'test'.
]

{ #category : #tests }
XMLNotationDeclarationTest >> testWriteXMLOn [
	self assert:
		(self nodeClass name: 'one' publicID: 'two' systemID: 'three') printString =
			'<!NOTATION one PUBLIC "two" "three">'.
	self assert:
		(self nodeClass name: 'one' publicID: '' systemID: 'two') printString =
			'<!NOTATION one SYSTEM "two">'.
	self assert:
		(self nodeClass name: 'one' publicID: 'two' systemID: '') printString =
			'<!NOTATION one PUBLIC "two">'.
]
