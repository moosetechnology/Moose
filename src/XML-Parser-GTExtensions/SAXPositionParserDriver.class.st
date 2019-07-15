"
This class is a SAX driver that forwards token start/end positions to a SAXHandler. Does not support entities or validation, but does support namespaces.
"
Class {
	#name : #SAXPositionParserDriver,
	#superclass : #SAXParserDriver,
	#category : #'XML-Parser-GTExtensions-Highlighting-Parser'
}

{ #category : #testing }
SAXPositionParserDriver >> decodesCharacters [
	^ false
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndCDataPosition: aPosition [
	self saxHandler endCDataPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndCommentPosition: aPosition [
	self saxHandler endCommentPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndDeclaration: aPosition [
	self saxHandler endDeclarationPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndDoctypeDeclarationPosition: aPosition [
	self saxHandler endDoctypeDeclarationPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndEntityReferencePosition: aPosition [
	self saxHandler endEntityReferencePosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndNamePosition: aPosition [
	self saxHandler endNamePosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndPIPosition: aPosition [
	self saxHandler endPIPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndQuotedStringNamePosition: aPosition [
	self saxHandler endQuotedStringNamePosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndQuotedStringPosition: aPosition [
	self saxHandler endQuotedStringPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndTagPosition: aPosition [
	self saxHandler endTagPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleEndXMLDeclarationPosition: aPosition [
	self saxHandler endXMLDeclarationPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartCDataPosition: aPosition [
	self saxHandler startCDataPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartCommentPosition: aPosition [
	self saxHandler startCommentPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartDeclaration: aPosition [
	self saxHandler startDeclarationPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartDoctypeDeclarationPosition: aPosition [
	self saxHandler startDoctypeDeclarationPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartEntityReferencePosition: aPosition [
	self saxHandler startEntityReferencePosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartNamePosition: aPosition [
	self saxHandler startNamePosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartPIPosition: aPosition [
	self saxHandler startPIPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartQuotedStringNamePosition: aPosition [
	self saxHandler startQuotedStringNamePosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartQuotedStringPosition: aPosition [
	self saxHandler startQuotedStringPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartTagPosition: aPosition [
	self saxHandler startTagPosition: aPosition
]

{ #category : #'handling - positions' }
SAXPositionParserDriver >> handleStartXMLDeclarationPosition: aPosition [
	self saxHandler startXMLDeclarationPosition: aPosition
]

{ #category : #testing }
SAXPositionParserDriver >> isValidating [
	^ false
]

{ #category : #defaults }
SAXPositionParserDriver >> tokenizerClass [
	^ XMLPositionWellFormedParserTokenizer
]
