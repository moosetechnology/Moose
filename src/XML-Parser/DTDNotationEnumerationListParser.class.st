"
This class parses notation attribute value lists in the form of ""NOTATION (one|two|...)"". It assumes there is no whitespace around the ""|"" separated list values.
"
Class {
	#name : #DTDNotationEnumerationListParser,
	#superclass : #DTDEnumerationListParser,
	#category : #'XML-Parser-DTD'
}

{ #category : #private }
DTDNotationEnumerationListParser >> listStartOffset [
	^ 10 "'NOTATION (' size"
]
