Class {
	#name : #LANFileServer,
	#superclass : #LANOutputServer,
	#category : #'Moose-TestResources-LAN'
}

{ #category : #outputting }
LANFileServer >> name [ 
	"added for candidate invocations operator test" 
	 
	^super name
]

{ #category : #outputting }
LANFileServer >> output: thePacket [ 
	"My subclasses have to use this method to define their outputting behavior" 
	 
	Transcript cr. 
	Transcript 
		show: 
			'LANFileServer ' , self name printString , ' saves ' , thePacket contents
]

{ #category : #setting }
LANFileServer >> setServerType [ 
	 
	serverType := 'LANFileServer'
]
