Class {
	#name : #MooseModelTestResource,
	#superclass : #TestResource,
	#instVars : [
		'model'
	],
	#category : #'Moose-Tests-Core'
}

{ #category : #setup }
MooseModelTestResource >> importModel [ 
	 
	self subclassResponsibility
]

{ #category : #accessing }
MooseModelTestResource >> model [ 
	 
	^model
]

{ #category : #setup }
MooseModelTestResource >> setUp [ 
	 
	model := MooseModel new. 
	self importModel
]
