"
I'm a work around for bugs in the Pharo stream classes.
"
Class {
	#name : #GRWorkingWriteStream,
	#superclass : #WriteStream,
	#category : #'Grease-Pharo30-Core'
}

{ #category : #positioning }
GRWorkingWriteStream >> reset [
	self resetToStart
]
