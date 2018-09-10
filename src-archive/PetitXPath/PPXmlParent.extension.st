Extension { #name : #PPXmlParent }

{ #category : #'*petitxpath-extensions' }
PPXmlParent >> findXPath: aString [ 
	^(PPXPathWalker on: self) find: aString
]
