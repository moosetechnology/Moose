Extension { #name : #Array }

{ #category : #'*StateSpecs-Specs' }
Array >> stringForSpecTitle [ 
	self shouldBePrintedAsLiteral ifTrue: [^self printString].
	self isSelfEvaluating ifTrue: [^self printString].

	^super stringForSpecTitle 
]
