Class {
	#name : #RTCollectionExtensionTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Core-Tests'
}

{ #category : #tests }
RTCollectionExtensionTest >> testBasic [

	self assert: ((#(5 4 1 5 2) sortedAs: #squared) asArray =  #(1 2 4 5 5) )
]

{ #category : #tests }
RTCollectionExtensionTest >> testReverseBasic [

	self assert: ((#(5 4 1 5 2) reverseSortedAs: #squared) asArray =  #(1 2 4 5 5) reverse )
]
