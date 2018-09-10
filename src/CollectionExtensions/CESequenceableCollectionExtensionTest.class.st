Class {
	#name : #CESequenceableCollectionExtensionTest,
	#superclass : #TestCase,
	#category : #CollectionExtensions
}

{ #category : #tests }
CESequenceableCollectionExtensionTest >> testPairsSimilarityWith [
	
	self assert: ('1234' pairsSimilarityWith: '2234') equals: (2/3).
	self assert: ('1234' pairsSimilarityWith: '123') equals: (4/5).
	self assert: ('1234' pairsSimilarityWith: '5678') equals: 0
]
