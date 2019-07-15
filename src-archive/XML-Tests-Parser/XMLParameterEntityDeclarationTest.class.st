Class {
	#name : #XMLParameterEntityDeclarationTest,
	#superclass : #XMLEntityDeclarationTest,
	#category : #'XML-Tests-Parser-DOM'
}

{ #category : #testing }
XMLParameterEntityDeclarationTest class >> isAbstract [
	^ false
]

{ #category : #accessing }
XMLParameterEntityDeclarationTest >> nodeClass [
	^ XMLParameterEntityDeclaration
]

{ #category : #tests }
XMLParameterEntityDeclarationTest >> testIsParameter [
	self assert: self newNode isParameter
]

{ #category : #tests }
XMLParameterEntityDeclarationTest >> testWriteXMLOn [
	self assert:
		(self nodeClass name: 'one' replacement: 'two') printString =
			'<!ENTITY % one "two">'.
	self assert:
		(self nodeClass name: 'one' publicID: 'two' systemID: 'three') printString =
			'<!ENTITY % one PUBLIC "two" "three">'.
	self assert:
		(self nodeClass name: 'one' publicID: '' systemID: 'three') printString =
			'<!ENTITY % one SYSTEM "three">'.
]
