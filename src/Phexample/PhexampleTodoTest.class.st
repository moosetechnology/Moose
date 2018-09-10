Class {
	#name : #PhexampleTodoTest,
	#superclass : #Phexample,
	#category : #'Phexample-Test'
}

{ #category : #private }
PhexampleTodoTest >> expectedFailures [
	^ (Smalltalk hasClassNamed: #TestTodo)
		ifTrue:  [ #() ]
		ifFalse: [ #(shouldSupportTodo) ]
]

{ #category : #tests }
PhexampleTodoTest >> shouldSupportTodo [
	self should do: 'a real test'.
	self should testFor: 'something'.
]
