"
Abstract, do not run.
"
Class {
	#name : #XMLEntityDeclarationTest,
	#superclass : #XMLDeclarationNodeTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #accessing }
XMLEntityDeclarationTest >> nodeClass [
	^ XMLEntityDeclaration
]

{ #category : #tests }
XMLEntityDeclarationTest >> testIsExternal [
	| declaration |

	declaration := self newNode.
	self deny: declaration isExternal.

	declaration systemID: 'test'.
	self assert: declaration isExternal.

	declaration publicID: 'test'.
	self assert: declaration isExternal.

	declaration systemID: ''.
	self assert: declaration isExternal.

	declaration publicID: ''.
	self deny: declaration isExternal.
]

{ #category : #tests }
XMLEntityDeclarationTest >> testIsParameter [
	self deny: self newNode isParameter
]

{ #category : #tests }
XMLEntityDeclarationTest >> testIsUnparsed [
	self deny: self newNode isUnparsed
]

{ #category : #tests }
XMLEntityDeclarationTest >> testName [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration name = '';
		assert: (declaration name: 'test') == declaration;
		assert: declaration name = 'test'.
]

{ #category : #tests }
XMLEntityDeclarationTest >> testNamePublicIDSystemID [
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
XMLEntityDeclarationTest >> testNameReplacement [
	| declaration |

	declaration :=
		self nodeClass
			name: 'one'
			replacement: 'two'.
	self
		assert: declaration class == self nodeClass;
		assert: declaration name = 'one';
		assert: declaration replacement = 'two'.
]

{ #category : #tests }
XMLEntityDeclarationTest >> testPublicID [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration publicID = '';
		assert: (declaration publicID: 'test') == declaration;
		assert: declaration publicID = 'test'.
]

{ #category : #tests }
XMLEntityDeclarationTest >> testReplacement [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration replacement = '';
		assert: (declaration replacement: 'test') == declaration;
		assert: declaration replacement = 'test'.
]

{ #category : #tests }
XMLEntityDeclarationTest >> testSystemID [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration systemID = '';
		assert: (declaration systemID: 'test') == declaration;
		assert: declaration systemID = 'test'.
]
