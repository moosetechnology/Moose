Extension { #name : #BlockClosure }

{ #category : #'*StateSpecs-Specs' }
BlockClosure >> asStateSpec [

	^SpecOfObjectStateByPredicate from: self
]

{ #category : #'*StateSpecs-Specs' }
BlockClosure >> stringForSpecTitle [
	^self sourceNode formattedCode
]
