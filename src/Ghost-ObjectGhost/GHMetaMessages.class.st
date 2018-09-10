"
All methods of my subclasses define set of meta messages of ghost. They are  implemented with idea that actual receiver is ghost instance variable and not self. 
In that perpective I am a special helper class which should not be used outside GHMetaLevel. 

I provide little infrastructure for my subclasses:
- ghostClass 
return real class of ghost 

- printGhost 
returns string representation of ghost

- extractClassFrom: anObject 
it is class side method which uses mirror primitive to extract class of given object 

-includes: aSymbol 
it is class side method which check if given symbol belongs to meta message

- metaMessagesClass
it return my real class
 
My instances are created on ghost:
	GHMetaMessages for: aGhost
	
Internal Representation and Key Implementation Points.

    Instance Variables
	ghost:		<aGhost>
"
Class {
	#name : #GHMetaMessages,
	#superclass : #Object,
	#instVars : [
		'ghost'
	],
	#category : 'Ghost-ObjectGhost'
}

{ #category : #'helpers-primitives' }
GHMetaMessages class >> executeWith: receiver andArguments: argArray method: compiledMethod [
	"Execute compiledMethod against the receiver and the arguments in argArray"
	"Please do not use this method. It is just there to make sure that we can invoke this primitive with right order of arguments"

	<primitive: 188>
	^self primitiveFailed
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> extractClassOf: anObject [

	"Primitive. Answer the object which is the receiver's class. Essential. See 
	Object documentation whatIsAPrimitive."

	<primitive: 111>
	self primitiveFailed
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> extractIdentityHashOf: anObject [
	"Answer a SmallInteger whose value is related to the receiver's identity.
	This method must not be overridden, except by SmallInteger.
	Primitive. Fails if the receiver is a SmallInteger. Essential.
	See Object documentation whatIsAPrimitive.

	Do not override. Use #identityHash unless you really know what you're doing.'"

	<primitive: 75>
	self primitiveFailed
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> extractInstVarOf: anObject at: anIndex [
	"Primitive. Answer a fixed variable in an object. The numbering of the 
	 variables corresponds to the named instance variables. Fail if the index 
	 is not an Integer or is not the index of a fixed variable. Essential for the
	 debugger. See  Object documentation whatIsAPrimitive."

	<primitive: 73>
	"Access beyond fixed variables."
	^self primitiveFailed
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> extractSizeOf: anObject [
	"Answer the number of indexable variables in the argument anObject without sending
	 it a message. This mimics the action of the VM when it fetches an object's variable size.
	 Used to simulate the execution machinery by, for example, the debugger.
	 Primitive.  See Object documentation whatIsAPrimitive."

	<primitive: 62>
	"The number of indexable fields of fixed-length objects is 0"
	^0
]

{ #category : #'instance creation' }
GHMetaMessages class >> for: aGhost [

	^self new 
		ghost: aGhost
]

{ #category : #testing }
GHMetaMessages class >> includes: aSymbol [

	| currentClass |
	currentClass := self.
	
	[currentClass == GHMetaMessages] whileFalse: [ 
		(currentClass includesSelector: aSymbol) ifTrue: [ ^true ].
		currentClass := currentClass superclass.
	 ].

	^false
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> makeShallowCopyOf: anObject [
	"Answer a copy of the receiver which shares the receiver's instance variables. It should never be overridden. I'm invoked from the copy template method. Subclasses that need to specialize the copy should specialize the postCopy hook method."
	
	<primitive: 148>
	self primitiveFailed
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> printObject: anObject [
	"Answer a String whose characters are a description of the receiver."

	| aStream |
	aStream := WriteStream on: (String new: 32).
	self printObject: anObject on: aStream.
	^aStream contents
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> printObject: anObject on: aStream [ 
	"Append to the argument aStream a sequence of characters
        that describes the receiver."

	| title |
	title := (self extractClassOf: anObject) name.
	aStream 
		nextPutAll: ((title at: 1) isVowel ifTrue: ['an '] ifFalse: ['a ']).
	aStream nextPutAll: title
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> setClass: classObject to: anObject [

	<primitive: 160>
	self primitiveFailed
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> withReceiver: anObject perform: selector withArguments: argArray [
	^self withReceiver: anObject perform: selector withArguments: argArray inClass: (self extractClassOf: anObject)
]

{ #category : #'helpers-primitives' }
GHMetaMessages class >> withReceiver: anObject perform: selector withArguments: argArray inClass: lookupClass [
	"Send the selector, aSymbol, to anObject with arguments in argArray.
	 Fail if the number of arguments expected by the selector 
	 does not match the size of argArray, or if lookupClass
	 cannot be found among the anObject's superclasses.
	 Primitive. Essential for the debugger."

	<primitive: 100 error: error>
	self primitiveFailed
]

{ #category : #'helpers-primitives' }
GHMetaMessages >> executeMetaMessage: aMessage [

	^super perform: aMessage selector withArguments: aMessage arguments
]

{ #category : #'helpers-accessing' }
GHMetaMessages >> ghost [
	^ ghost
]

{ #category : #'helpers-accessing' }
GHMetaMessages >> ghost: anObject [
	ghost := anObject
]

{ #category : #'helpers-primitives' }
GHMetaMessages >> ghostClass [

	^self metaMessagesClass extractClassOf: ghost
]

{ #category : #'helpers-primitives' }
GHMetaMessages >> ghostExecuteWithArguments: argArray method: compiledMethod [

	^self metaMessagesClass executeWith: ghost andArguments: argArray method: compiledMethod
]

{ #category : #'helpers-primitives' }
GHMetaMessages >> ghostIdentityHash [

	^self metaMessagesClass extractIdentityHashOf: ghost
]

{ #category : #'helpers-primitives' }
GHMetaMessages >> ghostInstVarAt: index [

	^self metaMessagesClass extractInstVarOf: ghost at: index
]

{ #category : #'helpers-primitives' }
GHMetaMessages >> ghostSize [

	^self metaMessagesClass extractSizeOf: ghost
]

{ #category : #'helpers-primitives' }
GHMetaMessages >> metaMessagesClass [
	^super class

]

{ #category : #copying }
GHMetaMessages >> postCopy [
	"we define this message as default implementation for ghost copy methods"
	
	^ghost
]

{ #category : #'helpers-printing' }
GHMetaMessages >> printGhost [

	^ghost ghostPrintString
]

{ #category : #'helpers-printing' }
GHMetaMessages >> printGhostClass [

	^self ghostClass name
]

{ #category : #copying }
GHMetaMessages >> shallowCopy [
	"we define this message as default implementation for ghost copy methods"
	
	^self metaMessagesClass makeShallowCopyOf: ghost
]
