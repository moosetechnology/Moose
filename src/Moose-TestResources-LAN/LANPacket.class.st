Class {
	#name : #LANPacket,
	#superclass : #Object,
	#instVars : [
		'contents',
		'addressee',
		'originator'
	],
	#category : #'Moose-TestResources-LAN'
}

{ #category : #accessing }
LANPacket >> addressee [ 
	"return the name of the node that is the addressee for this packet" 
	 
	^addressee
]

{ #category : #accessing }
LANPacket >> addressee: anAddress [ 
	"set the name of the node that is the addressee for this packet" 
	 
	addressee := anAddress. 
	self changed: #addressee
]

{ #category : #accessing }
LANPacket >> contents [ 
	"return the contents of the receiver" 
	 
	^contents
]

{ #category : #accessing }
LANPacket >> contents: aString [ 
	"set the contents of the receiver" 
	 
	contents := aString. 
	self changed: #contents
]

{ #category : #accessing }
LANPacket >> originator [ 
	"I return the originator of the receiver" 
	 
	^originator
]

{ #category : #accessing }
LANPacket >> originator: aNode [ 
	"Set the originator of the receiver" 
	 
	originator := aNode. 
	self changed: #originator
]

{ #category : #printing }
LANPacket >> printOn: aStream [ 
	 
	super printOn: aStream. 
	self originator notNil 
		ifTrue: 
			[aStream nextPutAll: ' coming from ' , self originator name printString]. 
	aStream 
		nextPutAll: 
			' addressed to ' , self addressee printString , ' with contents: ' 
				, self contents
]
