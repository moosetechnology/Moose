Class {
	#name : #MABasicObject,
	#superclass : #GRObject,
	#category : #'Magritte-Model-Core'
}

{ #category : #'error handling' }
MABasicObject class >> defaultErrorClass [
	^ MAError
]
