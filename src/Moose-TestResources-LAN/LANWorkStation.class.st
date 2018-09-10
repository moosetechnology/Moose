Class {
	#name : #LANWorkStation,
	#superclass : #LANNode,
	#instVars : [
		'type'
	],
	#category : #'Moose-TestResources-LAN'
}

{ #category : #'sending-receiving' }
LANWorkStation >> accept: thePacket [ 
	"accept the packet and see if I am the originator. If this is the case, take the packet out because the  
	addressee is unknown. Print this on the Transcript" 
	 
	thePacket originator = self 
		ifTrue: 
			[Transcript 
				show: 'The receiver of following packet does not exist:'; 
				cr; 
				show: thePacket printString; 
				cr] 
		ifFalse: [self send: thePacket]
]

{ #category : #testing }
LANWorkStation >> canOriginate [ 
	 
	^true
]

{ #category : #outputting }
LANWorkStation >> name [ 
	"added for candidate invocations operator test" 
	 
	^super name
]

{ #category : #'sending-receiving' }
LANWorkStation >> originate: thePacket [ 
	"This is how packets get inserted into the network. This is a likely method to be rwritten to permit  
	packets to be entered in various ways. Currently, I assume that someone alse creates the packet,  
	and passes it to me as an argument." 
	 
	thePacket originator: self. 
	self send: thePacket
]
