"
XPath lang() function to test if the context node is in the scope of an xml:lang attribute value matching the argument.
"
Class {
	#name : #XPathLangFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathLangFunction class >> prototypeSource [
	^ 'boolean lang(string)'
]

{ #category : #implementing }
XPathLangFunction >> function [
	^ self contextNode notNil
		and: [self contextNode isInLanguage: self firstArgument]
]
