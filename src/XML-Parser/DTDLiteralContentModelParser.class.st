"
This class parses literal ""ANY"" and ""EMPTY"" element content models and returns XMLElementValidators accepting any content or no content (not even whitespace, comments, or PIs).
"
Class {
	#name : #DTDLiteralContentModelParser,
	#superclass : #DTDContentModelParser,
	#category : #'XML-Parser-DTD'
}

{ #category : #parsing }
DTDLiteralContentModelParser >> parse [
	"either ANY or EMPTY"
	(contentModel at: 1) == $A
		ifTrue: [^ XMLAnyElementValidator element: element]
		ifFalse: [^ XMLEmptyElementValidator element: element]
]
