Extension { #name : #SmaCCAlternationRegexNode }

{ #category : #'*SmaCC_Development' }
SmaCCAlternationRegexNode >> asRegularExpression [
	^ SmaCCOrRENode nodes: (self items collect: [ :each | each regularExpression ])
]
