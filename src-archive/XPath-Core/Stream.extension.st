Extension { #name : #Stream }

{ #category : #'*XPath-Core-converting' }
Stream >> asXPathReadStreamAdapter [
	^ XPathReadStreamAdapter on: self
]
