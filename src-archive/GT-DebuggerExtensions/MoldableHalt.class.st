Class {
	#name : #MoldableHalt,
	#superclass : #Halt,
	#category : #'GT-DebuggerExtensions'
}

{ #category : #'priv handling' }
MoldableHalt >> defaultAction [

	^ UIManager default handleMoldableHalt: self.
]
