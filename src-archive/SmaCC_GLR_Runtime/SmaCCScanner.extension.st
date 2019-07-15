Extension { #name : #SmaCCScanner }

{ #category : #'*SmaCC_GLR_Runtime' }
SmaCCScanner >> currentState [
	"Return an object that can be used to restoreState: when switching between parses in a GLR parser. 
	This object should implement #= in such a way that if the state is restored, then calling #next will 
	always return the same token. If you add state to your scanner you may want to override this method
	and #restoreState: to include that state."

	^ self stateClass position: self position scope: self scope
]

{ #category : #'*SmaCC_GLR_Runtime' }
SmaCCScanner >> restoreState: aSmaCCScannerState [
	"Restore the state using the object returned from #currentState."

	self setPosition: aSmaCCScannerState position.
	self scope: aSmaCCScannerState scope
]

{ #category : #'*SmaCC_GLR_Runtime' }
SmaCCScanner >> stateClass [
	^ SmaCCScannerState
]
