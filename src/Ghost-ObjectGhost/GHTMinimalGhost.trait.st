"
I am trait for most minical ghost implementations.
I define == and ~~ for information. These methods are special and actually never send to objects.

I define method #yourself because it is not make sense to push it to meta level. And in that case  GHEmptyMetaMessages will not be really empty. 

Method #isGhost is convinient method to easy check if object is ghost. It is implemented in ProtoObject too
"
Trait {
	#name : #GHTMinimalGhost,
	#category : 'Ghost-ObjectGhost'
}

{ #category : #comparing }
GHTMinimalGhost >> == anObject [ 
	"Primitive. Answer whether the receiver and the argument are the same 
	object (have the same object pointer). Do not redefine the message == in 
	any other class! Essential. No Lookup. Do not override in any subclass. 
	See Object documentation whatIsAPrimitive."

	<primitive: 110>
	self primitiveFailed
]

{ #category : #'set implementation' }
GHTMinimalGhost >> asSetElement [
]

{ #category : #'set implementation' }
GHTMinimalGhost >> enclosedSetElement [
]

{ #category : #accessing }
GHTMinimalGhost >> ghostClass [
	^GHMetaMessages extractClassOf: self
]

{ #category : #comparing }
GHTMinimalGhost >> ghostIdentityHash [
	^GHMetaMessages extractIdentityHashOf: self
]

{ #category : #printing }
GHTMinimalGhost >> ghostPrintString [

	^GHMetaMessages printObject: self
]

{ #category : #testing }
GHTMinimalGhost >> isGhost [
	^true
]

{ #category : #'message performing' }
GHTMinimalGhost >> perform: aSymbol [ 
	"Send the unary selector, aSymbol, to the receiver.
	Fail if the number of arguments expected by the selector is not zero.
	Primitive. Optional. See Object documentation whatIsAPrimitive."
	
	<reflective: #object:performMessageWith:>
	<primitive: 83>
	^ self perform: aSymbol withArguments: (Array new: 0)
]

{ #category : #'message performing' }
GHTMinimalGhost >> perform: selector orSendTo: otherTarget [
	"If I wish to intercept and handle selector myself, do it; else send it to otherTarget"
	^ (self respondsTo: selector) ifTrue: [self perform: selector] ifFalse: [otherTarget perform: selector]
]

{ #category : #'message performing' }
GHTMinimalGhost >> perform: aSymbol with: anObject [ 
	"Send the selector, aSymbol, to the receiver with anObject as its argument.
	Fail if the number of arguments expected by the selector is not one.
	Primitive. Optional. See Object documentation whatIsAPrimitive."
	
	<reflective: #object:performMessageWith:>
	<primitive: 83>
	^ self perform: aSymbol withArguments: (Array with: anObject)
]

{ #category : #'message performing' }
GHTMinimalGhost >> perform: aSymbol with: firstObject with: secondObject [ 
	"Send the selector, aSymbol, to the receiver with the given arguments.
	Fail if the number of arguments expected by the selector is not two.
	Primitive. Optional. See Object documentation whatIsAPrimitive."

	<reflective: #object:performMessageWith:>
	<primitive: 83>
	^ self perform: aSymbol withArguments: (Array with: firstObject with: secondObject)
]

{ #category : #'message performing' }
GHTMinimalGhost >> perform: aSymbol with: firstObject with: secondObject with: thirdObject [ 
	"Send the selector, aSymbol, to the receiver with the given arguments.
	Fail if the number of arguments expected by the selector is not three.
	Primitive. Optional. See Object documentation whatIsAPrimitive."
	
	<reflective: #object:performMessageWith:>
	<primitive: 83>
	^ self perform: aSymbol
		withArguments: {firstObject . secondObject . thirdObject}
]

{ #category : #'message performing' }
GHTMinimalGhost >> perform: selector withArguments: argArray [ 
	
	^self ghostBehaviour intercept: (Message selector: selector arguments: argArray) to: self
]

{ #category : #'message performing' }
GHTMinimalGhost >> perform: selector withEnoughArguments: anArray [
	"Send the selector, aSymbol, to the receiver with arguments in argArray.
	Only use enough arguments for the arity of the selector; supply nils for missing ones."
	| numArgs args |
	numArgs := selector numArgs.
	anArray size == numArgs
		ifTrue: [ ^self perform: selector withArguments: anArray asArray ].

	args := Array new: numArgs.
	args replaceFrom: 1
		to: (anArray size min: args size)
		with: anArray
		startingAt: 1.

	^ self perform: selector withArguments: args
]

{ #category : #'apply primitives' }
GHTMinimalGhost >> tryPrimitive: primIndex withArgs: argumentArray [
	"This method is a template that the Smalltalk simulator uses to 
	execute primitives. See Object documentation whatIsAPrimitive."

	<primitive: 118 error: code >
	^ Context primitiveFailTokenFor: code
]

{ #category : #accessing }
GHTMinimalGhost >> yourself [
]

{ #category : #comparing }
GHTMinimalGhost >> ~~ anObject [
	"Answer whether the receiver and the argument are different objects
	(do not have the same object pointer)."

	"This seemingly redundant implementation is for performance (and possibly other) reasons. See http://forum.world.st/About-and-td3898409.html for more details"
	self == anObject
		ifTrue: [^ false]
		ifFalse: [^ true]
]
