Class {
	#name : #XMLGeneralEntityDeclarationTest,
	#superclass : #XMLEntityDeclarationTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLGeneralEntityDeclarationTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLGeneralEntityDeclarationTest >> nodeClass [
	^ XMLGeneralEntityDeclaration
]

{ #category : #tests }
XMLGeneralEntityDeclarationTest >> testIsUnparsed [
	super testIsUnparsed.

	self assert: (self newNode ndata: 'test') isUnparsed.
]

{ #category : #tests }
XMLGeneralEntityDeclarationTest >> testNData [
	| declaration |

	declaration := self newNode.
	self
		assert: declaration ndata = '';
		assert: (declaration ndata: 'test') == declaration;
		assert: declaration ndata = 'test'.
]

{ #category : #tests }
XMLGeneralEntityDeclarationTest >> testNamePublicIDSystemIDNdata [
	| declaration |

	declaration :=
		self nodeClass
			name: 'one'
			publicID: 'two'
			systemID: 'three'
			ndata: 'four'.
	self
		assert: declaration class == self nodeClass;
		assert: declaration name = 'one';
		assert: declaration publicID = 'two';
		assert: declaration systemID = 'three';
		assert: declaration ndata = 'four'.
]

{ #category : #tests }
XMLGeneralEntityDeclarationTest >> testWriteXMLOn [
	self assert:
		(self nodeClass name: 'one' replacement: 'two') printString =
			'<!ENTITY one "two">'.
	self assert:
		(self nodeClass name: 'one' publicID: 'two' systemID: 'three') printString =
			'<!ENTITY one PUBLIC "two" "three">'.
	self assert:
		(self nodeClass name: 'one' publicID: '' systemID: 'three') printString =
			'<!ENTITY one SYSTEM "three">'.
	self assert:
		(self nodeClass name: 'one' publicID: 'two' systemID: 'three' ndata: 'four') printString =
			'<!ENTITY one PUBLIC "two" "three" NDATA four>'.
]
