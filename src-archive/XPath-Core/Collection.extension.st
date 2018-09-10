Extension { #name : #Collection }

{ #category : #'*XPath-Core-converting' }
Collection >> asXPathFunctionSet [
	^ XPathFunctionSet newFrom: self
]
