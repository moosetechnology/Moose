"
I am special DSL class to get argument captures:

	Arg argName
	
where #argName is name of argument defined by message send.

	Arg connection 
	Arg x
"
Class {
	#name : #Arg,
	#superclass : #Object,
	#category : 'Mocketry-Domain'
}

{ #category : #'captures creation' }
Arg class >> doesNotUnderstand: aMessage [

	^MockCurrentBehaviour value argCaptureNamed: aMessage selector
]

{ #category : #testing }
Arg class >> isMetacelloConfig [
	"Metacello is full of crap. That's why if class wants implement #doesNotImplement (class side) it also should implement this method"
	^false
]
