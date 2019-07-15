Class {
	#name : #PPMSEGrammarTest,
	#superclass : #PPCompositeParserTest,
	#category : #PetitMSE
}

{ #category : #accessing }
PPMSEGrammarTest >> parserClass [
	^ PPMSEGrammar
]

{ #category : #'tests-basic' }
PPMSEGrammarTest >> testClose [
	self parse: ')' rule: #close.
	self parse: ' )' rule: #close.
	self parse: ') ' rule: #close.
	self parse: ' 	) 
		' rule: #close
]

{ #category : #tests }
PPMSEGrammarTest >> testElementName [ 
	self parse: 'ABC.XYZ' rule: #elementName
]

{ #category : #'tests-basic' }
PPMSEGrammarTest >> testNatural [
	self parse: '123' rule: #natural
]

{ #category : #'tests-basic' }
PPMSEGrammarTest >> testNaturalWithSpace [
	self parse: '	123
		 ' rule: #natural
]

{ #category : #'tests-basic' }
PPMSEGrammarTest >> testNumberWithE [
	self parse: '	-123.45E-2' rule: #number
]

{ #category : #'tests-basic' }
PPMSEGrammarTest >> testOpen [
	self parse: '(' rule: #open.
	self parse: ' (' rule: #open.
	self parse: '( ' rule: #open.
	self parse: ' 	( 
		' rule: #open
]

{ #category : #'tests-basic' }
PPMSEGrammarTest >> testString [
	self parse: '''abc''' rule: #string
]

{ #category : #tests }
PPMSEGrammarTest >> testStringEscape [
	self parse: '''It''''s here''' rule: #string
]

{ #category : #'tests-basic' }
PPMSEGrammarTest >> testStringText [
	self parse: '1.,abc' rule: #stringText
]

{ #category : #'tests-basic' }
PPMSEGrammarTest >> testStringTextWithEscapeChars [
	self parse: 'a''''bc' rule: #stringText
]
