Extension { #name : #Float }

{ #category : #'*XPath-Core-accessing' }
Float class >> xpathNegativeInfinity [
	"older Pharo/Squeak images don't have #negativeInfinity, so this is used instead"
	^ self infinity negated
]

{ #category : #'*XPath-Core-accessing' }
Float class >> xpathNegativeZero [
	"Pharo3's OpalCompiler doesn't correctly compile some methods
	with -0.0 literals"
	^ 0.0 negated
]
