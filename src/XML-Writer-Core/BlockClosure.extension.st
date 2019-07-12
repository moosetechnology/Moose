Extension { #name : #BlockClosure }

{ #category : #'*XML-Writer-Core' }
BlockClosure >> embedInXMLMarkupWriter: aMarkupWriter [
	self cull: aMarkupWriter writer
]
