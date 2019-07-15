"
This class is a SAXHandler that can track the positions of tokens. Does not support validation or entity replacement but can check wellformedness and namespaces.
"
Class {
	#name : #SAXPositionHandler,
	#superclass : #SAXHandler,
	#category : #'XML-Parser-GTExtensions-Highlighting-Parser'
}

{ #category : #defaults }
SAXPositionHandler >> driverClass [
	^ SAXPositionParserDriver
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endCDataPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endCommentPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endDeclarationPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endDoctypeDeclarationPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endEntityReferencePosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endNamePosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endPIPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endQuotedStringNamePosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endQuotedStringPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endTagPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> endXMLDeclarationPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startCDataPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startCommentPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startDeclarationPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startDoctypeDeclarationPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startEntityReferencePosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startNamePosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startPIPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startQuotedStringNamePosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startQuotedStringPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startTagPosition: aPosition [
]

{ #category : #'handling - positions' }
SAXPositionHandler >> startXMLDeclarationPosition: aPosition [
]
