"
XPath substring function. First argument is the source string, second is the one-based position, and third is the substring length.
"
Class {
	#name : #XPathSubstringFunction,
	#superclass : #XPathFunction,
	#category : #'XPath-Core-Functions'
}

{ #category : #accessing }
XPathSubstringFunction class >> prototypeSource [
	^ 'string substring(string, number, number?)'
]

{ #category : #implementing }
XPathSubstringFunction >> function [
	| string start end |

	string := self argumentAt: 1.
	start := (self argumentAt: 2) xpathRounded.
	end :=
		self totalArguments > 2
			ifTrue: [start + (self argumentAt: 3) xpathRounded - 1]
			ifFalse: [string size].

	"if either start or end are NaN, the test will fail"
	(start <= end
		and: [start <= string size
			and: [end >= 1]])
		ifTrue: [
			"the #xpathRounded calls got rid of any fraciton part, but
			integer flots still must be converted to integers because
			#copyFrom:to: won't take integer floats, and the #min:/#max:
			eliminate +/- infinity"
			^ string
				copyFrom: (start max: 1) asInteger
				to: (end min: string size) asInteger]
		ifFalse: [^ '']	.
]
