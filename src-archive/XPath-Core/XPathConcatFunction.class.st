"
XPath string concatenation function. Concatenates two or more strings.
"
Class {
	#name : #XPathConcatFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathConcatFunction class >> prototypeSource [
	^ 'string concat(string, string, string*)'
]

{ #category : #implementing }
XPathConcatFunction >> function [
	| writeStream |

	writeStream := (String new: self totalArguments * 10) writeStream.
	self argumentsDo: [:each |
		writeStream nextPutAll: each].
	^ writeStream contents.
]
