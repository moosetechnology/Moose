"
This class parses mixed content declarations like ""(#PCDATA|one|two)*"" using a DTDEnumerationListParser and returns an XMLElementValidator accepting any sequence of PCDATA and the named elements in any order.
"
Class {
	#name : #DTDMixedContentModelParser,
	#superclass : #DTDContentModelParser,
	#category : #'XML-Parser-DTD'
}

{ #category : #parsing }
DTDMixedContentModelParser >> parse [
	^ XMLMixedContentElementValidator
		element: element
		allowedContent:
			(DTDMixedContentEnumerationListParser on: contentModel)
				parse
]
