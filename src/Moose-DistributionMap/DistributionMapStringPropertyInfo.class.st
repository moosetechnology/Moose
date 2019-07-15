Class {
	#name : #DistributionMapStringPropertyInfo,
	#superclass : #DistributionMapPropertyInfo,
	#category : #'Moose-DistributionMap'
}

{ #category : #accessing }
DistributionMapStringPropertyInfo >> firstDefaultText [ 

	^ 'propVal size <= 5'
]

{ #category : #accessing }
DistributionMapStringPropertyInfo >> secondDefaultText [ 

	^ 'propVal size > 5'
]

{ #category : #accessing }
DistributionMapStringPropertyInfo >> type [

	^ #string
]
