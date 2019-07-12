Extension { #name : #Collection }

{ #category : #'*XML-Writer-Core' }
Collection >> embedInXMLMarkupWriter: aMarkupWriter [
	self do: [:each | each embedInXMLMarkupWriter: aMarkupWriter]
]
