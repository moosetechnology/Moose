Class {
	#name : #ExtractedTypeTest,
	#superclass : #TestCase,
	#category : #'RoelTyper-Tests-Tests'
}

{ #category : #tests }
ExtractedTypeTest >> testFlattenLinks [

	|et1 et2|
	et1 := ExtractedType new.
	et2 := ExtractedType new.
	et1 addReverseLinkedExtractedType: et2.
	et1 flattenLinks.
	et2 flattenLinks.
]
