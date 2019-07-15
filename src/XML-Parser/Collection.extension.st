Extension { #name : #Collection }

{ #category : #'*XML-Parser' }
Collection >> asXMLAttributeDictionary [
	^ XMLAttributeDictionary newFrom: self
]

{ #category : #'*XML-Parser' }
Collection >> asXMLAttributeSpec [
	^ XMLBasicAttributeSpec attributes: self
]

{ #category : #'*XML-Parser' }
Collection >> includesXMLName: aName [
	"optimized with do: instead of anySatisfy:"
	self do: [:each |
		(aName isXMLQualifiedOrLocalName: each)
			ifTrue: [^ true]].
	^ false.
]
