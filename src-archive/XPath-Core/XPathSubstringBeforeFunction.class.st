"
XPath function to return the substring before another substring.
"
Class {
	#name : #XPathSubstringBeforeFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathSubstringBeforeFunction class >> prototypeSource [
	^ 'string substring-before(string, string)'
]

{ #category : #implementing }
XPathSubstringBeforeFunction >> function [
	| string indexOfSubstring |

	string := self firstArgument.
	(indexOfSubstring :=
		string
			findString: self lastArgument
			startingAt: 1) > 0
		ifTrue: [
			^ string
				copyFrom: 1
				to: indexOfSubstring - 1]
		ifFalse: [^ ''].
]
