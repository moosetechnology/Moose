"
XPath function to return the substring after another substring.
"
Class {
	#name : #XPathSubstringAfterFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathSubstringAfterFunction class >> prototypeSource [
	^ 'string substring-after(string, string)'
]

{ #category : #implementing }
XPathSubstringAfterFunction >> function [
	| string substring indexOfSubstring |

	string := self firstArgument.
	substring := self lastArgument.
	(indexOfSubstring :=
		string
			findString: substring
			startingAt: 1) > 0
		ifTrue: [
			^ string
				copyFrom: indexOfSubstring + substring size
				to: string size]
		ifFalse: [^ ''].
]
