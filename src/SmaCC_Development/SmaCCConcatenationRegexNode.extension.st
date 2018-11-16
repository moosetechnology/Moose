Extension { #name : #SmaCCConcatenationRegexNode }

{ #category : #'*SmaCC_Development' }
SmaCCConcatenationRegexNode >> asRegularExpression [
	^ SmaCCSequenceRENode nodes: (self items collect: [ :each | each regularExpression ])
]
