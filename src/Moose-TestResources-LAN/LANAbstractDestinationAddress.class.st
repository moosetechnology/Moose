Class {
	#name : #LANAbstractDestinationAddress,
	#superclass : #Object,
	#category : #'Moose-TestResources-LAN'
}

{ #category : #comparing }
LANAbstractDestinationAddress >> isDestinationFor: aNodeAddress [ 
	 
	^self subclassResponsibility
]
