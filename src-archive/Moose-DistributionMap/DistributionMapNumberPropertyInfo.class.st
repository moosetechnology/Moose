Class {
	#name : #DistributionMapNumberPropertyInfo,
	#superclass : #DistributionMapPropertyInfo,
	#category : #'Moose-DistributionMap'
}

{ #category : #accessing }
DistributionMapNumberPropertyInfo >> firstDefaultText [ 

	^ 'propVal  <= 5'
]

{ #category : #accessing }
DistributionMapNumberPropertyInfo >> secondDefaultText [ 

	^ 'propVal > 5'
]

{ #category : #accessing }
DistributionMapNumberPropertyInfo >> type [ 

	^ #number
]
