Extension { #name : #Integer }

{ #category : #'*Moose-Algos-LinearAlgebra' }
Integer >> coerce: t1 [

	^ t1 asInteger
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Integer >> maskClear: t1 [

	^ self bitAnd: t1 bitInvert.
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Integer >> maskSet: t1 [

	^ self bitOr: t1.
]

{ #category : #'*Moose-Algos-LinearAlgebra' }
Integer class >> zero [
	^ 0. 
	
]
