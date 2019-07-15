Class {
	#name : #DistributionMapUnknownPropertyInfo,
	#superclass : #DistributionMapPropertyInfo,
	#category : #'Moose-DistributionMap'
}

{ #category : #accessing }
DistributionMapUnknownPropertyInfo >> firstDefaultText [ 

	^ 'propVal isNil'
]

{ #category : #accessing }
DistributionMapUnknownPropertyInfo >> secondDefaultText [ 

	^ 'propVal isNil not'
]

{ #category : #accessing }
DistributionMapUnknownPropertyInfo >> type [

	^ #unknown
]
