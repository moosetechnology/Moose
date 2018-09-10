Class {
	#name : #DistributionMapCollectionPropertyInfo,
	#superclass : #DistributionMapPropertyInfo,
	#category : #'Moose-DistributionMap'
}

{ #category : #accessing }
DistributionMapCollectionPropertyInfo >> firstDefaultText [ 

	^ 'propVal size <= 5'
]

{ #category : #accessing }
DistributionMapCollectionPropertyInfo >> secondDefaultText [ 

	^ 'propVal size > 5'
]

{ #category : #accessing }
DistributionMapCollectionPropertyInfo >> type [ 

	^ #collection
]
