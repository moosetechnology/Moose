Class {
	#name : #XMLParserExceptionTest,
	#superclass : #XMLExceptionTest,
	#category : #'XML-Tests-Parser-Exceptions'
}

{ #category : #accessing }
XMLParserExceptionTest >> baseURI [
	^ 'test.xml'
]

{ #category : #accessing }
XMLParserExceptionTest >> columnNumber [
	^ 10
]

{ #category : #accessing }
XMLParserExceptionTest >> errorMessageWithBaseURI [
	^ '{1} (in {2})' format:
		(Array
			with: self errorMessage
			with: self baseURI)
]

{ #category : #accessing }
XMLParserExceptionTest >> errorMessageWithLineAndColumnNumber [
	^ '{1} (near line {2}, column {3})' format:
		(Array
			with: self errorMessage
			with: self lineNumber
			with: self columnNumber)
]

{ #category : #accessing }
XMLParserExceptionTest >> errorMessageWithLineAndColumnNumberAndBaseURI [
	^ '{1} (near line {2}, column {3} in {4})' format:
		(Array
			with: self errorMessage
			with: self lineNumber
			with: self columnNumber
			with: self baseURI)
]

{ #category : #accessing }
XMLParserExceptionTest >> errorMessageWithLineNumber [
	^ '{1} (near line {2})' format:
		(Array
			with: self errorMessage
			with: self lineNumber)
]

{ #category : #accessing }
XMLParserExceptionTest >> errorMessageWithLineNumberAndBaseURI [
	^ '{1} (near line {2} in {3})' format:
		(Array
			with: self errorMessage
			with: self lineNumber
			with: self baseURI)
]

{ #category : #accessing }
XMLParserExceptionTest >> exceptionClass [
	^ XMLParserException
]

{ #category : #accessing }
XMLParserExceptionTest >> lineNumber [
	^ 100
]

{ #category : #tests }
XMLParserExceptionTest >> testBaseURI [
	| exception |

	exception := self newException.
	self
		assert: exception baseURI = '';
		assert: (exception baseURI: self baseURI) == exception;
		assert: exception baseURI = self baseURI.
]

{ #category : #tests }
XMLParserExceptionTest >> testColumnNumber [
	| exception |

	exception := self newException.
	self
		assert: exception columnNumber isNil;
		assert: (exception columnNumber: self columnNumber) == exception;
		assert: exception columnNumber = self columnNumber.
]

{ #category : #tests }
XMLParserExceptionTest >> testHasBaseURI [
	| exception |

	exception := self newException.
	self deny: exception hasBaseURI.
	
	exception baseURI: self baseURI.
	self assert: exception hasBaseURI.

	exception baseURI: ''.
	self deny: exception hasBaseURI.
]

{ #category : #tests }
XMLParserExceptionTest >> testHasColumnNumber [
	| exception |

	exception := self newException.
	self deny: exception hasColumnNumber.
	
	exception columnNumber: self columnNumber.
	self assert: exception hasColumnNumber.

	exception columnNumber: nil.
	self deny: exception hasColumnNumber.
]

{ #category : #tests }
XMLParserExceptionTest >> testHasLineNumber [
	| exception |

	exception := self newException.
	self deny: exception hasLineNumber.
	
	exception lineNumber: self lineNumber.
	self assert: exception hasLineNumber.

	exception lineNumber: nil.
	self deny: exception hasLineNumber.
]

{ #category : #tests }
XMLParserExceptionTest >> testLineNumber [
	| exception |

	exception := self newException.
	self
		assert: exception lineNumber isNil;
		assert: (exception lineNumber: self lineNumber) == exception;
		assert: exception lineNumber = self lineNumber.
]

{ #category : #tests }
XMLParserExceptionTest >> testMessageText [
	| exception |

	exception := self newExceptionWithErrorMessage.
	self assert: exception messageText = self errorMessage.

	"column numbers without line numbers are ignored"
	(exception := self newExceptionWithErrorMessage)
		columnNumber: self columnNumber.
	self assert: exception messageText = self errorMessage.

	(exception := self newExceptionWithErrorMessage)
		lineNumber: self lineNumber.
	self assert: exception messageText = self errorMessageWithLineNumber.

	(exception := self newExceptionWithErrorMessage)
		baseURI: self baseURI.
	self assert: exception messageText = self errorMessageWithBaseURI.

	(exception := self newExceptionWithErrorMessage)
		lineNumber: self lineNumber;
		columnNumber: self columnNumber.
	self assert: exception messageText = self errorMessageWithLineAndColumnNumber.

	(exception := self newExceptionWithErrorMessage)
		lineNumber: self lineNumber;
		baseURI: self baseURI.
	self assert: exception messageText = self errorMessageWithLineNumberAndBaseURI.

	"column numbers without line numbers are ignored"
	(exception := self newExceptionWithErrorMessage)
		columnNumber: self columnNumber;
		baseURI: self baseURI.
	self assert: exception messageText = self errorMessageWithBaseURI.

	(exception := self newExceptionWithErrorMessage)
		lineNumber: self lineNumber;
		columnNumber: self columnNumber;
		baseURI: self baseURI.
	self assert:
		exception messageText =
			self errorMessageWithLineAndColumnNumberAndBaseURI.
]
