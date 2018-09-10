Class {
	#name : #SequenceableCollectionComparator,
	#superclass : #Object,
	#category : #'Phexample-ShouldPlugins'
}

{ #category : #'as yet unclassified' }
SequenceableCollectionComparator >> is: collection1 equal: collection2 [ 
	collection1 with: collection2 do: [:e1 :e2 | e1 = e2 ifFalse: [^false]].
	^true
]
