Class {
	#name : #GROrdinalizePrinter,
	#superclass : #GRPrinter,
	#category : #'Grease-Core-Text'
}

{ #category : #private }
GROrdinalizePrinter >> ordinalize: anInteger [
	^ (anInteger \\ 100 between: 11 and: 13)
		ifTrue: [ 'th' ]
		ifFalse: [ 
			#('st' 'nd' 'rd')
				at: anInteger \\ 10 
				ifAbsent: [ 'th' ] ]
]

{ #category : #printing }
GROrdinalizePrinter >> print: anObject on: aStream [
	aStream nextPutAll: (self ordinalize: anObject integerPart)
]
