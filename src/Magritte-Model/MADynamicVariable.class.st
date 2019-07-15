Class {
	#name : #MADynamicVariable,
	#superclass : #GRNotification,
	#category : #'Magritte-Model-Utility'
}

{ #category : #defaults }
MADynamicVariable class >> defaultValue [
	^ nil
]

{ #category : #private }
MADynamicVariable class >> use: anObject during: aBlock [
	"Set the dynamic value of the receiver to anObject during the evaluation of aBlock."
	
	^ aBlock on: self do: [ :notification | notification resume: anObject ]
]

{ #category : #evaluating }
MADynamicVariable class >> value [
	"Answer the dynamic value of the receiver."
	
	^ self signal
]

{ #category : #defaults }
MADynamicVariable >> defaultAction [
	^ self class defaultValue
]
