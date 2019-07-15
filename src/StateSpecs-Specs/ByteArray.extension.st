Extension { #name : #ByteArray }

{ #category : #'*StateSpecs-Specs' }
ByteArray >> checkStateSpecsEqualityTo: anotherByteArray [

	^self = anotherByteArray
]

{ #category : #'*StateSpecs-Specs' }
ByteArray >> stringForSpecTitle [ 
	^self printString
]
