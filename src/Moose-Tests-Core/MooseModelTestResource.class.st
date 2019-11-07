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

{ #category : #accessing }
MooseModelTestResource >> modelClass [
	^ MooseModel
]

{ #category : #running }
MooseModelTestResource >> setUp [
	model := self modelClass new.
	self importModel
]

{ #category : #running }
MooseModelTestResource >> tearDown [
	model := nil.
	super tearDown
]
