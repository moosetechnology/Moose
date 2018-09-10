Class {
	#name : #RGWeakLayout,
	#superclass : #RGPointerLayout,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #'testing types' }
RGWeakLayout >> isVariableLayout [

	^ true
]

{ #category : #'testing types' }
RGWeakLayout >> isWeakLayout [

	^ true
]

{ #category : #accessing }
RGWeakLayout >> layoutName [

	^ #EphemeronLayout
]
