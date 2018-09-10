Class {
	#name : #RGSlot,
	#superclass : #RGElement,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #bootstrap }
RGSlot >> accept: anInterpreter assign: aValue inNode: aVariableNode [
	self error: #TBD
]

{ #category : #'managing container' }
RGSlot >> addoptToParentStub [

	super addoptToParentStub.
	self parent addSlot: self.
]

{ #category : #'managing container' }
RGSlot >> defaultParentStub [

	^ self defaultFixedLayoutStub
]

{ #category : #'testing types' }
RGSlot >> isSlot [

	^ true
]

{ #category : #testing }
RGSlot >> isSpecial [

	^ true
]

{ #category : #accessing }
RGSlot >> name: aString [

	self parent parent announceDefinitionChangeDuring: [ 
		super name: aString ].
]
