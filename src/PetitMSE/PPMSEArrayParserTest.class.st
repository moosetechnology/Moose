Class {
	#name : #PPMSEArrayParserTest,
	#superclass : #PPMSEGrammarTest,
	#category : #PetitMSE
}

{ #category : #accessing }
PPMSEArrayParserTest >> parserClass [
	^ PPMSEArrayParser
]

{ #category : #tests }
PPMSEArrayParserTest >> testElementName [
	super testElementName.
	self assert: result equals: 'ABC.XYZ'
]

{ #category : #'tests-start' }
PPMSEArrayParserTest >> testEmpty [
	self assert: '()' is: #().
	self assert: '( )' is: #().
	self assert: ' ( ) ' is: #()
]

{ #category : #'tests-basic' }
PPMSEArrayParserTest >> testNatural [
	super testNatural.
	self assert: result equals: 123
]

{ #category : #'tests-basic' }
PPMSEArrayParserTest >> testNaturalWithSpace [
	super testNaturalWithSpace.
	self assert: result equals: 123
]

{ #category : #'tests-basic' }
PPMSEArrayParserTest >> testNumberWithE [
	super testNumberWithE.
	self assert: result equals: -1.2345
]

{ #category : #'tests-start' }
PPMSEArrayParserTest >> testOneElement [
	self assert: '((X))' is: #(('X' nil #())).
	self assert: '((X.Y))' is: #(('X.Y' nil #())).
	
]

{ #category : #'tests-start' }
PPMSEArrayParserTest >> testOneElementWithBooleanAttribute [
	self assert: '((X.Y (attribute true)))' is: #(('X.Y' nil #(('attribute' true))))
]

{ #category : #'tests-start' }
PPMSEArrayParserTest >> testOneElementWithId [
	self assert: '((FAMIX.Class (id: 1)))' is: #(('FAMIX.Class' #('id' 1) #())).
	self assert: '( ( FAMIX.Class (id: 1) ) )' is: #(('FAMIX.Class' #('id' 1) #())).
	self assert: '( 
	( FAMIX.Class (id: 1) )
)' is: #(('FAMIX.Class' #('id' 1) #())).
	self assert: '( 
(FAMIX.Class (id: 1)
)
)' is: #(('FAMIX.Class' #('id' 1) #()))
]

{ #category : #'tests-start' }
PPMSEArrayParserTest >> testOneElementWithMultipleSubElements [
	self assert: '((X (sub (Y) (Z))))' is: #(#('X' nil #(#('sub' #(#('Y' nil #()) #('Z' nil #())))))).
	
]

{ #category : #'tests-start' }
PPMSEArrayParserTest >> testOneElementWithNumericAttribute [
	self assert: '((X.Y (attribute 2)))' is: #(('X.Y' nil #(('attribute' 2)))).
	self assert: '((X.Y (attribute 2.1)))' is: #(('X.Y' nil #(('attribute' 2.1)))).
	self assert: '((X.Y (attribute 1234.567)))' is: #(('X.Y' nil #(('attribute' 1234.567))))
]

{ #category : #'tests-start' }
PPMSEArrayParserTest >> testOneElementWithStringAttribute [
	self assert: '((FAMIX.Class (name ''Something'')))' is: #(('FAMIX.Class' nil #(('name' 'Something')))).
	self assert: '((FAMIX.Class (attribute ''as:.,><asd'')))' is: #(('FAMIX.Class' nil #(('attribute' 'as:.,><asd')))).
]

{ #category : #'tests-start' }
PPMSEArrayParserTest >> testOneElementWithSubElement [
	self assert: '((X (sub (Y))))' is: #(#('X' nil #(#('sub' #('Y' nil #())))))
]

{ #category : #'tests-basic' }
PPMSEArrayParserTest >> testString [
	super testString.
	self assert: result equals: 'abc'
]

{ #category : #'tests-start' }
PPMSEArrayParserTest >> testStringEscape [
	super testStringEscape.
	self assert: result equals: 'It''s here'
]

{ #category : #'tests-basic' }
PPMSEArrayParserTest >> testStringTextWithEscapeChars [
	super testStringTextWithEscapeChars.
	self assert: result equals: 'a''bc'
]
