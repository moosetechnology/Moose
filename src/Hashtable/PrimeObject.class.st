Class {
	#name : #PrimeObject,
	#superclass : #Object,
	#category : #'Hashtable-Objects'
}

{ #category : #comparing }
PrimeObject >> hash [
	^self identityHash * 100799
]
