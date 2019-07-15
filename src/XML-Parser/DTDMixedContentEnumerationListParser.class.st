"
This is a parser of mixed content lists in the form of ""(#PCDATA|one|two|...)*"".  It assumes there is no whitespace around the ""|"" separated list values.
"
Class {
	#name : #DTDMixedContentEnumerationListParser,
	#superclass : #DTDEnumerationListParser,
	#category : #'XML-Parser-DTD'
}

{ #category : #private }
DTDMixedContentEnumerationListParser >> listEndOffset [
	^ listString last == $*
		ifTrue: [2] "')*' size"
		ifFalse: [1] "')' size"
]
