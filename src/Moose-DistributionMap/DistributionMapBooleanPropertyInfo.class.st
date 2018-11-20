Class {
	#name : #DistributionMapBooleanPropertyInfo,
	#superclass : #DistributionMapPropertyInfo,
	#category : #'Moose-DistributionMap'
}

{ #category : #accessing }
DistributionMapBooleanPropertyInfo >> firstDefaultText [ 

	^ 'propVal = true'
]

{ #category : #accessing }
DistributionMapBooleanPropertyInfo >> secondDefaultText [ 

	^ 'propVal = false'
]

{ #category : #accessing }
DistributionMapBooleanPropertyInfo >> type [

	^ #boolean
]
