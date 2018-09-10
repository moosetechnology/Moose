"
A state for <?xml ...?> text declaration tokens at the start of the external DTD subset.

This state #canTerminateInput unlike XMLXMLDeclarationState because external subsets and parsed entities can be empty, but documents must have at least one element.
"
Class {
	#name : #XMLExternalSubsetTextDeclarationState,
	#superclass : #XMLExternalSubsetState,
	#category : #'XML-Parser-Drivers'
}

{ #category : #tokenizing }
XMLExternalSubsetTextDeclarationState >> nextTokenFrom: aTokenizer [
	^ aTokenizer nextStartExternalSubset
]

{ #category : #testing }
XMLExternalSubsetTextDeclarationState >> supportsEncodingDetection [
	^ true
]
