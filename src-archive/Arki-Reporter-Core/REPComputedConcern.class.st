Class {
	#name : #REPComputedConcern,
	#superclass : #REPConcern,
	#instVars : [
		'result',
		'status',
		'computationTime'
	],
	#category : #'Arki-Reporter-Core'
}

{ #category : #accessing }
REPComputedConcern >> computeAndProfileResult [
	| computedResult |
	computationTime := Time millisecondsToRun: [ 
		computedResult := self computeResult ].
	^ computedResult 
]

{ #category : #accessing }
REPComputedConcern >> computeAndStoreResult [
	^ result := [ self computeAndProfileResult ]
		on: Error
		do: [ :error | 
			status := REPConcernErrorStatus new
				errorInstance: error;
				concern: self.
			nil ]
]

{ #category : #accessing }
REPComputedConcern >> computeResult [ 
	^ nil
]

{ #category : #updating }
REPComputedConcern >> doUpdate [ 
	^ self computeAndStoreResult
]

{ #category : #accessing }
REPComputedConcern >> result [
	^ result ifNil: [ self computeAndStoreResult ]
]
