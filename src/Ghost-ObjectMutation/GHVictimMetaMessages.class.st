"
I am special meta messages container which is used as preferred implementation for meta messages of mutated objects.
For example if #class message is considered as meta then it should return origial class of objects instead of mutation. 
Such overriden methods can be added to me in same way like other meta messages are defined in GHMetaMessages subclasses.  Only difference that I am not used to detect that intercepted message is meta.

"
Class {
	#name : #GHVictimMetaMessages,
	#superclass : #GHMetaMessages,
	#category : 'Ghost-ObjectMutation'
}

{ #category : #helpers }
GHVictimMetaMessages class >> executeOriginalMethodOf: infectedObject for: aMessage [

	| infectedClass |
	infectedClass := self originalClassOf: infectedObject.
		
	^GHMetaMessages withReceiver: infectedObject perform: aMessage selector withArguments: aMessage arguments inClass: infectedClass
]

{ #category : #helpers }
GHVictimMetaMessages class >> mutationOf: mutatedObject [
	
	^self extractClassOf: mutatedObject
]

{ #category : #helpers }
GHVictimMetaMessages class >> originalClassOf: mutatedObject [

	| mutation |
	mutation := self mutationOf: mutatedObject.
	
	^mutation victimClass
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> class [
	^self metaMessagesClass originalClassOf: ghost
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> ghMutation [
	^self metaMessagesClass mutationOf: ghost
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> ghostClass [
	^self class
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> hasGHMutation [

	^true
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> perform: aSymbol [

	^self perform: aSymbol withArguments: #()
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> perform: aSymbol with: anObject [

	^self perform: aSymbol withArguments: {anObject}
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> perform: aSymbol with: firstObject with: secondObject [

	^self perform: aSymbol withArguments: {firstObject. secondObject}
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> perform: aSymbol with: firstObject with: secondObject with: thirdObject [

	^self perform: aSymbol withArguments: {firstObject. secondObject. thirdObject}
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> perform: aSymbol withArguments: arguments [

	^GHCurrentMetaLevelDepth decreaseFor: [ 	
		GHMetaMessages 
			withReceiver: ghost 
			perform: aSymbol 
			withArguments: arguments] 
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> perform: selector withEnoughArguments: anArray [

	^super perform: selector withEnoughArguments: anArray
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> recoverFromGHMutation [

	self ghMutation heal: ghost.
	^ghost
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> retriveClassForStateSpecs [
	^self class
]

{ #category : #'meta messages' }
GHVictimMetaMessages >> withArgs: argArray executeMethod: compiledMethod [
	
	^GHCurrentMetaLevelDepth decreaseFor: [ 	
		GHMetaMessages executeWith: ghost andArguments: argArray method: compiledMethod]
]
