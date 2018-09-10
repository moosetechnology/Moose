Extension { #name : #ClassDescription }

{ #category : #'*RoelTyper-organization' }
ClassDescription >> categoryForSelector: aSelector [
	"Starting from the receiver, find the category for the given selector (if any). "

	| cat s |
	^(cat := self whichCategoryIncludesSelector: aSelector)
		ifNil:
			[(s := self superclass)
				ifNil: [nil]
				ifNotNil: [s categoryForSelector: aSelector]]
		ifNotNil: [cat]
]
