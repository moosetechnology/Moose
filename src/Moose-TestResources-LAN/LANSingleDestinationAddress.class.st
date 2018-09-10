Class {
	#name : #LANSingleDestinationAddress,
	#superclass : #LANAbstractDestinationAddress,
	#instVars : [
		'id'
	],
	#category : #'Moose-TestResources-LAN'
}

{ #category : #comparing }
LANSingleDestinationAddress >> equalsMultiple: aSingleNodeAddress [ 
	 
	^self halt
]

{ #category : #comparing }
LANSingleDestinationAddress >> equalsSingle: aSingleNodeAddress [ 
	 
	^self id = aSingleNodeAddress id
]

{ #category : #accessing }
LANSingleDestinationAddress >> id [ 
	 
	^id
]

{ #category : #accessing }
LANSingleDestinationAddress >> id: aSymbol [ 
	 
	id := aSymbol
]

{ #category : #comparing }
LANSingleDestinationAddress >> isDestinationFor: aNodeAddress [ 
	 
	^aNodeAddress equalsSingle: self
]
