Class {
	#name : #SmaCCNoErrorHandler,
	#superclass : #SmaCCErrorHandler,
	#category : #'SmaCC_Runtime'
}

{ #category : #'error handling' }
SmaCCNoErrorHandler >> handleError: anInteger [
	self markErrorToken.
	self reportError: anInteger
]
