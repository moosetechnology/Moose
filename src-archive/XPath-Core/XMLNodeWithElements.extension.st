Extension { #name : #XMLNodeWithElements }

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNodeWithElements >> / aStringOrBlockOrNodeTestWithPredicates [
	"redefined here to prevent a conflicting method from the Pastell project
	from shadowing the inherited implementation if Pastell was installed"
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				childAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self childAxis: aStringOrBlockOrNodeTestWithPredicates]
]

{ #category : #'*XPath-Core-enumerating - axis' }
XMLNodeWithElements >> // aStringOrBlockOrNodeTestWithPredicates [
	"redefined here to prevent a conflicting method from the Pastell project
	from shadowing the inherited implementation if Pastell was installed"
	^ aStringOrBlockOrNodeTestWithPredicates isXPathNodeTestWithPredicates
		ifTrue: [
			self
				descendantAxis: aStringOrBlockOrNodeTestWithPredicates nodeTest
				predicates: aStringOrBlockOrNodeTestWithPredicates predicates]
		ifFalse: [
			self descendantAxis: aStringOrBlockOrNodeTestWithPredicates]
]

{ #category : #'*XPath-Core-accessing' }
XMLNodeWithElements >> stringValue [
	"spec says the string-value of documents and elements is all text
	descendants concatenated, so contentString can't be used because it
	inserts spaces"
	^ self rawContentString
]
