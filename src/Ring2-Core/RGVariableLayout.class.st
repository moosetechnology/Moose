Class {
	#name : #RGVariableLayout,
	#superclass : #RGPointerLayout,
	#category : #'Ring2-Core-Kernel'
}

{ #category : #'testing types' }
RGVariableLayout >> isVariableLayout [

	^ true
]

{ #category : #accessing }
RGVariableLayout >> layoutName [

	^ #VariableLayout
]
