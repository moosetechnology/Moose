Class {
	#name : #DistributionMapPropertyInfo,
	#superclass : #Object,
	#category : #'Moose-DistributionMap'
}

{ #category : #'instance creation' }
DistributionMapPropertyInfo class >> fromComputationBlock: aOneArgumentBlock andElements: aCollectionOfElements [

	| tmpPropertyResult |
	tmpPropertyResult := aOneArgumentBlock value:
		                     aCollectionOfElements anyOne.
	tmpPropertyResult isString ifTrue: [ 
		^ DistributionMapStringPropertyInfo new ].
	tmpPropertyResult isCollection ifTrue: [ 
		^ DistributionMapCollectionPropertyInfo new ].
	tmpPropertyResult isNumber ifTrue: [ 
		^ DistributionMapNumberPropertyInfo new ].
	(tmpPropertyResult isKindOf: Boolean) ifTrue: [ 
		^ DistributionMapBooleanPropertyInfo new ].
	^ DistributionMapUnknownPropertyInfo new
]

{ #category : #accessing }
DistributionMapPropertyInfo >> firstDefaultText [

	^ self subclassResponsability 
]

{ #category : #accessing }
DistributionMapPropertyInfo >> secondDefaultText [

	^ self subclassResponsibility
]

{ #category : #accessing }
DistributionMapPropertyInfo >> type [

	^ self subclassResponsability 
]
