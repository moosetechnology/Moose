Class {
	#name : #LANNode,
	#superclass : #Model,
	#instVars : [
		'name',
		'nextNode'
	],
	#pools : [
		'LANPool'
	],
	#category : #'Moose-TestResources-LAN'
}

{ #category : #'instance creation' }
LANNode class >> new [ 
	 
	^super new initialize
]

{ #category : #'sending-receiving' }
LANNode >> accept: thePacket [ 
	"Having received the packet, send it on. This is the default behavior." 
	"My subclasses will probably override this method to do something special" 
	 
	self send: thePacket
]

{ #category : #accessing }
LANNode >> accessPoolVariable [

	^ LANEditor
]

{ #category : #testing }
LANNode >> canOriginate [ 
	 
	^false
]

{ #category : #testing }
LANNode >> canOutput [ 
	 
	^false
]

{ #category : #'initialize-release' }
LANNode >> initialize [ 
	"This is the default initialize method that is always called when new instances are created. My  
	subclasses will likely override this method to be initialized." 
	"I just set my name to unnamed" 
	 
	self name: #Unnamed
]

{ #category : #'moose testing' }
LANNode >> methodWithEmptyBody [ 
	"this method is necessary for Moose tests" 
	 
	
]

{ #category : #accessing }
LANNode >> name [ 
	"returns the name of the node" 
	 
	^name
]

{ #category : #accessing }
LANNode >> name: aSymbol [ 
	"sets the name of the node (a Symbol)" 
	 
	name := aSymbol. 
	self changed: #name
]

{ #category : #accessing }
LANNode >> nextNode [ 
	"return the next node of the receiver" 
	 
	^nextNode
]

{ #category : #accessing }
LANNode >> nextNode: aNode [ 
	"set the next node of the receiver to be aNode" 
	 
	nextNode := aNode. 
	self changed: #nextNode
]

{ #category : #printing }
LANNode >> printOn: aStream [
	"print a textual representation of myself on the argument, aStream"

	super printOn: aStream.
	aStream nextPutAll: ': ' , self name asString.
	self nextNode ifNotNil: [ aStream nextPutAll: ', pointing to ' , self nextNode name printString ]
]

{ #category : #'sending-receiving' }
LANNode >> send: thePacket [ 
	"Display debug information in the Transcript, then send the packet to the node which whom I  
	communicate" 
	 
	Transcript 
		show: 
				self name printString , ' sending the packet to ' 
						, self nextNode name printString; 
		cr. 
	self nextNode accept: thePacket
]
