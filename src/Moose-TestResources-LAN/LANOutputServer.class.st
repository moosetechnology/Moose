Class {
	#name : #LANOutputServer,
	#superclass : #LANNode,
	#instVars : [
		'serverType'
	],
	#category : #'Moose-TestResources-LAN'
}

{ #category : #'sending-receiving' }
LANOutputServer >> accept: thePacket [ 
	"I first see if the packet is for me. If it is, I output it. Otherwise, I pass it on" 
	 
	(thePacket addressee isDestinationFor: self name) 
		ifTrue: [self output: thePacket] 
		ifFalse: [self send: thePacket]	"self name = thePacket addressee"
]

{ #category : #testing }
LANOutputServer >> canOutput [ 
	 
	^true
]

{ #category : #outputting }
LANOutputServer >> output: thePacket [ 
	"My subclasses have to use this method to define their outputting behavior" 
	 
	self subclassResponsibility
]
