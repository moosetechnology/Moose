Class {
	#name : #REPMooseQueryConcern,
	#superclass : #REPComputedConcern,
	#category : #'Arki-Reporter-Core'
}

{ #category : #accessing }
REPMooseQueryConcern >> computeStatus [
	self result.
	^ status isNil
		ifFalse: [ status ]
		ifTrue: [ 
			self result isNil 
				ifTrue: [REPConcernNeutralStatus new concern: self]
				ifFalse: [ 
					self result isEmpty 
						ifTrue: [REPConcernSuccessStatus new concern: self ]
						ifFalse: [REPConcernFailureStatus new concern: self ] ] ]
]

{ #category : #'as yet unclassified' }
REPMooseQueryConcern >> gtDisplayOn: stream [
	stream nextPutAll: self explanation.
	self status isFailureStatus ifTrue: [ 
		stream 
			space;
			nextPutAll: self result size asString;
			nextPutAll: ' violations' ]
]

{ #category : #accessing }
REPMooseQueryConcern >> status [
	^ [ self computeStatus ] on: Error do: [:error | 
		REPConcernErrorStatus new concern: self; errorInstance: error ]
]
