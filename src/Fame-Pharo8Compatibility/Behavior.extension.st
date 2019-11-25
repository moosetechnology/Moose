Extension { #name : #Behavior }

{ #category : #'*Fame-Pharo8Compatibility' }
Behavior >> compiledMethodAt: selector ifPresent: aBlock [
	"Answer the compiled method associated with the argument, selector (a Symbol),
	 a message selector in the receiver's method dictionary.
	 If the selector is in the dictionary, return the value of aBlock.
	"

	^ self methodDict at: selector ifPresent: aBlock
]
