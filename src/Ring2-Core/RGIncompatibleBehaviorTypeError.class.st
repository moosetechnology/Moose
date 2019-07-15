Class {
	#name : #RGIncompatibleBehaviorTypeError,
	#superclass : #Error,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #accessing }
RGIncompatibleBehaviorTypeError >> messageText [

	^ 'This message cannot be sent. Incompatible behavior type.'
]
